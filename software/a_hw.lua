-- file: a_hw.lua

local module = {}

a_conf = require("a_conf")
a_persistence = require("a_persistence")


function module.setup()

    gpio.mode(a_conf.PIN_R1, gpio.OUTPUT)
    gpio.mode(a_conf.PIN_R2, gpio.OUTPUT)
    gpio.write(a_conf.PIN_R1, gpio.LOW)
    gpio.write(a_conf.PIN_R2, gpio.LOW)
    
end

function module.restore_saved()

    

    if a_persistence.read("position") == 0 then

        a_hw.stop()

    end

    if a_persistence.read("position") == 1 then

        a_hw.up()

    end

    if a_persistence.read("position") == 2 then

        a_hw.down()

    end
    

end

function module.up()

    print("[HW] Instruction: up")

    gpio.write(a_conf.PIN_R1, gpio.HIGH)
    gpio.write(a_conf.PIN_R2, gpio.HIGH)
    a_persistence.save("position", 1)

    a_conf.timers.t4:unregister()
    a_conf.timers.t4:register(30000, tmr.ALARM_SINGLE, function (t) module.stop(); end)
    a_conf.timers.t4:start()
    
end

function module.down()

    print("[HW] Instruction: down")

    gpio.write(a_conf.PIN_R1, gpio.HIGH)
    gpio.write(a_conf.PIN_R2, gpio.LOW)
    a_persistence.save("position", 2)
    
    a_conf.timers.t4:unregister()
    a_conf.timers.t4:register(30000, tmr.ALARM_SINGLE, function (t) module.stop(); end)
    a_conf.timers.t4:start()
    
end

function module.stop()

    print("[HW] Instruction: stop")

    gpio.write(a_conf.PIN_R1, gpio.LOW)
    a_persistence.save("position", 0)
    
end

return module