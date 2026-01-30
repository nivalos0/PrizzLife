-- UI
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
MainFrame.Size = UDim2.new(0, 295, 0, 400)
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
Toggles_Frame.Position = UDim2.new(0, 0, 0.105000056, 0)
Toggles_Frame.Size = UDim2.new(0, 295, 0, 350)
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
CMDS_Frame.Position = UDim2.new(0, 0, 0.105000056, 0)
CMDS_Frame.Size = UDim2.new(0, 295, 0, 350)
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

local DraggifyFrame = function(frame)
	local dragging; local dragStartPos; local startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true; dragStartPos = input.Position; startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end); game:GetService("UserInputService").InputChanged:Connect(function(input)
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

--GUI Connections
DraggifyFrame(MainFrame)

-- Minimize Button
MinimizeButton.Activated:Connect(function()
	if CMDS_Frame.Visible == false and not Toggles_Frame.Visible then
		CMDS_Frame.Visible = true
		SettingButton.Visible = true
		Toggles_Frame.Visible = false
		MainFrame.Size = UDim2.new(0, 295, 0, 400)
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

-- Close Button
CloseButton.Activated:Connect(function()
	MainFrame.Visible = false
	ExecBar.TextEditable = false

	local ClosedImageButton = Instance.new("ImageButton")
	ClosedImageButton.Name = "TextButton"
	ClosedImageButton.Parent = PLAdmin
	ClosedImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ClosedImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClosedImageButton.BackgroundTransparency = 1.000
	ClosedImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClosedImageButton.BorderSizePixel = 0
	ClosedImageButton.Position = UDim2.new(0.499449551, 0, 0.128650904, 0)
	ClosedImageButton.Size = UDim2.new(0, 53, 0, 52)
	ClosedImageButton.Image = "rbxassetid://101782461395138"
	ClosedImageButton.ImageTransparency = 0.170

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 1)
	UICorner.Parent = ClosedImageButton

	local con
	con = ClosedImageButton.Activated:Connect(function()
		con:Disconnect()
		ClosedImageButton:Destroy()
		MainFrame.Visible = true
		ExecBar.TextEditable = true
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