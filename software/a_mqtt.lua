-- file : a_mqtt.lua
local module = {}

a_conf = require("a_conf")
a_dns = require("a_dns")
a_hw = require("a_hw")



local function subscribe_topic()
    
    module.client:subscribe(a_conf.MQTT_ENDPOINT, 0, function(conn)
        
        print("[MQTT] Subscribed to " .. a_conf.MQTT_ENDPOINT)
        
    end)
    
end

local function actions(c, t, data)

	if data ~= nil then

		print("[MQTT] Received data: "..data)
      
        if data == "reset" then
            node.restart()
        end
        
        if data == "up" then
            a_hw.up()
        end
        
        if data == "down" then
            a_hw.down()
        end
        
        if data == "stop" then
            a_hw.stop()
        end
        
	end
end

function module.stop()

    if module.client ~= nil then

        a_conf.timers.t3:unregister()

        module.client:close()

        module.client = nil

        

    end

end


function module.start()
    
    module.client = mqtt.Client(a_conf.MQTT_ID, 5)
       
    module.client:on("message", actions)

    module.client:on("offline", function(c)
		
		print("[MQTT] Disconnected from "..a_conf.MQTT_SERVER)

        print("[MQTT] Retrying in 15 seconds...")

        a_conf.timers.t3:register(15000, tmr.ALARM_SINGLE, function() 
      
            module.start()

        end)

        a_conf.timers.t3:start()
        
    end)
    
    a_hw.setup()
    
    a_dns.resolve(a_conf.MQTT_SERVER, function(IP)

        module.client:connect(IP, a_conf.MQTT_PORT, function(c)
    			
    		print("[MQTT] Connected to "..a_conf.MQTT_SERVER)
    		
    		subscribe_topic()
    			
    	    end,
    	    
    	    function(c, r)
    	        
    	        print("[MQTT] Connection failed! ("..r..")")

                print("[MQTT] Retrying in 15 seconds...")
        
                a_conf.timers.t3:register(15000, tmr.ALARM_SINGLE, function() 
              
                    module.start()
        
                end)

                a_conf.timers.t3:start()
                
            end)
		
	end)

end

return module
