// ---------- GPIO PINS MAPPING -----------
const S1_LED = 8;
const S2_LED = 8;

const MTSA = 28;
const TS1 = 29;
const MTPM = 30;

const R1_SET = 5;
const R1_RESET = 1;

const R2_SET = 0;
const R2_RESET = 6;

const CHANNEL1 = 0;
const CHANNEL2 = 1;

const OFF = 0;
const ON = 1;

const CHANNEL_PINS_MAP = {
  CHANNEL1: {
    ON: R1_SET,
    OFF: R1_RESET
  },
  CHANNEL2: {
    ON: R2_SET,
    OFF: R2_RESET
  }
};

const CHANNEL_LEDS_MAP = {
  CHANNEL1: S1_LED,
  CHANNEL2: S2_LED
};

const BOOT_LIGHT_OFF_DELAY_MS = 1000;
const RELAY_PULSE_WIDTH_MS = 100;

var state = [OFF, OFF];
// --------------------------------------


// ------- BLE STUFF --------------------
const DEVICE_NAME = 'Livolo';
const ADVERTISING_INTERVAL_MS = 320;
const TX_POWER_LVL_DB = 4;
const LIGHT_SERVICE_ID = 0xBCDE;
const LIGHT1_CHARACTERISTIC_ID = 0xABCD;
const LIGHT2_CHARACTERISTIC_ID = 0xABCE;
const LIGHT_CHARACTERISTICS_MAP = {
  CHANNEL1: LIGHT1_CHARACTERISTIC_ID,
  CHANNEL2: LIGHT2_CHARACTERISTIC_ID
};
// --------------------------------------


function setLightState(channel, value) {
  digitalWrite(CHANNEL_PINS_MAP[channel][value], HIGH);
  digitalWrite(CHANNEL_LEDS_MAP[channel], !value);
  state[channel] = value;
  var lightCharacteristic = LIGHT_CHARACTERISTICS_MAP[channel];
  console.log(ON);

  setTimeout(function() {
    digitalWrite(CHANNEL_PINS_MAP[channel][value], LOW);
    NRF.updateServices({
      LIGHT_SERVICE_ID : {
        lightCharacteristic : {
          value : state[channel],
          notify: true
        }
      }
    });
  }, RELAY_PULSE_WIDTH_MS);
}

function lightToggle(channel) {
  state[channel] = !state[channel];

  setLightState(channel, state[channel]);
}

function onInit() {
  setTimeout(function() {
    setLightState(CHANNEL1, OFF);
    setLightState(CHANNEL2, OFF);
  }, BOOT_LIGHT_OFF_DELAY_MS);

  NRF.setTxPower(TX_POWER_LVL_DB);

  NRF.setAdvertising({}, {
      name: DEVICE_NAME,
      interval: ADVERTISING_INTERVAL_MS
  });

  NRF.setServices({
    LIGHT_SERVICE_ID : {
      LIGHT1_CHARACTERISTIC_ID : {
        value : state[CHANNEL1], // optional
        maxLen : 1, // optional (otherwise is length of initial value)
        broadcast : false, // optional, default is false
        readable : true,   // optional, default is false
        writable : true,   // optional, default is false
        notify : true,   // optional, default is false
        indicate : false,   // optional, default is false
        description: "Channel 1",  // optional, default is null,
        security: { // optional
          read: { // optional
            encrypted: false, // optional, default is false
            mitm: false, // optional, default is false
            lesc: false, // optional, default is false
            signed: false // optional, default is false
          },
          write: { // optional
            encrypted: false, // optional, default is false
            mitm: false, // optional, default is false
            lesc: false, // optional, default is false
            signed: false // optional, default is false
          }
        },
        onWrite : function(evt) { // optional
          console.log("Got ", evt.data); // an ArrayBuffer
        }
      },
      LIGHT2_CHARACTERISTIC_ID : {
        value : state[CHANNEL2], // optional
        maxLen : 1, // optional (otherwise is length of initial value)
        broadcast : false, // optional, default is false
        readable : true,   // optional, default is false
        writable : true,   // optional, default is false
        notify : true,   // optional, default is false
        indicate : false,   // optional, default is false
        description: "Channel 2",  // optional, default is null,
        security: { // optional
          read: { // optional
            encrypted: false, // optional, default is false
            mitm: false, // optional, default is false
            lesc: false, // optional, default is false
            signed: false // optional, default is false
          },
          write: { // optional
            encrypted: false, // optional, default is false
            mitm: false, // optional, default is false
            lesc: false, // optional, default is false
            signed: false // optional, default is false
          }
        },
        onWrite : function(evt) { // optional
          console.log("Got ", evt.data); // an ArrayBuffer
        }
      }
      // more characteristics allowed
    }
    // more services allowed
  });

  setWatch(function(e) {
    lightToggle(CHANNEL1);
  }, TS1, { repeat:true, edge:"falling", debounce: 50 });
}
