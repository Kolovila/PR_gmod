-- Совместимость с VIVO Health Overhaul (Workshop 2531451625): урон по игроку у него — раны по частям
-- тела. Пулевой урон VIVO берёт только в ScalePlayerDamage (там известна часть тела), а в
-- EntityTakeDamage пулевой урон просто отменяет. Пули Гредвича (пулемёты Ми-24, OH-6, спаренные
-- пулемёты танков) бьют напрямую через TakeDamageInfo, мимо ScalePlayerDamage, — VIVO их отменял,
-- и очереди техники игроков не ранили. Такие попадания отдаём VIVO сами: часть тела — по хитбоксу,
-- ближайшему к месту попадания. Броня, кровотечение, переломы — всё как у обычной пули

-- Группа хитбокса игрока (голова, грудь, рука...), ближайшего к точке
local function HitGroupAt(ply, pos)
	local set = ply:GetHitboxSet()
	local best, bestDist = HITGROUP_GENERIC, math.huge
	for i = 0, (ply:GetHitBoxCount(set) or 0) - 1 do
		local bone = ply:GetHitBoxBone(i, set)
		local mins, maxs = ply:GetHitBoxBounds(i, set)
		local m = bone and ply:GetBoneMatrix(bone)
		if m and mins then
			local center = LocalToWorld((mins + maxs) * 0.5, angle_zero, m:GetTranslation(), m:GetAngles())
			local dist = center:DistToSqr(pos)
			if dist < bestDist then best, bestDist = ply:GetHitBoxHitGroup(i, set), dist end
		end
	end
	return best
end

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
			local ok, group = pcall(HitGroupAt, ply, dmginfo:GetDamagePosition())
			danguOJSInjuredMain(ply, ok and group or HITGROUP_GENERIC, dmginfo)
		end
		return vivo(ply, dmginfo)
	end
	hook.Add("EntityTakeDamage", "danguOJSinjured", PR_VivoWrapper)
end

-- Аддоны грузятся до Initialize; второй вызов — на случай перезагрузки Lua режима
hook.Add("Initialize", "PR_VivoGredBullets", WrapVivo)
WrapVivo()
