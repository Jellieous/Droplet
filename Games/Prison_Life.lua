local Library = shared.Droplet.Library
local Window = shared.Droplet.Window

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character.Humanoid

local Combat = Window:MakeTab({
    Name = "Combat",
    Icon = "shield",
    PremiumOnly = false
})

local Movement = Window:MakeTab({
    Name = "Movement",
    Icon = "fast-forward",
    PremiumOnly = false
})

local Automation = Window:MakeTab({
    Name = "Automation",
    Icon = "cloud-lightning",
    PremiumOnly = false
})

--[[ Combat ]]--

Combat:AddParagraph("Combat", "This section contains various combat related features.")

Combat:AddDropdown({
    Name = "Give Weapon",
    Options = {"M9", "Remington 870", "AK-47"},
    Callback = function(Value)
        local A1 = workspace["Prison_ITEMS"].giver[Value].ITEMPICKUP
        local Event = workspace.Remote.ItemHandler
        Event:InvokeServer(A1)
    end
})

Combat:AddDropdown({
    Name = "Gun Modification  <font color='#808080'>(WIP)</font>",
    Options = {"M9", "Remington 870", "AK-47"},
    Callback = function(Value)
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
    end
})

--[[ Movement ]]--

Movement:AddParagraph("Movement", "Here in the movement tab you can change the movement settings and movement modes for your character.")

Movement:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 256,
    Default = 16,
    ValueName = "WalkSpeed",
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end
})

Movement:AddSlider({
    Name = "JumpPower",
    Min = 16,
    Max = 256,
    Default = 16,
    ValueName = "JumpPower",
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end
})

--[[ Automation ]]--

Automation:AddParagraph("Automation", "Here in the automation tab you enable different features like AutoArrest, AutoKill, etc.")

--[[ Library Init ]]--

Library:Init()