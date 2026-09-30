repeat
	task.wait()
until game:IsLoaded()

repeat
	task.wait()
until game.Players.LocalPlayer

repeat
	task.wait()
until game.Players.LocalPlayer:FindFirstChild("DataLoaded")

repeat
	task.wait()
until game.Players.LocalPlayer.Character

repeat
	task.wait()
until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

repeat
	task.wait()
until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local v = workspace

local tbl = {
	sea1 = function()
		return v:GetAttribute("MAP") == "Sea1"
	end,
	sea2 = function()
		return v:GetAttribute("MAP") == "Sea2"
	end,
	sea3 = function()
		return v:GetAttribute("MAP") == "Sea3"
	end,
}

Mirage = function()
	local map = v:FindFirstChild("Map")
	return map ~= nil and map:FindFirstChild("MysticIsland") ~= nil
end

Mob = function(arg)
	local enemies = v:FindFirstChild("Enemies")
	enemies = enemies and enemies:FindFirstChild(arg)

	if enemies then
		local humanoid = enemies:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = enemies:FindFirstChild("HumanoidRootPart")
		if humanoid and humanoidRootPart and humanoid.Health > 0 then
			return enemies
		end
	end

	local v2 = ReplicatedStorage:FindFirstChild(arg)

	if v2 then
		local humanoid = v2:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
		if humanoid and humanoidRootPart and humanoid.Health > 0 then
			return v2
		end
	end
end

Fruits = function()
	for _, v2 in v:GetChildren() do
		if string.find(v2.Name, "Fruit") and (v2:IsA("Tool") or v2:IsA("Model")) and v2.Name ~= "Fruit" then
			return v2
		end
	end

	return nil
end

local tbl2 = { "Winter Sky", "Pure Red", "Snow White" }

Haki = function()
	local ok, result = pcall(function()
		return ReplicatedStorage.Remotes.CommF_:InvokeServer("ColorsDealer", "1", true)
	end)

	if ok and result then
		local str = tostring(result):gsub("%d+", ""):gsub("%s+$", "")
		if table.find(tbl2, str) then
			return str
		end
	end
end

local tbl3 = { "Saishi", "Oroshi", "Shizu" }

Sword = function()
	local ok, result = pcall(function()
		return ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
	end)

	if ok and result then
		local str = tostring(result):gsub("%d+", ""):gsub("%s+$", "")
		if table.find(tbl3, str) then
			return str
		end
	end
end

local tbl4 = { "Red Cherry Berry", "White Cloud Berry", "Pink Pig Berry" }

Berry = function()
	local tagged = CollectionService:GetTagged("BerryBush")

	for i = 1, #tagged do
		for _, v2 in tagged[i]:GetAttributes() do
			if table.find(tbl4, v2) then
				return v2
			end
		end
	end
end

local tbl5 = nil

Castle = function()
	tbl5 = tbl5 or { v:FindFirstChild("Enemies"), ReplicatedStorage }

	for _, v2 in tbl5, nil, nil do
		if v2 then
			for _, v3 in v2:GetChildren() do
				if v3:GetAttribute("Level") and v3:GetAttribute("Level") <= 1500 and v3:IsA("Model") and (v3:GetPivot().Position - Vector3.new(-5000, 350, -3035)).Magnitude <= 1000 then
					return true
				end
			end
		end
	end

	return nil
end

local tbl6 = {
	"rip_indra True Form",
	"Dough King",
	"Cake Prince",
	"Soul Reaper",
	"Cursed Captain",
	"Tyrant of the Skies",
}

local tbl7 = { "Diablo", "Urban", "Deandre" }
local str = "Unknown"

if tbl.sea1() then
	str = "First Sea"
elseif tbl.sea2() then
	str = "Second Sea"
elseif tbl.sea3() then
	str = "Third Sea"
end

if str == "Unknown" then
	if game.PlaceId == 2753915549 then
		str = "First Sea"
	elseif game.PlaceId == 4442272183 then
		str = "Second Sea"
	elseif game.PlaceId == 7449423635 then
		str = "Third Sea"
	end
end

local str2 = "https://discord.com/api/webhooks/1554797039966228520/1n18L0wuzDxFGbNYF5pl8P7pkpxVse4qkY6nzlTwHRlfPU2Z3b1xdUp1gFT4g4QRjejv"

local function fn(arg)
	local type_ = arg.Type or "Notification"
	local str3 = "Blox Fruits - " .. type_
	local str4, str5, n

	if type_ == "RareBoss" then
		str3 = "👹 Rare Boss: " .. tostring(arg.RareBoss)
		str4 = tostring(arg.RareBoss)
		str5 = "Boss"
		n = 15158332
	elseif type_ == "Elite" then
		str3 = "⚔️ Elite Hunter: " .. tostring(arg.Elite)
		str4 = tostring(arg.Elite)
		str5 = "Elite Boss"
		n = 15105570
	elseif type_ == "Mirage" then
		str5 = "Event"
		str4 = "Mirage Island (Mystic Island)"
		n = 10181046
		str3 = "🏝️ Mirage Island Spawned!"
	elseif type_ == "Fruits" then
		str3 = "🍎 Fruit Spawned: " .. tostring(arg.Fruits)
		str4 = tostring(arg.Fruits)
		str5 = "Fruit"
		n = 3066993
	elseif type_ == "Haki" then
		str3 = "🌈 Legendary Haki Color: " .. tostring(arg.Haki)
		str4 = tostring(arg.Haki)
		str5 = "Haki Color"
		n = 1752220
	elseif type_ == "Sword" then
		str3 = "🗡️ Legendary Sword: " .. tostring(arg.Sword)
		str4 = tostring(arg.Sword)
		str5 = "Sword"
		n = 15844367
	elseif type_ == "Berry" then
		str3 = "🍓 Rare Berry: " .. tostring(arg.Berry)
		str4 = tostring(arg.Berry)
		str5 = "Berry"
		n = 15277667
	elseif type_ == "FullMoon" then
		str5 = "Moon Phase"
		str4 = "Full Moon (Phase 5)"
		n = 15965202
		str3 = "🌕 Full Moon (100%) Active!"
	elseif type_ == "NearMoon" then
		str5 = "Moon Phase"
		str4 = "Near Moon (Phase 4)"
		n = 13849600
		str3 = "🌖 Near Full Moon Active!"
	else
		str5 = "Detail"
		str4 = "None"
		n = 3447003

		if type_ == "Castle" then
			str5 = "Raid Event"
			str4 = "Castle on the Sea"
			n = 3426654
			str3 = "🏰 Pirate Raid at Castle on the Sea!"
		end
	end

	local str6 = tostring(arg.PlaceId or arg.PlaceID or game.PlaceId)
	local str7 = tostring(arg.JobId or game.JobId)
	local str8 = tostring(arg.Players or Players.NumPlayers .. "/" .. Players.MaxPlayers)
	local str9 = tostring(arg.Sea or str or "Unknown")
	local tbl8 = { title = str3, color = n }
	local fields = {}
	local tbl9 = { name = str5, value = "```" .. str4 .. "```", inline = true }
	local tbl10 = { name = "🌊 Sea", value = str9, inline = true }

	local tbl11 = {
		name = "🚀 Teleport Code",
		value = "```lua\n" .. string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s', game.Players.LocalPlayer)", str6, str7) .. "\n```",
		inline = false,
	}

	fields[1] = tbl9
	fields[2] = tbl10
	fields[3] = { name = "👥 Players", value = str8, inline = true }
	fields[4] = { name = "🆔 PlaceId", value = str6, inline = true }
	fields[5] = { name = "📋 JobId", value = "```" .. str7 .. "```", inline = false }
	fields[6] = tbl11
	tbl8.fields = fields
	tbl8.footer = { text = "Blox Fruits Notifier" }
	tbl8.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
	return { username = "Blox Fruits Notifier", embeds = { tbl8 } }
end

Post = function(arg)
	task.spawn(function()
		pcall(function()
			local embeds = arg and (arg.embeds or arg.content) and arg or fn(arg)
			local request_ = syn and syn.request or http and http.request or http_request or request

			if request_ and "https://discord.com/api/webhooks/1554797039966228520/1n18L0wuzDxFGbNYF5pl8P7pkpxVse4qkY6nzlTwHRlfPU2Z3b1xdUp1gFT4g4QRjejvq" and str2 ~= "" then
				request_({
					Url = str2,
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json" },
					Body = HttpService:JSONEncode(embeds),
				})
			end
		end)
	end)
end

task.spawn(function()
	while true do
		if Players.NumPlayers <= Players.MaxPlayers then
			local str3 = Players.NumPlayers .. "/" .. Players.MaxPlayers
			local str4 = tostring(game.JobId)
			local placeId = game.PlaceId

			for _, v2 in ipairs(tbl6) do
				if Mob(v2) then
					Post({
						Players = str3,
						RareBoss = v2,
						JobId = str4,
						Sea = str,
						PlaceID = placeId,
						Type = "RareBoss",
					})

					task.wait(0.5)
				end
			end

			for _, v2 in ipairs(tbl7) do
				if Mob(v2) then
					Post({ Players = str3, Elite = v2, JobId = str4, Sea = str, PlaceID = placeId, Type = "Elite" })
					task.wait(0.5)
				end
			end

			if Mirage() then
				Post({ Players = str3, Mirage = true, JobId = str4, Sea = str, PlaceId = placeId, Type = "Mirage" })
				task.wait(0.5)
			end

			local v2 = Fruits()

			if v2 then
				Post({
					Players = str3,
					Fruits = tostring(v2),
					JobId = str4,
					Sea = str,
					PlaceId = placeId,
					Type = "Fruits",
				})

				task.wait(0.5)
			end

			local v3 = Haki()

			if v3 then
				Post({ Players = str3, Haki = v3, JobId = str4, Sea = str, PlaceId = placeId, Type = "Haki" })
				task.wait(0.5)
			end

			local v4 = Sword()

			if v4 then
				Post({ Players = str3, Sword = v4, JobId = str4, Sea = str, PlaceId = placeId, Type = "Sword" })
				task.wait(0.5)
			end

			local v5 = Berry()

			if v5 then
				Post({ Players = str3, Berry = v5, JobId = str4, Sea = str, PlaceId = placeId, Type = "Berry" })
				task.wait(0.5)
			end

			local attribute = Lighting:GetAttribute("MoonPhase")

			if attribute == 5 then
				Post({
					Players = str3,
					Moon = "Full Moon",
					JobId = str4,
					Sea = str,
					PlaceId = placeId,
					Type = "FullMoon",
				})

				task.wait(0.5)
			elseif attribute == 4 then
				Post({
					Players = str3,
					Moon = "Near Moon",
					JobId = str4,
					Sea = str,
					PlaceId = placeId,
					Type = "NearMoon",
				})

				task.wait(0.5)
			end

			if Castle() then
				Post({
					Players = str3,
					Raid = "Castle",
					JobId = str4,
					Sea = str,
					PlaceId = placeId,
					Type = "Castle",
				})

				task.wait(0.5)
			end
		end

		task.wait(30)
	end
end)
