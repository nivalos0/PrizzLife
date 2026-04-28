--[[ PrizzLife V2.0 ReWrite, made by Nivalos, influenced by EllieXmln.

-- ELLIE --
We love you Ellie, you might not be physically present, but you will always be in our hearts. Clearly Vlaair didn't care enough about you to continue your legacy, this project is all thanks to you. You will be remembered FOREVER.❤️🕊️
-- ELLIE --

ReWrite:
Full ReWrite of everything.
--]]

-- Prompt User function
local PromptUser = function(Title, Text, Duration, Button1, Button2, DaCallback, DeCallback, waitresponse)
	local Bindable, Responded = Instance.new("BindableFunction"), false
	function Bindable.OnInvoke(response)
		if response == Button1 then
			if DaCallback then
				DaCallback()
			end
		elseif response == Button2 then
			if DeCallback then
				DeCallback()
			end
		end
		Responded = true
	end;game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Callback = Bindable;
		Button1 = Button1;
		Button2 = Button2;
	})
	if waitresponse then
		local tictowait = tick() + Duration + 1
		repeat task.wait() until tick() - tictowait >=0 or Responded;tictowait = nil
		Bindable:Destroy();Bindable = nil;Responded = nil
	else
		task.spawn(function()
			local tictowait = tick() + Duration + 1
			repeat task.wait() until tick() - tictowait >=0 or Responded;tictowait = nil
			Bindable:Destroy();Bindable = nil;Responded = nil
		end)
	end
end

-- GAME CHECK
if game.PlaceId ~= 155615604 then
  print("Wrong Game, join Prison Life.")
    return
end
-- GAME CHECK


-- LOADED CHECK
if workspace:FindFirstChild("PRIZZ LOADED SUCCESSFULLY") then
	  warn("PrizzLife is already loaded")
	return
else
  print("Prizzlife isn't already loaded, proceeding with execution.")
end
-- LOADED CHECK


-- CURRENT VERSION --
local currentVersion = "V2.0 ReWrite"
-- CURRENT VERSION --

-- RUN TIME --
local runtime = tick()
-- RUN TIME --

-- DEFAULT SETTINGS --
local PrizzSettings = {
  DefaultPrefix = "?"; -- Prefix
  JoinNotify = false; -- Join notification toggle
  --AntiTase = false; -- AntiTase setting
  ShittyExecutor = false; -- Detects if you have a shitty executor.
  ACBypass = true; -- Enabled by Default
  Debug = {
    Active = false;
    -- SETTINGS
    ACBypass = true; -- Enabled by default
    Prints = true;
    Warns = true;
    ShowNotification = true;
  }; -- Debug prints, and warns.
}
-- DEFAULT SETTINGS --


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


-- PRIZZ FOLDER --
-- Make Prizz folder
Instance.new("Folder", game:GetService("Workspace")).Name = "PRIZZ LOADED SUCCESSFULLY"
-- PRIZZ FOLDER --


-- MAIN UI --
local PLAdmin = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ScriptName = Instance.new("TextLabel")
local ExecBar = Instance.new("TextBox")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local SettingButton = Instance.new("ImageButton")
local Toggles_Frame = Instance.new("ScrollingFrame")
local CMDS_Frame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIListLayout2 = Instance.new("UIListLayout")
local TopBar = Instance.new("Frame")
local UnloadScript = nil
local Unloaded = false

PLAdmin.Name = "PLAdmin"
PLAdmin.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PLAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PLAdmin.ResetOnSpawn = false

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = PLAdmin
MainFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 295, 0, 270)
MainFrame.Active = true

-- Top Bar
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(0,0,0)
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 2
TopBar.AnchorPoint = Vector2.new(0, 0)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.Size = UDim2.new(1, 0, 0, 20)
TopBar.Active = true
TopBar.Visible = true

-- Text Label 23
local TextLabel23 = Instance.new("TextLabel")
TextLabel23.Name = "CreditLabel"
TextLabel23.Parent = MainFrame
TextLabel23.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel23.BackgroundTransparency = 1
TextLabel23.Size = UDim2.new(0, 295, 0, 20)
TextLabel23.Position = UDim2.new(0, 0, 0, 20)
TextLabel23.Text = "In Loving Memory of elliexmln, thank you for everything! 🕊️"
TextLabel23.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel23.TextSize = 12
TextLabel23.Font = Enum.Font.SourceSans
TextLabel23.TextXAlignment = Enum.TextXAlignment.Center
TextLabel23.TextYAlignment = Enum.TextYAlignment.Center
TextLabel23.ZIndex = 2

-- Script Name
ScriptName.Name = "ScriptName"
ScriptName.Parent = TopBar
ScriptName.BackgroundTransparency = 1
ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderSizePixel = 0
ScriptName.Size = UDim2.new(0, 295, 0, 20)
ScriptName.Font = Enum.Font.SourceSans
ScriptName.Text = "PrizzLife " .. currentVersion
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 18.000
ScriptName.TextYAlignment = Enum.TextYAlignment.Top
ScriptName.TextWrapped = true

-- Execute Bar
ExecBar.Name = "ExecBar"
ExecBar.Parent = MainFrame
ExecBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ExecBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
ExecBar.BorderSizePixel = 2
ExecBar.Position = UDim2.new(0, 0, 1, -27)
ExecBar.Size = UDim2.new(0, 295, 0, 27)
ExecBar.ZIndex = 2
ExecBar.Font = Enum.Font.SourceSans
ExecBar.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecBar.Text = ""
ExecBar.PlaceholderText = "> Search / Execute <"
ExecBar.TextSize = 15.000
ExecBar.ClearTextOnFocus = false

-- Close Button 
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.930000126, 0, -0.00100000738, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 19)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14.000

-- Minimize Button
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.836440682, 0, -0.00100000738, 0)
MinimizeButton.Size = UDim2.new(0, 20, 0, 19)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14.000

-- Settings Button
SettingButton.Name = "SettingButton"
SettingButton.Parent = TopBar
SettingButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderSizePixel = 0
SettingButton.Position = UDim2.new(-0.00288127316, 0, -0.0064053922, 0)
SettingButton.Size = UDim2.new(0, 20, 0, 19)
SettingButton.Image = "rbxassetid://11308562716"

-- Toggle Frame
Toggles_Frame.Name = "Toggles_Frame"
Toggles_Frame.Parent = MainFrame
Toggles_Frame.Active = true
Toggles_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Toggles_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.BorderSizePixel = 0
Toggles_Frame.Position = UDim2.new(0, 0, 0.138000056, 0)
Toggles_Frame.Size = UDim2.new(0, 295, 0, 230)
Toggles_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.ScrollBarThickness = 6
Toggles_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
Toggles_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Toggles_Frame.ScrollingDirection = Enum.ScrollingDirection.Y
Toggles_Frame.Visible = false

-- UI Layout 
UIListLayout2.Parent = Toggles_Frame
UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Padding = UDim.new(0.0088999978, 0)
UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Top

-- CMD FRAME
CMDS_Frame.Name = "CMDS_Frame"
CMDS_Frame.Parent = MainFrame
CMDS_Frame.Active = true
CMDS_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CMDS_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.BorderSizePixel = 0
CMDS_Frame.Position = UDim2.new(0, 0, 0.142000056, 0)
CMDS_Frame.Size = UDim2.new(0, 295, 0, 230)
CMDS_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.ScrollBarThickness = 6
CMDS_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
CMDS_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
CMDS_Frame.ScrollingDirection = Enum.ScrollingDirection.Y

UIListLayout.Parent = CMDS_Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0088999978, 0)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top


-- GUI FUNCTION LIST START

local DraggifyFrame = function(frame, dragHandle)
	dragHandle = dragHandle or frame
	local dragging
	local dragStartPos
	local startPos
	
	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStartPos = input.Position
			startPos = frame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStartPos
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

local AddList = function(args, description, isCategory)
	if isCategory then
		local background = Instance.new("Frame")
		background.Name = "Category_Frame_Background"
		background.Parent = CMDS_Frame
		background.Transparency = 1
		background.BorderSizePixel = 1
		background.BorderColor3 = Color3.fromRGB(0, 0, 0)
		background.Size = UDim2.new(0, 288, 0, 30)

		local newCategory = Instance.new("TextLabel")
		newCategory.Name = "Category_Frame"
		newCategory.Parent = background
		newCategory.Size = UDim2.new(0, 288, 0, 30)
		newCategory.BackgroundColor3 = Color3.fromRGB(12,12,12)

		newCategory.Font = Enum.Font.SourceSans
		newCategory.Text = args
		newCategory.TextColor3 = Color3.fromRGB(255, 255, 255)
		newCategory.TextScaled = true
		newCategory.TextSize = 14.000
		newCategory.TextWrapped = true

		local padding = Instance.new("UIPadding")
		padding.Parent = newCategory
		padding.PaddingTop = UDim.new(0, 5)
		padding.PaddingBottom = UDim.new(0, 5)
		padding.PaddingLeft = UDim.new(0, 5)
		padding.PaddingRight = UDim.new(0, 5)

		if typeof(description) == "string" then
			local newDescriptionCat = Instance.new("TextLabel")
			newDescriptionCat.Parent = CMDS_Frame
			newDescriptionCat.Name = "Description_Frame"
			newDescriptionCat.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			newDescriptionCat.BorderColor3 = Color3.fromRGB(0, 0, 0)
			newDescriptionCat.BorderSizePixel = 0
			newDescriptionCat.BorderMode = Enum.BorderMode.Outline
			newDescriptionCat.Size = UDim2.new(0, 288, 0, 32)
			newDescriptionCat.Position = UDim2.new(0, 0, 0, 18)
			newDescriptionCat.Font = Enum.Font.SourceSans
			newDescriptionCat.Text = description
			newDescriptionCat.TextColor3 = Color3.fromRGB(255, 255, 255)
			newDescriptionCat.TextScaled = true
			newDescriptionCat.TextWrapped = true
			newDescriptionCat.TextSize = 14.000
		end
		return
	end

	local NewFrame = Instance.new("Frame")
	NewFrame.Name = "CMDFrame"
	NewFrame.Parent = CMDS_Frame
	NewFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewFrame.Size = UDim2.new(0, 288, 0, 18)

	local TextLabel = Instance.new("TextButton")
	TextLabel.Parent = NewFrame
	TextLabel.Name = "CMD_Name"
	TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 1
	TextLabel.ZIndex = 2
	TextLabel.Size = UDim2.new(0, 288, 0, 18)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = args
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top

	local descriptionVisible = false
	local descriptionLabel = nil

	TextLabel.Activated:Connect(function ()
		if descriptionVisible then
			if descriptionLabel then
				descriptionLabel:Destroy()
				descriptionLabel = nil
			end
			NewFrame.Size = UDim2.new(0, 288, 0, 18)
			descriptionVisible = false
		else
			descriptionLabel = Instance.new("TextLabel")
			descriptionLabel.Parent = NewFrame
			descriptionLabel.Name = "Description_Frame"
			Color3.fromRGB(36, 36, 36)
			descriptionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			descriptionLabel.BorderSizePixel = 0
			descriptionLabel.BackgroundColor3 = Color3.fromRGB(45,45,45)
			descriptionLabel.ZIndex = 1
			descriptionLabel.BorderMode = Enum.BorderMode.Outline
			descriptionLabel.Size = UDim2.new(0, 288, 0, 32)
			descriptionLabel.Position = UDim2.new(0, 0, 0, 18)
			descriptionLabel.Font = Enum.Font.SourceSans
			descriptionLabel.Text = description
			descriptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			descriptionLabel.TextScaled = true
			descriptionLabel.TextWrapped = true
			descriptionLabel.TextSize = 14.000

			NewFrame.Size = UDim2.new(0, 288, 0, 50)
			descriptionVisible = true
		end
	end)
end

local NewToggleList = function(title, description, defaultvalue, toggle, istextbox)
	local NewFrame = Instance.new("Frame")
	NewFrame.Name = "TOGFrame"
	NewFrame.Parent = Toggles_Frame
	NewFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	NewFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewFrame.Size = UDim2.new(0, 288, 0, 50)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = NewFrame
	TextLabel.Name = "TOG_Name"
	TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 1
	TextLabel.ZIndex = 2
	TextLabel.Size = UDim2.new(0, 288, 0, 18)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = title
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	local TPos = TextLabel.Position
	local TextUdim = UDim2.new(TPos.X.Offset, TPos.X.Offset, TPos.Y.Scale + 0.37, TPos.Y.Offset)
	local NewDescription = istextbox and Instance.new("TextBox") or Instance.new("TextLabel")
	NewDescription.Parent = NewFrame
	NewDescription.Name = "Description_Frame"
	NewDescription.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	NewDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewDescription.BorderSizePixel = istextbox and 1 or 0
	NewDescription.ZIndex = 1
	NewDescription.BorderMode = istextbox and Enum.BorderMode.Inset or Enum.BorderMode.Outline
	NewDescription.Active = true
	NewDescription.Size = UDim2.new(0, 255, 0, 32)
	NewDescription.Font = Enum.Font.SourceSans
	NewDescription.Text = description
	NewDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
	NewDescription.TextScaled = true
	NewDescription.TextWrapped = true
	NewDescription.TextSize = 14.000
	NewDescription.Position = TextUdim
	local TOGButton = Instance.new("ImageButton")
	TOGButton.Name = "TOGButton"
	TOGButton.Parent = NewFrame
	TOGButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TOGButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TOGButton.BorderSizePixel = 0
	TOGButton.Position = UDim2.new(0.889166713, 0, 0.370000005, 0)
	TOGButton.Size = UDim2.new(0, 32, 0, 32)
	if defaultvalue == true then
		TOGButton.Image = "rbxassetid://375691700"
	elseif defaultvalue == false then
		TOGButton.Image = "rbxassetid://5100484851"
	elseif defaultvalue == "click" then
		TOGButton.Image = "rbxassetid://11255462876"
	end
	if istextbox then
		NewDescription.Text = ""; NewDescription.PlaceholderText = description
		TOGButton.Activated:Connect(function()
			toggle(NewDescription.Text)
		end)
	else
		TOGButton.Activated:Connect(function()
			local value = toggle()
			if value then
				TOGButton.Image = "rbxassetid://375691700"
			else
				TOGButton.Image = "rbxassetid://5100484851"
			end
		end)
	end
end

DraggifyFrame(MainFrame, TopBar)

-- Minimize Button
MinimizeButton.Activated:Connect(function()
	if CMDS_Frame.Visible == false and not Toggles_Frame.Visible then
		CMDS_Frame.Visible = true
		SettingButton.Visible = true
		Toggles_Frame.Visible = false
		MainFrame.Size = UDim2.new(0, 295, 0, 270)
		ExecBar.Visible = true
		TopBar.Position = UDim2.new(0, 0, 0, 0)
		ExecBar.Position = UDim2.new(0, 0, 1, -27)
		ExecBar.PlaceholderText = "> Search / Execute <"
	else
		Toggles_Frame.Visible = false
		CMDS_Frame.Visible = false
		SettingButton.Visible = false

		MainFrame.Size = UDim2.new(0, 295, 0, 49)
		TopBar.Position = UDim2.new(0, 0, 0, 0)
		ExecBar.Position = UDim2.new(0, 0, 0, 22)
		ExecBar.Visible = true
		ExecBar.PlaceholderText = "> CommandBar <"
	end
end)

local savedClosedFramePosition = UDim2.new(0.499449551, 0, 0.128650904, 0)

CloseButton.Activated:Connect(function()
	MainFrame.Visible = false
	ExecBar.TextEditable = false

	local ClosedFrame = Instance.new("Frame")
	ClosedFrame.Name = "ClosedFrame"
	ClosedFrame.Parent = PLAdmin
	ClosedFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ClosedFrame.BackgroundTransparency = 1
	ClosedFrame.Position = savedClosedFramePosition
	ClosedFrame.Size = UDim2.new(0, 53, 0, 52)
	ClosedFrame.Active = true

	local function isOnScreen()
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local absPos = ClosedFrame.AbsolutePosition
		local absSize = ClosedFrame.AbsoluteSize
		
		if absPos.X + absSize.X < 0 or absPos.X > viewportSize.X or
		   absPos.Y + absSize.Y < 0 or absPos.Y > viewportSize.Y then
			return false
		end
		return true
	end

	task.wait()
	if not isOnScreen() then
		ClosedFrame.Position = UDim2.new(0.499449551, 0, 0.128650904, 0)
		savedClosedFramePosition = ClosedFrame.Position
	end

	local ClosedImageButton = Instance.new("ImageButton")
	ClosedImageButton.Name = "TextButton"
	ClosedImageButton.Parent = ClosedFrame
	ClosedImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ClosedImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClosedImageButton.BackgroundTransparency = 1.000
	ClosedImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClosedImageButton.BorderSizePixel = 0
	ClosedImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	ClosedImageButton.Size = UDim2.new(1, 0, 1, 0)
	ClosedImageButton.Image = "rbxassetid://101782461395138"
	ClosedImageButton.ImageTransparency = 0.170

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 1)
	UICorner.Parent = ClosedImageButton

	DraggifyFrame(ClosedFrame, ClosedImageButton)

	local isDragging = false
	local dragStartPos

	ClosedImageButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isDragging = false
			dragStartPos = input.Position
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragStartPos and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = (input.Position - dragStartPos).Magnitude
			if delta > 5 then
				isDragging = true
			end
		end
	end)

	local con
	con = ClosedImageButton.Activated:Connect(function()
		if not isDragging then
			savedClosedFramePosition = ClosedFrame.Position
			
			con:Disconnect()
			ClosedFrame:Destroy()
			MainFrame.Visible = true
			ExecBar.TextEditable = true
		end
		isDragging = false
		dragStartPos = nil
	end)
end)

-- Settings Button
SettingButton.Activated:Connect(function()
	if CMDS_Frame.Visible == true then
		CMDS_Frame.Visible = false;Toggles_Frame.Visible = true;ExecBar.PlaceholderText = "> Search Settings <"
	else
		Toggles_Frame.Visible = false;CMDS_Frame.Visible = true;ExecBar.PlaceholderText = "> Seach / Execute <"
	end
end)

-- Execution Bar
ExecBar:GetPropertyChangedSignal("Text"):Connect(function()
	CMDS_Frame.CanvasPosition = Vector2.new(0, 0)
	local searchQuery = ExecBar.Text:lower()
	local filteredLabels, otherLabels = {}, {}

	for _, label in pairs(CMDS_Frame:GetChildren()) do
		if label:IsA("Frame") then
			local cmdName = label:FindFirstChild("CMD_Name")
			local categoryName = label:FindFirstChild("Category_Frame")

			if cmdName and cmdName.Text:lower():find(searchQuery) then
				table.insert(filteredLabels, label)
			elseif categoryName and categoryName.Text:lower():find(searchQuery) then
				table.insert(filteredLabels, label)
			else
				table.insert(otherLabels, label)
			end
		elseif label:IsA("TextLabel") or label:IsA("TextButton") then
			if label.Text:lower():find(searchQuery) then
				table.insert(filteredLabels, label)
			else
				table.insert(otherLabels, label)
			end
		end
	end

	for _, tog in pairs(Toggles_Frame:GetChildren()) do
		if tog:IsA("Frame") then
			local togName = tog:FindFirstChild("TOG_Name")
			if togName and togName.Text:lower():find(searchQuery) then
				table.insert(filteredLabels, tog)
			else
				table.insert(otherLabels, tog)
			end
		end
	end

	for i, label in ipairs(filteredLabels) do
		label.Visible = true
		label.LayoutOrder = i
	end
	for i, label in ipairs(otherLabels) do
		label.Visible = false
		label.LayoutOrder = #filteredLabels + i
	end
end)

-- GUI FUNCTION LIST END


-- NOTIFICATIONS --
-- Notification Stuff
local Frame23 = PLAdmin:FindFirstChild("NotifContainer") or Instance.new("Frame")
Frame23.Name = "NotifContainer"
Frame23.Parent = PLAdmin
Frame23.Transparency = 1
Frame23.AnchorPoint = Vector2.new(1, 1)
Frame23.Position = UDim2.new(0.98, 0, 0.95, 0) 
Frame23.Size = UDim2.new(0, 300, 0, 500)

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
	notif.Size = UDim2.new(1, 0, 0, 0)
	notif.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	notif.BackgroundTransparency = 1
	notif.BorderSizePixel = 0
	notif.ClipsDescendants = true
	notif.Parent = Frame23
	notif.LayoutOrder = tick()

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = notif

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 1.2
	stroke.Transparency = 1
	stroke.Parent = notif

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
	desc.TextSize = 12
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
	Services.tweenservice:Create(notif, tweenInfo, {Size = UDim2.new(1, 0, 0, 75), BackgroundTransparency = 0.2}):Play()
	Services.tweenservice:Create(stroke, tweenInfo, {Transparency = 0.8}):Play()
	Services.tweenservice:Create(image, tweenInfo, {ImageTransparency = 0}):Play()
	Services.tweenservice:Create(title, tweenInfo, {TextTransparency = 0}):Play()
	Services.tweenservice:Create(desc, tweenInfo, {TextTransparency = 0.2}):Play()

	-- Progress
	local progressTween = Services.tweenservice:Create(pBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
	progressTween:Play()

	-- Close
	task.delay(duration, function()
		local closeTween = Services.tweenservice:Create(notif, tweenInfo, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1})
		Services.tweenservice:Create(stroke, tweenInfo, {Transparency = 1}):Play()
		Services.tweenservice:Create(title, tweenInfo, {TextTransparency = 1}):Play()
		Services.tweenservice:Create(desc, tweenInfo, {TextTransparency = 1}):Play()
		Services.tweenservice:Create(image, tweenInfo, {ImageTransparency = 1}):Play()
		
		closeTween:Play()
		closeTween.Completed:Connect(function()
			notif:Destroy()
		end)
	end)
end
-- Notification Stuff
-- NOTIFICATIONS --

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

local connections = {};
local LocPL = {
}

-- DEBUG --
-- Debug functions
local Debug = {
  deprint = function(args)
	if PrizzSettings.Debug.Active and PrizzSettings.Debug.Prints then
		print(args)
	end
end;
  dewarn = function(args)
	if PrizzSettings.Debug.Active and PrizzSettings.Debug.Warns then
		warn(args)
	end
end;
}
-- DEBUG --


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
-- LIGHT FUNCTIONS --

-- COMMANDS FUNCTIONS --
local chatdebounce = false
local OnCommand = function(text)
	local Args = text:split(" ")
	if not Args[1] then
		chatdebounce = nil
		return
	end
	if Args[1] == "/e" or Args[1] == "/c" or Args[1] == "/t" or Args[1] == "/" then
		table.remove(Args, 1)
	end
	if Args[1] == "/w" then
		table.remove(Args, 1)
		if Args[2] then
			table.remove(Args, 1)
		end
	end
	if Args[1] == "/revert" or Args[1] == Variables.CurrentPrefix .. "/revert" then
		Variables.CurrentPrefix = "?"; MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		savedClosedFramePosition = UDim2.new(0.499449551, 0, 0.128650904, 0)
		if not MainFrame.Visible then
			MainFrame.Visible = true; PLAdmin:FindFirstChild("TextButton"):Destroy()
		end
	end
	if not (Args[1]:sub(1, #Variables.CurrentPrefix) == Variables.CurrentPrefix) then
		chatdebounce = nil
		return
	end
	local function cmd(args)
		return args == Args[1]:sub(#Variables.CurrentPrefix+1):lower()
	end
	if cmd("revert") or cmd("resetgui") or cmd("rvgui") then
	    Variables.CurrentPrefix = "?"; MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		savedClosedFramePosition = UDim2.new(0.499449551, 0, 0.128650904, 0)
		if not MainFrame.Visible then
			MainFrame.Visible = true; PLAdmin:FindFirstChild("TextButton"):Destroy()
			Debug.deprint("Success", "Successfully reverted the GUI")
		end
      elseif cmd("inmate") or cmd("inmates") or cmd("in") then
	    if #Services.teams.Inmates:GetPlayers() > 6 then
			Notif("Error", "Inmates team full!")
			return
		end
		LightFunctions.ChangeTeam("Inmates")
		Notif("OK", "Changed team to inmate.")
	elseif cmd("guard") or cmd("guards") or cmd("gu") then
		if #Services.teams.Guards:GetPlayers() > 6 then
			Notif("Error", "Guards team full!")
			return
		end
		LightFunctions.ChangeTeam("Guards")
		Notif("OK", "Changed team to guard.")
	elseif cmd("criminal") or cmd("criminals") or cmd("crim") then
		LightFunctions.ChangeTeam("Criminals")
		Notif("OK", "Changed team to criminal.")
	elseif cmd("neutral") or cmd("neutrals") or cmd("ne") then
		LightFunctions.ChangeTeam("Neutral")
		Notif("OK", "Changed team to neutral.")
    elseif cmd("unload") then
	    CoreFunctions.UnloadScript()
	return
	elseif cmd("mp") or cmd("mp5") then
	    LightFunctions.GiveGun("MP5")
	elseif cmd("ak") or cmd("ak47") or cmd("ak-47") then
		LightFunctions.GiveGun("AK47")
	elseif cmd("remington") or cmd("shotgun") or cmd("rem") then
	    if game.Players.LocalPlayer.Team.Name == "Guards" then
		LightFunctions.GiveGun("RemingtonGuards")
		elseif game.Players.LocalPlayer.Team.Name == "Inmates" then
		LightFunctions.GiveGun("RemingtonGuards")
		elseif game.Players.LocalPlayer.Team.Name == "Criminals" then 
		LightFunctions.GiveGun("RemingtonCrim")
		end
	elseif cmd("m4") or cmd("m4a1") then
			LightFunctions.GiveGun("M4A1")
	elseif cmd("fal") then
			LightFunctions.GiveGun("FAL")
	elseif cmd("sniper") or cmd("m700") then
			LightFunctions.GiveGun("Sniper")
	elseif cmd("revolver") or cmd("pistol") then
			LightFunctions.GiveGun("Revolver")
	else
		Notif("Error", tostring(Args[1]) .. " is not a valid command.")
	end
end

-- Chat Commands function
Variables.player.Chatted:Connect(function(text)
	if not chatdebounce then
		chatdebounce = true
		local success, errors = pcall(function()
			OnCommand(text)
	end);
	    if not success then
			Debug.dewarn("PrizzLife_Error: " .. tostring(errors))
		end
		  task.wait(0.6)
		  chatdebounce = nil
   end
end)


ExecBar.FocusLost:Connect(function(enterPressed, inputObj)
	if ExecBar.Text == "" then
		return
	end
	if enterPressed then
		local success, errors = pcall(function()
			if string.sub(ExecBar.Text, 0, 1) == Variables.CurrentPrefix then
				OnCommand(ExecBar.Text)
			else
				OnCommand(Variables.CurrentPrefix .. ExecBar.Text)
			end
		end)
		if not success then
		Debug.dewarn("PrizzLife_Error: " .. tostring(errors) .. ".")
		end
		task.wait()
		ExecBar.Text = ""
	end
end)
-- COMMANDS FUNCTIONS --


-- COMMANDS LIST --
AddList("Command List", "If you accidentally lose the gui, type /revert in chat", true)
AddList("unload", "Unloads the script", false)
AddList("revert / resetgui / rvgui", "Resets the Main GUI, and Toggle button positions ", false)
AddList("prefix [Prefix]", "Changes prefix (Default set to " .. PrizzSettings.DefaultPrefix .. ")", false) --V
AddList("discord / support / help", "Get the discord invite", false)
AddList("github / git", "Get the GitHub link for the project.", false)
AddList("ITEMS/GUNS/MOD CMDS", false, true) -- ITEMS AND GUNS COMMANDS
AddList("mp / mp5", "Obtain the gun MP5", false) --V
AddList("ak / ak47", "Obtain the gun AK-47", false) --V
AddList("remington / shotgun / rem", "Obtain the gun Remington 870", false) --V
AddList("m4 / m4a1", "Obtain the gun M4A1 (REQUIRES GAMEPASS)", false) --V
AddList("fal", "Obtain the gun FAL (REQUIRES GAMEPASS)", false) --V
AddList("sniper / m700", "Obtain the gun Sniper (REQUIRES GAMEPASS)", false) --V
AddList("revolver / pistol", "Obtain the gun Revolver (REQUIRES GAMEPASS)", false) --V
if (PrizzSettings.ACBypass or (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass)) then
  AddList("TEAM CMDS", false, true) --TEAM CMDS
  AddList("guard / guards / gu", "Alias to team guards", false) --V
  AddList("inmate / inmates / in", "Alias to team inmates", false) --V
  AddList("criminal / criminals / cr", "Alias to team criminals", false) --V
  AddList("neutral / neutrals / ne", "Alias to team neutrals", false) --V
  else
    AddList("TEAM CMDS (DISABLED)", false, true) --TEAM CMDS
end
--NewToggleList("LocalPlayer_RunSpeed", "Default value is: 24", "click", function(arg)
		--local str = tonumber(arg)
		--Saved.RunSpeed = str
--end, true)
--NewToggleList("ScriptSetting_AntiTase", "Enable, or disable antitase functions.", PrizzSettings.AntiTase, function()
		--PrizzSettings.AntiTase = not PrizzSettings.AntiTase
		--Notif("Changed", "Toggled AntiTase to " .. tostring(PrizzSettings.AntiTase) .. ".")
		--return PrizzSettings.AntiTase
--end)
NewToggleList("ScriptSetting_Debug", "Enable, or disable debug functions.", PrizzSettings.Debug, function()
		PrizzSettings.Debug = not PrizzSettings.Debug
		Notif("Changed", "Toggled Debug to " .. tostring(PrizzSettings.Debug) .. ".")
		return PrizzSettings.Debug
end)
-- COMMANDS LIST --


-- GUIS --
local PLINIT = Instance.new("ScreenGui")
PLINIT.Name = "PLADMIN_INITIALS"
PLINIT.Parent = game:GetService("CoreGui")
PLINIT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if (PrizzSettings.ACBypass or (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass)) then

local data1, data2, data3 =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nivalos0/PrizzLife/refs/heads/main/Init/TeamGuiRemake.lua"))()

local TeamFrame = data1
local CreditsFrame = data2
local TEAMs = data3

-- Buttons
local InmateBtn = TeamFrame:FindFirstChild("InmateBtn")
local GuardBtn = TeamFrame:FindFirstChild("GuardBtn")
local CrimBtn = TeamFrame:FindFirstChild("CrimBtn")
-- Buttons

InmateBtn.Activated:Connect(
    function()
        if #Services.teams.Inmates:GetPlayers() > 7 then
            Notif("Cannot join team.", "Inmates team is full!", 6)
        else
          CoreFunctions.TeamFunction("Inmates", false)
  end
end)

GuardBtn.Activated:Connect(
    function()
        if #Services.teams.Guards:GetPlayers() > 7 then
            Notif("Cannot join team.", "Guards team is full!", 6)
        else
          CoreFunctions.TeamFunction("Guards", false)
    end
end)

CrimBtn.Activated:Connect(
    function()
      local plr = Services.players.LocalPlayer
      local char = plr.Character
      local hrp = char.HumanoidRootPart
      if #Services.teams.Inmates:GetPlayers() > 7 then
            Notif("Cannot join team.", "Inmates team is full!", 6)
      else
        CoreFunctions.TeamFunction("Inmates", false)
        task.wait(0.5)
        local hrp = Services.players.LocalPlayer.Character.HumanoidRootPart
        hrp.CFrame = Positions.CrimPos
    end
  end
)

TeamChangeConnect =
    Services.players.LocalPlayer:GetPropertyChangedSignal("Team"):Connect(
    function()
        if Services.players.LocalPlayer.Team and Services.players.LocalPlayer.Team.Name == "Neutral" then
            TeamFrame.Visible = true
            CreditsFrame.Visible = true
        else
            TeamFrame.Visible = false
            CreditsFrame.Visible = false
        end
    end
)

TeamFrame.Visible = Services.players.LocalPlayer.Team.Name == "Neutral"
CreditsFrame.Visible = Services.players.LocalPlayer.Team.Name == "Neutral"
-- GUIS --
else
    Notif("Warning", "Team change functions, and GUI's are automatically disabled to prevent bans.")
  return
end

  if PrizzSettings.Debug then
print("hi")
    end

-- SHITTY EXECUTOR DETECTION --
local ExecTests = {
  CLIPA =
    setclipboard or toclipboard or (Clipboard and Clipboard.set);
    HTTPA =
    (syn and syn.request) or (http and http.request) or http_request or request;
    GCA = getconnections ~= nil;
}

-- Test #1
if not ExecTests.CLIPA or not ExecTests.HTTPA or not ExecTests.GCA then
    Notif("Your executor might be too shitty!", "Some of this script might not work for you!", 6)
    PrizzSettings.ShittyExecutor = true;
end

-- Notification
if PrizzSettings.ShittyExecutor then
  Notif("Shitty Executor", "Use Ronix Windows, or use Delta if your on iOS, or Android")
  else
    --Notif("Good Executor", "You have a good executor!")
end
-- SHITTY EXECUTOR DETECTION --


-- COOL --
-- Debug Notifications --
if PrizzSettings.Debug.Active then
  if PrizzSettings.Debug.ShowNotification then
    if (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass and PrizzSettings.Debug.Warns and PrizzSettings.Debug.Prints) then
  Notif("Settings", "Debug Mode is currently active, and all Debug features are active")
    elseif PrizzSettings.Debug.Active and PrizzSettings.Debug.Prints then
  Notif("Settings", "Debug Mode is currently active, and Prints are enabled.")
    elseif (PrizzSettings.Debug.Active and PrizzSettings.Debug.Warns) then
  Notif("Settings", "Debug Mode is currently active, and Warns are enabled.")
    elseif (PrizzSettings.Debug.Active and PrizzSettings.Debug.ACBypass) then
  Notif("Settings", "Debug Mode is currently active, and the AntiCheat Bypass is enabled")
    else
    
    end
  end
end
-- Debug Notifications --

-- Time it took to load.
Notif("Time", "Loaded in " .. tostring(tick() - runtime) .. " second(s).", 6)
-- COOL --

--[[
Vlaair tried to silence me. He warned me for "Advertising a shitscript", and he literally just shut down the original server.
--]]