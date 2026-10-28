-- Хромота игрока как в EFT (VIVO, docs/body.md): нога чёрная или сломана, без обезбола — скорость
-- × PR_VIVO_LEG_SPEED от ходьбы и без бега (EFT: −45%; у VIVO было × 0,9); с обезболом бег можно (VIVO
-- снимает за бег HP ноги). Хук VIVO общий для клиента и сервера — подменяем его же именем на обоих,
-- иначе клиент предсказывал ×0,9, а сервер резал до ×0,55 (откаты позиции)
PR_VIVO_LEG_SPEED = 0.55

local function TarkovLimp()
	local hooks = hook.GetTable().SetupMove
	if not (hooks and hooks.danguOJSMoveSetup2) or hooks.danguOJSMoveSetup2 == PR_VivoLimp then return end
	PR_VivoLimp = function(ply, mv)
		if GetConVarNumber("vivo_enable") == 0 or not OJSWounds then return end
		local t = ply.OJSHPTable
		if not t or OJSWounds:HasStatus(ply, "Head", "Painkillers") then return end
		for _, p in ipairs({"LeftLeg", "RightLeg"}) do
			local leg = t[p]
			if leg and (leg.HP <= 0 or leg.StatusEffects.Fractured) then
				mv:SetMaxClientSpeed(ply:GetWalkSpeed() * PR_VIVO_LEG_SPEED)
				return
			end
		end
	end
	hook.Add("SetupMove", "danguOJSMoveSetup2", PR_VivoLimp)
end

hook.Add("Initialize", "PR_VivoLimp", TarkovLimp)
TarkovLimp()
