-- ============================================================
-- TUNG LINH HUB - LOADER TỐI ƯU + KEY SYSTEM
-- ============================================================

local VALID_KEYS = {
    "TUNG-LINH-PREMIUM-2026",
    "TL-PRO-2026",
    "TUNG-LINH-VIP-999",
    "TL-BLOXFRUIT-FREE",
}

-- Cache script để không phải tải lại
local function getCachedScript()
    -- Kiểm tra cache trong getgenv
    if getgenv().__TUNG_LINH_CACHE_SCRIPT then
        return getgenv().__TUNG_LINH_CACHE_SCRIPT
    end
    
    -- Kiểm tra file local
    if isfile and isfile("tunglinh_bf_main.lua") then
        local content = readfile("tunglinh_bf_main.lua")
        if content and #content > 1000 then
            getgenv().__TUNG_LINH_CACHE_SCRIPT = content
            return content
        end
    end
    
    return nil
end

-- Tải và cache script
local function loadAndCacheScript()
    local cached = getCachedScript()
    if cached then
        print("[TUNG LINH] Dùng script cache!")
        return cached
    end
    
    print("[TUNG LINH] Tải script...")
    
    -- Tải với retry
    local scriptContent = ""
    local maxRetries = 3
    
    for attempt = 1, maxRetries do
        local success, result = pcall(function()
            return game:HttpGet("https://banana-hub.xyz/scripts/bf_main.lua")
        end)
        
        if success and result and #result > 1000 then
            scriptContent = result
            print("[TUNG LINH] Tải thành công! " .. #result .. " ký tự")
            break
        else
            print("[TUNG LINH] Thử lại lần " .. attempt .. "/" .. maxRetries)
            task.wait(3)
        end
    end
    
    if #scriptContent < 1000 then
        return nil
    end
    
    -- Cache vào getgenv
    getgenv().__TUNG_LINH_CACHE_SCRIPT = scriptContent
    
    -- Lưu file nếu hỗ trợ
    if writefile then
        pcall(function()
            writefile("tunglinh_bf_main.lua", scriptContent)
        end)
    end
    
    return scriptContent
end

-- Kiểm tra key
local function checkKey(inputKey)
    inputKey = inputKey:upper():gsub("%s+", "")
    for _, validKey in ipairs(VALID_KEYS) do
        if inputKey == validKey:upper() then
            return true
        end
    end
    return false
end

-- Kick player
local function kickPlayer(reason)
    pcall(function()
        game.Players.LocalPlayer:Kick("TUNG LINH HUB: " .. reason)
    end)
end

-- UI nhập key
local function showKeyUI()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    if playerGui:FindFirstChild("TungLinhKeyUI") then
        playerGui.TungLinhKeyUI:Destroy()
    end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "TungLinhKeyUI"
    gui.ResetOnSpawn = false
    gui.Parent = playerGui
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.5
    bg.Parent = gui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 280)
    frame.Position = UDim2.new(0.5, -175, 0.5, -140)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.Parent = bg
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "TUNG LINH HUB"
    title.TextColor3 = Color3.fromRGB(0, 255, 136)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 22
    title.Parent = frame
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0, 40)
    subtitle.Text = "Nhập key premium"
    subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    subtitle.Font = Enum.Font.SourceSans
    subtitle.TextSize = 13
    subtitle.Parent = frame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 280, 0, 40)
    textBox.Position = UDim2.new(0.5, -140, 0, 80)
    textBox.PlaceholderText = "Nhập key..."
    textBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 15
    textBox.Parent = frame
    
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 30)
    status.Position = UDim2.new(0, 0, 0, 130)
    status.Name = "Status"
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(255, 200, 0)
    status.Font = Enum.Font.SourceSans
    status.TextSize = 13
    status.Parent = frame
    
    local loadingBar = Instance.new("Frame")
    loadingBar.Size = UDim2.new(0, 280, 0, 6)
    loadingBar.Position = UDim2.new(0.5, -140, 0, 160)
    loadingBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    loadingBar.Visible = false
    loadingBar.Name = "LoadingBar"
    loadingBar.Parent = frame
    
    local loadingFill = Instance.new("Frame")
    loadingFill.Size = UDim2.new(0, 0, 1, 0)
    loadingFill.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
    loadingFill.Name = "Fill"
    loadingFill.Parent = loadingBar
    
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Size = UDim2.new(0, 150, 0, 45)
    confirmBtn.Position = UDim2.new(0.5, -75, 0, 180)
    confirmBtn.Text = "XÁC NHẬN"
    confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
    confirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    confirmBtn.Font = Enum.Font.SourceSansBold
    confirmBtn.TextSize = 16
    confirmBtn.Parent = frame
    
    local function startLoad(scriptContent)
        loadingBar.Visible = true
        status.Text = "Đang tải script..."
        status.TextColor3 = Color3.fromRGB(255, 200, 0)
        
        task.spawn(function()
            -- Giả lập progress
            for i = 1, 100 do
                loadingFill.Size = UDim2.new(i / 100, 0, 1, 0)
                task.wait(0.02)
            end
            
            -- Chạy script
            local success, err = pcall(function()
                loadstring(scriptContent)()
            end)
            
            if success then
                gui:Destroy()
            else
                status.Text = "Lỗi: " .. tostring(err):sub(1, 50)
                status.TextColor3 = Color3.fromRGB(255, 0, 0)
                loadingBar.Visible = false
            end
        end)
    end
    
    local function tryKey()
        local inputKey = textBox.Text
        
        if checkKey(inputKey) then
            status.Text = "✅ Key đúng! Đang tải..."
            status.TextColor3 = Color3.fromRGB(0, 255, 136)
            confirmBtn.Visible = false
            textBox.Visible = false
            
            task.spawn(function()
                local scriptContent = loadAndCacheScript()
                
                if scriptContent then
                    startLoad(scriptContent)
                else
                    status.Text = "❌ Không tải được script!"
                    status.TextColor3 = Color3.fromRGB(255, 0, 0)
                    confirmBtn.Visible = true
                    textBox.Visible = true
                end
            end)
        else
            status.Text = "❌ Key sai!"
            status.TextColor3 = Color3.fromRGB(255, 0, 0)
            textBox.Text = ""
            
            getgenv().__keyAttempts = (getgenv().__keyAttempts or 0) + 1
            
            if getgenv().__keyAttempts >= 5 then
                kickPlayer("Nhập sai quá nhiều")
            end
        end
    end
    
    confirmBtn.MouseButton1Click:Connect(tryKey)
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then tryKey() end
    end)
end

-- Khởi tạo
getgenv().__keyAttempts = 0
showKeyUI()