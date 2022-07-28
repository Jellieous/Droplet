--[[

    local Droplet = {
        Name = "Droplet",
        Parent = "Jellieous"
    }

]]--

repeat task.wait() until game:IsLoaded() == true

if game.CoreGui:FindFirstChild("Droplet") then
    game.CoreGui.Droplet:Destroy()
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jellieous/Droplet/master/Library.lua"))()

--[[ Checking Dependencies ]]--

local clipboardset = syn and syn.write_clipboard or setclipboard or set_clipboard or write_clipboard or writeclipboard or function() end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end

if not (queueteleport) then
    Library:Notification("Droplet", "Exploit is not compatible.")
    return
end

--[[ Folder/File Checks ]]--

if not (isfolder("droplet")) then
    makefolder("droplet")
    makefolder("droplet/configs")
    makefolder("droplet/games")
    makefolder("droplet/private")
else
    if not (isfolder("droplet/configs")) then
        makefolder("droplet/configs")
    end
    if not (isfolder("droplet/games")) then
        makefolder("droplet/games")
    end
    if not (isfolder("droplet/private")) then
        makefolder("droplet/private")
    end
end

if not isfile("droplet/friends.txt") then
    writefile("droplet/friends.txt", "")
end

--[[ Variables ]]--

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local URL = "https://raw.githubusercontent.com/Jellieous/Droplet/master/"

--[[ Main Script ]]--

Player.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/Jellieous/Droplet/master/main.lua", true))()')
    end
end)

local Window = Library:New({
    Name = "Droplet",
    FolderToSave = "droplet"
})

shared.Droplet = {
    Library = Library,
    Window = Window
}

local games = {
    [286090429] = "Arsenal",
    [4410049285] = "Driving Simulator",
    [13822889] = "Lumber Tycoon",
    [855499080] = "Skywars",
    [189707] = "Natural Disaster Survival",
    [3527629287] = "Big Paintball",
    [8737602449] = "Pls Donate",
    [8750997647] = "Tapping Legends X"
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local Name = games[game.PlaceId] or games[game.GameId]

if shared.Droplet.Private then
    loadstring(readfile("droplet/private/" .. (Name or "Universal") .. ".lua", true))()
else
    loadstring(game:HttpGet(URL .. "games/" .. (Name or "Universal") .. ".lua", true))()
end