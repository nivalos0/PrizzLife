--Now this is what i call "Direct-execute" 
local dir = "Files/pladmin.txt"
local a,b = pcall(function()
    loadstring(game:HttpGet("http://192.168.100.4/" .. dir))()
end);if not a then
    local c,d = xpcall(function()
        loadstring(game:HttpGet("http://192.168.5.1/" .. dir))()
    end,function()
        loadstring(game:HttpGet("http://192.168.137.1/" .. dir))()
    end);if not c then
        local e,f = pcall(function()
            loadstring(game:HttpGet("http://desktop-kthrbuo.mshome.net/" .. dir))()
        end);if not e then
            warn("Error! Executor is either not allowed to access localhost or the device is connected to a different router!")
        end
    end
end
