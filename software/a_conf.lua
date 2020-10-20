-- file : a_conf.lua

local module = {}

module.SSID = "Casa-IoT"
module.SSID_PASS = "78aa4h657f"

module.HOSTNAME = "persianas"

module.MQTT_SERVER = "cuarto.localarea"
module.MQTT_SERVER_IP = "0.0.0.0"
module.MQTT_PORT = 1883
module.MQTT_ENDPOINT = "casa/ESP"..node.chipid().."/in"
module.MQTT_ID = module.HOSTNAME.."-"..node.chipid()

module.PIN_R1 = 7
module.PIN_R2 = 6

module.timers = {}

module.timers.t1 = tmr.create() -- Boot and reset
module.timers.t2 = tmr.create() -- Network
module.timers.t3 = tmr.create() -- MQTT
module.timers.t4 = tmr.create() -- Hardware

return module
