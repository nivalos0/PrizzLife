for i, v in pairs(game.Workspace.Prison_ITEMS.giver:GetChildren()) do
if not (v or not (v.Name == "MP5" and v:IsA("Model") and v.Parent == "giver")) then
  print("Not available")
  else
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
  end
end