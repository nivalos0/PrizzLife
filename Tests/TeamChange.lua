local TeamEvent = game:GetService("ReplicatedStorage").Remotes.RequestTeamChange
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local teams = game:GetService("Teams")

local function TeamChange(teamname)
  TeamEvent:InvokeServer(teams:FindFirstChild(teamname))
end

TeamChange("Guards")