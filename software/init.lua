a_conf = require("a_conf")
a_net = require("a_net")
--a_hw = require("a_hw")
--a_aux = require("a_aux")
a_mqtt = require("a_mqtt")
a_main = {}
a_main.status = {}
a_main.status.timers = {}
a_main.status.value = 0
a_main.status.timers.t1 = tmr.create()


function a_main.boot()

    -- If the boot reason is 0, is a normal startup, wait 
    -- to permit reprogramming
    
    br1,br2 = node.bootreason()
    
    if br2 == 0 then
    
		print("[BOOT] Boot delayed by 15 seconds")
    
        a_main.status.timers.t1:register(15000, tmr.ALARM_SINGLE, function() 
			
			print("[BOOT] Booting...")
			a_main.setup_network(0) 
			
		end)
		
        a_main.status.timers.t1:start()
        
    else
		
		print("[BOOT] Booting...")
        a_main.setup_network(0)
        
    end
end

function a_main.setup_network(cb_v)

	if cb_v == 0 then
	
		print("[NET] Initializing network...")

		a_net.start(a_conf.SSID, a_conf.SSID_PASS, a_main.setup_network)

	else
	
		if cb_v == 11 then
		
			-- Connection ready
		
			a_main.setup_mqtt()
			
		end
		
		if cb_v == 20 or cb_v == 30 then
		
			-- Retry in 3 seconds
			
			print("[NET] Retrying in 3 seconds...")

			a_main.status.timers.t1:register(3000, tmr.ALARM_SINGLE, function() 
			
				a_main.setup_network(0)
			
			end)
		
			a_main.status.timers.t1:start()
	
			print(cb_v)
			
		end
	
	end

end

function a_main.setup_mqtt()

    a_mqtt.start(a_conf.MQTT_ID, a_conf.MQTT_SERVER, a_conf.MQTT_PORT, a_conf.MQTT_ENDPOINT)

end

a_main.boot()

