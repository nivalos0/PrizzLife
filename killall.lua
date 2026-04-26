-- SERVICES --
-- Services Table
local Services = {
  players = game:GetService("Players");
  rstorage = game:GetService("ReplicatedStorage");
  teams = game:GetService("Teams");
  ws = game:GetService("Workspace");
  tweenservice = game:GetService("TweenService");
  mps = game:GetService("MarketplaceService");
}
-- SERVICES --

-- VARIABLES
-- Variables Table
local Variables = {
  plr = Services.players:FindFirstChild("LocalPlayer");
  player = game.Players.LocalPlayer; -- fix for chatted connections.
  CurrentPrefix = "?"; -- Current prefix
}
-- VARIABLES --


-- EVENTS --
-- Events Table
local Events = {
  -- Team Event
  TeamEve = Services.rstorage.Remotes:FindFirstChild("RequestTeamChange");
  -- Item Event
  ItemEve = Services.rstorage.Remotes:FindFirstChild("InteractWithItem");
    TaseEve = game:GetService("ReplicatedStorage").GunRemotes.PlayerTased;
}
-- EVENTS --

--[[
local Event = game:GetService("ReplicatedStorage").Remotes.RequestTeamChange
Event:InvokeServer(
    game:GetService("Teams").Inmates,
    1
)
--]]

-- POSITIONS --
local Positions = {
  CrimPos = CFrame.new(-974.720, 108.324, 2058.452);
}
-- POSITIONS


-- GUN LOCATIONS --
-- Gun Locacations Table
local GunLocations = {
    -- Remingtons
    RemingtonCrim = CFrame.new(-935.459, 94.129, 2041.765);
    RemingtonGuards = CFrame.new(816.786, 99.977, 2231.649);
    -- Automatics
    MP5 = CFrame.new(816.786, 99.977, 2231.649);
    AK47 = CFrame.new(-935.459, 94.129, 2041.765);
    -- Riot Gamepass
    M4A1 = CFrame.new(847.197, 99.977, 2231.329);
    -- Mafia Gamepass
    FAL = CFrame.new(-906.005, 94.129, 2048.154);
    -- Sniper Gamepass
    GuardItems = CFrame.new(831.055, 100.097, 2232.432);
    CrimItems = CFrame.new(-915.673, 94.129, 2039.797);
}
-- GUN LOCATIONS --


-- ITEM LOCATIONS --
-- Item Locations Table
local ItemLocations = {
    -- Riot Gamepass
    RiotItems = CFrame.new(847.197, 99.977, 2231.329);
    -- Mafia Gamepass
    MafiaItems = CFrame.new(-906.005, 94.129, 2048.154);
}
-- ITEM LOCATIONS --


-- GUN DATA
-- Gun Data Table
local GunData = {
  Remington = {
    Name = "Remington 870";
    Mesh = "Meshes/r870_2";
  };
  MP5 = {
    Name = "MP5";
    Mesh = "Meshes/MP5 (2)";
  };
  AK47 = {
    Name = "AK-47";
    Mesh = "Meshes/AK47_7";
  };
  M4A1 = {
    Name = "M4A1";
    Mesh = "Mesh";
  };
  Revolver = {
    Name = "Revolver";
    Mesh = "Meshes/Revolver (3)";
  };
}
-- GUNDATA --


-- CORE FUNCTIONS --
-- Core Functions Table
local CoreFunctions = {
  ItemFunction = function(itemname, mesh)
    if itemname and mesh then
      Events.ItemEve:InvokeServer(Services.ws.Prison_ITEMS.giver[itemname][mesh])
    else
      Debug.dewarn("PrizzLife_Error: " .. tostring(errors) .. ", and" .. " you either don't have the Item Name, or Mesh, provide those for this function to work correctly..")
    end
  end;
  TeamFunction = function(args, switch)
    local team = Services.teams[args]
    if team and switch then
      if (PrizzSettings.ACBypass or (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass)) then
      Events.TeamEve:InvokeServer(Services.teams["Neutral"], 1)-- Very shitty anticheat attempt
      task.wait(2.5)
      Events.TeamEve:InvokeServer(team, 1)
      else
        Events.TeamEve:InvokeServer(Services.teams["Neutral"])
      task.wait(2.5)
      Events.TeamEve:InvokeServer(team) -- Very shitty anticheat attempt
      end
    elseif not switch then
      if (PrizzSettings.ACBypass or (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass)) then
      Events.TeamEve:InvokeServer(team, 1) -- Very shitty anticheat attempt
      else
        Events.TeamEve:InvokeServer(team)
      end
    else
      Debug.dewarn("PrizzLife_Error: " .. tostring(errors) .. ", and" .. " team not found.")
    end
  end;
  CheckTeam = function(team)
    plr = Services.players.LocalPlayer
    if team and plr.Team.Name
      then
        if plr.Team.Name == team then
          return true
        else
          return false
        end
    else
      Debug.dewarn("PrizzLife_Error: " .. tostring(errors) .. ", and" .. " enter the team name to do the check.")
      end
  end;
  ItemCheck = function(itemname)
    local player = Variables.player
    local item = player.Backpack:FindFirstChild(itemname)
    if player and item then
      return true
    else
      return false
    end
  end;
  UnloadScript = function()
    if PLAdmin then
        PLAdmin:Destroy()
    end
    local loaded = workspace:FindFirstChild("PLADMIN LOADED SUCCESSFULLY")
    if loaded then
        loaded:Destroy()
    end
    print("Unload Successful")
  end;
  ownsgps = function(userId, passIds)
	for _, passId in ipairs(passIds) do
		local success, owns = pcall(function()
			return Services.mps:UserOwnsGamePassAsync(userId, passId)
		end)
		if success and owns then
			return true
		else
	  Debug.deprint("PrizzLife_Error: " .. tostring(errors) .. ", and" .. "you don't own this, or these gamepasses.")
	end
  end
end;
}
-- CORE FUNCTIONS --


-- LIGHT FUNCTIONS --
-- LightFunctions Table
local LightFunctions = {
  ChangeTeam = function(teamname)
    plr = Variables.player
    if not teamname then
      Notif("Error", "Input your team name for this function to work.")
      return
    end
    if CoreFunctions.CheckTeam(teamname) then
      Notif("Error", "You are already on this team.")
    end
    if teamname == "Guards" then
      if Variables.player.Team and Variables.player.Team.Name ~= "Guards" then
      CoreFunctions.TeamFunction("Guards", true)
      else
        CoreFunctions.TeamFunction("Guards", false)
        end
    elseif teamname == "Inmates" then
        if Variables.player.Team and Variables.player.Team.Name ~= "Inmates" then
        CoreFunctions.TeamFunction("Inmates", true)
      else
        CoreFunctions.TeamFunction("Inmates", false)
      end
      elseif teamname == "Neutral" then
        CoreFunctions.TeamFunction("Neutral", false)
    elseif teamname == "Criminals" then
      if Variables.player.Team and Variables.player.Team.Name == "Inmates" then
      task.wait(0.5)
        Variables.player.Character.HumanoidRootPart.CFrame = Positions.CrimPos
      elseif Variables.player.Team and Variables.player.Team.Name == "Guards" then
        CoreFunctions.TeamFunction("Inmates", true)
        Variables.player.CharacterAdded:Wait()
        task.wait(0.5)
          Variables.player.Character.HumanoidRootPart.CFrame = Positions.CrimPos
          end
      elseif Variables.player.Team and Variables.player.Team.Name == "Neutral" then
          CoreFunctions.TeamFunction("Inmates", false)
          Variables.player.CharacterAdded:Wait()
          task.wait(0.5)
          Variables.player.Character.HumanoidRootPart.CFrame = Positions.CrimPos
    end
  end;
  GiveGun = function(itemname)
	local player = game.Players.LocalPlayer
	local char = player.Character
	local hrp = char.HumanoidRootPart
	local SavedPos = hrp.CFrame

	-- REMINGTONS
	if itemname == "RemingtonGuards" then
	  if not CoreFunctions.ItemCheck("Remington 870") then
		hrp.CFrame = GunLocations.RemingtonGuards
		task.wait(0.2)
		CoreFunctions.ItemFunction(GunData.Remington.Name, GunData.Remington.Mesh)
		Notif("OK", "Obtained Remington 870.")
	  else
	    Notif("Error", "You already have the Remington 870.")
	  end
	elseif itemname == "RemingtonCrim" then
	  if not CoreFunctions.ItemCheck("Remington 870") then
		hrp.CFrame = GunLocations.RemingtonCrim
		task.wait(0.2)
		Events.ItemEve:InvokeServer(
			workspace.Prison_ITEMS.giver:GetChildren()[4][GunData.Remington.Mesh]
		)
		Notif("OK", "Obtained Remington 870.")
	  else
	    Notif("Error", "You already have the Remington 870.")
	  end


	-- AUTOMATICS
	elseif itemname == "MP5" then
	  if not CoreFunctions.ItemCheck("MP5") then
		hrp.CFrame = GunLocations.MP5
		task.wait(0.2)
		CoreFunctions.ItemFunction(GunData.MP5.Name, GunData.MP5.Mesh)
		Notif("OK", "Obtained MP5.")
		else
		  Notif("Error", "You already have the MP5.")
	  end
	  

	elseif itemname == "AK47" then
    if not CoreFunctions.ItemCheck("AK-47") then
		hrp.CFrame = GunLocations.AK47
		task.wait(0.2)
		CoreFunctions.ItemFunction(GunData.AK47.Name, GunData.AK47.Mesh)
		Notif("OK", "Obtained AK-47.")
    else
      Notif("Error", "You already have the AK47.")
    end
    
    
    -- Riot Gun
	elseif itemname == "M4A1" then
		if CoreFunctions.ownsgps(Variables.player.UserId, {96651, 643697197}) then
		  if not CoreFunctions.ItemCheck("M4A1") then
			hrp.CFrame = GunLocations.M4A1
			task.wait(0.2)
			CoreFunctions.ItemFunction(GunData.M4A1.Name, GunData.M4A1.Mesh)
			Notif("OK", "Obtained M4A1.")
			else
			  Notif("Error", "You already have the M4A1.")
			  end
		else
			Notif("Gamepasses❌", "You don't own the Riot Gamepass, you can't get this item.", 6)
		  end
	
	
    -- Mafia Gun
	elseif itemname == "FAL" then
		if CoreFunctions.ownsgps(Variables.player.UserId, {1443271}) then
		  if not CoreFunctions.ItemCheck("FAL") then
			hrp.CFrame = GunLocations.FAL
			task.wait(0.2)
			Events.ItemEve:InvokeServer(
				workspace.Prison_ITEMS.giver.FAL:GetChildren()[4]
			)
			Notif("OK", "Obtained FAL.")
			else
			  Notif("Error", "You already have the FAL.")
		  end
		else
			Notif("Gamepasses❌", "You don't own the Mafia Gamepass, you can't get this item.", 6)
		end
    -- Sniper Guns
	elseif itemname == "Sniper" then
		if CoreFunctions.ownsgps(Variables.player.UserId, {699360089}) then
			if Variables.player.Team and Variables.player.Team.Name == "Guards" then
			  if not CoreFunctions.ItemCheck("Sniper") then
				hrp.CFrame = GunLocations.GuardItems
				task.wait(0.2)
				Events.ItemEve:InvokeServer(
					workspace.Prison_ITEMS.giver:GetChildren()[11].model1
				)
				Notif("OK", "Obtained Sniper.")
			  else
			    Notif("Error", "You already have the Sniper.")
			  end

			elseif Variables.player.Team and Variables.player.Team.Name == "Criminals" then
			  if not CoreFunctions.ItemCheck("Sniper") then
				hrp.CFrame = GunLocations.CrimItems
				task.wait(0.2)
				Events.ItemEve:InvokeServer(
					workspace.Prison_ITEMS.giver.M700:GetChildren()[8]
				)
				Notif("OK", "Obtained Sniper.")
				else
				  Notif("Error", "You already have the Sniper.")
			  end
		end
		else
			Notif("Gamepasses❌", "You don't own the Sniper Gamepass, you can't get this item.", 6)
		end
	-- Revolver
	elseif itemname == "Revolver" then
		if CoreFunctions.ownsgps(Variables.player.UserId, {699360089}) then
			if Variables.player.Team and Variables.player.Team.Name == "Guards" then
			  if CoreFunctions.ItemCheck("Revolver") then
				hrp.CFrame = GunLocations.GuardItems
				task.wait(0.2)
                Events.ItemEve:InvokeServer(workspace.Prison_ITEMS.giver:GetChildren()[13]:GetChildren()[2])
                Notif("OK", "Obtained Revolver.")
                else
                  Notif("Error", "You already have the Revolver.")
			  end
                

			elseif Variables.player.Team and Variables.player.Team.Name == "Criminals" then
			  if not CoreFunctions.ItemCheck("Revolver") then
				hrp.CFrame = GunLocations.CrimItems
				task.wait(0.2)
			    CoreFunctions.ItemFunction(GunData.Revolver.Name, GunData.Revolver.Mesh)
			    Notif("OK", "Obtained Revolver.")
			    else
			      Notif("Error", "You already have the Revolver.")
			  end
			end
		else
			Notif("Gamepasses❌", "You don't own the Sniper Gamepass, you can't get this item.", 6)
		end
	end
	task.wait(0.1)
	hrp.CFrame = SavedPos
end
}




if Services.players.LocalPlayer.Team and Services.players.LocalPlayer.Team.Name == "Guards" then
  LightFunctions.GiveGun("RemingtonGuards")
  LightFunctions.GiveGun("MP5")
elseif Services.players.LocalPlayer.Team and Services.players.LocalPlayer.Team.Name == "Inmates" then
  LightFunctions.GiveGun("RemingtonGuards")
  LightFunctions.GiveGun("MP5")
elseif Services.players.LocalPlayer.Team and Services.players.LocalPlayer.Team.Name == "Criminals" then
  LightFunctions.GiveGun("RemingtonCrim")
  LightFunctions.GiveGun("AK47")
end