-- ============================================================
-- BANANA CAT HUB - LOADING SCREEN
-- By TUNGLINHDEV
-- ============================================================
CoreGui = game:GetService("CoreGui")
TweenService = game:GetService("TweenService")
Players = game:GetService("Players")

-- Xóa loading cũ nếu có
if CoreGui:FindFirstChild("BananaCatHub_Loading") then
    CoreGui:FindFirstChild("BananaCatHub_Loading"):Destroy()
end

-- Tạo ScreenGui
LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "BananaCatHub_Loading"
LoadingGui.ResetOnSpawn = false
LoadingGui.IgnoreGuiInset = true
LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadingGui.DisplayOrder = 999
LoadingGui.Parent = CoreGui

-- Background tối
Backdrop = Instance.new("Frame")
Backdrop.Name = "Backdrop"
Backdrop.Size = UDim2.new(1, 0, 1, 0)
Backdrop.Position = UDim2.new(0, 0, 0, 0)
Backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Backdrop.BackgroundTransparency = 0.5
Backdrop.BorderSizePixel = 0
Backdrop.ZIndex = 1
Backdrop.Parent = LoadingGui

-- Main frame
MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 520, 0, 280)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 2
MainFrame.Parent = LoadingGui

MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 165, 0)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.4
MainStroke.Parent = MainFrame

-- Logo
Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.AnchorPoint = Vector2.new(0.5, 0)
Logo.Position = UDim2.new(0.5, 0, 0, 20)
Logo.Size = UDim2.new(0, 70, 0, 70)
Logo.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
Logo.BorderSizePixel = 0
Logo.Image = "rbxassetid://130947856929902"
Logo.ZIndex = 3
Logo.Parent = MainFrame

LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = Logo

-- Title
Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Position = UDim2.new(0.5, 0, 0, 100)
Title.Size = UDim2.new(1, 0, 0, 32)
Title.BackgroundTransparency = 1
Title.Text = "Banana Cat Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26
Title.ZIndex = 3
Title.Parent = MainFrame

-- Subtitle
SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.AnchorPoint = Vector2.new(0.5, 0)
SubTitle.Position = UDim2.new(0.5, 0, 0, 132)
SubTitle.Size = UDim2.new(1, 0, 0, 18)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "SECURE WHITELIST v2.0"
SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.ZIndex = 3
SubTitle.Parent = MainFrame

-- Status log box
LogBox = Instance.new("Frame")
LogBox.Name = "LogBox"
LogBox.AnchorPoint = Vector2.new(0.5, 0)
LogBox.Position = UDim2.new(0.5, 0, 0, 160)
LogBox.Size = UDim2.new(0.88, 0, 0, 55)
LogBox.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
LogBox.BorderSizePixel = 0
LogBox.ZIndex = 3
LogBox.Parent = MainFrame

LogBoxCorner = Instance.new("UICorner")
LogBoxCorner.CornerRadius = UDim.new(0, 8)
LogBoxCorner.Parent = LogBox

LogLabel = Instance.new("TextLabel")
LogLabel.Name = "LogLabel"
LogLabel.Size = UDim2.new(1, -20, 1, 0)
LogLabel.Position = UDim2.new(0, 10, 0, 0)
LogLabel.BackgroundTransparency = 1
LogLabel.Text = ""
LogLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
LogLabel.Font = Enum.Font.Code
LogLabel.TextSize = 12
LogLabel.TextXAlignment = Enum.TextXAlignment.Left
LogLabel.TextYAlignment = Enum.TextYAlignment.Top
LogLabel.TextWrapped = true
LogLabel.ZIndex = 4
LogLabel.Parent = LogBox

-- Progress bar background
BarBg = Instance.new("Frame")
BarBg.Name = "BarBg"
BarBg.AnchorPoint = Vector2.new(0.5, 0)
BarBg.Position = UDim2.new(0.5, 0, 0, 228)
BarBg.Size = UDim2.new(0.88, 0, 0, 10)
BarBg.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
BarBg.BorderSizePixel = 0
BarBg.ZIndex = 3
BarBg.Parent = MainFrame

BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

-- Progress bar fill
BarFill = Instance.new("Frame")
BarFill.Name = "BarFill"
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
BarFill.BorderSizePixel = 0
BarFill.ZIndex = 4
BarFill.Parent = BarBg

BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

-- Glow effect cho fill
BarFillGradient = Instance.new("UIGradient")
BarFillGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 120, 0))
})
BarFillGradient.Parent = BarFill

-- Percent
Percent = Instance.new("TextLabel")
Percent.Name = "Percent"
Percent.AnchorPoint = Vector2.new(1, 0)
Percent.Position = UDim2.new(1, -20, 0, 245)
Percent.Size = UDim2.new(0, 80, 0, 20)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.TextColor3 = Color3.fromRGB(255, 165, 0)
Percent.Font = Enum.Font.GothamBold
Percent.TextSize = 14
Percent.TextXAlignment = Enum.TextXAlignment.Right
Percent.ZIndex = 4
Percent.Parent = MainFrame

-- Status text
StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.AnchorPoint = Vector2.new(0, 0)
StatusText.Position = UDim2.new(0, 20, 0, 245)
StatusText.Size = UDim2.new(0.7, 0, 0, 20)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Đang khởi tạo..."
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 13
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.ZIndex = 4
StatusText.Parent = MainFrame

-- ============================================================
-- DANH SÁCH LOG
-- ============================================================
LoadingSteps = {
    {Percent = 5,  Status = "Khởi tạo...",              Log = "Whitelist v5.2 starting..."},
    {Percent = 12, Status = "Xác minh environment...",  Log = "Environment verified."},
    {Percent = 20, Status = "Kết nối server...",        Log = "Establishing secure session..."},
    {Percent = 30, Status = "Kiểm tra whitelist...",    Log = "Checking whitelist..."},
    {Percent = 40, Status = "Tải module...",            Log = "Loading modules..."},
    {Percent = 50, Status = "Tải UI library...",        Log = "Loading Fluent UI..."},
    {Percent = 60, Status = "Đang xác thực...",         Log = "Authenticating..."},
    {Percent = 70, Status = "Đang tải script...",       Log = "Decrypting script..."},
    {Percent = 80, Status = "Đang chuẩn bị...",         Log = "Preparing functions..."},
    {Percent = 90, Status = "Sắp xong...",              Log = "Almost there..."},
    {Percent = 95, Status = "Hoàn tất...",              Log = "Finalizing..."},
    {Percent = 100, Status = "Thành công!",             Log = "Encrypted session active."}
}

-- ============================================================
-- HÀM UPDATE
-- ============================================================
currentLog = ""

local function AddLog(text)
    currentLog = currentLog .. text .. "\n"
    LogLabel.Text = currentLog
end

local function UpdateProgress(percent, status)
    BarFill.Size = UDim2.new(percent / 100, 0, 1, 0)
    Percent.Text = percent .. "%"
    StatusText.Text = status
end

-- ============================================================
-- CHẠY ANIMATION
-- ============================================================
StartTime = tick()
TotalDuration = 3 -- Giây

for _, step in ipairs(LoadingSteps) do
    local targetTime = StartTime + (step.Percent / 100) * TotalDuration
    local waitTime = targetTime - tick()
    if waitTime > 0 then
        task.wait(waitTime)
    end
    UpdateProgress(step.Percent, step.Status)
    AddLog(step.Log)
end

task.wait(0.5)

-- ============================================================
-- FADE OUT
-- ============================================================
FadeTime = 0.5
FadeTweenInfo = TweenInfo.new(FadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Tween MainFrame
FrameTween = TweenService:Create(MainFrame, FadeTweenInfo, {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 480, 0, 260)
})
FrameTween:Play()

-- Tween children
for _, child in pairs(MainFrame:GetDescendants()) do
    if child:IsA("TextLabel") then
        TweenService:Create(child, FadeTweenInfo, {TextTransparency = 1}):Play()
    elseif child:IsA("ImageLabel") then
        TweenService:Create(child, FadeTweenInfo, {ImageTransparency = 1, BackgroundTransparency = 1}):Play()
    elseif child:IsA("Frame") then
        TweenService:Create(child, FadeTweenInfo, {BackgroundTransparency = 1}):Play()
    elseif child:IsA("UIStroke") then
        TweenService:Create(child, FadeTweenInfo, {Transparency = 1}):Play()
    end
end

-- Tween Backdrop
TweenService:Create(Backdrop, FadeTweenInfo, {BackgroundTransparency = 1}):Play()

task.wait(FadeTime + 0.1)

-- Xóa loading
LoadingGui:Destroy()

-- ============================================================
-- BẮT ĐẦU SCRIPT CHÍNH
-- ============================================================
Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

Window = Fluent:CreateWindow({Title="Banana Cat Hub-Blox Fruit [Premium CR]",SubTitle="By TUNGLINH DEV",TabWidth=160,Theme="Dark",Acrylic=false,Size=UDim2.fromOffset(500,320),MinimizeKey=Enum.KeyCode.End})

Tabs = {
    Home = Window:AddTab({Title="Tab Information", Icon="info"}),
    Main = Window:AddTab({Title="Tab Farming", Icon="sword"}),
    Sea = Window:AddTab({Title="Tab Volcano And Sea Event", Icon="waves"}),
    ITM = Window:AddTab({Title="Tab Farming Other", Icon="package"}),
    Setting = Window:AddTab({Title="Setting Farm", Icon="settings"}),
    Status = Window:AddTab({Title="Tab Status And Server", Icon="activity"}),
    Stats = Window:AddTab({Title="Tab Stats", Icon="bar-chart"}),
    Player = Window:AddTab({Title="Tab Local Player", Icon="user"}),
    Teleport = Window:AddTab({Title="Tab Teleport", Icon="map-pin"}),
    Visual = Window:AddTab({Title="Tab Visual", Icon="eye"}),
    Fruit = Window:AddTab({Title="Tab Esp And Fruit", Icon="search"}),
    Raid = Window:AddTab({Title="Tab Raid", Icon="skull"}),
    Race = Window:AddTab({Title="Tab Upgrade Race", Icon="zap"}),
    Shop = Window:AddTab({Title="Tab Shop", Icon="shopping-cart"}),
    Misc = Window:AddTab({Title="Tah Misc", Icon="more-horizontal"})
}

Options = Fluent.Options
v21 = game.Players.LocalPlayer
TweenSpeed = 350
Number = math.random(1, 1000000)

-- Global variables
_G.AutoLevel = false
_G.AutoNear = false
_G.CastleRaid = false
_G.EnableHakiFortress = false
_G.AutoCollectChest = false
_G.AutoFarmMasDevilFruit = false
_G.AutoBoss = false
_G.AutoMaterial = false
_G.AutoElite = false
_G.AutoBone = false
_G.AutoBoneNoQuest = false
_G.AutoRandomBone = false
_G.CakePrince = false
_G.DoughKing = false
_G.SpawnCakePrince = false
_G.Ectoplasm = false
_G.Auto_Sea2 = false
_G.Auto_Sea3 = false
_G.AutoFindPrehistoric = false
_G.AutoFindMirage = false
_G.AutoFindFrozen = false
_G.AutoComeTiki = false
_G.AutoComeHydra = false
_G.AutoTerrorshark = false
_G.farmpiranya = false
_G.AutoShark = false
_G.AutoFishCrew = false
_G.Ship = false
_G.GhostShip = false
_G.bjirFishBoat = false
_G.Auto_Saber = false
_G.Auto_PoleV1 = false
_G.Auto_Saw = false
_G.Auto_Warden = false
_G.AutoHallowScythe = false
_G.AutoYama = false
_G.AutoTushita = false
_G.Auto_Holy_Torch = false
_G.Auto_Canvander = false
_G.Auto_MusketeerHat = false
_G.Auto_ObservationV2 = false
_G.Auto_RainbowHaki = false
_G.Auto_SkullGuitar = false
_G.Auto_Buddy = false
_G.Auto_DualKatana = false
_G.Auto_Regoku = false
_G.Factory = false
_G.AutoFarmSwan = false
_G.Auto_Buy_Enchancement = false
_G.BuyLengendSword = false
_G.AutoEvoRace = false
_G.AutoT = false
_G.AutoY = false
_G.AutoKen = false
_G.SaveSpawn = false
_G.BringMob = true
_G.RemoveNotify = false
_G.WhiteScreen = false
_G.Noclip = false
_G.WalkonWater = true
_G.EnabledPvP = false
_G.TeleportPly = false
_G.TweenToKitsune = false
_G.CollectAzure = false
_G.TweenToGear = false
_G.AutoLockMoon = false
_G.TweenToFrozenDimension = false
_G.AutoBlazeEmber = false
_G.AutoReceiveQuest = false
_G.AutoHydraTree = false
_G.AutoCollectFireFlowers = false
_G.TweenToPrehistoric = false
_G.AutoDefendVolcano = false
_G.UseMelee = false
_G.UseSword = false
_G.UseGun = false
_G.AutoCollectBone = false
_G.AutoCollectEgg = false
_G.Auto_Stats_Melee = false
_G.Auto_Stats_Defense = false
_G.Auto_Stats_Sword = false
_G.Auto_Stats_Gun = false
_G.Auto_Stats_Devil_Fruit = false
_G.AutoRejoin = true
_G.AntiBand = false

SelectMonster = ""
Ms = ""
NameQuest = ""
QuestLv = 0
NameMon = ""
CFrameQ = CFrame.new()
CFrameMon = CFrame.new()
SelectBoss = ""
BossMon = ""
NameBoss = ""
NameQuestBoss = ""
QuestLvBoss = 0
RewardBoss = ""
CFrameQBoss = CFrame.new()
CFrameBoss = CFrame.new()
SelectMaterial = ""
MMon = ""
MPos = CFrame.new()
SP = "Default"
SelectChip = ""
TypeMastery = ""
ChooseWeapon = "Melee"
SelectWeapon = "Melee"
KillPercent = 20
FarmPos = CFrame.new()
MonFarm = ""
bringmob = false
PositionSkillMasteryDevilFruit = nil
SkillZ = true
SkillX = true
SkillC = true
SkillV = true
SkillF = true
SelectedHiddenQuest = ""
selectedBoat = ""

v18 = game.PlaceId
Sea1 = false
Sea2 = false
Sea3 = false
if v18 == 2753915549 then Sea1 = true
elseif v18 == 4442272183 then Sea2 = true
elseif v18 == 7449423635 then Sea3 = true end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait()
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

function isnil(v) return v == nil end
local function v20(v) return math.floor(tonumber(v) + 0.5) end

function AutoHaki() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso") end

function EquipTool(n)
    local p = game.Players.LocalPlayer
    if p.Backpack:FindFirstChild(n) then
        p.Character.Humanoid:EquipTool(p.Backpack[n])
    end
end

function GetEquippedTool()
    local v = v21.Character
    if not v then return nil end
    for _, t in pairs(v:GetChildren()) do
        if t:IsA("Tool") then return t end
    end
    return nil
end

function FindEnemiesInRange(v223, v224)
    local v225 = (v21.Character or v21.CharacterAdded:Wait()):GetPivot().Position
    local v226 = nil
    for _, v472 in ipairs(v224) do
        if not v472:GetAttribute("IsBoat") and v472:FindFirstChildOfClass("Humanoid") and v472.Humanoid.Health > 0 then
            local v671 = v472:FindFirstChild("Head")
            if v671 and (v225 - v671.Position).Magnitude <= 60 then
                table.insert(v223, {v472, v671})
                v226 = v671
            end
        end
    end
    return v226
end

function AttackNoCoolDown()
    local v228 = {}
    local v229 = game:GetService("Workspace").Enemies:GetChildren()
    local v230 = FindEnemiesInRange(v228, v229)
    if not v230 then return end
    local v231 = GetEquippedTool()
    if not v231 then return end
    pcall(function()
        local v477 = game:GetService("ReplicatedStorage")
        local v478 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
        local v479 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
        if #v228 > 0 then
            v478:FireServer(1e-9)
            v479:FireServer(v230, v228)
        else
            task.wait(1e-9)
        end
    end)
end

function Tween(v211)
    local v212 = (v211.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local v213 = TweenSpeed
    if v212 >= 350 then v213 = TweenSpeed end
    local v214 = TweenInfo.new(v212 / v213, Enum.EasingStyle.Linear)
    local v215 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v214, {CFrame = v211})
    v215:Play()
    if _G.StopTween then v215:Cancel() end
end

function Tween2(v211)
    local v212 = (v211.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local v213 = TweenSpeed
    if v212 >= 350 then v213 = TweenSpeed end
    local v214 = TweenInfo.new(v212 / v213, Enum.EasingStyle.Linear)
    local v215 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v214, {CFrame = v211})
    v215:Play()
    if _G.StopTween then v215:Cancel() end
end

function CancelTween(v216)
    if not v216 then
        _G.StopTween = true
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        _G.StopTween = false
    end
end

function BTPZ(v209)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209
end

function to(v232)
    repeat
        wait(_G.Fast_Delay or 0.1)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232
    until (v232.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2
end

function to2(v233)
    pcall(function()
        if (v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            if NameMon == "FishmanQuest" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif NameMon == "God's Guard" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif NameMon == "SkyExp1Quest" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif NameMon == "ShipQuest1" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            elseif NameMon == "ShipQuest2" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            elseif NameMon == "FrostQuest" then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        end
    end)
end

function GetMaterial(v221)
    for _, v468 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v468) == "table" then
            if v468.Type == "Material" then
                if v468.Name == v221 then return true end
            end
        end
    end
    return false
end

function GetweaponInventory(v222)
    for _, v470 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v470) == "table" then
            if v470.Type == "Sword" then
                if v470.Name == v222 then return true end
            end
        end
    end
    return false
end

function Hop()
    local v372 = game.PlaceId
    local v373 = {}
    local v374 = ""
    local v375 = os.date("!*t").hour
    local v376 = false
    function TPReturner()
        local v556
        if v374 == "" then
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100"))
        else
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. v374))
        end
        local v557 = ""
        if v556.nextPageCursor and v556.nextPageCursor ~= "null" and v556.nextPageCursor ~= nil then
            v374 = v556.nextPageCursor
        end
        local v558 = 0
        for _, v652 in pairs(v556.data) do
            local v653 = true
            v557 = tostring(v652.id)
            if tonumber(v652.maxPlayers) > tonumber(v652.playing) then
                for _, v873 in pairs(v373) do
                    if v558 == 0 then
                        if v557 == tostring(v873) then
                            v653 = false
                        end
                    elseif tonumber(v375) == tonumber(v873) then
                        pcall(function()
                            v373 = {}
                            table.insert(v373, v375)
                        end)
                    end
                end
                if v653 then
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(v372, v557, game.Players.LocalPlayer)
                    end)
                    wait()
                end
            end
        end
    end
    function v118()
        while wait() do
            pcall(function()
                TPReturner()
                if v374 ~= "" then TPReturner() end
            end)
        end
    end
    v118()
end

-- CHECK LEVEL FULL
function CheckLevel()
    local v197 = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Sea1 then
        if (v197 == 1) or (v197 <= 9) or (SelectMonster == "Bandit") then
            Ms = "Bandit"; NameQuest = "BanditQuest1"; QuestLv = 1; NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif (v197 == 10) or (v197 <= 14) or (SelectMonster == "Monkey") then
            Ms = "Monkey"; NameQuest = "JungleQuest"; QuestLv = 1; NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif (v197 == 15) or (v197 <= 29) or (SelectMonster == "Gorilla") then
            Ms = "Gorilla"; NameQuest = "JungleQuest"; QuestLv = 2; NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        elseif (v197 == 30) or (v197 <= 39) or (SelectMonster == "Pirate") then
            Ms = "Pirate"; NameQuest = "BuggyQuest1"; QuestLv = 1; NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif (v197 == 40) or (v197 <= 59) or (SelectMonster == "Brute") then
            Ms = "Brute"; NameQuest = "BuggyQuest1"; QuestLv = 2; NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif (v197 == 60) or (v197 <= 74) or (SelectMonster == "Desert Bandit") then
            Ms = "Desert Bandit"; NameQuest = "DesertQuest"; QuestLv = 1; NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif (v197 == 75) or (v197 <= 89) or (SelectMonster == "Desert Officer") then
            Ms = "Desert Officer"; NameQuest = "DesertQuest"; QuestLv = 2; NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif (v197 == 90) or (v197 <= 99) or (SelectMonster == "Snow Bandit") then
            Ms = "Snow Bandit"; NameQuest = "SnowQuest"; QuestLv = 1; NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif (v197 == 100) or (v197 <= 119) or (SelectMonster == "Snowman") then
            Ms = "Snowman"; NameQuest = "SnowQuest"; QuestLv = 2; NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1298.3576660156)
        elseif (v197 == 120) or (v197 <= 149) or (SelectMonster == "Chief Petty Officer") then
            Ms = "Chief Petty Officer"; NameQuest = "MarineQuest2"; QuestLv = 1; NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif (v197 == 150) or (v197 <= 174) or (SelectMonster == "Sky Bandit") then
            Ms = "Sky Bandit"; NameQuest = "SkyQuest"; QuestLv = 1; NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif (v197 == 175) or (v197 <= 189) or (SelectMonster == "Dark Master") then
            Ms = "Dark Master"; NameQuest = "SkyQuest"; QuestLv = 2; NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif (v197 == 190) or (v197 <= 209) or (SelectMonster == "Prisoner") then
            Ms = "Prisoner"; NameQuest = "PrisonerQuest"; QuestLv = 1; NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524)
        elseif (v197 == 210) or (v197 <= 249) or (SelectMonster == "Dangerous Prisoner") then
            Ms = "Dangerous Prisoner"; NameQuest = "PrisonerQuest"; QuestLv = 2; NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583)
        elseif (v197 == 250) or (v197 <= 274) or (SelectMonster == "Toga Warrior") then
            Ms = "Toga Warrior"; NameQuest = "ColosseumQuest"; QuestLv = 1; NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif (v197 == 275) or (v197 <= 299) or (SelectMonster == "Gladiator") then
            Ms = "Gladiator"; NameQuest = "ColosseumQuest"; QuestLv = 2; NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
        elseif (v197 == 300) or (v197 <= 324) or (SelectMonster == "Military Soldier") then
            Ms = "Military Soldier"; NameQuest = "MagmaQuest"; QuestLv = 1; NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif (v197 == 325) or (v197 <= 374) or (SelectMonster == "Military Spy") then
            Ms = "Military Spy"; NameQuest = "MagmaQuest"; QuestLv = 2; NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922)
        elseif (v197 == 375) or (v197 <= 399) or (SelectMonster == "Fishman Warrior") then
            Ms = "Fishman Warrior"; NameQuest = "FishmanQuest"; QuestLv = 1; NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif (v197 == 400) or (v197 <= 449) or (SelectMonster == "Fishman Commando") then
            Ms = "Fishman Commando"; NameQuest = "FishmanQuest"; QuestLv = 2; NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
        elseif (v197 == 450) or (v197 <= 474) or (SelectMonster == "God's Guard") then
            Ms = "God's Guard"; NameQuest = "SkyExp1Quest"; QuestLv = 1; NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif (v197 == 475) or (v197 <= 524) or (SelectMonster == "Shanda") then
            Ms = "Shanda"; NameQuest = "SkyExp1Quest"; QuestLv = 2; NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif (v197 == 525) or (v197 <= 549) or (SelectMonster == "Royal Squad") then
            Ms = "Royal Squad"; NameQuest = "SkyExp2Quest"; QuestLv = 1; NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif (v197 == 550) or (v197 <= 624) or (SelectMonster == "Royal Soldier") then
            Ms = "Royal Soldier"; NameQuest = "SkyExp2Quest"; QuestLv = 2; NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1410.923828125)
        elseif (v197 == 625) or (v197 <= 649) or (SelectMonster == "Galley Pirate") then
            Ms = "Galley Pirate"; NameQuest = "FountainQuest"; QuestLv = 1; NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        elseif v197 >= 650 or (SelectMonster == "Galley Captain") then
            Ms = "Galley Captain"; NameQuest = "FountainQuest"; QuestLv = 2; NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Sea2 then
        if (v197 == 700) or (v197 <= 724) or (SelectMonster == "Raider") then
            Ms = "Raider"; NameQuest = "Area1Quest"; QuestLv = 1; NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif (v197 == 725) or (v197 <= 774) or (SelectMonster == "Mercenary") then
            Ms = "Mercenary"; NameQuest = "Area1Quest"; QuestLv = 2; NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif (v197 == 775) or (v197 <= 799) or (SelectMonster == "Swan Pirate") then
            Ms = "Swan Pirate"; NameQuest = "Area2Quest"; QuestLv = 1; NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif (v197 == 800) or (v197 <= 874) or (SelectMonster == "Factory Staff") then
            Ms = "Factory Staff"; NameQuest = "Area2Quest"; QuestLv = 2; NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22945898438, 128.46876525879, 917.81298828125)
        elseif (v197 == 875) or (v197 <= 899) or (SelectMonster == "Marine Lieutenant") then
            Ms = "Marine Lieutenant"; NameQuest = "MarineQuest3"; QuestLv = 1; NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif (v197 == 900) or (v197 <= 949) or (SelectMonster == "Marine Captain") then
            Ms = "Marine Captain"; NameQuest = "MarineQuest3"; QuestLv = 2; NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif (v197 == 950) or (v197 <= 974) or (SelectMonster == "Zombie") then
            Ms = "Zombie"; NameQuest = "ZombieQuest"; QuestLv = 1; NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif (v197 == 975) or (v197 <= 999) or (SelectMonster == "Vampire") then
            Ms = "Vampire"; NameQuest = "ZombieQuest"; QuestLv = 2; NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif (v197 == 1000) or (v197 <= 1049) or (SelectMonster == "Snow Trooper") then
            Ms = "Snow Trooper"; NameQuest = "SnowMountainQuest"; QuestLv = 1; NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif (v197 == 1050) or (v197 <= 1099) or (SelectMonster == "Winter Warrior") then
            Ms = "Winter Warrior"; NameQuest = "SnowMountainQuest"; QuestLv = 2; NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif (v197 == 1100) or (v197 <= 1124) or (SelectMonster == "Lab Subordinate") then
            Ms = "Lab Subordinate"; NameQuest = "IceSideQuest"; QuestLv = 1; NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif (v197 == 1125) or (v197 <= 1174) or (SelectMonster == "Horned Warrior") then
            Ms = "Horned Warrior"; NameQuest = "IceSideQuest"; QuestLv = 2; NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif (v197 == 1175) or (v197 <= 1199) or (SelectMonster == "Magma Ninja") then
            Ms = "Magma Ninja"; NameQuest = "FireSideQuest"; QuestLv = 1; NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif (v197 == 1200) or (v197 <= 1249) or (SelectMonster == "Lava Pirate") then
            Ms = "Lava Pirate"; NameQuest = "FireSideQuest"; QuestLv = 2; NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif (v197 == 1250) or (v197 <= 1274) or (SelectMonster == "Ship Deckhand") then
            Ms = "Ship Deckhand"; NameQuest = "ShipQuest1"; QuestLv = 1; NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (v197 == 1275) or (v197 <= 1299) or (SelectMonster == "Ship Engineer") then
            Ms = "Ship Engineer"; NameQuest = "ShipQuest1"; QuestLv = 2; NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (v197 == 1300) or (v197 <= 1324) or (SelectMonster == "Ship Steward") then
            Ms = "Ship Steward"; NameQuest = "ShipQuest2"; QuestLv = 1; NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (v197 == 1325) or (v197 <= 1349) or (SelectMonster == "Ship Officer") then
            Ms = "Ship Officer"; NameQuest = "ShipQuest2"; QuestLv = 2; NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif (v197 == 1350) or (v197 <= 1374) or (SelectMonster == "Arctic Warrior") then
            Ms = "Arctic Warrior"; NameQuest = "FrostQuest"; QuestLv = 1; NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif (v197 == 1375) or (v197 <= 1424) or (SelectMonster == "Snow Lurker") then
            Ms = "Snow Lurker"; NameQuest = "FrostQuest"; QuestLv = 2; NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif (v197 == 1425) or (v197 <= 1449) or (SelectMonster == "Sea Soldier") then
            Ms = "Sea Soldier"; NameQuest = "ForgottenQuest"; QuestLv = 1; NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif v197 >= 1450 or (SelectMonster == "Water Fighter") then
            Ms = "Water Fighter"; NameQuest = "ForgottenQuest"; QuestLv = 2; NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    end
    if Sea3 then
        if (v197 == 1500) or (v197 <= 1524) or (SelectMonster == "Pirate Millionaire") then
            Ms = "Pirate Millionaire"; NameQuest = "PiratePortQuest"; QuestLv = 1; NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(-193.99227905273438, 56.12502670288086, 5755.7880859375)
        elseif (v197 == 1525) or (v197 <= 1574) or (SelectMonster == "Pistol Billionaire") then
            Ms = "Pistol Billionaire"; NameQuest = "PiratePortQuest"; QuestLv = 2; NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(-188.14462280273438, 84.49613189697266, 6337.0419921875)
        elseif (v197 == 1575) or (v197 <= 1599) or (SelectMonster == "Dragon Crew Warrior") then
            Ms = "Dragon Crew Warrior"; NameQuest = "DragonCrewQuest"; QuestLv = 1; NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.11683984375, 126.99046325683594, -711.0979614257812)
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
        elseif (v197 == 1600) or (v197 <= 1624) or (SelectMonster == "Dragon Crew Archer") then
            Ms = "Dragon Crew Archer"; NameQuest = "DragonCrewQuest"; QuestLv = 2; NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257812)
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
        elseif (v197 == 1625) or (v197 <= 1649) or (SelectMonster == "Hydra Enforcer") then
            Ms = "Hydra Enforcer"; NameQuest = "VenomCrewQuest"; QuestLv = 1; NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
        elseif (v197 == 1650) or (v197 <= 1699) or (SelectMonster == "Venomous Assailant") then
            Ms = "Venomous Assailant"; NameQuest = "VenomCrewQuest"; QuestLv = 2; NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
        elseif (v197 == 1700) or (v197 <= 1724) or (SelectMonster == "Marine Commodore") then
            Ms = "Marine Commodore"; NameQuest = "MarineTreeIsland"; QuestLv = 1; NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif (v197 == 1725) or (v197 <= 1774) or (SelectMonster == "Marine Rear Admiral") then
            Ms = "Marine Rear Admiral"; NameQuest = "MarineTreeIsland"; QuestLv = 2; NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif (v197 == 1775) or (v197 <= 1799) or (SelectMonster == "Fishman Raider") then
            Ms = "Fishman Raider"; NameQuest = "DeepForestIsland3"; QuestLv = 1; NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10580.109375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif (v197 == 1800) or (v197 <= 1824) or (SelectMonster == "Fishman Captain") then
            Ms = "Fishman Captain"; NameQuest = "DeepForestIsland3"; QuestLv = 2; NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10580.109375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif (v197 == 1825) or (v197 <= 1849) or (SelectMonster == "Forest Pirate") then
            Ms = "Forest Pirate"; NameQuest = "DeepForestIsland"; QuestLv = 1; NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif (v197 == 1850) or (v197 <= 1899) or (SelectMonster == "Mythological Pirate") then
            Ms = "Mythological Pirate"; NameQuest = "DeepForestIsland"; QuestLv = 2; NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif (v197 == 1900) or (v197 <= 1924) or (SelectMonster == "Jungle Pirate") then
            Ms = "Jungle Pirate"; NameQuest = "DeepForestIsland"; QuestLv = 1; NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif (v197 == 1925) or (v197 <= 1974) or (SelectMonster == "Musketeer Pirate") then
            Ms = "Musketeer Pirate"; NameQuest = "DeepForestIsland"; QuestLv = 2; NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif (v197 == 1975) or (v197 <= 1999) or (SelectMonster == "Reborn Skeleton") then
            Ms = "Reborn Skeleton"; NameQuest = "HauntedQuest1"; QuestLv = 1; NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977)
        elseif (v197 == 2000) or (v197 <= 2024) or (SelectMonster == "Living Zombie") then
            Ms = "Living Zombie"; NameQuest = "HauntedQuest1"; QuestLv = 2; NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977)
        elseif (v197 == 2025) or (v197 <= 2049) or (SelectMonster == "Demonic Soul") then
            Ms = "Demonic Soul"; NameQuest = "HauntedQuest2"; QuestLv = 1; NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif (v197 == 2050) or (v197 <= 2074) or (SelectMonster == "Possessed Mummy") then
            Ms = "Possessed Mummy"; NameQuest = "HauntedQuest2"; QuestLv = 2; NameMon = "Possessed Mummy"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif (v197 == 2075) or (v197 <= 2099) or (SelectMonster == "Peanut Scout") then
            Ms = "Peanut Scout"; NameQuest = "NutsIslandQuest"; QuestLv = 1; NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif (v197 == 2100) or (v197 <= 2124) or (SelectMonster == "Peanut President") then
            Ms = "Peanut President"; NameQuest = "NutsIslandQuest"; QuestLv = 2; NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif (v197 == 2125) or (v197 <= 2149) or (SelectMonster == "Ice Cream Chef") then
            Ms = "Ice Cream Chef"; NameQuest = "IceCreamIslandQuest"; QuestLv = 1; NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805)
        elseif (v197 == 2150) or (v197 <= 2199) or (SelectMonster == "Ice Cream Commander") then
            Ms = "Ice Cream Commander"; NameQuest = "IceCreamIslandQuest"; QuestLv = 2; NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805)
        elseif (v197 == 2200) or (v197 <= 2224) or (SelectMonster == "Cookie Crafter") then
            Ms = "Cookie Crafter"; NameQuest = "CakeQuest1"; QuestLv = 1; NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871)
        elseif (v197 == 2225) or (v197 <= 2249) or (SelectMonster == "Cake Guard") then
            Ms = "Cake Guard"; NameQuest = "CakeQuest1"; QuestLv = 2; NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324)
        elseif (v197 == 2250) or (v197 <= 2274) or (SelectMonster == "Baking Staff") then
            Ms = "Baking Staff"; NameQuest = "CakeQuest2"; QuestLv = 1; NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418)
        elseif (v197 == 2275) or (v197 <= 2299) or (SelectMonster == "Head Baker") then
            Ms = "Head Baker"; NameQuest = "CakeQuest2"; QuestLv = 2; NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418)
        elseif (v197 == 2300) or (v197 <= 2324) or (SelectMonster == "Cocoa Warrior") then
            Ms = "Cocoa Warrior"; NameQuest = "ChocQuest1"; QuestLv = 1; NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874)
        elseif (v197 == 2325) or (v197 <= 2349) or (SelectMonster == "Chocolate Bar Battler") then
            Ms = "Chocolate Bar Battler"; NameQuest = "ChocQuest1"; QuestLv = 2; NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148)
        elseif (v197 == 2350) or (v197 <= 2374) or (SelectMonster == "Sweet Thief") then
            Ms = "Sweet Thief"; NameQuest = "ChocQuest2"; QuestLv = 1; NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115)
        elseif (v197 == 2375) or (v197 <= 2400) or (SelectMonster == "Candy Rebel") then
            Ms = "Candy Rebel"; NameQuest = "ChocQuest2"; QuestLv = 2; NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402)
        elseif (v197 == 2400) or (v197 <= 2424) or (SelectMonster == "Candy Pirate") then
            Ms = "Candy Pirate"; NameQuest = "CandyQuest1"; QuestLv = 1; NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934)
        elseif (v197 == 2425) or (v197 <= 2449) or (SelectMonster == "Snow Demon") then
            Ms = "Snow Demon"; NameQuest = "CandyQuest1"; QuestLv = 2; NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934)
        elseif (v197 == 2450) or (v197 <= 2474) or (SelectMonster == "Isle Outlaw") then
            Ms = "Isle Outlaw"; NameQuest = "TikiQuest1"; QuestLv = 1; NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
            CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
        elseif (v197 == 2475) or (v197 <= 2499) or (SelectMonster == "Island Boy") then
            Ms = "Island Boy"; NameQuest = "TikiQuest1"; QuestLv = 2; NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
            CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
        elseif (v197 == 2500) or (v197 <= 2524) or (SelectMonster == "Sun-kissed Warrior") then
            Ms = "Sun-kissed Warrior"; NameQuest = "TikiQuest2"; QuestLv = 1; NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
        elseif (v197 == 2525) or (v197 <= 2549) or (SelectMonster == "Isle Champion") then
            Ms = "Isle Champion"; NameQuest = "TikiQuest2"; QuestLv = 2; NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
        elseif (v197 == 2550) or (v197 <= 2574) or (SelectMonster == "Serpent Hunter") then
            Ms = "Serpent Hunter"; NameQuest = "TikiQuest3"; QuestLv = 1; NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(-16621.4140625, 121.40631103515625, 1290.6881103515625)
        elseif (v197 == 2575) or (v197 <= 2599) or (SelectMonster == "Skull Slayer") or (v197 == 2600) then
            Ms = "Skull Slayer"; NameQuest = "TikiQuest3"; QuestLv = 2; NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(-16621.4140625, 121.40631103515625, 1290.6881103515625)
        end
    end
end

function CheckBossQuest()
    if Sea1 then
        if SelectBoss == "The Gorilla King" then
            BossMon = "The Gorilla King"; NameBoss = "The Gorilla King"; NameQuestBoss = "JungleQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906)
        elseif SelectBoss == "Bobby" then
            BossMon = "Bobby"; NameBoss = "Bobby"; NameQuestBoss = "BuggyQuest1"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$8,000\n35,000 Exp."
            CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif SelectBoss == "The Saw" then
            BossMon = "The Saw"; NameBoss = "The Saw"
            CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif SelectBoss == "Yeti" then
            BossMon = "Yeti"; NameBoss = "Yeti"; NameQuestBoss = "SnowQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameBoss = CFrame.new(-7.4189592891541, 5356.6723632813, 1328.2418212891)
        elseif SelectBoss == "Mob Leader" then
            BossMon = "Mob Leader"; NameBoss = "Mob Leader"; NameQuestBoss = "MarineQuest2"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif SelectBoss == "Vice Admiral" then
            BossMon = "Vice Admiral"; NameBoss = "Vice Admiral"; NameQuestBoss = "MarineQuest2"; QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif SelectBoss == "Saber Expert" then
            NameBoss = "Saber Expert"; BossMon = "Saber Expert"
            CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        elseif SelectBoss == "Warden" then
            BossMon = "Warden"; NameBoss = "Warden"; NameQuestBoss = "ImpelQuest"; QuestLvBoss = 1
            RewardBoss = "Reward:\n$6,000\n850,000 Exp."
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721)
        elseif SelectBoss == "Chief Warden" then
            BossMon = "Chief Warden"; NameBoss = "Chief Warden"; NameQuestBoss = "ImpelQuest"; QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721)
        elseif SelectBoss == "Swan" then
            BossMon = "Swan"; NameBoss = "Swan"; NameQuestBoss = "ImpelQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721)
        elseif SelectBoss == "Magma Admiral" then
            BossMon = "Magma Admiral"; NameBoss = "Magma Admiral"; NameQuestBoss = "MagmaQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
            CFrameQBoss = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameBoss = CFrame.new(-5308.0927734375, 84.133750915527, 8717.103515625)
        elseif SelectBoss == "Fishman Lord" then
            BossMon = "Fishman Lord"; NameBoss = "Fishman Lord"; NameQuestBoss = "FishmanQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
        elseif SelectBoss == "Wysper" then
            BossMon = "Wysper"; NameBoss = "Wysper"; NameQuestBoss = "SkyExp1Quest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
            CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, 379.85974121094)
            CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, 546.74816894531)
        elseif SelectBoss == "Thunder God" then
            BossMon = "Thunder God"; NameBoss = "Thunder God"; NameQuestBoss = "SkyExp2Quest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
            CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, 1410.923828125)
            CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, 2088.6479492188)
        elseif SelectBoss == "Cyborg" then
            BossMon = "Cyborg"; NameBoss = "Cyborg"; NameQuestBoss = "FountainQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
        elseif SelectBoss == "Ice Admiral" then
            BossMon = "Ice Admiral"; NameBoss = "Ice Admiral"
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678)
        elseif SelectBoss == "Greybeard" then
            BossMon = "Greybeard"; NameBoss = "Greybeard"
            CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
        end
    end
    if Sea2 then
        if SelectBoss == "Diamond" then
            BossMon = "Diamond"; NameBoss = "Diamond"; NameQuestBoss = "Area2Quest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
            CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        elseif SelectBoss == "Jeremy" then
            BossMon = "Jeremy"; NameBoss = "Jeremy"; NameQuestBoss = "Area2Quest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
        elseif SelectBoss == "Fajita" then
            BossMon = "Fajita"; NameBoss = "Fajita"; NameQuestBoss = "MarineQuest3"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
            CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
        elseif SelectBoss == "Don Swan" then
            BossMon = "Don Swan"; NameBoss = "Don Swan"
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
        elseif SelectBoss == "Smoke Admiral" then
            BossMon = "Smoke Admiral"; NameBoss = "Smoke Admiral"; NameQuestBoss = "IceSideQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
            CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
        elseif SelectBoss == "Awakened Ice Admiral" then
            BossMon = "Awakened Ice Admiral"; NameBoss = "Awakened Ice Admiral"; NameQuestBoss = "FrostQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
        elseif SelectBoss == "Tide Keeper" then
            BossMon = "Tide Keeper"; NameBoss = "Tide Keeper"; NameQuestBoss = "ForgottenQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
            CFrameQBoss = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameBoss = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        elseif SelectBoss == "Darkbeard" then
            BossMon = "Darkbeard"; NameBoss = "Darkbeard"
            CFrameBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
        elseif SelectBoss == "Cursed Captain" then
            BossMon = "Cursed Captain"; NameBoss = "Cursed Captain"
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
        elseif SelectBoss == "Order" then
            BossMon = "Order"; NameBoss = "Order"
            CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
        end
    end
    if Sea3 then
        if SelectBoss == "Stone" then
            BossMon = "Stone"; NameBoss = "Stone"; NameQuestBoss = "PiratePortQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif SelectBoss == "Hydra Leader" then
            BossMon = "Hydra Leader"; NameBoss = "Hydra Leader"; NameQuestBoss = "VenomCrewQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
            CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
            CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
        elseif SelectBoss == "Kilo Admiral" then
            BossMon = "Kilo Admiral"; NameBoss = "Kilo Admiral"; NameQuestBoss = "MarineTreeIsland"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        elseif SelectBoss == "Captain Elephant" then
            BossMon = "Captain Elephant"; NameBoss = "Captain Elephant"; NameQuestBoss = "DeepForestIsland"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
            CFrameQBoss = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameBoss = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif SelectBoss == "Beautiful Pirate" then
            BossMon = "Beautiful Pirate"; NameBoss = "Beautiful Pirate"; NameQuestBoss = "DeepForestIsland2"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
            CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
        elseif SelectBoss == "Cake Queen" then
            BossMon = "Cake Queen"; NameBoss = "Cake Queen"; NameQuestBoss = "IceCreamIslandQuest"; QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
            CFrameQBoss = CFrame.new(-819.376709, 64.925796, -10967.2832)
            CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012)
        elseif SelectBoss == "Longma" then
            BossMon = "Longma"; NameBoss = "Longma"
            CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
        elseif SelectBoss == "Soul Reaper" then
            BossMon = "Soul Reaper"; NameBoss = "Soul Reaper"
            CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
        elseif SelectBoss == "rip_indra True Form" then
            BossMon = "rip_indra True Form"; NameBoss = "rip_indra True Form"
            CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
        end
    end
end

function MaterialMon()
    if SelectMaterial == "Radioactive Material" then
        MMon = "Factory Staff"; MPos = CFrame.new(295, 73, -56); SP = "Default"
    elseif SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter"; MPos = CFrame.new(-3385, 239, -10542); SP = "Default"
    elseif SelectMaterial == "Magma Ore" then
        if Sea1 then
            MMon = "Military Spy"; MPos = CFrame.new(-5815, 84, 8820); SP = "Default"
        elseif Sea2 then
            MMon = "Magma Ninja"; MPos = CFrame.new(-5429, 15, -5297); SP = "Default"
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196))
            end
        elseif Sea3 then
            MMon = "Jungle Pirate"; MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375); SP = "Default"
        end
    elseif SelectMaterial == "Leather" then
        if Sea1 then
            MMon = "Brute"; MPos = CFrame.new(-1145, 15, 4350); SP = "Default"
        elseif Sea2 then
            MMon = "Marine Captain"; MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375); SP = "Default"
        elseif Sea3 then
            MMon = "Jungle Pirate"; MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375); SP = "Default"
        end
    elseif SelectMaterial == "Scrap Metal" then
        if Sea1 then
            MMon = "Brute"; MPos = CFrame.new(-1145, 15, 4350); SP = "Default"
        elseif Sea2 then
            MMon = "Swan Pirate"; MPos = CFrame.new(878, 122, 1235); SP = "Default"
        elseif Sea3 then
            MMon = "Jungle Pirate"; MPos = CFrame.new(-12107, 332, -10549); SP = "Default"
        end
    elseif SelectMaterial == "Fish Tail" then
        if Sea3 then
            MMon = "Fishman Raider"; MPos = CFrame.new(-10993, 332, -8940); SP = "Default"
        elseif Sea1 then
            MMon = "Fishman Warrior"; MPos = CFrame.new(61123, 19, 1569); SP = "Default"
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
            end
        end
    elseif SelectMaterial == "Vampire Fang" then
        MMon = "Vampire"; MPos = CFrame.new(-6033, 7, -1317); SP = "Default"
    elseif SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"; MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625); SP = "Default"
    elseif SelectMaterial == "Dragon Scale" then
        MMon = "Dragon Crew Archer"; MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922); SP = "Default"
    elseif SelectMaterial == "Gunpowder" then
        MMon = "Pistol Billionaire"; MPos = CFrame.new(-469, 74, 5904); SP = "Default"
    elseif SelectMaterial == "Hydra Enforcer" then
        MMon = "Hydra Enforcer"; MPos = CFrame.new(4581.517578125, 1001.55908203125, 704.9378662109375); SP = "Default"
    elseif SelectMaterial == "Venomous Assailant" then
        MMon = "Venomous Assailant"; MPos = CFrame.new(4879.92041015625, 1089.46142578125, 1104.00830078125); SP = "Default"
    elseif SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate"; MPos = CFrame.new(); SP = "Default"
    end
end

-- ESP Functions
function UpdateIslandESP()
    for _, v426 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if v426.Name ~= "Sea" then
                    if not v426:FindFirstChild("NameEsp") then
                        local v1130 = Instance.new("BillboardGui", v426)
                        v1130.Name = "NameEsp"
                        v1130.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1130.Size = UDim2.new(1, 200, 1, 30)
                        v1130.Adornee = v426
                        v1130.AlwaysOnTop = true
                        local v1136 = Instance.new("TextLabel", v1130)
                        v1136.Font = "GothamBold"
                        v1136.FontSize = "Size14"
                        v1136.TextWrapped = true
                        v1136.Size = UDim2.new(1, 0, 1, 0)
                        v1136.TextYAlignment = "Top"
                        v1136.BackgroundTransparency = 1
                        v1136.TextStrokeTransparency = 0.5
                        v1136.TextColor3 = Color3.fromRGB(8, 0, 0)
                    else
                        v426["NameEsp"].TextLabel.Text = v426.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v426.Position).Magnitude / 3) .. " Distance"
                    end
                end
            end
        end)
    end
end

function UpdatePlayerChams()
    for _, v428 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v428.Character) then
                if ESPPlayer then
                    if not isnil(v428.Character.Head) and not v428.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        local v1146 = Instance.new("BillboardGui", v428.Character.Head)
                        v1146.Name = "NameEsp" .. Number
                        v1146.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1146.Size = UDim2.new(1, 200, 1, 30)
                        v1146.Adornee = v428.Character.Head
                        v1146.AlwaysOnTop = true
                        local v1153 = Instance.new("TextLabel", v1146)
                        v1153.Font = Enum.Font.GothamSemibold
                        v1153.FontSize = "Size14"
                        v1153.TextWrapped = true
                        v1153.Text = v428.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance"
                        v1153.Size = UDim2.new(1, 0, 1, 0)
                        v1153.TextYAlignment = "Top"
                        v1153.BackgroundTransparency = 1
                        v1153.TextStrokeTransparency = 0.5
                        if v428.Team == game.Players.LocalPlayer.Team then
                            v1153.TextColor3 = Color3.new(0, 0, 254)
                        else
                            v1153.TextColor3 = Color3.new(255, 0, 0)
                        end
                    else
                        v428.Character.Head["NameEsp" .. Number].TextLabel.Text = v428.Name .. " | " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. v20((v428.Character.Humanoid.Health * 100) / v428.Character.Humanoid.MaxHealth) .. "%"
                    end
                end
            end
        end)
    end
end

function UpdateChestChams()
    for _, v446 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v446.Name, "Chest") then
                if ChestESP then
                    if string.find(v446.Name, "Chest") then
                        if not v446:FindFirstChild("NameEsp" .. Number) then
                            local v1497 = Instance.new("BillboardGui", v446)
                            v1497.Name = "NameEsp" .. Number
                            v1497.ExtentsOffset = Vector3.new(0, 1, 0)
                            v1497.Size = UDim2.new(1, 200, 1, 30)
                            v1497.Adornee = v446
                            v1497.AlwaysOnTop = true
                            local v1503 = Instance.new("TextLabel", v1497)
                            v1503.Font = Enum.Font.GothamSemibold
                            v1503.FontSize = "Size14"
                            v1503.TextWrapped = true
                            v1503.Size = UDim2.new(1, 0, 1, 0)
                            v1503.TextYAlignment = "Top"
                            v1503.BackgroundTransparency = 1
                            v1503.TextStrokeTransparency = 0.5
                            if v446.Name == "Chest1" then
                                v1503.TextColor3 = Color3.fromRGB(109, 109, 109)
                                v1503.Text = "Chest 1" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance"
                            end
                            if v446.Name == "Chest2" then
                                v1503.TextColor3 = Color3.fromRGB(173, 158, 21)
                                v1503.Text = "Chest 2" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance"
                            end
                            if v446.Name == "Chest3" then
                                v1503.TextColor3 = Color3.fromRGB(85, 255, 255)
                                v1503.Text = "Chest 3" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance"
                            end
                        else
                            v446["NameEsp" .. Number].TextLabel.Text = v446.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance"
                        end
                    end
                elseif v446:FindFirstChild("NameEsp" .. Number) then
                    v446:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end

function UpdateDevilChams()
    for _, v448 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v448.Name, "Fruit") then
                    if not v448.Handle:FindFirstChild("NameEsp" .. Number) then
                        local v1234 = Instance.new("BillboardGui", v448.Handle)
                        v1234.Name = "NameEsp" .. Number
                        v1234.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1234.Size = UDim2.new(1, 200, 1, 30)
                        v1234.Adornee = v448.Handle
                        v1234.AlwaysOnTop = true
                        local v1241 = Instance.new("TextLabel", v1234)
                        v1241.Font = Enum.Font.GothamSemibold
                        v1241.FontSize = "Size14"
                        v1241.TextWrapped = true
                        v1241.Size = UDim2.new(1, 0, 1, 0)
                        v1241.TextYAlignment = "Top"
                        v1241.BackgroundTransparency = 1
                        v1241.TextStrokeTransparency = 0.5
                        v1241.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v1241.Text = v448.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        v448.Handle["NameEsp" .. Number].TextLabel.Text = v448.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            end
        end)
    end
end

function UpdateFlowerChams()
    for _, v434 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if (v434.Name == "Flower2") or (v434.Name == "Flower1") then
                if FlowerESP then
                    if not v434:FindFirstChild("NameEsp" .. Number) then
                        local v1183 = Instance.new("BillboardGui", v434)
                        v1183.Name = "NameEsp" .. Number
                        v1183.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1183.Size = UDim2.new(1, 200, 1, 30)
                        v1183.Adornee = v434
                        v1183.AlwaysOnTop = true
                        local v1189 = Instance.new("TextLabel", v1183)
                        v1189.Font = Enum.Font.GothamSemibold
                        v1189.FontSize = "Size14"
                        v1189.TextWrapped = true
                        v1189.Size = UDim2.new(1, 0, 1, 0)
                        v1189.TextYAlignment = "Top"
                        v1189.BackgroundTransparency = 1
                        v1189.TextStrokeTransparency = 0.5
                        v1189.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if v434.Name == "Flower1" then
                            v1189.Text = "Blue Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance"
                            v1189.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if v434.Name == "Flower2" then
                            v1189.Text = "Red Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance"
                            v1189.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        v434["NameEsp" .. Number].TextLabel.Text = v434.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance"
                    end
                elseif v434:FindFirstChild("NameEsp" .. Number) then
                    v434:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end

function UpdateRealFruitChams()
    for _, v436 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v436:IsA("Tool") then
            if RealFruitESP then
                if not v436.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v907 = Instance.new("BillboardGui", v436.Handle)
                    v907.Name = "NameEsp" .. Number
                    v907.ExtentsOffset = Vector3.new(0, 1, 0)
                    v907.Size = UDim2.new(1, 200, 1, 30)
                    v907.Adornee = v436.Handle
                    v907.AlwaysOnTop = true
                    local v914 = Instance.new("TextLabel", v907)
                    v914.Font = Enum.Font.GothamSemibold
                    v914.FontSize = "Size14"
                    v914.TextWrapped = true
                    v914.Size = UDim2.new(1, 0, 1, 0)
                    v914.TextYAlignment = "Top"
                    v914.BackgroundTransparency = 1
                    v914.TextStrokeTransparency = 0.5
                    v914.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v914.Text = v436.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    v436.Handle["NameEsp" .. Number].TextLabel.Text = v436.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v436.Handle:FindFirstChild("NameEsp" .. Number) then
                v436.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    for _, v438 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v438:IsA("Tool") then
            if RealFruitESP then
                if not v438.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v926 = Instance.new("BillboardGui", v438.Handle)
                    v926.Name = "NameEsp" .. Number
                    v926.ExtentsOffset = Vector3.new(0, 1, 0)
                    v926.Size = UDim2.new(1, 200, 1, 30)
                    v926.Adornee = v438.Handle
                    v926.AlwaysOnTop = true
                    local v933 = Instance.new("TextLabel", v926)
                    v933.Font = Enum.Font.GothamSemibold
                    v933.FontSize = "Size14"
                    v933.TextWrapped = true
                    v933.Size = UDim2.new(1, 0, 1, 0)
                    v933.TextYAlignment = "Top"
                    v933.BackgroundTransparency = 1
                    v933.TextStrokeTransparency = 0.5
                    v933.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v933.Text = v438.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    v438.Handle["NameEsp" .. Number].TextLabel.Text = v438.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v438.Handle:FindFirstChild("NameEsp" .. Number) then
                v438.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    for _, v440 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v440:IsA("Tool") then
            if RealFruitESP then
                if not v440.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v945 = Instance.new("BillboardGui", v440.Handle)
                    v945.Name = "NameEsp" .. Number
                    v945.ExtentsOffset = Vector3.new(0, 1, 0)
                    v945.Size = UDim2.new(1, 200, 1, 30)
                    v945.Adornee = v440.Handle
                    v945.AlwaysOnTop = true
                    local v952 = Instance.new("TextLabel", v945)
                    v952.Font = Enum.Font.GothamSemibold
                    v952.FontSize = "Size14"
                    v952.TextWrapped = true
                    v952.Size = UDim2.new(1, 0, 1, 0)
                    v952.TextYAlignment = "Top"
                    v952.BackgroundTransparency = 1
                    v952.TextStrokeTransparency = 0.5
                    v952.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v952.Text = v440.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    v440.Handle["NameEsp" .. Number].TextLabel.Text = v440.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v440.Handle:FindFirstChild("NameEsp" .. Number) then
                v440.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end

function UpdateAuraESP()
    for _, v460 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AuraESP then
                if v460.Name == "Master of Enhancement" then
                    if not v460:FindFirstChild("NameEsp") then
                        local v1286 = Instance.new("BillboardGui", v460)
                        v1286.Name = "NameEsp"
                        v1286.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1286.Size = UDim2.new(1, 200, 1, 30)
                        v1286.Adornee = v460
                        v1286.AlwaysOnTop = true
                        local v1292 = Instance.new("TextLabel", v1286)
                        v1292.Font = "Code"
                        v1292.FontSize = "Size14"
                        v1292.TextWrapped = true
                        v1292.Size = UDim2.new(1, 0, 1, 0)
                        v1292.TextYAlignment = "Top"
                        v1292.BackgroundTransparency = 1
                        v1292.TextStrokeTransparency = 0.5
                        v1292.TextColor3 = Color3.fromRGB(80, 245, 245)
                        v1292.Text = v460.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v460.Position).Magnitude / 3) .. " M"
                    else
                        v460["NameEsp"].TextLabel.Text = v460.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v460.Position).Magnitude / 3) .. " M"
                    end
                elseif v460:FindFirstChild("NameEsp") then
                    v460:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateLSDESP()
    for _, v462 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LSDESP then
                if v462.Name == "Master of Enhancement" then
                    if not v462:FindFirstChild("NameEsp") then
                        local v1302 = Instance.new("BillboardGui", v462)
                        v1302.Name = "NameEsp"
                        v1302.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1302.Size = UDim2.new(1, 200, 1, 30)
                        v1302.Adornee = v462
                        v1302.AlwaysOnTop = true
                        local v1308 = Instance.new("TextLabel", v1302)
                        v1308.Font = "Code"
                        v1308.FontSize = "Size14"
                        v1308.TextWrapped = true
                        v1308.Size = UDim2.new(1, 0, 1, 0)
                        v1308.TextYAlignment = "Top"
                        v1308.BackgroundTransparency = 1
                        v1308.TextStrokeTransparency = 0.5
                        v1308.TextColor3 = Color3.fromRGB(80, 245, 245)
                        v1308.Text = v462.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v462.Position).Magnitude / 3) .. " M"
                    else
                        v462["NameEsp"].TextLabel.Text = v462.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v462.Position).Magnitude / 3) .. " M"
                    end
                elseif v462:FindFirstChild("NameEsp") then
                    v462:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateGeaESP()
    for _, v464 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
        pcall(function()
            if GearESP then
                if v464.Name == "MeshPart" then
                    if not v464:FindFirstChild("NameEsp") then
                        local v1318 = Instance.new("BillboardGui", v464)
                        v1318.Name = "NameEsp"
                        v1318.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1318.Size = UDim2.new(1, 200, 1, 30)
                        v1318.Adornee = v464
                        v1318.AlwaysOnTop = true
                        local v1324 = Instance.new("TextLabel", v1318)
                        v1324.Font = "Code"
                        v1324.FontSize = "Size14"
                        v1324.TextWrapped = true
                        v1324.Size = UDim2.new(1, 0, 1, 0)
                        v1324.TextYAlignment = "Top"
                        v1324.BackgroundTransparency = 1
                        v1324.TextStrokeTransparency = 0.5
                        v1324.TextColor3 = Color3.fromRGB(80, 245, 245)
                        v1324.Text = v464.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v464.Position).Magnitude / 3) .. " M"
                    else
                        v464["NameEsp"].TextLabel.Text = v464.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v464.Position).Magnitude / 3) .. " M"
                    end
                elseif v464:FindFirstChild("NameEsp") then
                    v464:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateIslandMirageESP()
    for _, v555 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then
                if v555.Name == "Mirage Island" then
                    if not v555:FindFirstChild("NameEsp") then
                        local v1347 = Instance.new("BillboardGui", v555)
                        v1347.Name = "NameEsp"
                        v1347.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1347.Size = UDim2.new(1, 200, 1, 30)
                        v1347.Adornee = v555
                        v1347.AlwaysOnTop = true
                        local v1353 = Instance.new("TextLabel", v1347)
                        v1353.Font = Enum.Font.Code
                        v1353.FontSize = Enum.FontSize.Size14
                        v1353.TextWrapped = true
                        v1353.Size = UDim2.new(1, 0, 1, 0)
                        v1353.TextYAlignment = "Top"
                        v1353.BackgroundTransparency = 1
                        v1353.TextStrokeTransparency = 0.5
                        v1353.TextColor3 = Color3.fromRGB(80, 245, 245)
                        v1353.Text = v555.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v555.Position).Magnitude / 3) .. " M"
                    else
                        v555["NameEsp"].TextLabel.Text = v555.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v555.Position).Magnitude / 3) .. " M"
                    end
                elseif v555:FindFirstChild("NameEsp") then
                    v555:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateIslandKisuneESP()
    for _, v683 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if KitsuneIslandEsp then
                if v683.Name == "Kitsune Island" then
                    if not v683:FindFirstChild("NameEsp") then
                        local v1518 = Instance.new("BillboardGui", v683)
                        v1518.Name = "NameEsp"
                        v1518.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1518.Size = UDim2.new(1, 200, 1, 30)
                        v1518.Adornee = v683
                        v1518.AlwaysOnTop = true
                        local v1524 = Instance.new("TextLabel", v1518)
                        v1524.Font = "Code"
                        v1524.FontSize = "Size14"
                        v1524.TextWrapped = true
                        v1524.Size = UDim2.new(1, 0, 1, 0)
                        v1524.TextYAlignment = "Top"
                        v1524.BackgroundTransparency = 1
                        v1524.TextStrokeTransparency = 0.5
                        v1524.TextColor3 = Color3.fromRGB(80, 245, 245)
                        v1524.Text = v683.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v683.Position).Magnitude / 3) .. " M"
                    else
                        v683["NameEsp"].TextLabel.Text = v683.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v683.Position).Magnitude / 3) .. " M"
                    end
                elseif v683:FindFirstChild("NameEsp") then
                    v683:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

-- TAB HOME
Tabs["Home"]:AddButton({Title="Tik Tok",Description="Click(Copy)",Callback=function() setclipboard("https://www.tiktok.com/@hnc_roblox?_t=ZS-8ywjDgNQ1ah&_r=1") end})
Tabs["Home"]:AddButton({Title="Zalo Group",Description="Click(Copy)",Callback=function() setclipboard("https://zalo.me/g/tvdnnn639") end})
Tabs["Home"]:AddParagraph({Title="Banana Cat Hub",Content="Phiên bản: Premium\nTác giả: TungLinhDev\nUpdate: Full Sea 1-2-3"})

-- TAB MAIN
v48 = Tabs["Main"]:AddDropdown("DropdownSelectWeapon", {Title="Select weapon", Description="", Values={"Melee","Sword","Blox Fruits"}, Multi=false, Default=1})
v48:SetValue("Melee")
v48:OnChanged(function(v236) ChooseWeapon = v236 end)
task.spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon == "Melee" then
                for _, v837 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v837.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v837.Name)) then
                            SelectWeapon = v837.Name
                        end
                    end
                end
            elseif ChooseWeapon == "Sword" then
                for _, v1029 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v1029.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1029.Name)) then
                            SelectWeapon = v1029.Name
                        end
                    end
                end
            end
        end)
    end
end)

v49 = Tabs["Main"]:AddToggle("ToggleLevel", {Title="Auto Farm Level", Description="", Default=false})
v49:OnChanged(function(v237)
    _G.AutoLevel = v237
    if v237 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for _, v1433 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1433:FindFirstChild("Humanoid") and v1433:FindFirstChild("HumanoidRootPart") and v1433.Humanoid.Health > 0 then
                            if v1433.Name == Ms then
                                repeat
                                    task.wait(_G.Fast_Delay or 0.1)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v1433.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1433.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1433.HumanoidRootPart.Transparency = 1
                                    v1433.Humanoid.JumpPower = 0
                                    v1433.Humanoid.WalkSpeed = 0
                                    v1433.HumanoidRootPart.CanCollide = false
                                    FarmPos = v1433.HumanoidRootPart.CFrame
                                    MonFarm = v1433.Name
                                until not _G.AutoLevel or not v1433.Parent or v1433.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v1433.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                bringmob = false
                            end
                        end
                    end
                    for _, v1435 in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if string.find(v1435.Name, NameMon) then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1435.Position).Magnitude >= 10 then
                                Tween(v1435.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v50 = Tabs["Main"]:AddToggle("ToggleMobAura", {Title="Auto Farm Nearest", Description="", Default=false})
v50:OnChanged(function(v238)
    _G.AutoNear = v238
    if v238 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while wait() do
        if _G.AutoNear then
            pcall(function()
                for _, v839 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v839:FindFirstChild("Humanoid") and v839:FindFirstChild("HumanoidRootPart") and v839.Humanoid.Health > 0 then
                        repeat
                            wait(_G.Fast_Delay or 0.1)
                            AttackNoCoolDown()
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(v839.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            v839.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v839.HumanoidRootPart.Transparency = 1
                            v839.Humanoid.JumpPower = 0
                            v839.Humanoid.WalkSpeed = 0
                            v839.HumanoidRootPart.CanCollide = false
                            FarmPos = v839.HumanoidRootPart.CFrame
                            MonFarm = v839.Name
                        until not _G.AutoNear or not v839.Parent or v839.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v839.Name)
                        bringmob = false
                    end
                end
            end)
        end
    end
end)

v51 = Tabs["Main"]:AddToggle("ToggleCastleRaid", {Title="Auto Farm Pirates", Description="", Default=false})
v51:OnChanged(function(v239) _G.CastleRaid = v239 end)
spawn(function()
    while wait() do
        if _G.CastleRaid then
            pcall(function()
                local v764 = CFrame.new(-5496.17432, 313.768921, -2841.53027)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for _, v1031 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.CastleRaid and v1031:FindFirstChild("HumanoidRootPart") and v1031:FindFirstChild("Humanoid") and v1031.Humanoid.Health > 0 then
                            if (v1031.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                repeat
                                    task.wait(_G.Fast_Delay or 0.1)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v1031.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1031.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1031.HumanoidRootPart.Transparency = 1
                                    v1031.Humanoid.JumpPower = 0
                                    v1031.Humanoid.WalkSpeed = 0
                                    v1031.HumanoidRootPart.CanCollide = false
                                    FarmPos = v1031.HumanoidRootPart.CFrame
                                    MonFarm = v1031.Name
                                until not v1031.Parent or not _G.CastleRaid
                            end
                        end
                    end
                else
                    Tween(v764)
                end
            end)
        end
    end
end)

v52 = Tabs["Main"]:AddToggle("ToggleHakiFortress", {Title="Activate Color Haki (Fortress)", Description="", Default=false})
v52:OnChanged(function(v246) _G.EnableHakiFortress = v246 end)
local function v53(v241, v242)
    local v243 = {[1] = {StorageName = v241, Type = "AuraSkin", Context = "Equip"}}
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(v243))
    Tween2(v242)
end
local function v54(v244, v245)
    local v246 = game.Players.LocalPlayer.Character
    if not v246 or not v246:FindFirstChild("HumanoidRootPart") then return false end
    local v247 = v246.HumanoidRootPart.Position
    return (v247 - v244).Magnitude < v245
end
spawn(function()
    while true do
        if _G.EnableHakiFortress then
            v53("Snow White", Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125))
            while not v54(Vector3.new(-4971.71826171875, 335.9582214355469, -3720.0595703125), 1) do wait(0.1) end
            wait(0.5)
            v53("Winter Sky", Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375))
            while not v54(Vector3.new(-5420.26318359375, 1089.3582763671875, -2666.8193359375), 1) do wait(0.1) end
            wait(0.5)
            _G.EnableHakiFortress = false
        end
        wait(0.5)
    end
end)

v55 = Tabs["Main"]:AddToggle("ToggleCollectChest", {Title="Auto Farm Chest", Description="", Default=false})
v55:OnChanged(function(v248) _G.AutoCollectChest = v248 end)
spawn(function()
    while wait() do
        if _G.AutoCollectChest then
            local v673 = game:GetService("Players")
            local v674 = v673.LocalPlayer
            local v675 = v674.Character or v674.CharacterAdded:Wait()
            local v676 = v675:GetPivot().Position
            local v677 = game:GetService("CollectionService")
            local v678 = v677:GetTagged("_ChestTagged")
            local v679, v680 = math.huge, nil
            for v765 = 1, #v678 do
                local v766 = v678[v765]
                local v767 = (v766:GetPivot().Position - v676).Magnitude
                if not v766:GetAttribute("IsDisabled") and v767 < v679 then
                    v679, v680 = v767, v766
                end
            end
            if v680 then
                local v840 = v680:GetPivot().Position
                Tween2(CFrame.new(v840))
            end
        end
    end
end)

v56 = Tabs["Main"]:AddSection("Mastery")
v57 = Tabs["Main"]:AddDropdown("DropdownMastery", {Title="Auto Farm Mastery", Description="", Values={"Melee","Sword","Gun","Devil Fruit","Near Mobs"}, Multi=false, Default=1})
v57:OnChanged(function(v249) TypeMastery = v249 end)
v58 = Tabs["Main"]:AddToggle("ToggleMasteryFruit", {Title="Auto Mastery Fruit", Description="", Default=false})
v58:OnChanged(function(v250) _G.AutoFarmMasDevilFruit = v250 end)
v59 = Tabs["Main"]:AddSlider("SliderHealth", {Title="Mob HP", Description="", Default=20, Min=0, Max=100, Rounding=1, Callback=function(v251) KillPercent = v251 end})
v59:OnChanged(function(v252) KillPercent = v252 end)
v59:SetValue(20)

v60 = Tabs["Main"]:AddSection("Boss")
tableBoss = {}
if Sea1 then
    tableBoss = {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
elseif Sea2 then
    tableBoss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
elseif Sea3 then
    tableBoss = {"Stone","Hydra Leader","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
end
v61 = Tabs["Main"]:AddDropdown("DropdownBoss", {Title="Select Boss", Description="", Values=tableBoss, Multi=false, Default=1})
v61:OnChanged(function(v253) SelectBoss = v253 end)
v62 = Tabs["Main"]:AddToggle("ToggleAutoFarmBoss", {Title="Auto Farm Boss", Description="", Default=false})
v62:OnChanged(function(v254) _G.AutoBoss = v254 end)
spawn(function()
    while wait() do
        if _G.AutoBoss then
            pcall(function()
                CheckBossQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
                    for _, v1035 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1035.Name == SelectBoss then
                            if v1035:FindFirstChild("Humanoid") and v1035:FindFirstChild("HumanoidRootPart") and v1035.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay or 0.1)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1035.HumanoidRootPart.CanCollide = false
                                    v1035.Humanoid.WalkSpeed = 0
                                    v1035.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1035.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoBoss or not v1035.Parent or v1035.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)
        end
    end
end)

v63 = Tabs["Main"]:AddSection("Material")
MaterialList = {}
if Sea1 then
    MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail"}
elseif Sea2 then
    MaterialList = {"Radioactive Material","Mystic Droplet","Magma Ore","Vampire Fang"}
elseif Sea3 then
    MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk","Hydra Enforcer","Venomous Assailant"}
end
v64 = Tabs["Main"]:AddDropdown("DropdownMaterial", {Title="Select Material", Description="", Values=MaterialList, Multi=false, Default=1})
v64:OnChanged(function(v255) SelectMaterial = v255 end)
v65 = Tabs["Main"]:AddToggle("ToggleMaterial", {Title="Auto Farm Material", Description="", Default=false})
v65:OnChanged(function(v256)
    _G.AutoMaterial = v256
    if v256 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon()
                Tween(MPos)
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    for _, v1037 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v1037:FindFirstChild("Humanoid") and v1037:FindFirstChild("HumanoidRootPart") and v1037.Humanoid.Health > 0 then
                            if v1037.Name == MMon then
                                repeat
                                    wait(_G.Fast_Delay or 0.1)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v1037.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1037.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1037.HumanoidRootPart.Transparency = 1
                                    v1037.Humanoid.JumpPower = 0
                                    v1037.Humanoid.WalkSpeed = 0
                                    v1037.HumanoidRootPart.CanCollide = false
                                    FarmPos = v1037.HumanoidRootPart.CFrame
                                    MonFarm = v1037.Name
                                until not _G.AutoMaterial or not v1037.Parent or v1037.Humanoid.Health <= 0
                                bringmob = false
                            end
                        end
                    end
                else
                    for _, v1039 in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if string.find(v1039.Name, MMon) then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1039.Position).Magnitude >= 10 then
                                Tween(v1039.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v528 = Tabs["Main"]:AddSection("Elite")
v529 = Tabs["Main"]:AddParagraph({Title="Elite Status", Content=""})
v530 = Tabs["Main"]:AddToggle("ToggleElite", {Title="Auto Elite Hunter", Description="", Default=false})
v530:OnChanged(function(v638) _G.AutoElite = v638 end)
spawn(function()
    while task.wait() do
        if _G.AutoElite then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                            for _, v1664 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v1664:FindFirstChild("Humanoid") and v1664:FindFirstChild("HumanoidRootPart") and v1664.Humanoid.Health > 0 then
                                    if v1664.Name == "Diablo" or v1664.Name == "Urban" then
                                        repeat
                                            wait(_G.Fast_Delay)
                                            AttackNoCoolDown()
                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            v1664.HumanoidRootPart.CanCollide = false
                                            v1664.Humanoid.WalkSpeed = 0
                                            v1664.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            Tween(v1664.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        until not _G.AutoElite or not v1664.Parent or v1664.Humanoid.Health <= 0
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end)
        end
    end
end)

v485T = Tabs["Main"]:AddSection("Bone")
v485 = Tabs["Main"]:AddParagraph({Title="Bone Status", Content=""})
spawn(function()
    pcall(function()
        while wait() do
            local v768 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            v485:SetDesc("You have: " .. tostring(v768) .. " Bones")
        end
    end)
end)
v486 = Tabs["Main"]:AddToggle("ToggleBone", {Title="Auto Farm Bone", Description="", Default=false})
v486:OnChanged(function(v571)
    _G.AutoBone = v571
    if v571 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
v487 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
spawn(function()
    while wait() do
        if _G.AutoBone then
            pcall(function()
                Tween(v487)
                if (v487.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                    local v894 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(v894, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Tween(v487)
                        if (v487.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Possessed Mummy") then
                            for _, v1662 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v1662:FindFirstChild("HumanoidRootPart") and v1662:FindFirstChild("Humanoid") and v1662.Humanoid.Health > 0 then
                                    if v1662.Name == "Reborn Skeleton" or v1662.Name == "Living Zombie" or v1662.Name == "Demonic Soul" or v1662.Name == "Possessed Mummy" then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            repeat
                                                wait(_G.Fast_Delay)
                                                AttackNoCoolDown()
                                                AutoHaki()
                                                bringmob = true
                                                EquipTool(SelectWeapon)
                                                Tween(v1662.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                v1662.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v1662.HumanoidRootPart.Transparency = 1
                                                v1662.Humanoid.JumpPower = 0
                                                v1662.Humanoid.WalkSpeed = 0
                                                v1662.HumanoidRootPart.CanCollide = false
                                                FarmPos = v1662.HumanoidRootPart.CFrame
                                                MonFarm = v1662.Name
                                            until not _G.AutoBone or not v1662.Parent or v1662.Humanoid.Health <= 0
                                            bringmob = false
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
v488 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
v489 = Tabs["Main"]:AddToggle("ToggleBoneNoQuest", {Title="Auto Farm Bone (No Quest)", Description="", Default=false})
v489:OnChanged(function(v574) _G.AutoBoneNoQuest = v574 end)
spawn(function()
    while wait() do
        if _G.AutoBoneNoQuest then
            pcall(function()
                Tween(v488)
                if (v488.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Possessed Mummy") then
                        for _, v1437 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1437:FindFirstChild("HumanoidRootPart") and v1437:FindFirstChild("Humanoid") and v1437.Humanoid.Health > 0 then
                                if v1437.Name == "Reborn Skeleton" or v1437.Name == "Living Zombie" or v1437.Name == "Demonic Soul" or v1437.Name == "Possessed Mummy" then
                                    repeat
                                        wait(_G.Fast_Delay)
                                        AttackNoCoolDown()
                                        AutoHaki()
                                        bringmob = true
                                        EquipTool(SelectWeapon)
                                        Tween(v1437.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        v1437.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v1437.HumanoidRootPart.Transparency = 1
                                        v1437.Humanoid.JumpPower = 0
                                        v1437.Humanoid.WalkSpeed = 0
                                        v1437.HumanoidRootPart.CanCollide = false
                                        FarmPos = v1437.HumanoidRootPart.CFrame
                                        MonFarm = v1437.Name
                                    until not _G.AutoBoneNoQuest or v1437.Humanoid.Health <= 0 or not v1437.Parent
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
v490 = Tabs["Main"]:AddToggle("ToggleRandomBone", {Title="Auto Random Bone", Description="", Default=false})
v490:OnChanged(function(v575) _G.AutoRandomBone = v575 end)
spawn(function()
    while wait() do
        if _G.AutoRandomBone then
            local v844 = {[1]="Bones",[2]="Buy",[3]=1,[4]=1}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v844))
        end
    end
end)

-- CAKE PRINCE
v491 = Tabs["Main"]:AddSection("Cake Prince")
v491P = Tabs["Main"]:AddParagraph({Title="Cake Prince Status", Content=""})
spawn(function()
    while wait() do
        pcall(function()
            local spawner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            if string.len(spawner) == 88 then
                v491P:SetDesc("Left: " .. string.sub(spawner, 39, 41) .. "")
            elseif string.len(spawner) == 87 then
                v491P:SetDesc("Con: " .. string.sub(spawner, 39, 40) .. "")
            elseif string.len(spawner) == 86 then
                v491P:SetDesc("Con: " .. string.sub(spawner, 39, 39) .. "")
            else
                v491P:SetDesc("Tự Lệnh Bánh: 1")
            end
        end)
    end
end)
v492 = Tabs["Main"]:AddToggle("ToggleCake", {Title="Auto Cake Prince", Description="", Default=false})
v492:OnChanged(function(v575)
    _G.CakePrince = v575
    if v575 then
        Tween(CFrame.new(-2003.932861328125, 380.4824523925781, -12561.0185546875))
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while wait() do
        if _G.CakePrince then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    for _, v1439 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1439.Name == "Cake Prince" then
                            if v1439:FindFirstChild("Humanoid") and v1439:FindFirstChild("HumanoidRootPart") and v1439.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1439.HumanoidRootPart.CanCollide = false
                                    v1439.Humanoid.WalkSpeed = 0
                                    v1439.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1439.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.CakePrince or not v1439.Parent or v1439.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                else
                    for _, v1755 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1755.Name == "Cookie Crafter" or v1755.Name == "Cake Guard" or v1755.Name == "Baking Staff" or v1755.Name == "Head Baker" then
                            if v1755:FindFirstChild("Humanoid") and v1755:FindFirstChild("HumanoidRootPart") and v1755.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    v1755.HumanoidRootPart.CanCollide = false
                                    v1755.Humanoid.WalkSpeed = 0
                                    v1755.Head.CanCollide = false
                                    v1755.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    FarmPos = v1755.HumanoidRootPart.CFrame
                                    MonFarm = v1755.Name
                                    Tween(v1755.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.CakePrince or not v1755.Parent or v1755.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                bringmob = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v494 = Tabs["Main"]:AddToggle("ToggleDoughKing", {Title="Auto Dough King", Description="", Default=false})
v494:OnChanged(function(v576)
    _G.DoughKing = v576
    if v576 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while wait() do
        if _G.DoughKing then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                    for _, v1441 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1441.Name == "Dough King" then
                            if v1441:FindFirstChild("Humanoid") and v1441:FindFirstChild("HumanoidRootPart") and v1441.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1441.HumanoidRootPart.CanCollide = false
                                    v1441.Humanoid.WalkSpeed = 0
                                    v1441.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1441.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.DoughKing or not v1441.Parent or v1441.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v495 = Tabs["Main"]:AddToggle("ToggleSpawnCake", {Title="Spawn Cake Prince", Description="", Default=true})
v495:OnChanged(function(v577) _G.SpawnCakePrince = v577 end)
spawn(function()
    while wait() do
        if _G.SpawnCakePrince then
            local v681 = {[1]="CakePrinceSpawner",[2]=true}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v681))
            local v682 = {[1]="CakePrinceSpawner"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v682))
        end
    end
end)

v497 = Tabs["Main"]:AddToggle("ToggleEctoplasm", {Title="Auto Ectoplasm", Description="", Default=false})
v497:OnChanged(function(v578) _G.Ectoplasm = v578 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Ectoplasm then
                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                    for _, v1443 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1443.Name == "Ship Steward" or v1443.Name == "Ship Engineer" or v1443.Name == "Ship Deckhand" or (v1443.Name == "Ship Officer" and v1443:FindFirstChild("Humanoid")) then
                            if v1443.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v1443.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1443.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1443.HumanoidRootPart.Transparency = 1
                                    v1443.Humanoid.JumpPower = 0
                                    v1443.Humanoid.WalkSpeed = 0
                                    v1443.HumanoidRootPart.CanCollide = false
                                    FarmPos = v1443.HumanoidRootPart.CFrame
                                    MonFarm = v1443.Name
                                until _G.Ectoplasm == false or not v1443.Parent or v1443.Humanoid.Health == 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v1443.Name)
                                bringmob = false
                            end
                        end
                    end
                else
                    local v1334 = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if v1334 > 20000 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    end
                    Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                end
            end
        end)
    end
end)

-- TAB ITM
v69 = Tabs["ITM"]:AddToggle("ToggleAutoSaber", {Title="Auto Saber", Description="", Default=false})
v69:OnChanged(function(v260) _G.Auto_Saber = v260 end)

v70 = Tabs["ITM"]:AddToggle("ToggleAutoPoleV1", {Title="Auto Pole V1", Description="", Default=false})
v70:OnChanged(function(v261) _G.Auto_PoleV1 = v261 end)

v72 = Tabs["ITM"]:AddToggle("ToggleAutoSaw", {Title="Auto Shark Saw", Description="", Default=false})
v72:OnChanged(function(v262) _G.Auto_Saw = v262 end)

v73 = Tabs["ITM"]:AddToggle("ToggleAutoWarden", {Title="Auto Warden", Description="", Default=false})
v73:OnChanged(function(v263) _G.Auto_Warden = v263 end)

v533 = Tabs["ITM"]:AddToggle("ToggleHallow", {Title="Auto Hallow Scythe", Description="", Default=false})
v533:OnChanged(function(v640) AutoHallowScythe = v640 end)

v534 = Tabs["ITM"]:AddToggle("ToggleYama", {Title="Yama", Description="", Default=false})
v534:OnChanged(function(v641) _G.AutoYama = v641 end)

v535 = Tabs["ITM"]:AddToggle("ToggleTushita", {Title="Tushita", Description="", Default=false})
v535:OnChanged(function(v642) AutoTushita = v642 end)

v536 = Tabs["ITM"]:AddToggle("ToggleHoly", {Title="Light The Holy Torch", Description="", Default=false})
v536:OnChanged(function(v643) _G.Auto_Holy_Torch = v643 end)

v75 = Tabs["ITM"]:AddToggle("ToggleAutoCanvander", {Title="Auto Canvander", Description="", Default=false})
v75:OnChanged(function(v264) _G.Auto_Canvander = v264 end)

v76 = Tabs["ITM"]:AddToggle("ToggleAutoMusketeerHat", {Title="Auto Musketeer Hat", Description="", Default=false})
v76:OnChanged(function(v265) _G.Auto_MusketeerHat = v265 end)

v77 = Tabs["ITM"]:AddToggle("ToggleAutoObservationV2", {Title="Auto Observation V2", Description="", Default=false})
v77:OnChanged(function(v266) _G.Auto_ObservationV2 = v266 end)

v78 = Tabs["ITM"]:AddToggle("ToggleAutoRainbowHaki", {Title="Auto Rainbow Haki", Description="", Default=false})
v78:OnChanged(function(v267) _G.Auto_RainbowHaki = v267 end)

v79 = Tabs["ITM"]:AddToggle("ToggleAutoSkullGuitar", {Title="Auto Skull Guitar", Description="", Default=false})
v79:OnChanged(function(v268) _G.Auto_SkullGuitar = v268 end)

v80 = Tabs["ITM"]:AddToggle("ToggleAutoBuddy", {Title="Auto Buddy", Description="", Default=false})
v80:OnChanged(function(v269) _G.Auto_Buddy = v269 end)

v82 = Tabs["ITM"]:AddToggle("ToggleAutoDualKatana", {Title="Auto CDK", Description="", Default=false})
v82:OnChanged(function(v270) _G.Auto_DualKatana = v270 end)

if Sea2 then
    local v537 = Tabs["ITM"]:AddToggle("ToggleFactory", {Title="Auto Factory", Description="", Default=false})
    v537:OnChanged(function(v644) _G.Factory = v644 end)

    local v83 = Tabs["ITM"]:AddToggle("ToggleAutoFarmSwan", {Title="Auto Swan", Description="", Default=false})
    v83:OnChanged(function(v271) _G.AutoFarmSwan = v271 end)

    local v84 = Tabs["ITM"]:AddToggle("ToggleAutoRengoku", {Title="Rengoku", Description="", Default=false})
    v84:OnChanged(function(v272) _G.Auto_Regoku = v272 end)
end

spawn(function()
    while wait() do
        if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            pcall(function()
                if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                    if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        if (CFrame.new(-1612.55884, 36.9774132, 148.719543).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(1)
                        end
                    elseif game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipTool("Torch")
                            Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803))
                        else
                            Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        wait(0.5)
                        EquipTool("Cup")
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
                        wait(0)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    else
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        else
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                    Tween(CFrame.new(-2967.59521, -4.91089821, 5328.70703))
                                    for _, v1800 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v1800.Name == "Mob Leader" then
                                            EquipTool(SelectWeapon)
                                            v1800.HumanoidRootPart.CanCollide = false
                                            v1800.Humanoid.WalkSpeed = 0
                                            v1800.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            Tween(v1800.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            repeat
                                                AttackNoCoolDown()
                                                task.wait(_G.Fast_Delay or 0.1)
                                            until v1800.Humanoid.Health <= 0 or not _G.Auto_Saber
                                        end
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                wait(0.5)
                                EquipTool("Relic")
                                wait(0.5)
                                Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116))
                            end
                        end
                    end
                elseif game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                    for _, v1461 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1461:FindFirstChild("Humanoid") and v1461:FindFirstChild("HumanoidRootPart") and v1461.Humanoid.Health > 0 then
                            if v1461.Name == "Saber Expert" then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1461.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1461.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1461.HumanoidRootPart.Transparency = 1
                                    v1461.Humanoid.JumpPower = 0
                                    v1461.Humanoid.WalkSpeed = 0
                                    v1461.HumanoidRootPart.CanCollide = false
                                    bringmob = true
                                    if v1461.Humanoid.Health <= 0 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                    end
                                until not _G.Auto_Saber or not v1461.Parent or v1461.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v71 = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
spawn(function()
    while wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    for _, v1043 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1043.Name == "Thunder God" then
                            if v1043:FindFirstChild("Humanoid") and v1043:FindFirstChild("HumanoidRootPart") and v1043.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1043.HumanoidRootPart.CanCollide = false
                                    v1043.Humanoid.WalkSpeed = 0
                                    v1043.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v1043.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.Auto_PoleV1 or not v1043.Parent or v1043.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500 then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

v71s = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
spawn(function()
    while wait() do
        if _G.Auto_Saw then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                    for _, v1045 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1045.Name == "The Saw" then
                            if v1045:FindFirstChild("Humanoid") and v1045:FindFirstChild("HumanoidRootPart") and v1045.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1045.HumanoidRootPart.CanCollide = false
                                    v1045.Humanoid.WalkSpeed = 0
                                    v1045.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v1045.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.Auto_Saw or not v1045.Parent or v1045.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71s.Position).Magnitude < 1500 then
                    Tween(v71s)
                end
                Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

v74 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
spawn(function()
    while wait() do
        if _G.Auto_Warden then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                    for _, v1047 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1047.Name == "Chief Warden" then
                            if v1047:FindFirstChild("Humanoid") and v1047:FindFirstChild("HumanoidRootPart") and v1047.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1047.HumanoidRootPart.CanCollide = false
                                    v1047.Humanoid.WalkSpeed = 0
                                    v1047.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v1047.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.Auto_Warden or not v1047.Parent or v1047.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v74.Position).Magnitude < 1500 then
                    Tween(v74)
                end
                Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if AutoHallowScythe then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for _, v1463 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v1463.Name, "Soul Reaper") then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v1463.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(v1463.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                v1463.HumanoidRootPart.Transparency = 1
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until v1463.Humanoid.Health <= 0 or AutoHallowScythe == false
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                    repeat
                        Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                        wait()
                    until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                    wait()
                    EquipTool("Hallow Essence")
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                repeat
                    wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end
end)

spawn(function()
    while wait() do
        if AutoTushita then
            if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                for _, v1341 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v1341.Name == "Longma" and v1341.Humanoid.Health > 0 and v1341:IsA("Model") and v1341:FindFirstChild("Humanoid") and v1341:FindFirstChild("HumanoidRootPart") then
                        repeat
                            task.wait(_G.Fast_Delay)
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            v1341.HumanoidRootPart.CanCollide = false
                            v1341.Humanoid.WalkSpeed = 0
                            v1341.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            Tween(v1341.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            AttackNoCoolDown()
                        until not AutoTushita or not v1341.Parent or v1341.Humanoid.Health <= 0
                    end
                end
                Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Auto_Holy_Torch then
            pcall(function()
                wait()
                repeat Tween(CFrame.new(-10752, 417, 9366)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, 9366)).Magnitude <= 10
                wait()
                repeat Tween(CFrame.new(-11672, 334, 9474)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, 9474)).Magnitude <= 10
                wait()
                repeat Tween(CFrame.new(-12132, 521, -10655)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                wait()
                repeat Tween(CFrame.new(-13336, 486, -6985)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                wait()
                repeat Tween(CFrame.new(-13489, 332, 7925)) wait() until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, 7925)).Magnitude <= 10
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Auto_Canvander then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for _, v1049 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1049.Name == "Beautiful Pirate" then
                            if v1049:FindFirstChild("Humanoid") and v1049:FindFirstChild("HumanoidRootPart") and v1049.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1049.HumanoidRootPart.CanCollide = false
                                    v1049.Humanoid.WalkSpeed = 0
                                    v1049.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v1049.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.Auto_Canvander or not v1049.Parent or v1049.Humanoid.Health <= 0
                            end
                        end
                    end
                    Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_MusketeerHat then
                if game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                            for _, v1560 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v1560.Name == "Forest Pirate" then
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        pcall(function()
                                            EquipTool(SelectWeapon)
                                            AutoHaki()
                                            v1560.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            Tween(v1560.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            v1560.HumanoidRootPart.CanCollide = false
                                            AttackNoCoolDown()
                                            PosMon = v1560.HumanoidRootPart.CFrame
                                            MonFarm = v1560.Name
                                        end)
                                    until not _G.Auto_MusketeerHat or not v1560.Parent or v1560.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                elseif game.Players.LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for _, v1666 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v1666.Name == "Captain Elephant" then
                                    OldCFrameElephant = v1666.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        pcall(function()
                                            EquipTool(SelectWeapon)
                                            AutoHaki()
                                            v1666.HumanoidRootPart.CanCollide = false
                                            v1666.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            Tween(v1666.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            v1666.HumanoidRootPart.CFrame = OldCFrameElephant
                                            AttackNoCoolDown()
                                        end)
                                    until not _G.Auto_MusketeerHat or not v1666.Parent or v1666.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_ObservationV2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3 then
                    _G.Auto_MusketeerHat = false
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                        repeat Tween(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) wait() until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                        repeat Tween(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) wait() until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                    else
                        for _, v1562 in pairs(game:GetService("Workspace"):GetDescendants()) do
                            if v1562.Name == "Apple" or v1562.Name == "Banana" or v1562.Name == "Pineapple" then
                                v1562.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                wait()
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v1562.Handle, 0)
                                wait()
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_RainbowHaki then
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                        for _, v1564 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1564.Name == "Stone" then
                                OldCFrameRainbow = v1564.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1564.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1564.HumanoidRootPart.CanCollide = false
                                    v1564.HumanoidRootPart.CFrame = OldCFrameRainbow
                                    v1564.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    AttackNoCoolDown()
                                until not _G.Auto_RainbowHaki or v1564.Humanoid.Health <= 0 or not v1564.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436))
                    end
                elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                        for _, v1670 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1670.Name == "Hydra Leader" then
                                OldCFrameRainbow = v1670.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1670.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1670.HumanoidRootPart.CanCollide = false
                                    v1670.HumanoidRootPart.CFrame = OldCFrameRainbow
                                    AttackNoCoolDown()
                                until not _G.Auto_RainbowHaki or v1670.Humanoid.Health <= 0 or not v1670.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
                    end
                elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                        for _, v1763 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1763.Name == "Kilo Admiral" then
                                OldCFrameRainbow = v1763.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1763.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1763.HumanoidRootPart.CanCollide = false
                                    v1763.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v1763.HumanoidRootPart.CFrame = OldCFrameRainbow
                                    AttackNoCoolDown()
                                until not _G.Auto_RainbowHaki or v1763.Humanoid.Health <= 0 or not v1763.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(2877.61743, 423.558685, -7207.31006))
                    end
                elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for _, v1775 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1775.Name == "Captain Elephant" then
                                OldCFrameRainbow = v1775.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1775.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1775.HumanoidRootPart.CanCollide = false
                                    v1775.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v1775.HumanoidRootPart.CFrame = OldCFrameRainbow
                                    AttackNoCoolDown()
                                until not _G.Auto_RainbowHaki or v1775.Humanoid.Health <= 0 or not v1775.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(-13485.0283, 331.709259, -8012.4873))
                    end
                elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for _, v1803 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1803.Name == "Beautiful Pirate" then
                                OldCFrameRainbow = v1803.HumanoidRootPart.CFrame
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v1803.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1803.HumanoidRootPart.CanCollide = false
                                    v1803.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v1803.HumanoidRootPart.CFrame = OldCFrameRainbow
                                    AttackNoCoolDown()
                                until not _G.Auto_RainbowHaki or v1803.Humanoid.Health <= 0 or not v1803.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5312.3598632813, 29.141201019287, 19.158538818359))
                    end
                else
                    Tween(CFrame.new(-11892.9793125, 939.57672119141, -8769.1591796875))
                    if (Vector3.new(-11892.9793125, 939.57672119141, -8769.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.Auto_SkullGuitar then
            if GetweaponInventory("Skull Guitar") == false then
                if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                    if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                    elseif game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
                        if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
                            Quest2 = true
                            repeat
                                wait()
                                Tween(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875))
                            until (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                            wait(1)
                            repeat
                                wait()
                                Tween(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625))
                            until (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        else
                            Quest3 = true
                        end
                    else
                        if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                            local v1798 = {[1]="GuitarPuzzleProgress", [2]="Ghost"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1798))
                        end
                        if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                            for _, v1805 in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v1805:FindFirstChild("HumanoidRootPart") and v1805:FindFirstChild("Humanoid") and v1805.Humanoid.Health > 0 then
                                    if v1805.Name == "Living Zombie" then
                                        EquipTool(SelectWeapon)
                                        v1805.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v1805.HumanoidRootPart.Transparency = 1
                                        v1805.Humanoid.JumpPower = 0
                                        v1805.Humanoid.WalkSpeed = 0
                                        v1805.HumanoidRootPart.CanCollide = false
                                        v1805.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                        Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                end
                            end
                        else
                            Tween(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                        end
                    end
                elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                    Tween(CFrame.new(-8653.2060546875, 140.98478754003906, 6341.3720703125))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                else
                    Tween(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
                end
            end
        end
    end
end)

v81 = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
spawn(function()
    while wait() do
        if _G.Auto_Buddy then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for _, v1051 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1051.Name == "Cake Queen" then
                            if v1051:FindFirstChild("Humanoid") and v1051:FindFirstChild("HumanoidRootPart") and v1051.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1051.HumanoidRootPart.CanCollide = false
                                    v1051.Humanoid.WalkSpeed = 0
                                    v1051.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v1051.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                until not _G.Auto_Buddy or not v1051.Parent or v1051.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v81.Position).Magnitude < 1500 then
                        Tween(v81)
                    end
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                        EquipTool("Tushita")
                    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") then
                        EquipTool("Yama")
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if GetMaterial("Alucard Fragment") == 0 then
                    Auto_Quest_Yama_1 = true
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                elseif GetMaterial("Alucard Fragment") == 1 then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = true
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                elseif GetMaterial("Alucard Fragment") == 2 then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = true
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                elseif GetMaterial("Alucard Fragment") == 3 then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = true
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                elseif GetMaterial("Alucard Fragment") == 4 then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = true
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                elseif GetMaterial("Alucard Fragment") == 5 then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = true
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                end
            end
        end)
    end
end)

if Sea2 then
    spawn(function()
        while wait() do
            if _G.Factory then
                if game.Workspace.Enemies:FindFirstChild("Core") then
                    for _, v1345 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v1345.Name == "Core" and v1345.Humanoid.Health > 0 then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                repeat
                                    Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                                    wait()
                                until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
                                EquipTool(SelectWeapon)
                                AutoHaki()
                                Tween(v1345.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                v1345.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v1345.HumanoidRootPart.Transparency = 1
                                v1345.Humanoid.JumpPower = 0
                                v1345.Humanoid.WalkSpeed = 0
                                v1345.HumanoidRootPart.CanCollide = false
                                FarmPos = v1345.HumanoidRootPart.CFrame
                                MonFarm = v1345.Name
                            until not v1345.Parent or v1345.Humanoid.Health <= 0 or _G.Factory == false
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Core") then
                    repeat
                        Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                        wait()
                    until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
                end
            end
        end
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFarmSwan then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                        for _, v1064 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1064.Name == "Don Swan" and v1064.Humanoid.Health > 0 and v1064:IsA("Model") and v1064:FindFirstChild("Humanoid") and v1064:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        v1064.HumanoidRootPart.CanCollide = false
                                        v1064.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Tween(v1064.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        AttackNoCoolDown()
                                    end)
                                until _G.AutoFarmSwan == false or v1064.Humanoid.Health <= 0
                            end
                        end
                    else
                        repeat
                            task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                        until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or _G.AutoFarmSwan == false
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Regoku then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipTool("Hidden Key")
                        Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                        for _, v1467 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1467.Name == "Snow Lurker" or v1467.Name == "Arctic Warrior" and v1467.Humanoid.Health > 0 then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    AutoHaki()
                                    v1467.HumanoidRootPart.CanCollide = false
                                    v1467.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    FarmPos = v1467.HumanoidRootPart.CFrame
                                    MonFarm = v1467.Name
                                    Tween(v1467.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    AttackNoCoolDown()
                                    bringmob = true
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Auto_Regoku == false or not v1467.Parent or v1467.Humanoid.Health <= 0
                                bringmob = false
                            end
                        end
                    else
                        bringmob = false
                        Tween(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)
end

-- ============================================================
-- TAB SEA
-- ============================================================
if Sea3 then
    local v531 = Tabs["Sea"]:AddSection("Mirage Island")
    local v532 = Tabs["Sea"]:AddParagraph({Title="Status", Content=""})
    task.spawn(function()
        while task.wait() do
            pcall(function()
                local v793 = game:GetService("Lighting").Sky.MoonTextureId
                if v793 == "http://www.roblox.com/asset/?id=9709149431" then FullMoonStatus = "100%"
                elseif v793 == "http://www.roblox.com/asset/?id=9709149052" then FullMoonStatus = "75%"
                elseif v793 == "http://www.roblox.com/asset/?id=9709143733" then FullMoonStatus = "50%"
                elseif v793 == "http://www.roblox.com/asset/?id=9709150401" then FullMoonStatus = "25%"
                elseif v793 == "http://www.roblox.com/asset/?id=9709149686" then FullMoonStatus = "0%" end
            end)
        end
    end)
    task.spawn(function()
        while task.wait() do
            pcall(function()
                if game.Workspace.Map:FindFirstChild("MysticIsland") then MriageStatus = "Đã tìm thấy" else MriageStatus = "Không có" end
            end)
        end
    end)
    spawn(function()
        pcall(function()
            while wait() do v532:SetDesc("Mirage: " .. MriageStatus .. " | Full Moon: " .. FullMoonStatus) end
        end)
    end)
    Tabs["Sea"]:AddButton({Title="Fly To The High Mountain", Description="", Callback=function() TweenToHighestPoint() end})
    function TweenToHighestPoint()
        local v639 = getHighestPoint()
        if v639 then Tween2(v639.CFrame * CFrame.new(0, 211.88, 0)) end
    end
    function getHighestPoint()
        if not game.Workspace.Map:FindFirstChild("MysticIsland") then return nil end
        for _, v729 in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
            if v729:IsA("MeshPart") then
                if v729.MeshId == "rbxassetid://83190276951914" then return v729 end
            end
        end
    end
end

v66 = Tabs["Sea"]:AddToggle("ToggleTpAdvanced", {Title="Fly To Advanced Fruit Dealer", Description="", Default=false})
v66:OnChanged(function(v257)
    if v257 then
        local v730 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
        if v730 and v730:IsA("Model") then
            local v856 = v730.PrimaryPart and v730.PrimaryPart.Position
            if v856 then Tween2(CFrame.new(v856)) end
        end
    end
end)

v67 = Tabs["Sea"]:AddToggle("ToggleTweenGear", {Title="Fly To Gear", Description="", Default=false})
v67:OnChanged(function(v258) _G.TweenToGear = v258 end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenToGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for _, v1041 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if v1041:IsA("MeshPart") then
                            if v1041.Material == Enum.Material.Neon then Tween2(v1041.CFrame) end
                        end
                    end
                end
            end
        end
    end)
end)

v68 = Tabs["Sea"]:AddToggle("Togglelockmoon", {Title="Look Moon", Description="", Default=false})
v68:OnChanged(function(v259) _G.AutoLockMoon = v259 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("ReplicatedStorage").Remotes.CommF_:FireServer("ActivateAbility")
            end
        end)
    end
end)

v500 = Tabs["Sea"]:AddToggle("ToggleEspKitsune", {Title="Kitsune Island ESP", Description="", Default=false})
v500:OnChanged(function(v579) KitsuneIslandEsp = v579 end)
spawn(function()
    while wait() do
        if KitsuneIslandEsp then UpdateIslandKisuneESP() end
    end
end)

v501 = Tabs["Sea"]:AddToggle("ToggleTPKitsune", {Title="Fly to Kitsune Island", Description="", Default=false})
v501:OnChanged(function(v580) _G.TweenToKitsune = v580 end)
spawn(function()
    local v581
    while not v581 do
        v581 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        wait()
    end
    while wait() do
        if _G.TweenToKitsune then
            local v845 = v581:FindFirstChild("ShrineActive")
            if v845 then
                for _, v1336 in pairs(v845:GetDescendants()) do
                    if v1336:IsA("BasePart") and v1336.Name:find("NeonShrinePart") then Tween(v1336.CFrame) end
                end
            end
        end
    end
end)

v502 = Tabs["Sea"]:AddToggle("ToggleCollectAzure", {Title="Auto Collect Azure Ember", Description="", Default=false})
v502:OnChanged(function(v582) _G.CollectAzure = v582 end)
spawn(function()
    while wait() do
        if _G.CollectAzure then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                    Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                end
            end)
        end
    end
end)
Tabs["Sea"]:AddButton({Title="Auto Trade Azure Ember", Description="", Callback=function()
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
end})

if Sea3 then
    local v503 = Tabs["Sea"]:AddSection("Sea")
    local v504 = game:GetService("Players")
    local v505 = game:GetService("RunService")
    local v506 = game:GetService("VirtualInputManager")
    local v507 = game:GetService("Workspace")
    local v508 = 350

    Tabs["Sea"]:AddSlider("SliderSnapdRnat", {Title="Boat Speed", Description="", Default=350, Min=100, Max=500, Rounding=1, Callback=function(v583) v508 = v583 end}):SetValue(350)

    local v510 = Tabs["Sea"]:AddToggle("AutoFindPrehistoric", {Title="Auto Find Prehistoric Island", Description="", Default=false})
    v510:OnChanged(function(v584) _G.AutoFindPrehistoric = v584 end)
    local v511 = {}
    local v512 = false
    local v513 = false
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindPrehistoric then v513 = false return end
        local v585 = v504.LocalPlayer
        local v586 = v585.Character
        if not v586 or not v586:FindFirstChild("Humanoid") then return end
        local function v587()
            if v512 then return end
            v512 = true
            for _, v770 in pairs(v511) do
                if v770 and v770.Parent and v770.Name == "VehicleSeat" and not v770.Occupant then Tween2(v770.CFrame) break end
            end
            v512 = false
        end
        local v588 = v586.Humanoid
        local v589 = false
        local v590 = nil
        for _, v685 in pairs(v507.Boats:GetChildren()) do
            local v686 = v685:FindFirstChild("VehicleSeat")
            if v686 and v686.Occupant == v588 then
                v589 = true
                v590 = v686
                v511[v685.Name] = v686
            elseif v686 and v686.Occupant == nil then v587() end
        end
        if not v589 then return end
        v590.MaxSpeed = v508
        v590.CFrame = CFrame.new(Vector3.new(v590.Position.X, v590.Position.Y, v590.Position.Z)) * v590.CFrame.Rotation
        v506:SendKeyEvent(true, "W", false, game)
        for _, v688 in pairs(v507.Boats:GetDescendants()) do if v688:IsA("BasePart") then v688.CanCollide = false end end
        for _, v690 in pairs(v586:GetDescendants()) do if v690:IsA("BasePart") then v690.CanCollide = false end end
        local v593 = {"ShipwreckIsland","SandIsland","TreeIsland","TinyIsland","MysticIsland","KitsuneIsland","FrozenDimension"}
        for _, v692 in ipairs(v593) do
            local v693 = v507.Map:FindFirstChild(v692)
            if v693 and v693:IsA("Model") then v693:Destroy() end
        end
        local v594 = v507.Map:FindFirstChild("PrehistoricIsland")
        if v594 then
            v506:SendKeyEvent(false, "W", false, game)
            _G.AutoFindPrehistoric = false
            if not v513 then
                Fluent:Notify({Title="Banana Cat Hub", Content="Đảo Dung Nham Tìm Thấy", Duration=10})
                v513 = true
            end
            return
        end
    end)

    local v514 = Tabs["Sea"]:AddToggle("AutoFindMirage", {Title="Auto Find Mirage", Description="", Default=false})
    v514:OnChanged(function(v595) _G.AutoFindMirage = v595 end)
    local v511m = {}
    local v512m = false
    local v513m = false
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindMirage then v513m = false return end
        local v596 = v504.LocalPlayer
        local v597 = v596.Character
        if not v597 or not v597:FindFirstChild("Humanoid") then return end
        local function v598()
            if v512m then return end
            v512m = true
            for _, v772 in pairs(v511m) do
                if v772 and v772.Parent and v772.Name == "VehicleSeat" and not v772.Occupant then Tween2(v772.CFrame) break end
            end
            v512m = false
        end
        local v599 = v597.Humanoid
        local v600 = false
        local v601 = nil
        for _, v695 in pairs(v507.Boats:GetChildren()) do
            local v696 = v695:FindFirstChild("VehicleSeat")
            if v696 and v696.Occupant == v599 then
                v600 = true
                v601 = v696
                v511m[v695.Name] = v696
            elseif v696 and v696.Occupant == nil then v598() end
        end
        if not v600 then return end
        v601.MaxSpeed = v508
        v601.CFrame = CFrame.new(Vector3.new(v601.Position.X, v601.Position.Y, v601.Position.Z)) * v601.CFrame.Rotation
        v506:SendKeyEvent(true, "W", false, game)
        for _, v698 in pairs(v507.Boats:GetDescendants()) do if v698:IsA("BasePart") then v698.CanCollide = false end end
        for _, v700 in pairs(v597:GetDescendants()) do if v700:IsA("BasePart") then v700.CanCollide = false end end
        local v604 = {"ShipwreckIsland","SandIsland","TreeIsland","TinyIsland","MysticIsland","KitsuneIsland","PrehistoricIsland"}
        for _, v702 in ipairs(v604) do
            local v703 = v507.Map:FindFirstChild(v702)
            if v703 and v703:IsA("Model") then v703:Destroy() end
        end
        local v605 = v507.Map:FindFirstChild("MysticIsland")
        if v605 then
            v506:SendKeyEvent(false, "W", false, game)
            _G.AutoFindMirage = false
            if not v513m then
                Fluent:Notify({Title="Banana Cat Hub", Content="Đảo Bí Ẩn Tìm Thấy", Duration=10})
                v513m = true
            end
            return
        end
    end)

    local v515 = Tabs["Sea"]:AddToggle("AutoFindFrozen", {Title="Auto Find Leviathan Island", Description="", Default=false})
    v515:OnChanged(function(v606) _G.AutoFindFrozen = v606 end)
    local v511f = {}
    local v512f = false
    local v513f = false
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindFrozen then v513f = false return end
        local v607 = v504.LocalPlayer
        local v608 = v607.Character
        if not v608 or not v608:FindFirstChild("Humanoid") then return end
        local function v609()
            if v512f then return end
            v512f = true
            for _, v774 in pairs(v511f) do
                if v774 and v774.Parent and v774.Name == "VehicleSeat" and not v774.Occupant then Tween2(v774.CFrame) break end
            end
            v512f = false
        end
        local v610 = v608.Humanoid
        local v611 = false
        local v612 = nil
        for _, v705 in pairs(v507.Boats:GetChildren()) do
            local v706 = v705:FindFirstChild("VehicleSeat")
            if v706 and v706.Occupant == v610 then
                v611 = true
                v612 = v706
                v511f[v705.Name] = v706
            elseif v706 and v706.Occupant == nil then v609() end
        end
        if not v611 then return end
        v612.MaxSpeed = v508
        v612.CFrame = CFrame.new(Vector3.new(v612.Position.X, v612.Position.Y, v612.Position.Z)) * v612.CFrame.Rotation
        v506:SendKeyEvent(true, "W", false, game)
        for _, v708 in pairs(v507.Boats:GetDescendants()) do if v708:IsA("BasePart") then v708.CanCollide = false end end
        for _, v710 in pairs(v608:GetDescendants()) do if v710:IsA("BasePart") then v710.CanCollide = false end end
        local v615 = {"ShipwreckIsland","SandIsland","TreeIsland","TinyIsland","MysticIsland","KitsuneIsland","PrehistoricIsland"}
        for _, v712 in ipairs(v615) do
            local v713 = v507.Map:FindFirstChild(v712)
            if v713 and v713:IsA("Model") then v713:Destroy() end
        end
        local v616 = v507.Map:FindFirstChild("FrozenDimension")
        if v616 then
            v506:SendKeyEvent(false, "W", false, game)
            _G.AutoFindFrozen = false
            if not v513f then
                Fluent:Notify({Title="Banana Cat Hub", Content="Đảo Leviathan Tìm Thấy", Duration=10})
                v513f = true
            end
            return
        end
    end)

    local v516 = Tabs["Sea"]:AddToggle("AutoComeTiki", {Title="Go Back To Tiki Outpost", Description="", Default=false})
    v516:OnChanged(function(v617) _G.AutoComeTiki = v617 end)
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeTiki then return end
        local v618 = v504.LocalPlayer
        local v619 = v618.Character
        if not v619 or not v619:FindFirstChild("Humanoid") then return end
        local v620 = v619.Humanoid
        local v621 = nil
        for _, v715 in pairs(v507.Boats:GetChildren()) do
            local v716 = v715:FindFirstChild("VehicleSeat")
            if v716 and v716.Occupant == v620 then v621 = v716 break end
        end
        if v621 then
            v621.MaxSpeed = v508
            local v776 = CFrame.new(-16217.7568359375, 446.9653686523437, 9.126761436462492)
            local v777 = v621.Position
            local v778 = v776.Position
            local v779 = (v778 - v777).Unit
            local v780 = v779 * v621.MaxSpeed * v505.RenderStepped:Wait()
            v621.CFrame = v621.CFrame + v780
            v621.CFrame = CFrame.new(v621.Position, v778)
            if (v621.Position - v778).magnitude < 120 then
                _G.AutoComeTiki = false
                v506:SendKeyEvent(false, "W", false, game)
            end
        end
    end)

    local v517 = Tabs["Sea"]:AddToggle("AutoComeHydra", {Title="Go Back To Hydra Island", Description="", Default=false})
    v517:OnChanged(function(v622) _G.AutoComeHydra = v622 end)
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeHydra then return end
        local v625 = v504.LocalPlayer.Character.Humanoid
        local v626 = nil
        for _, v718 in pairs(v507.Boats:GetChildren()) do
            local v719 = v718:FindFirstChild("VehicleSeat")
            if v719 and v719.Occupant == v625 then v626 = v719 break end
        end
        if v626 then
            v626.MaxSpeed = v508
            local v784 = CFrame.new(5193.9375, -0.04690289497375488, 161.578369140625)
            local v785 = v626.Position
            local v786 = v784.Position
            local v787 = (v786 - v785).Unit
            local v788 = v787 * v626.MaxSpeed * v505.RenderStepped:Wait()
            v626.CFrame = v626.CFrame + v788
            v626.CFrame = CFrame.new(v626.Position, v786)
            if (v626.Position - v786).magnitude < 120 then
                _G.AutoComeHydra = false
                v506:SendKeyEvent(false, "W", false, game)
            end
        end
    end)
end

Tabs["Sea"]:AddButton({Title="Travel to Hunting Zone", Description="", Callback=function()
    Tween2(CFrame.new(-16917.154296875, 7.757596015930176, 511.8203125))
end})

v518 = {"Beast Hunter","Sleigh","Miracle","The Sentinel","Guardian","Lantern","Dinghy","Piratesloop","PirateBrigade","PirateGrandBrigade","MarineGrandBrigade","MarineBrigade","MarineSloop"}
v519 = Tabs["Sea"]:AddDropdown("DropdownBoat", {Title="Select Boat", Description="", Values=v518, Multi=false, Default=1})
v519:OnChanged(function(v628) selectedBoat = v628 end)
v511b = {}
local function v520(v628)
    local v629 = {[1]="BuyBoat", [2]=v628}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v629))
    task.delay(2, function()
        for _, v792 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if v792:IsA("Model") and v792.Name == v628 then
                local v896 = v792:FindFirstChild("VehicleSeat")
                if v896 and not v896.Occupant then v511b[v628] = v896 end
            end
        end
    end)
end
local function v521()
    for _, v721 in pairs(v511b) do
        if v721 and v721.Parent and v721.Name == "VehicleSeat" and not v721.Occupant then Tween2(v721.CFrame) end
    end
end
game:GetService("RunService").RenderStepped:Connect(function()
    for v722, v723 in pairs(v511b) do
        if v723 and v723.Parent and v723.Name == "VehicleSeat" and not v723.Occupant then v511b[v722] = v723 end
    end
end)
Tabs["Sea"]:AddButton({Title="Buy Boat", Description="", Callback=function() v520(selectedBoat) end})
Tabs["Sea"]:AddButton({Title="Fly To My Boat", Description="", Callback=function() v521() end})

v522 = Tabs["Sea"]:AddToggle("ToggleTerrorshark", {Title="Attack Terrorshark", Description="", Default=false})
v522:OnChanged(function(v630) _G.AutoTerrorshark = v630 end)
spawn(function()
    while wait() do
        if _G.AutoTerrorshark then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                    for _, v1445 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1445.Name == "Terrorshark" then
                            if v1445:FindFirstChild("Humanoid") and v1445:FindFirstChild("HumanoidRootPart") and v1445.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1445.HumanoidRootPart.CanCollide = false
                                    v1445.Humanoid.WalkSpeed = 0
                                    v1445.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1445.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                until not _G.AutoTerrorshark or not v1445.Parent or v1445.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

v523 = Tabs["Sea"]:AddToggle("TogglePiranha", {Title="Attack Piranha", Description="", Default=false})
v523:OnChanged(function(v631) _G.farmpiranya = v631 end)
spawn(function()
    while wait() do
        if _G.farmpiranya then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                    for _, v1447 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1447.Name == "Piranha" then
                            if v1447:FindFirstChild("Humanoid") and v1447:FindFirstChild("HumanoidRootPart") and v1447.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1447.HumanoidRootPart.CanCollide = false
                                    v1447.Humanoid.WalkSpeed = 0
                                    v1447.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1447.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                until not _G.farmpiranya or not v1447.Parent or v1447.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

v524 = Tabs["Sea"]:AddToggle("ToggleShark", {Title="Attack Shark", Description="", Default=false})
v524:OnChanged(function(v632) _G.AutoShark = v632 end)
spawn(function()
    while wait() do
        if _G.AutoShark then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                    for _, v1449 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1449.Name == "Shark" then
                            if v1449:FindFirstChild("Humanoid") and v1449:FindFirstChild("HumanoidRootPart") and v1449.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1449.HumanoidRootPart.CanCollide = false
                                    v1449.Humanoid.WalkSpeed = 0
                                    v1449.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1449.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    end
                                until not _G.AutoShark or not v1449.Parent or v1449.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

v525 = Tabs["Sea"]:AddToggle("ToggleFishCrew", {Title="Attack Fish Crew", Description="", Default=false})
v525:OnChanged(function(v633) _G.AutoFishCrew = v633 end)
spawn(function()
    while wait() do
        if _G.AutoFishCrew then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    for _, v1451 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v1451.Name == "Fish Crew Member" then
                            if v1451:FindFirstChild("Humanoid") and v1451:FindFirstChild("HumanoidRootPart") and v1451.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v1451.HumanoidRootPart.CanCollide = false
                                    v1451.Humanoid.WalkSpeed = 0
                                    v1451.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v1451.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoFishCrew or not v1451.Parent or v1451.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)

v526 = Tabs["Sea"]:AddToggle("ToggleShip", {Title="Attack Ship", Description="", Default=false})
v526:OnChanged(function(v634) _G.Ship = v634 end)
function CheckPirateBoat()
    local v635 = {"PirateGrandBrigade","PirateBrigade"}
    for _, v725 in next, game:GetService("Workspace").Enemies:GetChildren() do
        if table.find(v635, v725.Name) and v725:FindFirstChild("Health") and v725.Health.Value > 0 then return v725 end
    end
end
spawn(function()
    while wait() do
        if _G.Ship then
            pcall(function()
                if CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait(0.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v1338 = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(Tween(v1338.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                        Skillaimbot = true
                        AutoSkill = false
                    until not v1338 or not v1338.Parent or v1338.Health.Value <= 0
                end
            end)
        end
    end
end)

v527 = Tabs["Sea"]:AddToggle("ToggleGhostShip", {Title="Attack Ghost Ship", Description="", Default=false})
v527:OnChanged(function(v636) _G.GhostShip = v636 end)
function CheckFishBoat()
    local v637 = {"FishBoat"}
    for _, v727 in next, game:GetService("Workspace").Enemies:GetChildren() do
        if table.find(v637, v727.Name) and v727:FindFirstChild("Health") and v727.Health.Value > 0 then return v727 end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.bjirFishBoat then
                if CheckFishBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v1339 = CheckFishBoat()
                    repeat
                        wait()
                        spawn(Tween(v1339.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    until v1339.Parent or v1339.Health.Value <= 0 or not CheckFishBoat()
                    AutoSkill = false
                    Skillaimbot = false
                end
            end
        end)
    end
end)

v56 = Tabs["Sea"]:AddSection("Leviathan")
Tabs["Sea"]:AddButton({Title="Buy Leviathan Chip", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
end})
v155 = Tabs["Sea"]:AddToggle("ToggleTPFrozenDimension", {Title="Fly To Frozen Dimension", Description="", Default=false})
v155:OnChanged(function(v385) _G.TweenToFrozenDimension = v385 end)
spawn(function()
    local v386
    while not v386 do
        v386 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
        wait()
    end
    while wait() do
        if _G.TweenToFrozenDimension then
            if v386 then Tween(v386.CFrame) end
        end
    end
end)

v156 = Tabs["Sea"]:AddSection("Draco")
v157 = Tabs["Sea"]:AddToggle("ToggleBlazeEmber", {Title="Auto Blaze Ember", Description="", Default=false})
v157:OnChanged(function(v387) _G.AutoBlazeEmber = v387 end)
spawn(function()
    while wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
            end)
        end
    end
end)
v158 = Tabs["Sea"]:AddToggle("ToggleReceiveQuest", {Title="Get Blaze Ember Quest", Description="", Default=false})
v158:OnChanged(function(v388)
    _G.AutoReceiveQuest = v388
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        spawn(function()
            pcall(function()
                while wait() do
                    local v874 = {[1]={Context="Check"}}
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v874))
                end
            end)
        end)
    end
end)
v159 = Tabs["Sea"]:AddParagraph({Title="Blaze Ember Quest Status", Content=""})
spawn(function()
    pcall(function()
        while wait() do
            local v654 = {[1]={Context="Check"}}
            local v655 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v654))
            if typeof(v655) == "table" then
                for _, v878 in pairs(v655) do
                    if v878 == "Defeat 3 Venomous Assailants on Hydra Island." then v159:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
                    elseif v878 == "Defeat 3 Hydra Enforcers on Hydra Island." then v159:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
                    elseif v878 == "Destroy 10 trees on Hydra Island." then v159:SetDesc("Destroy 10 trees on Hydra Island.") end
                end
            else
                print(v655)
            end
        end
    end)
end)
v160 = Tabs["Sea"]:AddToggle("ToggleHydraTree", {Title="Destroy trees at Hydra Island", Description="", Default=false})
v160:OnChanged(function(v389) _G.AutoHydraTree = v389 end)
local function v161(v390)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v390, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v390, false, game)
end
local function v162(v410)
    local v411 = game.Players.LocalPlayer
    local v412 = v411.Backpack
    for _, v567 in pairs(v412:GetChildren()) do
        if v567:IsA("Tool") and v567.ToolTip == v410 then
            v567.Parent = v411.Character
            for _, v819 in ipairs({"Z","X","C","V","F"}) do
                wait()
                pcall(function() v161(v819) end)
            end
            v567.Parent = v412
            break
        end
    end
end
v163 = {CFrame.new(528.61962890625, 1005.4000244140625, 392.43011474609375), CFrame.new(534.39453125, 1004.1998901367188, 361.0687561035156), CFrame.new(523.78564453125, 1004.1998901367188, 431.4530944824219), CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625), CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)}
spawn(function()
    while wait() do
        if _G.AutoHydraTree then
            AutoHaki()
            for _, v815 in ipairs(v163) do
                if not _G.AutoHydraTree then break end
                Tween2(v815)
                wait()
                local v816 = game.Players.LocalPlayer.Character
                if v816 and v816:FindFirstChild("HumanoidRootPart") then
                    local v902 = (v816.HumanoidRootPart.Position - v815.Position).Magnitude
                    if v902 <= 10 then
                        v162("Melee")
                        v162("Sword")
                        v162("Gun")
                    end
                end
            end
        end
    end
end)
Tabs["Sea"]:AddButton({Title="Craft Volcanic Magnet", Description="", Callback=function()
    local v395 = {[1]="CraftItem", [2]="Craft", [3]="Volcanic Magnet"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v395))
end})
v164 = Tabs["Sea"]:AddToggle("ToggleCollectFireFlowers", {Title="Collect Fire Flowers", Description="", Default=false})
v164:OnChanged(function(v396) _G.AutoCollectFireFlowers = v396 end)
spawn(function()
    while wait() do
        if _G.AutoCollectFireFlowers then
            local v747 = workspace:FindFirstChild("FireFlowers")
            if v747 then
                for _, v904 in pairs(v747:GetChildren()) do
                    if v904:IsA("Model") and v904.PrimaryPart then
                        local v1367 = v904.PrimaryPart.Position
                        local v1368 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local v1369 = (v1367 - v1368).Magnitude
                        if v1369 <= 10 then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                            wait(1.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                        else
                            Tween2(CFrame.new(v1367))
                        end
                    end
                end
            end
        end
    end
end)
v167 = Tabs["Sea"]:AddToggle("ToggleTrialTeleport", {Title="Fly To Trial Door", Description="", Default=false})
v167:OnChanged(function(v398) _G.AutoTrialTeleport = v398 end)
spawn(function()
    while wait() do
        if _G.AutoTrialTeleport then
            local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
            if v748 and v748:IsA("Part") then Tween2(CFrame.new(v748.Position)) end
        end
    end
end)
v168 = Tabs["Sea"]:AddSection("Prehistoric Island")
v169 = Tabs["Sea"]:AddParagraph({Title="Status", Content=""})
spawn(function()
    while task.wait() do
        pcall(function()
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then v169:SetDesc("Prehistoric Island: Đã tìm thấy")
            else v169:SetDesc("Prehistoric Island: Không có") end
        end)
    end
end)
v170 = Tabs["Sea"]:AddToggle("ToggleTPVolcano", {Title="Fly To Prehistoric Island", Description="", Default=false})
v170:OnChanged(function(v399) _G.TweenToPrehistoric = v399 end)
spawn(function()
    local v400
    while not v400 do
        v400 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if _G.TweenToPrehistoric then
            local v749 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if v749 then
                local v879 = v749:FindFirstChild("Core") and v749.Core:FindFirstChild("PrehistoricRelic")
                local v880 = v879 and v879:FindFirstChild("Skull")
                if v880 then
                    Tween2(CFrame.new(v880.Position))
                    _G.TweenToPrehistoric = false
                end
            end
        end
    end
end)
v171 = Tabs["Sea"]:AddToggle("ToggleDefendVolcano", {Title="Safe", Description="", Default=false})
v171:OnChanged(function(v401) _G.AutoDefendVolcano = v401 end)
v107 = Tabs["Sea"]:AddToggle("ToggleMelee", {Title="Use Melee", Description="", Default=false})
v107:OnChanged(function(v402) _G.UseMelee = v402 end)
v109 = Tabs["Sea"]:AddToggle("ToggleSword", {Title="Use Sword", Description="", Default=false})
v109:OnChanged(function(v403) _G.UseSword = v403 end)
v110 = Tabs["Sea"]:AddToggle("ToggleGun", {Title="Use Gun", Description="", Default=false})
v110:OnChanged(function(v404) _G.UseGun = v404 end)
local function v172(v405)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v405, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v405, false, game)
end
local function v173()
    local v406 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if v406 and v406:IsA("Model") then v406:Destroy() end
    local v407 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v407 then
        for _, v751 in pairs(v407:GetDescendants()) do
            if v751:IsA("Part") and v751.Name:lower():find("lava") then v751:Destroy() end
        end
    end
    local v408 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v408 then
        for _, v753 in pairs(v408:GetDescendants()) do
            if v753:IsA("Model") then
                for _, v906 in pairs(v753:GetDescendants()) do
                    if v906:IsA("MeshPart") and v906.Name:lower():find("lava") then v906:Destroy() end
                end
            end
        end
    end
end
local function v174()
    local v409 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    for _, v565 in pairs(v409:GetChildren()) do
        if v565:IsA("Model") then
            local v754 = v565:FindFirstChild("volcanorock")
            if v754 and v754:IsA("MeshPart") then return v754 end
        end
    end
    return nil
end
spawn(function()
    while wait() do
        if _G.AutoDefendVolcano then
            AutoHaki()
            pcall(v173)
            local v757 = v174()
            if v757 then
                local v882 = CFrame.new(v757.Position + Vector3.new(0, 0, 0))
                Tween2(v882)
                local v883 = v757.Color
                if v883 == Color3.fromRGB(185, 53, 56) or v883 == Color3.fromRGB(185, 53, 57) then
                    v757 = v174()
                else
                    local v1125 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local v1126 = ((v1125 - v757.Position) - Vector3.new(0, 0, 0)).Magnitude
                    if v1126 <= 10 then
                        if _G.UseMelee then v162("Melee") end
                        if _G.UseSword then v162("Sword") end
                        if _G.UseGun then v162("Gun") end
                    end
                end
            end
        end
    end
end)
v175 = Tabs["Sea"]:AddToggle("ToggleKillAura", {Title="Attack Golems Aura", Description="", Default=false})
v175:OnChanged(function(v413) KillAura = v413 end)
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                for _, v885 in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v885:FindFirstChild("Humanoid") and v885:FindFirstChild("HumanoidRootPart") and v885.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            v885.Humanoid.Health = 0
                            v885.HumanoidRootPart.CanCollide = false
                        until not KillAura or not v885.Parent or v885.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)
v176 = Tabs["Sea"]:AddToggle("ToggleCollectBone", {Title="Collect Bone", Description="", Default=false})
v176:OnChanged(function(v414) _G.AutoCollectBone = v414 end)
spawn(function()
    while wait() do
        if _G.AutoCollectBone then
            for _, v821 in pairs(workspace:GetDescendants()) do
                if v821:IsA("BasePart") and v821.Name == "DinoBone" then Tween2(CFrame.new(v821.Position)) end
            end
        end
    end
end)
v177 = Tabs["Sea"]:AddToggle("ToggleCollectEgg", {Title="Collect Egg", Description="", Default=false})
v177:OnChanged(function(v415) _G.AutoCollectEgg = v415 end)
spawn(function()
    while wait() do
        if _G.AutoCollectEgg then
            local v758 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if #v758 > 0 then
                local v886 = v758[math.random(1, #v758)]
                if v886:IsA("Model") and v886.PrimaryPart then
                    Tween2(v886.PrimaryPart.CFrame)
                    local v1127 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local v1128 = v886.PrimaryPart.Position
                    local v1129 = (v1127 - v1128).Magnitude
                    if v1129 <= 10 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)

-- ============================================================
-- TAB SETTING
-- ============================================================
v85 = Tabs["Setting"]:AddToggle("ToggleAutoT", {Title="Auto Turn On Race V3", Description="", Default=false})
v85:OnChanged(function(v273) _G.AutoT = v273 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoT then game:GetService("ReplicatedStorage").Remotes.CommF_:FireServer("ActivateAbility") end
        end)
    end
end)
v86 = Tabs["Setting"]:AddToggle("ToggleAutoY", {Title="Auto Turn On Race V4", Description="", Default=false})
v86:OnChanged(function(v274) _G.AutoY = v274 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoY then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
v87 = Tabs["Setting"]:AddToggle("ToggleAutoKen", {Title="Auto Ken", Description="", Default=false})
v87:OnChanged(function(v275) _G.AutoKen = v275 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKen then game:GetService("ReplicatedStorage").Remotes.CommF_:FireServer("Ken", true) end
        end)
    end
end)
v88 = Tabs["Setting"]:AddToggle("ToggleSaveSpawn", {Title="Auto Save Spawn Point", Description="", Default=false})
v88:OnChanged(function(v276)
    _G.SaveSpawn = v276
    if v276 then
        local v648 = {[1]="SetSpawnPoint"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v648))
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.SaveSpawn then
                local v797 = {[1]="SetSpawnPoint"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v797))
            end
        end)
    end
end)
v90 = Tabs["Setting"]:AddToggle("ToggleBringMob", {Title="Bring Mob", Description="", Default=true})
v90:OnChanged(function(v277) _G.BringMob = v277 end)
spawn(function()
    while wait() do
        if _G.BringMob and bringmob then
            for _, v734 in pairs(game.Workspace.Enemies:GetChildren()) do
                if v734.Name == MonFarm and v734:FindFirstChild("Humanoid") and v734.Humanoid.Health > 0 then
                    if v734.Name == "Factory Staff" then
                        if (v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                            v734.Head.CanCollide = false
                            v734.HumanoidRootPart.CanCollide = false
                            v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v734.HumanoidRootPart.CFrame = FarmPos
                            if v734.Humanoid:FindFirstChild("Animator") then v734.Humanoid.Animator:Destroy() end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif v734.Name == MonFarm then
                        if (v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                            v734.HumanoidRootPart.CFrame = FarmPos
                            v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v734.HumanoidRootPart.Transparency = 1
                            v734.Humanoid.JumpPower = 0
                            v734.Humanoid.WalkSpeed = 0
                            if v734.Humanoid:FindFirstChild("Animator") then v734.Humanoid.Animator:Destroy() end
                            v734.HumanoidRootPart.CanCollide = false
                            v734.Head.CanCollide = false
                            v734.Humanoid:ChangeState(11)
                            v734.Humanoid:ChangeState(14)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end
    end
end)
v91 = Tabs["Setting"]:AddToggle("ToggleRemoveNotify", {Title="Remove Notify", Description="", Default=false})
v91:OnChanged(function(v278) RemoveNotify = v278 end)
v92 = Tabs["Setting"]:AddToggle("ToggleWhite", {Title="White Screen", Description="", Default=false})
v92:OnChanged(function(v279)
    _G.WhiteScreen = v279
    if _G.WhiteScreen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif _G.WhiteScreen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)
v93 = Tabs["Setting"]:AddSection("Skill")
v94 = Tabs["Setting"]:AddToggle("ToggleZ", {Title="Z", Description="", Default=true})
v94:OnChanged(function(v280) SkillZ = v280 end)
v95 = Tabs["Setting"]:AddToggle("ToggleX", {Title="X", Description="", Default=true})
v95:OnChanged(function(v281) SkillX = v281 end)
v96 = Tabs["Setting"]:AddToggle("ToggleC", {Title="C", Description="", Default=true})
v96:OnChanged(function(v282) SkillC = v282 end)
v97 = Tabs["Setting"]:AddToggle("ToggleV", {Title="V", Description="", Default=true})
v97:OnChanged(function(v283) SkillV = v283 end)
v98 = Tabs["Setting"]:AddToggle("ToggleF", {Title="F", Description="", Default=true})
v98:OnChanged(function(v284) SkillF = v284 end)

-- ============================================================
-- TAB STATUS
-- ============================================================
v99 = Tabs["Status"]:AddParagraph({Title="Information", Content="Đang tải..."})
spawn(function()
    pcall(function()
        while wait() do
            local info = "Name: " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n"
            info = info .. "Level: " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n"
            info = info .. "Beli: " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n"
            info = info .. "Fragments: " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n"
            info = info .. "Wanted: " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value .. "\n"
            info = info .. "HP: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n"
            info = info .. "Race: " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n"
            info = info .. "Fruit: " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
            v99:SetDesc(info)
        end
    end)
end)
v100 = Tabs["Status"]:AddParagraph({Title="Time", Content=""})
spawn(function()
    while true do
        pcall(function()
            local v285 = os.date("*t")
            local v286 = v285.hour % 24
            local v287 = ((v286 < 12) and "AM") or "PM"
            local v288 = string.format("%02i:%02i:%02i %s", ((v286 - 1) % 12) + 1, v285.min, v285.sec, v287)
            local v289 = string.format("%02d/%02d/%04d", v285.day, v285.month, v285.year)
            v100:SetDesc(v289 .. "-" .. v288)
        end)
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
v102 = Tabs["Status"]:AddParagraph({Title="Server time", Content=""})
spawn(function()
    while wait() do
        pcall(function()
            local v297 = os.date("*t")
            v102:SetDesc(string.format("%02d Tieng- %02d Phut- %02d Giay", v297.hour, v297.min, v297.sec))
        end)
    end
end)
v104 = Tabs["Status"]:AddParagraph({Title="Frozen Dimension", Content=""})
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then v104:SetDesc("Đã tìm thấy")
            else v104:SetDesc("Không có") end
        end
    end)
end)
v105 = Tabs["Status"]:AddInput("Input", {Title="Server ID", Default="", Placeholder="", Numeric=false, Finished=false, Callback=function(v301) _G.Job = v301 end})
Tabs["Status"]:AddButton({Title="Join Server ID", Description="", Callback=function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.Job, game.Players.LocalPlayer)
end})
Tabs["Status"]:AddButton({Title="Copy Server ID", Description="", Callback=function()
    setclipboard(tostring(game.JobId))
end})
v106 = Tabs["Status"]:AddToggle("MyToggle", {Title="Spam Join Server ID", Default=false})
v106:OnChanged(function(v302)
    if v302 then
        spawn(function()
            while wait() do
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.Job, game.Players.LocalPlayer)
            end
        end)
    end
end)

-- ============================================================
-- TAB STATS
-- ============================================================
v107s = Tabs["Stats"]:AddToggle("ToggleMelee", {Title="Melee", Description="", Default=false})
v107s:OnChanged(function(v303) _G.Auto_Stats_Melee = v303 end)
v108s = Tabs["Stats"]:AddToggle("ToggleDe", {Title="Defense", Description="", Default=false})
v108s:OnChanged(function(v304) _G.Auto_Stats_Defense = v304 end)
v109s = Tabs["Stats"]:AddToggle("ToggleSword", {Title="Sword", Description="", Default=false})
v109s:OnChanged(function(v305) _G.Auto_Stats_Sword = v305 end)
v110s = Tabs["Stats"]:AddToggle("ToggleGun", {Title="Gun", Description="", Default=false})
v110s:OnChanged(function(v306) _G.Auto_Stats_Gun = v306 end)
v111s = Tabs["Stats"]:AddToggle("ToggleFruit", {Title="Fruit", Description="", Default=false})
v111s:OnChanged(function(v307) _G.Auto_Stats_Devil_Fruit = v307 end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            local v741 = {[1]="AddPoint", [2]="Melee", [3]=3}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v741))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            local v740 = {[1]="AddPoint", [2]="Defense", [3]=3}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v740))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            local v739 = {[1]="AddPoint", [2]="Sword", [3]=3}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v739))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            local v738 = {[1]="AddPoint", [2]="Gun", [3]=3}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v738))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            local v737 = {[1]="AddPoint", [2]="Demon Fruit", [3]=3}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v737))
        end
    end
end)

-- ============================================================
-- TAB PLAYER
-- ============================================================
v112 = {}
for _, v309 in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(v112, v309.Name)
end
v113 = Tabs["Player"]:AddDropdown("SelectedPly", {Title="Select Player", Description="", Values=v112, Multi=false, Default=1})
v113:OnChanged(function(v310) _G.SelectPly = v310 end)
Tabs["Player"]:AddButton({Title="Load", Description="", Callback=function()
    table.clear(v112)
    for _, v542 in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(v112, v542.Name)
    end
end})
v114 = Tabs["Player"]:AddToggle("ToggleTeleport", {Title="TP To Player", Description="", Default=false})
v114:OnChanged(function(v311)
    _G.TeleportPly = v311
    if v311 == false then
        wait()
        AutoHaki()
        Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
spawn(function()
    while wait() do
        if _G.TeleportPly then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)
v56p = Tabs["Player"]:AddSection("Other")
v115 = Tabs["Player"]:AddToggle("ToggleNoClip", {Title="Noclip", Description="", Default=true})
v115:OnChanged(function(v312) _G.Noclip = v312 end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Noclip then
                for _, v869 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v869:IsA("BasePart") then v869.CanCollide = false end
                end
            end
        end)
    end)
end)
v116 = Tabs["Player"]:AddToggle("ToggleWalkonWater", {Title="Walk On Water", Description="", Default=true})
v116:OnChanged(function(v313) _G.WalkonWater = v313 end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkonWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)
v117 = Tabs["Player"]:AddToggle("ToggleEnablePvp", {Title="Enable PVP", Description="", Default=false})
v117:OnChanged(function(v314) _G.EnabledPvP = v314 end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.EnabledPvP then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)

-- ============================================================
-- TAB TELEPORT
-- ============================================================
v118 = Tabs["Teleport"]:AddSection("Sea")
v119 = Tabs["Teleport"]:AddToggle("ToggleAutoSea2", {Title="Auto Sea 2", Description="", Default=false})
v119:OnChanged(function(v315) _G.Auto_Sea2 = v315 end)
v120 = Tabs["Teleport"]:AddToggle("ToggleAutoSea3", {Title="Auto Sea 3", Description="", Default=false})
v120:OnChanged(function(v316) _G.Auto_Sea3 = v316 end)
Tabs["Teleport"]:AddButton({Title="Sea 1", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end})
Tabs["Teleport"]:AddButton({Title="Sea 3", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end})
v56t = Tabs["Teleport"]:AddSection("Island")
IslandList = {}
if Sea1 then
    IslandList = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"}
elseif Sea2 then
    IslandList = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"}
elseif Sea3 then
    IslandList = {"Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost"}
end
v121 = Tabs["Teleport"]:AddDropdown("DropdownIsland", {Title="Select Island", Description="", Values=IslandList, Multi=false, Default=1})
v121:OnChanged(function(v317) _G.SelectIsland = v317 end)
Tabs["Teleport"]:AddButton({Title="Teleport To Island", Description="", Callback=function()
    if _G.SelectIsland == "WindMill" then Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
    elseif _G.SelectIsland == "Marine" then Tween2(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
    elseif _G.SelectIsland == "Middle Town" then Tween2(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
    elseif _G.SelectIsland == "Jungle" then Tween2(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
    elseif _G.SelectIsland == "Pirate Village" then Tween2(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
    elseif _G.SelectIsland == "Desert" then Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
    elseif _G.SelectIsland == "Snow Island" then Tween2(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
    elseif _G.SelectIsland == "MarineFord" then Tween2(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
    elseif _G.SelectIsland == "Colosseum" then Tween2(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
    elseif _G.SelectIsland == "Sky Island 1" then Tween2(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
    elseif _G.SelectIsland == "Sky Island 2" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    elseif _G.SelectIsland == "Sky Island 3" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    elseif _G.SelectIsland == "Prison" then Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
    elseif _G.SelectIsland == "Magma Village" then Tween2(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
    elseif _G.SelectIsland == "Under Water Island" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    elseif _G.SelectIsland == "Fountain City" then Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
    elseif _G.SelectIsland == "Shank Room" then Tween2(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
    elseif _G.SelectIsland == "Mob Island" then Tween2(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
    elseif _G.SelectIsland == "The Cafe" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875)) wait() Tween2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
    elseif _G.SelectIsland == "Frist Spot" then Tween2(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
    elseif _G.SelectIsland == "Dark Area" then Tween2(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
    elseif _G.SelectIsland == "Flamingo Mansion" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
    elseif _G.SelectIsland == "Flamingo Room" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
    elseif _G.SelectIsland == "Green Zone" then Tween2(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
    elseif _G.SelectIsland == "Factory" then Tween2(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
    elseif _G.SelectIsland == "Colossuim" then Tween2(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
    elseif _G.SelectIsland == "Zombie Island" then Tween2(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
    elseif _G.SelectIsland == "Two Snow Mountain" then Tween2(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
    elseif _G.SelectIsland == "Punk Hazard" then Tween2(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
    elseif _G.SelectIsland == "Cursed Ship" then Tween2(CFrame.new(923.21252441406, 126.9760055542, 32852.83203125))
    elseif _G.SelectIsland == "Ice Castle" then Tween2(CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375))
    elseif _G.SelectIsland == "Forgotten Island" then Tween2(CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063))
    elseif _G.SelectIsland == "Ussop Island" then Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
    elseif _G.SelectIsland == "Mini Sky Island" then Tween2(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
    elseif _G.SelectIsland == "Hydra Island" then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    elseif _G.SelectIsland == "Floating Turtle" then Tween2(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
    elseif _G.SelectIsland == "Haunted Castle" then Tween2(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
    elseif _G.SelectIsland == "Ice Cream Island" then Tween2(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
    elseif _G.SelectIsland == "Peanut Island" then Tween2(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
    elseif _G.SelectIsland == "Cake Island" then Tween2(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
    elseif _G.SelectIsland == "Cocoa Island" then Tween2(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
    elseif _G.SelectIsland == "Candy Island" then Tween2(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
    elseif _G.SelectIsland == "Tiki Outpost" then Tween2(CFrame.new(-16217.7568359375, 446.9653686523437, 9.126761436462492)) end
end})
Tabs["Teleport"]:AddButton({Title="Stop Teleport", Description="", Callback=function() CancelTween() end})

-- ============================================================
-- TAB VISUAL
-- ============================================================
Tabs["Visual"]:AddButton({Title="Fake", Description="", Callback=function()
    local v318 = game:GetService("Players").LocalPlayer
    local v319 = require(game:GetService("ReplicatedStorage").Notification)
    local v320 = v318:WaitForChild("Data")
    local v321 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
    local v322 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
    local v323 = require(game:GetService("ReplicatedStorage").Util.Sound)
    local v324 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
    v319.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
    v319.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/> (+None)"):Display()
    v319.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display()
    v318.Data.Exp.Value = 999999999999
    v318.Data.Beli.Value = v318.Data.Beli.Value + 999999999999
    local delay = 0
    local count = 0
    while (v318.Data.Exp.Value - v321(v320.Level.Value)) > 0 do
        v318.Data.Exp.Value = v318.Data.Exp.Value - v321(v320.Level.Value)
        v318.Data.Level.Value = v318.Data.Level.Value + 1
        v318.Data.Points.Value = v318.Data.Points.Value + 3
        v322({v318})
        v323.Play(v323, v324.Value)
        v319.new("<Color=Green>LEVEL UP!<Color=/> (" .. v318.Data.Level.Value .. ")"):Display()
        count = count + 1
        if count >= 5 then break end
    end
end})
Tabs["Visual"]:AddInput("Input_Level", {Title="Level", Default="", Placeholder="...", Numeric=false, Finished=false, Callback=function(v327) game:GetService("Players")["LocalPlayer"].Data.Level.Value = tonumber(v327) end})
Tabs["Visual"]:AddInput("Input_EXP", {Title="EXP", Default="", Placeholder="...", Numeric=false, Finished=false, Callback=function(v329) game:GetService("Players")["LocalPlayer"].Data.Exp.Value = tonumber(v329) end})
Tabs["Visual"]:AddInput("Input_Beli", {Title="Beli", Default="", Placeholder="...", Numeric=false, Finished=false, Callback=function(v331) game:GetService("Players")["LocalPlayer"].Data.Beli.Value = tonumber(v331) end})
Tabs["Visual"]:AddInput("Input_Fragments", {Title="Fragments", Default="", Placeholder="...", Numeric=false, Finished=false, Callback=function(v333) game:GetService("Players")["LocalPlayer"].Data.Fragments.Value = tonumber(v333) end})

-- ============================================================
-- TAB FRUIT
-- ============================================================
v122 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")
Table_DevilFruitSniper = {}
ShopDevilSell = {}
for _, v336 in next, v122 do
    table.insert(Table_DevilFruitSniper, v336.Name)
    if v336.OnSale then table.insert(ShopDevilSell, v336.Name) end
end
v123 = Tabs["Fruit"]:AddDropdown("DropdownFruit", {Title="Select Fruit", Description="", Values=Table_DevilFruitSniper, Multi=false, Default=1})
v123:OnChanged(function(v337) _G.SelectFruit = v337 end)
v111f = Tabs["Fruit"]:AddToggle("ToggleFruit", {Title="Buy", Description="", Default=false})
v111f:OnChanged(function(v338)
    if v338 then
        _G.AutoBuyFruitSniper = true
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false)
        end)
        _G.AutoBuyFruitSniper = false
    end
end)
v124 = Tabs["Fruit"]:AddDropdown("DropdownPermanentFruit", {Title="Select Permanent Fruit", Description="", Values=Table_DevilFruitSniper, Multi=false, Default=1})
v124:OnChanged(function(v339) _G.PermanentFruit = v339 end)
v125 = Tabs["Fruit"]:AddToggle("TogglePermanentFruit", {Title="Use Permanent Fruit", Description="", Default=false})
v125:OnChanged(function(v340)
    if v340 then
        _G.AutoSwitchPermanentFruit = true
        pcall(function()
            local v742 = {[1]="SwitchFruit", [2]=_G.PermanentFruit}
        end)
    end
end)
v126 = Tabs["Fruit"]:AddToggle("ToggleStore", {Title="Store Fruit", Description="", Default=false})
v126:OnChanged(function(v341) _G.AutoStoreFruit = v341 end)
v127 = Tabs["Fruit"]:AddToggle("ToggleRandomFruit", {Title="Random Fruit", Description="", Default=false})
v127:OnChanged(function(v342) _G.Random_Auto = v342 end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.Random_Auto then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") end
        end
    end)
end)
v128 = Tabs["Fruit"]:AddToggle("ToggleCollectTP", {Title="Get Fruit (TP)", Description="Risk", Default=false})
v128:OnChanged(function(v343) _G.CollectFruitTP = v343 end)
spawn(function()
    while wait() do
        if _G.CollectFruitTP then
            for _, v802 in pairs(game.Workspace:GetChildren()) do
                if string.find(v802.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v802.Handle.CFrame
                end
            end
        end
    end
end)
v56f = Tabs["Fruit"]:AddSection("Esp")
v130 = Tabs["Fruit"]:AddToggle("ToggleEspPlayer", {Title="Player", Description="", Default=false})
v130:OnChanged(function(v345) ESPPlayer = v345 UpdatePlayerChams() end)
v131 = Tabs["Fruit"]:AddToggle("ToggleEspFruit", {Title="Fruit", Description="", Default=false})
v131:OnChanged(function(v346) DevilFruitESP = v346 while DevilFruitESP do wait() UpdateDevilChams() end end)
v132 = Tabs["Fruit"]:AddToggle("ToggleEspIsland", {Title="Island", Description="", Default=false})
v132:OnChanged(function(v347) IslandESP = v347 while IslandESP do wait() UpdateIslandESP() end end)
v133 = Tabs["Fruit"]:AddToggle("ToggleEspFlower", {Title="Flower", Description="", Default=false})
v133:OnChanged(function(v348) FlowerESP = v348 while FlowerESP do wait() UpdateFlowerChams() end end)
v134 = Tabs["Fruit"]:AddToggle("ToggleEspRealFruit", {Title="Real Fruit", Description="", Default=false})
v134:OnChanged(function(v349) RealFruitEsp = v349 while RealFruitEsp do wait() UpdateRealFruitChams() end end)
v135 = Tabs["Fruit"]:AddToggle("ToggleIslandMirageEsp", {Title="Mirage Island", Description="", Default=false})
v135:OnChanged(function(v350) IslandMirageEsp = v350 while IslandMirageEsp do wait() UpdateIslandMirageESP() end end)

-- ============================================================
-- TAB RAID
-- ============================================================
v136 = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}
v137 = Tabs["Raid"]:AddDropdown("DropdownRaid", {Title="Select Chip", Description="", Values=v136, Multi=false, Default=1})
v137:OnChanged(function(v353) SelectChip = v353 end)
v138 = Tabs["Raid"]:AddToggle("ToggleBuy", {Title="Buy Chip", Description="", Default=false})
v138:OnChanged(function(v354) _G.Auto_Buy_Chips_Dungeon = v354 end)
spawn(function()
    while wait() do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v805 = {[1]="RaidsNpc", [2]="Select", [3]=SelectChip}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v805))
            end)
        end
    end
end)
v139 = Tabs["Raid"]:AddToggle("ToggleStart", {Title="Auto Start Raid", Description="", Default=false})
v139:OnChanged(function(v355) _G.Auto_StartRaid = v355 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_StartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
                        if Sea2 then
                            Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                            local v1547 = {[1]="SetSpawnPoint"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1547))
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif Sea3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
                            Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127))
                            local v1656 = {[1]="SetSpawnPoint"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1656))
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)
v140 = Tabs["Raid"]:AddToggle("ToggleNextIsland", {Title="Auto Next Island", Description="", Default=false})
v140:OnChanged(function(v356)
    AutoNextIsland = v356
    if not v356 then _G.AutoNear = false end
end)
spawn(function()
    local v357 = {}
    while task.wait() do
        if AutoNextIsland then
            pcall(function()
                local v806 = game.Players.LocalPlayer.Character
                if v806 and v806:FindFirstChild("HumanoidRootPart") then
                    local v900 = game:GetService("Workspace")["_WorldOrigin"].Locations
                    local v901 = v806.HumanoidRootPart.Position
                    if (v901 - Vector3.new(-6438.73535, 250.645355, -4501.50684)).Magnitude < 1 or (v901 - Vector3.new(-5017.40869, 314.844055, -2823.0127)).Magnitude < 1 then v357 = {} end
                    if v900:FindFirstChild("Island 1") then _G.AutoNear = true end
                    if v900:FindFirstChild("Island 2") and not v357["Island 2"] then
                        Tween(v900:FindFirstChild("Island 2").CFrame)
                        v357["Island 2"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v900:FindFirstChild("Island 3") and not v357["Island 3"] then
                        Tween(v900:FindFirstChild("Island 3").CFrame)
                        v357["Island 3"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v900:FindFirstChild("Island 4") and not v357["Island 4"] then
                        Tween(v900:FindFirstChild("Island 4").CFrame)
                        v357["Island 4"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v900:FindFirstChild("Island 5") and not v357["Island 5"] then
                        Tween(v900:FindFirstChild("Island 5").CFrame)
                        v357["Island 5"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    end
                end
            end)
        end
    end
end)
v141 = Tabs["Raid"]:AddToggle("ToggleAwake", {Title="Auto Awakening Fruit", Description="", Default=false})
v141:OnChanged(function(v358) AutoAwakenAbilities = v358 end)
spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
        end
    end
end)
v142 = Tabs["Raid"]:AddToggle("ToggleGetFruit", {Title="Give Up Normal Fruit -> Raid Chip", Description="", Default=false})
v142:OnChanged(function(v359) _G.Autofruit = v359 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Autofruit then
                local v807 = {[1]="LoadFruit", [2]="Rocket-Rocket"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807))
                local v808 = {[1]="LoadFruit", [2]="Spin-Spin"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v808))
                local v809 = {[1]="LoadFruit", [2]="Chop-Chop"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v809))
                local v810 = {[1]="LoadFruit", [2]="Spring-Spring"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v810))
                local v811 = {[1]="LoadFruit", [2]="Bomb-Bomb"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v811))
                local v812 = {[1]="LoadFruit", [2]="Smoke-Smoke"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v812))
                local v813 = {[1]="LoadFruit", [2]="Spike-Spike"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v813))
                local v814 = {[1]="LoadFruit", [2]="Flame-Flame"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v814))
                local v815 = {[1]="LoadFruit", [2]="Falcon-Falcon"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v815))
                local v816 = {[1]="LoadFruit", [2]="Ice-Ice"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v816))
                local v817 = {[1]="LoadFruit", [2]="Sand-Sand"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v817))
                local v818 = {[1]="LoadFruit", [2]="Dark-Dark"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v818))
                local v819 = {[1]="LoadFruit", [2]="Ghost-Ghost"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v819))
                local v820 = {[1]="LoadFruit", [2]="Diamond-Diamond"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v820))
                local v821 = {[1]="LoadFruit", [2]="Light-Light"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v821))
                local v822 = {[1]="LoadFruit", [2]="Rubber-Rubber"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v822))
                local v823 = {[1]="LoadFruit", [2]="Barrier-Barrier"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v823))
            end
        end)
    end
end)
if Sea2 then
    Tabs["Raid"]:AddButton({Title="Fly To The Raid Room", Description="", Callback=function() Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684)) end})
elseif Sea3 then
    Tabs["Raid"]:AddButton({Title="Fly To The Raid Room", Description="", Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
        Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127))
    end})
end
v56r = Tabs["Raid"]:AddSection("Law")
v143 = Tabs["Raid"]:AddToggle("ToggleLaw", {Title="Auto Raid Law (Fully)", Description="", Default=false})
v143:OnChanged(function(v360) Auto_Law = v360 end)
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                    end
                end
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for _, v1469 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v1469.Name == "Order" then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v1469.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    v1469.HumanoidRootPart.CanCollide = false
                                    v1469.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                until not v1469.Parent or v1469.Humanoid.Health <= 0 or Auto_Law == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)

-- ============================================================
-- TAB RACE
-- ============================================================
Tabs["Race"]:AddButton({Title="Temple Of Time", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
end})
Tabs["Race"]:AddButton({Title="Auto Pull Lever", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
end})
Tabs["Race"]:AddButton({Title="TP Buy Gear NPC", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
end})
v56rc = Tabs["Race"]:AddSection("Race")
Tabs["Race"]:AddButton({Title="Race Door", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then Tween2(CFrame.new(29010.62109375, 14890.9755859375, -205.99114990234375)) end
end})
v144 = Tabs["Race"]:AddToggle("ToggleHumanandghoul", {Title="Overcome Challenges [Human/Ghoul]", Description="", Default=false})
v144:OnChanged(function(v361) KillAura = v361 end)
v145 = Tabs["Race"]:AddToggle("ToggleAutotrial", {Title="Overcome Challenges", Description="", Default=false})
v145:OnChanged(function(v362) _G.AutoQuestRace = v362 end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    for _, v1124 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v1124:FindFirstChild("Humanoid") and v1124:FindFirstChild("HumanoidRootPart") and v1124.Humanoid.Health > 0 then
                            pcall(function()
                                repeat
                                    wait()
                                    v1124.Humanoid.Health = 0
                                    v1124.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v1124.Parent or v1124.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    for _, v1471 in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if v1471.Name == "snowisland_cylinder_081" then BTPZ(v1471.CFrame * CFrame.new(0, 0, 0)) end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    for _, v1747 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v1747:IsA("Tool") then
                            if v1747.ToolTip == "Melee" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1747) end
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    for _, v1749 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v1749:IsA("Tool") then
                            if v1749.ToolTip == "Blox Fruit" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1749) end
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    for _, v1752 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v1752:IsA("Tool") then
                            if v1752.ToolTip == "Sword" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1752) end
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait()
                    for _, v1754 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v1754:IsA("Tool") then
                            if v1754.ToolTip == "Gun" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1754) end
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    Tween(CFrame.new(28654, 14898.7832, 39))
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    for _, v1765 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v1765:FindFirstChild("Humanoid") and v1765:FindFirstChild("HumanoidRootPart") and v1765.Humanoid.Health > 0 then
                            pcall(function()
                                repeat
                                    wait()
                                    v1765.Humanoid.Health = 0
                                    v1765.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v1765.Parent or v1765.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    for _, v1791 in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v1791.Name == "Startpoint" then Tween(v1791.CFrame * CFrame.new(0, 0, 0)) end
                    end
                end
            end
        end
    end)
end)
v146 = Tabs["Race"]:AddToggle("ToggleKillTrial", {Title="Kill Trial", Description="", Default=false})
v146:OnChanged(function(v363) _G.AutoKillTrial = v363 end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillTrial then
                for _, v871 in pairs(game:GetService("Players"):GetChildren()) do
                    if v871.Name ~= game.Players.LocalPlayer.Name and v871.Character and v871.Character:FindFirstChild("HumanoidRootPart") and v871.Character:FindFirstChild("Humanoid") and v871.Character.Humanoid.Health > 0 then
                        repeat
                            Tween(v871.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                            v871.Character.HumanoidRootPart.CanCollide = false
                            v871.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            AttackNoCoolDown()
                        until not _G.AutoKillTrial or not v871.Parent or v871.Character.Humanoid.Health <= 0
                    end
                end
            end
        end)
    end
end)
v56r2 = Tabs["Race"]:AddSection("")
v147 = Tabs["Race"]:AddToggle("ToggleFarmRace", {Title="Farm Race", Description="", Default=false})
v148 = false
v147:OnChanged(function(v364) v148 = v364 end)
spawn(function()
    while wait() do
        if v148 then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                        _G.AutoBoneNoQuest = false
                        Tween(CFrame.new(-9698.4736328125, 445.09442138671875, 6545.8525390625))
                    elseif game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                        _G.AutoBoneNoQuest = true
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                        wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                    end
                end
            end)
        else
            _G.AutoBoneNoQuest = false
        end
    end
end)
v149 = Tabs["Race"]:AddToggle("ToggleUpgrade", {Title="Auto Upgrade Race", Description="", Default=false})
v149:OnChanged(function(v365)
    _G.AutoUpgrade = v365
    if _G.AutoUpgrade then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy") end
end)

-- ============================================================
-- TAB SHOP
-- ============================================================
v56s = Tabs["Shop"]:AddSection("Haki")
Tabs["Shop"]:AddButton({Title="Geppo", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo") end})
Tabs["Shop"]:AddButton({Title="Buso", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso") end})
Tabs["Shop"]:AddButton({Title="Soru", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru") end})
Tabs["Shop"]:AddButton({Title="Ken", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy") end})
v56s2 = Tabs["Shop"]:AddSection("Kiếm")
Tabs["Shop"]:AddButton({Title="Cutlass", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass") end})
Tabs["Shop"]:AddButton({Title="Katana", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana") end})
Tabs["Shop"]:AddButton({Title="Iron Mace", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace") end})
Tabs["Shop"]:AddButton({Title="Duel Katana", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana") end})
Tabs["Shop"]:AddButton({Title="Triple Katana", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana") end})
Tabs["Shop"]:AddButton({Title="Pipe", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe") end})
Tabs["Shop"]:AddButton({Title="Dual-Headed Blade", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade") end})
Tabs["Shop"]:AddButton({Title="Bisento", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento") end})
Tabs["Shop"]:AddButton({Title="Soul Cane", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane") end})
v56s3 = Tabs["Shop"]:AddSection("Võ")
Tabs["Shop"]:AddButton({Title="Black Leg", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg") end})
Tabs["Shop"]:AddButton({Title="Electro", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro") end})
Tabs["Shop"]:AddButton({Title="Fishman Karate", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate") end})
Tabs["Shop"]:AddButton({Title="Dragon Claw", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
end})
Tabs["Shop"]:AddButton({Title="Superhuman", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") end})
Tabs["Shop"]:AddButton({Title="Death Step", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") end})
Tabs["Shop"]:AddButton({Title="Sharkman Karate", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end})
Tabs["Shop"]:AddButton({Title="Electric Claw", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw") end})
Tabs["Shop"]:AddButton({Title="Dragon Talon", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon") end})
Tabs["Shop"]:AddButton({Title="Godhuman", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") end})
Tabs["Shop"]:AddButton({Title="Sanguine Art", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt") end})
v56s4 = Tabs["Shop"]:AddSection("Other")
Tabs["Shop"]:AddButton({Title="Reset Stats", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
end})
Tabs["Shop"]:AddButton({Title="Reroll Race", Description="", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
end})
Tabs["Shop"]:AddButton({Title="Change To Ghoul Race", Description="", Callback=function()
    local v366 = {[1]="Ectoplasm", [2]="Change", [3]=4}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v366))
end})
Tabs["Shop"]:AddButton({Title="Change To Cyborg Race", Description="", Callback=function()
    local v367 = {[1]="CyborgTrainer", [2]="Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v367))
end})
Tabs["Shop"]:AddButton({Title="Change to Draco", Description="Sea 3 Only", Callback=function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
end})

-- ============================================================
-- TAB MISC
-- ============================================================
Tabs["Misc"]:AddButton({Title="Rejoin", Description="", Callback=function() game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) end})
Tabs["Misc"]:AddButton({Title="Hop Server", Description="", Callback=function() Hop() end})
v56m = Tabs["Misc"]:AddSection("Team")
Tabs["Misc"]:AddButton({Title="Pirates", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end})
Tabs["Misc"]:AddButton({Title="Marines", Description="", Callback=function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines") end})
v56m2 = Tabs["Misc"]:AddSection("Code")
v150 = {"KITT_RESET","Sub2UncleKizaru","SUB2GAMERROBOT_RESET1","Sub2Fer999","Enyu_is_Pro","JCWK","StarcodeHEO","MagicBus","KittGaming","Sub2CaptainMaui","Sub2OfficialNoobie","Bluxxy","SUB2GAMERROBOT_EXP1","Chandler","NOMOREHACK","BANEXPLOIT","WildDares","BossBuild","GetPranked","EARN_FRUITS","FIGHT4FRUIT","NOEXPLOITER","NOOB2ADMIN","CODESLIDE","ADMINHACKED","ADMINDARES","fruitconcepts","krazydares","TRIPLEABUSE","SEATROLLING","24NOADMIN","REWARDFUN","NEWTROLL","fudd10_v2","Fudd10","Bignews","SECRET_ADMIN"}
Tabs["Misc"]:AddButton({Title="Redeem All Code", Description="", Callback=function() for _, v560 in ipairs(v150) do RedeemCode(v560) end end})
function RedeemCode(v377) game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v377) end
v56m3 = Tabs["Misc"]:AddSection("Titles")
Tabs["Misc"]:AddButton({Title="Titles", Description="", Callback=function()
    local v378 = {[1]="getTitles"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v378))
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end})
v56m4 = Tabs["Misc"]:AddSection("Misc")
v151 = Tabs["Misc"]:AddToggle("ToggleRejoin", {Title="Rejoin", Description="", Default=true})
v151:OnChanged(function(v381) _G.AutoRejoin = v381 end)
spawn(function()
    while wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v808)
                if v808.Name == "ErrorPrompt" and v808:FindFirstChild("MessageArea") and v808.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
v56m5 = Tabs["Misc"]:AddSection("Fog")
local function v152()
    local v382 = game:GetService("Lighting")
    if v382:FindFirstChild("BaseAtmosphere") then v382.BaseAtmosphere:Destroy() end
    if v382:FindFirstChild("SeaTerrorCC") then v382.SeaTerrorCC:Destroy() end
    if v382:FindFirstChild("LightingLayers") then
        if v382.LightingLayers:FindFirstChild("Atmosphere") then v382.LightingLayers.Atmosphere:Destroy() end
        wait()
        if v382.LightingLayers:FindFirstChild("DarkFog") then v382.LightingLayers.DarkFog:Destroy() end
    end
    v382.FogEnd = 100000
end
Tabs["Misc"]:AddButton({Title="Thức Tỉnh", Description="", Callback=function() v152() end})
v153 = Tabs["Misc"]:AddToggle("ToggleAntiBand", {Title="Anti Band", Description="", Default=false})
v153:OnChanged(function(v384) _G.AntiBand = v384 end)
v154 = {17884881, 120173604, 912348}
spawn(function()
    while wait() do
        if _G.AntiBand then
            for _, v810 in pairs(game:GetService("Players"):GetPlayers()) do
                if table.find(v154, v810.UserId) then Hop() end
            end
        end
    end
end)

-- ============================================================
-- UPDATE ALL ESP
-- ============================================================
spawn(function()
    while wait() do
        if IslandESP then UpdateIslandESP() end
        if ESPPlayer then UpdatePlayerChams() end
        if ChestESP then UpdateChestChams() end
        if DevilFruitESP then UpdateDevilChams() end
        if FlowerESP then UpdateFlowerChams() end
        if RealFruitESP then UpdateRealFruitChams() end
        if MirageIslandESP then UpdateIslandMirageESP() end
        if KitsuneIslandEsp then UpdateIslandKisuneESP() end
        if AuraESP then UpdateAuraESP() end
        if LSDESP then UpdateLSDESP() end
        if GearESP then UpdateGeaESP() end
    end
end)

-- ============================================================
-- METATABLE HOOK
-- ============================================================
spawn(function()
    local v218 = getrawmetatable(game)
    local v219 = v218.__namecall
    setreadonly(v218, false)
    v218.__namecall = newclosure(function(...)
        local v465 = getnamecallmethod()
        local v466 = {...}
        if tostring(v465) == "FireServer" then
            if tostring(v466[1]) == "RemoteEvent" then
                if tostring(v466[2]) == "true" and tostring(v466[2]) == "false" then
                    if _G.UseSkill then
                        if type(v466[2]) == "vector" then
                            v466[2] = PositionSkillMasteryDevilFruit
                        else
                            v466[2] = CFrame.new(PositionSkillMasteryDevilFruit)
                        end
                        return v219(unpack(v466))
                    end
                end
            end
        end
        return v219(...)
    end)
end)

-- ============================================================
-- BODY CLIP
-- ============================================================
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoEvoRace or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.Tweenfruit or _G.AutoFishCrew or _G.Auto_Saber or _G.AutoShark or _G.Auto_Warden or _G.Auto_RainbowHaki or AutoFarmRace or _G.AutoQuestRace or Auto_Law or AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmipranya or _G.Auto_MusketeerHat or _G.Auto_ObservationV2 or _G.AutoNear or _G.Auto_PoleV1 or _G.Auto_Buddy or _G.Ectoplasm or AutoEvoRace or AutoBartilo or _G.Auto_Canvander or _G.AutoLevel or _G.Auto_DualKatana or Auto_Quest_Yama_3 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.clip2 or _G.Auto_Regoku or _G.AutoBone or _G.AutoBoneNoQuest or _G.AutoBoss or AutoFarmMasDevilFruit or AutoHallowSycthe or AutoTushita or _G.CakePrince or _G.Auto_SkullGuitar or _G.AutoFarmSwan or _G.DoughKing or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or AutoFarmRaceQuest or _G.Factory or _G.Auto_Saw or _G.AutoFrozenDimension or _G.AutoKillTrial or _G.AutoUpgrade or _G.TweenToFrozenDimension then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v887 = Instance.new("BodyVelocity")
                    v887.Name = "BodyClip"
                    v887.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

-- ============================================================
-- NOCLIP STEPPED
-- ============================================================
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoEvoRace or _G.Auto_RainbowHaki or _G.Auto_SkullGuitar or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Tweenfruit or _G.Auto_Saber or _G.Auto_PoleV1 or _G.Auto_MusketeerHat or _G.AutoFishCrew or _G.AutoShark or AutoFarmRace or _G.AutoQuestRace or _G.Auto_Warden or Auto_Law or _G.Auto_DualKatana or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoTushita or _G.AutoHolyTorch or _G.Auto_Buddy or _G.AutoTerrorshark or _G.farmpiracy or Auto_Quest_Yama_3 or _G.Auto_ObservationV2 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or _G.AutoNear or _G.Ectoplasm or AutoEvoRace or _G.AutoKillTrial or AutoBartilo or _G.Auto_Regoku or _G.AutoLevel or _G.clip2 or _G.AutoBone or _G.Auto_Canvander or _G.AutoBoneNoQuest or _G.AutoBoss or _G.Auto_Saw or AutoFarmMasDevilFruit or AutoHallowSycthe or AutoTushita or _G.CakePrince or _G.DoughKing or _G.AutoFarmSwan or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or _G.Factory or _G.AutoFrozenDimension or AutoFarmRaceQuest or _G.AutoUpgrade or _G.TweenToFrozenDimension then
                for _, v835 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v835:IsA("BasePart") then v835.CanCollide = false end
                end
            end
        end)
    end)
end)

task.wait(1)
Fluent:Notify({Title="Banana Cat Hub", Content="Downloaded Banana Hub by TUNGLINHDEV.", Duration=10})