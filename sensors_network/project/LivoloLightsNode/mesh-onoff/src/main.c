#include <sys/printk.h>
#include <settings/settings.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/mesh.h>
#include <device.h>
#include <drivers/gpio.h>


#define LOW		0
#define HIGH 	1
#define LED_PIN	25


/* Model Operation Codes */
#define BT_MESH_MODEL_OP_GEN_ONOFF_GET 				BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET 				BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK 	BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS 		BT_MESH_MODEL_OP_2(0x82, 0x04)

static void gen_onoff_get(struct bt_mesh_model*, struct bt_mesh_msg_ctx*, struct net_buf_simple*);
static void gen_onoff_set_unack(struct bt_mesh_model*, struct bt_mesh_msg_ctx*, struct net_buf_simple*);
static void gen_onoff_set(struct bt_mesh_model*, struct bt_mesh_msg_ctx*, struct net_buf_simple*);
static int output_number(bt_mesh_output_action_t, u32_t);
static void prov_complete(u16_t, u16_t);
static void prov_reset(void);


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
	.relay_retransmit = BT_MESH_TRANSMIT(2, 20),
};

static struct bt_mesh_health_srv health_srv = {};

BT_MESH_HEALTH_PUB_DEFINE(health_pub, 0);

static struct bt_mesh_model_pub gen_onoff_pub;

static const struct bt_mesh_model_op gen_onoff_op[] = {
	{ BT_MESH_MODEL_OP_GEN_ONOFF_GET, 0, gen_onoff_get },
	{ BT_MESH_MODEL_OP_GEN_ONOFF_SET, 2, gen_onoff_set },
	{ BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK, 2, gen_onoff_set_unack },
	BT_MESH_MODEL_OP_END,
};

static struct bt_mesh_model root_models[] = {
	BT_MESH_MODEL_CFG_SRV(&cfg_srv),
	BT_MESH_MODEL_HEALTH_SRV(&health_srv, &health_pub),
	BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_op, &gen_onoff_pub, NULL)
};

static struct bt_mesh_elem elements[] = {
	BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE),
};

static const struct bt_mesh_comp comp = {
	.cid = BT_COMP_ID_LF,
	.elem = elements,
	.elem_count = ARRAY_SIZE(elements),
};

static const uint8_t dev_uuid[16] = { 0xdd, 0xdd };

static const struct bt_mesh_prov prov = {
	.uuid = dev_uuid,
	.output_size = 4,
	.output_actions = BT_MESH_DISPLAY_NUMBER,
	.output_number = output_number,
	.complete = prov_complete,
	.reset = prov_reset,
};

static struct device* gpio_dev;


static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
	u32_t led_state = 0;
	NET_BUF_SIMPLE_DEFINE(msg, 2 + 1 + 4);

	gpio_pin_read(gpio_dev, LED_PIN, &led_state);

	bt_mesh_model_msg_init(&msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
	net_buf_simple_add_u8(&msg, led_state);

	if (bt_mesh_model_send(model, ctx, &msg, NULL, NULL)) {
		printk("Unable to send On Off Status response\n");
	}
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
	u32_t current_led_state = 0;
	u32_t new_led_state = 0;
	struct net_buf_simple *msg = model->pub->msg;

	printk("Got message: %d\n", *(buf->data));
	new_led_state = *(buf->data);
	gpio_pin_write(gpio_dev, LED_PIN, new_led_state);

	if (model->pub->addr != BT_MESH_ADDR_UNASSIGNED) {
		bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
		gpio_pin_read(gpio_dev, LED_PIN, &current_led_state);
		net_buf_simple_add_u8(msg, current_led_state);
		int err = bt_mesh_model_publish(model);
		if (err) {
			printk("bt_mesh_model_publish err %d\n", err);
		}
	}
}

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
	gen_onoff_set_unack(model, ctx, buf);
	gen_onoff_get(model, ctx, buf);
}

static int output_number(bt_mesh_output_action_t action, u32_t number) {
	printk("OOB Number: %u\n", number);

	return 0;
}

static void prov_complete(u16_t net_idx, u16_t addr) {

}

static void prov_reset(void) {
	bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

static void bt_ready(int err) {
	if (err) {
		printk("Bluetooth init failed (err %d)\n", err);
		return;
	}

	printk("Bluetooth initialized\n");

	err = bt_mesh_init(&prov, &comp);
	if (err) {
		printk("Initializing mesh failed (err %d)\n", err);
		return;
	}

	if (IS_ENABLED(CONFIG_SETTINGS)) {
		settings_load();
	}

	/* This will be a no-op if settings_load() loaded provisioning info */
	bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);

	printk("Mesh initialized\n");
}

void main(void) {
	int err;

	printk("Initializing...\n");

	gpio_dev = device_get_binding("GPIO_0");
	gpio_pin_configure(gpio_dev, LED_PIN, GPIO_DIR_OUT | GPIO_PUD_NORMAL);
	gpio_pin_write(gpio_dev, LED_PIN, LOW);

	/* Initialize the Bluetooth Subsystem */
	err = bt_enable(bt_ready);
	if (err) {
		printk("Bluetooth init failed (err %d)\n", err);
	}
}