local prefix = "!"
local player = game.Players.LocalPlayer

local commands = {
  hi = function()
    print("Hi!")
  end
}

player.Chatted:Connect(function(msg)
  if msg:sub(1, 1) == prefix then
    local args = msg:sub(2):split(" ")
    local cmd = args[1]:lower()
    if commands[cmd] then
      commands[cmd](unpack(args, 2))
    else
      print("Command not found.")
    end
  end
end)