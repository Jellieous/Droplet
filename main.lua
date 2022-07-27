--[[

    local Droplet = {
        Name = "Droplet",
        Parent = "Jellieous"
    }

]]--


repeat task.wait() until game:IsLoaded() == true

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Jellieous/Droplet/master/Library.lua')))()

if shared.Droplet.Executed == true then
    error("Droplet has already been executed.")
    return
else
    shared.Droplet.Executed = true
end

--[[ Checking Dependencies ]]--

local clipboardset = syn and syn.write_clipboard or setclipboard or set_clipboard or write_clipboard or writeclipboard or function() end
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end
local requestfunc = syn and syn.request or http and http.request or http_request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 

if not (getasset and requestfunc and queueteleport) then
    Library:Notification("Droplet", "Exploit is not compatible.")
    return
end

--[[ Folder/File Checks ]]--

if not (isfolder("Droplet")) then
    makefolder("Droplet")
    makefolder("Droplet/Configs")
    makefolder("Droplet/Games")
else
    if not (isfolder("Droplet/Configs")) then
        makefolder("Droplet/Configs")
    end
    if not (isfolder("Droplet/Games")) then
        makefolder("Droplet/Games")
    end
end

if not isfile("Droplet/friends.txt") then
    writefile("Droplet/friends.txt", "")
end

--[[ Variables ]]--

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local URL = "https://raw.githubusercontent.com/Jellieous/Droplet/master/"

--[[ Main Script ]]--

local Window = Library:New({
    Name = "Droplet",
    FolderToSave = "Droplet/Configs"
})

shared.Droplet = {
    Library = Library,
    Window = Window
}

local Games = {
    [286090429] = "Arsenal",
    [155615604] = "Prison Life",
    [4410049285] = "Driving Simulator",
    [13822889] = "Lumber Tycoon",
    [855499080] = "Skywars",
    [189707] = "Natural Disaster Survival",
    [3527629287] = "Big Paintball",
    [8737602449] = "Pls Donate",
    [8750997647] = "Tapping Legends X"
}

for i,v in next, Games do
    Games[i] = table.concat(v:split(' '), '_')
end

local Name = Games[game.PlaceId] or Games[game.GameId]

loadstring(game:HttpGet(URL .. "Games/" .. (Name or "Universal") .. ".lua", true))()