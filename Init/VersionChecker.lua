-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local Frame23 = Instance.new("Frame")
Frame23.Name = "NotificationContainer"
Frame23.Parent = ScreenGui
Frame23.BackgroundTransparency = 1 -- Fixed
Frame23.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame23.BorderSizePixel = 0
Frame23.Position = UDim2.new(0.625, 0, 0.0376, 0)
Frame23.Size = UDim2.new(0.3608, 0, 0.8823, 0)

-- Layout
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
layout.Parent = Frame23

-- Notification Function
local function Notif(args, text, duration)
	duration = duration or 3

	local notif = Instance.new("Frame")
	notif.Name = "notifFrame"
	notif.Size = UDim2.new(0, 320, 0, 72)
	notif.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	notif.BorderSizePixel = 0
	notif.BackgroundTransparency = 0
	notif.Parent = Frame23
	notif.LayoutOrder = tick()

	local image = Instance.new("ImageLabel")
	image.Size = UDim2.new(0, 72, 0, 72)
	image.Position = UDim2.new(0, 0, 0, 0)
	image.BackgroundTransparency = 1
	image.Image = "rbxassetid://71672543266605"
	image.Parent = notif

	local title = Instance.new("TextLabel")
	title.RichText = true
	title.Name = "title"
	title.Parent = notif
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.25, 0, 0, 0)
	title.Size = UDim2.new(0, 192, 0, 35)
	title.Font = Enum.Font.SourceSans
	title.Text = "<b>" .. args .. "</b>"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.TextSize = 14.000
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	local desc = Instance.new("TextLabel")

	desc.Name = "desc"
	desc.Parent = notif
	desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	desc.BackgroundTransparency = 1.000
	desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	desc.BorderSizePixel = 0
	desc.Position = UDim2.new(0.25, 0, 0.486111104, 0)
	desc.Size = UDim2.new(0, 192, 0, 37)
	desc.Font = Enum.Font.SourceSans
	desc.Text = text
	desc.TextColor3 = Color3.fromRGB(255, 255, 255)
	desc.TextScaled = true
	desc.TextSize = 14.000
	desc.TextWrapped = true
	desc.TextXAlignment = Enum.TextXAlignment.Left

	local divider = Instance.new("Frame")
	divider.Size = UDim2.new(0, 233, 0, 1)
	divider.Position = UDim2.new(0.25, 0, 0.486, 0)
	divider.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
	divider.BorderSizePixel = 0
	divider.Parent = notif

	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.Parent = Frame23
	UIAspectRatioConstraint.AspectRatio = 0.636

	task.delay(duration, function()
		if notif and notif.Parent then
			local fadeOut = TweenService:Create(notif, TweenInfo.new(0.3), {
				BackgroundTransparency = 1
			})
			fadeOut:Play()
			fadeOut.Completed:Connect(function()
				notif:Destroy()
			end)
		end
	end)
end


local CurrentVersion = ...
if CurrentVersion == "1" then
   Notif("Version Checker", "you're version is up to date, continuing....", 2)
   else
   Notif("Version Checker", "you're version is not up to date, go to the GitHub to get the latest version.", 2)
   setclipboard("https://github.com/nivalos0/PrizzLife/tree/main")
end
