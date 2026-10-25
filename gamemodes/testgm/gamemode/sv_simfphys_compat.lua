-- Ошибка simfphys (Workshop 771487490): машина с водителем, подбитая пулями/взрывами Гредвича или
-- ракетой, иногда не взрывалась и становилась неубиваемой — горела, а урон больше не проходил.
-- ExplodeVehicle сначала ставит флаг destroyed, потом наносит водителю смертельный урон «от
-- последнего, кто бил»: SetInflictor(self.LastInflictor or мир). У взрывов Гредвича «чем били» —
-- пустая сущность (NULL), а ракета к этому времени уже удалена; NULL в Lua — не nil, «or мир» не
-- срабатывает, и SetInflictor(NULL) падает с ошибкой. Взрыв обрывается, флаг остаётся, и каждый
-- следующий вызов ExplodeVehicle сразу выходит. Перед взрывом убираем мёртвые ссылки — сработает «мир»

local function WrapExplode()
	local stored = scripted_ents.GetStored("gmod_sent_vehicle_fphysics_base")
	local ENT = stored and stored.t
	if not ENT or not isfunction(ENT.ExplodeVehicle) or ENT.PR_SafeExplode then return end

	local original = ENT.ExplodeVehicle
	ENT.ExplodeVehicle = function(self, ...)
		if not IsValid(self.LastAttacker) then self.LastAttacker = nil end
		if not IsValid(self.LastInflictor) then self.LastInflictor = nil end
		return original(self, ...)
	end
	ENT.PR_SafeExplode = true
end

-- Аддоны грузятся до Initialize; второй вызов — на случай перезагрузки Lua режима
hook.Add("Initialize", "PR_SimfphysSafeExplode", WrapExplode)
WrapExplode()
