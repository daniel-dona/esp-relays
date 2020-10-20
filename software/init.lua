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
    
    br1,br2,a,b,c,d,e,f = node.bootreason()
    if f~= nil then
        print("[BOOT] Booting..."..a.." "..b.." "..c.." "..d.." "..e.." "..f)

    end
    
    if br2 == 4 then
    
        print("[BOOT] Boot delayed by 15 seconds")
    
        a_conf.timers.t1:register(15000, tmr.ALARM_SINGLE, function() 
            
            print("[BOOT] Booting..."..br1.."/"..br2)
            a_main.setup_network(0) 
            
        end)
        
        a_conf.timers.t1:start()
        
    else
        
        print("[BOOT] Booting..."..br1.."/"..br2)
        
        a_hw.setup()
        a_hw.restore_saved()
        
        a_main.setup_network(0)
        
    end
end

function a_main.setup_network(cb_v)

	if cb_v == 0 then
	
		print("[NET] Initializing network...")

		a_net.start(a_main.setup_network)

	else
	
		if cb_v == 11 then
		
			-- Connection ready
		
            a_conf.timers.t1:unregister()

            a_main.setup_mqtt()
			
		end
		
		if cb_v == 20 or cb_v == 30 then
		
			-- Retry in 3 seconds

           a_mqtt.stop()
			
			print("[NET] Retrying in 15 seconds...")

			a_conf.timers.t1:register(15000, tmr.ALARM_SINGLE, function() 
			
				a_main.setup_network(0)
			
			end)
		
			a_conf.timers.t1:start()
	
			--print(cb_v)
			
		end
	
	end

end

function a_main.setup_mqtt()

    a_mqtt.start()

end

a_main.boot()

