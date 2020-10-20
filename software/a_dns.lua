-- file : a_dns.lua
local module = {}

function module.resolve(HOST, cb, ecb)

    conn = net.createConnection(net.TCP, 0)
    conn:dns(HOST, function(conn, IP) 

        if IP ~= nil then
       
            print("[DNS] Resolved "..HOST.." to "..IP) 
            cb(IP)

        else

            print("[DNS] Resolution failed!")
            ecb()
        end
         
    end)
    conn = nil
    
end


return module
