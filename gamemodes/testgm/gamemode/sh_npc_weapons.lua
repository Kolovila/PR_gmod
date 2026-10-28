-- NPC-копии стволов ArcCW (addons/ws_arccw). Бойцы VJ стреляют только оружием VJ (на чужое VJ пишет
-- «requires a VJ Base weapon»), поэтому на каждый ствол ArcCW — оружие VJ (weapon_vj_base) с его
-- моделью, звуком, магазином, темпом, числом дробин и патроном: weapon_vj_<класс ArcCW>.
-- Ствол в руке сидит по формуле ArcCW (WorldModelOffset от кисти), у UC и гранатомётов мировая
-- модель — копия модели от первого лица (MirrorVMWM), как у самой ArcCW.
-- Урон — урон ArcCW вблизи × PR_INF.npcDamageScale (у бойцов нет брони игрока).
-- Убили бойца — выпавший ствол игрок подбирает настоящим стволом ArcCW (ReplacementWeapon).
-- Гранатомёты (ShootEntity) пускают тот же снаряд ArcCW, что у игрока; гранаты без двигателя (M79,
-- China Lake, M32) — навесом с учётом гравитации.

PR_NPCW = PR_NPCW or {}
PR_NPCW.List = PR_NPCW.List or {}   -- [класс копии] = {src = класс ArcCW, kind = "rifle"|"pistol"|..., name}

local HOLD = {
	pistol = "pistol", revolver = "revolver", duel = "pistol", smg = "smg", ar2 = "ar2", shotgun = "shotgun",
	crossbow = "crossbow", rpg = "rpg", physgun = "ar2", passive = "ar2", camera = "ar2", normal = "ar2"
}

-- Что бросают или чем режут — не для стрельбы бойца
local function Skip(cls, full)
	if weapons.IsBasedOn(cls, "arccw_base_nade") or weapons.IsBasedOn(cls, "arccw_base_melee") then return true end
	if full.Throwing or full.PrimaryBash or (tonumber(full.Num) or 1) == 0 then return true end
	local se = full.ShootEntity
	if isstring(se) and (string.find(se, "_thr_", 1, true) or string.find(se, "bolt", 1, true) or string.find(se, "knife", 1, true)) then
		return true
	end
	-- ПЗРК и ПТРК с самонаведением (Игла, Javelin) — не оружие пехотинца-NPC против людей
	if string.find(cls, "igla", 1, true) or string.find(cls, "javelin", 1, true) or string.find(cls, "stinger", 1, true) then return true end
	return false
end

local function Auto(full)
	local auto, burst = false, false
	for _, m in ipairs(full.Firemodes or {}) do
		local mode = tonumber(m.Mode) or 0
		if mode >= 2 then auto = true elseif mode < 0 then burst = true end
	end
	return auto, burst
end

local function Kind(full, hold)
	if isstring(full.ShootEntity) then return "launcher" end
	if hold == "pistol" or hold == "revolver" or hold == "duel" then return "pistol" end
	local ammo = string.lower(tostring(full.Primary and full.Primary.Ammo or ""))
	if (tonumber(full.Num) or 1) > 1 or ammo == "buckshot" or hold == "shotgun" then return "shotgun" end
	local auto, burst = Auto(full)
	local clip = full.Primary and full.Primary.ClipSize or 30
	if auto and clip >= 75 then return "mg" end
	if full.ManualAction and (ammo == "sniperpenetratedround" or ammo == "357" or ammo == "ar2") then return "sniper" end
	if not auto and not burst then
		if ammo == "sniperpenetratedround" then return clip <= 10 and "sniper" or "dmr" end
		if ammo == "ar2" or ammo == "357" then return "dmr" end
	end
	if hold == "smg" or ammo == "smg1" or ammo == "pistol" then return "smg" end
	return "rifle"
end

-- Ствол в руке: формула ArcCW (sh_model.lua): точка кости, сдвиг в её осях, повороты
-- вокруг правой, верхней и передней осей
local function ArcPosition(self, owner)
	local bone = owner:LookupBone(self.PR_WMBone or "ValveBiped.Bip01_R_Hand")
	if not bone then return false end
	local pos, ang = owner:GetBonePosition(bone)
	if not pos then return false end
	local p, a = self.PR_WMPos, self.PR_WMAng
	pos = pos + ang:Forward() * p.x + ang:Right() * p.y + ang:Up() * p.z
	ang:RotateAroundAxis(ang:Right(), a.p)
	ang:RotateAroundAxis(ang:Up(), a.y)
	ang:RotateAroundAxis(ang:Forward(), a.r)
	return pos, ang
end

-- Обвес по умолчанию (стандартные группы тела модели) — как у ArcCW без навесного
local function ArcInit(self)
	if self.PR_Bodygroups then self:SetBodyGroups(self.PR_Bodygroups) end
	if self.PR_Skin then self:SetSkin(self.PR_Skin) end
	if self.PR_Scale and self.PR_Scale ~= 1 then self:SetModelScale(self.PR_Scale) end
end

-- Быстрый снаряд рвётся от касания физики, а на ~5000 ю/с касание с игроком иногда не срабатывает —
-- снаряд проскакивал сквозь цель. Каждый тик — трасса от прошлой точки до новой
local HULL = Vector(4, 4, 4)
local function TraceGuard(ent, owner)
	if not (ent.Detonate or ent.PhysicsCollide) then return end
	local id, last = "PR_ProjTrace" .. ent:EntIndex(), ent:GetPos()
	local armAt = CurTime() + (ent.FuseTime and ent.FuseTime < 1 and ent.FuseTime or 0)
	timer.Create(id, 0, 0, function()
		if not IsValid(ent) or ent.Defused or ent.Detonated then timer.Remove(id) return end
		local now = ent:GetPos()
		if CurTime() >= armAt then
			local tr = util.TraceHull({start = last, endpos = now, mins = -HULL, maxs = HULL, filter = {ent, owner}, mask = MASK_SHOT})
			local hit = tr.Entity
			if IsValid(hit) and (hit:IsPlayer() or hit:IsNPC()) then
				timer.Remove(id)
				ent:SetPos(tr.HitPos)
				local phys = ent:GetPhysicsObject()
				local vel = IsValid(phys) and phys:GetVelocity() or (ent.CurVel or Vector())
				if ent.PhysicsCollide and IsValid(phys) then
					ent:PhysicsCollide({HitPos = tr.HitPos, HitEntity = hit, HitNormal = tr.HitNormal, OurOldVelocity = vel, Speed = vel:Length()}, phys)
				elseif ent.Detonate then
					ent.HitPos, ent.HitVelocity = tr.HitPos, vel
					ent:Detonate()
				end
				return
			end
		end
		last = now
	end)
end

-- Навес: угол пуска со скоростью v в точку to (нижняя траектория); вне дальности — 45°
local function Lob(from, to, v)
	local g = -physenv.GetGravity().z
	local d = to - from
	local flat = Vector(d.x, d.y, 0)
	local x = flat:Length()
	if x < 1 or g <= 0 then return d:GetNormalized() end
	flat:Normalize()
	local v2 = v * v
	local disc = v2 * v2 - g * (g * x * x + 2 * d.z * v2)
	local th = disc >= 0 and math.atan((v2 - math.sqrt(disc)) / (g * x)) or math.rad(45)
	return (flat * math.cos(th) + Vector(0, 0, math.sin(th))):GetNormalized()
end

-- Гранатомёт: тот же снаряд, что у игрока (как SWEP:FireRocket ArcCW), в точку прицела владельца
-- (GetAimPosition бойца даёт оценку слоя пехоты, когда цель не видна — так гранатомётчик бьёт
-- и по укрытию)
local function FireProjectile(self, status)
	if status ~= "PostFire" or CLIENT then return end
	local owner = self:GetOwner()
	if not IsValid(owner) then return end
	local ent = ents.Create(self.PR_Projectile)
	if not IsValid(ent) then return end
	-- Граната списывается здесь — при настоящем пуске (роль раньше списывала и без выстрела)
	local brain = owner.PR_Brain
	if brain then
		owner.PR_RecShots = (owner.PR_RecShots or 0) + 1 -- запись боя
		brain.lastFireAt = CurTime()
		if brain.rockets then brain.rockets = brain.rockets - 1 end
	end
	-- От глаз, а не от бедра: снаряд с низкого старта ложился в землю на полпути
	local from = owner:EyePos()
	local enemy = owner.GetEnemy and owner:GetEnemy()
	local speed = math.min(self.PR_ProjectileSpeed, physenv.GetPerformanceSettings().MaxVelocity or 4000)
	local to = (owner.GetAimPosition and IsValid(enemy)) and owner:GetAimPosition(enemy, from, 0, speed) or (from + owner:GetForward() * 1000)
	if owner.PR_AimOverride then to = owner.PR_AimOverride end
	local dir
	if self.PR_Lob then
		dir = Lob(from, to, speed)
	else
		-- Ракета с гравитацией (и двигателем) — небольшая поправка на снижение; без гравитации
		-- (ракеты UC) летит по прямой — поправка уводила её над головой цели
		if self.PR_Gravity then to = to + Vector(0, 0, 15 + from:Distance(to) * 0.01) end
		dir = (to - from):GetNormalized()
	end
	-- Разброс ~0,6° — на 2000 ю ~20 ю, в пределах ширины человека; слой пехоты может умножить
	local spread = math.rad(0.6) * (owner.PR_LauncherSpread or 1)
	dir = (dir + VectorRand() * math.tan(spread)):GetNormalized()
	PR_NPCW.Last = {from = from, to = to, dir = dir, t = CurTime()}
	ent:SetAngles(dir:Angle())
	ent:SetPos(from + dir * 40)
	ent:SetOwner(owner)
	ent.Inflictor = self
	ent.Damage = self.PR_ProjectileDamage or ent.Damage
	if self.PR_BlastRadius then ent.BlastRadius = self.PR_BlastRadius end
	ent.CurVel = dir * speed
	ent:Spawn()
	ent:Activate()
	local phys = ent:GetPhysicsObject()
	if not ent.NoPhys and IsValid(phys) then
		ent:SetCollisionGroup(ent.CollisionGroup or COLLISION_GROUP_DEBRIS)
		phys:SetVelocityInstantaneous(dir * speed)
	end
	if ent.Launch and ent.SetState then
		ent:SetState(1)
		ent:Launch()
	end
	ent.ArcCWProjectile = true
	TraceGuard(ent, owner)
	if PR_Inf and PR_Inf.OnLauncherFired then PR_Inf.OnLauncherFired(owner, from, to) end
end

-- Снаряд под гравитацией (физический, Gravity не выключена) и летит ли чисто по баллистике (без двигателя)
local function Falls(cls)
	local E = scripted_ents.Get(cls)
	return E ~= nil and not E.NoPhys and E.Gravity ~= false, E
end

local function Lobbed(cls)
	local falls, E = Falls(cls)
	return falls and (tonumber(E.Boost) or 0) == 0
end

local function Sound(s)
	if istable(s) then return #s > 0 and s or nil end
	return isstring(s) and s ~= "" and s or nil
end

local function Build()
	local scale = (PR_INF and PR_INF.npcDamageScale) or 0.2
	local made = 0
	for _, w in ipairs(weapons.GetList()) do
		local cls = w.ClassName
		if cls and not string.find(cls, "base", 1, true) and weapons.IsBasedOn(cls, "arccw_base") then
			local full = weapons.Get(cls)
			local hold = string.lower(tostring(full and (full.HoldtypeNPC or full.HoldtypeActive) or ""))
			local mdl = full and (full.MirrorVMWM and (full.MirrorWorldModel or full.ViewModel) or full.WorldModel)
			local launcher = full and isstring(full.ShootEntity) and scripted_ents.GetStored(full.ShootEntity) ~= nil
			local clip = full and full.Primary and full.Primary.ClipSize or 0
			if full and full.Spawnable and not Skip(cls, full) and HOLD[hold] and isstring(mdl) and mdl ~= ""
				and (launcher or (clip > 0 and tonumber(full.Damage))) then
				local kind = Kind(full, hold)
				local name = "weapon_vj_" .. cls
				local auto, burst = Auto(full)
				local semi = not auto and not burst
				local delay = tonumber(full.Delay) or 0.1
				-- Затвор / помпа: ArcCW перезаряжает анимацией, у бойца — пауза
				if full.ManualAction then delay = math.max(delay, kind == "shotgun" and 0.8 or 1.4) end
				local SWEP = {
					Base = "weapon_vj_base",
					PrintName = (full.TrueName or full.PrintName or cls) .. " (NPC)",
					Category = "PR: ArcCW для NPC",
					Spawnable = false,
					MadeForNPCsOnly = true,
					ReplacementWeapon = cls,
					WorldModel = mdl,
					HoldType = HOLD[hold],
					NPC_NextPrimaryFire = semi and math.max(delay, kind == "sniper" and 1.5 or 0.3) or math.max(delay, 0.05),
					NPC_CustomSpread = 1,
					Reload_TimeUntilAmmoIsSet = 1.6,
					Primary = {
						-- Среднее вблизи и вдали: у VJ урон не падает с дальностью
						Damage = math.max((PR_INF and PR_INF.npcDamageFloor and PR_INF.npcDamageFloor[kind]) or 1,
							math.Round(((tonumber(full.Damage) or 30) + (tonumber(full.DamageMin) or tonumber(full.Damage) or 30)) / 2 * scale)),
						NumberOfShots = math.max(1, tonumber(full.Num) or 1),
						ClipSize = launcher and 1 or clip,
						Ammo = full.Primary and full.Primary.Ammo or "SMG1",
						Sound = Sound(full.ShootSound) or "Weapon_AK47.Single",
						DistantSound = Sound(full.DistantShootSound),
						SoundLevel = 105,
						HasDistantSound = Sound(full.DistantShootSound) ~= nil,
						Automatic = not semi,
						DisableBulletCode = launcher or nil,
					},
					PR_Src = cls,
					PR_Kind = kind,
					Init = ArcInit,
				}
				if full.MirrorVMWM then
					SWEP.PR_Bodygroups = isstring(full.DefaultBodygroups) and full.DefaultBodygroups or nil
					SWEP.PR_Skin = tonumber(full.DefaultSkin)
				else
					SWEP.PR_Bodygroups = isstring(full.DefaultWMBodygroups) and full.DefaultWMBodygroups or nil
					SWEP.PR_Skin = tonumber(full.DefaultWMSkin)
				end
				if launcher then
					SWEP.NPC_NextPrimaryFire = 4
					SWEP.NPC_StandingOnly = true
					SWEP.PR_Projectile = full.ShootEntity
					SWEP.PR_ProjectileSpeed = tonumber(full.MuzzleVelocity) or 5000
					SWEP.PR_ProjectileDamage = tonumber(full.Damage)
					SWEP.PR_BlastRadius = tonumber(full.BlastRadius)
					SWEP.PR_Lob = Lobbed(full.ShootEntity)
					SWEP.PR_Gravity = (Falls(full.ShootEntity))
					SWEP.OnPrimaryAttack = FireProjectile
				end
				-- Модель в кисть по формуле ArcCW
				local wmo = full.WorldModelOffset
				if istable(wmo) then
					SWEP.WorldModel_UseCustomPosition = true
					SWEP.PR_WMBone = wmo.bone
					SWEP.PR_WMPos = isvector(wmo.pos) and Vector(wmo.pos) or Vector()
					SWEP.PR_WMAng = isangle(wmo.ang) and Angle(wmo.ang) or Angle()
					SWEP.PR_Scale = tonumber(wmo.scale)
					SWEP.GetWeaponCustomPosition = ArcPosition
				end
				weapons.Register(SWEP, name)
				PR_NPCW.List[name] = {src = cls, kind = kind, name = full.TrueName or full.PrintName or cls}
				made = made + 1
			end
		end
	end
	PR_NPCW.Count = made
	if SERVER then MsgN("[PR] NPC-копий стволов ArcCW: " .. made) end
end

-- Стволы аддонов регистрируются после файлов режима — строим, когда все загружены
hook.Add("Initialize", "PR_NPCWeapons", Build)

-- Подходящие стволы для роли (sv_infantry.lua): по виду
PR_NPCW.ROLE_KINDS = {
	sniper = {"sniper"}, marksman = {"dmr", "sniper"}, assault = {"rifle", "smg"}, grenadier = {"launcher"},
	ebitel = {"shotgun", "smg", "mg", "rifle"}, sneak = {"smg", "pistol"}, [""] = {"rifle", "smg", "shotgun", "dmr"}
}

function PR_NPCW.ForKind(kinds)
	local out = {}
	for name, info in pairs(PR_NPCW.List) do
		if table.HasValue(kinds, info.kind) then out[#out + 1] = name end
	end
	table.sort(out)
	return out
end
