-- Временный автотест PR, клиентская часть. После теста удаляется.
if engine.ActiveGamemode() ~= "testgm" then return end

local function log(text)
	print("[PR_SELFTEST] CL " .. text)
end

-- Поддельные и честные запросы от лица обычного игрока. Между запросами пауза больше антиспама (0.3 с).
local function Attack()
	local me = LocalPlayer()
	local bot1 = player.GetBots()[1]
	local bot2 = player.GetBots()[2]

	local actions = {
		function() net.Start("SetMoneyPR") net.WriteEntity(me) net.WriteInt(1000000, 32) net.SendToServer() end,
		function() net.Start("SetAdminPR") net.WriteEntity(me) net.SendToServer() end,
		function() net.Start("SetCoinPR") net.WriteEntity(me) net.WriteInt(999, 32) net.SendToServer() end,
		function() net.Start("PR_KickPlayer") net.WriteEntity(bot1) net.SendToServer() end,
		function() net.Start("SetLeaderFracPR") net.WriteEntity(bot2) net.SendToServer() end,
		function() net.Start("SetFrac") net.WriteString("admin") net.SendToServer() end,
		function()
			net.Start("SaveWeaponData")
				net.WriteTable({USA = {{ClassName = "weapon_rpg", Name = "RPG", Price = 0, Exp = 0, Tier = 1, Type = "ar", NeedToUnlock = {""}}}})
			net.SendToServer()
		end,
		function() net.Start("GiveWeapon") net.WriteString("weapon_rpg") net.SendToServer() end,
		function() net.Start("GiveWeapon") net.WriteString("weapon_357") net.SendToServer() end,
		function() net.Start("GiveWeapon") net.WriteString("weapon_pr_not_installed") net.SendToServer() end,
		function() net.Start("Preset") net.WriteString("weapon_rpg") net.WriteString("Primary") net.WriteString("RPG") net.SendToServer() end,
		function() net.Start("GiveWeapon") net.WriteString("weapon_pistol") net.SendToServer() end,
		function() net.Start("BuyPlayerModel") net.WriteString("models/player/alyx.mdl") net.WriteTable({}) net.WriteInt(0, 32) net.SendToServer() end,
		function() net.Start("Preset") net.WriteString("weapon_pistol") net.WriteString("Secondary") net.WriteString("Пистолет") net.SendToServer() end,
		function() RunConsoleCommand("gm_giveswep", "weapon_crossbow") end,
		function() RunConsoleCommand("gm_spawn", "models/props_c17/oildrum001.mdl") end,
		function() RunConsoleCommand("noclip") end,
		function() net.Start("GiveVehicle") net.WriteString("prop_vehicle_jeep") net.WriteString("Город") net.SendToServer() end,
		function() net.Start("PR_SELFTEST_ATTACK_DONE") net.SendToServer() end
	}

	for i, fn in ipairs(actions) do
		timer.Simple(i * 0.5, function()
			local ok, err = pcall(fn)
			if not ok then log("attack step " .. i .. " error: " .. tostring(err)) end
		end)
	end

	log("attack queued: " .. #actions .. " actions")
end

net.Receive("PR_SELFTEST_ATTACK", Attack)

-- Нажать «Установить точку» от имени админа
net.Receive("PR_SELFTEST_SETPOINT", function()
	local point = net.ReadEntity()
	net.Start("SetPoint")
		net.WriteEntity(point)
	net.SendToServer()
	log("SetPoint sent")
end)

-- Переключить вкладку меню F4 / открыть редактор товара
net.Receive("PR_SELFTEST_TAB", function()
	local id = net.ReadString()
	if PR_Menu and PR_Menu.IsOpen() then
		PR_Menu.ShowTab(id)
		log("tab " .. id)
	else
		log("tab " .. id .. ": menu is not open")
	end
end)

net.Receive("PR_SELFTEST_SETFRAC", function()
	local frac = net.ReadString()
	net.Start("SetFrac")
		net.WriteString(frac)
	net.SendToServer()
	log("SetFrac " .. frac .. " sent")
end)

-- Купить защитника на точке, как кнопка в меню владельца
net.Receive("PR_SELFTEST_GUARD", function()
	local point = net.ReadEntity()
	net.Start("SpawnGuardianNPC")
		net.WriteEntity(point)
		net.WriteString("дикий")
		net.WriteString("")
		net.WriteUInt(1, 4)
		net.WriteBool(false)
	net.SendToServer()
	log("SpawnGuardianNPC sent")
end)

-- Окно вариантов патрулей: сохранить / удалить / выпустить, как кнопки в окне
net.Receive("PR_SELFTEST_PTYPE_SAVE", function()
	local key = net.ReadString()
	local data = net.ReadTable()
	net.Start("PR_PatrolSaveType")
		net.WriteString(key)
		net.WriteTable(data)
	net.SendToServer()
	log("PR_PatrolSaveType sent")
end)

net.Receive("PR_SELFTEST_PTYPE_CMD", function()
	local cmd = net.ReadString()
	local key = net.ReadString()
	net.Start(cmd == "delete" and "PR_PatrolDeleteType" or "PR_PatrolSpawnType")
		net.WriteString(key)
	net.SendToServer()
	log("patrol type " .. cmd .. " " .. key .. " sent")
end)

net.Receive("PR_SELFTEST_PTYPES_OPEN", function()
	local key = net.ReadString()
	PR_PatrolEditor.OpenTypes()
	timer.Simple(0.7, function()
		if PR_PatrolEditor.SelectType then PR_PatrolEditor.SelectType(key) end
		log("patrol types window, selected " .. key)
	end)
end)

net.Receive("PR_SELFTEST_EDITOR", function()
	PR_Shop.OpenEditor("weapon", nil, {Category = "ar", Faction = "SSNK", Name = "Тестовый ствол", ClassName = "cw_kk_ins2_akm"})
	log("editor opened")
end)

-- Закрыть все окна (DFrame) и меню F4
net.Receive("PR_SELFTEST_CLOSE", function()
	if PR_Menu and PR_Menu.IsOpen() then PR_Menu.Close() end
	local n = 0
	for _, pnl in ipairs(vgui.GetWorldPanel():GetChildren()) do
		if IsValid(pnl) and pnl.ClassName == "DFrame" then
			pnl:Remove()
			n = n + 1
		end
	end
	log("closed " .. n .. " frames")
end)

-- Скриншот следующего кадра в data/pr_selftest/<name>.jpg
local pendingShot
local director = {on = true}
net.Receive("PR_SELFTEST_SHOT", function()
	pendingShot = net.ReadString()
	director.pauseUntil = CurTime() + 2   -- скриншот теста — с глаз игрока, не с камеры-режиссёра
end)

hook.Add("DrawOverlay", "PR_SelfTestShot", function()
	if not pendingShot then return end

	local name = pendingShot
	pendingShot = nil

	local data = render.Capture({format = "jpeg", quality = 80, x = 0, y = 0, w = ScrW(), h = ScrH()})
	if data then
		file.CreateDir("pr_selftest")
		file.Write("pr_selftest/" .. name .. ".jpg", data)
		log("screenshot " .. name .. " " .. ScrW() .. "x" .. ScrH() .. " bytes=" .. #data)
	else
		log("screenshot " .. name .. " failed")
	end
end)

-- Снимок карты сверху для мини-карты (pr_mapshot_sv.lua): ортокамера под самым небом, по плитке
-- за кадр, каждая — в data/pr_selftest/map_<ряд>_<столбец>.png. Ряд 0 — север (большие y)
local mapshot
net.Receive("PR_SELFTEST_MAPSHOT", function()
	mapshot = {
		minX = net.ReadFloat(), maxX = net.ReadFloat(), minY = net.ReadFloat(), maxY = net.ReadFloat(),
		z = net.ReadFloat(), n = net.ReadUInt(8), px = net.ReadUInt(16), i = 0, wait = 5
	}
	log("mapshot start")
end)

-- Без тумана: иначе дальние части карты сверху выходят серыми
hook.Add("SetupWorldFog", "PR_SelfTestMapshot", function()
	if mapshot then render.FogMode(MATERIAL_FOG_NONE) return true end
end)
hook.Add("SetupSkyboxFog", "PR_SelfTestMapshot", function()
	if mapshot then render.FogMode(MATERIAL_FOG_NONE) return true end
end)

hook.Add("PostRender", "PR_SelfTestMapshot", function()
	local m = mapshot
	if not m then return end
	if m.wait > 0 then m.wait = m.wait - 1 return end

	local n = m.n
	local r, c = math.floor(m.i / n), m.i % n
	local tw, th = (m.maxX - m.minX) / n, (m.maxY - m.minY) / n
	local cx, cy = m.minX + (c + 0.5) * tw, m.maxY - (r + 0.5) * th
	render.RenderView({
		origin = Vector(cx, cy, m.z), angles = Angle(90, 90, 0),
		x = 0, y = 0, w = m.px, h = m.px,
		ortho = {left = -tw / 2, right = tw / 2, top = -th / 2, bottom = th / 2},
		znear = 1, zfar = 60000,
		drawhud = false, drawviewmodel = false, drawmonitors = false, dopostprocess = false, bloomtone = false, drawviewer = false
	})
	local data = render.Capture({format = "png", x = 0, y = 0, w = m.px, h = m.px, alpha = false})
	file.CreateDir("pr_selftest")
	file.Write(string.format("pr_selftest/map_%d_%d.png", r, c), data or "")

	m.i = m.i + 1
	if m.i >= n * n then
		mapshot = nil
		net.Start("PR_SELFTEST_MAPSHOT_DONE")
			net.WriteUInt(n * n, 8)
		net.SendToServer()
		log("mapshot done")
	end
end)

-- Мини-карта: что знает клиент (точки, союзники, территории), рисуется ли; север сверху / поворот
net.Receive("PR_SELFTEST_MINIMAP", function()
	local cmd = net.ReadString()
	if cmd == "northup" then RunConsoleCommand("pr_minimap_rotate", "0") return end
	if cmd == "rotate" then RunConsoleCommand("pr_minimap_rotate", "1") return end

	local M = PR_Minimap or {}
	local points, allies, zones = {}, {}, {}
	for _, p in ipairs(ents.FindByClass("zahvat_ojka")) do
		table.insert(points, p:GetCurPoint() .. "=" .. p:GetCaptureTeam())
	end
	for index, a in pairs(M.allies or {}) do
		table.insert(allies, string.format("%d@%d,%d", index, a.pos.x, a.pos.y))
	end
	for _, z in ipairs(M.zones or {}) do table.insert(zones, z.name) end
	local b2 = player.GetBots()[2]
	net.Start("PR_SELFTEST_MINIMAP")
		net.WriteTable({
			visible = M.Visible and M.Visible() or false,
			drawnAgo = M.lastDraw and RealTime() - M.lastDraw or -1,
			points = points, allies = allies, zones = zones, zone = M.currentZone or "",
			b2Dormant = IsValid(b2) and b2:IsDormant() or "?"
		})
	net.SendToServer()
end)

-- Камера наблюдателя в скане техники (pr_selftest_scan_sv.lua): летает вокруг машины, которую
-- сейчас гоняют. Мышь вращает, колёсико — ближе/дальше, pr_scan_cam — вкл/выкл (свободный полёт)
local watch = {on = true, zoom = 1}

net.Receive("PR_SELFTEST_WATCH", function()
	watch.idx = net.ReadUInt(16)
	watch.target = net.ReadUInt(16)
	watch.title = net.ReadString()
	watch.info = net.ReadString()
	watch.active = watch.idx > 0
	if not watch.active then watch.last = nil end
end)

concommand.Add("pr_scan_cam", function()
	watch.on = not watch.on
	chat.AddText(watch.on and "Камера скана: за техникой" or "Камера скана: свободный полёт")
end)

local function Watching()
	return watch.on and watch.active
end

hook.Add("CalcView", "PR_SelfTestWatch", function(ply, origin, angles, fov)
	if not Watching() then return end
	local ent = Entity(watch.idx)
	-- Машину ещё не прислали или её уже убрали — держим последний кадр
	if not IsValid(ent) then return watch.last end

	local center = ent:WorldSpaceCenter()
	local dist = math.Clamp(ent:BoundingRadius() * 2.2 + 150, 300, 3000) * watch.zoom
	local tr = util.TraceLine({start = center, endpos = center - angles:Forward() * dist, mask = MASK_SOLID_BRUSHONLY})
	watch.last = {origin = tr.HitPos + tr.HitNormal * 10, angles = angles, fov = fov, drawviewer = true}
	return watch.last
end)

hook.Add("PlayerBindPress", "PR_SelfTestWatch", function(ply, bind, pressed)
	if not (Watching() and pressed) then return end
	if bind == "invprev" then watch.zoom = math.max(watch.zoom / 1.15, 0.3) return true end
	if bind == "invnext" then watch.zoom = math.min(watch.zoom * 1.15, 4) return true end
end)

hook.Add("HUDPaint", "PR_SelfTestWatch", function()
	if not watch.title then return end
	draw.SimpleTextOutlined(watch.title, "DermaLarge", ScrW() / 2, 20, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 2, color_black)
	if watch.info ~= "" then
		draw.SimpleTextOutlined(watch.info, "DermaDefaultBold", ScrW() / 2, 58, Color(255, 220, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	end
	if not Watching() then return end

	-- Где цель (бот, по которому стреляют)
	local target = Entity(watch.target or 0)
	if IsValid(target) then
		local p = (target:WorldSpaceCenter() + Vector(0, 0, 50)):ToScreen()
		if p.visible then
			draw.SimpleTextOutlined("[ ЦЕЛЬ ]", "DermaDefaultBold", p.x, p.y, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		end
	end
end)

-- Камера-режиссёр в тестах техники и полном наборе (pr_selftest_lib.lua): сервер раз в 7 с
-- присылает участника и план — «follow» (облёт сзади), «flyby» (камера впереди по курсу), «fixed»
-- (неподвижная сбоку). pr_test_cam — вкл/выкл
net.Receive("PR_SELFTEST_DIRECTOR", function()
	director.idx = net.ReadUInt(16)
	if director.idx == 0 then director.active = false return end
	director.target = net.ReadUInt(16)
	director.label = net.ReadString()
	director.plan = net.ReadString()
	director.cam = net.ReadVector()
	director.since = CurTime()
	director.active = true
	director.shots = (director.shots or 0) + 1
	if director.shots == 1 or director.shots % 20 == 0 then log("director #" .. director.shots .. ": " .. director.label .. " (" .. director.plan .. ")") end
end)

concommand.Add("pr_test_cam", function()
	director.on = not director.on
	chat.AddText(director.on and "Камера теста: режиссёр" or "Камера теста: глаза игрока")
end)

local function Directing()
	return director.on and director.active and not watch.active and CurTime() > (director.pauseUntil or 0)
end

hook.Add("CalcView", "PR_SelfTestDirector", function(ply, origin, angles, fov)
	if not Directing() then return end
	local ent = Entity(director.idx)
	if not IsValid(ent) then return director.last end
	local center = ent:WorldSpaceCenter()
	if director.plan == "follow" then
		-- Сзади по ходу (стоит — медленно облетаем), чуть сверху
		local vel = ent:GetVelocity()
		local yaw = vel:Length2D() > 100 and vel:Angle().y or (director.since * 7 + (CurTime() - director.since) * 15) % 360
		director.yaw = director.yaw and director.yaw + math.AngleDifference(yaw, director.yaw) * math.min(FrameTime() * 2, 1) or yaw
		local dist = math.Clamp(ent:BoundingRadius() * 2.5 + 200, 300, 2500)
		local ang = Angle(18, director.yaw, 0)
		local tr = util.TraceLine({start = center, endpos = center - ang:Forward() * dist, mask = MASK_SOLID_BRUSHONLY})
		director.last = {origin = tr.HitPos + tr.HitNormal * 10, angles = ang, fov = 75, drawviewer = true}
	else
		director.yaw = nil
		local dir = center - director.cam
		local d = dir:Length()
		-- Издали — ближе (узкий угол), рядом — шире
		local f = math.Clamp(75 * 700 / math.max(d, 1), 25, 80)
		director.last = {origin = director.cam, angles = dir:Angle(), fov = f, drawviewer = true}
	end
	return director.last
end)

hook.Add("HUDPaint", "PR_SelfTestDirector", function()
	if not Directing() then return end
	local names = {follow = "за объектом", flyby = "пролёт", fixed = "с места"}
	draw.SimpleTextOutlined("Камера: " .. tostring(director.label) .. " (" .. (names[director.plan] or director.plan) .. ")",
		"DermaDefaultBold", 16, ScrH() - 40, Color(255, 220, 120), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
	local target = Entity(director.target or 0)
	if IsValid(target) then
		local p = (target:WorldSpaceCenter() + Vector(0, 0, 50)):ToScreen()
		if p.visible then
			draw.SimpleTextOutlined("[ ЦЕЛЬ ]", "DermaDefaultBold", p.x, p.y, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		end
	end
end)

-- Полигон (pr_record_sv.lua): игрок в машине — над ботами-целями метка и расстояние, всегда
-- (не только во время записи и без камеры наблюдателя)
hook.Add("HUDPaint", "PR_SelfTestTargets", function()
	local me = LocalPlayer()
	if not (IsValid(me) and me:InVehicle()) or Watching() then return end
	local from = me:GetVehicle():GetPos()
	for _, bot in ipairs(player.GetBots()) do
		if IsValid(bot) and bot:Alive() then
			local pos = bot:WorldSpaceCenter()
			local p = (pos + Vector(0, 0, 60)):ToScreen()
			local flat = math.floor(Vector(pos.x - from.x, pos.y - from.y, 0):Length())
			if p.visible then
				surface.SetDrawColor(255, 60, 60)
				surface.DrawOutlinedRect(p.x - 14, p.y - 14, 28, 28, 2)
				draw.SimpleTextOutlined("ЦЕЛЬ " .. flat, "DermaDefaultBold", p.x, p.y - 18, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
			else
				draw.SimpleTextOutlined("цель позади · " .. flat, "DermaDefaultBold", ScrW() / 2, ScrH() - 140, Color(255, 80, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
			end
		end
	end
end)

hook.Add("InitPostEntity", "PR_SelfTestClient", function()
	timer.Simple(10, function()
		log("purchased tables: " .. tostring(istable(PR_PurchasedWeapons)) .. " " .. tostring(istable(PR_PurchasedModels)))
		log("ScrW x ScrH = " .. ScrW() .. "x" .. ScrH())
	end)
end)
