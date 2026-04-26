local Event = game:GetService("ReplicatedStorage").Remotes.RequestTeamChange

while true do
local Result = Event:InvokeServer(game:GetService("Teams").Neutral, 1)
local ExpectedResult = table.unpack({true})
local Result = Event:InvokeServer(game:GetService("Teams").Inmates, 1)
local ExpectedResult = table.unpack({true})
task.wait(0.3)
local Result = Event:InvokeServer(game:GetService("Teams").Neutral, 1)
local ExpectedResult = table.unpack({true})
task.wait(0.3)
local Result = Event:InvokeServer(game:GetService("Teams").Guards, 1)
local ExpectedResult = table.unpack({true})
task.wait(0.5)
end