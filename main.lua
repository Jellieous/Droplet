--[[

    local Droplet = {
        Name = "Droplet",
        Parent = "Jellieous"
    }

]]--

--[[ Checking Dependencies ]]--

repeat task.wait() until game:IsLoaded() == true

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local clipboardset = syn and syn.write_clipboard or setclipboard or set_clipboard or write_clipboard or function() end
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
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
    Library:MakeNotification({
        Name = "Droplet",
        Content = "Exploit is not compatible.",
        Image = "droplet",
        Time = 5
    })
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

local Window = Library:MakeWindow({
    Name = "Droplet",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Droplet/Configs",
    IntroEnabled = true,
    IntroText = "Preparing",
    IntroIcon = "droplet",
    Icon = "droplet"
})

local Main = Window:MakeTab({
    Name = "Droplet",
    Icon = "droplet",
    PremiumOnly = false
})

local Credits = Main:AddSection({
    Name = "Credits"
})

local Friends = Main:AddSection({
    Name = "Friends"
})

Credits:AddParagraph("About Droplet", "Droplet is a lightweight roblox script developed for effectivity and simplicity.")
Credits:AddParagraph("Droplet Credits", "Droplet is developed by Jellieous.")

local PlayersTable = function()
    local Table = {}
    for i,v in pairs(Players:GetPlayers()) do
        table.insert(Table, v.Name)
    end
    return Table
end

for i,v in pairs(game.CoreGui.Orion:GetDescendants()) do
    if v:IsA("TextLabel") then
        v.RichText = true
        if v.TextColor3 == Color3.fromRGB(150, 150, 150) then
            if Player.Name == "Jellieous" and Player.UserId == 3606660377 then
                v.Text = "Developer"
            end
        end
    else
        break
    end
end


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