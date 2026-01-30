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
local UnloadScript = nil
local Unloaded = false

PLAdmin.Name = "PLAdmin"
PLAdmin.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PLAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PLAdmin.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = PLAdmin
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 155)
MainFrame.Active = true
MainFrame.Visible = false

ScriptName.Name = "ScriptName"
ScriptName.Parent = MainFrame
ScriptName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderSizePixel = 0
ScriptName.Size = UDim2.new(0, 250, 0, 17)
ScriptName.Font = Enum.Font.SourceSans
ScriptName.Text = "  PRIZZLIFE > CMDSLIST"
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 13.000
ScriptName.TextXAlignment = Enum.TextXAlignment.Left

ExecBar.Name = "ExecBar"
ExecBar.Parent = MainFrame
ExecBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ExecBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
ExecBar.BorderSizePixel = 2
ExecBar.Position = UDim2.new(-1.22070318e-07, 0, 0.833333313, 0)
ExecBar.Size = UDim2.new(0, 250, 0, 25)
ExecBar.Font = Enum.Font.SourceSans
ExecBar.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecBar.Text = ""
ExecBar.PlaceholderText = "Command Bar"
ExecBar.TextSize = 14.000
ExecBar.ClearTextOnFocus = false

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.930000007, 0, -0.00100000005, 0)
CloseButton.Size = UDim2.new(0, 19, 0, 17)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14.000

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.850000024, 0, -0.00100000005, 0)
MinimizeButton.Size = UDim2.new(0, 19, 0, 17)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14.000

SettingButton.Name = "SettingButton"
SettingButton.Parent = MainFrame
SettingButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderSizePixel = 0
SettingButton.Position = UDim2.new(0.769999981, 0, -0.00100000005, 0)
SettingButton.Size = UDim2.new(0, 19, 0, 17)
SettingButton.Image = "rbxassetid://11308562716"

Toggles_Frame.Name = "Toggles_Frame"
Toggles_Frame.Parent = MainFrame
Toggles_Frame.Active = true
Toggles_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Toggles_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.BorderSizePixel = 0
Toggles_Frame.Position = UDim2.new(0, 0, 0.104999997, 0)
Toggles_Frame.Size = UDim2.new(0, 250, 0, 111)
Toggles_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.ScrollBarThickness = 4
Toggles_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
Toggles_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Toggles_Frame.ScrollingDirection = Enum.ScrollingDirection.Y
Toggles_Frame.Visible = false

UIListLayout2.Parent = Toggles_Frame
UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Padding = UDim.new(0.0088999978, 0)
UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Top

CMDS_Frame.Name = "CMDS_Frame"
CMDS_Frame.Parent = MainFrame
CMDS_Frame.Active = true
CMDS_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CMDS_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.BorderSizePixel = 0
CMDS_Frame.Position = UDim2.new(0, 0, 0.104999997, 0)
CMDS_Frame.Size = UDim2.new(0, 250, 0, 111)
CMDS_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.ScrollBarThickness = 4
CMDS_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
CMDS_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
CMDS_Frame.ScrollingDirection = Enum.ScrollingDirection.Y

UIListLayout.Parent = CMDS_Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0088999978, 0)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

--Gui functions

local UIS = game:GetService("UserInputService")
function DraggifyFrame(Frame)
    local dragToggle = nil
    local dragSpeed = 0.50
    local dragInput = nil
    local dragStart = nil
    local dragPos = nil
    local startPos = nil
    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), { Position = Position }):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

Instance.new("Folder", game:GetService("Workspace")).Name = "PLADMIN LOADED SUCCESS"
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
local UnloadScript = nil
local Unloaded = false

PLAdmin.Name = "PLAdmin"
PLAdmin.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PLAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PLAdmin.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = PLAdmin
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 295, 0, 185)
MainFrame.Active = true

ScriptName.Name = "ScriptName"
ScriptName.Parent = MainFrame
ScriptName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderSizePixel = 0
ScriptName.Size = UDim2.new(0, 295, 0, 20)
ScriptName.Font = Enum.Font.SourceSans
ScriptName.Text = "PrizzLife v0.8.1"
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 18.000
ScriptName.TextYAlignment = Enum.TextYAlignment.Top
ScriptName.TextWrapped = true

ExecBar.Name = "ExecBar"
ExecBar.Parent = MainFrame
ExecBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ExecBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
ExecBar.BorderSizePixel = 2
ExecBar.Position = UDim2.new(0, 0, 0.852162123, 0)
ExecBar.Size = UDim2.new(0, 295, 0, 27)
ExecBar.ZIndex = 2
ExecBar.Font = Enum.Font.SourceSans
ExecBar.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecBar.Text = ""
ExecBar.PlaceholderText = "> Search / Execute <"
ExecBar.TextSize = 15.000
ExecBar.ClearTextOnFocus = false

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.930000126, 0, -0.00100000738, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 19)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14.000

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.836440682, 0, -0.00100000738, 0)
MinimizeButton.Size = UDim2.new(0, 20, 0, 19)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14.000

SettingButton.Name = "SettingButton"
SettingButton.Parent = MainFrame
SettingButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingButton.BorderSizePixel = 0
SettingButton.Position = UDim2.new(-0.00288127316, 0, -0.0064053922, 0)
SettingButton.Size = UDim2.new(0, 20, 0, 19)
SettingButton.Image = "rbxassetid://11308562716"

Toggles_Frame.Name = "Toggles_Frame"
Toggles_Frame.Parent = MainFrame
Toggles_Frame.Active = true
Toggles_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Toggles_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.BorderSizePixel = 0
Toggles_Frame.Position = UDim2.new(0, 0, 0.105000056, 0)
Toggles_Frame.Size = UDim2.new(0, 295, 0, 137)
Toggles_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Toggles_Frame.ScrollBarThickness = 6
Toggles_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
Toggles_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Toggles_Frame.ScrollingDirection = Enum.ScrollingDirection.Y
Toggles_Frame.Visible = false

UIListLayout2.Parent = Toggles_Frame
UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Padding = UDim.new(0.0088999978, 0)
UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Top

CMDS_Frame.Name = "CMDS_Frame"
CMDS_Frame.Parent = MainFrame
CMDS_Frame.Active = true
CMDS_Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CMDS_Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.BorderSizePixel = 0
CMDS_Frame.Position = UDim2.new(0, 0, 0.105000056, 0)
CMDS_Frame.Size = UDim2.new(0, 295, 0, 137)
CMDS_Frame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
CMDS_Frame.ScrollBarThickness = 6
CMDS_Frame.ElasticBehavior = Enum.ElasticBehavior.Never
CMDS_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
CMDS_Frame.ScrollingDirection = Enum.ScrollingDirection.Y

UIListLayout.Parent = CMDS_Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0088999978, 0)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

--Gui functions
local DraggifyFrame = function(frame)
    local dragging
    local dragStartPos
    local startPos
    frame.InputBegan:Connect(function(input)
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
        local newCategory = Instance.new("TextLabel")
        newCategory.Name = "Category_Frame"
        newCategory.Parent = CMDS_Frame
        newCategory.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
        newCategory.BorderColor3 = Color3.fromRGB(0, 0, 0)
        newCategory.Size = UDim2.new(0, 288, 0, 20)
        newCategory.Font = Enum.Font.SourceSans
        newCategory.Text = args
        newCategory.TextColor3 = Color3.fromRGB(255, 255, 255)
        newCategory.TextScaled = true
        newCategory.TextSize = 14.000
        newCategory.TextWrapped = true
        return
    end
    local NewFrame = Instance.new("Frame")
    NewFrame.Name = "CMDFrame"
    NewFrame.Parent = CMDS_Frame
    NewFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NewFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NewFrame.Size = UDim2.new(0, 288, 0, 50)
    local TextLabel = Instance.new("TextLabel")
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
    local TPos = TextLabel.Position
    local NewDescription = Instance.new("TextLabel")
    NewDescription.Parent = NewFrame
    NewDescription.Name = "Description_Frame"
    NewDescription.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    NewDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NewDescription.BorderSizePixel = 0
    NewDescription.ZIndex = 1
    NewDescription.BorderMode = Enum.BorderMode.Outline
    NewDescription.Size = UDim2.new(0, 288, 0, 32)
    NewDescription.Font = Enum.Font.SourceSans
    NewDescription.Text = description
    NewDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
    NewDescription.TextScaled = true
    NewDescription.TextWrapped = true
    NewDescription.TextSize = 14.000
    NewDescription.Position = UDim2.new(TPos.X.Offset, TPos.X.Offset, TPos.Y.Scale + 0.37, TPos.Y.Offset)
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
        NewDescription.Text = ""
        NewDescription.PlaceholderText = description
        TOGButton.MouseButton1Click:Connect(function()
            toggle(NewDescription.Text)
        end)
    else
        TOGButton.MouseButton1Click:Connect(function()
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
MinimizeButton.MouseButton1Click:Connect(function()
    if CMDS_Frame.Visible == false and not (Toggles_Frame.Visible == true) then
        CMDS_Frame.Visible = true
        SettingButton.Visible = true
        Toggles_Frame.Visible = false
        MainFrame.Size = UDim2.new(0, 295, 0, 185)
        ExecBar.PlaceholderText = "> Search / Execute <"
    else
        Toggles_Frame.Visible = false
        CMDS_Frame.Visible = false
        SettingButton.Visible = false
        MainFrame.Size = UDim2.new(0, 295, 0, 22)
        ExecBar.PlaceholderText = "> CommandBar <"
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    local TextButton = Instance.new("TextButton")
    TextButton.Parent = PLAdmin
    TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BorderSizePixel = 2
    TextButton.Position = UDim2.new(0.05, 0, 0.5, 0)
    TextButton.Size = UDim2.new(0, 80, 0, 22)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "OPEN"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextSize = 14.000
    local con
    con = TextButton.MouseButton1Click:Connect(function()
        con:Disconnect()
        TextButton:Destroy()
        MainFrame.Visible = true
    end)
end)
SettingButton.MouseButton1Click:Connect(function()
    if CMDS_Frame.Visible == true then
        CMDS_Frame.Visible = false
        Toggles_Frame.Visible = true
        ExecBar.PlaceholderText = "> Search Settings <"
    else
        Toggles_Frame.Visible = false
        CMDS_Frame.Visible = true
        ExecBar.PlaceholderText = "> Seach / Execute <"
    end
end)
ExecBar:GetPropertyChangedSignal("Text"):Connect(function()
    local filteredLabels, otherLabels, searchQuery = {}, {}, ExecBar.Text
    for _, label in pairs(CMDS_Frame:GetChildren()) do
        if label:IsA("Frame") then
            if label:FindFirstChild("CMD_Name").Text:lower():find(searchQuery:lower()) then
                table.insert(filteredLabels, label)
            else
                table.insert(otherLabels, label)
            end
        elseif label:IsA("TextLabel") then
            if label.Text:lower():find(searchQuery:lower()) then
                table.insert(filteredLabels, label)
            else
                table.insert(otherLabels, label)
            end
        end
    end
    for i, tog in pairs(Toggles_Frame:GetChildren()) do
        if tog:IsA("Frame") then
            if tog:FindFirstChild("TOG_Name").Text:lower():find(searchQuery:lower()) then
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