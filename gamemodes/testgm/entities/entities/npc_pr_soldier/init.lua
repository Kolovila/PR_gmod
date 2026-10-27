AddCSLuaFile("shared.lua")
include("shared.lua")

-- Боец патруля: VJ-человек на плеермодели (VJ 3.2 сам берёт набор анимаций игрока).
-- Что видеть, куда идти и когда стрелять, решает слой пехоты (gamemode/sv_infantry.lua,
-- docs/infantry.md); VJ оставлены прицел, выстрел, перезарядка, анимации и голос.
-- Своё боевое поведение VJ выключено: сам врагов не ищет и не сбрасывает (иначе знает точную
-- позицию врага сквозь стены), не стрейфит, не отходит, не бегает в укрытия, не зовёт союзников
-- (это передавало им врага — телепатия), не реагирует на звуки и опасности.

ENT.Model = {"models/player/eft/bosses/reshala.mdl"} -- запасная; патруль ставит модель до Spawn
ENT.StartHealth = 100
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.UsePoseParameterMovement = true
ENT.VJ_NPC_Class = {"CLASS_PR_BANDITS"}
ENT.AlliedWithPlayerAllies = false
ENT.BecomeEnemyToPlayer = false

ENT.EnemyDetection = false
ENT.EnemyTimeout = 1e6
ENT.SightDistance = 9000
ENT.SightAngle = 160
ENT.TurningSpeed = 20

ENT.DisableWandering = true
ENT.DisableChasingEnemy = true
ENT.CanInvestigate = false
ENT.CanDetectDangers = false
ENT.CanRedirectGrenades = false
ENT.CallForHelp = false
ENT.CanReceiveOrders = false
ENT.DamageResponse = false
ENT.DamageAllyResponse = false
ENT.CombatDamageResponse = false
ENT.DeathAllyResponse = false
ENT.FollowPlayer = false
ENT.YieldToAlliedPlayers = false
ENT.HasMeleeAttack = false
ENT.HasGrenadeAttack = false
ENT.HasOnPlayerSight = false
ENT.Weapon_Strafe = false
ENT.Weapon_RetreatDistance = 0
ENT.Weapon_MaxDistance = 9000 -- до тумана; роль задаёт свою (sv_infantry_roles.lua)
ENT.Weapon_OcclusionDelay = false
ENT.Weapon_FindCoverOnReload = false
ENT.Weapon_CanCrouchAttack = false

ENT.CanFlinch = true
ENT.FlinchCooldown = 1
ENT.AnimTbl_Flinch = {"vjges_flinch_01", "vjges_flinch_02"}
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"vjseq_death_02", "vjseq_death_03", "vjseq_death_04"}
ENT.DeathAnimationChance = 3
ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.5
ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav", "npc/footsteps/hardboot_generic2.wav", "npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav", "npc/footsteps/hardboot_generic5.wav", "npc/footsteps/hardboot_generic6.wav"}

-- Слух — только наш (движковые COND_HEAR_* запускали бы реакцию VJ на опасность)
function ENT:GetSoundInterests() return 0 end
function ENT:OnDangerDetected() return true end

function ENT:Init()
	if PR_Inf then PR_Inf.Register(self) end
end

----------------------------------------------------------------------------------------------------
-- Движение по приказу слоя: gait "run" | "walk" | "crouch". На ходу стреляет по видимому врагу
-- (VJ сам ставит анимацию с оружием наизготовку и жмёт огонь), face — смотреть в точку, а не на врага
----------------------------------------------------------------------------------------------------
function ENT:PR_Move(pos, gait, face)
	self:SetLastPosition(pos)
	local s = vj_ai_schedule.New("PR_MOVE")
	s:EngTask("TASK_GET_PATH_TO_LASTPOSITION", 0)
	-- Вприсядку — тоже ходьба: TranslateActivity ниже подменяет её на ходьбу вприсядку
	s:EngTask(gait == "run" and "TASK_RUN_PATH" or "TASK_WALK_PATH", 0)
	s:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
	s.CanShootWhenMoving = true
	if not face then s.TurnData = {Type = VJ.FACE_ENEMY_VISIBLE} end
	self.PR_Gait = gait
	self:StartSchedule(s)
	if face and self.CanTurnWhileMoving then
		-- Точку ставим сами: VJ 3.2 переводит точку из TurnData расписания в угол, а потом
		-- вычитает из этого угла позицию (ошибка schedules.lua:236 каждый кадр, поворот ломается)
		local td = self.TurnData
		td.Type, td.Target, td.StopOnFace, td.IsSchedule, td.LastYaw = VJ.FACE_POSITION, face, false, true, 1
	end
	self.PR_Gait = gait
	self.PR_MoveGoal = pos
	self.PR_MoveAt = CurTime()
end

function ENT:PR_Stop()
	self:StopMoving()
	self.PR_Gait = nil
	self.PR_MoveGoal = nil
end

-- Ходьба при походке «вприсядку» — ходьба вприсядку (с оружием наизготовку, если враг на виду)
local CROUCH_FROM = {[ACT_WALK] = true, [ACT_WALK_AIM] = true, [ACT_RUN] = true, [ACT_RUN_AIM] = true}
function ENT:TranslateActivity(act)
	if self.PR_Gait == "crouch" and CROUCH_FROM[act] then
		act = (self.EnemyData and self.EnemyData.Visible) and ACT_WALK_CROUCH_AIM or ACT_WALK_CROUCH
	end
	return self.BaseClass.TranslateActivity(self, act)
end

function ENT:OnThinkActive()
	-- Вприсядку VJ огонь на ходу сам не включает
	if self.PR_Gait == "crouch" and self:IsMoving() and self.EnemyData.Visible and self:CanFireWeapon(true, false) then
		self.WeaponAttackState = VJ.WEP_ATTACK_STATE_FIRE
	end
	-- Врага выбирает только слой пехоты. Движковый ИИ сам берёт врага по своему зрению (сквозь
	-- пропы, за спиной после разворота) — такой выбор отменяем
	local ene = self:GetEnemy()
	if IsValid(ene) and ene ~= self.PR_Enemy then
		self.PR_EngineEnemyCount = (self.PR_EngineEnemyCount or 0) + 1
		self:SetEnemy(IsValid(self.PR_Enemy) and self.PR_Enemy or NULL)
	end
	if PR_Inf then PR_Inf.Think(self) end
end

-- Выдать врага от слоя (честно замечен)
function ENT:PR_SetEnemy(ent)
	self.PR_Enemy = ent
	if self:GetEnemy() ~= ent then self:ForceSetEnemy(ent, false) end
end

----------------------------------------------------------------------------------------------------
-- Стоя: стрелять по видимому врагу, если слой разрешил (PR_Fire), присев — если PR_Crouch.
-- Иначе стоять и смотреть туда, куда велит слой (PR_Face)
----------------------------------------------------------------------------------------------------
function ENT:SelectSchedule()
	if self.Dead then return end
	local e = self:GetEnemy()
	if IsValid(e) and self.EnemyData.Visible and self.PR_Fire and self:CanFireWeapon(true, false) then
		local a = self:TranslateActivity(self.PR_Crouch and ACT_RANGE_ATTACK1_LOW or ACT_RANGE_ATTACK1)
		self:SetTurnTarget("Enemy")
		if not VJ.IsCurrentAnim(self, a) then self:PlayAnim(a, false, 0, true) end
		self.WeaponAttackAnim = a
		self.WeaponAttackState = VJ.WEP_ATTACK_STATE_FIRE_STAND
		return
	end
	if self.PR_Face then self:SetTurnTarget(self.PR_Face, 1) end
	if self.PR_Crouch then
		local idle = self:TranslateActivity(ACT_COVER_LOW)
		if not VJ.IsCurrentAnim(self, idle) then self:PlayAnim(idle, false, 0, false) end
		return
	end
	self:MaintainIdleBehavior(2)
end

-- Не видит врага — VJ кладёт сюда свою «последнюю видимую» точку; у нас — оценка слоя
function ENT:GetAimPosition(target, aimOrigin, predictionRate, projectileSpeed)
	if not self.EnemyData.Visible and self.PR_AimAt then return self.PR_AimAt end
	return self.BaseClass.GetAimPosition(self, target, aimOrigin, predictionRate, projectileSpeed)
end

-- Разброс: первый выстрел после паузы точный, очередь расползается, движение, присед,
-- подавление и сбитый попаданием прицел (числа — config/infantry.lua)
function ENT:GetAimSpread(target, goalPos, modifier)
	local base = self.BaseClass.GetAimSpread(self, target, goalPos, modifier)
	return base * (PR_Inf and PR_Inf.SpreadMul(self) or 1)
end

-- Сброс врага — без «отдать врага союзникам» и без похода к его точной позиции
function ENT:ResetEnemy(checkAllies, checkVis)
	self.PR_Enemy = nil
	self.LastHiddenZone_CanWander = false
	return self.BaseClass.ResetEnemy(self, false, false)
end

function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" and PR_Inf then PR_Inf.OnDamaged(self, dmginfo) end
end

-- Огонь запрещён ролью (тихоня без повода, гранатомётчик ждёт) или переносом огня / подавлением.
-- Здесь — для всех путей VJ, в том числе стрельбы на ходу
function ENT:OnWeaponCanFire()
	if self.PR_Fire == false then return false end
	if PR_Inf and PR_Inf.HoldFire(self) then return false end
end

-- Труп синим не становится: цвет плеермодели — клиенту через NW2 (cl: PR_SoldierCorpseColor)
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	corpse:SetNW2Vector("PR_Col", self:GetPlayerColor())
end
