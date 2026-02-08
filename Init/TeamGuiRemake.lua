-- New Team GUI

local LMG2L = {};

LMG2L["TeamGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["TeamGui_1"]["Name"] = [[TeamGui]];
LMG2L["TeamGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


LMG2L["TeamFrame_2"] = Instance.new("Frame", LMG2L["TeamGui_1"]);
LMG2L["TeamFrame_2"]["BorderSizePixel"] = 0;
LMG2L["TeamFrame_2"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
LMG2L["TeamFrame_2"]["Size"] = UDim2.new(0.57228, 0, 0.24899, 0);
LMG2L["TeamFrame_2"]["Position"] = UDim2.new(0.21123, 0, 0.73565, 0);
LMG2L["TeamFrame_2"]["Name"] = [[TeamFrame]];


LMG2L["GuardBtn_3"] = Instance.new("TextButton", LMG2L["TeamFrame_2"]);
LMG2L["GuardBtn_3"]["BorderSizePixel"] = 0;
LMG2L["GuardBtn_3"]["TextSize"] = 18;
LMG2L["GuardBtn_3"]["TextColor3"] = Color3.fromRGB(0, 122, 255);
LMG2L["GuardBtn_3"]["BackgroundColor3"] = Color3.fromRGB(0, 6, 103);
LMG2L["GuardBtn_3"]["Size"] = UDim2.new(0.30901, 0, 0.81818, 0);
LMG2L["GuardBtn_3"]["Text"] = [[GUARD]];
LMG2L["GuardBtn_3"]["Name"] = [[GuardBtn]];
LMG2L["GuardBtn_3"]["Position"] = UDim2.new(0.02146, 0, 0.09091, 0);


LMG2L["UICorner_4"] = Instance.new("UICorner", LMG2L["GuardBtn_3"]);
LMG2L["UICorner_4"]["CornerRadius"] = UDim.new(0, 20);


LMG2L["UICorner_5"] = Instance.new("UICorner", LMG2L["TeamFrame_2"]);
LMG2L["UICorner_5"]["CornerRadius"] = UDim.new(0, 15);


LMG2L["InmateBtn_6"] = Instance.new("TextButton", LMG2L["TeamFrame_2"]);
LMG2L["InmateBtn_6"]["BorderSizePixel"] = 0;
LMG2L["InmateBtn_6"]["TextSize"] = 18;
LMG2L["InmateBtn_6"]["TextColor3"] = Color3.fromRGB(255, 145, 0);
LMG2L["InmateBtn_6"]["BackgroundColor3"] = Color3.fromRGB(182, 95, 16);
LMG2L["InmateBtn_6"]["Size"] = UDim2.new(0.30901, 0, 0.81818, 0);
LMG2L["InmateBtn_6"]["Text"] = [[INMATE]];
LMG2L["InmateBtn_6"]["Name"] = [[InmateBtn]];
LMG2L["InmateBtn_6"]["Position"] = UDim2.new(0.34335, 0, 0.09091, 0);


LMG2L["UICorner_7"] = Instance.new("UICorner", LMG2L["InmateBtn_6"]);
LMG2L["UICorner_7"]["CornerRadius"] = UDim.new(0, 20);


LMG2L["CrimBtn_8"] = Instance.new("TextButton", LMG2L["TeamFrame_2"]);
LMG2L["CrimBtn_8"]["BorderSizePixel"] = 0;
LMG2L["CrimBtn_8"]["TextSize"] = 18;
LMG2L["CrimBtn_8"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
LMG2L["CrimBtn_8"]["BackgroundColor3"] = Color3.fromRGB(135, 22, 0);
LMG2L["CrimBtn_8"]["Size"] = UDim2.new(0.30901, 0, 0.81818, 0);
LMG2L["CrimBtn_8"]["Text"] = [[CRIMINAL]];
LMG2L["CrimBtn_8"]["Name"] = [[CrimBtn]];
LMG2L["CrimBtn_8"]["Position"] = UDim2.new(0.66953, 0, 0.09091, 0);


LMG2L["UICorner_9"] = Instance.new("UICorner", LMG2L["CrimBtn_8"]);
LMG2L["UICorner_9"]["CornerRadius"] = UDim.new(0, 20);


LMG2L["UIAspectRatioConstraint_a"] = Instance.new("UIAspectRatioConstraint", LMG2L["TeamFrame_2"]);
LMG2L["UIAspectRatioConstraint_a"]["AspectRatio"] = 5.29545;


LMG2L["CreditsFrame_b"] = Instance.new("Frame", LMG2L["TeamGui_1"]);
LMG2L["CreditsFrame_b"]["BorderSizePixel"] = 0;
LMG2L["CreditsFrame_b"]["BackgroundColor3"] = Color3.fromRGB(65, 65, 65);
LMG2L["CreditsFrame_b"]["Size"] = UDim2.new(0.52561, 0, 0.23201, 0);
LMG2L["CreditsFrame_b"]["Position"] = UDim2.new(0.23825, 0, -0.14713, 0);
LMG2L["CreditsFrame_b"]["Name"] = [[CreditsFrame]];


LMG2L["Ellie_c"] = Instance.new("TextLabel", LMG2L["CreditsFrame_b"]);
LMG2L["Ellie_c"]["BorderSizePixel"] = 0;
LMG2L["Ellie_c"]["TextSize"] = 18;
LMG2L["Ellie_c"]["BackgroundColor3"] = Color3.fromRGB(146, 146, 146);
LMG2L["Ellie_c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["Ellie_c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Ellie_c"]["BackgroundTransparency"] = 1;
LMG2L["Ellie_c"]["Size"] = UDim2.new(0.97196, 0, 0.2439, 0);
LMG2L["Ellie_c"]["Text"] = [[We love, and miss you Ellie!❤️🕊️]];
LMG2L["Ellie_c"]["Name"] = [[Ellie]];
LMG2L["Ellie_c"]["Position"] = UDim2.new(0.01168, 0, 0.03659, 0);


LMG2L["UICorner_d"] = Instance.new("UICorner", LMG2L["CreditsFrame_b"]);



LMG2L["PrizzText_e"] = Instance.new("TextLabel", LMG2L["CreditsFrame_b"]);
LMG2L["PrizzText_e"]["BorderSizePixel"] = 0;
LMG2L["PrizzText_e"]["TextSize"] = 14;
LMG2L["PrizzText_e"]["BackgroundColor3"] = Color3.fromRGB(95, 95, 95);
LMG2L["PrizzText_e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
LMG2L["PrizzText_e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["PrizzText_e"]["Size"] = UDim2.new(0.38785, 0, 0.58537, 0);
LMG2L["PrizzText_e"]["Text"] = [[PrizzLife ReImagined]];
LMG2L["PrizzText_e"]["Name"] = [[PrizzText]];
LMG2L["PrizzText_e"]["Position"] = UDim2.new(0.29907, 0, 0.31707, 0);


LMG2L["UICorner_f"] = Instance.new("UICorner", LMG2L["PrizzText_e"]);
LMG2L["UICorner_f"]["CornerRadius"] = UDim.new(0, 10);


LMG2L["UIAspectRatioConstraint_10"] = Instance.new("UIAspectRatioConstraint", LMG2L["CreditsFrame_b"]);
LMG2L["UIAspectRatioConstraint_10"]["AspectRatio"] = 5.21951;



return LMG2L["TeamGui_1"], require;