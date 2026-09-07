-- ============================================================
-- TUNG LINH HUB - UI KEY + VIỀN RAINBOW ĐỘNG
-- ============================================================

local VALID_KEYS = {
    "TUNG-LINH-PREMIUM-2026",
    "TL-PRO-2026",
    "TUNG-LINH-VIP-999",
    "TL-BLOXFRUIT-FREE",
}

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ============================================================
-- TẢI SCRIPT TRƯỚC
-- ============================================================
local function preloadScript()
    if getgenv().__TL_SCRIPT_CACHE then
        return getgenv().__TL_SCRIPT_CACHE
    end
    
    local success, result = pcall(function()
        return game:HttpGet("https://banana-hub.xyz/scripts/bf_main.lua")
    end)
    
    if success and result and #result > 1000 then
        getgenv().__TL_SCRIPT_CACHE = result
        return result
    end
    
    return nil
end

-- ============================================================
-- TẠO VIỀN RAINBOW ĐỘNG
-- ============================================================
local function createRainbowBorder(parent)
    -- Container viền
    local borderContainer = Instance.new("Frame")
    borderContainer.Size = UDim2.new(1, 6, 1, 6)
    borderContainer.Position = UDim2.new(0, -3, 0, -3)
    borderContainer.BackgroundTransparency = 1
    borderContainer.ZIndex = 10
    borderContainer.Parent = parent
    
    -- Tạo 4 cạnh viền
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 2)
    topBar.Position = UDim2.new(0, 0, 0, 0)
    topBar.Name = "TopBar"
    topBar.Parent = borderContainer
    
    local bottomBar = Instance.new("Frame")
    bottomBar.Size = UDim2.new(1, 0, 0, 2)
    bottomBar.Position = UDim2.new(0, 0, 1, -2)
    bottomBar.Name = "BottomBar"
    bottomBar.Parent = borderContainer
    
    local leftBar = Instance.new("Frame")
    leftBar.Size = UDim2.new(0, 2, 1, 0)
    leftBar.Position = UDim2.new(0, 0, 0, 0)
    leftBar.Name = "LeftBar"
    leftBar.Parent = borderContainer
    
    local rightBar = Instance.new("Frame")
    rightBar.Size = UDim2.new(0, 2, 1, 0)
    rightBar.Position = UDim2.new(1, -2, 0, 0)
    rightBar.Name = "RightBar"
    rightBar.Parent = borderContainer
    
    -- Gradient màu bằng UIStroke
    for _, bar in ipairs({topBar, bottomBar, leftBar, rightBar}) do
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = Color3.fromRGB(255, 0, 0)
        uiStroke.Thickness = 2
        uiStroke.Parent = bar
    end
    
    -- Hiệu ứng màu chạy
    local colors = {
        Color3.fromRGB(255, 0, 0),      -- Đỏ
        Color3.fromRGB(255, 165, 0),    -- Cam
        Color3.fromRGB(255, 255, 0),    -- Vàng
        Color3.fromRGB(0, 255, 0),      -- Xanh lá
        Color3.fromRGB(0, 255, 255),    -- Xanh dương
        Color3.fromRGB(0, 0, 255),      -- Blue
        Color3.fromRGB(255, 0, 255),    -- Tím
        Color3.fromRGB(255, 0, 128),    -- Hồng
    }
    
    local colorIndex = 1
    
    -- Cập nhật màu mỗi 0.3 giây
    task.spawn(function()
        while borderContainer.Parent do
            for _, bar in ipairs({topBar, bottomBar, leftBar, rightBar}) do
                if bar:FindFirstChild("UIStroke") then
                    -- Lấy 2 màu tạo gradient
                    local color1 = colors[colorIndex]
                    local color2 = colors[(colorIndex % #colors) + 1]
                    
                    -- Tween màu
                    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
                    local stroke = bar.UIStroke
                    
                    local tween = TweenService:Create(stroke, tweenInfo, {
                        Color = color2,
                    })
                    tween:Play()
                end
            end
            
            colorIndex = (colorIndex % #colors) + 1
            task.wait(0.3)
        end
    end)
    
    -- Hiệu ứng nhấp nháy (độ sáng)
    task.spawn(function()
        local bright = true
        while borderContainer.Parent do
            for _, bar in ipairs({topBar, bottomBar, leftBar, rightBar}) do
                if bar:FindFirstChild("UIStroke") then
                    local stroke = bar.UIStroke
                    local target = bright and 3 or 1.5
                    
                    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine)
                    local tween = TweenService:Create(stroke, tweenInfo, {
                        Thickness = target,
                    })
                    tween:Play()
                end
            end
            bright = not bright
            task.wait(0.5)
        end
    end)
    
    return borderContainer
end

-- ============================================================
-- UI KEY + RAINBOW BORDER
-- ============================================================
local function showKeyUI(scriptContent)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "TungLinhKey"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui
    
    -- Background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.4
    bg.Parent = gui
    
    -- Frame chính
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 250, 0, 150)
    frame.Position = UDim2.new(0.5, -125, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    frame.BorderSizePixel = 0
    frame.ZIndex = 1
    frame.Parent = bg
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    -- ============================================================
    -- THÊM VIỀN RAINBOW
    -- ============================================================
    createRainbowBorder(frame)
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Text = "TUNG LINH HUB"
    title.TextColor3 = Color3.fromRGB(0, 255, 136)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 16
    title.BackgroundTransparency = 1
    title.ZIndex = 2
    title.Parent = frame
    
    -- TextBox
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 35)
    textBox.Position = UDim2.new(0.5, -100, 0, 40)
    textBox.PlaceholderText = "Nhập key..."
    textBox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 14
    textBox.ZIndex = 2
    textBox.Parent = frame
    
    -- Status
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0, 80)
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(255, 200, 0)
    status.Font = Enum.Font.SourceSans
    status.TextSize = 11
    status.BackgroundTransparency = 1
    status.ZIndex = 2
    status.Parent = frame
    
    -- Nút xác nhận
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 35)
    btn.Position = UDim2.new(0.5, -60, 0, 105)
    btn.Text = "XÁC NHẬN"
    btn.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.ZIndex = 2
    btn.Parent = frame
    
    -- ============================================================
    -- ANIMATION MỞ: Scale từ giữa
    -- ============================================================
    frame.Size = UDim2.new(0, 25, 0, 15)
    frame.Position = UDim2.new(0.5, -12, 0.5, -7)
    frame.BackgroundTransparency = 1
    
    local openInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local openGoal = {
        Size = UDim2.new(0, 250, 0, 150),
        Position = UDim2.new(0.5, -125, 0.5, -75),
        BackgroundTransparency = 0,
    }
    local openTween = TweenService:Create(frame, openInfo, openGoal)
    openTween:Play()
    
    -- ============================================================
    -- XỬ LÝ KEY
    -- ============================================================
    local function checkAndRun()
        local key = textBox.Text:upper():gsub("%s+", "")
        
        local valid = false
        for _, vk in ipairs(VALID_KEYS) do
            if key == vk:upper() then
                valid = true
                break
            end
        end
        
        if valid then
            status.Text = "✅ Key đúng!"
            status.TextColor3 = Color3.fromRGB(0, 255, 136)
            
            -- Thu nhỏ rồi đóng
            local shrinkInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            local shrinkGoal = {
                Size = UDim2.new(0, 25, 0, 15),
                Position = UDim2.new(0.5, -12, 0.5, -7),
                BackgroundTransparency = 1,
            }
            local shrinkTween = TweenService:Create(frame, shrinkInfo, shrinkGoal)
            shrinkTween:Play()
            
            task.delay(0.3, function()
                gui:Destroy()
                
                task.spawn(function()
                    task.wait(1)
                    
                    local success, err = pcall(function()
                        loadstring(scriptContent)()
                    end)
                    
                    if not success then
                        pcall(function()
                            game.StarterGui:SetCore("SendNotification", {
                                Title = "TUNG LINH HUB",
                                Text = "Lỗi: " .. tostring(err):sub(1, 50),
                                Duration = 5,
                            })
                        end)
                    end
                end)
            end)
        else
            status.Text = "❌ Key sai!"
            status.TextColor3 = Color3.fromRGB(255, 0, 0)
            textBox.Text = ""
            
            -- Rung nhẹ
            for i = 1, 3 do
                frame.Position = UDim2.new(0.5, -125 + (i % 2 == 0 and 5 or -5), 0.5, -75)
                task.wait(0.05)
            end
            frame.Position = UDim2.new(0.5, -125, 0.5, -75)
        end
    end
    
    btn.MouseButton1Click:Connect(checkAndRun)
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then checkAndRun() end
    end)
end

-- ============================================================
-- KHỞI TẠO
-- ============================================================
task.spawn(function()
    local scriptContent = preloadScript()
    
    if scriptContent then
        showKeyUI(scriptContent)
    end
end)