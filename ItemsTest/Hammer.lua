local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PLAdmin = playerGui:FindFirstChild("PLAdmin") or Instance.new("ScreenGui")
PLAdmin.Name = "PLAdmin"
PLAdmin.Parent = playerGui
PLAdmin.ResetOnSpawn = false

-- Notification Shit Start
local Frame23 = PLAdmin:FindFirstChild("NotifContainer") or Instance.new("Frame")
Frame23.Name = "NotifContainer"
Frame23.Parent = PLAdmin
Frame23.Transparency = 1
Frame23.AnchorPoint = Vector2.new(1, 1)
Frame23.Position = UDim2.new(0.98, 0, 0.95, 0) 
Frame23.Size = UDim2.new(0, 300, 0, 500)

-- Single Layout Control
local layout = Frame23:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout")
layout.Parent = Frame23
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom

-- Notification Function
local function Notif(args, text, duration)
	duration = duration or 3
	
	local notif = Instance.new("Frame")
	notif.Name = "notifFrame"
	notif.Size = UDim2.new(1, 0, 0, 0) -- Start at 0 height for the slide-up effect
	notif.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	notif.BackgroundTransparency = 1
	notif.BorderSizePixel = 0
	notif.ClipsDescendants = true
	notif.Parent = Frame23
	notif.LayoutOrder = tick() -- Ascending order

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = notif

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 1.2
	stroke.Transparency = 1
	stroke.Parent = notif

	-- Icon (Cleaned - No background layer)
	local image = Instance.new("ImageLabel")
	image.Name = "Icon"
	image.Size = UDim2.new(0, 45, 0, 45)
	image.Position = UDim2.new(0, 12, 0.5, -22)
	image.BackgroundTransparency = 1
	image.Image = "rbxassetid://71672543266605"
	image.ImageColor3 = Color3.fromRGB(160, 180, 255)
	image.ImageTransparency = 1
	image.Parent = notif

	-- Title
	local title = Instance.new("TextLabel")
	title.Name = "title"
	title.Parent = notif
	title.BackgroundTransparency = 1
	title.Position = UDim2.new(0, 68, 0, 12)
	title.Size = UDim2.new(1, -80, 0, 20)
	title.Font = Enum.Font.GothamBold
	title.Text = args
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 14 -- Balanced size
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextTransparency = 1

	-- Description
	local desc = Instance.new("TextLabel")
	desc.Name = "desc"
	desc.Parent = notif
	desc.BackgroundTransparency = 1
	desc.Position = UDim2.new(0, 68, 0, 32)
	desc.Size = UDim2.new(1, -80, 0, 30)
	desc.Font = Enum.Font.Gotham
	desc.Text = text
	desc.TextColor3 = Color3.fromRGB(200, 210, 220)
	desc.TextSize = 12 -- Slightly smaller for hierarchy
	desc.TextWrapped = true
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.TextYAlignment = Enum.TextYAlignment.Top
	desc.TextTransparency = 1

	-- Progress Bar
	local pBarBG = Instance.new("Frame")
	pBarBG.Size = UDim2.new(1, -24, 0, 3)
	pBarBG.Position = UDim2.new(0, 12, 1, -8)
	pBarBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	pBarBG.BackgroundTransparency = 0.9
	pBarBG.BorderSizePixel = 0
	pBarBG.Parent = notif
	
	local pBar = Instance.new("Frame")
	pBar.Size = UDim2.new(1, 0, 1, 0)
	pBar.BackgroundColor3 = Color3.fromRGB(160, 180, 255)
	pBar.BorderSizePixel = 0
	pBar.Parent = pBarBG

	-- ANIMATION
	local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	
	-- Open
	TweenService:Create(notif, tweenInfo, {Size = UDim2.new(1, 0, 0, 75), BackgroundTransparency = 0.2}):Play()
	TweenService:Create(stroke, tweenInfo, {Transparency = 0.8}):Play()
	TweenService:Create(image, tweenInfo, {ImageTransparency = 0}):Play()
	TweenService:Create(title, tweenInfo, {TextTransparency = 0}):Play()
	TweenService:Create(desc, tweenInfo, {TextTransparency = 0.2}):Play()

	-- Progress
	local progressTween = TweenService:Create(pBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
	progressTween:Play()

	-- Close
	task.delay(duration, function()
		local closeTween = TweenService:Create(notif, tweenInfo, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1})
		TweenService:Create(stroke, tweenInfo, {Transparency = 1}):Play()
		TweenService:Create(title, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(desc, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(image, tweenInfo, {ImageTransparency = 1}):Play()
		
		closeTween:Play()
		closeTween.Completed:Connect(function()
			notif:Destroy()
		end)
	end)
end
-- Notification Shit End

-- SERVICES
local Camera = game:GetService("Workspace").CurrentCamera
local Rstorage = game:GetService("ReplicatedStorage")
local Rservice = game:GetService("RunService")
local Hbeat = Rservice.Heartbeat
local Rstep = Rservice.RenderStepped
local Stepped = Rservice.Stepped
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local TweenService = game:GetService("TweenService")
-- SERVICES
local LocalPlayer = Players.LocalPlayer
local player = Players.LocalPlayer
local RegModule = nil


-- EVENTS
local TeamEvent = Rstorage.Remotes.RequestTeamChange
local ItemEvent = game:GetService("ReplicatedStorage").Remotes.InteractWithItem
local MeleeEvent = game:GetService("ReplicatedStorage").meleeEvent
-- EVENTS

local ItemLocations = {
    -- Riot Gamepass
    RiotItems = CFrame.new(847.197, 99.977, 2231.329);
    -- Mafia Gamepass
    MafiaItems = CFrame.new(-906.005, 94.129, 2048.154);
}

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
-- Pass Detection

-- Main Event Functions
local function ItemEve(itemname, mesh)
    if itemname and mesh then
    ItemEvent:InvokeServer(workspace.Prison_ITEMS.giver[itemname][mesh])
    else
    warn("ItemName, or Mesh not provided, you need those to work.")
    end
end

local function ItemType(type, itemname, mesh)
    if type and itemname and mesh then
        if type == "clothes" then
            ItemEvent:InvokeServer(workspace.Prison_ITEMS.clothes[itemname].mesh)
        elseif type == "hats" then
        ItemEvent:InvokeServer(workspace.Prison_ITEMS.hats[itemname].mesh)
    else
        Notif("Item", "Item, or ItemName/Mesh not found, try again.", 6)
        end
    end
end
    

local TeamEve = function(args, switch)
	local team = Teams[args]
	if team and switch then
	    TeamEvent:InvokeServer(Teams["Neutral"])
	    task.wait(2)
	    TeamEvent:InvokeServer(team)
	elseif not switch then
	    TeamEvent:InvokeServer(team)
	else
	    Notif("Team", "Team not found, try again.", 6)
	end
end


local MeleeEve = function(players)
    local player = Players[players]
    if player then
        MeleeEvent:FireServer(player)
    end
end
-- Main Event Functions

local function GiveItem(itemname)
    local char = player.Character
    if not char then
        return
    end

    local hrp = char:WaitForChild("HumanoidRootPart")
    local savedPos = hrp.CFrame

    -- Item handling
    -- Riot Items
    if itemname == "Shield" and game.Players.LocalPlayer.Team.Name == "Guards" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {96651, 643697197})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Riot Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.RiotItems
        task.wait(0.2)
        ItemEve("Riot Shield", "ITEMPICKUP")
        Notif("OK", "Obtained Riot Shield.")
    elseif itemname == "RiotClothes" and game.Players.LocalPlayer.Team.Name == "Guards" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {96651, 643697197})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Riot Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.RiotItems
        task.wait(0.2)
        ItemEvent:InvokeServer(workspace.Prison_ITEMS.clothes["Riot Police"].Torso)
        Notif("OK", "Obtained Riot Clothes.")
    elseif itemname == "RiotHelmet" and game.Players.LocalPlayer.Team.Name == "Guards" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {96651, 643697197})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Riot Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.RiotItems
        task.wait(0.2)
        ItemType("hats", "Riot helmet", "hat")
        Notif("OK", "Obtained Riot Helmet.")
    elseif itemname == "SkiMask" and game.Players.LocalPlayer.Team.Name == "Guards" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {96651, 643697197})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Riot Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.RiotItems
        task.wait(0.2)
        ItemType("hats", "Ski mask", "hat")
        Notif("OK", "Obtained Ski Mask.")
        -- Mafia Items
    elseif itemname == "ArmorVest" and game.Players.LocalPlayer.Team.Name == "Criminals" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {1443271})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Mafia Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.MafiaItems
        task.wait(0.2)
        ItemEvent:InvokeServer(workspace.Prison_ITEMS.clothes.Mafia["Meshes/vest (7)"])
        ItemType("clothes", "Mafia", "Meshes/vest (7)")
        Notif("OK", "Obtained the Mafia Armor Vest.")
    elseif itemname == "MafiaClothes" and game.Players.LocalPlayer.Team.Name == "Criminals" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {1443271})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Mafia Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.MafiaItems
        task.wait(0.2)
        ItemEvent:InvokeServer(workspace.Prison_ITEMS.clothes.Mafia:GetChildren()[3])
        Notif("OK", "Obtained the Mafia Armor.")
    elseif itemname == "MafiaC4" and game.Players.LocalPlayer.Team.Name == "Criminals" then
        -- PL gamepass check
        local hasPass = ownsAnyPass(player.UserId, {1443271})
        if not hasPass then
            Notif("Gamepasses❌", "You don't own the Mafia Gamepass, you can't get this item.", 6)
            return
        end
        hrp.CFrame = ItemLocations.MafiaItems
        task.wait(0.2)
        ItemEve("C4 Explosive", "Explosive")
        Notif("OK", "Obtained the Mafia C4.")
    else
        return
    end

    task.wait(0.1)
    hrp.CFrame = savedPos
end

GiveItem("RiotHelmet")