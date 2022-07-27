local Library = shared.Droplet.Library
local Window = shared.Droplet.Window

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character.Humanoid

local Movement = Window:MakeTab({
    Name = "Movement",
    Icon = "fast-forward",
    PremiumOnly = false
})

local Visuals = Window:MakeTab({
    Name = "Visuals",
    Icon = "eye",
    PremiumOnly = false
})

