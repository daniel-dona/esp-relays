-- file: net.lua
local module = {}

a_conf = require("a_conf")

function module.start(cb)

    wifi.sta.clearconfig() --reset
    wifi.setmode(wifi.STATION);

        --wifi.setphymode(wifi.PHYMODE_N)
    
    station_cfg = {}
    station_cfg.ssid = a_conf.SSID
    station_cfg.pwd = a_conf.SSID_PASS
    station_cfg.save = false
    station_cfg.auto = false

    wifi.sta.sethostname(a_conf.HOSTNAME)

    wifi.sta.config(station_cfg)

    wifi.sta.sleeptype(wifi.NONE_SLEEP)
	
	wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)

        wifi.eventmon.unregister(wifi.eventmon.STA_CONNECTED)
    
		print("[NET] Connected to AP!")
		
		print("[NET] \n\t\tSSID: "..T.SSID.."\n\t\tBSSID: "..T.BSSID.."\n\t\tCHANNEL: "..T.channel)
	
		cb(10)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)

        wifi.eventmon.unregister(wifi.eventmon.STA_DISCONNECTED)
    
		print("[NET] Disconnected from AP!")
		
		print("[NET] \n\t\tSSID: "..T.SSID.."\n\t\tBSSID: "..T.BSSID.."\n\t\tREASON: "..T.reason)
		
		cb(30)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)

        wifi.eventmon.unregister(wifi.eventmon.STA_GOT_IP)
	
		print("[NET] Received DHCP IP information!")
		
		print("[NET] \n\t\tIP: "..T.IP.."\n\t\tNETMASK: "..T.netmask.."\n\t\tGATEWAY: "..T.gateway)
	
		cb(11)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_DHCP_TIMEOUT, function(T)

        wifi.eventmon.unregister(wifi.eventmon.STA_DHCP_TIMEOUT)
	
		print("[NET] DHCP timeout!")
	
		cb(20)
		
	end)



    wifi.sta.connect()

end

return module
