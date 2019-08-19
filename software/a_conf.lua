-- file : a_conf.lua

local module = {}

module.SSID = "Casa-IoT"
module.SSID_PASS = "78aa4h657f"

module.HOSTNAME = "persianas"

module.MQTT_SERVER = "cuarto.localarea"
module.MQTT_PORT = 1883
module.MQTT_ENDPOINT = "casa/ESP"..node.chipid().."/in"
module.MQTT_ID = node.chipid()

module.PIN_R1 = 7
module.PIN_R2 = 6

return module
