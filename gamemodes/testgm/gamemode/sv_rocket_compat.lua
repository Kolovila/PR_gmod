-- Управляемые ракеты с наведением на сущность (Гредвич и паки на его основе: TOW, «Корнет», 9М114,
-- 9М17, ракета стрелка Ми-24 и т. п.) каждый тик физики берут self.target:LocalToWorld(...) и не
-- проверяют, жива ли цель. Цель уничтожили, пока ракета летит, — ошибка каждый тик до самого
-- взрыва (сотни строк и «аддон создаёт ошибки»), в том числе у ракет игроков. Обёртка: пока цель
-- жива, запоминаем точку наведения; исчезла — ракета летит в последнюю точку

local function Guard(e)
	if not IsValid(e) or e.PR_GuardedGuidance or not isfunction(e.PhysicsUpdate) then return end
	local class = e:GetClass()
	if not (isfunction(e.Launch) or string.find(class, "rocket", 1, true) or string.find(class, "missile", 1, true)) then return end
	e.PR_GuardedGuidance = true

	local steer = e.PhysicsUpdate
	e.PhysicsUpdate = function(self, phys)
		local target, world = self.target, game.GetWorld()
		if target ~= nil and target ~= world and isentity(target) then
			if IsValid(target) then
				if isvector(self.targetOffset) then self.PR_LastAim = target:LocalToWorld(self.targetOffset) end
			else
				self.target = world
				self.targetOffset = self.PR_LastAim or (self:GetPos() + self:GetForward() * 1000)
			end
		end
		return steer(self, phys)
	end
end
PR_GuardMissileGuidance = Guard

-- ПТУР TOW (Shelby's Vehicles Shared Assets) печатает свою скорость в консоль каждый тик полёта
local QUIET_THINK = {gb_rocket_bgm71_tow = true}

local function Quiet(e)
	if not (IsValid(e) and QUIET_THINK[e:GetClass()] and isfunction(e.Think) and PR_Quietly) or e.PR_QuietThink then return end
	e.PR_QuietThink = true
	local think = e.Think
	e.Think = function(self, ...) return PR_Quietly(think, self, ...) end
end

-- Ракета Гредвича, взорванная до того, как полетела (хозяин исчез, вертолёт сбит), берёт в
-- AddOnExplode MuzzleVelocity, а у части ракет (С-5 Ми-24) его нет — ошибка base_rocket/init.lua:535
-- «arithmetic on local 'Meters'». Пуск его, если надо, перезапишет
local function DefaultMuzzle(e)
	if not (IsValid(e) and isfunction(e.Launch) and isfunction(e.AddOnExplode)) or e.PR_SafeExplode then return end
	e.PR_SafeExplode = true
	if e.MuzzleVelocity == nil then e.MuzzleVelocity = 300 end
	-- И LastVel (init.lua:593 «index field 'LastVel'»): ракета, не успевшая полететь, — скорость по оси
	local explode = e.AddOnExplode
	e.AddOnExplode = function(self, ...)
		if self.LastVel == nil then self.LastVel = self:GetForward() * ((tonumber(self.MuzzleVelocity) or 300) / 0.01905) end
		return explode(self, ...)
	end
end

-- PhysicsUpdate ракеты аддон часто задаёт сразу после создания — оборачиваем на следующем тике
hook.Add("OnEntityCreated", "PR_GuardMissileGuidance", function(e)
	timer.Simple(0, function()
		Guard(e)
		Quiet(e)
		DefaultMuzzle(e)
	end)
end)
