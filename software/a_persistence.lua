local module = {}

function module.save(name, value)
  file.open(".var_"..name, 'w') -- you don't need to do file.remove if you use the 'w' method of writing
  file.writeline(value)
  file.close()
end

function module.read(name)
  if (file.open(".var_"..name)~=nil) then
      l = file.readline()
      if(l ~= nil) then
          result = string.sub(l, 1, -2) -- to remove newline character
          file.close()
          return result
      end
  else
      return -1
  end
end

function module.free(name)
    file.remove(name)
end

return module
