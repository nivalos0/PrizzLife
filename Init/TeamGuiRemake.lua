local TeamFrame, CreditsFrame, Teams = nil, nil, nil
local CoreGui = game:GetService("CoreGui")
do
	local TeamGui = Instance.new("ScreenGui")
	TeamFrame = Instance.new("Frame")
	local GuardBtn = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")
	local InmateBtn = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local CrimBtn = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	CreditsFrame = Instance.new("Frame")
	local Ellie = Instance.new("TextLabel")
	local UICorner_5 = Instance.new("UICorner")
	local PrizzText = Instance.new("TextLabel")
	local UICorner_6 = Instance.new("UICorner")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

	TeamGui.Name = "TeamGui"
	TeamGui.Parent = CoreGui:WaitForChild("PLADMIN_INITIALS", 69)
	TeamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TeamFrame.Name = "TeamFrame"
	TeamFrame.Parent = TeamGui
	TeamFrame.BorderSizePixel = 0
	TeamFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	TeamFrame.Size = UDim2.new(0.57228, 0, 0.24899, 0)
	TeamFrame.Position = UDim2.new(0.21123, 0, 0.73565, 0)

	GuardBtn.Name = "GuardBtn"
	GuardBtn.Parent = TeamFrame
	GuardBtn.BorderSizePixel = 0
	GuardBtn.TextSize = 18
	GuardBtn.TextColor3 = Color3.fromRGB(0, 122, 255)
	GuardBtn.BackgroundColor3 = Color3.fromRGB(0, 6, 103)
	GuardBtn.Size = UDim2.new(0.30901, 0, 0.81818, 0)
	GuardBtn.Text = "GUARD"
	GuardBtn.Position = UDim2.new(0.02146, 0, 0.09091, 0)

	UICorner.Parent = GuardBtn
	UICorner.CornerRadius = UDim.new(0, 20)

	UICorner_2.Parent = TeamFrame
	UICorner_2.CornerRadius = UDim.new(0, 15)

	InmateBtn.Name = "InmateBtn"
	InmateBtn.Parent = TeamFrame
	InmateBtn.BorderSizePixel = 0
	InmateBtn.TextSize = 18
	InmateBtn.TextColor3 = Color3.fromRGB(255, 145, 0)
	InmateBtn.BackgroundColor3 = Color3.fromRGB(182, 95, 16)
	InmateBtn.Size = UDim2.new(0.30901, 0, 0.81818, 0)
	InmateBtn.Text = "INMATE"
	InmateBtn.Position = UDim2.new(0.34335, 0, 0.09091, 0)

	UICorner_3.Parent = InmateBtn
	UICorner_3.CornerRadius = UDim.new(0, 20)

	CrimBtn.Name = "CrimBtn"
	CrimBtn.Parent = TeamFrame
	CrimBtn.BorderSizePixel = 0
	CrimBtn.TextSize = 18
	CrimBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
	CrimBtn.BackgroundColor3 = Color3.fromRGB(135, 22, 0)
	CrimBtn.Size = UDim2.new(0.30901, 0, 0.81818, 0)
	CrimBtn.Text = "CRIMINAL"
	CrimBtn.Position = UDim2.new(0.66953, 0, 0.09091, 0)

	UICorner_4.Parent = CrimBtn
	UICorner_4.CornerRadius = UDim.new(0, 20)

	UIAspectRatioConstraint.Parent = TeamFrame
	UIAspectRatioConstraint.AspectRatio = 5.29545

	CreditsFrame.Name = "CreditsFrame"
	CreditsFrame.Parent = TeamGui
	CreditsFrame.BorderSizePixel = 0
	CreditsFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
	CreditsFrame.Size = UDim2.new(0.52561, 0, 0.23201, 0)
	CreditsFrame.Position = UDim2.new(0.23825, 0, -0.14713, 0)

	Ellie.Name = "Ellie"
	Ellie.Parent = CreditsFrame
	Ellie.BorderSizePixel = 0
	Ellie.TextSize = 18
	Ellie.BackgroundColor3 = Color3.fromRGB(146, 146, 146)
	Ellie.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Ellie.TextColor3 = Color3.fromRGB(255, 255, 255)
	Ellie.BackgroundTransparency = 1
	Ellie.Size = UDim2.new(0.97196, 0, 0.2439, 0)
	Ellie.Text = "We love, and miss you Ellie!❤️🕊️"
	Ellie.Position = UDim2.new(0.01168, 0, 0.03659, 0)

	UICorner_5.Parent = CreditsFrame

	PrizzText.Name = "PrizzText"
	PrizzText.Parent = CreditsFrame
	PrizzText.BorderSizePixel = 0
	PrizzText.TextSize = 14
	PrizzText.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
	PrizzText.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	PrizzText.TextColor3 = Color3.fromRGB(255, 255, 255)
	PrizzText.Size = UDim2.new(0.38785, 0, 0.58537, 0)
	PrizzText.Text = "PrizzLife ReImagined"
	PrizzText.Position = UDim2.new(0.29907, 0, 0.31707, 0)

	UICorner_6.Parent = PrizzText
	UICorner_6.CornerRadius = UDim.new(0, 10)

	UIAspectRatioConstraint_2.Parent = CreditsFrame
	UIAspectRatioConstraint_2.AspectRatio = 5.21951
end

return TeamFrame, CreditsFrame, Teams
