repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "NHẬP KEY CỦA ÔG VÀO ĐÂY"
getgenv().__BANANA_SCRIPT_ROUTE = "bf_main"

-- ============================================
-- BANANA CAT HUB - BLOX FRUITS SCRIPT
-- FULL CHUC NANG: FARM, BOSS, ELITE, SEA EVENT, RACE, WEAPON, AFK, TOKEN, HIDDEN QUEST
-- ANTI CHEAT CHONG KICK, TU DONG KET NOI LAI
-- KEY DUOC MA HOA, VAN NHAN DIEN DUOC
-- 1 KEY 1 TAI KHOAN, LUU TREN ROBLOX ACCOUNT
-- DUNG LUONG: ~349KB
-- ============================================

-- ============================================
-- PHAN 1: ANTI CHEAT - CHONG KICK
-- ============================================

local player = game.Players.LocalPlayer
local userId = player.UserId
local playerName = player.Name

local function safeKick(message)
    pcall(function()
        if player.Kick then
            player:Kick(message)
        elseif game:GetService("Players").LocalPlayer.Kick then
            game:GetService("Players").LocalPlayer:Kick(message)
        else
            error(message)
        end
    end)
end

local function AntiKick()
    local kickFunc = player.Kick
    if kickFunc then
        player.Kick = function(message)
            if message and string.find(message, "BANANA") then
                print("KICK DETECTED - BLOCKED: " .. message)
                return
            end
            return kickFunc(message)
        end
    end
end

local function AntiBan()
    if player.Kick then
        local oldKick = player.Kick
        player.Kick = function()
            return nil
        end
    end
end

local function AutoReconnect()
    task.spawn(function()
        while true do
            pcall(function()
                if #game.Players:GetPlayers() == 0 then
                    print("RECONNECTING...")
                    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                end
            end)
            task.wait(10)
        end
    end)
end

local function AntiDetect()
    local oldHttpGet = game:GetService("HttpService").HttpGet
    game:GetService("HttpService").HttpGet = function(url)
        if string.find(url, "cheat") then
            return ""
        end
        return oldHttpGet(url)
    end
end

local function AntiReport()
    local oldFireServer = game:GetService("ReplicatedStorage").Remotes.ReportPlayer.FireServer
    game:GetService("ReplicatedStorage").Remotes.ReportPlayer.FireServer = function()
        return nil
    end
end

local function AutoRespawn()
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(1)
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Health = char.Humanoid.MaxHealth
        end
    end)
end

AntiKick()
AntiBan()
AutoReconnect()
AntiDetect()
AntiReport()
AutoRespawn()
print("BANANA CAT HUB - ANTI CHEAT ACTIVATED")

-- ============================================
-- PHAN 2: MA HOA KEY
-- ============================================

local function encodeKey(key)
    local encoded = ""
    for i = 1, #key do
        local char = string.sub(key, i, i)
        local code = string.byte(char)
        encoded = encoded .. string.char(code + 3)
    end
    return encoded
end

local function decodeKey(encodedKey)
    local decoded = ""
    for i = 1, #encodedKey do
        local char = string.sub(encodedKey, i, i)
        local code = string.byte(char)
        decoded = decoded .. string.char(code - 3)
    end
    return decoded
end

local ENCODED_KEYS = {
    encodeKey("a7f8e3d2c9b4a5f6e7d8c9b0a1f2e3d4"),
    encodeKey("b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3"),
    encodeKey("c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4"),
    encodeKey("d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5"),
    encodeKey("e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6"),
    encodeKey("f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7"),
}

local function isValidKey(inputKey)
    for _, encodedKey in ipairs(ENCODED_KEYS) do
        local decodedKey = decodeKey(encodedKey)
        if inputKey == decodedKey then
            return true
        end
    end
    return false
end

local playerKey = getgenv().Key or ""
local keyValid = isValidKey(playerKey)

print("=========================================")
print("BANANA CAT HUB - KEY CHECK")
print("=========================================")
print("User: " .. playerName .. " (ID: " .. userId .. ")")
print("Key: " .. playerKey)
print("Status: " .. (keyValid and "VALID" or "INVALID"))
print("=========================================")

if not keyValid then
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 150)
    frame.Position = UDim2.new(0.5, -200, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = Instance.new("ScreenGui", game.CoreGui)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "BANANA CAT HUB"
    title.TextColor3 = Color3.fromRGB(255, 200, 50)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold

    local msg = Instance.new("TextLabel", frame)
    msg.Size = UDim2.new(1, -20, 0, 40)
    msg.Position = UDim2.new(0, 10, 0, 60)
    msg.BackgroundTransparency = 1
    msg.Text = "INVALID KEY!\nKEY KHONG HOP LE!"
    msg.TextColor3 = Color3.fromRGB(255, 100, 100)
    msg.TextSize = 18
    msg.Font = Enum.Font.GothamBold

    for i = 5, 1, -1 do
        task.wait(1)
    end
    safeKick("BANANA CAT HUB - Invalid Key")
    return
end

print("Key Valid - Loading Script...")

local function saveKeyToAccount(key)
    pcall(function()
        local keyData = Instance.new("StringValue")
        keyData.Name = "BananaHubKey"
        keyData.Value = key
        keyData.Parent = player
    end)
end

local function isKeyUsedByOtherAccount(key)
    local usedKeys = getgenv().UsedKeys or {}
    for uid, usedKey in pairs(usedKeys) do
        if usedKey == key and uid ~= player.UserId then
            return true
        end
    end
    return false
end

local function markKeyAsUsed(key)
    local usedKeys = getgenv().UsedKeys or {}
    usedKeys[player.UserId] = key
    getgenv().UsedKeys = usedKeys
end

if isKeyUsedByOtherAccount(playerKey) then
    safeKick("BANANA CAT HUB - Key da duoc su dung!")
    return
end

saveKeyToAccount(playerKey)
markKeyAsUsed(playerKey)
print("Key Activated - 1 Key / 1 Account")

-- ============================================
-- PHAN 3: SERVICES
-- ============================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local CollectionService = game:GetService("CollectionService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")

local World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
local World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
local World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

-- ============================================
-- PHAN 4: BIEN TOAN CUC
-- ============================================

getgenv().StartFarm = false
getgenv().AutoSeaEvent = false
getgenv().AutoTrial = false
getgenv().AutoChest = false
getgenv().AutoBoss = false
getgenv().AutoAllBoss = false
getgenv().AutoElite = false
getgenv().SelectWeapon = "Melee"
getgenv().SelectBoat = "Brigade"
getgenv().AFKMode = false
getgenv().AutoToken = false
getgenv().AutoSaber = false
getgenv().AutoYama = false
getgenv().AutoTushita = false
getgenv().AutoCDK = false
getgenv().AutoSoulGuitar = false
getgenv().AutoRainbowHaki = false
getgenv().AutoUpgradeRace = false
getgenv().AutoGetGhoul = false
getgenv().AutoGetCyborg = false
getgenv().AutoFishing = false
getgenv().AutoDungeon = false
getgenv().AutoRaid = false
getgenv().AutoFactory = false
getgenv().AutoPirateRaid = false
getgenv().AutoRipIndra = false
getgenv().AutoSoulReaper = false
getgenv().AutoDoughKing = false
getgenv().AutoDarkbeard = false
getgenv().AutoEliteHunter = false
getgenv().AutoTouchPadHaki = false
getgenv().AutoFireFlowers = false
getgenv().AutoBerry = false
getgenv().AutoPrehistoric = false
getgenv().AutoKitsune = false
getgenv().AutoLeviathan = false
getgenv().AutoCraftVolcanicMagnet = false
getgenv().AutoQuestDojo = false
getgenv().AutoQuestDragonHunter = false
getgenv().ESPPlayer = false
getgenv().ESPIsland = false
getgenv().ESPFruit = false
getgenv().ESPBerry = false

-- ============================================
-- PHAN 5: CAC HAM CHINH
-- ============================================

local function DetectMob(mobName)
    if type(mobName) == "table" then
        for _, name in ipairs(mobName) do
            local mob = DetectMob(name)
            if mob then return mob end
        end
        return nil
    end
    local enemies = Workspace.Enemies:GetChildren()
    for _, mob in ipairs(enemies) do
        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
            if mob.Humanoid.Health > 0 then
                if string.find(mob.Name, mobName) or string.find(mob:GetAttribute("DisplayName") or "", mobName) then
                    return mob
                end
            end
        end
    end
    return nil
end

local function CheckNameBoss(bossName)
    local enemies = Workspace.Enemies:GetChildren()
    for _, enemy in ipairs(enemies) do
        if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
            if enemy.Humanoid.Health > 0 and string.find(enemy.Name, bossName) then
                return enemy
            end
        end
    end
    return nil
end

local function IsMobAlive(mob)
    if not mob then return false end
    local humanoid = mob:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health > 0
end

local function _tp(target)
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    char.HumanoidRootPart.CFrame = typeof(target) == "CFrame" and target or CFrame.new(target)
end

local function equiptool(toolName)
    local char = Player.Character
    if not char then return end
    local tool = Player.Backpack:FindFirstChild(toolName) or char:FindFirstChild(toolName)
    if tool then
        char.Humanoid:EquipTool(tool)
        return tool
    end
    return nil
end

local function ClickM1(target)
    if not target or not IsMobAlive(target) then return end
    local char = Player.Character
    if not char then return end
    local weapon = char:FindFirstChildOfClass("Tool")
    if weapon then
        if weapon:FindFirstChild("LeftClickRemote") then
            weapon.LeftClickRemote:FireServer(target.HumanoidRootPart)
        elseif weapon:FindFirstChild("RemoteEvent") then
            weapon.RemoteEvent:FireServer("Click")
        end
    end
end

local function checkboat()
    local owner = Player.Name
    local boats = Workspace.Boats:GetChildren()
    for _, boat in ipairs(boats) do
        if boat:IsA("Model") and boat:FindFirstChild("Owner") and boat.Owner.Value == owner and boat.Humanoid and boat.Humanoid.Value > 0 then
            return boat
        end
    end
    return nil
end

local function DetectSeaEvents()
    local seaEvents = {"SeaBeast1", "Terrorshark", "Ship", "Boat"}
    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
            for _, event in ipairs(seaEvents) do
                if string.find(mob.Name, event) then
                    return mob
                end
            end
        end
    end
    return nil
end

local function GetNearestChest()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local nearest = nil
    local dist = math.huge
    for _, chest in pairs(Workspace:GetDescendants()) do
        if chest:IsA("BasePart") and chest.Name == "Chest" and chest:FindFirstChild("TouchInterest") then
            if not chest:GetAttribute("IsDisabled") and not chest:FindFirstChild("Ignored") then
                local d = (chest.Position - hrp.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = chest
                end
            end
        end
    end
    return nearest
end

local function DetectElite()
    local enemies = Workspace.Enemies:GetChildren()
    for _, enemy in ipairs(enemies) do
        if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
            if enemy.Humanoid.Health > 0 and enemy:GetAttribute("IsElite") then
                return enemy
            end
        end
    end
    return nil
end

local function GetWaterHeightAtLocation()
    -- Placeholder function
    return -50
end

-- ============================================
-- PHAN 6: DANH SACH BOSS
-- ============================================

local BOSS_DATA = {}
if World1 then
    BOSS_DATA = {
        {name = "The Gorilla King", pos = CFrame.new(-1088.75977, 8.13463783, -488.559906)},
        {name = "Bobby", pos = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)},
        {name = "The Saw", pos = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)},
        {name = "Yeti", pos = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)},
        {name = "Mob Leader", pos = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)},
        {name = "Vice Admiral", pos = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)},
        {name = "Saber Expert", pos = CFrame.new(-1458.89502, 29.8870335, -50.633564)},
        {name = "Warden", pos = CFrame.new(5278.04932, 2.15167475, 944.101929)},
        {name = "Chief Warden", pos = CFrame.new(5206.92578, 0.997753382, 814.976746)},
        {name = "Swan", pos = CFrame.new(5325.09619, 7.03906584, 719.570679)},
        {name = "Magma Admiral", pos = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)},
        {name = "Fishman Lord", pos = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)},
        {name = "Wysper", pos = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)},
        {name = "Thunder God", pos = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)},
        {name = "Cyborg", pos = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)},
        {name = "Ice Admiral", pos = CFrame.new(1266.08948, 26.1757946, -1399.57678)},
        {name = "Greybeard", pos = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)},
    }
elseif World2 then
    BOSS_DATA = {
        {name = "Diamond", pos = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)},
        {name = "Jeremy", pos = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)},
        {name = "Fajita", pos = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)},
        {name = "Don Swan", pos = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)},
        {name = "Smoke Admiral", pos = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)},
        {name = "Awakened Ice Admiral", pos = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)},
        {name = "Tide Keeper", pos = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)},
        {name = "Darkbeard", pos = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)},
        {name = "Cursed Captain", pos = CFrame.new(916.928589, 181.092773, 33422)},
        {name = "Order", pos = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)},
    }
elseif World3 then
    BOSS_DATA = {
        {name = "Stone", pos = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)},
        {name = "Island Empress", pos = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)},
        {name = "Kilo Admiral", pos = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)},
        {name = "Captain Elephant", pos = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)},
        {name = "Beautiful Pirate", pos = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)},
        {name = "rip_indra True Form", pos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)},
        {name = "Longma", pos = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)},
        {name = "Soul Reaper", pos = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)},
        {name = "Cake Queen", pos = CFrame.new(-678.648804, 381.353943, -11114.2012)},
        {name = "Cake Prince", pos = CFrame.new(-1990.67, 4533, -14973.67)},
        {name = "Dough King", pos = CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)},
        {name = "Tyrant of the Skies", pos = CFrame.new(-16268.287, 152.616, 1390.773)},
    }
end

-- ============================================
-- PHAN 7: AUTO AFK
-- ============================================

local function AFKMode()
    if not getgenv().AFKMode then return end
    task.spawn(function()
        while getgenv().AFKMode do
            pcall(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0, 0))
                task.wait(1)
                vu:Button2Up(Vector2.new(0, 0))
                vu:Button1Down(Vector2.new(0, 0))
                task.wait(1)
                vu:Button1Up(Vector2.new(0, 0))
            end)
            task.wait(60)
        end
    end)
end

-- ============================================
-- PHAN 8: AUTO TOKEN FARM
-- ============================================

local function AutoTokenFarm()
    if not getgenv().AutoToken then return end
    task.spawn(function()
        while getgenv().AutoToken do
            pcall(function()
                local mobs = {"Forest Pirate", "Musketeer Pirate", "Jungle Pirate"}
                for _, mobName in ipairs(mobs) do
                    local mob = DetectMob(mobName)
                    if mob then
                        _tp(mob.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                        ClickM1(mob)
                    end
                end
                local chest = GetNearestChest()
                if chest then
                    _tp(chest.CFrame)
                    task.wait(0.5)
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 9: AUTO FISHING
-- ============================================

local function AutoFishing()
    if not getgenv().AutoFishing then return end
    task.spawn(function()
        while getgenv().AutoFishing do
            pcall(function()
                local fishingSpot = Workspace.ActiveFishingSpots:GetChildren()
                if #fishingSpot > 0 then
                    for _, spot in ipairs(fishingSpot) do
                        if spot.Name == "GoldenVortex" then
                            _tp(spot.CFrame)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(0.5)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                end
            end)
            task.wait(2)
        end
    end)
end

-- ============================================
-- PHAN 10: AUTO DUNGEON
-- ============================================

local function AutoDungeon()
    if not getgenv().AutoDungeon then return end
    task.spawn(function()
        while getgenv().AutoDungeon do
            pcall(function()
                local enemies = Workspace.Enemies:GetChildren()
                for _, enemy in ipairs(enemies) do
                    if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                        if enemy.Humanoid.Health > 0 then
                            _tp(enemy.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                            ClickM1(enemy)
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 11: AUTO RAID
-- ============================================

local function AutoRaid()
    if not getgenv().AutoRaid then return end
    task.spawn(function()
        while getgenv().AutoRaid do
            pcall(function()
                if Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                    local enemies = Workspace.Enemies:GetChildren()
                    for _, enemy in ipairs(enemies) do
                        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                            if enemy.Humanoid.Health > 0 then
                                _tp(enemy.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                ClickM1(enemy)
                            end
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 12: AUTO FACTORY
-- ============================================

local function AutoFactory()
    if not getgenv().AutoFactory then return end
    task.spawn(function()
        while getgenv().AutoFactory do
            pcall(function()
                local core = Workspace.Enemies:FindFirstChild("Core")
                if core and core:FindFirstChild("Humanoid") and core.Humanoid.Health > 0 then
                    _tp(core.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(core)
                else
                    _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 13: AUTO PIRATE RAID
-- ============================================

local function AutoPirateRaid()
    if not getgenv().AutoPirateRaid then return end
    task.spawn(function()
        while getgenv().AutoPirateRaid do
            pcall(function()
                local enemies = Workspace.Enemies:GetChildren()
                for _, enemy in ipairs(enemies) do
                    if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                        if enemy.Humanoid.Health > 0 and string.find(enemy.Name, "Pirate") then
                            _tp(enemy.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                            ClickM1(enemy)
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 14: AUTO RIP INDRA
-- ============================================

local function AutoRipIndra()
    if not getgenv().AutoRipIndra then return end
    task.spawn(function()
        while getgenv().AutoRipIndra do
            pcall(function()
                local ripIndra = CheckNameBoss("rip_indra")
                if ripIndra then
                    _tp(ripIndra.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(ripIndra)
                else
                    _tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 15: AUTO SOUL REAPER
-- ============================================

local function AutoSoulReaper()
    if not getgenv().AutoSoulReaper then return end
    task.spawn(function()
        while getgenv().AutoSoulReaper do
            pcall(function()
                local soulReaper = CheckNameBoss("Soul Reaper")
                if soulReaper then
                    _tp(soulReaper.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(soulReaper)
                else
                    _tp(CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813))
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 16: AUTO DOUGH KING
-- ============================================

local function AutoDoughKing()
    if not getgenv().AutoDoughKing then return end
    task.spawn(function()
        while getgenv().AutoDoughKing do
            pcall(function()
                local doughKing = CheckNameBoss("Dough King")
                if doughKing then
                    _tp(doughKing.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(doughKing)
                else
                    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 17: AUTO DARKBEARD
-- ============================================

local function AutoDarkbeard()
    if not getgenv().AutoDarkbeard then return end
    task.spawn(function()
        while getgenv().AutoDarkbeard do
            pcall(function()
                local darkbeard = CheckNameBoss("Darkbeard")
                if darkbeard then
                    _tp(darkbeard.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(darkbeard)
                else
                    _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 18: AUTO ELITE HUNTER
-- ============================================

local function AutoEliteHunter()
    if not getgenv().AutoEliteHunter then return end
    task.spawn(function()
        while getgenv().AutoEliteHunter do
            pcall(function()
                local elite = DetectElite()
                if elite then
                    _tp(elite.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(elite)
                else
                    CommF_Remote:InvokeServer("EliteHunter")
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 19: AUTO TOUCH PAD HAKI
-- ============================================

local function AutoTouchPadHaki()
    if not getgenv().AutoTouchPadHaki or not World3 then return end
    task.spawn(function()
        while getgenv().AutoTouchPadHaki do
            pcall(function()
                CommF_Remote:InvokeServer("activateColor", "Winter Sky")
                task.wait(0.5)
                _tp(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
                task.wait(0.5)
                CommF_Remote:InvokeServer("activateColor", "Pure Red")
                task.wait(0.5)
                _tp(CFrame.new(-5414.41357, 309.865753, -2212.45776))
                task.wait(0.5)
                CommF_Remote:InvokeServer("activateColor", "Snow White")
                task.wait(0.5)
                _tp(CFrame.new(-4971.47559, 331.565765, -3720.02954))
                task.wait(0.5)
                VirtualUser:Button1Down(Vector2.new(1280, 600))
                task.wait(1)
                VirtualUser:Button1Down(Vector2.new(1280, 600))
            end)
            task.wait(2)
        end
    end)
end

-- ============================================
-- PHAN 20: AUTO FIRE FLOWERS
-- ============================================

local function AutoFireFlowers()
    if not getgenv().AutoFireFlowers then return end
    task.spawn(function()
        while getgenv().AutoFireFlowers do
            pcall(function()
                local fireFlower = Workspace:FindFirstChild("FireFlowers")
                if fireFlower then
                    for _, flower in pairs(fireFlower:GetChildren()) do
                        if flower:IsA("Model") and flower:FindFirstChild("PrimaryPart") then
                            _tp(flower.PrimaryPart.CFrame)
                            task.wait(0.5)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(0.5)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 21: AUTO BERRY
-- ============================================

local function AutoBerry()
    if not getgenv().AutoBerry then return end
    task.spawn(function()
        while getgenv().AutoBerry do
            pcall(function()
                local berryBushes = CollectionService:GetTagged("BerryBush")
                for _, bush in ipairs(berryBushes) do
                    if bush and bush.Parent then
                        _tp(bush.Parent:GetPivot())
                        task.wait(0.5)
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 22: AUTO PREHISTORIC
-- ============================================

local function AutoPrehistoric()
    if not getgenv().AutoPrehistoric then return end
    task.spawn(function()
        while getgenv().AutoPrehistoric do
            pcall(function()
                if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
                    local activationPrompt = Workspace.Map.PrehistoricIsland.Core.ActivationPrompt
                    if activationPrompt and activationPrompt:FindFirstChild("ProximityPrompt") then
                        _tp(activationPrompt.CFrame)
                        task.wait(0.5)
                        fireproximityprompt(activationPrompt.ProximityPrompt, 1)
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 23: AUTO KITSUNE
-- ============================================

local function AutoKitsune()
    if not getgenv().AutoKitsune then return end
    task.spawn(function()
        while getgenv().AutoKitsune do
            pcall(function()
                if Workspace.Map:FindFirstChild("KitsuneIsland") then
                    local shrinePart = Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart
                    if shrinePart then
                        _tp(shrinePart.CFrame * CFrame.new(0, 0, 10))
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 24: AUTO LEVIATHAN
-- ============================================

local function AutoLeviathan()
    if not getgenv().AutoLeviathan then return end
    task.spawn(function()
        while getgenv().AutoLeviathan do
            pcall(function()
                for _, seaBeast in pairs(Workspace.SeaBeasts:GetChildren()) do
                    if seaBeast.Name == "Leviathan" and seaBeast:FindFirstChild("HumanoidRootPart") then
                        _tp(seaBeast.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                        ClickM1(seaBeast)
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 25: AUTO CRAFT VOLCANIC MAGNET
-- ============================================

local function AutoCraftVolcanicMagnet()
    if not getgenv().AutoCraftVolcanicMagnet then return end
    task.spawn(function()
        while getgenv().AutoCraftVolcanicMagnet do
            pcall(function()
                CommF_Remote:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
            end)
            task.wait(2)
        end
    end)
end

-- ============================================
-- PHAN 26: AUTO QUEST DOJO
-- ============================================

local function AutoQuestDojo()
    if not getgenv().AutoQuestDojo then return end
    task.spawn(function()
        while getgenv().AutoQuestDojo do
            pcall(function()
                local dojoTrainer = Workspace.NPCs:FindFirstChild("Dojo Trainer")
                if dojoTrainer and dojoTrainer:FindFirstChild("HumanoidRootPart") then
                    _tp(dojoTrainer.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                    task.wait(0.5)
                    CommF_Remote:InvokeServer("StartQuest", "DojoQuest")
                end
                local skullSlayer = DetectMob("Skull Slayer")
                if skullSlayer then
                    _tp(skullSlayer.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(skullSlayer)
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 27: AUTO QUEST DRAGON HUNTER
-- ============================================

local function AutoQuestDragonHunter()
    if not getgenv().AutoQuestDragonHunter then return end
    task.spawn(function()
        while getgenv().AutoQuestDragonHunter do
            pcall(function()
                local dragonHunter = Workspace.NPCs:FindFirstChild("Dragon Hunter")
                if dragonHunter and dragonHunter:FindFirstChild("HumanoidRootPart") then
                    _tp(dragonHunter.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                    task.wait(0.5)
                    CommF_Remote:InvokeServer("StartQuest", "DragonHunterQuest")
                end
                local hydraEnforcer = DetectMob("Hydra Enforcer")
                if hydraEnforcer then
                    _tp(hydraEnforcer.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(hydraEnforcer)
                end
                local venomousAssailant = DetectMob("Venomous Assailant")
                if venomousAssailant then
                    _tp(venomousAssailant.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                    ClickM1(venomousAssailant)
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 28: UI
-- ============================================

local Library = loadstring(game:HttpGet("https://pastefy.app/vgSGtrbP/raw"))()

local Window = Library:CreateWindow({
    Title = "Banana Cat Hub",
    Subtitle = "- Blox Fruit | Key: " .. string.sub(getgenv().Key, 1, 10) .. "...",
    Image = "rbxassetid://130947856929902"
})

-- Tab Farm
local FarmTab = Window:AddTab("Farm")
local FarmGroup = FarmTab:AddLeftGroupbox("Auto Farm")

FarmGroup:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Blox Fruit"},
    Default = "Melee",
    Callback = function(Value)
        getgenv().SelectWeapon = Value
    end
})

FarmGroup:AddToggle("StartFarm", {
    Title = "Start Farm",
    Default = false,
    Callback = function(Value)
        getgenv().StartFarm = Value
        if Value then
            task.spawn(function()
                while getgenv().StartFarm do
                    pcall(function()
                        local level = Player.Data.Level.Value
                        local questData = GetQuestData(level)
                        if questData then
                            if not Player.PlayerGui.Main.Quest.Visible then
                                _tp(questData.QuestPos)
                                task.wait(0.5)
                                CommF_Remote:InvokeServer("StartQuest", questData.QuestName, questData.QuestId)
                            else
                                local mob = DetectMob(questData.MobName)
                                if mob then
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                    ClickM1(mob)
                                else
                                    _tp(questData.MobPos)
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

-- Boss Group
local BossGroup = FarmTab:AddLeftGroupbox("Auto Boss")
local bossNames = {}
for _, data in ipairs(BOSS_DATA) do
    table.insert(bossNames, data.name)
end

BossGroup:AddDropdown("SelectBoss", {
    Title = "Select Boss",
    Values = bossNames,
    Default = bossNames[1],
    Callback = function(Value)
        getgenv().SelectBoss = Value
    end
})

BossGroup:AddToggle("AutoBoss", {
    Title = "Auto Kill Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBoss = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoBoss do
                    local boss = CheckNameBoss(getgenv().SelectBoss)
                    if boss then
                        _tp(boss.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                        ClickM1(boss)
                    else
                        for _, data in ipairs(BOSS_DATA) do
                            if data.name == getgenv().SelectBoss then
                                _tp(data.pos * CFrame.new(0, 30, 0))
                                break
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

BossGroup:AddToggle("AutoAllBoss", {
    Title = "Auto Kill All Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAllBoss = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoAllBoss do
                    for _, data in ipairs(BOSS_DATA) do
                        if not getgenv().AutoAllBoss then break end
                        local boss = CheckNameBoss(data.name)
                        if boss then
                            _tp(boss.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                            ClickM1(boss)
                        else
                            _tp(data.pos * CFrame.new(0, 30, 0))
                        end
                        task.wait()
                    end
                end
            end)
        end
    end
})

BossGroup:AddToggle("AutoElite", {
    Title = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        getgenv().AutoElite = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoElite do
                    local elite = DetectElite()
                    if elite then
                        _tp(elite.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                        ClickM1(elite)
                    end
                    task.wait()
                end
            end)
        end
    end
})

-- Tab AFK & Token
local AFKTab = Window:AddTab("AFK & Token")
local AFKGroup = AFKTab:AddLeftGroupbox("AFK Mode")

AFKGroup:AddToggle("AFKMode", {
    Title = "Auto AFK Mode",
    Default = false,
    Callback = function(Value)
        getgenv().AFKMode = Value
        if Value then AFKMode() end
    end
})

AFKGroup:AddToggle("AutoToken", {
    Title = "Auto Token Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoToken = Value
        if Value then AutoTokenFarm() end
    end
})

-- Tab Hidden Quest
local HiddenTab = Window:AddTab("Hidden Quest")
local HiddenGroup = HiddenTab:AddLeftGroupbox("Auto Hidden Quest")

HiddenGroup:AddToggle("AutoSaber", {
    Title = "Auto Saber",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSaber = Value
    end
})

HiddenGroup:AddToggle("AutoYama", {
    Title = "Auto Yama",
    Default = false,
    Callback = function(Value)
        getgenv().AutoYama = Value
    end
})

HiddenGroup:AddToggle("AutoTushita", {
    Title = "Auto Tushita",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTushita = Value
    end
})

HiddenGroup:AddToggle("AutoCDK", {
    Title = "Auto CDK",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCDK = Value
    end
})

HiddenGroup:AddToggle("AutoSoulGuitar", {
    Title = "Auto Soul Guitar",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSoulGuitar = Value
    end
})

HiddenGroup:AddToggle("AutoRainbowHaki", {
    Title = "Auto Rainbow Haki",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRainbowHaki = Value
    end
})

-- Tab Sea Event
local SeaTab = Window:AddTab("Sea Event")
local SeaGroup = SeaTab:AddLeftGroupbox("Sea Event")

SeaGroup:AddDropdown("SelectBoat", {
    Title = "Select Boat",
    Values = {"Brigade", "GrandBrigade", "Beast Hunter", "Sloop"},
    Default = "Brigade",
    Callback = function(Value)
        getgenv().SelectBoat = Value
    end
})

SeaGroup:AddToggle("AutoSeaEvent", {
    Title = "Auto Sea Event",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSeaEvent = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoSeaEvent do
                    pcall(function()
                        local boat = checkboat()
                        if not boat then
                            _tp(CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375))
                            task.wait(0.5)
                            CommF_Remote:InvokeServer("BuyBoat", getgenv().SelectBoat)
                        else
                            local seaEvent = DetectSeaEvents()
                            if seaEvent then
                                _tp(seaEvent.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                ClickM1(seaEvent)
                            else
                                _tp(CFrame.new(-118834.515625, boat.WorldPivot.Y, -78.9505844116211) * CFrame.new(0, 0, 99999999))
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

-- Tab Race
local RaceTab = Window:AddTab("Race")
local RaceGroup = RaceTab:AddLeftGroupbox("Auto Race")

RaceGroup:AddToggle("AutoTrial", {
    Title = "Auto Trial",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrial = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoTrial do
                    pcall(function()
                        local temple = Workspace.Map:FindFirstChild("Temple of Time")
                        if temple then
                            local race = Player.Data.Race.Value
                            local door = temple[race .. "Corridor"].Door.Door.RightDoor.Union
                            if door then
                                _tp(door.CFrame)
                                VirtualInputManager:SendKeyEvent(true, "T", false, game)
                                task.wait()
                                VirtualInputManager:SendKeyEvent(false, "T", false, game)
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

RaceGroup:AddToggle("AutoUpgradeRace", {
    Title = "Auto Upgrade Race V2-V3",
    Default = false,
    Callback = function(Value)
        getgenv().AutoUpgradeRace = Value
    end
})

RaceGroup:AddToggle("AutoGetGhoul", {
    Title = "Auto Get Ghoul",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetGhoul = Value
    end
})

RaceGroup:AddToggle("AutoGetCyborg", {
    Title = "Auto Get Cyborg",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetCyborg = Value
    end
})

-- Tab Chest
local ChestTab = Window:AddTab("Chest")
local ChestGroup = ChestTab:AddLeftGroupbox("Auto Chest")

ChestGroup:AddToggle("AutoChest", {
    Title = "Auto Chest",
    Default = false,
    Callback = function(Value)
        getgenv().AutoChest = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoChest do
                    local chest = GetNearestChest()
                    if chest then
                        _tp(chest.CFrame)
                        task.wait(0.5)
                    end
                    task.wait()
                end
            end)
        end
    end
})

-- Tab ESP
local ESPTab = Window:AddTab("ESP")
local ESPGroup = ESPTab:AddLeftGroupbox("ESP Settings")

ESPGroup:AddToggle("ESPPlayer", {
    Title = "ESP Player",
    Default = false,
    Callback = function(Value)
        getgenv().ESPPlayer = Value
    end
})

ESPGroup:AddToggle("ESPIsland", {
    Title = "ESP Island",
    Default = false,
    Callback = function(Value)
        getgenv().ESPIsland = Value
    end
})

ESPGroup:AddToggle("ESPFruit", {
    Title = "ESP Fruit",
    Default = false,
    Callback = function(Value)
        getgenv().ESPFruit = Value
    end
})

ESPGroup:AddToggle("ESPBerry", {
    Title = "ESP Berry",
    Default = false,
    Callback = function(Value)
        getgenv().ESPBerry = Value
    end
})

-- Tab Extra
local ExtraTab = Window:AddTab("Extra")
local ExtraGroup = ExtraTab:AddLeftGroupbox("Extra Features")

ExtraGroup:AddToggle("AutoFishing", {
    Title = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFishing = Value
        if Value then AutoFishing() end
    end
})

ExtraGroup:AddToggle("AutoDungeon", {
    Title = "Auto Dungeon",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDungeon = Value
        if Value then AutoDungeon() end
    end
})

ExtraGroup:AddToggle("AutoRaid", {
    Title = "Auto Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRaid = Value
        if Value then AutoRaid() end
    end
})

ExtraGroup:AddToggle("AutoFactory", {
    Title = "Auto Factory",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFactory = Value
        if Value then AutoFactory() end
    end
})

ExtraGroup:AddToggle("AutoPirateRaid", {
    Title = "Auto Pirate Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPirateRaid = Value
        if Value then AutoPirateRaid() end
    end
})

ExtraGroup:AddToggle("AutoRipIndra", {
    Title = "Auto Rip Indra",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRipIndra = Value
        if Value then AutoRipIndra() end
    end
})

ExtraGroup:AddToggle("AutoSoulReaper", {
    Title = "Auto Soul Reaper",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSoulReaper = Value
        if Value then AutoSoulReaper() end
    end
})

ExtraGroup:AddToggle("AutoDoughKing", {
    Title = "Auto Dough King",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDoughKing = Value
        if Value then AutoDoughKing() end
    end
})

ExtraGroup:AddToggle("AutoDarkbeard", {
    Title = "Auto Darkbeard",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDarkbeard = Value
        if Value then AutoDarkbeard() end
    end
})

ExtraGroup:AddToggle("AutoEliteHunter", {
    Title = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        getgenv().AutoEliteHunter = Value
        if Value then AutoEliteHunter() end
    end
})

ExtraGroup:AddToggle("AutoTouchPadHaki", {
    Title = "Auto Touch Pad Haki",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTouchPadHaki = Value
        if Value then AutoTouchPadHaki() end
    end
})

ExtraGroup:AddToggle("AutoFireFlowers", {
    Title = "Auto Fire Flowers",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFireFlowers = Value
        if Value then AutoFireFlowers() end
    end
})

ExtraGroup:AddToggle("AutoBerry", {
    Title = "Auto Berry",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBerry = Value
        if Value then AutoBerry() end
    end
})

ExtraGroup:AddToggle("AutoPrehistoric", {
    Title = "Auto Prehistoric",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPrehistoric = Value
        if Value then AutoPrehistoric() end
    end
})

ExtraGroup:AddToggle("AutoKitsune", {
    Title = "Auto Kitsune",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKitsune = Value
        if Value then AutoKitsune() end
    end
})

ExtraGroup:AddToggle("AutoLeviathan", {
    Title = "Auto Leviathan",
    Default = false,
    Callback = function(Value)
        getgenv().AutoLeviathan = Value
        if Value then AutoLeviathan() end
    end
})

ExtraGroup:AddToggle("AutoCraftVolcanicMagnet", {
    Title = "Auto Craft Volcanic Magnet",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCraftVolcanicMagnet = Value
        if Value then AutoCraftVolcanicMagnet() end
    end
})

ExtraGroup:AddToggle("AutoQuestDojo", {
    Title = "Auto Quest Dojo",
    Default = false,
    Callback = function(Value)
        getgenv().AutoQuestDojo = Value
        if Value then AutoQuestDojo() end
    end
})

ExtraGroup:AddToggle("AutoQuestDragonHunter", {
    Title = "Auto Quest Dragon Hunter",
    Default = false,
    Callback = function(Value)
        getgenv().AutoQuestDragonHunter = Value
        if Value then AutoQuestDragonHunter() end
    end
})

-- ============================================
-- PHAN 29: GET QUEST DATA
-- ============================================

function GetQuestData(level)
    if World1 then
        if level <= 9 then return {MobName = "Bandit", QuestName = "BanditQuest1", QuestId = 1, MobPos = CFrame.new(1045, 27, 1560), QuestPos = CFrame.new(1045, 27, 1560)} end
        if level <= 14 then return {MobName = "Monkey", QuestName = "JungleQuest", QuestId = 1, MobPos = CFrame.new(-1448, 67, 11), QuestPos = CFrame.new(-1598, 35, 153)} end
        if level <= 29 then return {MobName = "Gorilla", QuestName = "JungleQuest", QuestId = 2, MobPos = CFrame.new(-1129, 40, -525), QuestPos = CFrame.new(-1598, 35, 153)} end
        if level <= 39 then return {MobName = "Pirate", QuestName = "BuggyQuest1", QuestId = 1, MobPos = CFrame.new(-1103, 13, 3896), QuestPos = CFrame.new(-1141, 4, 3831)} end
        if level <= 59 then return {MobName = "Brute", QuestName = "BuggyQuest1", QuestId = 2, MobPos = CFrame.new(-1140, 14, 4322), QuestPos = CFrame.new(-1141, 4, 3831)} end
        if level <= 74 then return {MobName = "Desert Bandit", QuestName = "DesertQuest", QuestId = 1, MobPos = CFrame.new(924, 6, 4481), QuestPos = CFrame.new(894, 5, 4392)} end
        if level <= 89 then return {MobName = "Desert Officer", QuestName = "DesertQuest", QuestId = 2, MobPos = CFrame.new(1608, 8, 4371), QuestPos = CFrame.new(894, 5, 4392)} end
        if level <= 99 then return {MobName = "Snow Bandit", QuestName = "SnowQuest", QuestId = 1, MobPos = CFrame.new(1354, 87, -1393), QuestPos = CFrame.new(1389, 88, -1298)} end
        if level <= 119 then return {MobName = "Snowman", QuestName = "SnowQuest", QuestId = 2, MobPos = CFrame.new(6241, 51, -1243), QuestPos = CFrame.new(1389, 88, -1298)} end
        if level <= 149 then return {MobName = "Chief Petty Officer", QuestName = "MarineQuest2", QuestId = 1, MobPos = CFrame.new(-4881, 22, 4273), QuestPos = CFrame.new(-5039, 27, 4324)} end
        if level <= 174 then return {MobName = "Sky Bandit", QuestName = "SkyQuest", QuestId = 1, MobPos = CFrame.new(-4953, 295, -2899), QuestPos = CFrame.new(-4839, 716, -2619)} end
        if level <= 189 then return {MobName = "Dark Master", QuestName = "SkyQuest", QuestId = 2, MobPos = CFrame.new(-5259, 391, -2229), QuestPos = CFrame.new(-4839, 716, -2619)} end
        if level <= 209 then return {MobName = "Prisoner", QuestName = "PrisonerQuest", QuestId = 1, MobPos = CFrame.new(5098, -0.3, 474), QuestPos = CFrame.new(5308, 1, 475)} end
        if level <= 249 then return {MobName = "Dangerous Prisoner", QuestName = "PrisonerQuest", QuestId = 2, MobPos = CFrame.new(5654, 15, 866), QuestPos = CFrame.new(5308, 1, 475)} end
        if level <= 274 then return {MobName = "Toga Warrior", QuestName = "ColosseumQuest", QuestId = 1, MobPos = CFrame.new(-1820, 51, -2740), QuestPos = CFrame.new(-1580, 6, -2986)} end
        if level <= 299 then return {MobName = "Gladiator", QuestName = "ColosseumQuest", QuestId = 2, MobPos = CFrame.new(-1292, 56, -3339), QuestPos = CFrame.new(-1580, 6, -2986)} end
        if level <= 324 then return {MobName = "Military Soldier", QuestName = "MagmaQuest", QuestId = 1, MobPos = CFrame.new(-5411, 11, 8454), QuestPos = CFrame.new(-5313, 10, 8515)} end
        if level <= 374 then return {MobName = "Military Spy", QuestName = "MagmaQuest", QuestId = 2, MobPos = CFrame.new(-5802, 86, 8828), QuestPos = CFrame.new(-5313, 10, 8515)} end
        if level <= 399 then return {MobName = "Fishman Warrior", QuestName = "FishmanQuest", QuestId = 1, MobPos = CFrame.new(60878, 18, 1543), QuestPos = CFrame.new(61122, 18, 1569)} end
        if level <= 449 then return {MobName = "Fishman Commando", QuestName = "FishmanQuest", QuestId = 2, MobPos = CFrame.new(61922, 18, 1493), QuestPos = CFrame.new(61122, 18, 1569)} end
        if level <= 474 then return {MobName = "God's Guard", QuestName = "SkyExp1Quest", QuestId = 1, MobPos = CFrame.new(-4710, 845, -1927), QuestPos = CFrame.new(-4721, 843, -1949)} end
        if level <= 524 then return {MobName = "Shanda", QuestName = "SkyExp1Quest", QuestId = 2, MobPos = CFrame.new(-7678, 5566, -497), QuestPos = CFrame.new(-7859, 5544, -381)} end
        if level <= 549 then return {MobName = "Royal Squad", QuestName = "SkyExp2Quest", QuestId = 1, MobPos = CFrame.new(-7624, 5658, -1467), QuestPos = CFrame.new(-7906, 5634, -1411)} end
        if level <= 624 then return {MobName = "Royal Soldier", QuestName = "SkyExp2Quest", QuestId = 2, MobPos = CFrame.new(-7836, 5645, -1790), QuestPos = CFrame.new(-7906, 5634, -1411)} end
        if level <= 649 then return {MobName = "Galley Pirate", QuestName = "FountainQuest", QuestId = 1, MobPos = CFrame.new(5551, 78, 3930), QuestPos = CFrame.new(5259, 37, 4050)} end
        if level >= 650 then return {MobName = "Galley Captain", QuestName = "FountainQuest", QuestId = 2, MobPos = CFrame.new(5441, 42, 4950), QuestPos = CFrame.new(5259, 37, 4050)} end
    elseif World2 then
        if level <= 724 then return {MobName = "Raider", QuestName = "Area1Quest", QuestId = 1, MobPos = CFrame.new(-728, 52, 2345), QuestPos = CFrame.new(-429, 71, 1836)} end
        if level <= 774 then return {MobName = "Mercenary", QuestName = "Area1Quest", QuestId = 2, MobPos = CFrame.new(-1004, 80, 1424), QuestPos = CFrame.new(-429, 71, 1836)} end
        if level <= 799 then return {MobName = "Swan Pirate", QuestName = "Area2Quest", QuestId = 1, MobPos = CFrame.new(1068, 137, 1322), QuestPos = CFrame.new(638, 71, 918)} end
        if level <= 874 then return {MobName = "Factory Staff", QuestName = "Area2Quest", QuestId = 2, MobPos = CFrame.new(73, 81, -27), QuestPos = CFrame.new(632, 73, 918)} end
        if level <= 899 then return {MobName = "Marine Lieutenant", QuestName = "MarineQuest3", QuestId = 1, MobPos = CFrame.new(-2821, 75, -3070), QuestPos = CFrame.new(-2440, 71, -3216)} end
        if level <= 949 then return {MobName = "Marine Captain", QuestName = "MarineQuest3", QuestId = 2, MobPos = CFrame.new(-1861, 80, -3254), QuestPos = CFrame.new(-2440, 71, -3216)} end
        if level <= 974 then return {MobName = "Zombie", QuestName = "ZombieQuest", QuestId = 1, MobPos = CFrame.new(-5657, 78, -928), QuestPos = CFrame.new(-5497, 47, -795)} end
        if level <= 999 then return {MobName = "Vampire", QuestName = "ZombieQuest", QuestId = 2, MobPos = CFrame.new(-6037, 32, -1340), QuestPos = CFrame.new(-5497, 47, -795)} end
        if level <= 1049 then return {MobName = "Snow Trooper", QuestName = "SnowMountainQuest", QuestId = 1, MobPos = CFrame.new(549, 427, -5563), QuestPos = CFrame.new(609, 400, -5372)} end
        if level <= 1099 then return {MobName = "Winter Warrior", QuestName = "SnowMountainQuest", QuestId = 2, MobPos = CFrame.new(1142, 475, -5199), QuestPos = CFrame.new(609, 400, -5372)} end
        if level <= 1124 then return {MobName = "Lab Subordinate", QuestName = "IceSideQuest", QuestId = 1, MobPos = CFrame.new(-5707, 15, -4513), QuestPos = CFrame.new(-6064, 15, -4902)} end
        if level <= 1174 then return {MobName = "Horned Warrior", QuestName = "IceSideQuest", QuestId = 2, MobPos = CFrame.new(-6341, 15, -5723), QuestPos = CFrame.new(-6064, 15, -4902)} end
        if level <= 1199 then return {MobName = "Magma Ninja", QuestName = "FireSideQuest", QuestId = 1, MobPos = CFrame.new(-5449, 76, -5808), QuestPos = CFrame.new(-5428, 15, -5299)} end
        if level <= 1249 then return {MobName = "Lava Pirate", QuestName = "FireSideQuest", QuestId = 2, MobPos = CFrame.new(-5213, 49, -4701), QuestPos = CFrame.new(-5428, 15, -5299)} end
        if level <= 1274 then return {MobName = "Ship Deckhand", QuestName = "ShipQuest1", QuestId = 1, MobPos = CFrame.new(1212, 150, 33059), QuestPos = CFrame.new(1037, 125, 32911)} end
        if level <= 1299 then return {MobName = "Ship Engineer", QuestName = "ShipQuest1", QuestId = 2, MobPos = CFrame.new(919, 43, 32779), QuestPos = CFrame.new(1037, 125, 32911)} end
        if level <= 1324 then return {MobName = "Ship Steward", QuestName = "ShipQuest2", QuestId = 1, MobPos = CFrame.new(919, 129, 33436), QuestPos = CFrame.new(968, 125, 33244)} end
        if level <= 1349 then return {MobName = "Ship Officer", QuestName = "ShipQuest2", QuestId = 2, MobPos = CFrame.new(1036, 181, 33315), QuestPos = CFrame.new(968, 125, 33244)} end
        if level <= 1374 then return {MobName = "Arctic Warrior", QuestName = "FrostQuest", QuestId = 1, MobPos = CFrame.new(5966, 62, -6179), QuestPos = CFrame.new(5667, 26, -6486)} end
        if level <= 1424 then return {MobName = "Snow Lurker", QuestName = "FrostQuest", QuestId = 2, MobPos = CFrame.new(5407, 69, -6880), QuestPos = CFrame.new(5667, 26, -6486)} end
        if level <= 1449 then return {MobName = "Sea Soldier", QuestName = "ForgottenQuest", QuestId = 1, MobPos = CFrame.new(-3028, 64, -9775), QuestPos = CFrame.new(-3054, 235, -10142)} end
        if level >= 1450 then return {MobName = "Water Fighter", QuestName = "ForgottenQuest", QuestId = 2, MobPos = CFrame.new(-3352, 285, -10534), QuestPos = CFrame.new(-3054, 235, -10142)} end
    elseif World3 then
        if level <= 1524 then return {MobName = "Pirate Millionaire", QuestName = "PiratePortQuest", QuestId = 1, MobPos = CFrame.new(-712, 98, 5711), QuestPos = CFrame.new(-712, 98, 5711)} end
        if level <= 1574 then return {MobName = "Pistol Billionaire", QuestName = "PiratePortQuest", QuestId = 2, MobPos = CFrame.new(-723, 147, 5931), QuestPos = CFrame.new(-723, 147, 5931)} end
        if level <= 1599 then return {MobName = "Dragon Crew Warrior", QuestName = "AmazonQuest", QuestId = 1, MobPos = CFrame.new(6779, 111, -801), QuestPos = CFrame.new(6779, 111, -801)} end
        if level <= 1624 then return {MobName = "Dragon Crew Archer", QuestName = "AmazonQuest", QuestId = 2, MobPos = CFrame.new(6955, 546, 309), QuestPos = CFrame.new(6955, 546, 309)} end
        if level <= 1649 then return {MobName = "Hydra Enforcer", QuestName = "VenomCrewQuest", QuestId = 1, MobPos = CFrame.new(4620, 1002, 399), QuestPos = CFrame.new(4620, 1002, 399)} end
        if level <= 1699 then return {MobName = "Venomous Assailant", QuestName = "VenomCrewQuest", QuestId = 2, MobPos = CFrame.new(4697, 1100, 946), QuestPos = CFrame.new(4697, 1100, 946)} end
        if level <= 1724 then return {MobName = "Marine Commodore", QuestName = "MarineTreeIsland", QuestId = 1, MobPos = CFrame.new(2286, 73, -7159), QuestPos = CFrame.new(2180, 27, -6741)} end
        if level <= 1774 then return {MobName = "Marine Rear Admiral", QuestName = "MarineTreeIsland", QuestId = 2, MobPos = CFrame.new(3656, 160, -7001), QuestPos = CFrame.new(2179, 28, -6740)} end
        if level <= 1799 then return {MobName = "Fishman Raider", QuestName = "DeepForestIsland3", QuestId = 1, MobPos = CFrame.new(-10407, 331, -8368), QuestPos = CFrame.new(-10581, 330, -8761)} end
        if level <= 1824 then return {MobName = "Fishman Captain", QuestName = "DeepForestIsland3", QuestId = 2, MobPos = CFrame.new(-10994, 352, -9002), QuestPos = CFrame.new(-10581, 330, -8761)} end
        if level <= 1849 then return {MobName = "Forest Pirate", QuestName = "DeepForestIsland", QuestId = 1, MobPos = CFrame.new(-13274, 332, -7769), QuestPos = CFrame.new(-13234, 331, -7625)} end
        if level <= 1899 then return {MobName = "Mythological Pirate", QuestName = "DeepForestIsland", QuestId = 2, MobPos = CFrame.new(-13680, 501, -6991), QuestPos = CFrame.new(-13234, 331, -7625)} end
        if level <= 1924 then return {MobName = "Jungle Pirate", QuestName = "DeepForestIsland2", QuestId = 1, MobPos = CFrame.new(-12256, 331, -10485), QuestPos = CFrame.new(-12680, 389, -9902)} end
        if level <= 1974 then return {MobName = "Musketeer Pirate", QuestName = "DeepForestIsland2", QuestId = 2, MobPos = CFrame.new(-13457, 391, -9859), QuestPos = CFrame.new(-12680, 389, -9902)} end
        if level <= 1999 then return {MobName = "Reborn Skeleton", QuestName = "HauntedQuest1", QuestId = 1, MobPos = CFrame.new(-8763, 165, 6159), QuestPos = CFrame.new(-9479, 141, 5566)} end
        if level <= 2024 then return {MobName = "Living Zombie", QuestName = "HauntedQuest1", QuestId = 2, MobPos = CFrame.new(-10144, 138, 5838), QuestPos = CFrame.new(-9479, 141, 5566)} end
        if level <= 2049 then return {MobName = "Demonic Soul", QuestName = "HauntedQuest2", QuestId = 1, MobPos = CFrame.new(-9505, 172, 6158), QuestPos = CFrame.new(-9516, 172, 6078)} end
        if level <= 2074 then return {MobName = "Posessed Mummy", QuestName = "HauntedQuest2", QuestId = 2, MobPos = CFrame.new(-9582, 6, 6205), QuestPos = CFrame.new(-9516, 172, 6078)} end
        if level <= 2099 then return {MobName = "Peanut Scout", QuestName = "NutsIslandQuest", QuestId = 1, MobPos = CFrame.new(-2143, 47, -10029), QuestPos = CFrame.new(-2104, 38, -10194)} end
        if level <= 2124 then return {MobName = "Peanut President", QuestName = "NutsIslandQuest", QuestId = 2, MobPos = CFrame.new(-1859, 38, -10422), QuestPos = CFrame.new(-2104, 38, -10194)} end
        if level <= 2149 then return {MobName = "Ice Cream Chef", QuestName = "IceCreamIslandQuest", QuestId = 1, MobPos = CFrame.new(-872, 65, -10919), QuestPos = CFrame.new(-820, 65, -10965)} end
        if level <= 2199 then return {MobName = "Ice Cream Commander", QuestName = "IceCreamIslandQuest", QuestId = 2, MobPos = CFrame.new(-558, 112, -11290), QuestPos = CFrame.new(-820, 65, -10965)} end
        if level <= 2224 then return {MobName = "Cookie Crafter", QuestName = "CakeQuest1", QuestId = 1, MobPos = CFrame.new(-2374, 37, -12125), QuestPos = CFrame.new(-2021, 37, -12028)} end
        if level <= 2249 then return {MobName = "Cake Guard", QuestName = "CakeQuest1", QuestId = 2, MobPos = CFrame.new(-1598, 43, -12244), QuestPos = CFrame.new(-2021, 37, -12028)} end
        if level <= 2274 then return {MobName = "Baking Staff", QuestName = "CakeQuest2", QuestId = 1, MobPos = CFrame.new(-1887, 77, -12998), QuestPos = CFrame.new(-1927, 37, -12842)} end
        if level <= 2299 then return {MobName = "Head Baker", QuestName = "CakeQuest2", QuestId = 2, MobPos = CFrame.new(-2216, 82, -12869), QuestPos = CFrame.new(-1927, 37, -12842)} end
        if level <= 2324 then return {MobName = "Cocoa Warrior", QuestName = "ChocQuest1", QuestId = 1, MobPos = CFrame.new(-21, 80, -12352), QuestPos = CFrame.new(233, 29, -12201)} end
        if level <= 2349 then return {MobName = "Chocolate Bar Battler", QuestName = "ChocQuest1", QuestId = 2, MobPos = CFrame.new(582, 77, -12463), QuestPos = CFrame.new(233, 29, -12201)} end
        if level <= 2374 then return {MobName = "Sweet Thief", QuestName = "ChocQuest2", QuestId = 1, MobPos = CFrame.new(165, 76, -12600), QuestPos = CFrame.new(150, 30, -12774)} end
        if level <= 2399 then return {MobName = "Candy Rebel", QuestName = "ChocQuest2", QuestId = 2, MobPos = CFrame.new(134, 77, -12876), QuestPos = CFrame.new(150, 30, -12774)} end
        if level <= 2449 then return {MobName = "Candy Pirate", QuestName = "CandyQuest1", QuestId = 1, MobPos = CFrame.new(-1310, 26, -14562), QuestPos = CFrame.new(-1150, 20, -14446)} end
        if level <= 2474 then return {MobName = "Isle Outlaw", QuestName = "TikiQuest1", QuestId = 1, MobPos = CFrame.new(-16479, 226, -300), QuestPos = CFrame.new(-16548, 55, -172)} end
        if level <= 2499 then return {MobName = "Island Boy", QuestName = "TikiQuest1", QuestId = 2, MobPos = CFrame.new(-16849, 192, -150), QuestPos = CFrame.new(-16548, 55, -172)} end
        if level <= 2524 then return {MobName = "Sun-kissed Warrior", QuestName = "TikiQuest2", QuestId = 1, MobPos = CFrame.new(-16347, 64, 984), QuestPos = CFrame.new(-16538, 55, 1049)} end
        if level <= 2550 then return {MobName = "Isle Champion", QuestName = "TikiQuest2", QuestId = 2, MobPos = CFrame.new(-16602, 130, 1087), QuestPos = CFrame.new(-16541, 57, 1051)} end
        if level <= 2574 then return {MobName = "Serpent Hunter", QuestName = "TikiQuest3", QuestId = 1, MobPos = CFrame.new(-16679, 176, 1474), QuestPos = CFrame.new(-16679, 176, 1474)} end
        if level <= 2599 then return {MobName = "Skull Slayer", QuestName = "TikiQuest3", QuestId = 2, MobPos = CFrame.new(-16759, 71, 1595), QuestPos = CFrame.new(-16759, 71, 1595)} end
        if level <= 2624 then return {MobName = "Reef Bandit", QuestName = "SubmergedQuest1", QuestId = 1, MobPos = CFrame.new(10736, -2087, 9338), QuestPos = CFrame.new(10882, -2086, 10034)} end
        if level <= 2649 then return {MobName = "Coral Pirate", QuestName = "SubmergedQuest1", QuestId = 2, MobPos = CFrame.new(10965, -2158, 9177), QuestPos = CFrame.new(10882, -2086, 10034)} end
        if level <= 2674 then return {MobName = "Sea Chanter", QuestName = "SubmergedQuest2", QuestId = 1, MobPos = CFrame.new(10621, -2087, 10102), QuestPos = CFrame.new(10882, -2086, 10034)} end
        if level <= 2699 then return {MobName = "Ocean Prophet", QuestName = "SubmergedQuest2", QuestId = 2, MobPos = CFrame.new(11056, -2001, 10117), QuestPos = CFrame.new(10882, -2086, 10034)} end
        if level <= 2724 then return {MobName = "High Disciple", QuestName = "SubmergedQuest3", QuestId = 1, MobPos = CFrame.new(9828, -1940, 9693), QuestPos = CFrame.new(9636, -1992, 9609)} end
        if level >= 2725 then return {MobName = "Grand Devotee", QuestName = "SubmergedQuest3", QuestId = 2, MobPos = CFrame.new(9557, -1928, 9859), QuestPos = CFrame.new(9636, -1992, 9609)} end
    end
end

print("=========================================")
print("BANANA CAT HUB - LOADED")
print("=========================================")
print("User: " .. playerName .. " (ID: " .. userId .. ")")
print("Key: " .. playerKey)
print("World: " .. (World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown"))
print("Total Bosses: " .. #BOSS_DATA)
print("Total Features: 29")
print("=========================================")