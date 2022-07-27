local Library = shared.Droplet.Library
local Window = shared.Droplet.Window

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character.Humanoid

local Combat = Window:Tab("Combat")
local Movement = Window:Tab("Movement")
local Automation = Window:Tab("Automation")

--[[ Combat ]]--

Combat:Label("This section contains various combat related features.")

Combat:Dropdown("Give Gun", {"M9", "Remington 870", "AK-47"}, "", function(Value) -- may need flag
    local A1 = workspace["Prison_ITEMS"].giver[Value].ITEMPICKUP
    local Event = workspace.Remote.ItemHandler
    Event:InvokeServer(A1)
end)

Combat:Dropdown("Gun Modification  <font color='#808080'>(WIP)</font>", {"M9", "Remington 870", "AK-47"}, function(Value)
    local Module = nil
    if Backpack:FindFirstChild(Value) then
        Module = require(Backpack[Value].GunStates)
    elseif Character:FindFirstChild(Value) then
        Module = require(Character[Value].GunStates)
    end

    if not Module == nil then
        Module["MaxAmmo"] = math.huge
        Module["CurrentAmmo"] = math.huge
        Module["FireRate"] = 0.000001
        Module["Spread"] = 0
        Module["Range"] = math.huge
        Module["AutoFire"] = true
    end
end)

--[[ Movement ]]--

Movement:Label("Here in the movement tab you can change the movement settings and movement modes for your character.")

Movement:Slider("WalkSpeed", 16, 256, 16, 1, "WalkSpeed", function(Value)
    Humanoid.WalkSpeed = Value
end)

Movement:AddSlider("JumpPower", 50, 500, 50, 1, "JumpPower", function(Value)
    Humanoid.JumpPower = Value
end)

--[[ Automation ]]--

Automation:Label("Here in the automation tab you enable different features like AutoArrest, AutoKill, etc.")