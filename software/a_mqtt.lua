-- file : a_mqtt.lua
local module = {}

a_dns = require("a_dns")
a_hw = require("a_hw")

local function subscribe_topic(ENDPOINT)
    
    module.client:subscribe(ENDPOINT, 0, function(conn)
        
        print("[MQTT] Subscribed to " .. ENDPOINT)
        
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


function module.start(ID, HOST, PORT, ENDPOINT)
    
    module.client = mqtt.Client(ID, 5)
       
    module.client:on("message", actions)

    module.client:on("offline", function(c)
		
		print("[MQTT] Disconnected from "..HOST)
        module.start(ID, HOST, PORT, ENDPOINT)
        
    end)
    
    a_hw.setup()
    
    a_dns.resolve(HOST, function(IP)
    
		module.client:connect(IP, PORT, function(c)
			
			print("[MQTT] Connected to "..HOST)
			subscribe_topic(ENDPOINT)
			
		end)
		
	end)

end

return module
