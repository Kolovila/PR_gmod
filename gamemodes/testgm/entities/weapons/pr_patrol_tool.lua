-- «Редактор патрулей»: админ расставляет споты, между которыми ходят патрули NPC (sv_patrols.lua),
-- и правит сами патрули (окно вариантов — gamemode/cl_patrols.lua).
-- ЛКМ — поставить спот на пол, куда смотришь. ПКМ — убрать ближайший. R — территория.
-- Shift+R — окно патрулей: создать, поправить, удалить, выпустить сейчас.
-- Пока редактор в руках, видны все споты: зелёные связаны с соседями, красные — ни с кем.
-- Выдать: из спавн-меню (Оружие → TestPR) или командой pr_patrol_edit.

if SERVER then AddCSLuaFile() end

SWEP.PrintName = "Редактор патрулей"
SWEP.Author = "PR"
SWEP.Category = "TestPR"
SWEP.Instructions = "ЛКМ — спот, ПКМ — убрать ближайший, R — территория, Shift+R — патрули"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = "models/weapons/c_toolgun.mdl"
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.UseHands = true
SWEP.Slot = 5
SWEP.SlotPos = 20
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Primary = {ClipSize = -1, DefaultClip = -1, Automatic = false, Ammo = "none"}
SWEP.Secondary = {ClipSize = -1, DefaultClip = -1, Automatic = false, Ammo = "none"}

-- ПКМ и «задать ближайшему» берут спот не дальше этого от точки прицела
local PICK_RADIUS = 150

function SWEP:Initialize()
	self:SetHoldType("pistol")
end

-- Куда смотрит владелец: только геометрия карты, сквозь игроков и NPC
local function AimTrace(owner)
	return util.TraceLine({
		start = owner:EyePos(),
		endpos = owner:EyePos() + owner:GetAimVector() * 8000,
		mask = MASK_SOLID_BRUSHONLY
	})
end

function SWEP:Deploy()
	if SERVER and PR_Patrol then
		PR_Patrol.SendSpots(self:GetOwner())
	end
	return true
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 0.3)
	if CLIENT then return end

	local owner = self:GetOwner()
	if not IsValid(owner) or not PR_IsAdmin(owner) then return end
	-- Клик был по окну редактора, а не в мир (см. PR_PatrolEditor.Guard в cl_patrols.lua)
	if PR_Patrol.UIBusy(owner) then return end

	local tr = AimTrace(owner)
	if not tr.Hit or tr.HitNormal.z < 0.6 then
		owner:ChatPrint("Спот ставится только на пол")
		return
	end

	local id = PR_Patrol.AddSpot(tr.HitPos, owner.PR_PatrolZone or "")
	if not id then return end

	owner:EmitSound("buttons/button14.wav")
	if not next(PR_Patrol.Links[id] or {}) then
		owner:ChatPrint("Спот #" .. id .. " пока ни с чем не связан: до соседнего не дальше "
			.. PR_PATROL_SETTINGS.linkDistance .. " и без стен на пути")
	end
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 0.3)
	if CLIENT then return end

	local owner = self:GetOwner()
	if not IsValid(owner) or not PR_IsAdmin(owner) then return end

	local id = PR_Patrol.NearestSpot(AimTrace(owner).HitPos, PICK_RADIUS)
	if id and PR_Patrol.RemoveSpot(id) then
		owner:EmitSound("buttons/button15.wav")
	end
end

function SWEP:Reload()
	if SERVER then return end
	if IsValid(PR_PatrolEditor.Menu) or IsValid(PR_PatrolEditor.TypesFrame) then return end
	if (PR_PatrolEditor.NextMenu or 0) > RealTime() then return end

	PR_PatrolEditor.NextMenu = RealTime() + 0.5
	if self:GetOwner():KeyDown(IN_SPEED) then
		PR_PatrolEditor.OpenTypes()
	else
		PR_PatrolEditor.OpenZoneMenu()
	end
end

if SERVER then return end

----------------------------------------------------------------------------------------------------
-- Клиент: отрисовка спотов и меню территории
----------------------------------------------------------------------------------------------------

PR_PatrolEditor = PR_PatrolEditor or {Spots = {}, Zone = ""}

net.Receive("PR_PatrolSpots", function()
	PR_PatrolEditor.Spots = net.ReadTable() or {}
end)

local COLOR_LINKED = Color(90, 190, 110)
local COLOR_ALONE = Color(220, 90, 80)
local COLOR_PICK = Color(255, 255, 255)

local function Holding()
	local wep = LocalPlayer():GetActiveWeapon()
	return IsValid(wep) and wep:GetClass() == "pr_patrol_tool"
end

-- Спот, на который сейчас указывает прицел (для ПКМ и «задать ближайшему»)
local function AimedSpot()
	local tr = AimTrace(LocalPlayer())
	local best, bestD
	for _, spot in ipairs(PR_PatrolEditor.Spots) do
		local d = spot.pos:DistToSqr(tr.HitPos)
		if d <= PICK_RADIUS * PICK_RADIUS and (not bestD or d < bestD) then
			best, bestD = spot, d
		end
	end
	return best
end

surface.CreateFont("PR_PatrolEditor3D", {font = "Bender", size = 48, weight = 700, extended = true, antialias = true})

hook.Add("PostDrawTranslucentRenderables", "PR_PatrolEditor", function(depth, skybox)
	if skybox or not Holding() then return end

	local spots = PR_PatrolEditor.Spots
	local byId = {}
	for _, spot in ipairs(spots) do byId[spot.id] = spot end

	local aimed = AimedSpot()
	local eye = EyePos()
	local labelAng = Angle(0, EyeAngles().y - 90, 90)

	render.SetColorMaterial()
	for _, spot in ipairs(spots) do
		local color = #spot.links > 0 and COLOR_LINKED or COLOR_ALONE
		if spot == aimed then color = COLOR_PICK end

		render.DrawSphere(spot.pos + Vector(0, 0, 10), 10, 12, 12, color)
		render.DrawLine(spot.pos, spot.pos + Vector(0, 0, 72), color, true)

		for _, other in ipairs(spot.links) do
			local o = byId[other]
			if o and other > spot.id then
				render.DrawLine(spot.pos + Vector(0, 0, 14), o.pos + Vector(0, 0, 14), COLOR_LINKED, true)
			end
		end
	end

	for _, spot in ipairs(spots) do
		if spot.pos:DistToSqr(eye) < 3000 * 3000 then
			local color = #spot.links > 0 and COLOR_LINKED or COLOR_ALONE
			local text = "#" .. spot.id .. (spot.zone ~= "" and ("  " .. spot.zone) or "")
			cam.Start3D2D(spot.pos + Vector(0, 0, 90), labelAng, 0.2)
				draw.SimpleTextOutlined(text, "PR_PatrolEditor3D", 0, 0, spot == aimed and COLOR_PICK or color, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, color_black)
			cam.End3D2D()
		end
	end
end)

function SWEP:DrawHUD()
	local S, C = PR_UI.S, PR_UI.Colors
	local spots = PR_PatrolEditor.Spots

	local alone = 0
	for _, spot in ipairs(spots) do
		if #spot.links == 0 then alone = alone + 1 end
	end

	local aimed = AimedSpot()
	local zone = PR_PatrolEditor.Zone ~= "" and PR_PatrolEditor.Zone or "не задана"

	local w, h = S(780), S(150)
	local x, y = math.floor(ScrW() / 2 - w / 2), ScrH() - h - S(30)

	PR_UI.Box(x, y, w, h, C.bg)
	PR_UI.Box(x, y, S(4), h, C.accent)
	PR_UI.Text("Редактор патрулей", "big", x + S(20), y + S(12), C.text)
	PR_UI.Text("Спотов: " .. #spots .. (alone > 0 and ("  ·  без связи: " .. alone) or ""), "normal", x + w - S(16), y + S(16), alone > 0 and C.bad or C.good, TEXT_ALIGN_RIGHT)
	PR_UI.Text("ЛКМ — спот    ПКМ — убрать ближайший    R — территория    Shift+R — патрули", "normal", x + S(20), y + S(54), C.muted)
	PR_UI.Text("Территория новых спотов: " .. zone, "normal", x + S(20), y + S(84), C.gold)
	if aimed then
		PR_UI.Text("Под прицелом спот #" .. aimed.id .. (aimed.zone ~= "" and ("  ·  " .. aimed.zone) or "") .. "  ·  связей: " .. #aimed.links,
			"small", x + S(20), y + S(116), C.text)
	end
end

-- Меню R: территория для новых спотов, переименовать спот под прицелом
function PR_PatrolEditor.OpenZoneMenu()
	local S, C = PR_UI.S, PR_UI.Colors
	local aimed = AimedSpot()

	local frame, body = PR_UI.Popup("Территория", 560, 470)
	PR_PatrolEditor.Menu = frame
	PR_PatrolEditor.Guard(frame)

	local hint = vgui.Create("DLabel", body)
	hint:Dock(TOP)
	hint:SetTall(S(52))
	hint:SetFont(PR_UI.Font("small"))
	hint:SetTextColor(C.muted)
	hint:SetWrap(true)
	hint:SetText("Патруль ходит между разными территориями и задерживается на каждой. Назови районы: «Город», «Южная военка»...")

	local entry = vgui.Create("DTextEntry", body)
	entry:Dock(TOP)
	entry:SetTall(S(40))
	entry:DockMargin(0, S(6), 0, S(10))
	entry:SetFont(PR_UI.Font("normal"))
	entry:SetPlaceholderText("Название территории")
	entry:SetValue(aimed and aimed.zone ~= "" and aimed.zone or PR_PatrolEditor.Zone)

	local function SetForNew()
		PR_PatrolEditor.Zone = string.Trim(entry:GetValue())
		net.Start("PR_PatrolSetZone")
			net.WriteString(PR_PatrolEditor.Zone)
		net.SendToServer()
	end

	local forNew = PR_UI.Button(body, "Для новых спотов", function()
		SetForNew()
		frame:Remove()
	end, {height = 44, color = C.accent, hoverColor = C.accentDark})
	forNew:Dock(TOP)
	forNew:DockMargin(0, 0, 0, S(8))

	if aimed then
		local forAimed = PR_UI.Button(body, "Задать споту #" .. aimed.id .. " под прицелом", function()
			net.Start("PR_PatrolSpotZone")
				net.WriteUInt(aimed.id, 32)
				net.WriteString(string.Trim(entry:GetValue()))
			net.SendToServer()
			SetForNew()
			frame:Remove()
		end, {height = 44, color = C.accentDark, hoverColor = C.accent})
		forAimed:Dock(TOP)
		forAimed:DockMargin(0, 0, 0, S(8))
	end

	local types = PR_UI.Button(body, "Варианты патрулей…", function()
		frame:Remove()
		PR_PatrolEditor.OpenTypes()
	end, {height = 44, color = C.panel2})
	types:Dock(BOTTOM)
	types:DockMargin(0, S(8), 0, 0)

	-- Уже названные территории: клик подставляет название
	local zones = {}
	for _, spot in ipairs(PR_PatrolEditor.Spots) do
		if spot.zone ~= "" then zones[spot.zone] = (zones[spot.zone] or 0) + 1 end
	end

	local list = vgui.Create("DScrollPanel", body)
	list:Dock(FILL)
	list:DockMargin(0, S(6), 0, 0)
	for name, count in SortedPairs(zones) do
		local btn = PR_UI.Button(list, name .. "   (" .. count .. ")", function()
			entry:SetValue(name)
		end, {height = 36, alignLeft = true, color = C.panel})
		btn:Dock(TOP)
		btn:DockMargin(0, 0, 0, S(4))
	end
end
