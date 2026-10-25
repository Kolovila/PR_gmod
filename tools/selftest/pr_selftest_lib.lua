-- Общая часть автотестов PR. Раннер кладёт файл в garrysmod/lua/, наборы подключают его:
--   local T = include("pr_selftest_lib.lua")
--
--   T.step(delay, fn)               — шаг через delay секунд после предыдущего
--   T.waitFor(timeout, cond, label) — ждать, пока cond() не станет true (опрос 4 раза в секунду),
--                                     но не дольше timeout; дальше идёт следующий шаг (проверка)
--   T.section(name)                 — следующие шаги относятся к секции name. Раннер пишет нужные
--                                     секции в data/pr_selftest_sections.txt (пусто — все);
--                                     секция "common" (подготовка и уборка) идёт всегда
--   T.run(delay)                    — запустить шаги после загрузки карты
local T = {pass = 0, fail = 0, steps = {}, current = "common", S = {}}

function T.log(text)
	print("[PR_SELFTEST] " .. text)
end

function T.check(name, cond, extra)
	if cond then
		T.pass = T.pass + 1
		T.log("PASS " .. name)
	else
		T.fail = T.fail + 1
		T.log("FAIL " .. name .. (extra ~= nil and (" :: " .. tostring(extra)) or ""))
	end
end

-- Какие секции гонять
do
	local txt = file.Read("pr_selftest_sections.txt", "DATA")
	if txt and string.Trim(txt) ~= "" and string.Trim(txt) ~= "all" then
		T.only = {}
		for name in string.gmatch(txt, "%S+") do T.only[name] = true end
	end
end

function T.section(name) T.current = name end

function T.enabled(name)
	return name == "common" or not T.only or T.only[name] == true
end

function T.step(delay, fn)
	table.insert(T.steps, {delay = delay, fn = fn, section = T.current})
end

function T.waitFor(timeout, cond, label)
	table.insert(T.steps, {wait = cond, timeout = timeout, label = label, section = T.current})
end

function T.run(startDelay)
	local i = 0
	local nextStep

	local function crashed(err)
		T.fail = T.fail + 1
		T.log("FAIL step crashed :: " .. tostring(err))
	end

	nextStep = function()
		i = i + 1
		local s = T.steps[i]
		if not s then return end
		if not T.enabled(s.section) then return nextStep() end

		if s.wait then
			local started = CurTime()
			local function poll()
				local ok, done = pcall(s.wait)
				if not ok then crashed(done) done = true end
				local waited = CurTime() - started
				if done or waited >= s.timeout then
					T.log(string.format("waited %.1f s for %s%s", waited, s.label or "?", done and "" or " — timeout"))
					return nextStep()
				end
				timer.Simple(0.25, poll)
			end
			poll()
		else
			timer.Simple(s.delay, function()
				local ok, err = pcall(s.fn)
				if not ok then crashed(err) end
				nextStep()
			end)
		end
	end

	timer.Simple(startDelay or 8, nextStep)
end

-- Конец прогона: раннер ждёт эту строку
function T.done()
	T.log(string.format("DONE pass=%d fail=%d", T.pass, T.fail))
end

----------------------------------------------------------------------------------------------------
-- Места на карте (rp_desert_conflict). Раньше линию спотов искали у бота, а он появляется где
-- попало: часть падений тестов была из-за места (тесно, склон), а не из-за кода
----------------------------------------------------------------------------------------------------

-- Где строить линию из трёх спотов: открытые улицы, на которых тесты уже проходили
T.FIXED_BASES = {
	Vector(-7795.6, -1890, -511),
	Vector(-9120, -1559, -512)
}

-- Сложные места для вертолётов (дома, холм, кран): споты, у которых пользователь играл
T.HARD_SPOTS = {
	Vector(-12412.5, 2393.8, -511),
	Vector(-7561.2, -8406.1, -512)
}

-- Три спота по прямой от base, где можно пройти
function T.patrolLine(base)
	for _, dists in ipairs({{250, 650, 1050}, {200, 500, 800}, {150, 350, 550}}) do
		for yaw = 0, 330, 30 do
			local dir = Angle(0, yaw, 0):Forward()
			local pts = {}
			for i, d in ipairs(dists) do
				local probe = base + dir * d
				local down = util.TraceLine({start = probe + Vector(0, 0, 80), endpos = probe - Vector(0, 0, 300), mask = MASK_PLAYERSOLID_BRUSHONLY})
				if not down.Hit or down.StartSolid then break end
				pts[i] = down.HitPos
			end
			if #pts == 3 and PR_Patrol.CanWalk(pts[1], pts[2]) and PR_Patrol.CanWalk(pts[2], pts[3]) then
				return pts
			end
		end
	end
end

-- Сначала постоянные места, потом запасные (extra)
function T.findLine(extra)
	local bases = table.Copy(T.FIXED_BASES)
	for _, b in ipairs(extra or {}) do table.insert(bases, b) end
	for _, base in ipairs(bases) do
		local pts = T.patrolLine(base)
		if pts then return pts, base end
	end
end

-- Точка в dist от машины на примерно той же высоте, которую экипаж видит так же, как проверяет
-- CrewAim (от центра машины +60 до цели): иначе танк наведётся, но стрелять не станет.
-- Высота — сперва в пределах 50 (пушка T-72 опускается всего на 4°: на 900 это ~60), потом 120
function T.clearPointFrom(pos, dist, from)
	from = from or pos + Vector(0, 0, 120)
	for _, tolerance in ipairs({50, 120}) do
		for yaw = 0, 330, 30 do
			local p = pos + Angle(0, yaw, 0):Forward() * dist
			local down = util.TraceLine({start = p + Vector(0, 0, 100), endpos = p - Vector(0, 0, 400), mask = MASK_SOLID_BRUSHONLY})
			if down.Hit and not down.StartSolid and math.abs(down.HitPos.z - pos.z) < tolerance then
				local clear = true
				for _, h in ipairs({20, 36, 60}) do
					if util.TraceLine({start = from, endpos = down.HitPos + Vector(0, 0, h), mask = MASK_SOLID_BRUSHONLY}).Hit then clear = false end
				end
				if clear then return down.HitPos end
			end
		end
	end
end

-- Самое открытое место в 900–1400 от pos на той же высоте: вертолётам есть где развернуться.
-- (Цель меж домов проверяла не стрелка, а уход от препятствий — для этого есть HARD_SPOTS.)
-- Возвращает точку на земле и «тесноту» — насколько выше неё всё вокруг в радиусе 400
function T.openPointNear(pos)
	local function Ground(p)
		local tr = util.TraceLine({start = p + Vector(0, 0, 1500), endpos = p - Vector(0, 0, 1500), mask = MASK_SOLID_BRUSHONLY})
		if tr.Hit and not tr.StartSolid then return tr.HitPos end
	end
	local best, bestClutter
	for _, d in ipairs({900, 1400}) do
		for yaw = 0, 330, 30 do
			local ground = Ground(pos + Angle(0, yaw, 0):Forward() * d)
			if ground and math.abs(ground.z - pos.z) < 300 then
				local clutter = 0
				for oy = 0, 315, 45 do
					local g = Ground(ground + Angle(0, oy, 0):Forward() * 400)
					clutter = math.max(clutter, g and g.z - ground.z or 1500)
				end
				if not bestClutter or clutter < bestClutter then best, bestClutter = ground, clutter end
			end
		end
	end
	return best, bestClutter
end

----------------------------------------------------------------------------------------------------
-- Мелочи
----------------------------------------------------------------------------------------------------

function T.shot(name)
	net.Start("PR_SELFTEST_SHOT")
		net.WriteString(name)
	net.Send(player.GetHumans()[1])
end

function T.lookAt(pos)
	local host = T.S.host
	if IsValid(host) then host:SetEyeAngles((pos - host:EyePos()):Angle()) end
end

function T.crewOf(v, i)
	return v and v.crew and v.crew[i]
end

-- Перевернуть танк на крышу: подбросить (на земле трение не даёт провернуть) и крутить в воздухе,
-- лёг на крышу — погасить вращение, чтобы так и остался
function T.flipPush(veh)
	local phys = veh:GetPhysicsObject()
	if not IsValid(phys) then return end
	local fwd = veh.Forward or veh:GetForward()
	phys:SetVelocity(Vector(0, 0, 700))
	timer.Create("PR_SelftestFlip", 0.05, 36, function()
		if not IsValid(veh) or not IsValid(phys) then return end
		if timer.RepsLeft("PR_SelftestFlip") > 30 then return end
		if veh:GetUp().z < -0.6 then
			phys:SetAngleVelocity(Vector(0, 0, 0))
			timer.Remove("PR_SelftestFlip")
			return
		end
		phys:SetAngleVelocity(phys:WorldToLocalVector(fwd) * 1000)
	end)
end

function T.flipInfo(veh)
	return string.format("up=%.2f speed=%d", veh:GetUp().z, veh:GetVelocity():Length())
end

-- Шаги проверки «перевернулся — встал сам» для танка, который вернёт getTank()
function T.addFlipSteps(getTank)
	local S = T.S
	for _ = 1, 3 do
		T.step(0, function()
			local tank = getTank()
			if not tank or not IsValid(tank.ent) or tank.dead then return end
			tank.forceTarget = nil
			S.flipCrew = S.flipCrew or {T.crewOf(tank, 1), T.crewOf(tank, 2)}
			if tank.ent:GetUp().z >= 0.3 then T.flipPush(tank.ent) end
		end)
		T.waitFor(3, function()
			local tank = getTank()
			return not (tank and IsValid(tank.ent)) or tank.ent:GetUp().z < -0.3
		end, "tank on its roof")
	end
	T.step(0, function()
		local tank = getTank()
		S.flipped = tank and IsValid(tank.ent) and tank.ent:GetUp().z < 0.3
		S.flipMaxSpeed, S.flipUprightSince, S.rightingTried = 0, nil, false
		if tank and IsValid(tank.ent) then T.log("tank after the push: " .. T.flipInfo(tank.ent)) end
		if not S.flipped then return end
		-- Держим на крыше, пока не начнёт вставать сам (через 3 с): иначе он порой докатывается
		-- на гусеницы по инерции, и проверялась бы не наша поднималка
		timer.Create("PR_SelftestHoldFlipped", 0.05, 120, function()
			local t = getTank()
			local body = t and IsValid(t.ent) and t.ent:GetPhysicsObject()
			if not IsValid(body) or t.rightTries then
				timer.Remove("PR_SelftestHoldFlipped")
				return
			end
			if t.ent:GetUp().z < 0.3 then body:SetAngleVelocity(Vector(0, 0, 0)) end
		end)
	end)
	-- Встать: попытка через 3 с лёжа, ещё 1–2 с поворот; ждём, пока простоит ровно секунду
	T.waitFor(16, function()
		local tank = getTank()
		if not S.flipped or not (tank and IsValid(tank.ent)) then return true end
		if tank.rightTries then S.rightingTried = true end
		S.flipMaxSpeed = math.max(S.flipMaxSpeed, tank.ent:GetVelocity():Length())
		if tank.ent:GetUp().z > 0.8 then
			S.flipUprightSince = S.flipUprightSince or CurTime()
			return CurTime() - S.flipUprightSince >= 1
		end
		S.flipUprightSince = nil
		return false
	end, "tank back on its tracks")
	T.step(0, function()
		local tank = getTank()
		if not S.flipped then
			T.log("couldn't flip the tank, righting not checked")
			return
		end
		local ok = tank and IsValid(tank.ent) and not tank.dead
		T.check("flipped tank rights itself", ok and S.rightingTried and tank.ent:GetUp().z > 0.7,
			ok and (T.flipInfo(tank.ent) .. ", righting " .. tostring(S.rightingTried)))
		local alive = 0
		for _, bot in pairs(S.flipCrew or {}) do
			if IsValid(bot) and bot:Alive() then alive = alive + 1 end
		end
		T.check("crew survives the rollover", alive == #(S.flipCrew or {}), alive)
		T.check("righting doesn't throw the tank around", S.flipMaxSpeed < 700, math.Round(S.flipMaxSpeed))
	end)
end

-- Строки журнала патрулей, дописанные после отметки mark (длина файла на тот момент)
function T.patrolLogSince(mark)
	local txt = file.Read("pr_gamemode/patrol_log.txt", "DATA") or ""
	return string.sub(txt, (mark or 0) + 1)
end

function T.patrolLogMark()
	return #(file.Read("pr_gamemode/patrol_log.txt", "DATA") or "")
end

return T
