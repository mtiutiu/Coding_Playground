#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>

// -------------------------------- CHANGE THIS SECTION ACCORDINGLY ----------------------------
#define BOARD_XTAL_FREQUENCY 8000000UL  // pro mini board xtal frequency
#define FAST_ADC
#define HAS_FIXED_VOLTAGE_REGULATOR
#define USE_ANALOG_INTERNAL_VREF
#define USE_VBATT_RESISTOR_DIVIDER
//#define INSPECT_SYSTEM_CLOCK            // this needs CLKOUT fuse to be set
//#define MOCK_SENSOR_DATA
#define HAS_NODE_ID_SET_SWITCH
//#define NODE_ACTIVITY_LED_SIGNAL
//#define WANT_SMART_SLEEP      // this is consuming too much power for now so it's disabled
// -------------------------------------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RF69_868MHZ

#ifdef HAS_NODE_ID_SET_SWITCH
#define MY_NODE_ID 1  // this needs to be set explicitly
#else
#define MY_NODE_ID AUTO
#endif
#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_DISABLED_SERIAL

#ifdef NODE_ACTIVITY_LED_SIGNAL
#define NODE_ACTIVITY_LED_PIN 1
#endif

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

#include <MySensors.h>
// --------------------------------------------------------------------------------------------------------------

// ---------------------------- EXTERNAL PORTS/PLUGS -----------------------------------------
const uint8_t P2_PLUG_PINS[] = {A4, A5}; // I2C interface
const uint8_t P3_PLUG_PINS[] = {A3};
const uint8_t P4_PLUG_PINS[] = {A0, A1, 0};
const uint8_t OTHER_UNUSED_PINS[] = {A6, A7, 1};
// -------------------------------------------------------------------------------------------

// ---------------------------------------- DYNAMIC NODE CONFIGURATION-------------------------
#ifdef HAS_NODE_ID_SET_SWITCH
/*
| C0 | C1 | C2 | C3 | C4 | C5 | C6 |
|  3 |  4 | 5  |  6 |  7 |  8 |  9 |
*/

const uint8_t NODE_ID_SWITCH_PINS[] = {3, 4, 5, 6, 7, 8, 9};
#endif

const uint32_t KNOCK_MSG_WAIT_INTERVAL_MS = 3000;
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------- CPU FREQUECNY SCALING SECTION-------------------------
#if F_CPU == 8000000UL
#define WANT_8MHZ_SYSCLK
#elif F_CPU == 4000000UL
#define WANT_4MHZ_SYSCLK
#elif F_CPU == 2000000UL
#define WANT_2MHZ_SYSCLK
#elif F_CPU == 1000000UL
#define WANT_1MHZ_SYSCLK
#endif
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------- CPU CLOCK EXTERNAL INSPECTION -------------------------
#ifdef INSPECT_SYSTEM_CLOCK
// system clock value can be seen on this pin using a digital probe
const uint8_t SYS_CLKOUT_PIN = 8;
#endif
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------------- MCU ADC SECTION --------------------------------------
const uint16_t ADC_MAX_SCALE = 1023;

#ifdef USE_ANALOG_INTERNAL_VREF
const float ANALOG_REF_V = 1.1;
#else
const float ANALOG_REF_V = 3.0;
#endif
// -------------------------------------------------------------------------------------------------------------

// ---------------------------------------- VOLTAGE REGULATOR SECTION -----------------------------
#ifdef HAS_FIXED_VOLTAGE_REGULATOR
// we need to read the battery direclty
const uint8_t BATTERY_STATE_ANALOG_READ_PIN = A2;
#else
// here we read the battery level using the MCU internal voltage reference
#include <Vcc.h>

// this must be computed for every board for better precision
// the ratio is given by measuring voltage with a voltmeter
//  and dividing that with the value reported by the Vcc library
const float VCC_CORRECTION = 1.0;
Vcc vcc(VCC_CORRECTION);
#endif
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------- TEMP/HUM SENSOR SECTION -------------------------------------
#ifndef MOCK_SENSOR_DATA
#include <Wire.h>
#include <Si7021.h>

SI7021 tempHumSensor;
#endif

const uint32_t SENSOR_SLEEP_INTERVAL_MS = 20000;

//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t SENSOR_DATA_REPORT_INTERVAL_MS = 40000;  // 40s interval

const uint8_t NODE_SENSORS_COUNT = 2;
const uint8_t TEMPERATURE_SENSOR_ID = 1;
const uint8_t HUMIDITY_SENSOR_ID = 2;
const uint8_t SENSOR_DATA_SEND_RETRIES = 5;
const uint32_t SENSOR_DATA_SEND_RETRIES_INTERVAL_MS = 20;
const uint32_t SENSOR_DATA_REPORT_CYCLES =
    SENSOR_DATA_REPORT_INTERVAL_MS / SENSOR_SLEEP_INTERVAL_MS;
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 40000;  // 40s interval
const uint32_t HEARTBEAT_SEND_CYCLES =
    HEARTBEAT_SEND_INTERVAL_MS / SENSOR_SLEEP_INTERVAL_MS;
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------------ BATTERY STATUS SECTION ---------------------------------
#ifdef USE_VBATT_RESISTOR_DIVIDER
const uint32_t DIVIDER_OUTPUT_RESISTOR_VALUE_KOHM = 470UL;
const uint32_t DIVIDER_INPUT_RESISTOR_VALUE_KOHM = 1000UL;
const uint32_t RESISTOR_DIVIDER_RATIO = DIVIDER_OUTPUT_RESISTOR_VALUE_KOHM /
    (float)(DIVIDER_OUTPUT_RESISTOR_VALUE_KOHM + DIVIDER_INPUT_RESISTOR_VALUE_KOHM);
#endif
const float CHARGED_VBATT_THRESHOLD_V = 3.0;
const float LOW_VBATT_THRESHOLD_V = 1.1;
const uint8_t VBATT_THRESHOLD_SAMPLES = 10;

// battery level report interval
//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t BATTERY_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)
const uint32_t BATTERY_LVL_REPORT_CYCLES =
    BATTERY_LVL_REPORT_INTERVAL_MS / SENSOR_SLEEP_INTERVAL_MS;
// -------------------------------------------------------------------------------------------------------------

// --------------------------------- EEPROM CUSTOM CONFIG DATA SECTION ----------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
// we add 1 for storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown:Unknown"
// -------------------------------------------------------------------------------------------------------------

void optimize_port_pins_low_power(const uint8_t* port, uint8_t len) {
    for (uint8_t i = 0; i < len; i++) {
        pinMode(port[i], OUTPUT);
        digitalWrite(port[i], LOW);
    }
}

uint8_t getBatteryLvlPcnt(uint8_t analogReadPin, uint8_t samples) {
    float batteryLvlPcnt = 0;

#ifdef HAS_FIXED_VOLTAGE_REGULATOR
    float vBattAnalogRead = 0;

    for (uint8_t i = 0; i < samples; i++) {
        vBattAnalogRead += analogRead(analogReadPin) / (float)samples;
    }

#ifdef USE_VBATT_RESISTOR_DIVIDER
    vBattAnalogRead = ((vBattAnalogRead * ANALOG_REF_V) / ADC_MAX_SCALE) /
        RESISTOR_DIVIDER_RATIO;
#else
    vBattAnalogRead = (vBattAnalogRead * ANALOG_REF_V) / ADC_MAX_SCALE;
#endif

    batteryLvlPcnt = 100.0 * (vBattAnalogRead - LOW_VBATT_THRESHOLD_V) /
                     (CHARGED_VBATT_THRESHOLD_V - LOW_VBATT_THRESHOLD_V);
#else
    batteryLvlPcnt =
            vcc.Read_Perc(LOW_VBATT_THRESHOLD_V, CHARGED_VBATT_THRESHOLD_V);
#endif

    return round(constrain(batteryLvlPcnt, 0.0, 100.0));
}

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
    return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char *metadata, char **nodeInfo, uint8_t maxFields) {
    if (!metadata || !nodeInfo) {
        return;
    }

    for (uint8_t i = 0; i < maxFields; i++) {
        if (i == 0) {
            strncpy(nodeInfo[i], strtok(metadata, ":"), MAX_NODE_METADATA_LENGTH);
            continue;
        }
        strncpy(nodeInfo[i], strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
    }
}

void loadNodeDefaultMetadata(char **nodeInfo, uint8_t maxFields) {
    char metadata[MAX_NODE_METADATA_LENGTH];
    memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy_P(metadata, PSTR(DEFAULT_NODE_METADATA), MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(metadata, nodeInfo, maxFields);
}

void loadNodeEepromRawMetadata(char *destBuffer, uint8_t len) {
    memset(destBuffer, '\0', len);
    for (uint16_t i = 0; i < len; i++) {
        destBuffer[i] = EEPROM.read(EEPROM_CUSTOM_METADATA_INDEX + i);
    }
}

void loadNodeEepromMetadataFields(char **nodeInfo, uint8_t maxFields) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                              EEPROM_FIRST_WRITE_MARK) ||
        !nodeInfo) {
        loadNodeDefaultMetadata(nodeInfo, maxFields);
        return;
    }

    char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
    loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(rawNodeMetadata, nodeInfo, maxFields);
}

void saveNodeEepromMetadata(const char *metadata) {
    if (metadata) {
        if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                                  EEPROM_FIRST_WRITE_MARK)) {
            EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
        }

        for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
            EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
        }
    }
}

void presentNodeMetadata() {
    char nodeName[MAX_NODE_METADATA_LENGTH];
    char temperatureSensorName[MAX_NODE_METADATA_LENGTH];
    char humiditySensorName[MAX_NODE_METADATA_LENGTH];
    memset(nodeName, '\0', MAX_NODE_METADATA_LENGTH);
    memset(temperatureSensorName, '\0', MAX_NODE_METADATA_LENGTH);
    memset(humiditySensorName, '\0', MAX_NODE_METADATA_LENGTH);

    char *nodeInfo[] = {
        nodeName,     // node friendly name
        temperatureSensorName, // temperature sensor friendly name
        humiditySensorName // humidity sensor friendly name
    };

    // load node metadata based on attached sensors count + the node name
    loadNodeEepromMetadataFields(nodeInfo, (NODE_SENSORS_COUNT + 1));

    sendSketchInfo(nodeName, MY_SENSOR_NODE_SKETCH_VERSION);
    present(TEMPERATURE_SENSOR_ID, S_TEMP, temperatureSensorName);
    present(HUMIDITY_SENSOR_ID, S_HUM, humiditySensorName);
}

#ifdef HAS_NODE_ID_SET_SWITCH
uint8_t readNodeIdSwitch() {
    uint8_t nodeId = 0;

    for (uint8_t i = 0; i < sizeof(NODE_ID_SWITCH_PINS); i++) {
        pinMode(NODE_ID_SWITCH_PINS[i], INPUT_PULLUP);
        nodeId |= !digitalRead(NODE_ID_SWITCH_PINS[i]) << i;
    }

    // after reading the switch revert the pins to output and set them low for power savings
    optimize_port_pins_low_power(NODE_ID_SWITCH_PINS, sizeof(NODE_ID_SWITCH_PINS));

    return nodeId;
}
#endif

void sendSensorData(uint8_t sensorId, float sensorData, uint8_t dataType) {
    MyMessage sensorDataMsg(sensorId, dataType);

#ifdef NODE_ACTIVITY_LED_SIGNAL
    digitalWrite(NODE_ACTIVITY_LED_PIN, HIGH);
#endif

    for (uint8_t retries = 0; !send(sensorDataMsg.set(sensorData, 1), false) &&
         (retries < SENSOR_DATA_SEND_RETRIES);
         ++retries) {
        // random sleep interval between retries for collisions
        sleep(random(SENSOR_DATA_SEND_RETRIES_INTERVAL_MS) + 1);
    }

#ifdef NODE_ACTIVITY_LED_SIGNAL
    digitalWrite(NODE_ACTIVITY_LED_PIN, LOW);
#endif
}

void sendKnockSyncMsg() {
    MyMessage knockMsg(TEMPERATURE_SENSOR_ID, V_VAR1);

    send(knockMsg.set("knock"), false);
    wait(KNOCK_MSG_WAIT_INTERVAL_MS);
}

// called by mysensors to set node id internally
// this is useful to set node id at runtime and
//  not at compile time with MY_NODE_ID preprocesor define
// needs mysensors core patched
uint8_t setNodeId() {
#ifdef HAS_NODE_ID_SET_SWITCH
  return readNodeIdSwitch();
#endif
}

// called before mysensors transport init
void before() {
}

void setup() {
// compute the sysclk divider based on the board xtal frequency
#if defined(WANT_8MHZ_SYSCLK)
#if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_1);
#elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_2);
#else
#error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
#endif
#elif defined(WANT_4MHZ_SYSCLK)
#if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_2);
#elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_4);
#else
#error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
#endif
#elif defined(WANT_2MHZ_SYSCLK)
#if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_4);
#elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_8);
#else
#error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
#endif
#elif defined(WANT_1MHZ_SYSCLK)
#if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_8);
#elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_16);
#else
#error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
#endif
#endif

#ifdef INSPECT_SYSTEM_CLOCK
    pinMode(SYS_CLKOUT_PIN, OUTPUT);
#endif

#ifdef FAST_ADC
#if F_CPU == 1000000UL
    // ADC clock divided by 2 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
#elif F_CPU == 2000000UL
    // ADC clock divided by 4 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitSet(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
#elif F_CPU == 4000000UL
    // ADC clock divided by 8 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitSet(ADCSRA, ADPS1);
    bitSet(ADCSRA, ADPS0);
#elif F_CPU == 8000000UL
    // ADC clock divided by 16 - 500KHz
    bitSet(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
#elif F_CPU == 16000000UL
    // ADC clock divided by 32 - 500KHz
    bitSet(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitSet(ADCSRA, ADPS0);
#else
#error "Don't know how to handle this F_CPU!"
#endif
#endif

#ifdef USE_ANALOG_INTERNAL_VREF
    analogReference(INTERNAL);
#endif

#ifndef MOCK_SENSOR_DATA
    tempHumSensor.begin();
    tempHumSensor.setHumidityRes(12); // Humidity = 12-bit / Temperature = 14-bit
#endif

#ifdef NODE_ACTIVITY_LED_SIGNAL
    pinMode(NODE_ACTIVITY_LED_PIN, OUTPUT);
#endif

    // for even more power savings tie unused pins to ground
    optimize_port_pins_low_power(P3_PLUG_PINS, sizeof(P3_PLUG_PINS));
    optimize_port_pins_low_power(P4_PLUG_PINS, sizeof(P4_PLUG_PINS));
    optimize_port_pins_low_power(OTHER_UNUSED_PINS, sizeof(OTHER_UNUSED_PINS));
}

// called automatically by mysensors core for doing node presentation
void presentation() {
    presentNodeMetadata();
}

// // called automatically by mysensors core for incomming messages
void receive(const MyMessage &message) {
    switch (message.type) {
        case V_VAR1:
            char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
            loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

            // save new node metadata only when they differ
            if (strncmp(message.getString(), rawNodeMetadata,
                        MAX_NODE_METADATA_LENGTH) != 0) {
                char recvMetadata[MAX_NODE_METADATA_LENGTH];
                memset(recvMetadata, '\0', MAX_NODE_METADATA_LENGTH);
                strncpy(recvMetadata, message.getString(), MAX_NODE_METADATA_LENGTH);
                saveNodeEepromMetadata(recvMetadata);
            }
            presentNodeMetadata();
            break;
        default:;
    }
}

void loop() {
    static bool firstInit = false;
    if(!firstInit) {
        sendKnockSyncMsg();
        firstInit = true;
    }

    static uint32_t sensorDataReportCyclesCounter = 0;
    if (sensorDataReportCyclesCounter++ >= SENSOR_DATA_REPORT_CYCLES) {
        static float lastTemperature;
        static float lastHumidity;

        #ifdef MOCK_SENSOR_DATA
            float currentTemperature = random(20.0, 40.0);
            float currentHumidity = random(20.0, 40.0);
        #else
            float currentTemperature = tempHumSensor.readTemp();
            float currentHumidity = tempHumSensor.readHumidity();
        #endif

        // comparing floats -
        //  we round them to the first decimal and then cast them to int to discard the fractional part
        if ((uint32_t)(currentTemperature * 10) != (uint32_t)(lastTemperature * 10)) {
            sendSensorData(TEMPERATURE_SENSOR_ID, currentTemperature, V_TEMP);
            lastTemperature = currentTemperature;
        }

        // comparing floats -
        //  we round them to the first decimal and then cast them to int to discard the fractional part
        if ((uint32_t)(currentHumidity * 10) != (uint32_t)(lastHumidity * 10)) {
            sendSensorData(HUMIDITY_SENSOR_ID, currentHumidity, V_HUM);
            lastHumidity = currentHumidity;
        }
        sensorDataReportCyclesCounter = 0;
    }

    // send battery state after BATTERY_LVL_REPORT_INTERVAL_MS interval elapsed
    //  BATTERY_LVL_REPORT_CYCLES reflects that because it counts
    //  SENSOR_SLEEP_INTERVAL_MS cycles
    static uint32_t batteryLvlReportCyclesCounter = 0;
    if (batteryLvlReportCyclesCounter++ >= BATTERY_LVL_REPORT_CYCLES) {
        sendBatteryLevel(getBatteryLvlPcnt(BATTERY_STATE_ANALOG_READ_PIN, VBATT_THRESHOLD_SAMPLES));
        batteryLvlReportCyclesCounter = 0;
    }

    // send heartbeat on a regular interval too
    static uint32_t heartbeatCounter = 0;
    if (heartbeatCounter++ >= HEARTBEAT_SEND_CYCLES) {
        sendHeartbeat();
        heartbeatCounter = 0;
    }

#ifdef WANT_SMART_SLEEP
    smartSleep(SENSOR_SLEEP_INTERVAL_MS);
#else
    sleep(SENSOR_SLEEP_INTERVAL_MS);
#endif
}
