-- file: net.lua
local module = {}

function module.start(ssid, ssid_pass, cb)
	
	wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
	
		print("[NET] Connected to AP!")
		
		print("[NET] \n\t\tSSID: "..T.SSID.."\n\t\tBSSID: "..T.BSSID.."\n\t\tCHANNEL: "..T.channel)
	
		cb(10)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
	
		print("[NET] Disconnected from AP!")
		
		print("[NET] \n\t\tSSID: "..T.SSID.."\n\t\tBSSID: "..T.BSSID.."\n\t\tREASON: "..T.reason)
		
		cb(30)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
	
		print("[NET] Received DHCP IP information!")
		
		print("[NET] \n\t\tIP: "..T.IP.."\n\t\tNETMASK: "..T.netmask.."\n\t\tGATEWAY: "..T.gateway)
	
		cb(11)
		
	end)
	
	wifi.eventmon.register(wifi.eventmon.STA_DHCP_TIMEOUT, function(T)
	
		print("[NET] DHCP timeout!")
	
		cb(20)
		
	end)
	
	wifi.setmode(wifi.STATION);
	station_cfg = {}
	station_cfg.ssid = ssid
    station_cfg.pwd = ssid_pass
    station_cfg.save = false
    station_cfg.auto = true

    wifi.sta.config(station_cfg)

end

return module
