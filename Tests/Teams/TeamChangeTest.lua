-- Variables
local TeamEvent = game:GetService("ReplicatedStorage").Remotes.RequestTeamChange
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local teams = game:GetService("Teams")

-- TeamChange function
local function TeamChange(teamname)
  TeamEvent:InvokeServer(teams[teamname], 1)
end

-- Do TeamChange
TeamChange("Guards")