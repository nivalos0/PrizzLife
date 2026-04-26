local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PLAdmin = playerGui:FindFirstChild("PLAdmin") or Instance.new("ScreenGui")
PLAdmin.Name = "PLAdmin"
PLAdmin.Parent = playerGui
PLAdmin.ResetOnSpawn = false

-- Notification Container
local Frame23 = PLAdmin:FindFirstChild("NotifContainer") or Instance.new("Frame")
Frame23.Name = "NotifContainer"
Frame23.Parent = PLAdmin
Frame23.Transparency = 1
Frame23.AnchorPoint = Vector2.new(1, 1) -- Anchor to bottom right
Frame23.Position = UDim2.new(0.98, 0, 0.95, 0) -- Positioned bottom right
Frame23.Size = UDim2.new(0, 300, 0, 500)

-- Single Layout Control
local layout = Frame23:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout")
layout.Parent = Frame23
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom -- Newest at bottom, pushes old up

-- Enhanced Notification Function
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

-- Test
Notif("System Alert", "Your executor is running smoothly!", 5)
task.wait(1)
Notif("Security", "Scanning for vulnerabilities...", 5)
task.wait(1)
Notif("Update", "New version 2.4 available now.", 5)
