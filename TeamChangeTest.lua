-- Variables
local Rstorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local Event = Rstorage.Remotes.RequestTeamChange

-- Core function
local TeamEve = function(args, switch)
	local team = Teams[args]
	if team and switch then
	    Event:InvokeServer(Teams["Neutral"], 1)
	    task.wait(4)
	    Event:InvokeServer(team, 1)
	elseif not switch then
	    Event:InvokeServer(team, 1)
	else
	    warn("Team not found, try again.")
	end
end

-- Main function
local function ChangeTeam(TeamName, Switch)
    if TeamName == "Guards" then
        TeamEve("Guards", Switch)
    elseif TeamName == "Inmates" then
        TeamEve("Inmates", Switch)
    elseif TeamName == "Criminals" then
        warn("Not here yet")
    elseif TeamName == "Neutral" then
        TeamEve("Neutral")
    else
        warn("No Team found, try another one.")
    end
end

-- ChangeTeam
ChangeTeam("Guards", true)
