-- Совместимость с VIVO Health Overhaul (Workshop 2531451625): урон по игроку у него — раны по частям
-- тела. Пулевой урон VIVO берёт только в ScalePlayerDamage (там известна часть тела), а в
-- EntityTakeDamage пулевой урон просто отменяет. Пули Гредвича (пулемёты Ми-24, OH-6, спаренные
-- пулемёты танков) бьют напрямую через TakeDamageInfo, мимо ScalePlayerDamage, — VIVO их отменял,
-- и очереди техники игроков не ранили. Такие попадания отдаём VIVO сами: часть тела — по хитбоксу,
-- ближайшему к месту попадания (PR_Body.HitGroupAt, sv_body.lua). Броня, кровотечение, переломы —
-- всё как у обычной пули

-- Подменяем обработчик VIVO его же именем: порядок обработчиков EntityTakeDamage не задан, и свой
-- рядом мог бы не успеть до того, как VIVO отменит урон
local function WrapVivo()
	local hooks = hook.GetTable().EntityTakeDamage
	local vivo = hooks and hooks.danguOJSinjured
	if not isfunction(vivo) or vivo == PR_VivoWrapper or not isfunction(danguOJSInjuredMain) then return end

	PR_VivoWrapper = function(ply, dmginfo)
		-- Пулю, прошедшую через ScalePlayerDamage, VIVO уже обнулил; урон, равный здоровью, — это
		-- добивание от самого VIVO, его не трогаем
		if IsValid(ply) and ply:IsPlayer() and ply:Alive() and dmginfo:IsBulletDamage()
			and dmginfo:GetDamage() > 0 and dmginfo:GetDamage() ~= ply:Health() then
			-- Часть тела не нашлась — урон по всему телу, как у VIVO для «попадания без зоны»
			local ok, group = pcall(PR_Body.HitGroupAt, ply, dmginfo:GetDamagePosition())
			danguOJSInjuredMain(ply, ok and group or HITGROUP_GENERIC, dmginfo)
		end
		return vivo(ply, dmginfo)
	end
	hook.Add("EntityTakeDamage", "danguOJSinjured", PR_VivoWrapper)
end

----------------------------------------------------------------------------------------------------
-- Тарковские правила в VIVO (игрок, 2026-10-28: «допили vivo, чтобы как в Таркове работал»). У VIVO
-- урон по чёрной части — |урон × множитель − HP| / 6 в каждую живую часть (живот ×2, без ×0,7, деление
-- на 6, даже когда живых частей меньше), одно кровотечение — 1 HP за 2 с с одной части, нога — скорость
-- ×0,9. Здесь части тела, перенос, кровотечения (лёгкое и тяжёлое, тик со всех частей), переломы и
-- хромота — по ядру sv_body.lua, как у бойцов патрулей. Броня, боль, оглушение от шлема, звуки и
-- добивание — по-прежнему VIVO
----------------------------------------------------------------------------------------------------
local B = PR_BODY
local MAXCV = {Head = "vivo_HPHeadMax", Thorax = "vivo_HPThoraxMax", Stomach = "vivo_HPStomachMax", LeftArm = "vivo_HPArmsMax",
	RightArm = "vivo_HPArmsMax", LeftLeg = "vivo_HPLegsMax", RightLeg = "vivo_HPLegsMax"}

local function BleedKind(ply, part)
	local kinds = ply.PR_Bleed
	return kinds and kinds[part] or "light"
end

-- Кровотечение на часть: VIVO-статус «Bleed» с периодом тика вида; лёгкое → тяжёлое — таймер заново
local function AddBleed(add, ply, part, kind)
	ply.PR_Bleed = ply.PR_Bleed or {}
	local has = OJSWounds:HasStatus(ply, part, "Bleed")
	if has and (kind ~= "heavy" or ply.PR_Bleed[part] == "heavy") then return end
	if has then OJSWounds:RemoveStatus(ply, part, "Bleed") end
	ply.PR_Bleed[part] = kind
	add(OJSWounds, ply, part, "Bleed", B.bleed[kind].period, 0)
end

local function TarkovVivo()
	if not (OJSWounds and isfunction(OJSWounds.TakeDamage) and isfunction(OJSWounds.AddStatus)) or OJSWounds.PR_Tarkov then return end
	local orig, origAdd = OJSWounds.TakeDamage, OJSWounds.AddStatus
	OJSWounds.PR_Tarkov = true

	-- Внутри вызова VIVO ради брони свои кровотечения, переломы и боль он не ставит — их ставит ядро
	-- (боль в EFT — от перелома и чёрной части, а не от любого попадания ≥ 20)
	function OJSWounds:AddStatus(ply, part, status, duration, loops)
		if OJSWounds.PR_NoWounds and (status == "Bleed" or status == "Fractured" or status == "Pain") then return end
		return origAdd(self, ply, part, status, duration, loops)
	end
	local function Pain(ply, part)
		if not OJSWounds:HasStatus(ply, "Head", "Painkillers") then origAdd(OJSWounds, ply, part, "Pain", nil, nil) end
	end

	-- Тик кровотечения VIVO на голове и груди шёл, только пока у части больше 1 HP: стекла грудь до 1 —
	-- кровотечение с неё встало, хотя должно сливать остальные части
	local origStatus = OJSWounds.Status
	function OJSWounds:Status(ply, part, status)
		if status ~= "Bleed" or not (IsValid(ply) and ply.OJSHPTable) then return origStatus(self, ply, part, status) end
		if GetConVarNumber("vivo_bloodtrails") == 1 then
			local e = EffectData()
			e:SetOrigin(ply:GetPos() + Vector(0, 0, 20))
			e:SetNormal(ply:GetPos():GetNormal())
			e:SetEntity(ply)
			util.Effect("bleedingsplat", e, true, true)
		end
		local d = DamageInfo()
		d:SetDamageType(268435456)
		OJSWounds:TakeDamage(ply, 1, part, ply, d, false, false, true)
	end

	function OJSWounds:TakeDamage(ply, dmg, part, attacker, dmginfo, painSound, recursive, bleedDamage)
		local t = IsValid(ply) and ply:IsPlayer() and ply:Alive() and dmginfo and ply.OJSHPTable
		if not (t and t[part]) or recursive or GetConVarNumber("vivo_enable") == 0 then
			return orig(self, ply, dmg, part, attacker, dmginfo, painSound, recursive, bleedDamage)
		end
		local hp = {}
		for _, p in ipairs(PR_Body.Parts) do hp[p] = t[p].HP end
		local dead = false
		local wasZero = t[part].HP <= 0
		if IsValid(attacker) and attacker ~= ply and not attacker:IsWorld() then ply.PR_LastAttacker = attacker end
		if bleedDamage then
			-- Тик кровотечения (таймер VIVO на раненой части): урон вида со всех живых частей
			dead = PR_Body.BleedTick(hp, B.bleed[BleedKind(ply, part)].tick)
		else
			-- Броня, боль и оглушение — VIVO: часть на время «бездонная», чтобы VIVO не делал свой перенос;
			-- сколько он с неё снял — урон после брони
			local before = t[part].HP
			t[part].HP = 1e6
			OJSWounds.PR_NoWounds = true
			local ok, err = pcall(orig, self, ply, dmg, part, attacker, dmginfo, painSound, false, false)
			OJSWounds.PR_NoWounds = nil
			local dealt = math.max(0, 1e6 - t[part].HP)
			t[part].HP = before
			-- VIVO выставил здоровье по «бездонной» части (~1e6) — вернуть сразу (иначе его добивание било
			-- на миллион, и это попадало в запись боя)
			ply:SetHealth(math.max(1, math.ceil(PR_Body.Sum(hp))))
			if not ok then ErrorNoHalt("[PR] VIVO: " .. tostring(err) .. "\n") end
			if not (IsValid(ply) and ply:Alive()) then return end
			hp[part] = before
			dead = PR_Body.Apply(hp, part, dealt)
			-- Раны: от пули (и по уже чёрной части), осколков взрыва — кровотечение по доле урона; падение —
			-- перелом ноги. Перелом и почерневшая часть — боль
			local max = GetConVarNumber(MAXCV[part])
			if not dead and dealt > 0 then
				local bleed, frac
				if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) then
					bleed, frac = PR_Body.Roll(part, dealt, max)
				elseif dmginfo:IsExplosionDamage() then
					bleed = PR_Body.Roll(part, dealt, max)
				elseif dmginfo:IsFallDamage() and PR_Body.Limb[part] then
					frac = PR_Body.RollFall(dealt, max)
				end
				if bleed then AddBleed(origAdd, ply, part, bleed) end
				if frac then origAdd(OJSWounds, ply, part, "Fractured", nil, nil) Pain(ply, part) end
				if hp[part] <= 0 and not wasZero then Pain(ply, part) end
			end
		end
		for _, p in ipairs(PR_Body.Parts) do t[p].HP = hp[p] end
		if dead then
			-- Смерть — путь VIVO (крик, добивание с засчитыванием attacker): голова или грудь уже в нуле
			local vital = hp.Head <= 0 and "Head" or "Thorax"
			t[vital].HP = 0
			-- От кровотечения — засчитывается тому, кто ранил
			if bleedDamage and IsValid(ply.PR_LastAttacker) then attacker = ply.PR_LastAttacker end
			ply:SetHealth(math.max(1, math.ceil(PR_Body.Sum(hp))))
			ply.PR_BodyKill = true
			local r = orig(self, ply, 0, vital, attacker, dmginfo, false, true, false)
			if IsValid(ply) then ply.PR_BodyKill = nil end
			return r
		end
		ply:SetHealth(math.max(1, math.ceil(PR_Body.Sum(hp))))
		OJSWounds:UpdateClient(ply)
	end
end

-- Хромота игрока — sh_vivo_limp.lua (общий для клиента и сервера)

-- Бинт (ojs_bandage, ojs_armybandage) и автоаптечка (ojs_car) в EFT останавливают только лёгкое
-- кровотечение; Grizzly и medcase — и тяжёлое (сначала его)
local LIGHT_ONLY = {ojs_bandage = true, ojs_armybandage = true, ojs_car = true}
-- То же у EFTMeds (магазин продаёт их): бинт и автоаптечка — только лёгкое; Salewa, Grizzly — и тяжёлое
local LIGHT_ONLY_SWEP = {weapon_bandage = true, weapon_carmedkit = true}

local function LightOnly(fn)
	return function(...)
		OJSWounds.PR_LightOnly = true
		local ok, err = pcall(fn, ...)
		OJSWounds.PR_LightOnly = nil
		if not ok then ErrorNoHalt(tostring(err) .. "\n") end
	end
end

-- Обёртки предметов: сущности и оружие регистрируются после режима — зовём на InitPostEntity
local function TarkovMedItems()
	for cls in pairs(LIGHT_ONLY) do
		local t = scripted_ents.GetStored(cls)
		t = t and t.t
		if t and isfunction(t.Use) and not t.PR_LightOnly then
			t.PR_LightOnly = true
			t.Use = LightOnly(t.Use)
		end
	end
	for cls in pairs(LIGHT_ONLY_SWEP) do
		local t = weapons.GetStored(cls)
		if t and isfunction(t.HealOwner) and not t.PR_LightOnly then
			t.PR_LightOnly = true
			t.HealOwner = LightOnly(t.HealOwner)
		end
	end
end

local function TarkovMeds()
	if not (OJSWounds and isfunction(OJSWounds.HealBleed)) or OJSWounds.PR_TarkovMeds then return end
	OJSWounds.PR_TarkovMeds = true
	-- Бинт «видит» только лёгкое кровотечение: при одном тяжёлом не тратит заряд
	local origWhole = OJSWounds.HasStatusWholeBody
	function OJSWounds:HasStatusWholeBody(ply, status)
		if status == "Bleed" and OJSWounds.PR_LightOnly and IsValid(ply) and ply.OJSHPTable then
			for _, p in ipairs(PR_Body.Parts) do
				if ply.OJSHPTable[p].StatusEffects.Bleed and ((ply.PR_Bleed or {})[p] or "light") == "light" then return true end
			end
			return false
		end
		return origWhole(self, ply, status)
	end
	function OJSWounds:HealBleed(ply)
		if not (IsValid(ply) and ply:IsPlayer() and ply:Alive() and ply.OJSHPTable) then return end
		local t, kinds = ply.OJSHPTable, ply.PR_Bleed or {}
		local order = OJSWounds.PR_LightOnly and {"light"} or {"heavy", "light"}
		for _, want in ipairs(order) do
			for _, p in ipairs(PR_Body.Parts) do
				if t[p].StatusEffects.Bleed and (kinds[p] or "light") == want then
					OJSWounds:RemoveStatus(ply, p, "Bleed")
					kinds[p] = nil
					ply:PrintMessage(HUD_PRINTTALK, p .. (want == "heavy" and " heavy" or "") .. " bleed healed.")
					return
				end
			end
		end
		if OJSWounds.PR_LightOnly then ply:PrintMessage(HUD_PRINTTALK, "A bandage does not stop heavy bleeding.") end
	end
end

-- Множители ArcCW по зонам у пули по игроку — снять до VIVO (в Таркове их нет): подменяем обработчик
-- VIVO в ScalePlayerDamage его же именем
local function TarkovZones()
	local hooks = hook.GetTable().ScalePlayerDamage
	local vivo = hooks and hooks.danguOJSinjuredMain
	if not isfunction(vivo) or vivo == PR_VivoZones then return end
	PR_VivoZones = function(ply, hitgroup, dmginfo)
		PR_Body.UndoArcCW(dmginfo, hitgroup)
		return vivo(ply, hitgroup, dmginfo)
	end
	hook.Add("ScalePlayerDamage", "danguOJSinjuredMain", PR_VivoZones)
end

-- Новая жизнь — виды кровотечений заново; ушёл — таймеры кровотечений VIVO снять (иначе бьют по NULL)
hook.Add("PlayerSpawn", "PR_VivoBleedReset", function(ply) ply.PR_Bleed, ply.PR_LastAttacker = nil, nil end)
-- (таймер VIVO зовётся ник..часть..статус; снимаем по имени — флаг статуса мог уже сброситься)
hook.Add("PlayerDisconnected", "PR_VivoClearStatuses", function(ply)
	for _, p in ipairs(PR_Body.Parts) do
		for _, st in ipairs({"Bleed", "Painkillers", "Dazed", "Pain", "Fractured"}) do timer.Remove(ply:Nick() .. p .. st) end
	end
end)

-- Аддоны грузятся до Initialize; второй вызов — на случай перезагрузки Lua режима
hook.Add("Initialize", "PR_VivoGredBullets", function()
	WrapVivo()
	TarkovVivo()
	TarkovZones()
end)
-- Предметы (scripted_ents, оружие EFTMeds) — после загрузки карты
hook.Add("InitPostEntity", "PR_VivoTarkovMeds", function()
	TarkovMeds()
	TarkovMedItems()
end)
WrapVivo()
TarkovVivo()
TarkovZones()
TarkovMeds()
