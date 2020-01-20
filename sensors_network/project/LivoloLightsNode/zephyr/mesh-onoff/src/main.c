#include <bluetooth/bluetooth.h>
#include <bluetooth/conn.h>
#include <bluetooth/hci.h>
#include <bluetooth/l2cap.h>
#include <bluetooth/mesh.h>
#include <device.h>
#include <drivers/gpio.h>
#include <drivers/pwm.h>
#include <settings/settings.h>
#include <stdio.h>
#include <sys/byteorder.h>


#define LOW   0
#define HIGH  1

#define LIGHT_CHANNELS        1
#define LIGHT_CHANNEL_1_INDEX 0

// module GPIO defs
#define S1_LED_PIN 8
#define TS1_PIN 29
#define MTSA_PIN 28
#define MTPM_PIN 30
#define RELAY1_SET_PIN 0
#define RELAY1_RESET_PIN 6
#define RELAY2_SET_PIN 5
#define RELAY2_RESET_PIN 1

#define PWM_DUTY_CYCLE_PERCENT (30U)
#define PWM_FREQUENCY_HZ (100000U)
#define PWM_PERIOD_USEC (1000000U / PWM_FREQUENCY_HZ)
#define PWM_PULSE_US (PWM_PERIOD_USEC * PWM_DUTY_CYCLE_PERCENT) / 100U

#define BUTTON_DEBOUNCE_INTERVAL_MS 250
static struct device *port0;
static struct gpio_callback button_cb;
static uint8_t ch1_state;

/* Model Operation Codes */
#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);

/*
 * Server Configuration Declaration
 */

static struct bt_mesh_cfg_srv cfg_srv = {
  .relay = BT_MESH_RELAY_DISABLED,
  .beacon = BT_MESH_BEACON_ENABLED,
#if defined(CONFIG_BT_MESH_FRIEND)
  .frnd = BT_MESH_FRIEND_ENABLED,
#else
  .frnd = BT_MESH_FRIEND_NOT_SUPPORTED,
#endif
#if defined(CONFIG_BT_MESH_GATT_PROXY)
  .gatt_proxy = BT_MESH_GATT_PROXY_ENABLED,
#else
  .gatt_proxy = BT_MESH_GATT_PROXY_NOT_SUPPORTED,
#endif
  .default_ttl = 7,

  /* 3 transmissions with 20ms interval */
  .net_transmit = BT_MESH_TRANSMIT(2, 20),
  .relay_retransmit = BT_MESH_TRANSMIT(2, 20)
};

/*
 * Client Configuration Declaration
 */

static struct bt_mesh_cfg_cli cfg_cli = {};

/*
 * Health Server Declaration
 */

static struct bt_mesh_health_srv health_srv = {};

/*
 * Publication Declarations
 *
 * The publication messages are initialized to the
 * the size of the opcode + content
 *
 * For publication, the message must be in static or global as
 * it is re-transmitted several times. This occurs
 * after the function that called bt_mesh_model_publish() has
 * exited and the stack is no longer valid.
 *
 * Note that the additional 4 bytes for the AppMIC is not needed
 * because it is added to a stack variable at the time a
 * transmission occurs.
 *
 */

BT_MESH_HEALTH_PUB_DEFINE(health_pub, 0);

BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_srv, NULL, 2 + LIGHT_CHANNELS);
BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_cli, NULL, 2 + LIGHT_CHANNELS);

/*
 * Models in an element must have unique op codes.
 *
 * The mesh stack dispatches a message to the first model in an element
 * that is also bound to an app key and supports the op code in the
 * received message.
 *
 */

/*
 * OnOff Model Server Op Dispatch Table
 *
 */

static const struct bt_mesh_model_op gen_onoff_srv_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_GET, 0, gen_onoff_get },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET, LIGHT_CHANNELS, gen_onoff_set },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK, LIGHT_CHANNELS, gen_onoff_set_unack },
  BT_MESH_MODEL_OP_END
};

/*
 * OnOff Model Client Op Dispatch Table
 */

static const struct bt_mesh_model_op gen_onoff_cli_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_STATUS, 1, gen_onoff_status },
  BT_MESH_MODEL_OP_END
};

/*
 *
 * Element Model Declarations
 *
 * Element 0 Root Models
 */

static struct bt_mesh_model root_models[] = {
  BT_MESH_MODEL_CFG_SRV(&cfg_srv),
  BT_MESH_MODEL_CFG_CLI(&cfg_cli),
  BT_MESH_MODEL_HEALTH_SRV(&health_srv, &health_pub),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_srv_op, &gen_onoff_pub_srv, NULL),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_CLI, gen_onoff_cli_op, &gen_onoff_pub_cli, NULL)
};

/*
 * Button to Client Model Assignments
 */

struct bt_mesh_model *mod_cli_sw[] = {
  &root_models[4]
};

/*
 * Root Element Declarations
 */

static struct bt_mesh_elem elements[] = {
  BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE)
};

static const struct bt_mesh_comp comp = {
  .cid = BT_COMP_ID_LF,
  .elem = elements,
  .elem_count = ARRAY_SIZE(elements)
};

static uint16_t primary_addr;
static uint16_t primary_net_idx;

/*
 * Generic OnOff Model Server Message Handlers
 *
 * Mesh Model Specification 3.1.1
 *
 */

static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  NET_BUF_SIMPLE_DEFINE(msg, 2 + LIGHT_CHANNELS + 4);

  bt_mesh_model_msg_init(&msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  net_buf_simple_add_u8(&msg, ch1_state);

  if (bt_mesh_model_send(model, ctx, &msg, NULL, NULL)) {

  }
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  struct net_buf_simple *msg = model->pub->msg;

  ch1_state = net_buf_simple_pull_u8(buf);
  gpio_pin_write(port0, S1_LED_PIN, !ch1_state);

  if (model->pub->addr != BT_MESH_ADDR_UNASSIGNED) {
    bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
    net_buf_simple_add_u8(msg, ch1_state);
    int err = bt_mesh_model_publish(model);
    if (err) {

    }
  }
}

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  printk("gen_onoff_set\n");

  gen_onoff_set_unack(model, ctx, buf);
  gen_onoff_get(model, ctx, buf);
}

static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {

}

static void prov_complete(u16_t net_idx, u16_t addr) {
  primary_addr = addr;
  primary_net_idx = net_idx;
}

static void prov_reset(void) {
  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

static uint8_t dev_uuid[16] = {0xdd, 0xdd};

/* Disable OOB security */

static const struct bt_mesh_prov prov = {
  .uuid = dev_uuid,
  .output_size = 0,
  .output_actions = 0,
  .output_number = 0,
  .complete = prov_complete,
  .reset = prov_reset
};

/*
 * Bluetooth Ready Callback
 */

static void bt_ready(int err) {
  struct bt_le_oob oob;

  if (err) {
    return;
  }

  err = bt_mesh_init(&prov, &comp);
  if (err) {;
    return;
  }

  if (IS_ENABLED(CONFIG_SETTINGS)) {
    settings_load();
  }

  /* Use identity address as device UUID */
  if (bt_le_oob_get_local(BT_ID_DEFAULT, &oob)) {

  } else {
    memcpy(dev_uuid, oob.addr.a.val, 6);
  }

  bt_mesh_prov_enable(BT_MESH_PROV_GATT | BT_MESH_PROV_ADV);
}

void mesh_publish_state(uint8_t new_state) {
  struct bt_mesh_model *mod_cli = mod_cli_sw[LIGHT_CHANNEL_1_INDEX];
  struct bt_mesh_model_pub *pub_cli = mod_cli->pub;

  if (pub_cli->addr == BT_MESH_ADDR_UNASSIGNED) {
    return;
  }

  bt_mesh_model_msg_init(pub_cli->msg, BT_MESH_MODEL_OP_GEN_ONOFF_SET);
  net_buf_simple_add_u8(pub_cli->msg, new_state);

  int err = bt_mesh_model_publish(mod_cli);
  if (err) {
    printk("bt_mesh_model_publish err %d\n", err);
  }
}

static void button_pressed(struct device *dev, struct gpio_callback *cb, u32_t pin_pos) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((k_uptime_get_32() - last_press_timestamp) >= BUTTON_DEBOUNCE_INTERVAL_MS) {
    // process TS1
    if (pin_pos == BIT(TS1_PIN)) {
      ch1_state = !ch1_state;
      gpio_pin_write(port0, S1_LED_PIN, !ch1_state);
      mesh_publish_state(ch1_state);
    }

    last_press_timestamp = k_uptime_get_32();
  }
}

void init_gpio(void) {
  port0 = device_get_binding("GPIO_0");
  // LEDs
  gpio_pin_configure(port0, S1_LED_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, S1_LED_PIN, HIGH);

  // Touch sensor power mode
  gpio_pin_configure(port0, MTPM_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, MTPM_PIN, HIGH);

  // Touch sensor sensitivity
  struct device *pwm0_dev = device_get_binding("PWM_0");
  pwm_pin_set_usec(pwm0_dev, MTSA_PIN, PWM_PERIOD_USEC, PWM_PULSE_US);

  // Touch sensor reading
  gpio_pin_configure(port0, TS1_PIN, (GPIO_DIR_IN | GPIO_INT | GPIO_INT_EDGE | GPIO_INT_ACTIVE_LOW | GPIO_PUD_PULL_UP));
  gpio_init_callback(&button_cb, button_pressed, BIT(TS1_PIN));
  gpio_add_callback(port0, &button_cb);
  gpio_pin_enable_callback(port0, TS1_PIN);
}

void main(void) {
  // gpios
  init_gpio();

  /* Initialize the Bluetooth Subsystem */
  int err;
  err = bt_enable(bt_ready);
  if (err) {

  }
}
