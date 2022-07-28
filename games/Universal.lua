local Library = shared.Droplet.Library
local Window = shared.Droplet.Window

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character.Humanoid

local Main = Window:Tab("Main")

local Movement = Main:Section("Movement")
local Visuals = Main:Section("Visuals")
local Misc = Main:Section("Misc")

Movement:Slider("Walkspeed", 16, 256, 16, 1, "Walkspeed", function(Value)
    Humanoid.WalkSpeed = Value
end)

Movement:Slider("Jumppower", 50, 500, 50, 1, "Jumppower", function(Value)
    Humanoid.JumpPower = Value
end)

Movement:Textbox("Teleport", true, callback(Value)
    for i,v in pairs(Players:GetPlayers()) do
        if v.Name == Value then
            Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        elseif v.DisplayName == Value then
            Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        end
    end
end)