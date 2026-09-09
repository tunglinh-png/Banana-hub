-- ==============================================================
--  BANANA CAT HUB ULTIMATE v6 - BLOX FRUITS
--  FULL FEATURES + KAITUN COMPATIBLE + QUEST SYSTEM
--  Fluent UI | All-in-One | Delta Mobile Safe
--  by Vxeze Hub AI
-- ==============================================================

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInput = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")
local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local function SC(fn)
    local ok, err = pcall(fn)
    if not ok then warn("[BCH] " .. tostring(err)) end
    return ok
end

-- ====== COLORS ======
local F = {
    Bg=Color3.fromRGB(32,32,32), Card=Color3.fromRGB(44,44,44),
    Hover=Color3.fromRGB(56,56,56), Surface=Color3.fromRGB(50,50,50),
    Text1=Color3.fromRGB(255,255,255), Text2=Color3.fromRGB(185,185,185),
    Text3=Color3.fromRGB(125,125,125),
    Accent=Color3.fromRGB(241,196,15), AccH=Color3.fromRGB(255,215,50),
    AccDim=Color3.fromRGB(180,140,10),
    Ok=Color3.fromRGB(107,201,119), Bad=Color3.fromRGB(232,82,74),
    Warn=Color3.fromRGB(255,196,0), Info=Color3.fromRGB(80,180,255),
    Brd=Color3.fromRGB(64,64,64), Track=Color3.fromRGB(59,59,59),
    TogOff=Color3.fromRGB(75,75,75),
}
local BANANA = Color3.fromRGB(241,196,15)
local BANANA_DARK = Color3.fromRGB(200,155,0)

-- ====== SETTINGS ======
local S = {
    -- Player
    Speed=0, Jump=0, Fly=false, Noclip=false, God=false,
    InfiniteJump=false, AntiAFK=true,
    -- Combat
    Aimbot=false, AutoAttack=false, AutoSkill=false,
    SpamM1=false, HitboxExpand=false, AutoBuso=false,
    AutoKen=false, AutoRaceV3=false, AutoRaceV4=false,
    -- Visual
    ESP=false, Fullbright=false, NoFog=false, FPSBoost=false,
    ESPBox=true, ESPName=true, ESPHealth=true, ESPDist=true,
    -- Farm
    AutoLevel=false, AutoQuest=false, AutoBoss=false,
    AutoMob=false, AutoChest=false, AutoSea=false,
    AutoRaid=false, AutoDungeon=false, AutoFruit=false,
    AutoMaterial=false, AutoMastery=false, AutoStats=false,
    AutoBring=false, AutoHop=false,
    -- Quest System
    QuestSystem=false, AutoTakeQuest=false, AutoCompleteQuest=false,
    AutoFarmQuest=false, QuestMob="", QuestName="", QuestID=0,
    -- Misc
    ServerHop=false, TeleportIsland=false, AutoBuy=false,
    AutoRedeem=false, AutoStoreFruit=false,
    -- Settings
    SelectedBoss="", SelectedIsland="", SelectedMaterial="",
    FarmRange=200, AttackRange=150, TweenSpeed=300,
    StatPriority="Melee", AutoBuyChip=false,
}

-- ====== STATE ======
local flying = false
local bv, bg = nil, nil
local espObjs = {}
local connections = {}
local aimCircle = nil
local farmActive = false
local raidActive = false
local farmLoop = nil
local questCache = {}
local TableMobSpawn = {}

-- ====== NOTIFICATIONS ======
local nFrame = nil
local function mkN()
    local sg2 = Instance.new("ScreenGui")
    sg2.Name="BCHN"; sg2.ResetOnSpawn=false
    sg2.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    SC(function() sg2.Parent=game:GetService("CoreGui") end)
    if not sg2.Parent then sg2.Parent=LP:WaitForChild("PlayerGui") end
    nFrame=Instance.new("Frame")
    nFrame.Size=UDim2.new(0,280,0,320)
    nFrame.Position=UDim2.new(1,-290,1,-330)
    nFrame.BackgroundTransparency=1; nFrame.Parent=sg2
    local ly=Instance.new("UIListLayout")
    ly.SortOrder=Enum.SortOrder.LayoutOrder
    ly.Padding=UDim.new(0,6)
    ly.VerticalAlignment=Enum.VerticalAlignment.Bottom
    ly.Parent=nFrame
end

local function notify(t,txt,col)
    if not nFrame then SC(mkN) end
    if not nFrame then return end
    local bg2=Instance.new("Frame")
    bg2.Size=UDim2.new(1,0,0,52)
    bg2.BackgroundColor3=F.Card; bg2.BackgroundTransparency=0.05
    bg2.BorderSizePixel=0; bg2.Parent=nFrame
    Instance.new("UICorner",bg2).CornerRadius=UDim.new(0,6)
    local st=Instance.new("UIStroke")
    st.Color=F.Brd; st.Thickness=1; st.Transparency=0.5; st.Parent=bg2
    local bar=Instance.new("Frame")
    bar.Size=UDim2.new(0,3,0.5,0)
    bar.Position=UDim2.new(0,10,0.25,0)
    bar.BackgroundColor3=col or BANANA; bar.BorderSizePixel=0; bar.Parent=bg2
    Instance.new("UICorner",bar).CornerRadius=UDim.new(0,2)
    local tl=Instance.new("TextLabel")
    tl.Size=UDim2.new(1,-28,0,16); tl.Position=UDim2.new(0,20,0,5)
    tl.BackgroundTransparency=1; tl.Text=t
    tl.TextColor3=col or BANANA; tl.TextSize=12
    tl.Font=Enum.Font.GothamBold; tl.TextXAlignment=Enum.TextXAlignment.Left
    tl.Parent=bg2
    local tx=Instance.new("TextLabel")
    tx.Size=UDim2.new(1,-28,0,16); tx.Position=UDim2.new(0,20,0,26)
    tx.BackgroundTransparency=1; tx.Text=txt
    tx.TextColor3=F.Text2; tx.TextSize=11
    tx.Font=Enum.Font.Gotham; tx.TextXAlignment=Enum.TextXAlignment.Left
    tx.TextTruncate=Enum.TextTruncate.AtEnd; tx.Parent=bg2
    spawn(function() wait(4) SC(function()
        TweenService:Create(bg2,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{BackgroundTransparency=1}):Play()
        wait(0.25); bg2:Destroy()
    end) end)
end

-- ====== UTILITY ======
local function getHRP()
    local c = LP.Character if not c then return nil end
    return c:FindFirstChild("HumanoidRootPart")
end

local function getHum()
    local c = LP.Character if not c then return nil end
    return c:FindFirstChildOfClass("Humanoid")
end

local function tpTo(pos)
    local h = getHRP()
    if h then h.CFrame = CFrame.new(pos) end
end

local function getLevel()
    local ls = LP:FindFirstChild("leaderstats")
    if ls then
        local l = ls:FindFirstChild("Level")
        if l then return l.Value end
    end
    local data = LP:FindFirstChild("Data")
    if data then
        local l = data:FindFirstChild("Level")
        if l then return l.Value end
    end
    return 1
end

local function getBeli()
    local ls = LP:FindFirstChild("leaderstats")
    if ls then
        local b = ls:FindFirstChild("Beli")
        if b then return b.Value end
    end
    return 0
end

local function getFragments()
    local ls = LP:FindFirstChild("leaderstats")
    if ls then
        local f = ls:FindFirstChild("Fragments")
        if f then return f.Value end
    end
    return 0
end

local function getBounty()
    local ls = LP:FindFirstChild("leaderstats")
    if ls then
        local b = ls:FindFirstChild("Bounty")
        if b then return b.Value end
    end
    return 0
end

local function getTeam()
    return LP.Team and LP.Team.Name or "None"
end

-- ====== SPEED & JUMP ======
local speedCon = nil
local function setSpeed(v)
    S.Speed = v
    if speedCon then speedCon:disconnect() end
    if v > 0 then
        speedCon = RunService.Heartbeat:connect(function()
            local c = LP.Character if not c then return end
            local h = c:FindFirstChild("Humanoid") if not h then return end
            h.WalkSpeed = 16 + v
        end)
    end
end

local jumpCon = nil
local function setJump(v)
    S.Jump = v
    if jumpCon then jumpCon:disconnect() end
    if v > 0 then
        jumpCon = RunService.Heartbeat:connect(function()
            local c = LP.Character if not c then return end
            local h = c:FindFirstChild("Humanoid") if not h then return end
            h.JumpPower = 50 + v
        end)
    end
end

-- ====== INFINITE JUMP ======
local ijCon = nil
local function setInfJump(v)
    S.InfiniteJump = v
    if ijCon then ijCon:disconnect(); ijCon = nil end
    if v then
        ijCon = UserInput.JumpRequest:connect(function()
            local c = LP.Character if not c then return end
            local h = c:FindFirstChild("Humanoid") if not h then return end
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end

-- ====== FLY ======
local function startFly()
    if flying then return end
    local c = LP.Character if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart") if not h then return end
    flying = true
    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
    bv.Velocity = Vector3.new(0,0,0)
    bv.Parent = h
    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
    bg.P = 9000
    bg.Parent = h
    notify("Fly","Flight enabled",BANANA)
end

local function stopFly()
    if not flying then return end
    flying = false
    if bv then bv:Destroy(); bv = nil end
    if bg then bg:Destroy(); bg = nil end
end

local flyCon = nil
local function updateFly()
    if flyCon then flyCon:disconnect() end
    flyCon = RunService.Heartbeat:connect(function()
        if not flying then return end
        local c = LP.Character if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart") if not h then return end
        local cf = Camera.CFrame
        local dir = Vector3.new(0,0,0)
        if UserInput:IsKeyDown(Enum.KeyCode.W) then dir = dir + cf.LookVector end
        if UserInput:IsKeyDown(Enum.KeyCode.S) then dir = dir - cf.LookVector end
        if UserInput:IsKeyDown(Enum.KeyCode.A) then dir = dir - cf.RightVector end
        if UserInput:IsKeyDown(Enum.KeyCode.D) then dir = dir + cf.RightVector end
        if UserInput:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInput:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
        if dir.magnitude > 0 then dir = dir.unit end
        if bv then bv.Velocity = dir * 80 end
        if bg then bg.CFrame = cf end
    end)
end
updateFly()

-- ====== NOCLIP ======
local noclipCon = nil
local function setNoclip(v)
    S.Noclip = v
    if noclipCon then noclipCon:disconnect(); noclipCon = nil end
    if v then
        noclipCon = RunService.Stepped:connect(function()
            local c = LP.Character if not c then return end
            for _, p in pairs(c:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end)
    end
end

-- ====== GOD MODE ======
local godCon = nil
local function setGod(v)
    S.God = v
    if godCon then godCon:disconnect(); godCon = nil end
    if v then
        godCon = RunService.Heartbeat:connect(function()
            local c = LP.Character if not c then return end
            local h = c:FindFirstChild("Humanoid") if not h then return end
            if h.Health <= 0 then h.Health = h.MaxHealth end
        end)
        notify("God","God Mode ON",BANANA)
    end
end

-- ====== FULLBRIGHT ======
local function setFullbright(v)
    S.Fullbright = v
    SC(function()
        local l = Lighting
        if v then
            l.Brightness = 2; l.ClockTime = 14
            l.FogEnd = 100000; l.GlobalShadows = false
        else
            l.Brightness = 1; l.GlobalShadows = true
        end
    end)
end

-- ====== NO FOG ======
local function setNoFog(v)
    S.NoFog = v
    SC(function()
        local l = Lighting
        if v then l.FogEnd = 100000
        else l.FogEnd = 1000 end
    end)
end

-- ====== FPS BOOST ======
local function setFPSBoost(v)
    S.FPSBoost = v
    SC(function()
        if v then
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj.Anchored then
                    pcall(function() obj.CanCollide = false end)
                end
                if obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = 1
                end
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Lifetime = NumberRange.new(0)
                end
            end
            Lighting.GlobalShadows = false
            Lighting.Brightness = 0
        end
    end)
end

-- ====== ANTI AFK ======
local afkCon = nil
local function setAntiAFK(v)
    S.AntiAFK = v
    if afkCon then afkCon:disconnect(); afkCon = nil end
    if v and VirtualUser then
        afkCon = LP.Idled:connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end
setAntiAFK(true)

-- ====== AIMBOT ======
local function getClosestEnemy()
    local c = LP.Character if not c then return nil end
    local mh = c:FindFirstChild("HumanoidRootPart") if not mh then return nil end
    local mousePos = UserInput:GetMouseLocation()
    local best, bestDist = nil, S.AimFOV

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then
            if S.AimTeam == false and plr.Team == LP.Team then
            else
                local hm = plr.Character:FindFirstChild("Humanoid")
                if hm and hm.Health > 0 then
                    local part = nil
                    if S.AimBone == "Head" then
                        part = plr.Character:FindFirstChild("Head")
                    else
                        part = plr.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if part then
                        if S.AimVis then
                            local ray = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).unit * 1000)
                            local ignore = {c}
                            for _, pp in pairs(c:GetDescendants()) do
                                if pp:IsA("BasePart") then table.insert(ignore, pp) end
                            end
                            local hit = Workspace:FindPartOnRayWithIgnoreList(ray, ignore)
                            if hit ~= part then
                            else
                                local sp, onS = Camera:WorldToScreenPoint(part.Position)
                                if onS then
                                    local dist = (Vector2.new(sp.X, sp.Y) - mousePos).magnitude
                                    if dist < bestDist then bestDist = dist; best = {plr=plr, part=part} end
                                end
                            end
                        else
                            local sp, onS = Camera:WorldToScreenPoint(part.Position)
                            if onS then
                                local dist = (Vector2.new(sp.X, sp.Y) - mousePos).magnitude
                                if dist < bestDist then bestDist = dist; best = {plr=plr, part=part} end
                            end
                        end
                    end
                end
            end
        end
    end
    return best
end

local aimCon = nil
local accumX, accumY = 0, 0
local function setAimbot(v)
    S.Aimbot = v
    if aimCon then aimCon:disconnect(); aimCon = nil end
    if not v then
        if aimCircle then aimCircle.Visible = false end
        return
    end
    if aimCircle then aimCircle.Visible = true end
    aimCon = RunService.Heartbeat:connect(function()
        if not S.Aimbot then return end
        local pressed = UserInput:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if not pressed then accumX = 0; accumY = 0; return end
        local target = getClosestEnemy()
        if not target then return end
        local sp, onS = Camera:WorldToScreenPoint(target.part.Position)
        if not onS then return end
        local mousePos = UserInput:GetMouseLocation()
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local delta = Vector2.new(sp.X - screenCenter.X, sp.Y - screenCenter.Y)
        local smooth = S.AimSmooth
        accumX = accumX * smooth + delta.X * (1 - smooth)
        accumY = accumY * smooth + delta.Y * (1 - smooth)
        if S.AimPred > 0 then
            local vel = target.part.Velocity
            accumX = accumX + vel.X * S.AimPred
            accumY = accumY + vel.Z * S.AimPred * 0.5
        end
        SC(function() mousemoverel(accumX, accumY) end)
    end)
end

-- ====== AUTO ATTACK ======
local attackLoop = nil
local attackActive = false

local function startAttack()
    if attackActive then return end
    attackActive = true
    attackLoop = spawn(function()
        while attackActive and S.AutoAttack do
            pcall(function()
                local hrp = getHRP()
                if not hrp then wait(0.5) return end
                
                local target = nil
                local bestD = S.AttackRange or 150
                
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                        local isPlayer = Players:GetPlayerFromCharacter(obj)
                        if not isPlayer then
                            local hum = obj.Humanoid
                            if hum.Health > 0 then
                                local d = (obj.HumanoidRootPart.Position - hrp.Position).magnitude
                                if d < bestD then
                                    bestD = d
                                    target = obj
                                end
                            end
                        end
                    end
                end
                
                if target then
                    local tHRP = target:FindFirstChild("HumanoidRootPart")
                    if tHRP then
                        hrp.CFrame = CFrame.new(hrp.Position, tHRP.Position)
                        if (tHRP.Position - hrp.Position).magnitude > 8 then
                            tpTo(tHRP.Position + Vector3.new(0,3,0))
                        end
                        VirtualUser:ClickButton1(Vector2.new())
                        if S.AutoSkill then
                            VirtualInput:SendKeyEvent(true, "Z", false, game)
                            wait(0.05)
                            VirtualInput:SendKeyEvent(false, "Z", false, game)
                            wait(0.2)
                            VirtualInput:SendKeyEvent(true, "X", false, game)
                            wait(0.05)
                            VirtualInput:SendKeyEvent(false, "X", false, game)
                            wait(0.2)
                            VirtualInput:SendKeyEvent(true, "C", false, game)
                            wait(0.05)
                            VirtualInput:SendKeyEvent(false, "C", false, game)
                        end
                        if S.SpamM1 then
                            for i = 1, 5 do
                                VirtualUser:ClickButton1(Vector2.new())
                                wait(0.05)
                            end
                        end
                        if S.HitboxExpand then
                            pcall(function()
                                tHRP.Size = Vector3.new(20,20,20)
                                tHRP.Transparency = 0.8
                            end)
                        end
                    end
                else
                    wait(0.5)
                end
            end)
            wait(0.1)
        end
    end)
end

local function stopAttack()
    attackActive = false
    if attackLoop then
        attackLoop = nil
    end
end

-- ====== AUTO BUSA ======
spawn(function()
    while true do
        if S.AutoBuso then
            pcall(function()
                local c = LP.Character
                if c and not c:FindFirstChild("HasBuso") then
                    local rem = RS.Remotes and RS.Remotes.CommF_
                    if rem then rem:InvokeServer("Buso") end
                end
            end)
        end
        wait(3)
    end
end)

-- ====== AUTO KEN ======
spawn(function()
    while true do
        if S.AutoKen then
            pcall(function()
                local rem = RS.Remotes and RS.Remotes.CommF_
                if rem then rem:InvokeServer("Ken") end
            end)
        end
        wait(5)
    end
end)

-- ====== AUTO RACE V3 ======
spawn(function()
    while true do
        if S.AutoRaceV3 then
            pcall(function()
                local rem = RS.Remotes and RS.Remotes.CommE
                if rem then rem:FireServer("ActivateAbility") end
            end)
        end
        wait(1)
    end
end)

-- ====== AUTO RACE V4 ======
spawn(function()
    while true do
        if S.AutoRaceV4 then
            pcall(function()
                local c = LP.Character
                if c and c:FindFirstChild("RaceEnergy") and c.RaceEnergy.Value >= 1 and not c.RaceTransformed.Value then
                    VirtualInput:SendKeyEvent(true, "Y", false, game)
                    wait(0.05)
                    VirtualInput:SendKeyEvent(false, "Y", false, game)
                end
            end)
        end
        wait(0.5)
    end
end)

-- ====== AUTO STATS ======
spawn(function()
    while true do
        if S.AutoStats then
            pcall(function()
                local rem = RS.Remotes and RS.Remotes.CommF_
                if rem then
                    local points = LP.Data and LP.Data.Points
                    if points and points.Value > 0 then
                        rem:InvokeServer("AddPoint", S.StatPriority, 1)
                    end
                end
            end)
        end
        wait(0.5)
    end
end)

-- ====== AUTO BRING ======
spawn(function()
    while true do
        if S.AutoBring then
            pcall(function()
                local hrp = getHRP()
                if not hrp then wait(1) return end
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                        local isPlayer = Players:GetPlayerFromCharacter(obj)
                        if not isPlayer then
                            local hum = obj.Humanoid
                            if hum.Health > 0 then
                                local d = (obj.HumanoidRootPart.Position - hrp.Position).magnitude
                                if d < 150 then
                                    obj.HumanoidRootPart.CFrame = hrp.CFrame + Vector3.new(0,0,3)
                                end
                            end
                        end
                    end
                end
            end)
        end
        wait(0.5)
    end
end)

-- ====== AUTO HOP ======
spawn(function()
    while true do
        if S.AutoHop then
            pcall(function()
                local hrp = getHRP()
                if not hrp then wait(2) return end
                local hasTarget = false
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                        local isPlayer = Players:GetPlayerFromCharacter(obj)
                        if not isPlayer then
                            local hum = obj.Humanoid
                            if hum.Health > 0 then
                                local d = (obj.HumanoidRootPart.Position - hrp.Position).magnitude
                                if d < S.FarmRange then
                                    hasTarget = true
                                    break
                                end
                            end
                        end
                    end
                end
                if not hasTarget then
                    serverHop()
                end
            end)
        end
        wait(60)
    end
end)

-- ====== AUTO STORE FRUIT ======
spawn(function()
    while true do
        if S.AutoStoreFruit then
            pcall(function()
                for _, item in pairs(LP.Backpack:GetChildren()) do
                    if item:IsA("Tool") then
                        local n = item.Name:lower()
                        if n:find("fruit") or n:find("t-rex") or n:find("dragon") or n:find("kitsune") then
                            local rem = item:FindFirstChild("EatRemote")
                            if rem then
                                rem:InvokeServer("StoreFruit", item:GetAttribute("OriginalName"), item)
                            end
                        end
                    end
                end
            end)
        end
        wait(2)
    end
end)

-- ====== AUTO REDEEM CODE ======
local codes = {
    "LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK",
    "BANEXPLOIT", "krazydares", "TRIPLEABUSE", "24NOADMIN",
    "REWARDFUN", "Chandler", "NEWTROLL", "KITT_RESET",
    "Magicbus", "Starcodeheo", "fudd10_v2", "Sub2UncleKizaru",
    "Fudd10", "Bignews", "SECRET_ADMIN", "SUB2GAMERROBOT_RESET1",
    "SUB2OFFICIALNOOBIE", "AXIORE", "BIGNEWS", "BLUXXY",
    "CHANDLER", "ENYU_IS_PRO", "FUDD10", "FUDD10_V2",
    "KITTGAMING", "MAGICBUS", "STARCODEHEO", "STRAWHATMAINE",
    "SUB2CAPTAINMAUI", "SUB2DAIGROCK", "SUB2FER999",
    "SUB2NOOBMASTER123", "SUB2UNCLEKIZARU", "TANTAIGAMING",
    "THEGREATACE", "WildDares", "BossBuild", "GetPranked",
    "FIGHT4FRUIT", "EARN_FRUITS"
}

local function redeemCode(code)
    pcall(function()
        local rem = RS.Remotes and RS.Remotes.Redeem
        if rem then rem:InvokeServer(code) end
    end)
end

spawn(function()
    while true do
        if S.AutoRedeem then
            for _, code in pairs(codes) do
                pcall(redeemCode, code)
                wait(0.3)
            end
        end
        wait(300)
    end
end)

-- ====== AUTO BUY ======
spawn(function()
    while true do
        if S.AutoBuy then
            pcall(function()
                local rem = RS.Remotes and RS.Remotes.CommF_
                if rem then
                    rem:InvokeServer("BuyItem", "Dual Flintlock")
                    rem:InvokeServer("BuyHaki", "Geppo")
                    rem:InvokeServer("BuyHaki", "Buso")
                    rem:InvokeServer("BuyHaki", "Soru")
                end
            end)
        end
        wait(300)
    end
end)

-- ====== SERVER HOP ======
local function serverHop()
    notify("Hop","Teleporting to new server...",BANANA)
    SC(function()
        local placeId = game.PlaceId
        local servers = HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100")
        )
        if servers and servers.data then
            for _, s in pairs(servers.data) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(placeId, s.id, LP)
                    return
                end
            end
        end
        TeleportService:Teleport(placeId, LP)
    end)
end

-- ====== FIND FUNCTIONS ======

local function findNearestMob(range)
    range = range or S.FarmRange or 200
    local hrp = getHRP()
    if not hrp then return nil end
    local best, bestD = nil, math.huge
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            local isPlayer = Players:GetPlayerFromCharacter(obj)
            if not isPlayer then
                local hum = obj.Humanoid
                if hum.Health > 0 then
                    local d = (obj.HumanoidRootPart.Position - hrp.Position).magnitude
                    if d < range and d < bestD then
                        bestD = d
                        best = obj
                    end
                end
            end
        end
    end
    return best
end

local function findNearestBoss(range)
    range = range or 500
    local hrp = getHRP()
    if not hrp then return nil end
    local best, bestD = nil, math.huge
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            local isPlayer = Players:GetPlayerFromCharacter(obj)
            if not isPlayer then
                local hum = obj.Humanoid
                if hum.Health > 0 and hum.MaxHealth > 10000 then
                    local d = (obj.HumanoidRootPart.Position - hrp.Position).magnitude
                    if d < range and d < bestD then
                        bestD = d
                        best = obj
                    end
                end
            end
        end
    end
    return best
end

local function findChests()
    local chests = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local n = obj.Name:lower()
            if n:find("chest") or n:find("box") or n:find("crate") or n:find("present") then
                table.insert(chests, obj)
            end
        end
    end
    return chests
end

local function findSeaEvent()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local n = obj.Name:lower()
            if n:find("seabeast") or n:find("terror") or n:find("leviathan") or n:find("piranha") or n:find("shark") then
                local hum = obj:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    return obj
                end
            end
        end
    end
    return nil
end

local function getQuestNPC()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local isPlayer = Players:GetPlayerFromCharacter(obj)
            if not isPlayer then
                local n = obj.Name:lower()
                if n:find("quest") or n:find("npc") or n:find("giver") then
                    return obj
                end
            end
        end
    end
    return nil
end

local function getBoat()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("VehicleSeat") then
            local owner = obj:FindFirstChild("Owner")
            if owner then
                if tostring(owner.Value) == LP.Name then
                    return obj
                end
            end
        end
    end
    return nil
end

local function findMaterialMob(material)
    local materials = {
        ["Scrap Metal"] = {"Forest Pirate", "Jungle Pirate"},
        ["Leather"] = {"Brute", "Pirate"},
        ["Angel Wings"] = {"Shanda", "Royal Squad"},
        ["Magma Ore"] = {"Military Soldier", "Military Spy"},
        ["Fish Tail"] = {"Fishman Warrior", "Fishman Commando"},
        ["Ectoplasm"] = {"Ship Deckhand", "Ship Engineer"},
        ["Demonic Wisp"] = {"Demonic Soul"},
        ["Conjured Cocoa"] = {"Chocolate Bar Battler", "Cocoa Warrior"},
        ["Dragon Scale"] = {"Dragon Crew Archer", "Dragon Crew Warrior"},
        ["Gunpowder"] = {"Pistol Billionaire"},
        ["Mini Tusk"] = {"Mythological Pirate"},
    }
    return materials[material] or {}
end

-- ====== QUEST SYSTEM ======
local function DontQuest()
    pcall(function()
        if LP.Data and LP.Data.Quest then
            return false
        end
    end)
    return false
end

local function CountQuest()
    local quests = {}
    pcall(function()
        local questModule = require(RS.Quests)
        for _, quest in pairs(questModule) do
            if quest.Task then
                for mob, count in pairs(quest.Task) do
                    if count > 0 then
                        table.insert(quests, mob)
                    end
                end
            end
        end
    end)
    return quests
end

local function GetNameDoubleQuest()
    if DontQuest() then return nil end
    local quests = CountQuest()
    if #quests > 0 then
        return quests[1]
    end
    return nil
end

local function DoubleQuest()
    local result = {}
    local quests = CountQuest()
    if #quests > 0 then
        result.Name = quests[1]
        result.NameQuest = "Quest"
        result.ID = 1
        return result
    end
    return nil
end

local function CFrameQuest()
    local questpoint = {}
    pcall(function()
        local questModule = require(RS.Quests)
        for _, quest in pairs(questModule) do
            if quest.Pos then
                questpoint[quest.Name] = CFrame.new(quest.Pos)
            end
        end
    end)
    return questpoint
end

local function TakeQuestLevel()
    local level = getLevel()
    local quests = CFrameQuest()
    for questName, pos in pairs(quests) do
        if pos then
            local hrp = getHRP()
            if hrp then
                if (pos.Position - hrp.Position).magnitude > 8 then
                    tpTo(pos.Position + Vector3.new(0,4,2))
                else
                    local rem = RS.Remotes and RS.Remotes.CommF_
                    if rem then
                        rem:InvokeServer("StartQuest", questName, 1)
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function DetectPartSpawnMob(mobName, checkIgnored)
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Parent and part.Parent:IsA("Model") then
            local name = part.Parent.Name
            if name:find(mobName) or name:gsub(" %p?Lv%.? %d+%p?", "") == mobName then
                if checkIgnored and part.Parent:FindFirstChild("Ignored") then
                    return nil
                end
                return part.Parent
            end
        end
    end
    return nil
end

local function DeleteIgnoredMobSpawn()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Ignored") then
            obj.Ignored:Destroy()
        end
    end
end

local function DetectNameTablePart(mobNames)
    if type(mobNames) ~= "table" then return mobNames end
    for _, name in pairs(mobNames) do
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and obj.Name:find(name) then
                return name
            end
        end
    end
    return mobNames[1]
end

local function TeleportSpawnMob(mobNames)
    if type(mobNames) == "table" then
        if #mobNames == 0 then return end
        for _, name in pairs(mobNames) do
            local part = DetectPartSpawnMob(name, true)
            if part then
                tpTo(part.PrimaryPart.Position + Vector3.new(0,60,0))
                return
            end
        end
    else
        local part = DetectPartSpawnMob(mobNames, true)
        if part then
            tpTo(part.PrimaryPart.Position + Vector3.new(0,60,0))
        else
            DeleteIgnoredMobSpawn()
        end
    end
end

local function QuestBoneAndkatakuri(questName, questID)
    local questpoint = CFrameQuest()
    local pos = questpoint[questName]
    if pos then
        local hrp = getHRP()
        if hrp then
            if (pos.Position - hrp.Position).magnitude > 8 then
                tpTo(pos.Position + Vector3.new(0,4,2))
            else
                local rem = RS.Remotes and RS.Remotes.CommF_
                if rem then
                    rem:InvokeServer("StartQuest", questName, questID)
                end
            end
        end
    end
end

local function UsedualFlock()
    local weapon = S.SelectedWeapon or "Melee"
    equiptool(weapon)
end

-- ====== AUTO QUEST FARM ======
local function startQuestFarm()
    if farmActive then return end
    farmActive = true
    
    farmLoop = spawn(function()
        while farmActive and S.QuestSystem do
            pcall(function()
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum or hum.Health <= 0 then
                    wait(2)
                    return
                end
                
                local questData = DoubleQuest()
                local mobName = S.QuestMob or (questData and questData.Name)
                
                if S.AutoTakeQuest and not DontQuest() then
                    TakeQuestLevel()
                    wait(1)
                end
                
                if mobName then
                    local mob = findNearestMob(S.FarmRange)
                    if not mob then
                        mob = DetectPartSpawnMob(mobName)
                        if mob then
                            tpTo(mob.PrimaryPart.Position + Vector3.new(0,60,0))
                            wait(1)
                        else
                            TeleportSpawnMob(mobName)
                            wait(2)
                        end
                    else
                        local mHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mHRP then
                            if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(mHRP.Position + Vector3.new(0,5,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                            if S.AutoSkill then
                                VirtualInput:SendKeyEvent(true, "Z", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "Z", false, game)
                                wait(0.2)
                                VirtualInput:SendKeyEvent(true, "X", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "X", false, game)
                            end
                            if S.SpamM1 then
                                for i = 1, 3 do
                                    VirtualUser:ClickButton1(Vector2.new())
                                    wait(0.05)
                                end
                            end
                        end
                    end
                else
                    wait(1)
                end
                
                if S.AutoCompleteQuest and DontQuest() then
                    local rem = RS.Remotes and RS.Remotes.CommF_
                    if rem then
                        rem:InvokeServer("CompleteQuest")
                    end
                end
            end)
            wait(0.1)
        end
    end)
end

-- ====== MAIN FARM ======
local function startFarm()
    if farmActive then return end
    farmActive = true
    
    farmLoop = spawn(function()
        while farmActive and (S.AutoLevel or S.AutoBoss or S.AutoMob or S.AutoChest or S.AutoSea or S.AutoMaterial or S.AutoMastery or S.QuestSystem) do
            pcall(function()
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum or hum.Health <= 0 then
                    wait(2)
                    return
                end

                if S.QuestSystem then
                    startQuestFarm()
                    return
                end

                -- AUTO LEVEL
                if S.AutoLevel then
                    local mob = findNearestMob(S.FarmRange)
                    if mob then
                        local mHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mHRP then
                            if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(mHRP.Position + Vector3.new(0,5,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                            if S.AutoQuest then
                                local npc = getQuestNPC()
                                if npc and npc:FindFirstChild("HumanoidRootPart") then
                                    tpTo(npc.HumanoidRootPart.Position + Vector3.new(0,0,3))
                                    wait(0.3)
                                    for _, prompt in pairs(npc:GetDescendants()) do
                                        if prompt:IsA("ProximityPrompt") then
                                            fireproximityprompt(prompt)
                                        end
                                    end
                                    local rem = RS.Remotes and RS.Remotes.CommF_
                                    if rem then
                                        local lvl = getLevel()
                                        rem:InvokeServer("StartQuest", "Combat", lvl)
                                    end
                                end
                            end
                        end
                    else
                        wait(1)
                    end
                end

                -- AUTO BOSS
                if S.AutoBoss and S.SelectedBoss ~= "" then
                    local boss = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj:IsA("Model") and obj.Name:find(S.SelectedBoss) then
                            local hum2 = obj:FindFirstChild("Humanoid")
                            if hum2 and hum2.Health > 0 then
                                boss = obj
                                break
                            end
                        end
                    end
                    if boss then
                        local bHRP = boss:FindFirstChild("HumanoidRootPart")
                        if bHRP then
                            if (bHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(bHRP.Position + Vector3.new(0,10,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, bHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                            if S.AutoSkill then
                                VirtualInput:SendKeyEvent(true, "Z", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "Z", false, game)
                                wait(0.2)
                                VirtualInput:SendKeyEvent(true, "X", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "X", false, game)
                            end
                        end
                    else
                        wait(1)
                    end
                end

                -- AUTO MOB
                if S.AutoMob then
                    local mob = findNearestMob(S.FarmRange)
                    if mob then
                        local mHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mHRP then
                            if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(mHRP.Position + Vector3.new(0,5,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                        end
                    else
                        wait(1)
                    end
                end

                -- AUTO CHEST
                if S.AutoChest then
                    local chests = findChests()
                    for _, chest in pairs(chests) do
                        if chest and chest.Parent then
                            if (chest.Position - hrp.Position).magnitude < 100 then
                                tpTo(chest.Position + Vector3.new(0,2,0))
                                firetouchinterest(chest, hrp, 0)
                                firetouchinterest(chest, hrp, 1)
                            end
                        end
                    end
                end

                -- AUTO SEA
                if S.AutoSea then
                    local sea = findSeaEvent()
                    if sea then
                        local boat = getBoat()
                        if boat then
                            local seat = boat:FindFirstChild("VehicleSeat")
                            if seat then
                                local hum2 = getHum()
                                if hum2 and not hum2.Sit then
                                    tpTo(seat.Position + Vector3.new(0,2,0))
                                    seat:Sit(hum2)
                                end
                            end
                        end
                        local sHRP = sea:FindFirstChild("HumanoidRootPart")
                        if sHRP then
                            tpTo(sHRP.Position + Vector3.new(0,30,0))
                            VirtualUser:ClickButton1(Vector2.new())
                            if S.AutoSkill then
                                VirtualInput:SendKeyEvent(true, "Z", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "Z", false, game)
                                wait(0.2)
                                VirtualInput:SendKeyEvent(true, "X", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "X", false, game)
                            end
                        end
                    end
                end

                -- AUTO MATERIAL
                if S.AutoMaterial and S.SelectedMaterial ~= "" then
                    local mobNames = findMaterialMob(S.SelectedMaterial)
                    local mob = nil
                    for _, name in pairs(mobNames) do
                        for _, obj in pairs(Workspace:GetDescendants()) do
                            if obj:IsA("Model") and obj.Name == name then
                                local hum2 = obj:FindFirstChild("Humanoid")
                                if hum2 and hum2.Health > 0 then
                                    mob = obj
                                    break
                                end
                            end
                        end
                        if mob then break end
                    end
                    if mob then
                        local mHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mHRP then
                            if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(mHRP.Position + Vector3.new(0,5,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                        end
                    else
                        wait(1)
                    end
                end

                -- AUTO MASTERY
                if S.AutoMastery then
                    local mob = findNearestMob(S.FarmRange)
                    if mob then
                        local mHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mHRP then
                            if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                tpTo(mHRP.Position + Vector3.new(0,5,0))
                            end
                            hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                            VirtualUser:ClickButton1(Vector2.new())
                            if S.AutoSkill then
                                VirtualInput:SendKeyEvent(true, "Z", false, game)
                                wait(0.05)
                                VirtualInput:SendKeyEvent(false, "Z", false, game)
                            end
                        end
                    else
                        wait(1)
                    end
                end
            end)
            wait(0.1)
        end
    end)
end

local function stopFarm()
    farmActive = false
    if farmLoop then
        farmLoop = nil
    end
end

-- ====== AUTO RAID ======
local function startRaid()
    if raidActive then return end
    raidActive = true
    spawn(function()
        while raidActive and S.AutoRaid do
            pcall(function()
                local hrp = getHRP()
                if not hrp then wait(1) return end
                
                if S.AutoBuyChip then
                    local rem = RS.Remotes and RS.Remotes.CommF_
                    if rem then rem:InvokeServer("BlackbeardReward", "Microchip", "2") end
                    wait(1)
                end
                
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("ClickDetector") then
                        local n = obj.Name:lower()
                        if n:find("raid") or n:find("summon") then
                            fireclickdetector(obj)
                            wait(2)
                        end
                    end
                    if obj:IsA("ProximityPrompt") then
                        local n = obj.Name:lower()
                        if n:find("raid") or n:find("enter") or n:find("start") then
                            fireproximityprompt(obj)
                            wait(2)
                        end
                    end
                end
                
                for _, mob in pairs(Workspace:GetDescendants()) do
                    if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                        local isPlayer = Players:GetPlayerFromCharacter(mob)
                        if not isPlayer then
                            local hum = mob.Humanoid
                            if hum.Health > 0 then
                                local mHRP = mob.HumanoidRootPart
                                if mHRP then
                                    if (mHRP.Position - hrp.Position).magnitude > S.AttackRange then
                                        tpTo(mHRP.Position + Vector3.new(0,5,0))
                                    end
                                    hrp.CFrame = CFrame.new(hrp.Position, mHRP.Position)
                                    VirtualUser:ClickButton1(Vector2.new())
                                    if S.AutoSkill then
                                        VirtualInput:SendKeyEvent(true, "Z", false, game)
                                        wait(0.05)
                                        VirtualInput:SendKeyEvent(false, "Z", false, game)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            wait(0.5)
        end
    end)
end

local function stopRaid()
    raidActive = false
end

-- ====== ESP ======
local function clearESP()
    for _, o in pairs(espObjs) do
        if o and o.Parent then o:Destroy() end
    end
    espObjs = {}
end

local function createESP()
    clearESP()
    local espSG = Instance.new("ScreenGui")
    espSG.Name = "BCH_ESP"; espSG.ResetOnSpawn = false
    SC(function() espSG.Parent = game:GetService("CoreGui") end)
    if not espSG.Parent then espSG.Parent = LP:WaitForChild("PlayerGui") end
    table.insert(espObjs, espSG)

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then
            local folder = Instance.new("Folder")
            folder.Name = plr.Name; folder.Parent = espSG
            table.insert(espObjs, folder)
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local head = plr.Character:FindFirstChild("Head")
            local hm = plr.Character:FindFirstChildOfClass("Humanoid")
            
            if S.ESPBox and hrp then
                local box = Instance.new("BillboardGui")
                box.Adornee = hrp; box.Size = UDim2.new(5,0,6,0)
                box.StudsOffset = Vector3.new(0,1,0)
                box.AlwaysOnTop = true; box.Parent = folder
                local ol = Instance.new("Frame")
                ol.Size = UDim2.new(1,0,1,0)
                ol.BackgroundColor3 = Color3.new(0,0,0)
                ol.BackgroundTransparency = 0.3
                ol.BorderSizePixel = 0; ol.Parent = box
                Instance.new("UICorner",ol).CornerRadius = UDim.new(0,1)
                local inn = Instance.new("Frame")
                inn.Size = UDim2.new(0.95,0,0.95,0)
                inn.Position = UDim2.new(0.025,0,0.025,0)
                inn.BackgroundColor3 = BANANA
                inn.BackgroundTransparency = 0.85
                inn.BorderSizePixel = 0; inn.Parent = box
                Instance.new("UICorner",inn).CornerRadius = UDim.new(0,1)
                table.insert(espObjs, box)
            end
            
            if S.ESPName and head then
                local ng = Instance.new("BillboardGui")
                ng.Adornee = head; ng.Size = UDim2.new(0,200,0,24)
                ng.StudsOffset = Vector3.new(0,2.5,0)
                ng.AlwaysOnTop = true; ng.Parent = folder
                local nl = Instance.new("TextLabel")
                nl.Size = UDim2.new(1,0,1,0)
                nl.BackgroundTransparency = 1; nl.Text = plr.Name
                nl.TextColor3 = BANANA; nl.TextSize = 13
                nl.Font = Enum.Font.GothamBold
                nl.TextStrokeTransparency = 0.5
                nl.TextStrokeColor3 = Color3.new(0,0,0)
                nl.Parent = ng
                table.insert(espObjs, ng)
            end
            
            if S.ESPHealth and hrp then
                local hg = Instance.new("BillboardGui")
                hg.Adornee = hrp; hg.Size = UDim2.new(4,0,0.3,0)
                hg.StudsOffset = Vector3.new(0,3.5,0)
                hg.AlwaysOnTop = true; hg.Parent = folder
                local bgF = Instance.new("Frame")
                bgF.Size = UDim2.new(1,0,1,0)
                bgF.BackgroundColor3 = Color3.fromRGB(30,30,30)
                bgF.BackgroundTransparency = 0.3
                bgF.BorderSizePixel = 0; bgF.Parent = hg
                Instance.new("UICorner",bgF).CornerRadius = UDim.new(0,3)
                local fl = Instance.new("Frame")
                fl.Size = UDim2.new(1,0,1,0)
                fl.BackgroundColor3 = F.Ok; fl.BorderSizePixel = 0; fl.Parent = bgF
                Instance.new("UICorner",fl).CornerRadius = UDim.new(0,3)
                if hm then fl.Size = UDim2.new(hm.Health/hm.MaxHealth,0,1,0) end
                table.insert(espObjs, hg)
            end
            
            if S.ESPDist and hrp then
                local dg = Instance.new("BillboardGui")
                dg.Adornee = hrp; dg.Size = UDim2.new(0,100,0,20)
                dg.StudsOffset = Vector3.new(0,4.2,0)
                dg.AlwaysOnTop = true; dg.Parent = folder
                local dl = Instance.new("TextLabel")
                dl.Size = UDim2.new(1,0,1,0)
                dl.BackgroundTransparency = 1; dl.TextColor3 = F.Text2
                dl.TextSize = 11; dl.Font = Enum.Font.Gotham
                dl.TextStrokeTransparency = 0.5
                dl.TextStrokeColor3 = Color3.new(0,0,0)
                dl.Parent = dg
                local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if hrp and myHRP then
                    dl.Text = math.floor((hrp.Position - myHRP.Position).magnitude) .. "m"
                end
                table.insert(espObjs, dg)
            end
        end
    end
    
    local charCon = Players.PlayerAdded:connect(function(plr)
        plr.CharacterAdded:connect(function()
            wait(1)
            if S.ESP then
                pcall(function()
                    local folder = Instance.new("Folder")
                    folder.Name = plr.Name; folder.Parent = espSG
                    table.insert(espObjs, folder)
                end)
            end
        end)
    end)
    table.insert(connections, charCon)
end

local function setESP(v)
    S.ESP = v
    if v then
        createESP()
        notify("ESP","ESP enabled",BANANA)
    else
        clearESP()
    end
end

-- ====== TOGGLE FUNCTIONS ======
local function toggleQuestSystem(v)
    S.QuestSystem = v
    if v then
        if S.AutoFarmQuest then
            startFarm()
        end
        notify("Quest System", "Enabled", BANANA)
    else
        stopFarm()
        notify("Quest System", "Disabled", F.Text3)
    end
end

local function toggleAutoLevel(v)
    S.AutoLevel = v
    if v then startFarm() else stopFarm() end
end

local function toggleAutoQuest(v)
    S.AutoQuest = v
end

local function toggleAutoFarmQuest(v)
    S.AutoFarmQuest = v
    if v then
        S.QuestSystem = true
        startFarm()
        notify("Quest Farm", "Enabled", BANANA)
    end
end

-- ====== UI ======
local sg = Instance.new("ScreenGui")
sg.Name="BananaCatUltimate"; sg.ResetOnSpawn=false
sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
SC(function() sg.Parent=game:GetService("CoreGui") end)
if not sg.Parent then sg.Parent=LP:WaitForChild("PlayerGui") end

local tabs = {"Player","Combat","Farm","Quest","Visual","Settings"}
local tabFrames = {}

local bd=Instance.new("Frame")
bd.Size=UDim2.new(0,380,0,520)
bd.Position=UDim2.new(0.5,-190,0.5,-260)
bd.BackgroundColor3=Color3.fromRGB(24,24,24); bd.BackgroundTransparency=0.1
bd.BorderSizePixel=0; bd.Parent=sg
Instance.new("UICorner",bd).CornerRadius=UDim.new(0,10)

local main=Instance.new("Frame")
main.Size=UDim2.new(0,380,0,520)
main.Position=UDim2.new(0.5,-190,0.5,-260)
main.BackgroundColor3=F.Card; main.BorderSizePixel=0
main.ClipsDescendants=true; main.Parent=sg
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)
local mStroke=Instance.new("UIStroke")
mStroke.Color=F.Brd; mStroke.Thickness=1; mStroke.Transparency=0.3; mStroke.Parent=main

local catStrip=Instance.new("Frame")
catStrip.Size=UDim2.new(1,0,0,4)
catStrip.BackgroundColor3=BANANA; catStrip.BorderSizePixel=0
catStrip.ZIndex=5; catStrip.Parent=main
Instance.new("UICorner",catStrip).CornerRadius=UDim.new(0,2)

local titleArea=Instance.new("Frame")
titleArea.Size=UDim2.new(1,0,0,48)
titleArea.BackgroundTransparency=1; titleArea.Parent=main
local tLbl=Instance.new("TextLabel")
tLbl.Size=UDim2.new(1,-70,0,24); tLbl.Position=UDim2.new(0,16,0,4)
tLbl.BackgroundTransparency=1; tLbl.Text="BANANA CAT HUB"
tLbl.TextColor3=BANANA; tLbl.TextSize=16
tLbl.Font=Enum.Font.GothamBold; tLbl.TextXAlignment=Enum.TextXAlignment.Left
tLbl.Parent=titleArea
local sub=Instance.new("TextLabel")
sub.Size=UDim2.new(1,-70,0,16); sub.Position=UDim2.new(0,16,0,28)
sub.BackgroundTransparency=1; sub.Text="ULTIMATE EDITION v6"
sub.TextColor3=F.Text3; sub.TextSize=10
sub.Font=Enum.Font.GothamBold; sub.TextXAlignment=Enum.TextXAlignment.Left
sub.Parent=titleArea

local clBtn=Instance.new("TextButton")
clBtn.Size=UDim2.new(0,30,0,30); clBtn.Position=UDim2.new(1,-38,0,10)
clBtn.BackgroundColor3=Color3.fromRGB(50,50,50); clBtn.BackgroundTransparency=0.5
clBtn.BorderSizePixel=0; clBtn.Text="X"; clBtn.TextColor3=F.Text2
clBtn.TextSize=12; clBtn.Font=Enum.Font.GothamBold; clBtn.AutoButtonColor=false
clBtn.Parent=titleArea
Instance.new("UICorner",clBtn).CornerRadius=UDim.new(0,15)
clBtn.MouseButton1Click:Connect(function() stopFly(); clearESP(); setNoclip(false); setGod(false); setInfJump(false); setAimbot(false); stopFarm(); stopRaid(); stopAttack(); for _,c in pairs(connections) do if c then pcall(function() c:disconnect() end) end end; sg:Destroy() end)
clBtn.MouseEnter:Connect(function() TweenService:Create(clBtn,TweenInfo.new(0.15),{BackgroundColor3=F.Bad,BackgroundTransparency=0.2,TextColor3=Color3.new(1,1,1)}):Play() end)
clBtn.MouseLeave:Connect(function() TweenService:Create(clBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,50,50),BackgroundTransparency=0.5,TextColor3=F.Text2}):Play() end)

local div=Instance.new("Frame")
div.Size=UDim2.new(1,-20,0,1); div.Position=UDim2.new(0,10,0,48)
div.BackgroundColor3=F.Brd; div.BorderSizePixel=0; div.Parent=main

local tabBar=Instance.new("Frame")
tabBar.Size=UDim2.new(1,0,0,34); tabBar.BackgroundTransparency=1
tabBar.Position=UDim2.new(0,0,0,50); tabBar.Parent=main
local tabLayout=Instance.new("UIListLayout")
tabLayout.FillDirection=Enum.FillDirection.Horizontal
tabLayout.SortOrder=Enum.SortOrder.LayoutOrder
tabLayout.Padding=UDim.new(0,2); tabLayout.Parent=tabBar
Instance.new("UIPadding",tabBar).PaddingLeft=UDim.new(0,8)

local tabBtns = {}
for i, name in ipairs(tabs) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,58,0,28); b.BackgroundColor3=Color3.fromRGB(38,38,38)
    b.BackgroundTransparency=0.8; b.BorderSizePixel=0
    b.Text=string.sub(name,1,5); b.TextColor3=F.Text3
    b.TextSize=10; b.Font=Enum.Font.GothamBold
    b.AutoButtonColor=false; b.Parent=tabBar
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    tabBtns[name] = b
    local ind=Instance.new("Frame")
    ind.Size=UDim2.new(0.6,0,0,2)
    ind.Position=UDim2.new(0.2,0,1,-2)
    ind.BackgroundColor3=BANANA; ind.BackgroundTransparency=1
    ind.BorderSizePixel=0; ind.Parent=b
    Instance.new("UICorner",ind).CornerRadius=UDim.new(0,1)
    b.MouseButton1Click:Connect(function()
        for tn, tb in pairs(tabBtns) do
            local indicator = tb:FindFirstChildWhichIsA("Frame")
            if tn == name then
                TweenService:Create(tb,TweenInfo.new(0.15),{BackgroundTransparency=0.4}):Play()
                TweenService:Create(ind,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play()
                tb.TextColor3 = BANANA
            else
                TweenService:Create(tb,TweenInfo.new(0.15),{BackgroundTransparency=0.8}):Play()
                TweenService:Create(ind,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                tb.TextColor3 = F.Text3
            end
        end
        for tn, tf in pairs(tabFrames) do
            if tf then tf.Visible = (tn == name) end
        end
    end)
    b.MouseEnter:Connect(function()
        if currentTab ~= name then
            TweenService:Create(b,TweenInfo.new(0.1),{BackgroundTransparency=0.5}):Play()
        end
    end)
    b.MouseLeave:Connect(function()
        if currentTab ~= name then
            TweenService:Create(b,TweenInfo.new(0.1),{BackgroundTransparency=0.8}):Play()
        end
    end)
end

local contentArea=Instance.new("Frame")
contentArea.Size=UDim2.new(1,-16,1,-96)
contentArea.Position=UDim2.new(0,8,0,86)
contentArea.BackgroundTransparency=1; contentArea.ClipsDescendants=true
contentArea.Parent=main

-- ====== UI FACTORY ======

local function section(name, parent)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,0,0,20); f.BackgroundTransparency=1; f.Parent=parent
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,0,1,0); l.Position=UDim2.new(0,2,0,0)
    l.BackgroundTransparency=1; l.Text=string.upper(name)
    l.TextColor3=F.Text3; l.TextSize=9; l.Font=Enum.Font.GothamBold
    l.TextXAlignment=Enum.TextXAlignment.Left; l.Parent=f
end

local function toggle(label,def,cb,parent)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,0,0,32); f.BackgroundColor3=Color3.fromRGB(38,38,38)
    f.BackgroundTransparency=0.5; f.BorderSizePixel=0; f.Parent=parent
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-52,1,0); l.Position=UDim2.new(0,10,0,0)
    l.BackgroundTransparency=1; l.Text=label; l.TextColor3=F.Text1; l.TextSize=11
    l.Font=Enum.Font.Gotham; l.TextXAlignment=Enum.TextXAlignment.Left; l.Parent=f
    local pill=Instance.new("TextButton")
    pill.Size=UDim2.new(0,40,0,20); pill.Position=UDim2.new(1,-46,0.5,-10)
    pill.BackgroundColor3=F.TogOff; pill.BorderSizePixel=0
    pill.Text=""; pill.AutoButtonColor=false; pill.Parent=f
    Instance.new("UICorner",pill).CornerRadius=UDim.new(0,10)
    local dot=Instance.new("Frame")
    dot.Size=UDim2.new(0,14,0,14); dot.Position=UDim.new(0,3,0,3)
    dot.BackgroundColor3=Color3.fromRGB(160,160,160); dot.BorderSizePixel=0; dot.Parent=pill
    Instance.new("UICorner",dot).CornerRadius=UDim.new(0,7)
    local on=def
    local function up()
        if on then
            TweenService:Create(pill,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundColor3=BANANA}):Play()
            TweenService:Create(dot,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position=UDim2.new(0,23,0,3),BackgroundColor3=Color3.new(1,1,1)}):Play()
        else
            TweenService:Create(pill,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundColor3=F.TogOff}):Play()
            TweenService:Create(dot,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position=UDim2.new(0,3,0,3),BackgroundColor3=Color3.fromRGB(160,160,160)}):Play()
        end
    end
    pill.MouseButton1Click:Connect(function() on=not on; up(); if cb then cb(on) end end)
    if def then up() end
end

local function slider(label,mn,mx,df,cb,parent)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,0,0,44); f.BackgroundColor3=Color3.fromRGB(38,38,38)
    f.BackgroundTransparency=0.5; f.BorderSizePixel=0; f.Parent=parent
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-46,0,16); l.Position=UDim2.new(0,10,0,5)
    l.BackgroundTransparency=1; l.Text=label; l.TextColor3=F.Text1; l.TextSize=10
    l.Font=Enum.Font.Gotham; l.TextXAlignment=Enum.TextXAlignment.Left; l.Parent=f
    local v=Instance.new("TextLabel")
    v.Size=UDim2.new(0,34,0,16); v.Position=UDim2.new(1,-42,0,5)
    v.BackgroundTransparency=1; v.Text=tostring(df); v.TextColor3=BANANA; v.TextSize=10
    v.Font=Enum.Font.GothamBold; v.TextXAlignment=Enum.TextXAlignment.Right; v.Parent=f
    local t=Instance.new("Frame")
    t.Size=UDim2.new(1,-20,0,4); t.Position=UDim2.new(0,10,0,30)
    t.BackgroundColor3=F.Track; t.BorderSizePixel=0; t.Parent=f
    Instance.new("UICorner",t).CornerRadius=UDim.new(0,2)
    local fl=Instance.new("Frame")
    fl.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)
    fl.BackgroundColor3=BANANA; fl.BorderSizePixel=0; fl.Parent=t
    Instance.new("UICorner",fl).CornerRadius=UDim.new(0,2)
    local kn=Instance.new("Frame")
    kn.Size=UDim2.new(0,14,0,14)
    kn.Position=UDim2.new((df-mn)/(mx-mn),-7,0,-5)
    kn.BackgroundColor3=F.Text1; kn.BorderSizePixel=0; kn.Parent=f
    Instance.new("UICorner",kn).CornerRadius=UDim.new(0,7)
    local sld=false
    local function upd(inp)
        local rx=math.clamp((inp.Position.X-t.AbsolutePosition.X)/t.AbsoluteSize.X,0,1)
        local val=math.floor(mn+rx*(mx-mn))
        fl.Size=UDim2.new(rx,0,1,0); kn.Position=UDim2.new(rx,-7,0,-5)
        v.Text=tostring(val)
        if cb then cb(val) end
    end
    t.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sld=true; upd(i) end
    end)
    UserInput.InputChanged:Connect(function(i)
        if sld and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upd(i) end
    end)
    UserInput.InputEnded:Connect(function(i)
        if sld and (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) then sld=false end
    end)
end

local function dropdown(label,opts,def,cb,parent)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,0,0,32); f.BackgroundColor3=Color3.fromRGB(38,38,38)
    f.BackgroundTransparency=0.5; f.BorderSizePixel=0; f.Parent=parent
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-96,1,0); l.Position=UDim2.new(0,10,0,0)
    l.BackgroundTransparency=1; l.Text=label; l.TextColor3=F.Text1; l.TextSize=10
    l.Font=Enum.Font.Gotham; l.TextXAlignment=Enum.TextXAlignment.Left
    l.TextTruncate=Enum.TextTruncate.AtEnd; l.Parent=f
    local cbBtn=Instance.new("TextButton")
    cbBtn.Size=UDim2.new(0,88,0,24); cbBtn.Position=UDim2.new(1,-94,0.5,-12)
    cbBtn.BackgroundColor3=F.Surface; cbBtn.BackgroundTransparency=0.2
    cbBtn.BorderSizePixel=0; cbBtn.Text=""; cbBtn.AutoButtonColor=false; cbBtn.Parent=f
    Instance.new("UICorner",cbBtn).CornerRadius=UDim.new(0,4)
    local cbS=Instance.new("UIStroke")
    cbS.Color=F.Brd; cbS.Thickness=1; cbS.Transparency=0.3; cbS.Parent=cbBtn
    local vLbl=Instance.new("TextLabel")
    vLbl.Size=UDim2.new(1,-20,1,0); vLbl.Position=UDim2.new(0,6,0,0)
    vLbl.BackgroundTransparency=1; vLbl.Text=def; vLbl.TextColor3=F.Text1
    vLbl.TextSize=9; vLbl.Font=Enum.Font.GothamBold
    vLbl.TextXAlignment=Enum.TextXAlignment.Left
    vLbl.TextTruncate=Enum.TextTruncate.AtEnd; vLbl.Parent=cbBtn
    local chev=Instance.new("TextLabel")
    chev.Size=UDim2.new(0,14,0,14); chev.Position=UDim2.new(1,-16,0.5,-7)
    chev.BackgroundTransparency=1; chev.Text="\203"; chev.TextColor3=F.Text3
    chev.TextSize=6; chev.Font=Enum.Font.GothamBold; chev.Parent=cbBtn
    local optFrame=nil
    local isOpen=false
    local function closeDD()
        if optFrame then
            TweenService:Create(optFrame,TweenInfo.new(0.15,Enum.EasingStyle.Quad),{BackgroundTransparency=1}):Play()
            spawn(function() wait(0.15) SC(function() if optFrame then optFrame:Destroy() end end) end)
            optFrame=nil
        end
        isOpen=false
        TweenService:Create(chev,TweenInfo.new(0.15),{Rotation=0}):Play()
    end
    local openDD=nil
    local function openDDFn()
        if openDD and openDD~=closeDD then openDD() end
        if isOpen then closeDD(); return end
        isOpen=true
        TweenService:Create(chev,TweenInfo.new(0.15),{Rotation=180}):Play()
        openDD=closeDD
        local maxH=math.min(#opts*24+8,180)
        optFrame=Instance.new("Frame")
        optFrame.Size=UDim2.new(0,260,0,maxH)
        optFrame.Position=UDim2.new(0,0,1,4)
        optFrame.BackgroundColor3=F.Card; optFrame.BorderSizePixel=0
        optFrame.ClipsDescendants=true; optFrame.ZIndex=10; optFrame.Parent=f
        Instance.new("UICorner",optFrame).CornerRadius=UDim.new(0,6)
        local oS=Instance.new("UIStroke")
        oS.Color=F.Brd; oS.Thickness=1; oS.Transparency=0.3; oS.Parent=optFrame
        local oSc=Instance.new("ScrollingFrame")
        oSc.Size=UDim2.new(1,-4,1,-4); oSc.Position=UDim2.new(0,2,0,2)
        oSc.BackgroundTransparency=1; oSc.ScrollBarThickness=2
        oSc.ScrollBarImageColor3=F.Brd; oSc.ZIndex=11
        oSc.CanvasSize=UDim2.new(0,0,0,#opts*24)
        oSc.Parent=optFrame
        local oLy=Instance.new("UIListLayout")
        oLy.SortOrder=Enum.SortOrder.LayoutOrder; oLy.Padding=UDim.new(0,1); oLy.Parent=oSc
        for i,opt in ipairs(opts) do
            local oB=Instance.new("TextButton")
            oB.Size=UDim2.new(1,0,0,23); oB.BackgroundColor3=Color3.fromRGB(56,56,56)
            oB.BackgroundTransparency=0.8; oB.BorderSizePixel=0
            oB.Text=""; oB.AutoButtonColor=false; oB.ZIndex=12; oB.Parent=oSc
            Instance.new("UICorner",oB).CornerRadius=UDim.new(0,4)
            local oL=Instance.new("TextLabel")
            oL.Size=UDim2.new(1,-10,1,0); oL.Position=UDim2.new(0,8,0,0)
            oL.BackgroundTransparency=1; oL.Text=opt; oL.TextColor3=F.Text2
            oL.TextSize=10; oL.Font=Enum.Font.Gotham
            oL.TextXAlignment=Enum.TextXAlignment.Left; oL.ZIndex=13; oL.Parent=oB
            local isSel=(opt==def)
            if isSel then oB.BackgroundTransparency=0.4; oL.TextColor3=BANANA
            end
            oB.MouseButton1Click:Connect(function()
                vLbl.Text=opt; if cb then cb(opt) end; closeDD()
            end)
            oB.InputBegan:Connect(function(inp)
                if inp.UserInputType==Enum.UserInputType.MouseMovement then
                    TweenService:Create(oB,TweenInfo.new(0.1),{BackgroundTransparency=0.3}):Play()
                end
            end)
            oB.InputEnded:Connect(function(inp)
                if inp.UserInputType==Enum.UserInputType.MouseMovement then
                    local t = isSel and 0.4 or 0.8
                    TweenService:Create(oB,TweenInfo.new(0.1),{BackgroundTransparency=t}):Play()
                end
            end)
        end
    end
    cbBtn.MouseButton1Click:Connect(openDDFn)
end

local function btn(label,col,cb,parent)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,0,0,30); b.BackgroundColor3=Color3.fromRGB(38,38,38)
    b.BackgroundTransparency=0.5; b.BorderSizePixel=0
    b.Text=""; b.AutoButtonColor=false; b.Parent=parent
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    local accBar=Instance.new("Frame")
    accBar.Size=UDim2.new(0,3,0.55,0)
    accBar.Position=UDim2.new(0,6,0.22,0)
    accBar.BackgroundColor3=col or BANANA; accBar.BorderSizePixel=0; accBar.Parent=b
    Instance.new("UICorner",accBar).CornerRadius=UDim.new(0,2)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-18,1,0); l.Position=UDim2.new(0,14,0,0)
    l.BackgroundTransparency=1; l.Text=label; l.TextColor3=col or BANANA
    l.TextSize=11; l.Font=Enum.Font.GothamBold
    l.TextXAlignment=Enum.TextXAlignment.Left; l.Parent=b
    b.MouseButton1Click:Connect(function() if cb then cb() end end)
    b.MouseEnter:Connect(function()
        TweenService:Create(b,TweenInfo.new(0.12),{BackgroundTransparency=0.15,BackgroundColor3=Color3.fromRGB(56,56,56)}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b,TweenInfo.new(0.12),{BackgroundTransparency=0.5,BackgroundColor3=Color3.fromRGB(38,38,38)}):Play()
    end)
end

-- ====== BUILD TABS ======

-- Tab 1: Player
local movFrame=Instance.new("ScrollingFrame")
movFrame.Size=UDim2.new(1,0,1,0); movFrame.BackgroundTransparency=1
movFrame.ScrollBarThickness=2; movFrame.ScrollBarImageColor3=F.Brd
movFrame.CanvasSize=UDim2.new(0,0,0,0); movFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
movFrame.Visible=true; movFrame.Parent=contentArea
local movLy=Instance.new("UIListLayout")
movLy.SortOrder=Enum.SortOrder.LayoutOrder; movLy.Padding=UDim.new(0,4); movLy.Parent=movFrame
Instance.new("UIPadding",movFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Player"]=movFrame

section("Movement", movFrame)
slider("Walk Speed", 0, 300, 0, function(v) setSpeed(v) end, movFrame)
slider("Jump Power", 0, 300, 0, function(v) setJump(v) end, movFrame)
toggle("Infinite Jump", false, function(v) setInfJump(v) end, movFrame)
toggle("Fly (WASD+Space/Shift)", false, function(v) if v then startFly() else stopFly() end end, movFrame)
toggle("Noclip", false, function(v) setNoclip(v) end, movFrame)
toggle("God Mode", false, function(v) setGod(v) end, movFrame)
toggle("Anti AFK", true, function(v) setAntiAFK(v) end, movFrame)

section("Stats", movFrame)
dropdown("Stat Priority", {"Melee","Defense","Sword","Gun","Blox Fruit"}, "Melee", function(v) S.StatPriority=v end, movFrame)
toggle("Auto Stats", false, function(v) S.AutoStats=v end, movFrame)

-- Tab 2: Combat
local combatFrame=Instance.new("ScrollingFrame")
combatFrame.Size=UDim2.new(1,0,1,0); combatFrame.BackgroundTransparency=1
combatFrame.ScrollBarThickness=2; combatFrame.ScrollBarImageColor3=F.Brd
combatFrame.CanvasSize=UDim2.new(0,0,0,0); combatFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
combatFrame.Visible=false; combatFrame.Parent=contentArea
local comLy=Instance.new("UIListLayout")
comLy.SortOrder=Enum.SortOrder.LayoutOrder; comLy.Padding=UDim.new(0,4); comLy.Parent=combatFrame
Instance.new("UIPadding",combatFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Combat"]=combatFrame

section("Aimbot", combatFrame)
toggle("RMB Aimbot", false, function(v) setAimbot(v) end, combatFrame)
slider("Smoothness", 10, 95, 50, function(v) S.AimSmooth=v/100 end, combatFrame)
slider("FOV Radius", 30, 300, 120, function(v) S.AimFOV=v end, combatFrame)
slider("Prediction", 0, 20, 0, function(v) S.AimPred=v/10 end, combatFrame)
dropdown("Aim Bone", {"Head","Body"}, "Head", function(v) S.AimBone=v end, combatFrame)
toggle("Target Team", false, function(v) S.AimTeam=v end, combatFrame)
toggle("Visibility Check", true, function(v) S.AimVis=v end, combatFrame)

section("Combat", combatFrame)
toggle("Auto Attack", false, function(v) S.AutoAttack=v; if v then startAttack() else stopAttack() end end, combatFrame)
toggle("Spam M1", false, function(v) S.SpamM1=v end, combatFrame)
toggle("Auto Skills (Z X C)", false, function(v) S.AutoSkill=v end, combatFrame)
toggle("Hitbox Expand", false, function(v) S.HitboxExpand=v end, combatFrame)
toggle("Auto Buso Haki", false, function(v) S.AutoBuso=v end, combatFrame)
toggle("Auto Ken Observation", false, function(v) S.AutoKen=v end, combatFrame)
toggle("Auto Race V3", false, function(v) S.AutoRaceV3=v end, combatFrame)
toggle("Auto Race V4 (Y)", false, function(v) S.AutoRaceV4=v end, combatFrame)

-- Tab 3: Farm
local farmFrame=Instance.new("ScrollingFrame")
farmFrame.Size=UDim2.new(1,0,1,0); farmFrame.BackgroundTransparency=1
farmFrame.ScrollBarThickness=2; farmFrame.ScrollBarImageColor3=F.Brd
farmFrame.CanvasSize=UDim2.new(0,0,0,0); farmFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
farmFrame.Visible=false; farmFrame.Parent=contentArea
local farmLy=Instance.new("UIListLayout")
farmLy.SortOrder=Enum.SortOrder.LayoutOrder; farmLy.Padding=UDim.new(0,4); farmLy.Parent=farmFrame
Instance.new("UIPadding",farmFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Farm"]=farmFrame

section("Auto Farm", farmFrame)
toggle("Auto Level Farm", false, function(v) toggleAutoLevel(v) end, farmFrame)
toggle("Auto Quest", false, function(v) toggleAutoQuest(v) end, farmFrame)
toggle("Auto Bring Mob", false, function(v) S.AutoBring=v end, farmFrame)
toggle("Auto Hop (No Target)", false, function(v) S.AutoHop=v end, farmFrame)
slider("Farm Range", 50, 500, 200, function(v) S.FarmRange=v end, farmFrame)
slider("Attack Range", 30, 300, 150, function(v) S.AttackRange=v end, farmFrame)
slider("Tween Speed", 100, 500, 300, function(v) S.TweenSpeed=v end, farmFrame)

section("Boss Farm", farmFrame)
dropdown("Select Boss", {"Cake Prince","Dough King","Darkbeard","Soul Reaper","Rip Indra","Order","Longma","Stone","Cake Queen"}, "Cake Prince", function(v) S.SelectedBoss=v end, farmFrame)
toggle("Auto Boss", false, function(v) S.AutoBoss=v; if v then startFarm() else stopFarm() end end, farmFrame)

section("Mob Farm", farmFrame)
toggle("Auto Mob", false, function(v) S.AutoMob=v; if v then startFarm() else stopFarm() end end, farmFrame)
toggle("Auto Chest", false, function(v) S.AutoChest=v; if v then startFarm() else stopFarm() end end, farmFrame)
toggle("Auto Sea Event", false, function(v) S.AutoSea=v; if v then startFarm() else stopFarm() end end, farmFrame)

section("Material Farm", farmFrame)
dropdown("Select Material", {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail","Ectoplasm","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Mini Tusk"}, "Scrap Metal", function(v) S.SelectedMaterial=v end, farmFrame)
toggle("Auto Material", false, function(v) S.AutoMaterial=v; if v then startFarm() else stopFarm() end end, farmFrame)

section("Mastery Farm", farmFrame)
toggle("Auto Mastery", false, function(v) S.AutoMastery=v; if v then startFarm() else stopFarm() end end, farmFrame)

section("Raid", farmFrame)
toggle("Auto Raid", false, function(v) S.AutoRaid=v; if v then startRaid() else stopRaid() end end, farmFrame)
toggle("Auto Buy Chip", false, function(v) S.AutoBuyChip=v end, farmFrame)

-- Tab 4: Quest System
local questFrame=Instance.new("ScrollingFrame")
questFrame.Size=UDim2.new(1,0,1,0); questFrame.BackgroundTransparency=1
questFrame.ScrollBarThickness=2; questFrame.ScrollBarImageColor3=F.Brd
questFrame.CanvasSize=UDim2.new(0,0,0,0); questFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
questFrame.Visible=false; questFrame.Parent=contentArea
local questLy=Instance.new("UIListLayout")
questLy.SortOrder=Enum.SortOrder.LayoutOrder; questLy.Padding=UDim.new(0,4); questLy.Parent=questFrame
Instance.new("UIPadding",questFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Quest"]=questFrame

section("Quest System", questFrame)
toggle("Enable Quest System", false, function(v) toggleQuestSystem(v) end, questFrame)
toggle("Auto Take Quest", false, function(v) S.AutoTakeQuest=v end, questFrame)
toggle("Auto Complete Quest", false, function(v) S.AutoCompleteQuest=v end, questFrame)
toggle("Auto Farm Quest", false, function(v) toggleAutoFarmQuest(v) end, questFrame)

section("Quest Settings", questFrame)
dropdown("Select Quest Mob", {"Forest Pirate","Living Zombie","Demonic Soul","Hydra Enforcer","Venomous Assailant","Mythological Pirate","Cake Guard","Baking Staff"}, "Forest Pirate", function(v) S.QuestMob=v end, questFrame)
dropdown("Select Quest Name", {"CitizenQuest","HauntedQuest1","HauntedQuest2","DeepForestIsland","VenomCrewQuest","CakeQuest1","CakeQuest2"}, "CitizenQuest", function(v) S.QuestName=v end, questFrame)
slider("Quest ID", 1, 5, 1, function(v) S.QuestID=v end, questFrame)

section("Quest Info", questFrame)
local qInfo=Instance.new("Frame")
qInfo.Size=UDim2.new(1,0,0,40); qInfo.BackgroundColor3=Color3.fromRGB(38,38,38)
qInfo.BackgroundTransparency=0.5; qInfo.BorderSizePixel=0; qInfo.Parent=questFrame
Instance.new("UICorner",qInfo).CornerRadius=UDim.new(0,6)
local qInfoL=Instance.new("TextLabel")
qInfoL.Size=UDim2.new(1,-12,0,16); qInfoL.Position=UDim2.new(0,6,0,4)
qInfoL.BackgroundTransparency=1; qInfoL.Text="Mob: "..S.QuestMob
qInfoL.TextColor3=F.Text2; qInfoL.TextSize=10; qInfoL.Font=Enum.Font.Gotham
qInfoL.TextXAlignment=Enum.TextXAlignment.Left; qInfoL.Parent=qInfo
local qInfoL2=Instance.new("TextLabel")
qInfoL2.Size=UDim2.new(1,-12,0,16); qInfoL2.Position=UDim2.new(0,6,0,22)
qInfoL2.BackgroundTransparency=1; qInfoL2.Text="Quest: "..S.QuestName.." ID: "..S.QuestID
qInfoL2.TextColor3=F.Text3; qInfoL2.TextSize=9; qInfoL2.Font=Enum.Font.Gotham
qInfoL2.TextXAlignment=Enum.TextXAlignment.Left; qInfoL2.Parent=qInfo
spawn(function()
    while true do
        wait(1)
        pcall(function()
            qInfoL.Text="Mob: "..S.QuestMob
            qInfoL2.Text="Quest: "..S.QuestName.." ID: "..S.QuestID
        end)
    end
end)

-- Tab 5: Visual
local visFrame=Instance.new("ScrollingFrame")
visFrame.Size=UDim2.new(1,0,1,0); visFrame.BackgroundTransparency=1
visFrame.ScrollBarThickness=2; visFrame.ScrollBarImageColor3=F.Brd
visFrame.CanvasSize=UDim2.new(0,0,0,0); visFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
visFrame.Visible=false; visFrame.Parent=contentArea
local visLy=Instance.new("UIListLayout")
visLy.SortOrder=Enum.SortOrder.LayoutOrder; visLy.Padding=UDim.new(0,4); visLy.Parent=visFrame
Instance.new("UIPadding",visFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Visual"]=visFrame

section("ESP", visFrame)
toggle("Enable ESP", false, function(v) setESP(v) end, visFrame)
toggle("Boxes", true, function(v) S.ESPBox=v end, visFrame)
toggle("Names", true, function(v) S.ESPName=v end, visFrame)
toggle("Health Bars", true, function(v) S.ESPHealth=v end, visFrame)
toggle("Distance", true, function(v) S.ESPDist=v end, visFrame)

section("World", visFrame)
toggle("Fullbright", false, function(v) setFullbright(v) end, visFrame)
toggle("No Fog", false, function(v) setNoFog(v) end, visFrame)
toggle("FPS Boost", false, function(v) setFPSBoost(v) end, visFrame)

-- Tab 6: Settings
local setgFrame=Instance.new("ScrollingFrame")
setgFrame.Size=UDim2.new(1,0,1,0); setgFrame.BackgroundTransparency=1
setgFrame.ScrollBarThickness=2; setgFrame.ScrollBarImageColor3=F.Brd
setgFrame.CanvasSize=UDim2.new(0,0,0,0); setgFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
setgFrame.Visible=false; setgFrame.Parent=contentArea
local setgLy=Instance.new("UIListLayout")
setgLy.SortOrder=Enum.SortOrder.LayoutOrder; setgLy.Padding=UDim.new(0,4); setgLy.Parent=setgFrame
Instance.new("UIPadding",setgFrame).PaddingBottom=UDim.new(0,8)
tabFrames["Settings"]=setgFrame

section("Utility", setgFrame)
btn("Server Hop", BANANA, function() serverHop() end, setgFrame)
btn("Rejoin Server", F.Info, function() SC(function() TeleportService:Teleport(game.PlaceId, LP) end) end, setgFrame)
btn("Respawn Character", F.Warn, function() SC(function() local c=LP.Character if c then c:BreakJoints() end end) end, setgFrame)

section("Auto Features", setgFrame)
toggle("Auto Store Fruit", false, function(v) S.AutoStoreFruit=v end, setgFrame)
toggle("Auto Redeem Codes", false, function(v) S.AutoRedeem=v end, setgFrame)
toggle("Auto Buy Items", false, function(v) S.AutoBuy=v end, setgFrame)

section("Info", setgFrame)
local infoF=Instance.new("Frame")
infoF.Size=UDim2.new(1,0,0,60); infoF.BackgroundColor3=Color3.fromRGB(38,38,38)
infoF.BackgroundTransparency=0.5; infoF.BorderSizePixel=0; infoF.Parent=setgFrame
Instance.new("UICorner",infoF).CornerRadius=UDim.new(0,6)
local infoL=Instance.new("TextLabel")
infoL.Size=UDim2.new(1,-12,0,20); infoL.Position=UDim2.new(0,6,0,4)
infoL.BackgroundTransparency=1; infoL.Text="Level: "..getLevel().." | Beli: "..getBeli().." | Frags: "..getFragments()
infoL.TextColor3=F.Text2; infoL.TextSize=10; infoL.Font=Enum.Font.Gotham
infoL.TextXAlignment=Enum.TextXAlignment.Left; infoL.Parent=infoF
local infoL2=Instance.new("TextLabel")
infoL2.Size=UDim2.new(1,-12,0,16); infoL2.Position=UDim2.new(0,6,0,28)
infoL2.BackgroundTransparency=1; infoL2.Text="Team: "..getTeam().." | Bounty: "..getBounty()
infoL2.TextColor3=F.Text3; infoL2.TextSize=9; infoL2.Font=Enum.Font.Gotham
infoL2.TextXAlignment=Enum.TextXAlignment.Left; infoL2.Parent=infoF
spawn(function()
    while true do
        wait(1)
        pcall(function()
            infoL.Text="Level: "..getLevel().." | Beli: "..getBeli().." | Frags: "..getFragments()
            infoL2.Text="Team: "..getTeam().." | Bounty: "..getBounty()
        end)
    end
end)

section("Danger Zone", setgFrame)
btn("DISABLE ALL", F.Warn, function()
    stopFly(); setNoclip(false); setGod(false); setInfJump(false)
    setAimbot(false); setESP(false); setFullbright(false); setNoFog(false)
    setSpeed(0); setJump(0); stopFarm(); stopRaid(); stopAttack()
    notify("System","All features disabled",F.Warn)
end, setgFrame)
btn("DESTROY HUB", F.Bad, function()
    stopFly(); clearESP(); setNoclip(false); setGod(false)
    setInfJump(false); setAimbot(false); stopFarm(); stopRaid(); stopAttack()
    for _,c in pairs(connections) do if c then pcall(function() c:disconnect() end) end end
    sg:Destroy()
end, setgFrame)

-- ====== DRAG ======
local drag,dStart,sPos=false
local dragArea=Instance.new("Frame")
dragArea.Size=UDim2.new(1,0,0,52); dragArea.BackgroundTransparency=1
dragArea.ZIndex=5; dragArea.Parent=main
dragArea.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        drag=true; dStart=i.Position; sPos=main.Position
        i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then drag=false end end)
    end
end)
dragArea.InputChanged:Connect(function(i)
    if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-dStart
        main.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
        bd.Position=main.Position
    end
end)

-- ====== AIMBOT FOV CIRCLE ======
local drawSG=Instance.new("ScreenGui")
drawSG.Name="BCH_Draw"; drawSG.ResetOnSpawn=false
drawSG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
SC(function() drawSG.Parent=game:GetService("CoreGui") end)
if not drawSG.Parent then drawSG.Parent=LP:WaitForChild("PlayerGui") end

local fovCirc=Instance.new("Frame")
fovCirc.Size=UDim2.new(0,240,0,240)
fovCirc.Position=UDim2.new(0.5,-120,0.5,-120)
fovCirc.BackgroundTransparency=1; fovCirc.BorderSizePixel=0
fovCirc.Rotation=0; fovCirc.Parent=drawSG
local circInner=Instance.new("Frame")
circInner.Size=UDim2.new(0.92,0,0.92,0)
circInner.Position=UDim2.new(0.04,0,0.04,0)
circInner.BackgroundColor3=Color3.new(0,0,0); circInner.BackgroundTransparency=0.85
circInner.BorderSizePixel=0; circInner.Parent=fovCirc
Instance.new("UICorner",circInner).CornerRadius=UDim.new(1,0)
local circStroke=Instance.new("UIStroke")
circStroke.Color=BANANA; circStroke.Thickness=1.5; circStroke.Transparency=0.5
circStroke.Parent=fovCirc
Instance.new("UICorner",fovCirc).CornerRadius=UDim.new(1,0)
aimCircle=fovCirc
fovCirc.Visible=false

local fovCon=RunService.Heartbeat:connect(function()
    if aimCircle then
        local sz=S.AimFOV*2
        aimCircle.Size=UDim2.new(0,sz,0,sz)
        aimCircle.Position=UDim2.new(0.5,-sz/2,0.5,-sz/2)
        aimCircle.Visible=S.Aimbot
    end
end)
table.insert(connections, fovCon)

-- ====== WATERMARK ======
local wm=Instance.new("TextLabel")
wm.Size=UDim2.new(0,220,0,18); wm.Position=UDim2.new(0,10,1,-26)
wm.BackgroundColor3=F.Bg; wm.BackgroundTransparency=0.4
wm.Text="Banana Cat Ultimate | All Features | Vxeze"
wm.TextColor3=BANANA; wm.TextSize=10; wm.Font=Enum.Font.GothamBold
wm.TextXAlignment=Enum.TextXAlignment.Left; wm.Parent=sg
Instance.new("UICorner",wm).CornerRadius=UDim.new(0,4)
local wS=Instance.new("UIStroke")
wS.Color=BANANA; wS.Thickness=1; wS.Transparency=0.6; wS.Parent=wm

-- ====== CAT TOGGLE INDICATOR ======
local catFrame=Instance.new("Frame")
catFrame.Size=UDim2.new(0,28,0,28)
catFrame.Position=UDim2.new(1,-34,1,-34)
catFrame.BackgroundColor3=BANANA; catFrame.BackgroundTransparency=0.6
catFrame.BorderSizePixel=0; catFrame.Parent=sg
Instance.new("UICorner",catFrame).CornerRadius=UDim.new(0,14)
local catLbl=Instance.new("TextLabel")
catLbl.Size=UDim2.new(1,0,1,0); catLbl.BackgroundTransparency=1
catLbl.Text="C"; catLbl.TextColor3=Color3.new(0,0,0)
catLbl.TextSize=14; catLbl.Font=Enum.Font.GothamBold
catLbl.ZIndex=2; catLbl.Parent=catFrame
catFrame.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        main.Visible=not main.Visible
        bd.Visible=main.Visible
        if main.Visible then
            TweenService:Create(catFrame,TweenInfo.new(0.2),{BackgroundColor3=BANANA,BackgroundTransparency=0.6}):Play()
        else
            TweenService:Create(catFrame,TweenInfo.new(0.2),{BackgroundColor3=BANANA_DARK,BackgroundTransparency=0.3}):Play()
        end
    end
end)

-- ====== STARTUP ======
tabBtns["Player"].TextColor3 = BANANA
TweenService:Create(tabBtns["Player"],TweenInfo.new(0.15),{BackgroundTransparency=0.4}):Play()
local firstInd=tabBtns["Player"]:FindFirstChildWhichIsA("Frame")
if firstInd then TweenService:Create(firstInd,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play() end

notify("Banana Cat Ultimate","Loaded! 6 tabs, All features + Quest System",BANANA)
notify("Features","Speed, Fly, Aimbot, ESP, Farm, Raid, Quest, + more",F.Ok)

print("Banana Cat Hub Ultimate v6 loaded!")
print("==========================================")
print("Tabs: Player | Combat | Farm | Quest | Visual | Settings")
print("Features: All-in-One Blox Fruits Hack + Quest System")
print("==========================================")