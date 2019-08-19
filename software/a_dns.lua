-- file : a_dns.lua
local module = {}

function module.resolve(HOST, cb)

	conn = net.createConnection(net.TCP, 0)
    conn:dns(HOST, function(conn, IP) 
       
        print("[DNS] Resolved "..HOST.." to "..IP) 
        cb(IP)
         
    end)
    conn = nil
    
end

return module
