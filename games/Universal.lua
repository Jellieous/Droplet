local Library = shared.Droplet.Library
local Window = shared.Droplet.Window

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character.Humanoid

local PlayersTable = function()
    local Table = {}
    for i,v in pairs(Players:GetPlayers()) do
        if v.Name ~= Player.Name then
            table.insert(Table, v.DisplayName .. " (@" .. v.Name .. ")")
        end
    end
    return Table
end

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

local DDTeleport = Movement:Dropdown("Teleport", PlayersTable(), "None", nil, function(Value)
    if not Value == "None" then
        Character.HumanoidRootPart.CFrame = workspace[Value].HumanoidRootPart.CFrame
    end
end)

game.Players.PlayerAdded:Connect(function()
    DDTeleport:Refresh(PlayersTable(), true)
end)
game.Players.PlayerRemoving:Connect(function()
    DDTeleport:Refresh(PlayersTable(), true)
end)