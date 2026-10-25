-- Мини-карта справа сверху. Снимок карты сверху (config/minimap.lua), ты — стрелка в центре,
-- союзники — зелёные стрелки, точки захвата — флаг владельца и название, территории — названия
-- из редактора патрулей (посередине спотов территории), под картой — в какой ты сейчас.
--   pr_minimap 0         — спрятать
--   pr_minimap_rotate 0  — север всегда сверху (по умолчанию карта поворачивается вслед за взглядом)
--   pr_minimap_range N   — сколько юнитов карты видно поперёк (1500–12000)
PR_Minimap = PR_Minimap or {allies = {}, zones = {}}

local CV_ON = CreateClientConVar("pr_minimap", "1", true, false, "Мини-карта справа сверху (0 — выключить)")
local CV_ROTATE = CreateClientConVar("pr_minimap_rotate", "1", true, false, "Мини-карта поворачивается вслед за взглядом (0 — север всегда сверху)")
local CV_RANGE = CreateClientConVar("pr_minimap_range", "4000", true, false, "Сколько юнитов карты видно поперёк мини-карты", 1500, 12000)

local S = PR_UI.S
local C = PR_UI.Colors

local ALLY_STALE = 2      -- секунд: дольше без вестей о союзнике — не рисуем
local ZONE_NEAR = 2500    -- ближе к споту территории — ты «в ней»

local function CreateFonts()
	surface.CreateFont("PR_Minimap_Zone", {font = "Bender", size = S(17), weight = 700, extended = true, antialias = true})
	surface.CreateFont("PR_Minimap_Label", {font = "Bender", size = S(15), weight = 600, extended = true, antialias = true})
	surface.CreateFont("PR_Minimap_Small", {font = "Bender", size = S(13), weight = 600, extended = true, antialias = true})
end
CreateFonts()
hook.Add("PR_UI_Rescaled", "PR_Minimap", CreateFonts)

----------------------------------------------------------------------------------------------------
-- Данные с сервера (sv_minimap.lua)
----------------------------------------------------------------------------------------------------

-- Каждый раз — весь список своей группировки: кто сменил сторону или вышел, пропадает сразу
net.Receive("PR_MinimapAllies", function()
	local now, allies = CurTime(), {}
	for _ = 1, net.ReadUInt(8) do
		local index = net.ReadUInt(8)
		local x, y = net.ReadInt(17), net.ReadInt(17)
		allies[index] = {pos = Vector(x, y, 0), yaw = net.ReadUInt(9) - 180, at = now}
	end
	PR_Minimap.allies = allies
end)

net.Receive("PR_MinimapZones", function()
	local zones = {}
	for _ = 1, net.ReadUInt(8) do
		local zone = {name = net.ReadString(), spots = {}}
		local sx, sy, n = 0, 0, net.ReadUInt(8)
		for _ = 1, n do
			local x, y = net.ReadInt(17), net.ReadInt(17)
			table.insert(zone.spots, Vector(x, y, 0))
			sx, sy = sx + x, sy + y
		end
		zone.center = Vector(sx / math.max(n, 1), sy / math.max(n, 1), 0)
		table.insert(zones, zone)
	end
	PR_Minimap.zones = zones
end)

hook.Add("InitPostEntity", "PR_Minimap", function()
	net.Start("PR_MinimapZones")
	net.SendToServer()
end)

-- В какой территории точка: название территории ближайшего спота (не дальше ZONE_NEAR)
function PR_Minimap.ZoneAt(pos)
	local best, bestD = nil, ZONE_NEAR * ZONE_NEAR
	for _, zone in ipairs(PR_Minimap.zones) do
		for _, spot in ipairs(zone.spots) do
			local d = (spot.x - pos.x) ^ 2 + (spot.y - pos.y) ^ 2
			if d < bestD then best, bestD = zone.name, d end
		end
	end
	return best
end

----------------------------------------------------------------------------------------------------
-- Геометрия
----------------------------------------------------------------------------------------------------

local mapMaterial, mapMaterialPath
local function MapConfig()
	local cfg = PR_MINIMAPS and PR_MINIMAPS[string.lower(game.GetMap())]
	if not cfg then return end
	if mapMaterialPath ~= cfg.material then
		mapMaterial, mapMaterialPath = Material(cfg.material, "smooth mips"), cfg.material
	end
	return cfg
end

-- Квадрат мини-карты: x, y, сторона
function PR_Minimap.Rect()
	local size = S(250)
	local margin = S(16)
	return ScrW() - size - margin, margin, size
end

function PR_Minimap.Visible()
	local lp = LocalPlayer()
	return CV_ON:GetBool() and IsValid(lp) and lp:Alive() and MapConfig() ~= nil
end

-- Перевод мира в экран мини-карты. alpha — поворот мира (градусы, против часовой): при
-- повороте за взглядом курс игрока смотрит вверх
local function Projector(x0, y0, size, center, alpha, range)
	local scale = size / range
	local a = math.rad(alpha)
	local ca, sa = math.cos(a), math.sin(a)
	local cx, cy = x0 + size / 2, y0 + size / 2
	return function(pos)
		local wx, wy = pos.x - center.x, pos.y - center.y
		return cx + (wx * ca - wy * sa) * scale, cy - (wx * sa + wy * ca) * scale
	end
end

-- Угол стрелки на экране (радианы, 0 — вверх) для курса yaw в мире
local function ScreenAngle(yaw, alpha)
	return math.rad(90 - (yaw + alpha))
end

-- Точка за краем — прижать к краю (с отступом inset); true, если прижали
local function ClampToEdge(sx, sy, x0, y0, size, inset)
	local cx, cy, half = x0 + size / 2, y0 + size / 2, size / 2 - inset
	local dx, dy = sx - cx, sy - cy
	local m = math.max(math.abs(dx), math.abs(dy))
	if m <= half then return sx, sy, false end
	return cx + dx * half / m, cy + dy * half / m, true
end

----------------------------------------------------------------------------------------------------
-- Рисование
----------------------------------------------------------------------------------------------------

local function Arrow(x, y, ang, size, color)
	local c, s = math.cos(ang), math.sin(ang)
	local function P(dx, dy) return {x = x + dx * c - dy * s, y = y + dx * s + dy * c} end
	draw.NoTexture()
	surface.SetDrawColor(0, 0, 0, 200)
	surface.DrawPoly({P(0, -size - 2), P(size * 0.8 + 2, size + 2), P(0, size * 0.45), P(-size * 0.8 - 2, size + 2)})
	surface.SetDrawColor(color)
	surface.DrawPoly({P(0, -size), P(size * 0.7, size * 0.8), P(0, size * 0.35), P(-size * 0.7, size * 0.8)})
end

local function Dot(x, y, r, color)
	draw.NoTexture()
	surface.SetDrawColor(0, 0, 0, 200)
	surface.DrawRect(x - r - 1, y - r - 1, (r + 1) * 2, (r + 1) * 2)
	surface.SetDrawColor(color)
	surface.DrawRect(x - r, y - r, r * 2, r * 2)
end

local function Label(text, font, x, y, color, alignY)
	draw.SimpleTextOutlined(text, font, x, y, color, TEXT_ALIGN_CENTER, alignY or TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 220))
end

local flagCache = {}
local function FlagMaterial(team)
	if not PR_IsFraction(team) then return end
	if flagCache[team] == nil then
		local mini = "test_gm_mat/mini_flags/" .. string.lower(team) .. ".png"
		local path = file.Exists("materials/" .. mini, "GAME") and mini or PR_FractionFlag(team)
		flagCache[team] = file.Exists("materials/" .. path, "GAME") and Material(path, "smooth") or false
	end
	return flagCache[team] or nil
end

-- Где союзник: рядом — сам игрок, вдали — что прислал сервер
local function AllyState(ply)
	if not ply:IsDormant() then return ply:GetPos(), ply:EyeAngles().y end
	local known = PR_Minimap.allies[ply:EntIndex()]
	if known and CurTime() - known.at < ALLY_STALE then return known.pos, known.yaw end
end

function PR_Minimap.Draw()
	if not PR_Minimap.Visible() then return end
	local cfg = MapConfig()
	local lp = LocalPlayer()
	local x0, y0, size = PR_Minimap.Rect()
	local me = lp:GetPos()
	local myYaw = lp:GetAimVector():Angle().y
	local alpha = CV_ROTATE:GetBool() and (90 - myYaw) or 0
	local W = Projector(x0, y0, size, me, alpha, CV_RANGE:GetFloat())
	local myFrac = lp:GetNWString("PR_fraction")

	-- Рамка и подложка
	PR_UI.Box(x0 - S(3), y0 - S(3), size + S(6), size + S(6), C.bg)

	render.SetScissorRect(x0, y0, x0 + size, y0 + size, true)

	-- Карта: прямоугольник снимка по его углам в мире, поворот — заодно
	local tlx, tly = W(Vector(cfg.minX, cfg.maxY, 0))
	local trx, try = W(Vector(cfg.maxX, cfg.maxY, 0))
	local brx, bry = W(Vector(cfg.maxX, cfg.minY, 0))
	local blx, bly = W(Vector(cfg.minX, cfg.minY, 0))
	surface.SetMaterial(mapMaterial)
	surface.SetDrawColor(255, 255, 255, 255)
	surface.DrawPoly({
		{x = tlx, y = tly, u = 0, v = 0}, {x = trx, y = try, u = 1, v = 0},
		{x = brx, y = bry, u = 1, v = 1}, {x = blx, y = bly, u = 0, v = 1}
	})
	-- Чуть притемнить: значки и надписи читаются на светлом песке
	surface.SetDrawColor(0, 0, 0, 50)
	surface.DrawRect(x0, y0, size, size)

	-- Названия территорий
	for _, zone in ipairs(PR_Minimap.zones) do
		local sx, sy = W(zone.center)
		Label(zone.name, "PR_Minimap_Zone", sx, sy, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)
	end

	-- Точки захвата: флаг владельца (или серый кружок у ничьей), рамка — своя/чужая
	local now = CurTime()
	for _, point in ipairs(ents.FindByClass("zahvat_ojka")) do
		local team = point:GetCaptureTeam()
		local px, py = W(point:GetPos())
		local sx, sy, clamped = ClampToEdge(px, py, x0, y0, size, S(10))
		local ring = (team == myFrac and myFrac ~= "") and C.good or (PR_IsFraction(team) and C.bad or C.muted)
		if IsValid(point:GetCapturer()) and math.floor(now * 3) % 2 == 0 then ring = C.gold end

		local half = clamped and S(6) or S(9)
		draw.NoTexture()
		surface.SetDrawColor(ring)
		surface.DrawRect(sx - half - S(2), sy - half - S(2), (half + S(2)) * 2, (half + S(2)) * 2)
		local flag = FlagMaterial(team)
		if flag then
			surface.SetMaterial(flag)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect(sx - half, sy - half, half * 2, half * 2)
		else
			-- Ничья: светло-серая плашка
			surface.SetDrawColor(200, 204, 210, 255)
			surface.DrawRect(sx - half, sy - half, half * 2, half * 2)
		end
		if not clamped then
			local name = point:GetCurPoint()
			if name ~= "" then Label(name, "PR_Minimap_Label", sx, sy + half + S(3), C.text) end
		end
	end

	-- Союзники
	for _, ply in ipairs(player.GetAll()) do
		if ply ~= lp and ply:Alive() and not ply:GetNWBool("PR_PatrolCrew") and PR_AreAllies(myFrac, ply:GetNWString("PR_fraction")) then
			local pos, yaw = AllyState(ply)
			if pos then
				local px, py = W(pos)
				local sx, sy, clamped = ClampToEdge(px, py, x0, y0, size, S(6))
				if clamped then
					Dot(sx, sy, S(3), C.good)
				else
					Arrow(sx, sy, ScreenAngle(yaw, alpha), S(6), C.good)
					Label(ply:Nick(), "PR_Minimap_Small", sx, sy + S(8), C.good)
				end
			end
		end
	end

	-- Ты: поверх всего, золотом — не путается с белыми надписями
	Arrow(x0 + size / 2, y0 + size / 2, ScreenAngle(myYaw, alpha), S(10), C.gold)

	render.SetScissorRect(0, 0, 0, 0, false)

	-- Север на краю, когда карта поворачивается
	if alpha ~= 0 then
		local fx, fy = W(me + Vector(0, 100000, 0))
		local nx, ny = ClampToEdge(fx, fy, x0, y0, size, S(9))
		Label("С", "PR_Minimap_Label", nx, ny, C.gold, TEXT_ALIGN_CENTER)
	end

	PR_UI.Outline(x0 - S(3), y0 - S(3), size + S(6), size + S(6), C.line)

	-- Где ты: территория под картой
	local zone = PR_Minimap.ZoneAt(me)
	PR_Minimap.currentZone = zone
	if zone then
		surface.SetFont("PR_Minimap_Label")
		local tw, th = surface.GetTextSize(zone)
		local bw, bh = tw + S(16), th + S(6)
		local bx, by = x0 + size / 2 - bw / 2, y0 + size + S(6)
		PR_UI.Box(bx, by, bw, bh, C.bg)
		draw.SimpleText(zone, "PR_Minimap_Label", bx + bw / 2, by + bh / 2, C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	PR_Minimap.lastDraw = RealTime()
end

hook.Add("HUDPaint", "PR_Minimap", PR_Minimap.Draw)

-- Сообщения об убийствах (справа сверху) — под мини-картой, а не поверх неё
function GM:DrawDeathNotice(x, y)
	if PR_Minimap.Visible() then
		local _, my, size = PR_Minimap.Rect()
		y = (my + size + S(44)) / ScrH()
	end
	return self.BaseClass.DrawDeathNotice(self, x, y)
end
