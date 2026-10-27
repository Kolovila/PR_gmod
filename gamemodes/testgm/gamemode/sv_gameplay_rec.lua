-- Запись боя для разбора ИИ: пока на карте есть техника патрулей, два раза в секунду пишем, где
-- игроки и что делают (машина, скорость, здоровье, огонь), и где авиация патрулей, в каком режиме
-- и по кому работает (у ИИ fire1 — стрелял в этом режиме, fire2 — наведён).
-- Файл — data/pr_gamemode/gameplay/<дата_время>.csv, новый на каждую карту.
-- pr_gameplay_rec 0 — выключить

local CVAR = CreateConVar("pr_gameplay_rec", "1", FCVAR_ARCHIVE, "Писать бой с техникой патрулей в data/pr_gamemode/gameplay")
local DIR = "pr_gamemode/gameplay"
local MAX_FILES = 30
local COLUMNS = "time,who,class,x,y,z,speed,heading,pitch,hp,state,target,fire1,fire2,weapon"

local fileName

local function Open()
	if fileName then return fileName end
	file.CreateDir(DIR)
	-- Старые записи — долой, держим последние MAX_FILES
	local files = file.Find(DIR .. "/*.csv", "DATA", "datedesc") or {}
	for i = MAX_FILES, #files do file.Delete(DIR .. "/" .. files[i]) end
	fileName = string.format("%s/%s_%s.csv", DIR, os.date("%Y%m%d_%H%M%S"), game.GetMap())
	file.Write(fileName, COLUMNS .. "\n")
	return fileName
end

local function Row(who, class, ent, hp, state, target, fire1, fire2, weapon)
	local pos, vel, ang = ent:GetPos(), ent:GetVelocity(), ent:GetAngles()
	return string.format("%.1f,%s,%s,%d,%d,%d,%d,%d,%d,%s,%s,%s,%d,%d,%s",
		CurTime(), who, class, pos.x, pos.y, pos.z, vel:Length(), ang.y, ang.p, tostring(hp or ""),
		state or "", target or "", fire1 and 1 or 0, fire2 and 1 or 0, weapon or "")
end

local function Name(e)
	if not IsValid(e) then return "" end
	if e:IsPlayer() then return e:Nick():gsub(",", " ") end
	return e:GetClass()
end

timer.Create("PR_GameplayRec", 0.5, 0, function()
	if not CVAR:GetBool() or not PR_Patrol or not PR_Patrol.Active then return end
	local vehicles = {}
	for _, patrol in ipairs(PR_Patrol.Active) do
		for _, v in ipairs(patrol.vehicles or {}) do
			if not v.dead and IsValid(v.ent) then vehicles[#vehicles + 1] = v end
		end
	end
	if #vehicles == 0 then return end

	local out = {}
	for _, ply in ipairs(player.GetHumans()) do
		local seat = ply:GetVehicle()
		local body = ply
		if IsValid(seat) then
			body = seat
			while IsValid(body:GetParent()) do body = body:GetParent() end
		end
		local wep = ply:GetActiveWeapon()
		out[#out + 1] = Row("player:" .. Name(ply), IsValid(seat) and body:GetClass() or "foot", body,
			ply:Alive() and ply:Health() or 0, ply:Alive() and "alive" or "dead", "",
			ply:KeyDown(IN_ATTACK), ply:KeyDown(IN_ATTACK2), IsValid(wep) and wep:GetClass() or "")
	end
	for _, v in ipairs(vehicles) do
		local e = v.ent
		local hp = isfunction(e.GetHP) and e:GetHP() or (isfunction(e.GetCurHealth) and e:GetCurHealth()) or nil
		out[#out + 1] = Row("ai:" .. tostring(v.kind), v.class or e:GetClass(), e, hp and math.Round(hp),
			tostring(v.airMode or v.driveState or ""):gsub(",", " "), Name(v.target), v.planeFired, v.fire, "")
	end
	file.Append(Open(), table.concat(out, "\n") .. "\n")
end)
