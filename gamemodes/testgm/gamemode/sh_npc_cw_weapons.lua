-- NPC-копии стволов CW 2.0 (addons/ws_weapons). Сами CW-стволы у NPC не стреляют: их база знает
-- только игрока. Поэтому на каждый ствол — оружие VJ (weapon_vj_base) с моделью, звуком, магазином,
-- темпом, числом дробин и патроном оригинала: weapon_vj_cw_<класс без «cw_»>.
-- Ствол в руке сидит по формуле CW KK (WMPos / WMAng от кисти) — как у игрока.
-- Урон — урон CW × PR_INF.npcDamageScale (как у прежних EFT-стволов NPC: АК-74 33 -> ~6–7).
-- Убили бойца — выпавший ствол игрок подбирает настоящим CW-стволом (ReplacementWeapon).
-- Гранатомёты (projectileClass у CW KK: РПГ-7, AT4 и др.) пускают тот же снаряд, что у игрока.
-- 40-мм (GP-25, M79, M320 — патрон «40MM» без projectileClass: стреляют гранатой CW
-- cw_40mm_explosive на 2996 ю/с) — тоже гранатомёты, огонь навесом с учётом гравитации.

PR_NPCW = PR_NPCW or {}
PR_NPCW.List = PR_NPCW.List or {}   -- [класс копии] = {cw = класс CW, kind = "rifle"|"pistol"|..., ...}

local HOLD = {
	pistol = "pistol", revolver = "revolver", duel = "pistol", smg = "smg", ar2 = "ar2", shotgun = "shotgun",
	crossbow = "crossbow", rpg = "rpg", physgun = "ar2", passive = "ar2", camera = "ar2"
}

-- Чем стреляет гранатомёт: класс снаряда, скорость, летит ли по баллистике (40 мм — да, ракета — нет:
-- у ракет KK после взвода «двигатель» держит скорость)
local function Projectile(full)
	local cls = full.projectileClass
	if cls and scripted_ents.GetStored(cls) then
		local lob = string.find(cls, "40mm", 1, true) ~= nil
		return cls, lob and 2996 or (tonumber(full.MuzzleVelocity) or 115) * 39.37, lob
	end
	if full.Primary and full.Primary.Ammo == "40MM" and scripted_ents.GetStored("cw_40mm_explosive") then
		return "cw_40mm_explosive", 2996, true
	end
end

local function Kind(full, hold)
	if Projectile(full) then return "launcher" end
	if hold == "pistol" or hold == "revolver" or hold == "duel" then return "pistol" end
	if (tonumber(full.Shots) or 1) > 1 or hold == "shotgun" then return "shotgun" end
	local ammo = string.lower(tostring(full.Primary and full.Primary.Ammo or ""))
	local auto = false
	for _, m in ipairs(full.FireModes or {}) do
		if m == "auto" then auto = true end
	end
	local clip = full.Primary and full.Primary.ClipSize or 30
	if auto and clip >= 75 then return "mg" end
	if not auto and (string.find(ammo, "338") or string.find(ammo, "7.62x54") or string.find(ammo, "12.7") or string.find(ammo, ".50")
		or string.find(ammo, "7.62x51") or string.find(ammo, ".308") or string.find(ammo, "8x57") or string.find(ammo, "7.7")) then
		return clip <= 5 and "sniper" or "dmr"
	end
	if not auto then return "dmr" end
	if hold == "smg" then return "smg" end
	return "rifle"
end

-- Ствол в руке: формула DrawWorldModel CW KK (o_cl_model.lua) — сдвиг в осях кисти, потом поворот
local function KKPosition(self, owner)
	local bone = owner:LookupBone("ValveBiped.Bip01_R_Hand")
	if not bone then return false end
	local m = owner:GetBoneMatrix(bone)
	if not m then return false end
	local pos, ang = m:GetTranslation(), m:GetAngles()
	local p, a = self.PR_WMPos, self.PR_WMAng
	pos = pos + ang:Forward() * p.x + ang:Right() * p.y + ang:Up() * p.z
	ang:RotateAroundAxis(ang:Up(), a.y)
	ang:RotateAroundAxis(ang:Right(), a.x)
	ang:RotateAroundAxis(ang:Forward(), a.z)
	return pos, ang
end

-- Ракета CW рвётся от касания физики, а на ~5800 ю/с касание с игроком иногда не срабатывает —
-- ракета проскакивала сквозь цель. Каждый тик — трасса от прошлой точки до новой
local HULL = Vector(4, 4, 4)
local function TraceGuard(ent, owner)
	if not (ent.selfDestruct or ent.PhysicsCollide) then return end
	local id, last = "PR_ProjTrace" .. ent:EntIndex(), ent:GetPos()
	timer.Create(id, 0, 0, function()
		if not IsValid(ent) or ent.HadEnough then timer.Remove(id) return end
		local now = ent:GetPos()
		if CurTime() > (ent.ArmTime or 0) then
			local tr = util.TraceHull({start = last, endpos = now, mins = -HULL, maxs = HULL, filter = {ent, owner}, mask = MASK_SHOT})
			local hit = tr.Entity
			if IsValid(hit) and (hit:IsPlayer() or hit:IsNPC()) then
				ent:SetPos(tr.HitPos)
				timer.Remove(id)
				if ent.selfDestruct then
					ent:selfDestruct()
				else
					-- 40 мм: взрыв — в PhysicsCollide после взвода
					local phys = ent:GetPhysicsObject()
					local vel = IsValid(phys) and phys:GetVelocity() or Vector()
					ent:PhysicsCollide({HitPos = tr.HitPos, HitEntity = hit, HitNormal = tr.HitNormal, OurOldVelocity = vel, Speed = vel:Length()}, phys)
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

-- Гранатомёт: тот же снаряд, что у игрока, в точку прицела владельца (GetAimPosition бойца
-- даёт оценку слоя пехоты, когда цель не видна — так гранатомётчик бьёт и по укрытию)
local function FireProjectile(self, status)
	if status ~= "PostFire" or CLIENT then return end
	local owner = self:GetOwner()
	if not IsValid(owner) then return end
	local ent = ents.Create(self.PR_Projectile)
	if not IsValid(ent) then return end
	-- От глаз, а не от бедра: снаряд CW до взвода (0,1 с) летит под гравитацией и с низкого старта
	-- ложился в землю на полпути
	local from = owner:EyePos()
	local enemy = owner.GetEnemy and owner:GetEnemy()
	local to = (owner.GetAimPosition and IsValid(enemy)) and owner:GetAimPosition(enemy, from, 0, self.PR_ProjectileSpeed) or (from + owner:GetForward() * 1000)
	if owner.PR_AimOverride then to = owner.PR_AimOverride end
	local dir
	if self.PR_Lob then
		dir = Lob(from, to, self.PR_ProjectileSpeed)
	else
		-- Ракета: поправка на снижение ~0,8° за время до взвода
		to = to + Vector(0, 0, 15 + from:Distance(to) * 0.014)
		dir = (to - from):GetNormalized()
	end
	-- Разброс РПГ: ~0,6° — на 2000 ю ~20 ю, в пределах ширины человека (1,5° давали ~50 ю и ракета
	-- проходила мимо стоящей цели); слой пехоты может умножить через PR_LauncherSpread
	local spread = math.rad(0.6) * (owner.PR_LauncherSpread or 1)
	dir = (dir + VectorRand() * math.tan(spread)):GetNormalized()
	PR_NPCW.Last = {from = from, to = to, dir = dir, t = CurTime()}
	ent:SetPos(from + dir * 40)
	ent:SetAngles(dir:Angle())
	ent:Spawn()
	ent:Activate()
	ent:SetOwner(owner)
	ent.safetyBypass = true
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then phys:SetVelocity(dir * self.PR_ProjectileSpeed) end
	if ent.Fuse and self.PR_ProjectileFuse then ent:Fuse(self.PR_ProjectileFuse) end
	TraceGuard(ent, owner)
	if PR_Inf and PR_Inf.OnLauncherFired then PR_Inf.OnLauncherFired(owner, from, to) end
end

local function Build()
	local scale = (PR_INF and PR_INF.npcDamageScale) or 0.2
	local made = 0
	for _, w in ipairs(weapons.GetList()) do
		local cls = w.ClassName
		if cls and not string.find(cls, "base", 1, true) and (weapons.IsBasedOn(cls, "cw_base") or weapons.IsBasedOn(cls, "mw3_wpn_base")) then
			local full = weapons.Get(cls)
			local hold = string.lower(tostring(full and (full.NormalHoldType or full.HoldType) or ""))
			local proj, projSpeed, lob
			if full then proj, projSpeed, lob = Projectile(full) end
			local launcher = proj ~= nil
			local clip = full and full.Primary and full.Primary.ClipSize or 0
			if full and (full.Spawnable or full.AdminSpawnable) and HOLD[hold] and isstring(full.WorldModel) and full.WorldModel ~= ""
				and (launcher or (clip > 0 and tonumber(full.Damage))) then
				local kind = Kind(full, hold)
				local name = "weapon_vj_cw_" .. string.gsub(cls, "^cw_", "")
				local semi = kind == "dmr" or kind == "sniper" or kind == "pistol"
				local delay = tonumber(full.FireDelay) or 0.1
				local SWEP = {
					Base = "weapon_vj_base",
					PrintName = (full.PrintName or cls) .. " (NPC)",
					Category = "PR: CW для NPC",
					Spawnable = false,
					MadeForNPCsOnly = true,
					ReplacementWeapon = cls,
					WorldModel = full.WorldModel,
					HoldType = HOLD[hold],
					NPC_NextPrimaryFire = semi and math.max(delay, kind == "sniper" and 1.5 or 0.3) or math.max(delay, 0.05),
					NPC_CustomSpread = 1,
					Reload_TimeUntilAmmoIsSet = 1.6,
					Primary = {
						Damage = math.max(1, math.Round((tonumber(full.Damage) or 30) * scale)),
						NumberOfShots = tonumber(full.Shots) or 1,
						ClipSize = launcher and 1 or clip,
						Ammo = full.Primary and full.Primary.Ammo or "SMG1",
						Sound = full.FireSound or "Weapon_AK47.Single",
						SoundLevel = 105,
						HasDistantSound = false,
						Automatic = not semi,
						DisableBulletCode = launcher or nil,
					},
					PR_CW = cls,
					PR_Kind = kind,
				}
				if launcher then
					SWEP.NPC_NextPrimaryFire = 4
					SWEP.NPC_StandingOnly = true
					SWEP.PR_Projectile = proj
					SWEP.PR_ProjectileSpeed = projSpeed
					SWEP.PR_Lob = lob
					SWEP.PR_ProjectileFuse = full.projectileFuse
					SWEP.OnPrimaryAttack = FireProjectile
				end
				-- KK и все, кто рисует модель сам: ствол в кисть по их формуле
				if (weapons.IsBasedOn(cls, "cw_kk_ins2_base") or full.DrawTraditionalWorldModel == false) and full.WMPos and full.WMAng then
					SWEP.WorldModel_UseCustomPosition = true
					SWEP.PR_WMPos = Vector(full.WMPos.x, full.WMPos.y, full.WMPos.z)
					SWEP.PR_WMAng = Angle(full.WMAng.x or full.WMAng.p or 0, full.WMAng.y or 0, full.WMAng.z or full.WMAng.r or 0)
					SWEP.GetWeaponCustomPosition = KKPosition
				end
				weapons.Register(SWEP, name)
				PR_NPCW.List[name] = {cw = cls, kind = kind, name = full.PrintName or cls}
				made = made + 1
			end
		end
	end
	PR_NPCW.Count = made
	if SERVER then MsgN("[PR] NPC-копий стволов CW: " .. made) end
end

-- Стволы CW регистрируются после файлов режима — строим, когда все загружены
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
