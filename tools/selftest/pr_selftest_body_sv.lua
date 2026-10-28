-- Тарковское здоровье по частям тела (gamemode/sv_body.lua, config/body.lua, docs/body.md): правила ядра,
-- боец патруля (пуля по хитбоксу, тело по модели, хромота, разброс, кровотечение, лечение, смерть от
-- кровотечения) и VIVO у игрока по тем же правилам.
-- run_selftest.ps1 -Suite body
if engine.ActiveGamemode() ~= "testgm" then return end

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor, check = T.S, T.log, T.step, T.waitFor, T.check
local B   -- PR_BODY: конфиг режима грузится после autorun — берём в первом шаге

local SCOUT = "models/player/eft/followers/glukhar/glukhar_scout.mdl"   -- таблица EFT: 40/140/100/70/80 = 580
local KILLA = "models/player/eft/bosses/killa.mdl"                       -- 70/210/170/100/120 = 890, обезбол
local PLAIN = "models/player/group03/male_07.mdl"                        -- не из таблицы — как ЧВК

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

local function Near(a, b, eps) return a ~= nil and b ~= nil and math.abs(a - b) <= (eps or 0.05) end

local function Full()
	local t = {}
	for _, p in ipairs(PR_Body.Parts) do t[p] = B.parts[p] end
	return t
end

-- Доля переноса с чёрной части на каждую из n живых
local function Share(part, dmg, n) return dmg * B.spread[part] * B.spreadReceive / n end

local function Soldier(pos, yaw, model)
	local n = ents.Create("npc_pr_soldier")
	n:SetModel(model or SCOUT)
	n:SetKeyValue("additionalequipment", "weapon_vj_arccw_ur_ak")
	n:SetPos(pos)
	n:SetAngles(Angle(0, yaw or 90, 0))
	PR_Quietly(function() n:Spawn() n:Activate() end)
	n.PR_Role = ""
	S.all = S.all or {}
	table.insert(S.all, n)
	return n
end

-- Центр хитбокса группы (голова, нога...) — туда стреляем
local function Center(ent, group)
	local set = ent:GetHitboxSet()
	for i = 0, (ent:GetHitBoxCount(set) or 0) - 1 do
		if ent:GetHitBoxHitGroup(i, set) == group then
			local bone = ent:GetHitBoxBone(i, set)
			local mins, maxs = ent:GetHitBoxBounds(i, set)
			local m = bone and ent:GetBoneMatrix(bone)
			if m and mins then return LocalToWorld((mins + maxs) * 0.5, angle_zero, m:GetTranslation(), m:GetAngles()) end
		end
	end
end

-- Пуля бота-стрелка в хитбокс группы с 120 ю спереди бойца
local function Shoot(n, group, dmg)
	local c = Center(n, group)
	if not c then return false end
	local src = c + n:GetForward() * 120
	S.bot:FireBullets({Attacker = S.bot, Src = src, Dir = (c - src):GetNormalized(), Damage = dmg, Num = 1,
		Spread = vector_origin, Force = 0, Tracer = 0, IgnoreEntity = S.bot})
	return true
end

hook.Add("OnNPCKilled", "PR_SelfTestBody", function(npc, attacker)
	if npc == S.k then S.kAttacker = attacker end
end)

T.section("core")
step(0, function()
	log("start (body)")
	B = PR_BODY
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()

	local hp = Full()
	check("parts add up to 440", Near(PR_Body.Sum(hp), 440), PR_Body.Sum(hp))
	check("head 35 kills", PR_Body.Apply(hp, "Head", 35) == true)
	hp = Full()
	check("thorax 84 does not kill (1 HP left)", PR_Body.Apply(hp, "Thorax", 84) == false and Near(hp.Thorax, 1), hp.Thorax)
	-- Нога ушла в ноль: излишек 15 × 1 × 0,7 поровну на 6 остальных
	hp = Full()
	local dead = PR_Body.Apply(hp, "LeftLeg", 80)
	local share = Share("LeftLeg", 15, 6)
	check("leg blacked by 80: overflow 15 x 0.7 spread over the other 6", not dead and hp.LeftLeg == 0 and Near(hp.Head, 35 - share) and Near(hp.RightLeg, 65 - share),
		string.format("leg %.1f head %.2f rleg %.2f", hp.LeftLeg, hp.Head, hp.RightLeg))
	-- По чёрному животу: × 1,5 × 0,7 = × 1,05 поровну на 6
	hp = Full()
	hp.Stomach = 0
	PR_Body.Apply(hp, "Stomach", 40)
	share = Share("Stomach", 40, 6)
	check("blacked stomach: 40 x 1.05 spread over 6 (VIVO: x2)", Near(share, 7) and Near(hp.Head, 35 - share) and Near(hp.Thorax, 85 - share), string.format("head %.2f", hp.Head))
	-- Обе ноги чёрные: делится на 5 живых, а не на 6 (у VIVO — всегда на 6)
	hp = Full()
	hp.LeftLeg, hp.RightLeg = 0, 0
	PR_Body.Apply(hp, "LeftLeg", 50)
	share = Share("LeftLeg", 50, 5)
	check("two legs blacked: damage x 0.7 splits over the 5 alive parts", Near(hp.Thorax, 85 - share) and hp.RightLeg == 0, string.format("thorax %.2f", hp.Thorax))
	hp = Full()
	hp.LeftArm = 0
	PR_Body.Apply(hp, "LeftArm", 60)
	share = Share("LeftArm", 60, 6)
	check("blacked arm: 60 x 0.49 spread over 6", Near(hp.Head, 35 - share), string.format("head %.2f", hp.Head))
	hp = Full()
	hp.Head, hp.LeftLeg = 5, 0
	check("spread from a blacked leg can kill through the head", PR_Body.Apply(hp, "LeftLeg", 60) == true)
	-- Тик кровотечения — со всех живых частей; голова в ноль от кровотечения не убивает, следующий урон — да
	hp = Full()
	hp.Head = 1
	dead = PR_Body.BleedTick(hp, 1.36)
	check("bleed tick takes HP from every alive part", not dead and Near(hp.Thorax, 85 - 1.36) and Near(hp.LeftLeg, 65 - 1.36) and hp.Head == 0,
		string.format("thorax %.2f head %.2f", hp.Thorax, hp.Head))
	check("head bled to zero: the next hit anywhere kills", PR_Body.Apply(hp, "LeftArm", 1) == true)
	hp = {Head = 0.5, Thorax = 0.5, Stomach = 0, LeftArm = 0, RightArm = 0, LeftLeg = 0, RightLeg = 0}
	check("bleeding kills when the whole body reaches zero", PR_Body.BleedTick(hp, 1.36) == true)

	-- Броня: 7,62×39 ПС (пробитие 35) в плиту класса 5 (A ≈ 50) — не пробивает, блант; в мягкую класса 2 —
	-- пробивает почти всегда
	local plate = {cls = 5, max = 50, dur = 50}
	local d, pen = PR_Body.ArmorHit(plate, 50, 35)
	local eff = (121 - 5000 / (45 + 200)) * 5 * 0.1
	local blunt = 50 * B.armor.blunt * math.Clamp(1 - 0.03 * (eff - 35), 0.2, 1)
	check("PS 7.62 does not go through a class 5 plate: blunt only", pen == false and Near(d, blunt, 0.05) and Near(plate.dur, 50 - 35 * B.armor.durLoss, 0.01),
		string.format("dmg %.2f (want %.2f) dur %.2f", d, blunt, plate.dur))
	local through = 0
	for i = 1, 20 do
		local _, ok = PR_Body.ArmorHit({cls = 2, max = 40, dur = 40}, 50, 35)
		if ok then through = through + 1 end
	end
	check("PS 7.62 goes through class 2 soft armor (15+ of 20)", through >= 15, through)
end)

T.section("common")
step(0, function()
	S.base = Ground(-12450, -2500)
	S.bot = player.CreateNextBot("body_target")
end)

step(1, function()
	local bot = S.bot
	bot:Spawn()
	bot:SetNWString("PR_fraction", "")
	bot.VJ_NPC_Class = nil
	bot:StripWeapons()
	bot:AddFlags(FL_NOTARGET)
	bot:SetPos(S.base + Vector(600, 0, 0))
end)

T.section("bot")
step(0, function()
	S.n = Soldier(S.base, 90, SCOUT)
	-- Здоровье патруля 600 ставится сразу после Spawn — тело собирается на следующем тике
	S.p = Soldier(S.base + Vector(-300, 0, 0), 90, PLAIN)
	S.p:SetMaxHealth(600)
	S.p:SetHealth(600)
	S.ki = Soldier(S.base + Vector(-600, 0, 0), 90, KILLA)
	S.ki:SetMaxHealth(600)
end)

step(0.5, function()
	local body = S.n.PR_Body
	check("Glukhar's scout gets his EFT body (580, head 40)", body ~= nil and S.n:GetMaxHealth() == 580 and S.n:Health() == 580 and body.max.Head == 40,
		S.n:GetMaxHealth())
	local pb = S.p.PR_Body
	check("plain model, patrol health 600: PMC parts scaled (head 48)", pb ~= nil and Near(pb.max.Head, 35 * 600 / 440, 0.1) and S.p:GetMaxHealth() == 600,
		pb and string.format("head %.1f max %d", pb.max.Head, S.p:GetMaxHealth()))
	local kb = S.ki.PR_Body
	check("Killa gets his EFT body (890, head 70, painkiller)", kb ~= nil and S.ki:GetMaxHealth() == 890 and kb.max.Head == 70 and kb.pk == true,
		S.ki:GetMaxHealth())
	if kb then
		kb.hp.LeftLeg = 0
		check("Killa runs on a blacked leg (permanent painkiller)", PR_Body.CanRun(S.ki) == true)
		local a = kb.armor or {}
		check("Killa wears his EFT armor (helmet 4, visor 6, chest plates 5, belly 3)", a.head and a.head.cls == 4 and a.face and a.face.cls == 6
			and a.chest and a.chest.cls == 5 and a.belly and a.belly.cls == 3, PR_Body.Describe(S.ki))
	end
	-- Удар прикладом приходит без точки попадания — в грудь
	if pb then
		local club = DamageInfo()
		club:SetDamage(20)
		club:SetDamageType(DMG_CLUB)
		club:SetAttacker(S.bot)
		S.p:TakeDamageInfo(club)
		check("rifle bash without a hit position lands on the thorax", pb.lastPart == "Thorax", pb.lastPart)
	end
	-- Попадания ниже — без брони (у разведчика Глухаря шлем 98% и броня тела — проверка брони отдельно)
	if body then body.armor = nil end
	S.okHead = Shoot(S.n, HITGROUP_HEAD, 30)
end)

step(0.2, function()
	local body = S.n.PR_Body
	check("head shot 30 hits the head (no sandbox x2): 10 left", S.okHead and body.lastPart == "Head" and Near(body.hp.Head, 10, 0.5),
		body and string.format("%s head %.1f", tostring(body.lastPart), body.hp.Head))
	check("soldier's health is the sum of parts", Near(S.n:Health(), math.ceil(PR_Body.Sum(body.hp)), 1), S.n:Health())
	S.okLeg = Shoot(S.n, HITGROUP_LEFTLEG, 90)
end)

step(0.2, function()
	local body = S.n.PR_Body
	check("leg shot 90 blacks the leg (80), soldier alive", S.okLeg and body.lastPart == "LeftLeg" and body.hp.LeftLeg == 0 and S.n:Health() > 0,
		body and string.format("%s leg %.1f hp %d", tostring(body.lastPart), body.hp.LeftLeg, S.n:Health()))
	check("blacked leg: cannot run", PR_Body.CanRun(S.n) == false)
	S.n:PR_Move(S.n:GetPos() + Vector(200, 0, 0), "run")
	check("blacked leg: run order becomes a walk", S.n.PR_Gait == "walk", S.n.PR_Gait)
	S.n:PR_Stop()
	check("blacked leg: in pain, wider spread", PR_Body.AimMul(S.n) >= B.pain - 0.01, PR_Body.AimMul(S.n))
	local m0 = PR_Body.AimMul(S.n)
	local arm = body.hp.LeftArm
	body.hp.LeftArm = 0
	check("blacked arm: wider spread", PR_Body.AimMul(S.n) >= m0 * B.armBlack - 0.01, string.format("%.2f -> %.2f", m0, PR_Body.AimMul(S.n)))
	body.hp.LeftArm = arm
	-- Лёгкое кровотечение на правой руке: первый тик сразу
	body.bleed.RightArm, body.bleedNext.RightArm = "light", 0
	S.bleedArm, S.bleedChest = body.hp.RightArm, body.hp.Thorax
end)

step(0.8, function()
	local body = S.n.PR_Body
	local tick = B.bleed.light.tick
	check("light bleed tick drains every part, not only the arm", Near(S.bleedArm - body.hp.RightArm, tick, 0.05) and Near(S.bleedChest - body.hp.Thorax, tick, 0.05),
		string.format("arm -%.2f chest -%.2f", S.bleedArm - body.hp.RightArm, S.bleedChest - body.hp.Thorax))
end)

-- Безопасно (врага не видно, по нему давно не стреляли, метка старше 10 с) — бинтуется
waitFor(40, function() return S.n.PR_Body.bleed.RightArm == nil end, "soldier treats the bleeding")
step(0, function()
	local body = S.n.PR_Body
	check("safe soldier stops its bleeding", body.bleed.RightArm == nil and (body.treated or 0) >= 1, body.treated)
	-- Смерть от кровотечения засчитывается тому, кто ранил
	S.k = Soldier(S.base + Vector(300, 0, 0), 90, PLAIN)
end)

step(0.5, function()
	local body = S.k.PR_Body
	-- Без жгута и аптечек (запас 0) — иначе он бы перевязался: по нему не стреляли, врага не видно
	for _, p in ipairs(PR_Body.Parts) do body.hp[p] = 0.5 end
	body.hp.LeftLeg = 0
	body.bleed.LeftLeg, body.bleedNext.LeftLeg = "heavy", 0
	body.stock.heavy, body.stock.medHP = 0, 0
	body.attacker = S.bot
	PR_Body.SetHealthFromBody(S.k)
end)

waitFor(4, function() return S.kAttacker ~= nil or not IsValid(S.k) or S.k:Health() <= 0 end, "soldier bleeds out")
step(0.5, function()
	check("heavy bleeding kills a soldier with nothing left", S.kAttacker ~= nil or not IsValid(S.k) or S.k:Health() <= 0)
	check("bleed-out kill is credited to the shooter", S.kAttacker == S.bot, tostring(S.kAttacker))
	-- Аптечка: худшая часть (грудь 40 из 85) — до 85 HP за раз из ресурса
	S.m = Soldier(S.base + Vector(0, -300, 0), 90, PLAIN)
end)

step(0.5, function()
	local body = S.m.PR_Body
	body.hp.Thorax = 40
	PR_Body.SetHealthFromBody(S.m)
	S.med0 = body.stock.medHP
end)

waitFor(10, function() return (S.m.PR_Body.treated or 0) >= 1 end, "soldier uses a medkit")
step(0, function()
	local body = S.m.PR_Body
	check("medkit heals the worst part (thorax 40 -> 85) from its pool", Near(body.hp.Thorax, 85, 0.5) and Near(S.med0 - body.stock.medHP, 45, 0.5),
		string.format("thorax %.1f pool %d -> %d", body.hp.Thorax, S.med0 or -1, body.stock.medHP or -1))
	-- ArcCW множит урон пули по зоне и «гасит» sandbox: снимаем оба (в Таркове зон нет)
	S.bot:Give("arccw_ur_ak")
	S.bot:SelectWeapon("arccw_ur_ak")
end)

step(0.3, function()
	local w = S.bot:GetActiveWeapon()
	local t = IsValid(w) and w.BodyDamageMults
	if t and t[HITGROUP_LEFTARM] then
		local d = DamageInfo()
		d:SetDamage(100)
		d:SetDamageType(DMG_BULLET)
		d:SetAttacker(S.bot)
		PR_Body.UndoArcCW(d, HITGROUP_LEFTARM)
		local want = 100 / (t[HITGROUP_LEFTARM] * (ArcCW.LimbCompensation[1][HITGROUP_LEFTARM] or 1))
		check("ArcCW zone multipliers are undone (arm x3.4 -> x1)", Near(d:GetDamage(), want, 0.1), string.format("%.1f (want %.1f)", d:GetDamage(), want))
		check("AK 7.62x39 penetration is 35 (PS)", PR_Body.PenOf(d) == 35, PR_Body.PenOf(d))
	else
		check("ArcCW AK has zone multipliers to undo", false, IsValid(w) and w:GetClass())
	end
	S.bot:StripWeapons()
	for _, n in ipairs(S.all or {}) do if IsValid(n) then n:Remove() end end
	S.all = {}
end)

T.section("player")
local function Dmg()
	local d = DamageInfo()
	d:SetDamage(1)
	d:SetDamageType(DMG_BULLET)
	d:SetAttacker(game.GetWorld())
	return d
end
local function VT() return S.bot.OJSHPTable end
-- Заново: сначала снять статусы (таймеры кровотечений), потом VIVO сбросит таблицу
local function Reset() OJSWounds:ClearStatuses(S.bot) OJSWounds:Initalize(S.bot) S.bot.PR_Bleed = nil end

step(0.5, function()
	check("VIVO is loaded with the Tarkov rules", OJSWounds ~= nil and OJSWounds.PR_Tarkov == true)
	if not (OJSWounds and VT()) then return end
	S.bot:GodDisable()
	Reset()
	OJSWounds:TakeDamage(S.bot, 70, "Stomach", game.GetWorld(), Dmg(), false)
	OJSWounds:TakeDamage(S.bot, 40, "Stomach", game.GetWorld(), Dmg(), false)
	local t = VT()
	local share = Share("Stomach", 40, 6)
	check("player: blacked stomach spreads 40 x 1.05 over 6 (VIVO: 13.3 each)", Near(t.Head.HP, 35 - share, 0.1) and t.Stomach.HP == 0, string.format("head %.2f", t.Head.HP))
	local sum = 0
	for _, p in ipairs(PR_Body.Parts) do sum = sum + t[p].HP end
	check("player: health is the sum of parts", Near(S.bot:Health(), math.ceil(sum), 1), string.format("%d / %.1f", S.bot:Health(), sum))

	Reset()
	OJSWounds:TakeDamage(S.bot, 65, "LeftLeg", game.GetWorld(), Dmg(), false)
	OJSWounds:TakeDamage(S.bot, 65, "RightLeg", game.GetWorld(), Dmg(), false)
	OJSWounds:TakeDamage(S.bot, 50, "LeftLeg", game.GetWorld(), Dmg(), false)
	share = Share("LeftLeg", 50, 5)
	check("player: two legs blacked, damage x 0.7 splits over 5 (VIVO: /6)", Near(VT().Thorax.HP, 85 - share, 0.1), string.format("thorax %.2f", VT().Thorax.HP))

	-- Тик тяжёлого кровотечения — со всех частей
	Reset()
	S.bot.PR_Bleed = {LeftArm = "heavy"}
	OJSWounds:TakeDamage(S.bot, 1, "LeftArm", S.bot, Dmg(), false, false, true)
	local tick = B.bleed.heavy.tick
	check("player: heavy bleed tick takes 1.53 from every part", Near(VT().LeftArm.HP, 60 - tick, 0.05) and Near(VT().Head.HP, 35 - tick, 0.05),
		string.format("arm %.2f head %.2f", VT().LeftArm.HP, VT().Head.HP))

	-- Свои кровотечения и переломы VIVO больше не ставит (шанс у него 1/4 на 25 урона): 8 попаданий — ни одного
	Reset()
	S.bot.PR_Bleed = nil
	local roll = PR_Body.Roll
	PR_Body.Roll = function() return nil, false end
	for _, p in ipairs({"LeftArm", "RightArm", "LeftLeg", "RightLeg", "Stomach", "LeftArm", "RightLeg", "Stomach"}) do
		OJSWounds:TakeDamage(S.bot, 25, p, game.GetWorld(), Dmg(), false)
	end
	local vivoWound = false
	for _, p in ipairs(PR_Body.Parts) do
		local st = VT()[p].StatusEffects
		if st.Bleed or st.Fractured then vivoWound = true end
	end
	check("player: VIVO's own bleed/fracture rolls are off", not vivoWound)
	-- Кровотечение ядра — VIVO-статус с периодом вида
	PR_Body.Roll = function() return "heavy", true end
	OJSWounds:TakeDamage(S.bot, 10, "RightArm", game.GetWorld(), Dmg(), false)
	PR_Body.Roll = roll
	local st = VT().RightArm.StatusEffects
	check("player: Tarkov roll adds a heavy bleed and a fracture", st.Bleed == true and st.Fractured == true and S.bot.PR_Bleed and S.bot.PR_Bleed.RightArm == "heavy",
		string.format("bleed %s frac %s", tostring(st.Bleed), tostring(st.Fractured)))

	-- Бинт тяжёлое кровотечение не снимает, жгут/аптечка — снимает
	OJSWounds.PR_LightOnly = true
	OJSWounds:HealBleed(S.bot)
	OJSWounds.PR_LightOnly = nil
	check("player: a bandage does not stop a heavy bleed", VT().RightArm.StatusEffects.Bleed == true)
	OJSWounds:HealBleed(S.bot)
	check("player: a kit stops the heavy bleed", VT().RightArm.StatusEffects.Bleed == false)

	-- Тик кровотечения с груди на 1 HP идёт дальше (у VIVO вставал), сливая остальные части
	Reset()
	VT().Thorax.HP = 1
	S.bot.PR_Bleed = {Thorax = "light"}
	OJSWounds:Status(S.bot, "Thorax", "Bleed")
	check("player: bleeding from a 1 HP thorax still drains the body", Near(VT().LeftLeg.HP, 65 - B.bleed.light.tick, 0.05), string.format("leg %.2f", VT().LeftLeg.HP))

	-- Грудь в ноль — смерть
	Reset()
	OJSWounds:TakeDamage(S.bot, 90, "Thorax", game.GetWorld(), Dmg(), false)
end)

step(0.5, function()
	check("player: thorax 90 kills", IsValid(S.bot) and not S.bot:Alive())
end)

T.section("common")
step(1, function()
	for _, n in ipairs(S.all or {}) do if IsValid(n) then n:Remove() end end
	hook.Remove("OnNPCKilled", "PR_SelfTestBody")
	if IsValid(S.bot) then S.bot:Kick("selftest") end
end)
step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
