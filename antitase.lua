local TaseEve = game:GetService("ReplicatedStorage").GunRemotes.PlayerTased;

for _, connection in
pairs(getconnections(TaseEve.OnClientEvent)) do
    connection:Disable()
end