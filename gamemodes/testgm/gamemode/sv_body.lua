-- Тарковское здоровье по частям тела (как в EFT): общее ядро и бойцы патрулей (npc_pr_soldier).
-- Игрок — VIVO с теми же правилами (sv_vivo_compat.lua). Числа — config/body.lua, правила — docs/body.md
PR_Body = PR_Body or {}
local B = PR_BODY

local PARTS = {"Head", "Thorax", "Stomach", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}
PR_Body.Parts = PARTS
PR_Body.Group = {
	[HITGROUP_HEAD] = "Head", [HITGROUP_CHEST] = "Thorax", [HITGROUP_STOMACH] = "Stomach", [HITGROUP_GEAR] = "Stomach",
	[HITGROUP_LEFTARM] = "LeftArm", [HITGROUP_RIGHTARM] = "RightArm", [HITGROUP_LEFTLEG] = "LeftLeg", [HITGROUP_RIGHTLEG] = "RightLeg",
}
local LIMB = {LeftArm = true, RightArm = true, LeftLeg = true, RightLeg = true}
PR_Body.Limb = LIMB

----------------------------------------------------------------------------------------------------
-- Ядро: hp — таблица {Часть = HP}
----------------------------------------------------------------------------------------------------

-- Урон по части. Живая часть теряет урон; ушла в ноль — излишек удара, а по уже чёрной части — весь
-- урон × множитель части × spreadReceive поровну между остальными нечёрными частями (в том числе
-- головой и грудью). Голова или грудь в ноль — смерть; уже в нуле (от кровотечения) — смерть от любого
-- урона. Возвращает true — смерть
function PR_Body.Apply(hp, part, dmg)
	if not hp[part] or not dmg or dmg <= 0 then return false end
	for v in pairs(B.vital) do
		if hp[v] <= 0 then return true end
	end
	local cur = hp[part]
	if cur > 0 then
		if cur > dmg then hp[part] = cur - dmg return false end
		hp[part] = 0
		if B.vital[part] then return true end
		if not B.spreadOverflow then return false end
		dmg = dmg - cur
		if dmg <= 0 then return false end
	end
	local alive = {}
	for _, p in ipairs(PARTS) do
		if p ~= part and hp[p] > 0 then alive[#alive + 1] = p end
	end
	if #alive == 0 then return true end
	local share = dmg * (B.spread[part] or 1) * B.spreadReceive / #alive
	local dead = false
	for _, p in ipairs(alive) do
		hp[p] = math.max(0, hp[p] - share)
		if hp[p] <= 0 and B.vital[p] then dead = true end
	end
	return dead
end

-- Тик кровотечения: tick HP с каждой живой части. Голова и грудь уходят в ноль без смерти (убьёт
-- следующий урон). Возвращает true — смерть: всё тело в нуле
function PR_Body.BleedTick(hp, tick)
	local left = 0
	for _, p in ipairs(PARTS) do
		local floor = B.vital[p] and B.bleedVitalFloor or 0
		if hp[p] > floor then hp[p] = math.max(floor, hp[p] - tick) end
		left = left + hp[p]
	end
	return left <= 0
end

function PR_Body.Sum(hp)
	local s = 0
	for _, p in ipairs(PARTS) do s = s + (hp[p] or 0) end
	return s
end

-- Урон не пулей — по частям: падение — в ноги, взрыв и прочее — по всем частям. Список {часть, урон}
function PR_Body.Spread(dmginfo)
	local d = dmginfo:GetDamage()
	if dmginfo:IsFallDamage() then return {{"LeftLeg", d * B.fallMul}, {"RightLeg", d * B.fallMul}} end
	local mul = dmginfo:IsExplosionDamage() and B.explosionMul or B.otherMul
	local out = {}
	for _, p in ipairs(PARTS) do out[#out + 1] = {p, d * mul} end
	return out
end

-- Ранение пулей по части, пережившей удар (max — максимум HP этой части): кровотечение ("heavy" |
-- "light" | nil) и перелом (руки и ноги)
function PR_Body.Roll(part, dmg, max)
	local x = dmg / math.max(max or B.parts[part] or 1, 1)
	local function chance(c, sq) return x >= c.from and math.random() < (sq and c.k * math.sqrt(x) or c.k * x) + c.b end
	local bleed
	if chance(B.bleed.heavy) then bleed = "heavy" elseif chance(B.bleed.light) then bleed = "light" end
	local frac = LIMB[part] == true and chance(B.fracture, true)
	return bleed, frac
end

-- Перелом ноги от падения (урон в ногу, max — её максимум)
function PR_Body.RollFall(dmg, max)
	local c = B.fallFracture
	local x = dmg / math.max(max or 65, 1)
	return x >= c.from and math.random() < c.k * x + c.b
end

-- Группа хитбокса (голова, грудь, рука...), ближайшего к точке: для урона мимо ScaleNPCDamage /
-- ScalePlayerDamage (пули Гредвича у техники бьют через TakeDamageInfo)
function PR_Body.HitGroupAt(ent, pos)
	local set = ent:GetHitboxSet()
	local best, bestDist = HITGROUP_GENERIC, math.huge
	for i = 0, (ent:GetHitBoxCount(set) or 0) - 1 do
		local bone = ent:GetHitBoxBone(i, set)
		local mins, maxs = ent:GetHitBoxBounds(i, set)
		local m = bone and ent:GetBoneMatrix(bone)
		if m and mins then
			local center = LocalToWorld((mins + maxs) * 0.5, angle_zero, m:GetTranslation(), m:GetAngles())
			local dist = center:DistToSqr(pos)
			if dist < bestDist then best, bestDist = ent:GetHitBoxHitGroup(i, set), dist end
		end
	end
	return best
end

-- Пробитие пули (как у типового патрона EFT): по калибру ствола атакующего, иначе по виду ствола;
-- из техники (пули Гредвича) — penVehicle
function PR_Body.PenOf(dmginfo)
	local A = B.armor
	local att = dmginfo:GetAttacker()
	if not IsValid(att) or (att:IsPlayer() and att:InVehicle()) or not (att:IsPlayer() or att:IsNPC()) then return A.penVehicle end
	local wep = att:GetActiveWeapon()
	if not IsValid(wep) then return A.penDefault end
	local s = string.lower(tostring(wep.Trivia_Calibre or "") .. " " .. tostring(wep.Primary and wep.Primary.Ammo or ""))
	for _, r in ipairs(A.pen) do
		if string.find(s, r[1], 1, true) then return r[2] end
	end
	local info = PR_NPCW and PR_NPCW.List and PR_NPCW.List[wep:GetClass()]
	return info and A.penKind[info.kind] or A.penDefault
end

-- Пуля в кусок брони (piece = {cls, dur, max}): урон после брони и пробила ли (формулы — config/body.lua)
function PR_Body.ArmorHit(piece, dmg, pen)
	if piece.dur <= 0 then return dmg, true end
	local A = B.armor
	local pct = piece.dur / piece.max * 100
	local eff = (121 - 5000 / (45 + 2 * pct)) * piece.cls * 0.1
	local chance = 0
	if pen >= eff then
		chance = math.Clamp((100 + pen / (0.9 * eff - pen)) / 100, 0.9, 1)
	elseif pen > eff - 15 then
		chance = 0.4 * (eff - pen - 15) ^ 2 / 100
	end
	piece.dur = math.max(0, piece.dur - pen * A.durLoss)
	if math.random() < chance then return dmg * math.Clamp(pen / (eff + 12), 0.6, 1), true end
	return dmg * A.blunt * math.Clamp(1 - 0.03 * (eff - pen), 0.2, 1), false
end

-- Кусок брони бойца на пути пули в часть (шлем, забрало, грудь, живот) или nil
local function ArmorFor(body, part)
	local a, cover = body.armor, B.armor.cover
	if not a then return nil end
	if part == "Head" then
		local r = math.random()
		local c = a.head and a.head.cover or cover.head
		if a.head and r < c then return a.head end
		if a.face and r >= c then return a.face end
	elseif part == "Thorax" then
		if a.chest and math.random() < cover.chest then return a.chest end
	elseif part == "Stomach" then
		if a.belly and math.random() < cover.belly then return a.belly end
	end
end

----------------------------------------------------------------------------------------------------
-- Бойцы патрулей
----------------------------------------------------------------------------------------------------

-- Таблица бота EFT по модели (config/body.lua: bots) или nil
local function BotTable(npc)
	local mdl = string.lower(npc:GetModel() or "")
	for _, row in ipairs(B.bots) do
		if string.find(mdl, row[1], 1, true) then
			local hp = row[2]
			if istable(hp[1]) then hp = hp[math.random(#hp)] end
			return row, hp
		end
	end
end

-- Тело бойца: по модели — таблица бота EFT; иначе как у ЧВК, а здоровье патруля больше 440 — части ЧВК
-- пропорционально
local function NewBody(npc)
	local body = {hp = {}, max = {}, bleed = {}, bleedNext = {}, frac = {}, stock = {}}
	local row, t = BotTable(npc)
	if row then
		local v = {Head = t[1], Thorax = t[2], Stomach = t[3], LeftArm = t[4], RightArm = t[4], LeftLeg = t[5], RightLeg = t[5]}
		for _, p in ipairs(PARTS) do body.max[p] = v[p] end
		body.kind, body.pk, body.heal, body.enemyDist, body.stockKind = row[1], row.pk == true, row.heal, row.enemyDist, row.stock
	else
		local total = math.max(npc:GetMaxHealth(), 1)
		local k = total > B.botStandard and total / B.botStandard or 1
		for _, p in ipairs(PARTS) do body.max[p] = B.parts[p] * k end
		body.kind = "pmc"
	end
	for _, p in ipairs(PARTS) do body.hp[p] = body.max[p] end
	for kind, n in pairs(B.stocks[body.stockKind or "follower"] or B.stocks.follower) do body.stock[kind] = n end
	-- Броня: шлем и забрало — с шансом headP, тело — с шансом bodyP; прочность при появлении — как в SPT
	-- (минус 0–10, у диких 0–50, не ниже 15%)
	local ar = row and row.armor
	if ar then
		local a = {}
		local scav = body.stockKind == "scav"
		local function piece(t)
			local max = t[2]
			local dur = math.max(max * 0.15, max - math.random(0, scav and 50 or 10))
			return {cls = t[1], max = max, dur = dur, cover = t.cover}
		end
		if math.random() < (ar.headP or 1) then
			if ar.head then a.head = piece(ar.head) end
			if ar.face then a.face = piece(ar.face) end
		end
		if math.random() < (ar.bodyP or 1) then
			if ar.chest then a.chest = piece(ar.chest) end
			if ar.belly then a.belly = piece(ar.belly) end
		end
		if next(a) then body.armor = a end
	end
	npc.PR_Body = body
	local sum = math.ceil(PR_Body.Sum(body.max))
	npc:SetMaxHealth(sum)
	npc:SetHealth(sum)
	return body
end

function PR_Body.Of(npc)
	if not IsValid(npc) then return nil end
	return npc.PR_Body or NewBody(npc)
end

-- Из ENT:Init бойца: модель и здоровье ставит патруль сразу после Spawn — тело собираем на следующем тике
function PR_Body.InitNPC(npc)
	timer.Simple(0, function()
		if IsValid(npc) and not npc.PR_Body and npc:Health() > 0 then NewBody(npc) end
	end)
end

function PR_Body.SetHealthFromBody(npc)
	local body = npc.PR_Body
	if body then npc:SetHealth(math.max(1, math.ceil(PR_Body.Sum(body.hp)))) end
end

-- Лечение HP (аптечка): по недостающему у нечёрных частей. Возвращает, сколько вылечено
function PR_Body.HealParts(body, amount)
	local miss, total = {}, 0
	for _, p in ipairs(PARTS) do
		miss[p] = body.hp[p] > 0 and math.max(0, body.max[p] - body.hp[p]) or 0
		total = total + miss[p]
	end
	if total <= 0 or amount <= 0 then return 0 end
	local k = math.min(1, amount / total)
	for _, p in ipairs(PARTS) do body.hp[p] = body.hp[p] + miss[p] * k end
	return total * k
end

-- Лечение со стороны (роль «Ебителя»): HP через части тела
function PR_Body.Heal(npc, amount)
	local body = PR_Body.Of(npc)
	if not body then return end
	PR_Body.HealParts(body, amount)
	PR_Body.SetHealthFromBody(npc)
end

-- Здоровье бойца поменяли мимо тела (тест, скрипт): тело подгоняем — меньше — все части пропорционально,
-- больше — как аптечкой
local function Sync(npc, body)
	local sum, h = PR_Body.Sum(body.hp), npc:Health()
	if math.abs(h - math.ceil(sum)) < 1 then return end
	if h < sum then
		local k = math.max(h, 0) / math.max(sum, 1)
		for _, p in ipairs(PARTS) do body.hp[p] = body.hp[p] * k end
	else
		PR_Body.HealParts(body, h - sum)
	end
end

-- Кровотечение на часть бойца (тяжёлое не меняется на лёгкое); первый тик — через период
function PR_Body.AddBleed(body, part, kind)
	if body.bleed[part] == "heavy" or body.bleed[part] == kind then return end
	body.bleed[part] = kind
	body.bleedNext[part] = CurTime() + B.bleed[kind].period
end

-- ArcCW множит урон пули по зоне (у UC/UR: голова ×3,5, рука ×0,85, нога ×0,5) и «гасит» множители
-- sandbox (голова ×0,5, конечности ×4). В Таркове множителей по зонам нет — только HP частей: снимаем оба
-- (иначе при отключённом sandbox рука получала ×3,4, нога ×2, голова ×1,75)
function PR_Body.UndoArcCW(dmginfo, hitgroup)
	local att = dmginfo:GetAttacker()
	local wep = IsValid(att) and att.GetActiveWeapon and att:GetActiveWeapon()
	if not (IsValid(wep) and wep.ArcCW and ArcCW) then return end
	local t = wep.GetBuff_Override and wep:GetBuff_Override("Override_BodyDamageMults", wep.BodyDamageMults) or wep.BodyDamageMults
	if not (t and t[hitgroup]) then return end
	local mul = t[hitgroup]
	local cancel = ArcCW.ConVars and ArcCW.ConVars["bodydamagemult_cancel"]
	local gam = ArcCW.LimbCompensation and (ArcCW.LimbCompensation[engine.ActiveGamemode()] or ArcCW.LimbCompensation[1])
	if cancel and cancel:GetBool() and gam and gam[hitgroup] then mul = mul * gam[hitgroup] end
	if mul > 0 then dmginfo:ScaleDamage(1 / mul) end
end

-- Часть тела пули по бойцу — из ScaleNPCDamage (точный хитбокс). Множители sandbox (голова ×2,
-- конечности и GEAR ×0,25) и ArcCW не нужны: урон по части считает ядро
hook.Add("ScaleNPCDamage", "PR_Body", function(npc, hitgroup, dmginfo)
	if IsValid(npc) and npc:GetClass() == "npc_pr_soldier" then
		npc.PR_HitGroup, npc.PR_HitTick = hitgroup, engine.TickCount()
		PR_Body.UndoArcCW(dmginfo, hitgroup)
		return true
	end
end)

local function IsBullet(dmginfo)
	return dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER)
end

-- Из ENT:OnDamaged (PreDamage): урон по частям; VJ вычтет ровно потерю HP, при смерти — всё здоровье
function PR_Body.OnNPCDamaged(npc, dmginfo)
	if npc.PR_BodyKill then return end
	local d = dmginfo:GetDamage()
	if d <= 0 then return end
	local body = PR_Body.Of(npc)
	Sync(npc, body)
	local hp = body.hp
	local bullet = IsBullet(dmginfo)
	local part
	if bullet or dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) then
		local hg = npc.PR_HitTick == engine.TickCount() and npc.PR_HitGroup or nil
		if not hg then
			-- Удар прикладом ArcCW приходит без точки попадания (0, 0, 0) — в грудь, а не в «ближайший к
			-- началу карты» хитбокс
			local pos = dmginfo:GetDamagePosition()
			if pos:IsZero() or pos:Distance(npc:WorldSpaceCenter()) > 100 then
				hg = HITGROUP_CHEST
			else
				local ok, g = pcall(PR_Body.HitGroupAt, npc, pos)
				hg = ok and g or nil
			end
		end
		part = hg and PR_Body.Group[hg]
	end
	local dead = false
	if part then
		-- Броня (пуля): не пробила — блант, без раны
		local pen = true
		local piece = bullet and ArmorFor(body, part)
		if piece then
			d, pen = PR_Body.ArmorHit(piece, d, PR_Body.PenOf(dmginfo))
			body.armorHits = (body.armorHits or 0) + 1
		end
		dead = PR_Body.Apply(hp, part, d)
		-- Рана — от пули по части, в том числе той, что этим ушла в ноль или уже чёрная
		if not dead and bullet and pen then
			local bleed, frac = PR_Body.Roll(part, d, body.max[part])
			if bleed then PR_Body.AddBleed(body, part, bleed) end
			if frac then body.frac[part] = true end
		end
		body.lastPart = part
	else
		local fall, blast = dmginfo:IsFallDamage(), dmginfo:IsExplosionDamage()
		for _, x in ipairs(PR_Body.Spread(dmginfo)) do
			if PR_Body.Apply(hp, x[1], x[2]) then dead = true end
			if not dead and blast then
				local bleed = PR_Body.Roll(x[1], x[2], body.max[x[1]])
				if bleed then PR_Body.AddBleed(body, x[1], bleed) end
			elseif not dead and fall and PR_Body.RollFall(x[2], body.max[x[1]]) then
				body.frac[x[1]] = true
			end
		end
	end
	local att = dmginfo:GetAttacker()
	if IsValid(att) and att ~= npc and not att:IsWorld() then body.attacker = att end
	local left = dead and 0 or math.max(1, math.ceil(PR_Body.Sum(hp)))
	body.target = left
	local h = npc:Health()
	dmginfo:SetDamage(dead and math.max(h, 1) or math.max(h - left, 0.01))
end

-- Из ENT:OnDamaged (PostDamage): VJ вычел дробное — здоровье ровно по телу
function PR_Body.PostNPCDamaged(npc)
	local body = npc.PR_Body
	if body and body.target and body.target > 0 and npc:Health() > 0 then npc:SetHealth(body.target) end
end

-- Смерть от кровотечения: засчитывается тому, кто ранил
local function Kill(npc, body)
	local d = DamageInfo()
	local att = IsValid(body.attacker) and body.attacker or game.GetWorld()
	d:SetDamage(math.max(npc:Health(), 1) + 1)
	d:SetDamageType(DMG_GENERIC)
	d:SetAttacker(att)
	d:SetInflictor(att)
	d:SetDamagePosition(npc:WorldSpaceCenter())
	npc.PR_BodyKill = true
	npc:TakeDamageInfo(d)
	if IsValid(npc) then npc.PR_BodyKill = nil end
end

-- Кровотечения бойцов: каждое — свой тик раз в период, со всех живых частей
timer.Create("PR_BodyBleed", 0.5, 0, function()
	local now = CurTime()
	for _, npc in ipairs(PR_Inf and PR_Inf.Soldiers or {}) do
		local body = IsValid(npc) and npc.PR_Body
		if body and next(body.bleed) and npc:Health() > 0 and not npc.Dead then
			Sync(npc, body)
			local dead, ticked = false, false
			for part, kind in pairs(body.bleed) do
				local cfg = B.bleed[kind]
				if not dead and now >= (body.bleedNext[part] or 0) then
					body.bleedNext[part] = now + cfg.period
					dead = PR_Body.BleedTick(body.hp, cfg.tick)
					ticked = true
				end
			end
			if dead then Kill(npc, body) elseif ticked then PR_Body.SetHealthFromBody(npc) end
		end
	end
end)

-- Боль: перелом или чёрная часть, без постоянного обезбола
local function InPain(body)
	if body.pk then return false end
	if next(body.frac) then return true end
	for _, p in ipairs(PARTS) do
		if body.hp[p] <= 0 then return true end
	end
	return false
end

-- Насколько цел боец по жизненно важному: меньшая доля головы и груди (0–1). Отход и смена главного —
-- по ней, а не по сумме частей (у Решалы грудь — 19% тела: убит при «80% здоровья»)
function PR_Body.Vital(npc)
	local body = IsValid(npc) and npc.PR_Body
	if not body then return IsValid(npc) and npc:Health() / math.max(npc:GetMaxHealth(), 1) or 0 end
	return math.min(body.hp.Thorax / body.max.Thorax, body.hp.Head / body.max.Head)
end

-- Нога чёрная или сломана — не бегает (с постоянным обезболом — бегает, как боссы EFT)
function PR_Body.CanRun(npc)
	local body = npc.PR_Body
	if not body or body.pk then return true end
	for _, p in ipairs({"LeftLeg", "RightLeg"}) do
		if body.hp[p] <= 0 or body.frac[p] then return false end
	end
	return true
end

-- Разброс от ранений: чёрная или сломанная рука, боль
function PR_Body.AimMul(npc)
	local body = npc.PR_Body
	if not body then return 1 end
	local m = 1
	for _, p in ipairs({"LeftArm", "RightArm"}) do
		if body.hp[p] <= 0 then m = m * B.armBlack elseif body.frac[p] then m = m * B.armFracture end
	end
	if InPain(body) then m = m * B.pain end
	return m
end

-- Что лечить первым: тяжёлое кровотечение, лёгкое, перелом, чёрная часть (хирургия — только в укрытии
-- и когда враг давно потерян или далеко: 12–16 с, игрок пробегает 30 м за 6), потом аптечка (часть ниже
-- доли heal от максимума). calm — враг давно потерян или далеко
local function NextNeed(body, calm)
	local stock, T = body.stock, B.treat
	for _, kind in ipairs({"heavy", "light"}) do
		if (stock[kind] or 0) > 0 then
			for _, p in ipairs(PARTS) do
				if body.bleed[p] == kind then return kind, p end
			end
		end
	end
	if (stock.fracture or 0) > 0 then
		for _, p in ipairs(PARTS) do
			if body.frac[p] then return "fracture", p end
		end
	end
	if calm and (stock.surgery or 0) > 0 then
		for _, p in ipairs(PARTS) do
			if body.hp[p] <= 0 and not B.vital[p] then return "surgery", p end
		end
	end
	if (stock.medHP or 0) >= 1 then
		for _, p in ipairs(PARTS) do
			if body.hp[p] > 0 and body.hp[p] < body.max[p] * (body.heal or T.heal) then return "medkit" end
		end
	end
end

-- Не время лечиться: идёт по маршруту, на колене с гранатомётом, отходит по приказу и не дошёл, ждёт
-- взрыва своей гранаты, пятится рывком, марксман меняет позицию
local function NotNow(npc, b, now)
	if b.route or b.kneelUntil or b.waitBlast then return true end
	if b.backoffUntil and now < b.backoffUntil then return true end
	local o = b.order
	if o and o.kind == "retreat" and not o.arrived and o.pos and npc:GetPos():Distance(o.pos) > 200 then return true end
	return b.rs ~= nil and b.rs.want ~= nil
end

-- Присевший не виден с метки: трасса от него (+32) до метки (+40) упирается в твёрдое (не стекло, не
-- сетку, не листву, не лёгкий проп)
local function HiddenFrom(npc, pos)
	local tr = util.TraceLine({start = npc:GetPos() + Vector(0, 0, 32), endpos = pos + Vector(0, 0, 40), mask = PR_Inf.U.LOS, filter = npc})
	if not tr.Hit then return false end
	local m = tr.MatType
	if m == MAT_GLASS or m == MAT_GRATE or m == MAT_FOLIAGE then return false end
	if IsValid(tr.Entity) and not tr.Entity:IsWorld() then
		local phys = tr.Entity:GetPhysicsObject()
		if not IsValid(phys) or phys:GetMass() < 100 then return false end
	end
	return true
end

-- Бросил лечение (увидел врага, попали): убрать аптечку — пауза огня, прицел заново (не «держал угол»)
local function Drop(npc, b, now)
	b.treat, npc.PR_Crouch = nil, false
	b.holdFireUntil = now + PR_Inf.U.Rand(B.treat.dropHold)
	b.aimT = math.min(b.aimT or 0, 0)
	b.aimSurprise = true
end

local function Finish(npc, b, body, tr)
	local T = B.treat
	b.treat, npc.PR_Crouch = nil, false
	if tr.kind ~= "medkit" then body.stock[tr.kind] = math.max(0, (body.stock[tr.kind] or 1) - 1) end
	if tr.kind == "heavy" or tr.kind == "light" then
		body.bleed[tr.part], body.bleedNext[tr.part] = nil, nil
	elseif tr.kind == "fracture" then
		body.frac[tr.part] = nil
	elseif tr.kind == "surgery" then
		body.hp[tr.part] = math.max(body.hp[tr.part], T.surgery.hp)
	elseif tr.kind == "medkit" then
		-- Худшая (по доле) живая часть — до perUse HP из ресурса аптечки
		local worst, wk
		for _, p in ipairs(PARTS) do
			local k = body.hp[p] / body.max[p]
			if body.hp[p] > 0 and k < 1 and (not wk or k < wk) then worst, wk = p, k end
		end
		if worst then
			local add = math.min(body.max[worst] - body.hp[worst], T.medkit.perUse, body.stock.medHP or 0)
			body.hp[worst] = body.hp[worst] + add
			body.stock.medHP = math.max(0, (body.stock.medHP or 0) - add)
		end
	end
	PR_Body.SetHealthFromBody(npc)
	body.treated = (body.treated or 0) + 1
end

-- Лечение бойца (из решения слоя пехоты раз в 0,2 с, до роли). Когда безопасно: виден с метки — сначала
-- в укрытие (FindPosition, прячась от метки), потом присел лицом к ней и лечит; звук аптечки слышен
-- вокруг. Бросает, если увидел врага, попали, плотный огонь или метка врага обновилась ближе 30 м.
-- true — занят лечением (роль и решение в этот раз не нужны)
function PR_Body.Treat(npc, b, now)
	local body = npc.PR_Body
	if not body then return false end
	local T, U = B.treat, PR_Inf.U
	local seen = U.BestVisible(npc, b)
	local c = U.BestContact(b)
	local me = npc:GetPos()
	local tr = b.treat
	if tr then
		local near = c and (c.t or 0) > tr.start and c.pos:Distance(me) < (body.enemyDist or T.enemyDist)
		if seen or (b.hitAt or -100) > tr.start or (b.supp or 0) > T.dropSupp or near then
			Drop(npc, b, now)
			return false
		end
		if tr.phase == "move" then
			-- Дошёл (или застрял) до укрытия — лечит там; не дошёл за отведённое — бросил
			if b.route and now < tr.moveUntil then return true end
			if b.route then b.route = nil npc:PR_Stop() end
			tr.phase, tr.done = "work", now + U.Rand(T[tr.kind].time)
			npc:EmitSound(T.sound, T.soundLevel)
		elseif b.route then
			-- Маршрут поставил кто-то ещё (засада отряда) — лечение бросил
			b.treat, npc.PR_Crouch = nil, false
			return false
		end
		npc.PR_Crouch = true
		if now < tr.done then return true end
		Finish(npc, b, body, tr)
		return false
	end
	if seen or now < (b.treatTryAt or 0) or NotNow(npc, b, now) or now - (b.hitAt or -100) < T.safeHit or (b.supp or 0) > T.safeSupp then return false end
	-- Лечить нечего — без трасс (раз в 0,2 с у каждого целого бойца)
	if not NextNeed(body, true) then return false end
	-- Свежая метка врага ближе 30 м (у Санитара и Knight — 130) — не лечится
	if c and c.seenAt and now - c.seenAt < T.safeSeen then return false end
	local age = c and now - (c.t or 0) or math.huge
	local dist = c and c.pos:Distance(me) or math.huge
	if c and age < T.contactAge and dist < (body.enemyDist or T.enemyDist) then return false end
	local hidden = not c or HiddenFrom(npc, c.pos)
	local kind, part = NextNeed(body, hidden and (age > T.surgery.safeAge or dist > T.surgery.enemyDist))
	if not kind then return false end
	local phase = "work"
	if not hidden then
		local away = Vector(me.x - c.pos.x, me.y - c.pos.y, 0):GetNormalized()
		local p = PR_Inf.FindPosition and PR_Inf.FindPosition(npc, c.pos, {dist = {math.max(300, dist - 300), dist + 200, dist + 1500},
			sectorDir = away, sectorHalf = 90, wantHidden = true, maxTravel = PR_Body.CanRun(npc) and T.coverTravel or T.coverTravelLimp})
		if p then
			PR_Inf.Goto(npc, p, PR_Body.CanRun(npc) and "run" or "walk", c.pos)
			phase = "move"
		elseif not ((kind == "heavy" or kind == "light") and age > T.contactAge) then
			-- Укрытия нет — на виду только перевязка и только по старой метке; искать снова через 3 с
			b.treatTryAt = now + 3
			return false
		end
	end
	if phase == "work" and npc:IsMoving() then npc:PR_Stop() end
	b.bounding, b.kneelUntil = false, nil
	b.treat = {kind = kind, part = part, start = now, phase = phase, moveUntil = now + T.coverTime,
		done = now + U.Rand(T[kind].time)}
	if phase == "work" then npc:EmitSound(T.sound, T.soundLevel) end
	npc.PR_Crouch = phase == "work"
	if c then npc.PR_Face = c.pos end
	return true
end

-- Сводка тела для отладки и записи боя: «H35 T85 S70 LA60 RA60 LL65 RL65»; «!» — лёгкое кровотечение,
-- «!!» — тяжёлое, «x» — перелом
local SHORT = {Head = "H", Thorax = "T", Stomach = "S", LeftArm = "LA", RightArm = "RA", LeftLeg = "LL", RightLeg = "RL"}
function PR_Body.DescribeParts(hp, bleed, frac)
	local out = {}
	for _, p in ipairs(PARTS) do
		local s = SHORT[p] .. math.ceil(hp[p] or 0)
		if bleed[p] then s = s .. (bleed[p] == "heavy" and "!!" or "!") end
		if frac[p] then s = s .. "x" end
		out[#out + 1] = s
	end
	return table.concat(out, " ")
end

function PR_Body.Describe(npc)
	local body = npc.PR_Body
	if not body then return "" end
	local b = npc.PR_Brain
	local armor = ""
	for _, k in ipairs({"head", "face", "chest", "belly"}) do
		local a = body.armor and body.armor[k]
		if a then armor = armor .. " " .. k:sub(1, 1) .. a.cls .. "/" .. math.ceil(a.dur) end
	end
	return PR_Body.DescribeParts(body.hp, body.bleed, body.frac) .. armor .. (b and b.treat and (" treat:" .. b.treat.kind) or "")
end

-- То же для игрока (VIVO)
function PR_Body.DescribePlayer(ply)
	local t = ply.OJSHPTable
	if not t then return "" end
	local hp, bleed, frac = {}, {}, {}
	for _, p in ipairs(PARTS) do
		local part = t[p] or {}
		local st = part.StatusEffects or {}
		hp[p] = part.HP or 0
		if st.Bleed then bleed[p] = ply.PR_Bleed and ply.PR_Bleed[p] or "light" end
		if st.Fractured then frac[p] = true end
	end
	return PR_Body.DescribeParts(hp, bleed, frac)
end
