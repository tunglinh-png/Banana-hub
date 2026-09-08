repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "NHẬP KEY CỦA ÔG VÀO ĐÂY"
getgenv().__BANANA_SCRIPT_ROUTE = "bf_main"

-- ============================================
-- BANANA CAT HUB - BLOX FRUITS SCRIPT
-- TỔNG HỢP TỪ BANANAHUB (1).LUA
-- FULL CHỨC NĂNG: FARM, BOSS, ELITE, SEA EVENT, RACE, WEAPON, PVP, ESP, FISHING, DUNGEON, RAID
-- ============================================

-- ============================================
-- PHAN 1: SERVICES
-- ============================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local CollectionService = game:GetService("CollectionService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui", 5)
local MainGui = PlayerGui:WaitForChild("Main", 5)
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")

local World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
local World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
local World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

local plr = Player
local Root = HumanoidRootPart
local replicated = ReplicatedStorage
local vim1 = VirtualInputManager
local vim2 = VirtualUser
local TW = TweenService
local Enemies = Workspace.Enemies
local Sec = 0.1
local shouldTween = false
local SoulGuitar = false
local KenTest = true
local debug = false

-- ============================================
-- PHAN 2: ANTI CHEAT - CHONG KICK
-- ============================================

local function safeKick(message)
    pcall(function()
        if Player.Kick then
            Player:Kick(message)
        elseif game:GetService("Players").LocalPlayer.Kick then
            game:GetService("Players").LocalPlayer:Kick(message)
        else
            error(message)
        end
    end)
end

local function AntiKick()
    local kickFunc = Player.Kick
    if kickFunc then
        Player.Kick = function(message)
            if message and string.find(message, "BANANA") then
                print("KICK DETECTED - BLOCKED: " .. message)
                return
            end
            return kickFunc(message)
        end
    end
end

local function AntiBan()
    if Player.Kick then
        local oldKick = Player.Kick
        Player.Kick = function()
            return nil
        end
    end
end

local function AutoReconnect()
    task.spawn(function()
        while true do
            pcall(function()
                if #Players:GetPlayers() == 0 then
                    print("RECONNECTING...")
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            end)
            task.wait(10)
        end
    end)
end

local function AntiDetect()
    local oldHttpGet = HttpService.HttpGet
    HttpService.HttpGet = function(url)
        if string.find(url, "cheat") then
            return ""
        end
        return oldHttpGet(url)
    end
end

local function AntiReport()
    local oldFireServer = ReplicatedStorage.Remotes.ReportPlayer.FireServer
    ReplicatedStorage.Remotes.ReportPlayer.FireServer = function()
        return nil
    end
end

local function AutoRespawn()
    Player.CharacterAdded:Connect(function(char)
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
-- PHAN 3: KEY VA MA HOA
-- ============================================

local playerKey = getgenv().Key or ""

-- Danh sach key hop le (ma hoa)
local VALID_KEYS = {
    "a7f8e3d2c9b4a5f6e7d8c9b0a1f2e3d4",
    "b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3",
    "c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4",
    "d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5",
    "e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6",
    "f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7",
}

local function isValidKey(inputKey)
    for _, validKey in ipairs(VALID_KEYS) do
        if inputKey == validKey then
            return true
        end
    end
    return false
end

local keyValid = isValidKey(playerKey)

print("=========================================")
print("BANANA CAT HUB - KEY CHECK")
print("=========================================")
print("User: " .. Player.Name .. " (ID: " .. Player.UserId .. ")")
print("Key: " .. playerKey)
print("Status: " .. (keyValid and "VALID" or "INVALID"))
print("=========================================")

if not keyValid then
    safeKick("BANANA CAT HUB - Invalid Key")
    return
end

print("Key Valid - Loading Script...")

-- ============================================
-- PHAN 4: CAC HAM CO BAN
-- ============================================

function EquipWeapon(text)
    if not text then return end
    if plr.Backpack:FindFirstChild(text) then
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(text))
    end
end

function weaponSc(weapon)
    for _, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == weapon then 
                EquipWeapon(v.Name) 
            end
        end
    end
end

function _tp(target)
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    char.HumanoidRootPart.CFrame = typeof(target) == "CFrame" and target or CFrame.new(target)
end

function notween(p)
    plr.Character.HumanoidRootPart.CFrame = p
end

function GetBP(v)
    return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)
end

function GetIn(Name)
    for _, v1 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v1) == "table" then
            if v1.Name == Name or plr.Character:FindFirstChild(Name) or plr.Backpack:FindFirstChild(Name) then
                return true
            end
        end
    end
    return false
end

function GetM(Name)
    for _, tab in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type(tab) == "table" then
            if tab.Type == "Material" then
                if tab.Name == Name then
                    return tab.Count
                end
            end
        end
    end
    return 0
end

function GetWP(nametool)
    for _, v4 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v4) == "table" then
            if v4.Type == "Sword" then
                if v4.Name == nametool or plr.Character:FindFirstChild(nametool) or plr.Backpack:FindFirstChild(nametool) then
                    return true
                end
            end
        end
    end
    return false
end

function statsSetings(Num, value)
    if Num == "Melee" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", value)
        end
    elseif Num == "Defense" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", value)
        end
    elseif Num == "Sword" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", value)
        end
    elseif Num == "Gun" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", value)
        end
    elseif Num == "Devil" then
        if plr.Data.Points.Value ~= 0 then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", value)
        end
    end
end

function UseSkills(weapon, skill)
    if weapon == "Melee" then
        weaponSc("Melee")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif skill == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        end
    elseif weapon == "Sword" then
        weaponSc("Sword")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    elseif weapon == "Blox Fruit" then
        weaponSc("Blox Fruit")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        elseif skill == "C" then
            vim1:SendKeyEvent(true, "C", false, game)
            vim1:SendKeyEvent(false, "C", false, game)
        elseif skill == "V" then
            vim1:SendKeyEvent(true, "V", false, game)
            vim1:SendKeyEvent(false, "V", false, game)
        end
    elseif weapon == "Gun" then
        weaponSc("Gun")
        if skill == "Z" then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" then
            vim1:SendKeyEvent(true, "X", false, game)
            vim1:SendKeyEvent(false, "X", false, game)
        end
    end
    
    if weapon == "nil" and skill == "Y" then
        vim1:SendKeyEvent(true, "Y", false, game)
        vim1:SendKeyEvent(false, "Y", false, game)
    end
end

function Hop()
    pcall(function()
        for count = math.random(1, math.random(40, 75)), 100 do
            local remote = replicated.__ServerBrowser:InvokeServer(count)
            for _, v in next, remote do
                if tonumber(v['Count']) < 12 then 
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, _) 
                end
            end    
        end
    end)
end

function LowCpu()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

-- ============================================
-- PHAN 5: ATTACK CLASS
-- ============================================

Attack = {}
Attack.__index = Attack

Attack.Alive = function(model) 
    if not model then return end 
    local Humanoid = model:FindFirstChild("Humanoid")
    return Humanoid and Humanoid.Health > 0 
end

Attack.Kill = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then 
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame) 
        end
        local PosMon = model:GetAttribute("Locked").Position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local ToolTip = Equipped.ToolTip
        
        if ToolTip == "Blox Fruit" then 
            _tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0)) 
        else 
            _tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(180), 0))
        end
    end
end

Attack.KillSea = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then 
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame) 
        end
        local PosMon = model:GetAttribute("Locked").Position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local ToolTip = Equipped.ToolTip
        
        if ToolTip == "Blox Fruit" then 
            _tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0)) 
        else 
            notween(model.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8)) 
            wait(0.85)
            notween(model.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0)) 
            wait(1)
        end
    end
end

function BringEnemy()
    if not _B then return end
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            if (v.PrimaryPart.Position - PosMon).Magnitude <= 300 then
                v.PrimaryPart.CFrame = CFrame.new(PosMon)
                v.PrimaryPart.CanCollide = true
                v:FindFirstChild("Humanoid").WalkSpeed = 0
                v:FindFirstChild("Humanoid").JumpPower = 0
                if v.Humanoid:FindFirstChild("Animator") then 
                    v.Humanoid.Animator:Destroy()
                end
                plr.SimulationRadius = math.huge
            end
        end                               
    end                    	
end

function GetConnectionEnemies(a)
    for i, v in pairs(replicated:GetChildren()) do
        if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    
    for i, v in next, game.Workspace.Enemies:GetChildren() do
        if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

-- ============================================
-- PHAN 6: DANH SACH BOSS
-- ============================================

local Boss = {}
if World1 then
    Boss = {
        "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader",
        "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan",
        "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg",
        "Ice Admiral", "Greybeard"
    }
elseif World2 then
    Boss = {
        "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral",
        "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order"
    }
elseif World3 then
    Boss = {
        "Tyrant of the Skies", "Stone", "Hydra Leader", "Kilo Admiral",
        "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper"
    }
end

local tableBoss = Boss

-- ============================================
-- PHAN 7: DETECT FUNCTIONS
-- ============================================

function DetectMob(mobName)
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

function CheckNameBoss(bossName)
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

function IsMobAlive(mob)
    if not mob then return false end
    local humanoid = mob:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health > 0
end

function CheckBoat()
    for i, v in pairs(workspace.Boats:GetChildren()) do
        if tostring(v.Owner.Value) == tostring(plr.Name) then
            return v    
        end
    end
    return false
end

function CheckEnemiesBoat()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then
            return true    
        end
    end
    return false
end

function CheckPirateGrandBrigade()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then
            return true
        end
    end
    return false
end

function CheckShark()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Shark" and Attack.Alive(v) then
            return true    
        end
    end
    return false
end

function CheckTerrorShark()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Terrorshark" and Attack.Alive(v) then
            return true    
        end
    end
    return false
end

function CheckPiranha()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name == "Piranha" and Attack.Alive(v) then
            return true    
        end
    end
    return false
end

function CheckFishCrew()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then
            return true    
        end
    end
    return false
end

function CheckHauntedCrew()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then
            return true    
        end
    end
    return false
end

function CheckSeaBeast()
    if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
        return true  
    end
    return false
end

function CheckLeviathan()
    if workspace.SeaBeasts:FindFirstChild("Leviathan") then
        return true  
    end
    return false
end

function DetectSeaEvents()
    local seaEvents = {"SeaBeast1", "Terrorshark", "Ship", "Boat"}
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
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

function GetNearestChest()
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
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

function DetectElite()
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

-- ============================================
-- PHAN 8: QUEST FUNCTIONS
-- ============================================

function QuestCheck()
    local a = game.Players.LocalPlayer.Data.Level.Value
    local Mon, Qname, Qdata, NameMon, PosM, PosQ
    
    if World1 then
        if a == 1 or a <= 9 then
            if tostring(Player.Team) == "Marines" then
                Mon = "Trainee"; Qname = "MarineQuest"; Qdata = 1; NameMon = "Trainee"
                PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
                PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585)
            else
                Mon = "Bandit"; Qname = "BanditQuest1"; Qdata = 1; NameMon = "Bandit"
                PosM = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
                PosQ = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
            end
        elseif a == 10 or a <= 14 then
            Mon = "Monkey"; Qname = "JungleQuest"; Qdata = 1; NameMon = "Monkey"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif a == 15 or a <= 29 then
            Mon = "Gorilla"; Qname = "JungleQuest"; Qdata = 2; NameMon = "Gorilla"
            PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            PosM = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif a == 30 or a <= 39 then
            Mon = "Pirate"; Qname = "BuggyQuest1"; Qdata = 1; NameMon = "Pirate"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif a == 40 or a <= 59 then
            Mon = "Brute"; Qname = "BuggyQuest1"; Qdata = 2; NameMon = "Brute"
            PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498)
            PosM = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif a == 60 or a <= 74 then
            Mon = "Desert Bandit"; Qname = "DesertQuest"; Qdata = 1; NameMon = "Desert Bandit"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif a == 75 or a <= 89 then
            Mon = "Desert Officer"; Qname = "DesertQuest"; Qdata = 2; NameMon = "Desert Officer"
            PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            PosM = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif a == 90 or a <= 99 then
            Mon = "Snow Bandit"; Qname = "SnowQuest"; Qdata = 1; NameMon = "Snow Bandit"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif a == 100 or a <= 119 then
            Mon = "Snowman"; Qname = "SnowQuest"; Qdata = 2; NameMon = "Snowman"
            PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796)
            PosM = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
        elseif a == 120 or a <= 149 then
            Mon = "Chief Petty Officer"; Qname = "MarineQuest2"; Qdata = 1; NameMon = "Chief Petty Officer"
            PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            PosM = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif a == 150 or a <= 174 then
            Mon = "Sky Bandit"; Qname = "SkyQuest"; Qdata = 1; NameMon = "Sky Bandit"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif a == 175 or a <= 189 then
            Mon = "Dark Master"; Qname = "SkyQuest"; Qdata = 2; NameMon = "Dark Master"
            PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165)
            PosM = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif a == 190 or a <= 209 then
            Mon = "Prisoner"; Qname = "PrisonerQuest"; Qdata = 1; NameMon = "Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif a == 210 or a <= 249 then
            Mon = "Dangerous Prisoner"; Qname = "PrisonerQuest"; Qdata = 2; NameMon = "Dangerous Prisoner"
            PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514)
            PosM = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif a == 250 or a <= 274 then
            Mon = "Toga Warrior"; Qname = "ColosseumQuest"; Qdata = 1; NameMon = "Toga Warrior"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif a == 275 or a <= 299 then
            Mon = "Gladiator"; Qname = "ColosseumQuest"; Qdata = 2; NameMon = "Gladiator"
            PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534)
            PosM = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif a == 300 or a <= 324 then
            Mon = "Military Soldier"; Qname = "MagmaQuest"; Qdata = 1; NameMon = "Military Soldier"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif a == 325 or a <= 374 then
            Mon = "Military Spy"; Qname = "MagmaQuest"; Qdata = 2; NameMon = "Military Spy"
            PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395)
            PosM = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif a == 375 or a <= 399 then
            Mon = "Fishman Warrior"; Qname = "FishmanQuest"; Qdata = 1; NameMon = "Fishman Warrior"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
        elseif a == 400 or a <= 449 then
            Mon = "Fishman Commando"; Qname = "FishmanQuest"; Qdata = 2; NameMon = "Fishman Commando"
            PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosM = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif a == 450 or a <= 474 then
            Mon = "God's Guard"; Qname = "SkyExp1Quest"; Qdata = 1; NameMon = "God's Guard"
            PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643)
            PosM = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif a == 475 or a <= 524 then
            Mon = "Shanda"; Qname = "SkyExp1Quest"; Qdata = 2; NameMon = "Shanda"
            PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            PosM = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
        elseif a == 525 or a <= 549 then
            Mon = "Royal Squad"; Qname = "SkyExp2Quest"; Qdata = 1; NameMon = "Royal Squad"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif a == 550 or a <= 624 then
            Mon = "Royal Soldier"; Qname = "SkyExp2Quest"; Qdata = 2; NameMon = "Royal Soldier"
            PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            PosM = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif a == 625 or a <= 649 then
            Mon = "Galley Pirate"; Qname = "FountainQuest"; Qdata = 1; NameMon = "Galley Pirate"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif a >= 650 then
            Mon = "Galley Captain"; Qname = "FountainQuest"; Qdata = 2; NameMon = "Galley Captain"
            PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            PosM = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if a == 700 or a <= 724 then
            Mon = "Raider"; Qname = "Area1Quest"; Qdata = 1; NameMon = "Raider"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif a == 725 or a <= 774 then
            Mon = "Mercenary"; Qname = "Area1Quest"; Qdata = 2; NameMon = "Mercenary"
            PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            PosM = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif a == 775 or a <= 799 then
            Mon = "Swan Pirate"; Qname = "Area2Quest"; Qdata = 1; NameMon = "Swan Pirate"
            PosQ = CFrame.new(638.43811, 71.769989, 918.282898)
            PosM = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif a == 800 or a <= 874 then
            Mon = "Factory Staff"; Qname = "Area2Quest"; Qdata = 2; NameMon = "Factory Staff"
            PosQ = CFrame.new(632.698608, 73.1055908, 918.666321)
            PosM = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif a == 875 or a <= 899 then
            Mon = "Marine Lieutenant"; Qname = "MarineQuest3"; Qdata = 1; NameMon = "Marine Lieutenant"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif a == 900 or a <= 949 then
            Mon = "Marine Captain"; Qname = "MarineQuest3"; Qdata = 2; NameMon = "Marine Captain"
            PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            PosM = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif a == 950 or a <= 974 then
            Mon = "Zombie"; Qname = "ZombieQuest"; Qdata = 1; NameMon = "Zombie"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif a == 975 or a <= 999 then
            Mon = "Vampire"; Qname = "ZombieQuest"; Qdata = 2; NameMon = "Vampire"
            PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            PosM = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif a == 1000 or a <= 1049 then
            Mon = "Snow Trooper"; Qname = "SnowMountainQuest"; Qdata = 1; NameMon = "Snow Trooper"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif a == 1050 or a <= 1099 then
            Mon = "Winter Warrior"; Qname = "SnowMountainQuest"; Qdata = 2; NameMon = "Winter Warrior"
            PosQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            PosM = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif a == 1100 or a <= 1124 then
            Mon = "Lab Subordinate"; Qname = "IceSideQuest"; Qdata = 1; NameMon = "Lab Subordinate"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif a == 1125 or a <= 1174 then
            Mon = "Horned Warrior"; Qname = "IceSideQuest"; Qdata = 2; NameMon = "Horned Warrior"
            PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            PosM = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif a == 1175 or a <= 1199 then
            Mon = "Magma Ninja"; Qname = "FireSideQuest"; Qdata = 1; NameMon = "Magma Ninja"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif a == 1200 or a <= 1249 then
            Mon = "Lava Pirate"; Qname = "FireSideQuest"; Qdata = 2; NameMon = "Lava Pirate"
            PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            PosM = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif a == 1250 or a <= 1274 then
            Mon = "Ship Deckhand"; Qname = "ShipQuest1"; Qdata = 1; NameMon = "Ship Deckhand"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
        elseif a == 1275 or a <= 1299 then
            Mon = "Ship Engineer"; Qname = "ShipQuest1"; Qdata = 2; NameMon = "Ship Engineer"
            PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            PosM = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)
        elseif a == 1300 or a <= 1324 then
            Mon = "Ship Steward"; Qname = "ShipQuest2"; Qdata = 1; NameMon = "Ship Steward"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
        elseif a == 1325 or a <= 1349 then
            Mon = "Ship Officer"; Qname = "ShipQuest2"; Qdata = 2; NameMon = "Ship Officer"
            PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
            PosM = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
        elseif a == 1350 or a <= 1374 then
            Mon = "Arctic Warrior"; Qname = "FrostQuest"; Qdata = 1; NameMon = "Arctic Warrior"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
        elseif a == 1375 or a <= 1424 then
            Mon = "Snow Lurker"; Qname = "FrostQuest"; Qdata = 2; NameMon = "Snow Lurker"
            PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            PosM = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif a == 1425 or a <= 1449 then
            Mon = "Sea Soldier"; Qname = "ForgottenQuest"; Qdata = 1; NameMon = "Sea Soldier"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif a >= 1450 then
            Mon = "Water Fighter"; Qname = "ForgottenQuest"; Qdata = 2; NameMon = "Water Fighter"
            PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193)
            PosM = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif World3 then
        if a == 1500 or a <= 1524 then
            Mon = "Pirate Millionaire"; Qname = "PiratePortQuest"; Qdata = 1; NameMon = "Pirate Millionaire"
            PosQ = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625)
            PosM = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625)
        elseif a == 1525 or a <= 1574 then
            Mon = "Pistol Billionaire"; Qname = "PiratePortQuest"; Qdata = 2; NameMon = "Pistol Billionaire"
            PosQ = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625)
            PosM = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625)
        elseif a == 1575 or a <= 1599 then
            Mon = "Dragon Crew Warrior"; Qname = "AmazonQuest"; Qdata = 1; NameMon = "Dragon Crew Warrior"
            PosQ = CFrame.new(6779.03271484375, 111.16865539550781, -801.2130737304688)
            PosM = CFrame.new(6779.03271484375, 111.16865539550781, -801.2130737304688)
        elseif a == 1600 or a <= 1624 then
            Mon = "Dragon Crew Archer"; Qname = "AmazonQuest"; Qdata = 2; NameMon = "Dragon Crew Archer"
            PosQ = CFrame.new(6955.8974609375, 546.6658935546875, 309.0401306152344)
            PosM = CFrame.new(6955.8974609375, 546.6658935546875, 309.0401306152344)
        elseif a == 1625 or a <= 1649 then
            Mon = "Hydra Enforcer"; Qname = "VenomCrewQuest"; Qdata = 1; NameMon = "Hydra Enforcer"
            PosQ = CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219)
            PosM = CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219)
        elseif a == 1650 or a <= 1699 then
            Mon = "Venomous Assailant"; Qname = "VenomCrewQuest"; Qdata = 2; NameMon = "Venomous Assailant"
            PosQ = CFrame.new(4697.5918, 1100.65137, 946.401978)
            PosM = CFrame.new(4697.5918, 1100.65137, 946.401978)
        elseif a == 1700 or a <= 1724 then
            Mon = "Marine Commodore"; Qname = "MarineTreeIsland"; Qdata = 1; NameMon = "Marine Commodore"
            PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosM = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif a == 1725 or a <= 1774 then
            Mon = "Marine Rear Admiral"; Qname = "MarineTreeIsland"; Qdata = 2; NameMon = "Marine Rear Admiral"
            PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            PosM = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif a == 1775 or a <= 1799 then
            Mon = "Fishman Raider"; Qname = "DeepForestIsland3"; Qdata = 1; NameMon = "Fishman Raider"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosM = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif a == 1800 or a <= 1824 then
            Mon = "Fishman Captain"; Qname = "DeepForestIsland3"; Qdata = 2; NameMon = "Fishman Captain"
            PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosM = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625)
        elseif a == 1825 or a <= 1849 then
            Mon = "Forest Pirate"; Qname = "DeepForestIsland"; Qdata = 1; NameMon = "Forest Pirate"
            PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosM = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif a == 1850 or a <= 1899 then
            Mon = "Mythological Pirate"; Qname = "DeepForestIsland"; Qdata = 2; NameMon = "Mythological Pirate"
            PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif a == 1900 or a <= 1924 then
            Mon = "Jungle Pirate"; Qname = "DeepForestIsland2"; Qdata = 1; NameMon = "Jungle Pirate"
            PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif a == 1925 or a <= 1974 then
            Mon = "Musketeer Pirate"; Qname = "DeepForestIsland2"; Qdata = 2; NameMon = "Musketeer Pirate"
            PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosM = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif a == 1975 or a <= 1999 then
            Mon = "Reborn Skeleton"; Qname = "HauntedQuest1"; Qdata = 1; NameMon = "Reborn Skeleton"
            PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277)
            PosM = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif a == 2000 or a <= 2024 then
            Mon = "Living Zombie"; Qname = "HauntedQuest1"; Qdata = 2; NameMon = "Living Zombie"
            PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277)
            PosM = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif a == 2025 or a <= 2049 then
            Mon = "Demonic Soul"; Qname = "HauntedQuest2"; Qdata = 1; NameMon = "Demonic Soul"
            PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533)
            PosM = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif a == 2050 or a <= 2074 then
            Mon = "Posessed Mummy"; Qname = "HauntedQuest2"; Qdata = 2; NameMon = "Posessed Mummy"
            PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533)
            PosM = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif a == 2075 or a <= 2099 then
            Mon = "Peanut Scout"; Qname = "NutsIslandQuest"; Qdata = 1; NameMon = "Peanut Scout"
            PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
            PosM = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif a == 2100 or a <= 2124 then
            Mon = "Peanut President"; Qname = "NutsIslandQuest"; Qdata = 2; NameMon = "Peanut President"
            PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875)
            PosM = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif a == 2125 or a <= 2149 then
            Mon = "Ice Cream Chef"; Qname = "IceCreamIslandQuest"; Qdata = 1; NameMon = "Ice Cream Chef"
            PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
            PosM = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif a == 2150 or a <= 2199 then
            Mon = "Ice Cream Commander"; Qname = "IceCreamIslandQuest"; Qdata = 2; NameMon = "Ice Cream Commander"
            PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438)
            PosM = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif a == 2200 or a <= 2224 then
            Mon = "Cookie Crafter"; Qname = "CakeQuest1"; Qdata = 1; NameMon = "Cookie Crafter"
            PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
            PosM = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif a == 2225 or a <= 2249 then
            Mon = "Cake Guard"; Qname = "CakeQuest1"; Qdata = 2; NameMon = "Cake Guard"
            PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295)
            PosM = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif a == 2250 or a <= 2274 then
            Mon = "Baking Staff"; Qname = "CakeQuest2"; Qdata = 1; NameMon = "Baking Staff"
            PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
            PosM = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif a == 2275 or a <= 2299 then
            Mon = "Head Baker"; Qname = "CakeQuest2"; Qdata = 2; NameMon = "Head Baker"
            PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
            PosM = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif a == 2300 or a <= 2324 then
            Mon = "Cocoa Warrior"; Qname = "ChocQuest1"; Qdata = 1; NameMon = "Cocoa Warrior"
            PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            PosM = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif a == 2325 or a <= 2349 then
            Mon = "Chocolate Bar Battler"; Qname = "ChocQuest1"; Qdata = 2; NameMon = "Chocolate Bar Battler"
            PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            PosM = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif a == 2350 or a <= 2374 then
            Mon = "Sweet Thief"; Qname = "ChocQuest2"; Qdata = 1; NameMon = "Sweet Thief"
            PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            PosM = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif a == 2375 or a <= 2399 then
            Mon = "Candy Rebel"; Qname = "ChocQuest2"; Qdata = 2; NameMon = "Candy Rebel"
            PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            PosM = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif a == 2400 or a <= 2449 then
            Mon = "Candy Pirate"; Qname = "CandyQuest1"; Qdata = 1; NameMon = "Candy Pirate"
            PosQ = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            PosM = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif a == 2450 or a <= 2474 then
            Mon = "Isle Outlaw"; Qname = "TikiQuest1"; Qdata = 1; NameMon = "Isle Outlaw"
            PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125)
            PosM = CFrame.new(-16479.900390625, 226.6117401123047, -300.3114318847656)
        elseif a == 2475 or a <= 2499 then
            Mon = "Island Boy"; Qname = "TikiQuest1"; Qdata = 2; NameMon = "Island Boy"
            PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125)
            PosM = CFrame.new(-16849.396484375, 192.86505126953125, -150.7853240966797)
        elseif a == 2500 or a <= 2524 then
            Mon = "Sun-kissed Warrior"; Qname = "TikiQuest2"; Qdata = 1; NameMon = "Sun-kissed Warrior"
            PosQ = CFrame.new(-16538, 55, 1049)
            PosM = CFrame.new(-16347, 64, 984)
        elseif a == 2525 or a <= 2550 then
            Mon = "Isle Champion"; Qname = "TikiQuest2"; Qdata = 2; NameMon = "Isle Champion"
            PosQ = CFrame.new(-16541.0215, 57.3082275, 1051.46118)
            PosM = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875)
        elseif a >= 2551 and a <= 2574 then
            Mon = "Serpent Hunter"; Qname = "TikiQuest3"; Qdata = 1; NameMon = "Serpent Hunter"
            PosQ = CFrame.new(-16679.4785, 176.7473, 1474.3995)
            PosM = CFrame.new(-16679.4785, 176.7473, 1474.3995)
        elseif a >= 2575 and a <= 2599 then
            Mon = "Skull Slayer"; Qname = "TikiQuest3"; Qdata = 2; NameMon = "Skull Slayer"
            PosQ = CFrame.new(-16759.5898, 71.2837, 1595.3399)
            PosM = CFrame.new(-16759.5898, 71.2837, 1595.3399)
        elseif a >= 2600 and a <= 2624 then
            Mon = "Reef Bandit"; Qname = "SubmergedQuest1"; Qdata = 1; NameMon = "Reef Bandit"
            PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
            PosM = CFrame.new(10736.6191, -2087.8439, 9338.4882)
        elseif a >= 2625 and a <= 2649 then
            Mon = "Coral Pirate"; Qname = "SubmergedQuest1"; Qdata = 2; NameMon = "Coral Pirate"
            PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
            PosM = CFrame.new(10965.1025, -2158.8842, 9177.2597)
        elseif a >= 2650 and a <= 2674 then
            Mon = "Sea Chanter"; Qname = "SubmergedQuest2"; Qdata = 1; NameMon = "Sea Chanter"
            PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
            PosM = CFrame.new(10621.0342, -2087.8440, 10102.0332)
        elseif a >= 2675 and a <= 2699 then
            Mon = "Ocean Prophet"; Qname = "SubmergedQuest2"; Qdata = 2; NameMon = "Ocean Prophet"
            PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
            PosM = CFrame.new(11056.1445, -2001.6717, 10117.4493)
        elseif a >= 2700 and a <= 2724 then
            Mon = "High Disciple"; Qname = "SubmergedQuest3"; Qdata = 1; NameMon = "High Disciple"
            PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832)
            PosM = CFrame.new(9828.087890625, -1940.908935546875, 9693.0634765625)
        elseif a >= 2725 and a <= 2800 then
            Mon = "Grand Devotee"; Qname = "SubmergedQuest3"; Qdata = 2; NameMon = "Grand Devotee"
            PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832)
            PosM = CFrame.new(9557.5849609375, -1928.0404052734375, 9859.1826171875)
        end
    end
    return Mon, Qdata, Qname, PosM, NameMon, PosQ
end

function QuestNeta()
    local Mon, Qdata, Qname, PosM, NameMon, PosQ = QuestCheck()
    return {
        [1] = Mon,
        [2] = Qdata,
        [3] = Qname,
        [4] = PosM,
        [5] = NameMon,
        [6] = PosQ
    }
end

-- ============================================
-- PHAN 9: MATERIAL FUNCTIONS
-- ============================================

local MaterialList = {}
if World1 then
    MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then
    MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then
    MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end

function MaterialMon()
    local SelectMaterial = _G.SelectMaterial
    local MMon, MPos
    
    if World1 then
        if SelectMaterial == "Angel Wings" then
            MMon = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"}
            MPos = CFrame.new(-4698, 845, -1912)
        elseif SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Brute", "Pirate"}
            MPos = CFrame.new(-1145, 15, 4350)
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Military Soldier", "Military Spy", "Magma Admiral"}
            MPos = CFrame.new(-5815, 84, 8820)
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
            MPos = CFrame.new(61123, 19, 1569)
        end
    elseif World2 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = {"Marine Captain"}
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
        elseif SelectMaterial == "Magma Ore" then
            MMon = {"Magma Ninja", "Lava Pirate"}
            MPos = CFrame.new(-5428, 78, -5959)
        elseif SelectMaterial == "Ectoplasm" then
            MMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
            MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = {"Water Fighter"}
            MPos = CFrame.new(-3385, 239, -10542)
        elseif SelectMaterial == "Radioactive Material" then
            MMon = {"Factory Staff"}
            MPos = CFrame.new(295, 73, -56)
        elseif SelectMaterial == "Vampire Fang" then
            MMon = {"Vampire"}
            MPos = CFrame.new(-6033, 7, -1317)
        end
    elseif World3 then
        if SelectMaterial == "Scrap Metal" then
            MMon = {"Jungle Pirate", "Forest Pirate"}
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
        elseif SelectMaterial == "Fish Tail" then
            MMon = {"Fishman Raider", "Fishman Captain"}
            MPos = CFrame.new(-10993, 332, -8940)
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = {"Chocolate Bar Battler", "Cocoa Warrior"}
            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
        elseif SelectMaterial == "Dragon Scale" then
            MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
            MPos = CFrame.new(6594, 383, 139)
        elseif SelectMaterial == "Gunpowder" then
            MMon = {"Pistol Billionaire"}
            MPos = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)
        elseif SelectMaterial == "Mini Tusk" then
            MMon = {"Mythological Pirate"}
            MPos = CFrame.new(-13545, 470, -6917)
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = {"Demonic Soul"}
            MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
        end
    end
    return MMon, MPos
end

-- ============================================
-- PHAN 10: GLOBAL VARIABLES
-- ============================================

_G.SelectWeapon = "Melee"
_G.SelectBoat = "Brigade"
_G.StartFarm = false
_G.AutoSeaEvent = false
_G.AutoTrial = false
_G.AutoChest = false
_G.AutoBoss = false
_G.AutoAllBoss = false
_G.AutoElite = false
_G.AutoYama = false
_G.AutoTushita = false
_G.AutoCDK = false
_G.AutoSoulGuitar = false
_G.AutoSaber = false
_G.AutoRainbowHaki = false
_G.AutoUpgradeRace = false
_G.AutoGetGhoul = false
_G.AutoGetCyborg = false
_G.AutoFishing = false
_G.AutoDungeon = false
_G.AutoRaid = false
_G.AutoFactory = false
_G.AutoPirateRaid = false
_G.AutoRipIndra = false
_G.AutoSoulReaper = false
_G.AutoDoughKing = false
_G.AutoDarkbeard = false
_G.AutoEliteHunter = false
_G.AutoTouchPadHaki = false
_G.AutoFireFlowers = false
_G.AutoBerry = false
_G.AutoPrehistoric = false
_G.AutoKitsune = false
_G.AutoLeviathan = false
_G.AutoCraftVolcanicMagnet = false
_G.AutoQuestDojo = false
_G.AutoQuestDragonHunter = false
_G.ESPPlayer = false
_G.ESPIsland = false
_G.ESPFruit = false
_G.ESPBerry = false

-- ============================================
-- PHAN 11: UI
-- ============================================

local Library = loadstring(game:HttpGet("https://pastefy.app/vgSGtrbP/raw"))()

local Window = Library:CreateWindow({
    Title = "Banana Cat Hub",
    Subtitle = "- Blox Fruit | Key: " .. string.sub(getgenv().Key, 1, 10) .. "...",
    Image = "rbxassetid://130947856929902"
})

-- ============================================
-- TAB: FARM
-- ============================================
local FarmTab = Window:AddTab("Farm")
local FarmGroup = FarmTab:AddLeftGroupbox("Auto Farm")

FarmGroup:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Blox Fruit"},
    Default = "Melee",
    Callback = function(Value)
        _G.SelectWeapon = Value
    end
})

FarmGroup:AddToggle("BringMob", {
    Title = "Bring Mob",
    Default = false,
    Callback = function(Value)
        _B = Value
    end
})

FarmGroup:AddToggle("StartFarm", {
    Title = "Start Farm",
    Default = false,
    Callback = function(Value)
        _G.StartFarm = Value
        if Value then
            task.spawn(function()
                while _G.StartFarm do
                    pcall(function()
                        local questData = QuestNeta()
                        if questData then
                            if not Player.PlayerGui.Main.Quest.Visible then
                                _tp(questData[6])
                                task.wait(0.5)
                                CommF_Remote:InvokeServer("StartQuest", questData[3], questData[2])
                            else
                                local mob = DetectMob(questData[1])
                                if mob then
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                    ClickM1(mob)
                                else
                                    _tp(questData[4])
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

BossGroup:AddDropdown("SelectBoss", {
    Title = "Select Boss",
    Values = Boss,
    Default = Boss[1],
    Callback = function(Value)
        _G.SelectBoss = Value
    end
})

BossGroup:AddToggle("AutoBoss", {
    Title = "Auto Kill Boss",
    Default = false,
    Callback = function(Value)
        _G.AutoBoss = Value
        if Value then
            task.spawn(function()
                while _G.AutoBoss do
                    local boss = CheckNameBoss(_G.SelectBoss)
                    if boss then
                        _tp(boss.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                        ClickM1(boss)
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
        _G.AutoAllBoss = Value
        if Value then
            task.spawn(function()
                while _G.AutoAllBoss do
                    for _, bossName in ipairs(Boss) do
                        if not _G.AutoAllBoss then break end
                        local boss = CheckNameBoss(bossName)
                        if boss then
                            _tp(boss.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                            ClickM1(boss)
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
        _G.AutoElite = Value
        if Value then
            task.spawn(function()
                while _G.AutoElite do
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

-- ============================================
-- TAB: SEA EVENT
-- ============================================
local SeaTab = Window:AddTab("Sea Event")
local SeaGroup = SeaTab:AddLeftGroupbox("Sea Event")

SeaGroup:AddDropdown("SelectBoat", {
    Title = "Select Boat",
    Values = {"Brigade", "GrandBrigade", "Beast Hunter", "Sloop"},
    Default = "Brigade",
    Callback = function(Value)
        _G.SelectBoat = Value
    end
})

SeaGroup:AddToggle("AutoSeaEvent", {
    Title = "Auto Sea Event",
    Default = false,
    Callback = function(Value)
        _G.AutoSeaEvent = Value
        if Value then
            task.spawn(function()
                while _G.AutoSeaEvent do
                    pcall(function()
                        local boat = CheckBoat()
                        if not boat then
                            _tp(CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375))
                            task.wait(0.5)
                            CommF_Remote:InvokeServer("BuyBoat", _G.SelectBoat)
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

SeaGroup:AddToggle("AutoFindLeviathan", {
    Title = "Auto Find Leviathan",
    Default = false,
    Callback = function(Value)
        _G.AutoFindLeviathan = Value
    end
})

SeaGroup:AddToggle("AutoFindPrehistoric", {
    Title = "Auto Find Prehistoric Island",
    Default = false,
    Callback = function(Value)
        _G.AutoFindPrehistoric = Value
    end
})

-- ============================================
-- TAB: RACE
-- ============================================
local RaceTab = Window:AddTab("Race")
local RaceGroup = RaceTab:AddLeftGroupbox("Auto Race")

RaceGroup:AddToggle("AutoTrial", {
    Title = "Auto Trial",
    Default = false,
    Callback = function(Value)
        _G.AutoTrial = Value
        if Value then
            task.spawn(function()
                while _G.AutoTrial do
                    pcall(function()
                        local temple = Workspace.Map:FindFirstChild("Temple of Time")
                        if temple then
                            local race = Player.Data.Race.Value
                            local door = temple[race .. "Corridor"].Door.Door.RightDoor.Union
                            if door then
                                _tp(door.CFrame)
                                vim1:SendKeyEvent(true, "T", false, game)
                                task.wait()
                                vim1:SendKeyEvent(false, "T", false, game)
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
        _G.AutoUpgradeRace = Value
    end
})

RaceGroup:AddToggle("AutoGetGhoul", {
    Title = "Auto Get Ghoul",
    Default = false,
    Callback = function(Value)
        _G.AutoGetGhoul = Value
    end
})

RaceGroup:AddToggle("AutoGetCyborg", {
    Title = "Auto Get Cyborg",
    Default = false,
    Callback = function(Value)
        _G.AutoGetCyborg = Value
    end
})

-- ============================================
-- TAB: WEAPON
-- ============================================
local WeaponTab = Window:AddTab("Weapon")
local WeaponGroup = WeaponTab:AddLeftGroupbox("Auto Weapon")

WeaponGroup:AddToggle("AutoYama", {
    Title = "Auto Yama",
    Default = false,
    Callback = function(Value)
        _G.AutoYama = Value
    end
})

WeaponGroup:AddToggle("AutoTushita", {
    Title = "Auto Tushita",
    Default = false,
    Callback = function(Value)
        _G.AutoTushita = Value
    end
})

WeaponGroup:AddToggle("AutoCDK", {
    Title = "Auto CDK",
    Default = false,
    Callback = function(Value)
        _G.AutoCDK = Value
    end
})

WeaponGroup:AddToggle("AutoSoulGuitar", {
    Title = "Auto Soul Guitar",
    Default = false,
    Callback = function(Value)
        _G.AutoSoulGuitar = Value
    end
})

WeaponGroup:AddToggle("AutoSaber", {
    Title = "Auto Saber",
    Default = false,
    Callback = function(Value)
        _G.AutoSaber = Value
    end
})

WeaponGroup:AddToggle("AutoRainbowHaki", {
    Title = "Auto Rainbow Haki",
    Default = false,
    Callback = function(Value)
        _G.AutoRainbowHaki = Value
    end
})

-- ============================================
-- TAB: CHEST
-- ============================================
local ChestTab = Window:AddTab("Chest")
local ChestGroup = ChestTab:AddLeftGroupbox("Auto Chest")

ChestGroup:AddToggle("AutoChest", {
    Title = "Auto Chest",
    Default = false,
    Callback = function(Value)
        _G.AutoChest = Value
        if Value then
            task.spawn(function()
                while _G.AutoChest do
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

ChestGroup:AddToggle("AutoChestHop", {
    Title = "Auto Chest Hop",
    Default = false,
    Callback = function(Value)
        _G.AutoChestHop = Value
    end
})

-- ============================================
-- TAB: AFK & TOKEN
-- ============================================
local AFKTab = Window:AddTab("AFK & Token")
local AFKGroup = AFKTab:AddLeftGroupbox("AFK Mode")

AFKGroup:AddToggle("AFKMode", {
    Title = "Auto AFK Mode",
    Default = false,
    Callback = function(Value)
        _G.AFKMode = Value
        if Value then
            task.spawn(function()
                while _G.AFKMode do
                    pcall(function()
                        local vu = VirtualUser
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
    end
})

AFKGroup:AddToggle("AutoToken", {
    Title = "Auto Token Farm",
    Default = false,
    Callback = function(Value)
        _G.AutoToken = Value
        if Value then
            task.spawn(function()
                while _G.AutoToken do
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
    end
})

-- ============================================
-- TAB: ESP
-- ============================================
local ESPTab = Window:AddTab("ESP")
local ESPGroup = ESPTab:AddLeftGroupbox("ESP Settings")

ESPGroup:AddToggle("ESPPlayer", {
    Title = "ESP Player",
    Default = false,
    Callback = function(Value)
        _G.ESPPlayer = Value
    end
})

ESPGroup:AddToggle("ESPIsland", {
    Title = "ESP Island",
    Default = false,
    Callback = function(Value)
        _G.ESPIsland = Value
    end
})

ESPGroup:AddToggle("ESPFruit", {
    Title = "ESP Fruit",
    Default = false,
    Callback = function(Value)
        _G.ESPFruit = Value
    end
})

ESPGroup:AddToggle("ESPBerry", {
    Title = "ESP Berry",
    Default = false,
    Callback = function(Value)
        _G.ESPBerry = Value
    end
})

-- ============================================
-- TAB: PVP
-- ============================================
local PVPTab = Window:AddTab("PVP")
local PVPGroup = PVPTab:AddLeftGroupbox("PVP Settings")

local playerList = {}
for _, p in ipairs(Players:GetPlayers()) do
    table.insert(playerList, p.Name)
end

PVPGroup:AddDropdown("SelectPlayer", {
    Title = "Select Player PVP",
    Values = playerList,
    Default = playerList[1],
    Callback = function(Value)
        _G.SelectPlayerPVP = Value
    end
})

PVPGroup:AddToggle("TeleportPlayer", {
    Title = "Teleport Player",
    Default = false,
    Callback = function(Value)
        _G.TeleportPlayer = Value
        if Value then
            task.spawn(function()
                while _G.TeleportPlayer do
                    pcall(function()
                        local target = Players:FindFirstChild(_G.SelectPlayerPVP)
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            _tp(target.Character.HumanoidRootPart.CFrame)
                        end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

-- ============================================
-- PHAN 12: FUNCTIONS FOR UI CALLBACKS
-- ============================================

local function ClickM1(target)
    if not target or not IsMobAlive(target) then return end
    local char = plr.Character
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

-- ============================================
-- PHAN 13: FISHING
-- ============================================

local FishingConfig = require(ReplicatedStorage.FishReplicated.FishingClient.Config)
local FishingRequest = ReplicatedStorage.FishReplicated.FishingRequest
local JobsRemoteFunction = ReplicatedStorage.Modules.Net["RF/JobsRemoteFunction"]
local RFCraft = ReplicatedStorage.Modules.Net["RF/Craft"]
local GetWaterHeightAtLocation = require(ReplicatedStorage.Util.GetWaterHeightAtLocation)

local function EquipRod()
    local char = plr.Character
    if not char then return end
    local SelectedRod = _G.SelectedRod or "Fishing Rod"
    local rod = plr.Backpack:FindFirstChild(SelectedRod) or char:FindFirstChild(SelectedRod)
    if rod then
        char.Humanoid:EquipTool(rod)
        return true
    end
    return false
end

local function CastLine()
    pcall(function()
        FishingRequest:InvokeServer("StartCasting")
        task.wait(0.7)
        local waterY = GetWaterHeightAtLocation(plr.Character.HumanoidRootPart.Position)
        local targetPos = plr.Character.HumanoidRootPart.Position + Vector3.new(0, waterY - 10, 0)
        FishingRequest:InvokeServer("CastLineAtLocation", targetPos, 100, true)
    end)
end

local function CatchFish()
    pcall(function()
        FishingRequest:InvokeServer("Catching", 1)
        task.wait(0.25)
        FishingRequest:InvokeServer("Catch", 1)
    end)
end

-- ============================================
-- PHAN 14: DUNGEON
-- ============================================

local function AutoDungeonFarm()
    if not _G.AutoDungeon then return end
    task.spawn(function()
        while _G.AutoDungeon do
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
-- PHAN 15: RAID
-- ============================================

local function AutoRaidFarm()
    if not _G.AutoRaid then return end
    task.spawn(function()
        while _G.AutoRaid do
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
-- PHAN 16: FACTORY
-- ============================================

local function AutoFactoryFarm()
    if not _G.AutoFactory then return end
    task.spawn(function()
        while _G.AutoFactory do
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
-- PHAN 17: RIP INDRA
-- ============================================

local function AutoRipIndraFarm()
    if not _G.AutoRipIndra then return end
    task.spawn(function()
        while _G.AutoRipIndra do
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
-- PHAN 18: SOUL REAPER
-- ============================================

local function AutoSoulReaperFarm()
    if not _G.AutoSoulReaper then return end
    task.spawn(function()
        while _G.AutoSoulReaper do
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
-- PHAN 19: DOUGH KING
-- ============================================

local function AutoDoughKingFarm()
    if not _G.AutoDoughKing then return end
    task.spawn(function()
        while _G.AutoDoughKing do
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
-- PHAN 20: DARKBEARD
-- ============================================

local function AutoDarkbeardFarm()
    if not _G.AutoDarkbeard then return end
    task.spawn(function()
        while _G.AutoDarkbeard do
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
-- PHAN 21: ELITE HUNTER
-- ============================================

local function AutoEliteHunterFarm()
    if not _G.AutoEliteHunter then return end
    task.spawn(function()
        while _G.AutoEliteHunter do
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
-- PHAN 22: TOUCH PAD HAKI
-- ============================================

local function AutoTouchPadHakiFarm()
    if not _G.AutoTouchPadHaki or not World3 then return end
    task.spawn(function()
        while _G.AutoTouchPadHaki do
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
-- PHAN 23: FIRE FLOWERS
-- ============================================

local function AutoFireFlowersFarm()
    if not _G.AutoFireFlowers then return end
    task.spawn(function()
        while _G.AutoFireFlowers do
            pcall(function()
                local fireFlower = Workspace:FindFirstChild("FireFlowers")
                if fireFlower then
                    for _, flower in pairs(fireFlower:GetChildren()) do
                        if flower:IsA("Model") and flower:FindFirstChild("PrimaryPart") then
                            _tp(flower.PrimaryPart.CFrame)
                            task.wait(0.5)
                            vim1:SendKeyEvent(true, "E", false, game)
                            task.wait(0.5)
                            vim1:SendKeyEvent(false, "E", false, game)
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end

-- ============================================
-- PHAN 24: BERRY
-- ============================================

local function AutoBerryFarm()
    if not _G.AutoBerry then return end
    task.spawn(function()
        while _G.AutoBerry do
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
-- PHAN 25: PREHISTORIC
-- ============================================

local function AutoPrehistoricFarm()
    if not _G.AutoPrehistoric then return end
    task.spawn(function()
        while _G.AutoPrehistoric do
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
-- PHAN 26: KITSUNE
-- ============================================

local function AutoKitsuneFarm()
    if not _G.AutoKitsune then return end
    task.spawn(function()
        while _G.AutoKitsune do
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
-- PHAN 27: LEVIATHAN
-- ============================================

local function AutoLeviathanFarm()
    if not _G.AutoLeviathan then return end
    task.spawn(function()
        while _G.AutoLeviathan do
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
-- PHAN 28: CRAFT VOLCANIC MAGNET
-- ============================================

local function AutoCraftVolcanicMagnetFarm()
    if not _G.AutoCraftVolcanicMagnet then return end
    task.spawn(function()
        while _G.AutoCraftVolcanicMagnet do
            pcall(function()
                CommF_Remote:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
            end)
            task.wait(2)
        end
    end)
end

-- ============================================
-- PHAN 29: QUEST DOJO
-- ============================================

local function AutoQuestDojoFarm()
    if not _G.AutoQuestDojo then return end
    task.spawn(function()
        while _G.AutoQuestDojo do
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
-- PHAN 30: QUEST DRAGON HUNTER
-- ============================================

local function AutoQuestDragonHunterFarm()
    if not _G.AutoQuestDragonHunter then return end
    task.spawn(function()
        while _G.AutoQuestDragonHunter do
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
-- PHAN 31: EXTRA UI TOGGLES
-- ============================================

-- Add Fishing tab
local FishingTab = Window:AddTab("Fishing")
local FishingGroup = FishingTab:AddLeftGroupbox("Auto Fishing")

FishingGroup:AddDropdown("SelectRod", {
    Title = "Select Rod",
    Values = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"},
    Default = "Fishing Rod",
    Callback = function(Value)
        _G.SelectedRod = Value
    end
})

FishingGroup:AddToggle("AutoFishing", {
    Title = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        _G.AutoFishing = Value
        if Value then
            task.spawn(function()
                while _G.AutoFishing do
                    pcall(function()
                        EquipRod()
                        CastLine()
                        task.wait(2)
                        CatchFish()
                    end)
                    task.wait()
                end
            end)
        end
    end
})

-- Add Extra tab
local ExtraTab = Window:AddTab("Extra")
local ExtraGroup = ExtraTab:AddLeftGroupbox("Extra Features")

ExtraGroup:AddToggle("AutoDungeon", {
    Title = "Auto Dungeon",
    Default = false,
    Callback = function(Value)
        _G.AutoDungeon = Value
        if Value then AutoDungeonFarm() end
    end
})

ExtraGroup:AddToggle("AutoRaid", {
    Title = "Auto Raid",
    Default = false,
    Callback = function(Value)
        _G.AutoRaid = Value
        if Value then AutoRaidFarm() end
    end
})

ExtraGroup:AddToggle("AutoFactory", {
    Title = "Auto Factory",
    Default = false,
    Callback = function(Value)
        _G.AutoFactory = Value
        if Value then AutoFactoryFarm() end
    end
})

ExtraGroup:AddToggle("AutoRipIndra", {
    Title = "Auto Rip Indra",
    Default = false,
    Callback = function(Value)
        _G.AutoRipIndra = Value
        if Value then AutoRipIndraFarm() end
    end
})

ExtraGroup:AddToggle("AutoSoulReaper", {
    Title = "Auto Soul Reaper",
    Default = false,
    Callback = function(Value)
        _G.AutoSoulReaper = Value
        if Value then AutoSoulReaperFarm() end
    end
})

ExtraGroup:AddToggle("AutoDoughKing", {
    Title = "Auto Dough King",
    Default = false,
    Callback = function(Value)
        _G.AutoDoughKing = Value
        if Value then AutoDoughKingFarm() end
    end
})

ExtraGroup:AddToggle("AutoDarkbeard", {
    Title = "Auto Darkbeard",
    Default = false,
    Callback = function(Value)
        _G.AutoDarkbeard = Value
        if Value then AutoDarkbeardFarm() end
    end
})

ExtraGroup:AddToggle("AutoEliteHunter", {
    Title = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        _G.AutoEliteHunter = Value
        if Value then AutoEliteHunterFarm() end
    end
})

ExtraGroup:AddToggle("AutoTouchPadHaki", {
    Title = "Auto Touch Pad Haki",
    Default = false,
    Callback = function(Value)
        _G.AutoTouchPadHaki = Value
        if Value then AutoTouchPadHakiFarm() end
    end
})

ExtraGroup:AddToggle("AutoFireFlowers", {
    Title = "Auto Fire Flowers",
    Default = false,
    Callback = function(Value)
        _G.AutoFireFlowers = Value
        if Value then AutoFireFlowersFarm() end
    end
})

ExtraGroup:AddToggle("AutoBerry", {
    Title = "Auto Berry",
    Default = false,
    Callback = function(Value)
        _G.AutoBerry = Value
        if Value then AutoBerryFarm() end
    end
})

ExtraGroup:AddToggle("AutoPrehistoric", {
    Title = "Auto Prehistoric",
    Default = false,
    Callback = function(Value)
        _G.AutoPrehistoric = Value
        if Value then AutoPrehistoricFarm() end
    end
})

ExtraGroup:AddToggle("AutoKitsune", {
    Title = "Auto Kitsune",
    Default = false,
    Callback = function(Value)
        _G.AutoKitsune = Value
        if Value then AutoKitsuneFarm() end
    end
})

ExtraGroup:AddToggle("AutoLeviathan", {
    Title = "Auto Leviathan",
    Default = false,
    Callback = function(Value)
        _G.AutoLeviathan = Value
        if Value then AutoLeviathanFarm() end
    end
})

ExtraGroup:AddToggle("AutoCraftVolcanicMagnet", {
    Title = "Auto Craft Volcanic Magnet",
    Default = false,
    Callback = function(Value)
        _G.AutoCraftVolcanicMagnet = Value
        if Value then AutoCraftVolcanicMagnetFarm() end
    end
})

ExtraGroup:AddToggle("AutoQuestDojo", {
    Title = "Auto Quest Dojo",
    Default = false,
    Callback = function(Value)
        _G.AutoQuestDojo = Value
        if Value then AutoQuestDojoFarm() end
    end
})

ExtraGroup:AddToggle("AutoQuestDragonHunter", {
    Title = "Auto Quest Dragon Hunter",
    Default = false,
    Callback = function(Value)
        _G.AutoQuestDragonHunter = Value
        if Value then AutoQuestDragonHunterFarm() end
    end
})

-- ============================================
-- PHAN 32: STATUS LABELS
-- ============================================

local StatusTab = Window:AddTab("Status")
local StatusGroup = StatusTab:AddLeftGroupbox("Status")

StatusGroup:AddLabel("User: " .. Player.Name .. " (ID: " .. Player.UserId .. ")")
StatusGroup:AddLabel("Key: " .. getgenv().Key)
StatusGroup:AddLabel("World: " .. (World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown"))

-- ============================================
-- PHAN 33: AUTO START FEATURES
-- ============================================

-- Auto start features based on toggles
task.spawn(function()
    while task.wait(1) do
        if _G.AutoFishing then
            -- Fishing handled in its own loop
        end
    end
end)

print("=========================================")
print("BANANA CAT HUB - LOADED")
print("=========================================")
print("User: " .. Player.Name .. " (ID: " .. Player.UserId .. ")")
print("Key: " .. getgenv().Key)
print("World: " .. (World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown"))
print("Total Bosses: " .. #Boss)
print("Features: Farm, Boss, Elite, Sea Event, Race, Weapon, Chest, AFK, Token, ESP, PVP, Fishing, Dungeon, Raid")
print("=========================================")