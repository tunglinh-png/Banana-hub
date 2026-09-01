--[[
    BANANA HUB - BLOX FRUIT SIÊU CẤP
    Tổng hợp tất cả tính năng + Chống Lag khi mở script
]]

-- ================= CHỐNG LAG KHI MỞ SCRIPT =================
local function ChốngLagKhiMở()
    pcall(function()
        -- Giảm chất lượng đồ họa ngay lập tức
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        
        -- Giảm render distance
        if settings() then
            settings().Rendering.QualityLevel = 1
        end
        
        -- Tắt hiệu ứng nước
        game:GetService("Workspace").Terrain.WaterWaveSize = 0
        game:GetService("Workspace").Terrain.WaterWaveSpeed = 0
        
        -- Xóa particles
        for _, VatThe in pairs(workspace:GetDescendants()) do
            if VatThe:IsA("ParticleEmitter") or VatThe:IsA("Smoke") or VatThe:IsA("Fire") then
                VatThe.Enabled = false
            end
            if VatThe:IsA("BloomEffect") or VatThe:IsA("BlurEffect") or VatThe:IsA("DepthOfFieldEffect") then
                VatThe.Enabled = false
            end
            if VatThe:IsA("Decal") or VatThe:IsA("Texture") then
                if not VatThe.Parent:IsA("Player") then
                    VatThe:Destroy()
                end
            end
        end
        
        -- Giảm âm thanh
        for _, AmThanh in pairs(workspace:GetDescendants()) do
            if AmThanh:IsA("Sound") then
                AmThanh.Volume = 0.1
            end
        end
    end)
end

-- Chạy chống lag ngay lập tức
ChốngLagKhiMở()

-- ================= TIỆN ÍCH =================
local NguoiChoi = game.Players.LocalPlayer
local DichVuNguoiChoi = game:GetService("Players")
local DichVuDichChuyen = game:GetService("TeleportService")
local DichVuChay = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local DichVuUngDung = game:GetService("VirtualUser")
local ThietBi = game:GetService("CoreGui")
local KhoChung = game:GetService("ReplicatedStorage")
local DichVuNhap = game:GetService("UserInputService")
local DichVuLam = game:GetService("Lighting")
local DichVuBo = game:GetService("TweenService")

-- ================= CHỐNG KICK =================
local function ChongKick()
    local KichCu = NguoiChoi.Kick
    NguoiChoi.Kick = function(...) return nil end
    local KiemTraCu = hookmetamethod(game, "__namecall", function(tu, ...)
        local PhuongThuc = getnamecallmethod()
        if PhuongThuc == "Kick" then return nil end
        return KiemTraCu(tu, ...)
    end)
end
spawn(ChongKick)

-- ================= CHỐNG AFK =================
local function ChongAFK()
    NguoiChoi.Idled:Connect(function()
        DichVuUngDung:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        DichVuUngDung:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
    
    spawn(function()
        while ChayUngDung do
            wait(30)
            DichVuUngDung:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(0.5)
            DichVuUngDung:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)
end
spawn(ChongAFK)

-- ================= CẤU HÌNH =================
local DangFarmLevel = false
local DangFarmMastery = false
local DangGomQuai = false
local DangBay = false
local TocDoDanh = 1
local KhoangCach = 100
local DanhThuong = true
local XuyenTuong = false
local TocDoBay = 50
local DungChieuZ = false
local DungChieuX = false
local DungChieuC = false
local DungChieuV = false
local DungChieuF = false
local BatHakiNen = false
local BatHakiVuTrang = false
local NeChieu = false
local BayKhiYeu = false
local NguongMau = 30
local ChongChet = false
local TuHoiSinh = false
local ThongBaoBat = true
local ChốngLag = true
local LoaiMastery = "Melee"
local TocDoNguoiChoi = 16
local DoCaoNhay = 50
local NhayVoHan = false
local NhayLienTuc = false
local TangTocDo = false
local NhayCao = false
local TuDongNhat = false
local TuDongMoRuong = false

-- Chế độ bay
local CheDoBay = "Bay Tự Do"
local BayXungQuanh = false
local BayHinhTron = false
local BayTamGiac = false
local BanKinhBay = 30
local TocDoXoay = 1

-- Menu state
local MenuMo = false
local MenuRutGon = false

-- Hop Server
local DangHopServer = false
local KichHoatHopFullMoon = false
local KichHoatHopBoss = false

-- ================= TẠO THÔNG BÁO =================
local function TaoThongBao(TieuDe, NoiDung, ThoiGian)
    if not ThongBaoBat then return end
    pcall(function()
        local ManHinhTB = Instance.new("ScreenGui")
        ManHinhTB.Name = "ThongBao"
        ManHinhTB.Parent = ThietBi
        ManHinhTB.ResetOnSpawn = false
        
        local Khung = Instance.new("Frame")
        Khung.Size = UDim2.new(0, 300, 0, 80)
        Khung.Position = UDim2.new(0.5, -150, 0.5, -40)
        Khung.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Khung.BorderSizePixel = 0
        Khung.Parent = ManHinhTB
        
        local Vien = Instance.new("UIStroke")
        Vien.Thickness = 2
        Vien.Color = Color3.fromRGB(255, 200, 0)
        Vien.Parent = Khung
        
        local TieuDeLabel = Instance.new("TextLabel")
        TieuDeLabel.Size = UDim2.new(1, 0, 0, 30)
        TieuDeLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TieuDeLabel.BorderSizePixel = 0
        TieuDeLabel.Text = TieuDe
        TieuDeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TieuDeLabel.TextSize = 16
        TieuDeLabel.Font = Enum.Font.SourceSansBold
        TieuDeLabel.Parent = Khung
        
        local NoiDungLabel = Instance.new("TextLabel")
        NoiDungLabel.Size = UDim2.new(1, 0, 1, -30)
        NoiDungLabel.Position = UDim2.new(0, 0, 0, 30)
        NoiDungLabel.BackgroundTransparency = 1
        NoiDungLabel.Text = NoiDung
        NoiDungLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        NoiDungLabel.TextSize = 13
        NoiDungLabel.Font = Enum.Font.SourceSans
        NoiDungLabel.TextWrapped = true
        NoiDungLabel.Parent = Khung
        
        game:GetService("Debris"):AddItem(ManHinhTB, ThoiGian or 5)
    end)
end

-- ================= KIỂM TRA FULL MOON =================
local function KiemTraFullMoon()
    local TrangThai = false
    pcall(function()
        local ThoiGian = game:GetService("Lighting").ClockTime or 12
        if ThoiGian >= 0 and ThoiGian <= 4 then
            TrangThai = true
        end
    end)
    return TrangThai
end

-- ================= KIỂM TRA BOSS TRIỆU HỒI =================
local function KiemTraBossTrieuHoi()
    local BossXuatHien = false
    local DanhSachBoss = {}
    
    for _, DoiTuong in pairs(workspace:GetChildren()) do
        local Ten = DoiTuong.Name:lower()
        if Ten:find("boss") or Ten:find("dough") or Ten:find("indra") or Ten:find("rip") or Ten:find("blackbeard") or Ten:find("darkbeard") or Ten:find("law") or Ten:find("cake") or Ten:find("prince") or Ten:find("king") then
            if DoiTuong:FindFirstChild("Humanoid") then
                if DoiTuong.Humanoid.Health > 0 then
                    BossXuatHien = true
                    table.insert(DanhSachBoss, DoiTuong.Name)
                end
            end
        end
    end
    
    return BossXuatHien, DanhSachBoss
end

-- ================= HOP SERVER =================
local DanhSachServerDaHop = {}

local function HopServer(LyDo)
    local DanhSachServer = {}
    pcall(function()
        local PhanHoi = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")
        local DuLieu = game:GetService("HttpService"):JSONDecode(PhanHoi)
        if DuLieu and DuLieu.data then
            for _, Server in pairs(DuLieu.data) do
                if Server.playing <= 12 and Server.id ~= game.JobId and not DanhSachServerDaHop[Server.id] then
                    table.insert(DanhSachServer, Server)
                end
            end
        end
    end)
    
    table.sort(DanhSachServer, function(a, b) return a.playing < b.playing end)
    
    if #DanhSachServer > 0 then
        local ServerChon = DanhSachServer[1]
        DanhSachServerDaHop[ServerChon.id] = true
        TaoThongBao("HOP SERVER", "Lý do: " .. (LyDo or "Không xác định") .. "\nServer mới: " .. ServerChon.playing .. " người", 5)
        DichVuDichChuyen:TeleportToPlaceInstance(game.PlaceId, ServerChon.id, NguoiChoi)
        return true
    else
        TaoThongBao("HOP SERVER", "Không tìm thấy server trống", 3)
        return false
    end
end

-- ================= VÒNG LẶP TÌM FULL MOON =================
local function VongLapTimFullMoon()
    while ChayUngDung do
        wait(10)
        
        if KichHoatHopFullMoon and not DangHopServer then
            if not KiemTraFullMoon() then
                TaoThongBao("FULL MOON", "Chưa có Trăng Tròn!\nĐang chuyển server...", 5)
                DangHopServer = true
                HopServer("Tìm Trăng Tròn")
                wait(15)
                DangHopServer = false
            else
                TaoThongBao("FULL MOON", "Đã tìm thấy Trăng Tròn!", 5)
                KichHoatHopFullMoon = false
            end
        end
    end
end

-- ================= VÒNG LẶP TÌM BOSS =================
local function VongLapTimBoss()
    while ChayUngDung do
        wait(10)
        
        if KichHoatHopBoss and not DangHopServer then
            local CoBoss, DanhSach = KiemTraBossTrieuHoi()
            
            if not CoBoss then
                TaoThongBao("BOSS", "Không có Boss Triệu Hồi!\nĐang chuyển server...", 5)
                DangHopServer = true
                HopServer("Tìm Boss Triệu Hồi")
                wait(15)
                DangHopServer = false
            else
                local TenBoss = table.concat(DanhSach, ", ")
                TaoThongBao("BOSS", "Đã tìm thấy Boss:\n" .. TenBoss, 5)
                KichHoatHopBoss = false
            end
        end
    end
end

-- ================= FARM LEVEL =================
local function FarmLevel()
    while DangFarmLevel and ChayUngDung do
        wait(0.15 / TocDoDanh)
        if not NguoiChoi.Character then continue end
        
        local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
        if not Goc then continue end
        
        local QuaiGanNhat = nil
        local KhoangCachNho = math.huge
        
        for _, QuaiVat in pairs(workspace.Enemies:GetChildren()) do
            if QuaiVat:FindFirstChild("HumanoidRootPart") and QuaiVat:FindFirstChild("Humanoid") then
                if QuaiVat.Humanoid.Health > 0 then
                    local KhoangCachHienTai = (QuaiVat.HumanoidRootPart.Position - Goc.Position).Magnitude
                    if KhoangCachHienTai < KhoangCachNho then
                        QuaiGanNhat = QuaiVat
                        KhoangCachNho = KhoangCachHienTai
                    end
                end
            end
        end
        
        if QuaiGanNhat then
            Goc.CFrame = CFrame.new(QuaiGanNhat.HumanoidRootPart.Position)
            local VuKhi = NguoiChoi.Character:FindFirstChildOfClass("Tool")
            if VuKhi then VuKhi:Activate() end
        end
    end
end

-- ================= FARM MASTERY =================
local function FarmMastery()
    while DangFarmMastery and ChayUngDung do
        wait(0.15 / TocDoDanh)
        if not NguoiChoi.Character then continue end
        
        local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
        if not Goc then continue end
        
        local QuaiGanNhat = nil
        local KhoangCachNho = math.huge
        
        for _, QuaiVat in pairs(workspace.Enemies:GetChildren()) do
            if QuaiVat:FindFirstChild("HumanoidRootPart") and QuaiVat:FindFirstChild("Humanoid") then
                if QuaiVat.Humanoid.Health > 0 then
                    local KhoangCachHienTai = (QuaiVat.HumanoidRootPart.Position - Goc.Position).Magnitude
                    if KhoangCachHienTai < KhoangCachNho then
                        QuaiGanNhat = QuaiVat
                        KhoangCachNho = KhoangCachHienTai
                    end
                end
            end
        end
        
        if QuaiGanNhat then
            Goc.CFrame = CFrame.new(QuaiGanNhat.HumanoidRootPart.Position)
            
            local VuKhi = nil
            
            if LoaiMastery == "Melee" then
                VuKhi = NguoiChoi.Character:FindFirstChild("Melee") or NguoiChoi.Character:FindFirstChildOfClass("Tool")
            elseif LoaiMastery == "Kiếm" then
                for _, CongCu in pairs(NguoiChoi.Character:GetChildren()) do
                    if CongCu:IsA("Tool") and CongCu.Name:lower():find("sword") then
                        VuKhi = CongCu
                        break
                    end
                end
            elseif LoaiMastery == "Súng" then
                for _, CongCu in pairs(NguoiChoi.Character:GetChildren()) do
                    if CongCu:IsA("Tool") and CongCu.Name:lower():find("gun") then
                        VuKhi = CongCu
                        break
                    end
                end
            elseif LoaiMastery == "Trái" then
                for _, CongCu in pairs(NguoiChoi.Character:GetChildren()) do
                    if CongCu:IsA("Tool") and (CongCu.Name:lower():find("fruit") or CongCu:FindFirstChild("Fruit")) then
                        VuKhi = CongCu
                        break
                    end
                end
            end
            
            if not VuKhi then
                VuKhi = NguoiChoi.Character:FindFirstChildOfClass("Tool")
            end
            
            if VuKhi then
                VuKhi:Activate()
            end
        end
    end
end

-- ================= GOM QUÁI =================
local function GomQuai()
    if not NguoiChoi.Character then return end
    local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
    if not Goc then return end
    
    for _, QuaiVat in pairs(workspace.Enemies:GetChildren()) do
        if QuaiVat:FindFirstChild("HumanoidRootPart") then
            QuaiVat.HumanoidRootPart.CFrame = Goc.CFrame
        end
    end
end

-- ================= DÙNG CHIÊU =================
local function DungChieu(Phim)
    pcall(function()
        local VuKhi = NguoiChoi.Character and NguoiChoi.Character:FindFirstChildOfClass("Tool")
        if VuKhi and VuKhi:FindFirstChild("Remote") then
            VuKhi.Remote:FireServer(Phim)
        end
    end)
end

-- ================= CẬP NHẬT TỐC ĐỘ =================
local function CapNhatTocDo()
    spawn(function()
        while ChayUngDung do
            wait(0.5)
            if NguoiChoi.Character then
                local ConNguoi = NguoiChoi.Character:FindFirstChild("Humanoid")
                if ConNguoi then
                    if TangTocDo then
                        ConNguoi.WalkSpeed = TocDoNguoiChoi
                    else
                        ConNguoi.WalkSpeed = 16
                    end
                end
            end
        end
    end)
end
spawn(CapNhatTocDo)

-- ================= CẬP NHẬT NHẢY =================
local function CapNhatNhay()
    spawn(function()
        while ChayUngDung do
            wait(0.5)
            if NguoiChoi.Character then
                local ConNguoi = NguoiChoi.Character:FindFirstChild("Humanoid")
                if ConNguoi then
                    if NhayCao then
                        ConNguoi.JumpPower = DoCaoNhay
                    else
                        ConNguoi.JumpPower = 50
                    end
                end
            end
        end
    end)
end
spawn(CapNhatNhay)

-- ================= NHẢY VÔ HẠN =================
local function NhayVoHan()
    spawn(function()
        while NhayVoHan and ChayUngDung do
            wait(0.1)
            if NguoiChoi.Character then
                local ConNguoi = NguoiChoi.Character:FindFirstChild("Humanoid")
                local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
                if ConNguoi and Goc then
                    if DichVuNhap:IsKeyDown(Enum.KeyCode.Space) then
                        Goc.Velocity = Vector3.new(Goc.Velocity.X, DoCaoNhay, Goc.Velocity.Z)
                    end
                end
            end
        end
    end)
end

-- ================= NHẢY LIÊN TỤC =================
local function NhayLienTuc()
    spawn(function()
        while NhayLienTuc and ChayUngDung do
            wait(0.05)
            if NguoiChoi.Character then
                local ConNguoi = NguoiChoi.Character:FindFirstChild("Humanoid")
                if ConNguoi then
                    ConNguoi:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end)
end

-- ================= BAY TỰ DO =================
local function BayTuDo()
    spawn(function()
        local Goc = NguoiChoi.Character and NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
        if not Goc then return end
        local KhoiBay = Instance.new("BodyVelocity")
        KhoiBay.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        KhoiBay.Velocity = Vector3.new(0, 0, 0)
        KhoiBay.Parent = Goc
        local DieuKhien = Instance.new("BodyGyro")
        DieuKhien.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        DieuKhien.CFrame = Camera.CFrame
        DieuKhien.Parent = Goc
        while DangBay and ChayUngDung do
            wait()
            if not NguoiChoi.Character then break end
            local HuongBay = Vector3.new(0, 0, 0)
            if DichVuNhap:IsKeyDown(Enum.KeyCode.Space) then HuongBay = HuongBay + Vector3.new(0, TocDoBay, 0) end
            if DichVuNhap:IsKeyDown(Enum.KeyCode.LeftShift) then HuongBay = HuongBay + Vector3.new(0, -TocDoBay, 0) end
            if DichVuNhap:IsKeyDown(Enum.KeyCode.W) then HuongBay = HuongBay + Camera.CFrame.LookVector * TocDoBay end
            if DichVuNhap:IsKeyDown(Enum.KeyCode.S) then HuongBay = HuongBay - Camera.CFrame.LookVector * TocDoBay end
            if DichVuNhap:IsKeyDown(Enum.KeyCode.A) then HuongBay = HuongBay - Camera.CFrame.RightVector * TocDoBay end
            if DichVuNhap:IsKeyDown(Enum.KeyCode.D) then HuongBay = HuongBay + Camera.CFrame.RightVector * TocDoBay end
            KhoiBay.Velocity = HuongBay
            DieuKhien.CFrame = Camera.CFrame
        end
        KhoiBay:Destroy()
        DieuKhien:Destroy()
    end)
end

-- ================= KHỞI ĐỘNG VÒNG LẶP =================
spawn(VongLapTimFullMoon)
spawn(VongLapTimBoss)

-- ================= TẠO MENU =================
local ManHinh = Instance.new("ScreenGui")
ManHinh.Name = "BananaHub"
ManHinh.Parent = ThietBi
ManHinh.ResetOnSpawn = false

local NutMo = Instance.new("TextButton")
NutMo.Name = "NutMo"
NutMo.Size = UDim2.new(0, 60, 0, 60)
NutMo.Position = UDim2.new(0, 10, 0.5, -30)
NutMo.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
NutMo.BorderSizePixel = 0
NutMo.Text = "🍌"
NutMo.TextSize = 30
NutMo.Font = Enum.Font.SourceSansBold
NutMo.Parent = ManHinh

local GocNutMo = Instance.new("UICorner")
GocNutMo.CornerRadius = UDim.new(1, 0)
GocNutMo.Parent = NutMo

local KhungChinh = Instance.new("Frame")
KhungChinh.Name = "KhungChinh"
KhungChinh.Size = UDim2.new(0, 480, 0, 600)
KhungChinh.Position = UDim2.new(0.5, -240, 0.5, -300)
KhungChinh.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KhungChinh.BorderSizePixel = 0
KhungChinh.Visible = false
KhungChinh.Parent = ManHinh

local VienKhung = Instance.new("UIStroke")
VienKhung.Thickness = 3
VienKhung.Color = Color3.fromRGB(255, 200, 0)
VienKhung.Parent = KhungChinh

local GocKhung = Instance.new("UICorner")
GocKhung.CornerRadius = UDim.new(0, 15)
GocKhung.Parent = KhungChinh

local ThanhTieuDe = Instance.new("Frame")
ThanhTieuDe.Name = "ThanhTieuDe"
ThanhTieuDe.Size = UDim2.new(1, 0, 0, 55)
ThanhTieuDe.BackgroundColor3 = Color3.fromRGB(180, 140, 0)
ThanhTieuDe.BorderSizePixel = 0
ThanhTieuDe.Parent = KhungChinh

local GocTieuDe = Instance.new("UICorner")
GocTieuDe.CornerRadius = UDim.new(0, 15)
GocTieuDe.Parent = ThanhTieuDe

local BieuTuong = Instance.new("TextLabel")
BieuTuong.Size = UDim2.new(0, 50, 0, 50)
BieuTuong.Position = UDim2.new(0, 5, 0, 2)
BieuTuong.BackgroundTransparency = 1
BieuTuong.Text = "🍌"
BieuTuong.TextSize = 30
BieuTuong.Parent = ThanhTieuDe

local TieuDe = Instance.new("TextLabel")
TieuDe.Size = UDim2.new(1, -160, 0, 35)
TieuDe.Position = UDim2.new(0, 55, 0, 0)
TieuDe.BackgroundTransparency = 1
TieuDe.Text = "BANANA HUB"
TieuDe.TextColor3 = Color3.fromRGB(255, 255, 255)
TieuDe.TextSize = 20
TieuDe.Font = Enum.Font.SourceSansBold
TieuDe.TextXAlignment = Enum.TextXAlignment.Left
TieuDe.Parent = ThanhTieuDe

local PhuDe = Instance.new("TextLabel")
PhuDe.Size = UDim2.new(1, -160, 0, 20)
PhuDe.Position = UDim2.new(0, 55, 0, 30)
PhuDe.BackgroundTransparency = 1
PhuDe.Text = "Siêu Cấp Đa Năng"
PhuDe.TextColor3 = Color3.fromRGB(255, 230, 150)
PhuDe.TextSize = 11
PhuDe.Font = Enum.Font.SourceSans
PhuDe.TextXAlignment = Enum.TextXAlignment.Left
PhuDe.Parent = ThanhTieuDe

local NutX = Instance.new("TextButton")
NutX.Name = "NutX"
NutX.Size = UDim2.new(0, 45, 0, 45)
NutX.Position = UDim2.new(1, -100, 0, 5)
NutX.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
NutX.BorderSizePixel = 0
NutX.Text = "✕"
NutX.TextColor3 = Color3.fromRGB(255, 255, 255)
NutX.TextSize = 20
NutX.Font = Enum.Font.SourceSansBold
NutX.Parent = ThanhTieuDe

local GocX = Instance.new("UICorner")
GocX.CornerRadius = UDim.new(1, 0)
GocX.Parent = NutX

NutX.MouseButton1Click:Connect(function()
    KhungChinh.Visible = false
    NutMo.Visible = false
end)

local NutRutGon = Instance.new("TextButton")
NutRutGon.Name = "NutRutGon"
NutRutGon.Size = UDim2.new(0, 45, 0, 45)
NutRutGon.Position = UDim2.new(1, -50, 0, 5)
NutRutGon.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
NutRutGon.BorderSizePixel = 0
NutRutGon.Text = "—"
NutRutGon.TextColor3 = Color3.fromRGB(255, 255, 255)
NutRutGon.TextSize = 20
NutRutGon.Font = Enum.Font.SourceSansBold
NutRutGon.Parent = ThanhTieuDe

local GocRutGon = Instance.new("UICorner")
GocRutGon.CornerRadius = UDim.new(1, 0)
GocRutGon.Parent = NutRutGon

NutRutGon.MouseButton1Click:Connect(function()
    MenuRutGon = not MenuRutGon
    if MenuRutGon then
        KhungChinh.Size = UDim2.new(0, 480, 0, 55)
        KhungChinh.Position = UDim2.new(0.5, -240, 0, 10)
        NutRutGon.Text = "+"
    else
        KhungChinh.Size = UDim2.new(0, 480, 0, 600)
        KhungChinh.Position = UDim2.new(0.5, -240, 0.5, -300)
        NutRutGon.Text = "—"
    end
end)

NutMo.MouseButton1Click:Connect(function()
    MenuMo = not MenuMo
    KhungChinh.Visible = MenuMo
    if MenuMo then
        KhungChinh.Size = UDim2.new(0, 480, 0, 600)
        KhungChinh.Position = UDim2.new(0.5, -240, 0.5, -300)
        MenuRutGon = false
        NutRutGon.Text = "—"
    end
end)

local KhungNoiDung = Instance.new("ScrollingFrame")
KhungNoiDung.Name = "KhungNoiDung"
KhungNoiDung.Size = UDim2.new(1, 0, 1, -60)
KhungNoiDung.Position = UDim2.new(0, 0, 0, 60)
KhungNoiDung.BackgroundTransparency = 1
KhungNoiDung.CanvasSize = UDim2.new(0, 0, 35, 0)
KhungNoiDung.ScrollBarThickness = 4
KhungNoiDung.ScrollBarImageColor3 = Color3.fromRGB(255, 200, 0)
KhungNoiDung.Parent = KhungChinh

local YViTri = 10

local function TaoPhan(Ten, BieuTuongPhan)
    local KhungPhan = Instance.new("Frame")
    KhungPhan.Size = UDim2.new(1, -20, 0, 35)
    KhungPhan.Position = UDim2.new(0, 10, 0, YViTri)
    KhungPhan.BackgroundColor3 = Color3.fromRGB(60, 45, 0)
    KhungPhan.BorderSizePixel = 0
    KhungPhan.Parent = KhungNoiDung
    
    local GocPhan = Instance.new("UICorner")
    GocPhan.CornerRadius = UDim.new(0, 8)
    GocPhan.Parent = KhungPhan
    
    local BieuTuong = Instance.new("TextLabel")
    BieuTuong.Size = UDim2.new(0, 30, 1, 0)
    BieuTuong.BackgroundTransparency = 1
    BieuTuong.Text = BieuTuongPhan or "📌"
    BieuTuong.TextSize = 15
    BieuTuong.Parent = KhungPhan
    
    local Nhan = Instance.new("TextLabel")
    Nhan.Size = UDim2.new(1, -35, 1, 0)
    Nhan.Position = UDim2.new(0, 35, 0, 0)
    Nhan.BackgroundTransparency = 1
    Nhan.Text = Ten
    Nhan.TextColor3 = Color3.fromRGB(255, 200, 50)
    Nhan.TextSize = 13
    Nhan.Font = Enum.Font.SourceSansBold
    Nhan.TextXAlignment = Enum.TextXAlignment.Left
    Nhan.Parent = KhungPhan
    
    YViTri = YViTri + 40
end

local function TaoNut(Ten, BieuTuongNut, Callback)
    local Nut = Instance.new("TextButton")
    Nut.Size = UDim2.new(1, -20, 0, 40)
    Nut.Position = UDim2.new(0, 10, 0, YViTri)
    Nut.BackgroundColor3 = Color3.fromRGB(40, 30, 0)
    Nut.BorderSizePixel = 0
    Nut.Text = (BieuTuongNut or "🔘") .. " " .. Ten
    Nut.TextColor3 = Color3.fromRGB(255, 255, 255)
    Nut.TextSize = 12
    Nut.Font = Enum.Font.SourceSans
    Nut.Parent = KhungNoiDung
    
    local GocNut = Instance.new("UICorner")
    GocNut.CornerRadius = UDim.new(0, 6)
    GocNut.Parent = Nut
    
    Nut.MouseEnter:Connect(function()
        Nut.BackgroundColor3 = Color3.fromRGB(80, 60, 0)
    end)
    Nut.MouseLeave:Connect(function()
        Nut.BackgroundColor3 = Color3.fromRGB(40, 30, 0)
    end)
    Nut.MouseButton1Click:Connect(Callback)
    YViTri = YViTri + 45
    return Nut
end

local function TaoToggle(Ten, MacDinh, Callback)
    local Khung = Instance.new("Frame")
    Khung.Size = UDim2.new(1, -20, 0, 40)
    Khung.Position = UDim2.new(0, 10, 0, YViTri)
    Khung.BackgroundColor3 = Color3.fromRGB(35, 25, 0)
    Khung.BorderSizePixel = 0
    Khung.Parent = KhungNoiDung
    
    local GocKhung = Instance.new("UICorner")
    GocKhung.CornerRadius = UDim.new(0, 6)
    GocKhung.Parent = Khung
    
    local Nhan = Instance.new("TextLabel")
    Nhan.Size = UDim2.new(0.7, 0, 1, 0)
    Nhan.BackgroundTransparency = 1
    Nhan.Text = Ten
    Nhan.TextColor3 = Color3.fromRGB(255, 255, 255)
    Nhan.TextSize = 11
    Nhan.Font = Enum.Font.SourceSans
    Nhan.TextXAlignment = Enum.TextXAlignment.Left
    Nhan.Parent = Khung
    
    local Nut = Instance.new("TextButton")
    Nut.Size = UDim2.new(0.3, -10, 0, 30)
    Nut.Position = UDim2.new(0.7, 5, 0, 5)
    Nut.BackgroundColor3 = MacDinh and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(60, 60, 60)
    Nut.BorderSizePixel = 0
    Nut.Text = MacDinh and "BẬT" or "TẮT"
    Nut.TextColor3 = Color3.fromRGB(255, 255, 255)
    Nut.TextSize = 11
    Nut.Font = Enum.Font.SourceSansBold
    Nut.Parent = Khung
    
    local GocNut = Instance.new("UICorner")
    GocNut.CornerRadius = UDim.new(0, 4)
    GocNut.Parent = Nut
    
    local TrangThai = MacDinh
    Nut.MouseButton1Click:Connect(function()
        TrangThai = not TrangThai
        DichVuBo:Create(Nut, TweenInfo.new(0.2), {
            BackgroundColor3 = TrangThai and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(60, 60, 60)
        }):Play()
        Nut.Text = TrangThai and "BẬT" or "TẮT"
        Callback(TrangThai)
    end)
    
    YViTri = YViTri + 45
end

local function TaoDropdown(Ten, DanhSach, MacDinh, Callback)
    local Khung = Instance.new("Frame")
    Khung.Size = UDim2.new(1, -20, 0, 40)
    Khung.Position = UDim2.new(0, 10, 0, YViTri)
    Khung.BackgroundColor3 = Color3.fromRGB(35, 25, 0)
    Khung.BorderSizePixel = 0
    Khung.Parent = KhungNoiDung
    
    local GocKhung = Instance.new("UICorner")
    GocKhung.CornerRadius = UDim.new(0, 6)
    GocKhung.Parent = Khung
    
    local Nhan = Instance.new("TextLabel")
    Nhan.Size = UDim2.new(0.5, 0, 1, 0)
    Nhan.BackgroundTransparency = 1
    Nhan.Text = Ten
    Nhan.TextColor3 = Color3.fromRGB(255, 255, 255)
    Nhan.TextSize = 11
    Nhan.Font = Enum.Font.SourceSans
    Nhan.TextXAlignment = Enum.TextXAlignment.Left
    Nhan.Parent = Khung
    
    local NutChon = Instance.new("TextButton")
    NutChon.Size = UDim2.new(0.5, 0, 1, 0)
    NutChon.Position = UDim2.new(0.5, 0, 0, 0)
    NutChon.BackgroundColor3 = Color3.fromRGB(60, 45, 0)
    NutChon.BorderSizePixel = 0
    NutChon.Text = MacDinh or DanhSach[1] or "Chọn"
    NutChon.TextColor3 = Color3.fromRGB(255, 255, 255)
    NutChon.TextSize = 11
    NutChon.Font = Enum.Font.SourceSansBold
    NutChon.Parent = Khung
    
    local KhungDropdown = Instance.new("Frame")
    KhungDropdown.Size = UDim2.new(1, -20, 0, 0)
    KhungDropdown.Position = UDim2.new(0, 10, 0, YViTri + 45)
    KhungDropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    KhungDropdown.BorderSizePixel = 0
    KhungDropdown.Visible = false
    KhungDropdown.Parent = KhungNoiDung
    
    local DropdownNoiDung = Instance.new("ScrollingFrame")
    DropdownNoiDung.Size = UDim2.new(1, 0, 1, 0)
    DropdownNoiDung.BackgroundTransparency = 1
    DropdownNoiDung.CanvasSize = UDim2.new(0, 0, 0, #DanhSach * 30)
    DropdownNoiDung.ScrollBarThickness = 3
    DropdownNoiDung.Parent = KhungDropdown
    
    local YDropdown = 0
    for _, LuaChon in pairs(DanhSach) do
        local NutLuaChon = Instance.new("TextButton")
        NutLuaChon.Size = UDim2.new(1, 0, 0, 30)
        NutLuaChon.Position = UDim2.new(0, 0, 0, YDropdown)
        NutLuaChon.BackgroundColor3 = Color3.fromRGB(50, 40, 0)
        NutLuaChon.BorderSizePixel = 0
        NutLuaChon.Text = LuaChon
        NutLuaChon.TextColor3 = Color3.fromRGB(255, 255, 255)
        NutLuaChon.TextSize = 11
        NutLuaChon.Font = Enum.Font.SourceSans
        NutLuaChon.Parent = DropdownNoiDung
        
        NutLuaChon.MouseButton1Click:Connect(function()
            NutChon.Text = LuaChon
            KhungDropdown.Visible = false
            Callback(LuaChon)
        end)
        
        YDropdown = YDropdown + 30
    end
    
    NutChon.MouseButton1Click:Connect(function()
        KhungDropdown.Visible = not KhungDropdown.Visible
        if KhungDropdown.Visible then
            KhungDropdown.Size = UDim2.new(1, -20, 0, 150)
        else
            KhungDropdown.Size = UDim2.new(1, -20, 0, 0)
        end
    end)
    
    YViTri = YViTri + 50
end

-- ================= TẠO MENU =================
TaoPhan("FARM LEVEL", "📈")
TaoToggle("Farm Level", false, function(giaTri)
    DangFarmLevel = giaTri
    if giaTri then FarmLevel() end
end)

TaoPhan("FARM MASTERY", "🎯")
TaoDropdown("Loại Mastery", {"Melee", "Kiếm", "Súng", "Trái"}, "Melee", function(LuaChon)
    LoaiMastery = LuaChon
end)
TaoToggle("Farm Mastery", false, function(giaTri)
    DangFarmMastery = giaTri
    if giaTri then FarmMastery() end
end)

TaoPhan("CHIÊU THỨC", "⚡")
TaoToggle("Dùng Chiêu Z", false, function(giaTri) DungChieuZ = giaTri end)
TaoToggle("Dùng Chiêu X", false, function(giaTri) DungChieuX = giaTri end)
TaoToggle("Dùng Chiêu C", false, function(giaTri) DungChieuC = giaTri end)
TaoToggle("Dùng Chiêu V", false, function(giaTri) DungChieuV = giaTri end)
TaoToggle("Dùng Chiêu F", false, function(giaTri) DungChieuF = giaTri end)

TaoPhan("SETTING", "⚙️")
TaoDropdown("Tốc Độ Đánh", {"Chậm (1x)", "Vừa (2x)", "Nhanh (5x)", "Siêu Nhanh (10x)"}, "Chậm (1x)", function(LuaChon)
    if LuaChon == "Chậm (1x)" then TocDoDanh = 1
    elseif LuaChon == "Vừa (2x)" then TocDoDanh = 2
    elseif LuaChon == "Nhanh (5x)" then TocDoDanh = 5
    elseif LuaChon == "Siêu Nhanh (10x)" then TocDoDanh = 10
    end
end)
TaoDropdown("Tốc Độ Bay", {"Chậm (20)", "Vừa (50)", "Nhanh (100)", "Siêu Nhanh (200)"}, "Vừa (50)", function(LuaChon)
    if LuaChon == "Chậm (20)" then TocDoBay = 20
    elseif LuaChon == "Vừa (50)" then TocDoBay = 50
    elseif LuaChon == "Nhanh (100)" then TocDoBay = 100
    elseif LuaChon == "Siêu Nhanh (200)" then TocDoBay = 200
    end
end)
TaoDropdown("Tốc Độ Người Chơi", {"16", "20", "30", "50", "100"}, "16", function(LuaChon)
    TocDoNguoiChoi = tonumber(LuaChon) or 16
end)
TaoDropdown("Độ Cao Nhảy", {"50", "75", "100", "150", "200"}, "50", function(LuaChon)
    DoCaoNhay = tonumber(LuaChon) or 50
end)

TaoPhan("CHẾ ĐỘ BAY", "🕊️")
TaoToggle("Bay Tự Do", false, function(giaTri)
    DangBay = giaTri
    if giaTri then BayTuDo() end
end)
TaoToggle("Bay Xung Quanh", false, function(giaTri)
    BayXungQuanh = giaTri
end)
TaoToggle("Bay Hình Tròn", false, function(giaTri)
    BayHinhTron = giaTri
end)
TaoToggle("Bay Tam Giác", false, function(giaTri)
    BayTamGiac = giaTri
end)
TaoDropdown("Bán Kính Bay", {"10", "20", "30", "50", "100"}, "30", function(LuaChon)
    BanKinhBay = tonumber(LuaChon) or 30
end)
TaoDropdown("Tốc Độ Xoay", {"1", "2", "3", "5", "10"}, "1", function(LuaChon)
    TocDoXoay = tonumber(LuaChon) or 1
end)

TaoPhan("MOVEMENT", "🏃")
TaoToggle("Tăng Tốc Độ", false, function(giaTri)
    TangTocDo = giaTri
end)
TaoToggle("Nhảy Cao", false, function(giaTri)
    NhayCao = giaTri
end)
TaoToggle("Nhảy Vô Hạn", false, function(giaTri)
    NhayVoHan = giaTri
    NhayVoHan()
end)
TaoToggle("Nhảy Liên Tục", false, function(giaTri)
    NhayLienTuc = giaTri
    NhayLienTuc()
end)
TaoToggle("Xuyên Tường", false, function(giaTri)
    XuyenTuong = giaTri
    if NguoiChoi.Character then
        for _, Phan in pairs(NguoiChoi.Character:GetDescendants()) do
            if Phan:IsA("BasePart") then Phan.CanCollide = not giaTri end
        end
    end
end)

TaoPhan("GOM QUÁI", "🧲")
TaoToggle("Tự Động Gom Quái", false, function(giaTri)
    DangGomQuai = giaTri
    if giaTri then
        spawn(function()
            while DangGomQuai and ChayUngDung do
                wait(2)
                GomQuai()
            end
        end)
    end
end)

TaoPhan("HAKI", "👁️")
TaoToggle("Haki Nền", false, function(giaTri) BatHakiNen = giaTri end)
TaoToggle("Haki Vũ Trang", false, function(giaTri) BatHakiVuTrang = giaTri end)
TaoToggle("Né Chiêu", false, function(giaTri) NeChieu = giaTri end)

TaoPhan("AN TOÀN", "🛡️")
TaoToggle("Bay Khi Máu Yếu", false, function(giaTri) BayKhiYeu = giaTri end)
TaoToggle("Chống Chết", false, function(giaTri)
    ChongChet = giaTri
    if giaTri then
        spawn(function()
            while ChongChet and ChayUngDung do
                wait(0.1)
                if NguoiChoi.Character and NguoiChoi.Character:FindFirstChild("Humanoid") then
                    if NguoiChoi.Character.Humanoid.Health < 10 then
                        NguoiChoi.Character.Humanoid.Health = 100
                    end
                end
            end
        end)
    end
end)
TaoToggle("Tự Hồi Sinh", false, function(giaTri)
    TuHoiSinh = giaTri
    if giaTri then
        spawn(function()
            while TuHoiSinh and ChayUngDung do
                wait(1)
                if NguoiChoi.Character and NguoiChoi.Character:FindFirstChild("Humanoid") then
                    if NguoiChoi.Character.Humanoid.Health <= 0 then
                        local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
                        if Goc then Goc.CFrame = CFrame.new(0, 200, 0) end
                    end
                end
            end
        end)
    end
end)

TaoPhan("HOP SERVER", "🔄")
TaoNut("Hop Server", "🚀", function()
    HopServer("Thủ công")
end)
TaoToggle("Tìm Trăng Tròn", false, function(giaTri)
    KichHoatHopFullMoon = giaTri
end)
TaoToggle("Tìm Boss Triệu Hồi", false, function(giaTri)
    KichHoatHopBoss = giaTri
end)

TaoPhan("KHÁC", "⚙️")
TaoToggle("Thông Báo", true, function(giaTri)
    ThongBaoBat = giaTri
end)
TaoToggle("Chống Lag", true, function(giaTri)
    ChốngLag = giaTri
    if giaTri then
        spawn(function()
            while ChốngLag and ChayUngDung do
                wait(5)
                ChốngLagKhiMở()
            end
        end)
    end
end)
TaoToggle("Tự Động Nhặt Vật Phẩm", false, function(giaTri)
    TuDongNhat = giaTri
    if giaTri then
        spawn(function()
            while TuDongNhat and ChayUngDung do
                wait(0.5)
                if NguoiChoi.Character then
                    local Goc = NguoiChoi.Character:FindFirstChild("HumanoidRootPart")
                    if Goc then
                        for _, VatPham in pairs(workspace:GetChildren()) do
                            if VatPham:IsA("Tool") and VatPham:FindFirstChild("Handle") then
                                local KhoangCach = (VatPham.Handle.Position - Goc.Position).Magnitude
                                if KhoangCach < 20 then
                                    VatPham.Handle.CFrame = Goc.CFrame
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)