const S1_LED = 8;
const MTSA = 28;
const TS1 = 29;
const MTPM = 30;
const R1_SET = 5;
const R1_RESET = 1;
const RELAY_PULSE_WIDTH_MS = 100;

const OFF = 0;
const ON = 1;
const CHANNEL1 = 0;
const CHANNEL2 = 1;
const DEVICE_NAME = 'Livolo';
const ADVERTISING_INTERVAL_MS = 320;
const TX_POWER_LVL_DB = 4;
const BOOT_LIGHT_OFF_DELAY_MS = 1000;
var state = [OFF, OFF];


function setLight1State(newState) {
  if (newState != ON && newState != OFF) {
    return;
  }

  var relay = newState == ON ? R1_SET : R1_RESET;

  digitalWrite(relay, HIGH);

  setTimeout(function() {
    state[CHANNEL1] = newState;
    digitalWrite(relay, LOW);
    digitalWrite(S1_LED, newState == ON ? LOW : HIGH);
    NRF.updateServices({
      0xBCDE: {
        0xABCD: {
          value : newState,
          notify: true
        }
      }
    });
  }, RELAY_PULSE_WIDTH_MS);
}

function l1Toggle() {
  state[CHANNEL1] = !state[CHANNEL1];

  setLight1State(state[CHANNEL1]);
}

function onInit() {
  setTimeout(function() {
    setLight1State(OFF);
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
        description: "Light 1",  // optional, default is null,
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
          setLight1State(evt.data[0]);
        }
      }
      // more characteristics allowed
    }
    // more services allowed
  });

  setWatch(function(e) {
    l1Toggle();
  }, TS1, { repeat:true, edge:"falling", debounce: 50 });
}
