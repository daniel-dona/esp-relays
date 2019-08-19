-- file: a_hw.lua

local module = {}

a_conf = require("a_conf")


function module.setup()

    gpio.mode(a_conf.PIN_R1, gpio.OUTPUT)
    gpio.mode(a_conf.PIN_R2, gpio.OUTPUT)
    gpio.write(a_conf.PIN_R1, gpio.LOW)
    gpio.write(a_conf.PIN_R2, gpio.LOW)
    
end

function module.up()

	gpio.write(a_conf.PIN_R1, gpio.HIGH)
	gpio.write(a_conf.PIN_R2, gpio.HIGH)
	
end

function module.down()

	gpio.write(a_conf.PIN_R1, gpio.HIGH)
	gpio.write(a_conf.PIN_R2, gpio.LOW)
	
end

function module.stop()

	gpio.write(a_conf.PIN_R1, gpio.LOW)
	
end

return module
