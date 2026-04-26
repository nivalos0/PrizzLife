local ItemEvent = game:GetService("ReplicatedStorage").Remotes.InteractWithItem

local GunLocations = {
    -- Remingtons
    RemingtonCrim = CFrame.new(-935.459, 94.129, 2041.765);
    RemingtonGuards = CFrame.new(816.786, 99.977, 2231.649);
    -- Automatics
    MP5 = CFrame.new(816.786, 99.977, 2231.649);
    AK47 = CFrame.new(-935.459, 94.129, 2041.765);
    -- Riot Only
    M4A1 = CFrame.new(847.197, 99.977, 2231.329);
}

local function ItemEve(itemname, mesh)
    if itemname and mesh then
    ItemEvent:InvokeServer(workspace.Prison_ITEMS.giver[itemname][mesh])
    else
    warn("ItemName, or Mesh not provided, you need those to work.")
    end
end


-- Pass Detection
local MarketplaceService = game:GetService("MarketplaceService")

local function ownsAnyPass(userId, passIds)
for _, passId in ipairs(passIds) do
		local success, owns = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(userId, passId)
end)

		if success and owns then
			return true
		end
	end
end


-- GUNS

local function GetGun(itemname)
	local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
	local SavedPos = hrp.CFrame

	-- Remingtons Start
	if itemname == "RemingtonGuards" then
		hrp.CFrame = GunLocations.RemingtonGuards
		task.wait(0.2)
		ItemEve("Remington 870", "Meshes/r870_2")

	elseif itemname == "RemingtonCrim" then
		hrp.CFrame = GunLocations.RemingtonCrim
		task.wait(0.2)
		ItemEve("Remington 870", "Meshes/r870_2")

	-- Automatics Start
	elseif itemname == "MP5" then
		hrp.CFrame = GunLocations.MP5
		task.wait(0.2)
		ItemEve("MP5", "Meshes/MP5 (2)")

	elseif itemname == "M4A1" then
		if ownsAnyPass(game.Players.LocalPlayer.UserId, {96651, 643697197}) then
			hrp.CFrame = GunLocations.M4A1
			task.wait(0.2)
			ItemEve("M4A1", "Mesh")
		else
			warn("You don't own this PL gamepass, you can't get this item.")
			return
		end
	end

	task.wait(0.1)
	hrp.CFrame = SavedPos
end
-- GUNS



GetGun("M4A1")

--ItemEve("Remington 870", "Meshes/r870_2")