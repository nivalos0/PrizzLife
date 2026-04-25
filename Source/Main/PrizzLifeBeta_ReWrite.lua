--[[ PrizzLife V2.0 ReWrite, made by Riotscripter, Nivalos, and Fred.
This is an entire ReWrite

(This hasn't been touched in 3 months, expect some things to be broken.)

-- REWRITE --
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
if game.GameId ~= 73885730 then -- uses universe id now so vc game is also supported
print("Wrong Game, join Prison Life.")
return
end
-- GAME CHECK


-- LOADED CHECK
if workspace:FindFirstChild("PRIZZLIFEADMIN LOADED SUCCESSFULLY") then
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
LoopedCmds = {
AntiTase = false;
AutoGuns = {
FAL = false;
M4A1 = false;
Revolver = false;
MP5 = false;
M700 = false;
AK47 = false;
Remington = false;
};
AutoReload = false;
AutoGunMod = false;
AutoRe = true;
