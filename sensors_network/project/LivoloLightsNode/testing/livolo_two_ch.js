// ---------- GPIO PINS MAPPING -----------
const S1_LED = 18;
const S2_LED = 5;

const MTSA = 21;
const TS1 = 1;
const TS2 = 0;
const MTPM = 15;

const R1_SET = 6;
const R1_RESET = 8;

const R2_SET = 30;
const R2_RESET = 29;

const CHANNEL1 = 0;
const CHANNEL2 = 1;

const OFF = 0;
const ON = 1;

const CHANNEL_PINS_MAP = {
  0: {
    1: R1_SET,
    0: R1_RESET
  },
  1: {
    1: R2_SET,
    0: R2_RESET
  }
};

const CHANNEL_LEDS_MAP = {
  0: S1_LED,
  1: S2_LED
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
// --------------------------------------


function setLightState(channel, value) {
  digitalWrite(CHANNEL_PINS_MAP[channel][value], HIGH);
  digitalWrite(CHANNEL_LEDS_MAP[channel], !value);
  state[channel] = value;

  setTimeout(function() {
    digitalWrite(CHANNEL_PINS_MAP[channel][value], LOW);
    /*NRF.updateServices({
      0xBCDE: {
        0xABCD: {
          value : state[CHANNEL1],
          notify: true
        },
        0xABCE: {
          value : state[CHANNEL2],
          notify: true
        }
      }
    });*/
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
    0xBCDE: {
      0xABCD: {
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
      0xABCE: {
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

  setWatch(function(e) {
    lightToggle(CHANNEL2);
  }, TS2, { repeat:true, edge:"falling", debounce: 50 });
}

