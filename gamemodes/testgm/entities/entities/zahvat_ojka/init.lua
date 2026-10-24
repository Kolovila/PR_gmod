AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("OpenIDKPanel")
util.AddNetworkString("OpenAdminPanel")
util.AddNetworkString("GetPointsCfgs")
util.AddNetworkString("GivePointsCfgs")
util.AddNetworkString("SetServerPointsCfgs")
util.AddNetworkString("CreateNewCfgs")
util.AddNetworkString("SetPoint")
util.AddNetworkString("UpgradePoint")
util.AddNetworkString("SpawnGuardianNPC")
util.AddNetworkString("PR_PointTakeMoney")
util.AddNetworkString("PR_PointRemove")

local CAPTURE_TIME = CreateConVar("pr_capture_time", "20", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Сколько секунд стоять у точки, чтобы её захватить")

local CFG_DIR = "pr_gamemode"
-- Состояние точек по имени: команда и улучшения (общее для всех карт, как и раньше)
local CFG_FILE = CFG_DIR .. "/capture_points_list.txt"

local function LoadPointsConfig()
	return util.JSONToTable(file.Read(CFG_FILE, "DATA") or "") or {}
end

local function SavePointsConfig(cfg)
	if not file.Exists(CFG_DIR, "DATA") then
		file.CreateDir(CFG_DIR)
	end

	file.Write(CFG_FILE, util.TableToJSON(cfg, true))
end

-- Где стоят точки на текущей карте: {["имя"] = {Pos = Vector, Ang = Angle}}
local function LayoutFile()
	return CFG_DIR .. "/points_" .. string.lower(game.GetMap()) .. ".txt"
end

local function LoadLayout()
	return util.JSONToTable(file.Read(LayoutFile(), "DATA") or "") or {}
end

local function SaveLayout(layout)
	if not file.Exists(CFG_DIR, "DATA") then
		file.CreateDir(CFG_DIR)
	end

	file.Write(LayoutFile(), util.TableToJSON(layout, true))
end

local function IsPoint(ent)
	return IsValid(ent) and ent:GetClass() == "zahvat_ojka"
end

function ENT:Initialize()
	self:SetModel(self.Model)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetHealth(self.BaseHealth)

	self:SetUpgradeComputer(1)

	self.Guardians = {}
end

function ENT:SpawnFunction(ply, tr, ClassName)
	if not tr.Hit then return end

	local trace = util.TraceLine({
		start = ply:EyePos(),
		endpos = ply:EyePos() + 95 * ply:GetAimVector(),
		filter = ply
	})

	local point = ents.Create(ClassName)
	point:SetPos(trace.HitPos)
	point:Spawn()
	point:Activate()
	point:SpawnModules()

	return point
end

-- Монитор, системник, клавиатура и флаг на точке
function ENT:SpawnModules()
	local function AddModule(model, pos, skin)
		local prop = ents.Create("prop_physics")
		prop:SetPos(pos)
		prop:SetAngles(self:GetAngles())
		prop:SetModel(model)
		if skin then prop:SetSkin(skin) end
		prop:Spawn()
		prop:Activate()
		prop:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		prop:SetMoveType(MOVETYPE_NONE)
		prop:SetParent(self, -1)
	end

	AddModule("models/props_lab/monitor01a.mdl", self:GetPos() + Vector(-10, 0, 31.5))
	AddModule("models/props_lab/harddrive02.mdl", self:GetPos() + self:GetUp() * 30 + self:GetRight() * -30)
	AddModule("models/props/cs_office/computer_keyboard.mdl", self:GetPos() + Vector(20, 0, 20))
	AddModule("models/gmodflags/flagpole05.mdl", self:GetPos() + Vector(0, -80, -20), 24)
end

function ENT:Use(activator)
	if not IsValid(activator) or not activator:IsPlayer() then return end

	local frac = activator:GetNWString("PR_fraction")
	local team = self:GetCaptureTeam()

	-- Ненастроенная точка, или админ в группировке «admin»: меню настройки
	if team == "" or frac == "admin" then
		if PR_IsAdmin(activator) then
			net.Start("OpenAdminPanel")
				net.WriteEntity(self)
			net.Send(activator)
		else
			activator:ChatPrint("Точка ещё не настроена админом")
		end
		return
	end

	if frac == team then
		net.Start("OpenIDKPanel")
			net.WriteEntity(self)
		net.Send(activator)
		return
	end

	if frac == "" then
		activator:ChatPrint("Сначала выбери группировку (F4)")
		return
	end

	self:StartCapture(activator)
end

function ENT:NotifyTeam(team, text)
	if team == "" then return end

	for _, v in ipairs(player.GetAll()) do
		if v:GetNWString("PR_fraction") == team then
			v:ChatPrint(text)
		end
	end
end

function ENT:StartCapture(ply)
	local capturer = self:GetCapturer()
	if IsValid(capturer) then
		if capturer ~= ply then
			ply:ChatPrint("Точку уже захватывает " .. capturer:Nick())
		end
		return
	end

	local time = math.max(CAPTURE_TIME:GetFloat(), 1)
	self:SetCapturer(ply)
	self:SetCaptureStart(CurTime())
	self:SetCaptureEnd(CurTime() + time)

	ply:ChatPrint("Захват начат: держись рядом с точкой " .. math.Round(time) .. " с.")
	self:NotifyTeam(self:GetCaptureTeam(), "Точку «" .. self:GetCurPoint() .. "» захватывают!")
end

function ENT:StopCapture()
	self:SetCapturer(NULL)
	self:SetCaptureStart(0)
	self:SetCaptureEnd(0)
end

function ENT:FinishCapture(ply)
	local newTeam = ply:GetNWString("PR_fraction")
	local oldTeam = self:GetCaptureTeam()

	self:StopCapture()
	self:SetCaptureTeam(newTeam)
	self:SetStoredMoney(0)
	self:SetNextIncome(CurTime() + self:GetIncomeInterval())

	-- Защитники прошлого владельца остаются воевать, но больше не считаются за точкой
	for guard in pairs(self.Guardians) do
		if IsValid(guard) then guard.PR_GuardPoint = nil end
	end
	self.Guardians = {}
	self:SetGuardianCount(0)

	self:SavePointState()

	ply:ChatPrint("Точка захвачена!")
	self:NotifyTeam(oldTeam, "Точка «" .. self:GetCurPoint() .. "» потеряна!")
end

function ENT:SavePointState()
	if self:GetCurPoint() == "" then return end

	local cfg = LoadPointsConfig()
	cfg[self:GetCurPoint()] = {
		["Team"] = self:GetCaptureTeam(),
		["Monitor"] = self:GetUpgradeMonitor(),
		["System"] = self:GetUpgradeComputer()
	}
	SavePointsConfig(cfg)
end

function ENT:Think()
	local capturer = self:GetCapturer()

	if IsValid(capturer) then
		local frac = capturer:GetNWString("PR_fraction")
		local tooFar = capturer:GetPos():DistToSqr(self:GetPos()) > self.CaptureRadius ^ 2

		if not capturer:Alive() or tooFar or frac == "" or frac == self:GetCaptureTeam() then
			capturer:ChatPrint("Захват прерван")
			self:StopCapture()
		elseif CurTime() >= self:GetCaptureEnd() then
			self:FinishCapture(capturer)
		end
	elseif self:GetCaptureEnd() ~= 0 then
		-- Захватчик вышел с сервера
		self:StopCapture()
	end

	if self:HasOwner() then
		if self:GetNextIncome() == 0 then
			self:SetNextIncome(CurTime() + self:GetIncomeInterval())
		elseif CurTime() >= self:GetNextIncome() then
			self:SetStoredMoney(self:GetStoredMoney() + self:GetIncomeAmount())
			self:SetNextIncome(CurTime() + self:GetIncomeInterval())
		end
	end

	self:NextThink(CurTime() + 0.5)
	return true
end

-- Может ли игрок пользоваться меню своей точки
function ENT:CanManage(ply)
	return IsValid(ply) and ply:Alive()
		and self:HasOwner()
		and ply:GetNWString("PR_fraction") == self:GetCaptureTeam()
		and ply:GetPos():DistToSqr(self:GetPos()) <= self.CaptureRadius ^ 2
end

-- Место для защитника рядом с точкой. Раньше его роняли с высоты 500, чтобы не застревал,
-- но под потолком он так попадал на крышу или в текстуру. Теперь ищем место явно:
-- 1) опускаемся на пол карты (только геометрия мира, сквозь точку и её пропы),
-- 2) хитбокс NPC ни с чем не пересекается (точка, флаг, пропы, стены),
-- 3) от точки до места нет стены, чтобы не попасть в соседнюю комнату.
function ENT:FindGuardianSpot()
	local base = self:GetPos()
	local mins, maxs = Vector(-16, -16, 0), Vector(16, 16, 72)

	for i = 1, 16 do
		local ang = math.rad(math.random(0, 359))
		local dist = math.random(80, 200)
		local pos = base + Vector(math.cos(ang) * dist, math.sin(ang) * dist, 0)

		local down = util.TraceLine({
			start = pos + Vector(0, 0, 64),
			endpos = pos - Vector(0, 0, 256),
			mask = MASK_NPCSOLID_BRUSHONLY
		})

		if down.Hit and not down.StartSolid then
			local spot = down.HitPos + Vector(0, 0, 4)

			local hull = util.TraceHull({
				start = spot,
				endpos = spot,
				mins = mins,
				maxs = maxs,
				mask = MASK_NPCSOLID
			})

			local wall = util.TraceLine({
				start = base + Vector(0, 0, 40),
				endpos = spot + Vector(0, 0, 40),
				mask = MASK_NPCSOLID_BRUSHONLY
			})

			if not hull.Hit and not wall.Hit then return spot end
		end
	end

	-- Не нашли места: над точкой, как запасной вариант
	return base + Vector(0, 0, 64)
end

function ENT:SpawnGuardian(class, weaponClass, hpMul, signal)
	local npcData = list.Get("NPC")[class]
	if not npcData then return end

	local guard = ents.Create(class)
	if not IsValid(guard) then return end

	if weaponClass and weaponClass ~= "" then
		guard:SetKeyValue("additionalequipment", weaponClass)
	end

	local spawnFlags = bit.bor(SF_NPC_FADE_CORPSE, SF_NPC_ALWAYSTHINK)
	if npcData.SpawnFlags then spawnFlags = bit.bor(spawnFlags, npcData.SpawnFlags) end
	if npcData.TotalSpawnFlags then spawnFlags = npcData.TotalSpawnFlags end
	guard:SetKeyValue("spawnflags", spawnFlags)

	if npcData.KeyValues then
		for k, v in pairs(npcData.KeyValues) do
			guard:SetKeyValue(k, v)
		end
	end

	local team = self:GetCaptureTeam()

	guard:SetPos(self:FindGuardianSpot())
	guard:SetAngles(Angle(0, math.random(0, 359), 0))

	-- Свой/чужой: правки в addons/VJ-Base читают WhiteFractionList.
	-- Отдельный VJ-класс на фракцию, чтобы защитники разных фракций воевали друг с другом.
	guard.WhiteFractionList = team
	guard.VJ_NPC_Class = {"CLASS_PR_" .. team}
	guard:SetNWString("PR_fraction", team)

	guard.SignalUpgrade = signal
	guard.SignalPoint = self:GetCurPoint()
	guard.PR_GuardPoint = self

	guard:Spawn()
	guard:Activate()

	-- Некоторые VJ-паки ставят свой класс в Initialize, возвращаем фракционный
	guard.VJ_NPC_Class = {"CLASS_PR_" .. team}

	guard:SetHealth(math.floor(guard:Health() * hpMul))
	guard:SetMaxHealth(guard:Health())

	self.Guardians[guard] = true
	self:SetGuardianCount(table.Count(self.Guardians))

	return guard
end

local function ForgetGuardian(guard)
	local point = guard.PR_GuardPoint
	if not IsPoint(point) or not point.Guardians then return end

	guard.PR_GuardPoint = nil
	point.Guardians[guard] = nil
	point:SetGuardianCount(table.Count(point.Guardians))
end

hook.Add("OnNPCKilled", "PR_GuardianKilled", function(npc)
	ForgetGuardian(npc)
end)

hook.Add("EntityRemoved", "PR_GuardianRemoved", function(ent)
	if ent.PR_GuardPoint then ForgetGuardian(ent) end
end)

net.Receive("PR_PointTakeMoney", function(len, ply)
	local point = net.ReadEntity()
	if not IsPoint(point) or not point:CanManage(ply) then return end

	local money = point:GetStoredMoney()
	if money <= 0 then return end

	point:SetStoredMoney(0)
	ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") + money)
end)

net.Receive("UpgradePoint", function(len, ply)
	local point = net.ReadEntity()
	local kind = net.ReadString()

	if not IsPoint(point) or not point:CanManage(ply) then return end

	if not ply:GetNWBool("PR_leader_" .. ply:GetNWString("PR_fraction")) then
		ply:ChatPrint("Ты не лидер фракции")
		return
	end

	local price = point:GetUpgradePrice(kind)
	if not price then return end

	if ply:GetNWInt("PR_money") < price then
		ply:ChatPrint("Не хватает денег")
		return
	end

	ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)

	if kind == "monitor" then
		point:SetUpgradeMonitor(point:GetUpgradeMonitor() + 1)
	else
		point:SetUpgradeComputer(point:GetUpgradeComputer() + 1)
	end

	point:SavePointState()
end)

net.Receive("SpawnGuardianNPC", function(len, ply)
	local point = net.ReadEntity()
	local typeKey = net.ReadString()
	local weaponKey = net.ReadString()
	local hpIndex = net.ReadUInt(4)
	local signal = net.ReadBool()

	if not IsPoint(point) or not point:CanManage(ply) then return end

	if point:GetGuardianCount() >= point.MaxGuardianCount then
		ply:ChatPrint("Защитников уже максимальное количество")
		return
	end

	local price = point:GetGuardianPrice(typeKey, weaponKey, hpIndex, signal)
	if not price then return end

	if ply:GetNWInt("PR_money") < price then
		ply:ChatPrint("Не хватает денег")
		return
	end

	local gtype = point.GuardianTypes[typeKey]
	local weapon = weaponKey ~= "" and point.GuardianWeapons[gtype.Weapons][weaponKey].ClassName or ""

	local guard = point:SpawnGuardian(gtype.ClassName, weapon, point.GuardianHealthMul[hpIndex], signal)
	if not IsValid(guard) then
		ply:ChatPrint("Не удалось призвать защитника: нет NPC " .. gtype.ClassName)
		return
	end

	ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)
end)

-- Ниже меню настройки точек, только для админов

net.Receive("GetPointsCfgs", function(len, ply)
	if not PR_IsAdmin(ply) then return end

	net.Start("GivePointsCfgs")
		net.WriteTable(LoadPointsConfig())
	net.Send(ply)
end)

net.Receive("SetServerPointsCfgs", function(len, ply)
	local name = net.ReadString()
	local point = net.ReadEntity()

	if not PR_IsAdmin(ply) or not IsPoint(point) then return end
	if not LoadPointsConfig()[name] then return end

	point:SetCurPoint(name)
end)

net.Receive("CreateNewCfgs", function(len, ply)
	local name = string.Trim(net.ReadString())
	local point = net.ReadEntity()

	if not PR_IsAdmin(ply) or not IsPoint(point) then return end
	if name == "" or #name > 64 then return end

	local cfg = LoadPointsConfig()
	cfg[name] = cfg[name] or {
		["Team"] = "Ничья",
		["Monitor"] = 0,
		["System"] = 1
	}
	SavePointsConfig(cfg)

	point:SetCurPoint(name)
end)

-- Применить сохранённое состояние точки (команда, улучшения) по её имени
function ENT:LoadConfig()
	local data = LoadPointsConfig()[self:GetCurPoint()]
	if not data then return false end

	local team = data["Team"]
	if not isstring(team) or team == "" then team = "Ничья" end

	self:StopCapture()
	self:SetCaptureTeam(team)
	self:SetUpgradeMonitor(tonumber(data["Monitor"]) or 0)
	self:SetUpgradeComputer(tonumber(data["System"]) or 1)
	self:SetStoredMoney(0)
	self:SetNextIncome(CurTime() + self:GetIncomeInterval())

	return true
end

-- «Установить точку»: применяем состояние и запоминаем, где точка стоит на этой карте
net.Receive("SetPoint", function(len, ply)
	local point = net.ReadEntity()

	if not PR_IsAdmin(ply) or not IsPoint(point) then return end

	if not point:LoadConfig() then
		ply:ChatPrint("Сначала выбери или создай точку")
		return
	end

	local layout = LoadLayout()
	layout[point:GetCurPoint()] = {
		["Pos"] = point:GetPos(),
		["Ang"] = point:GetAngles()
	}
	SaveLayout(layout)

	ply:ChatPrint("Точка «" .. point:GetCurPoint() .. "» сохранена на карте " .. game.GetMap())
end)

-- «Убрать с карты»: удалить точку и забыть её позицию (команда и улучшения в конфиге остаются)
net.Receive("PR_PointRemove", function(len, ply)
	local point = net.ReadEntity()

	if not PR_IsAdmin(ply) or not IsPoint(point) then return end

	local name = point:GetCurPoint()
	if name ~= "" then
		local layout = LoadLayout()
		layout[name] = nil
		SaveLayout(layout)
	end

	point:Remove()
	ply:ChatPrint("Точка «" .. name .. "» убрана с карты")
end)

-- Расставить сохранённые точки после загрузки карты и после очистки (game.CleanUpMap)
local function SpawnSavedPoints()
	local existing = {}
	for _, point in ipairs(ents.FindByClass("zahvat_ojka")) do
		existing[point:GetCurPoint()] = true
	end

	for name, place in pairs(LoadLayout()) do
		if not existing[name] and isvector(place["Pos"]) then
			local point = ents.Create("zahvat_ojka")
			point:SetPos(place["Pos"])
			point:SetAngles(isangle(place["Ang"]) and place["Ang"] or Angle(0, 0, 0))
			point:Spawn()
			point:Activate()
			point:SpawnModules()
			point:SetCurPoint(name)
			point:LoadConfig()
		end
	end
end

hook.Add("InitPostEntity", "PR_SpawnSavedPoints", SpawnSavedPoints)
hook.Add("PostCleanupMap", "PR_SpawnSavedPoints", SpawnSavedPoints)
