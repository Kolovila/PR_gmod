AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/terrorist/taliban_bombermp.mdl"}
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_TERRORIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 80 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 120 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = 0.6 -- This counted in seconds | This calculates the time until it hits something
ENT.NextAnyAttackTime_Melee = 0.4 -- How much time until it can use any attack again? | Counted in Seconds
ENT.DisableDefaultMeleeAttackDamageCode = false -- Disables the default melee attack damage code
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.HasDeathCorpse = false
ENT.GibOnDeathFilter = false
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
ENT.AnimTbl_MeleeAttack = {"canal5bidle1"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.AnimTbl_IdleStand = {"idle_subtle"}
ENT.PushProps = false

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Alert = {"vj_sterror/suppress (1).wav","vj_sterror/suppress (2).wav","vj_sterror/suppress (3).wav"}
ENT.SoundTbl_Idle = {"vj_sterror/chat (1).wav","vj_sterror/chat (2).wav","vj_sterror/chat (3).wav","vj_sterror/chat (4).wav","vj_sterror/chat (5).wav","vj_sterror/chat (6).wav","vj_sterror/chat (7).wav","vj_sterror/chat (8).wav","vj_sterror/chat (9).wav","vj_sterror/chat (10).wav","vj_sterror/chat (11).wav","vj_sterror/chat (12).wav"}
ENT.SoundTbl_CombatIdle = {"vj_sterror/combat (1).wav","vj_sterror/combat (2).wav","vj_sterror/combat (3).wav","vj_sterror/combat (4).wav","vj_sterror/combat (5).wav","vj_sterror/combat (6).wav","vj_sterror/combat (7).wav","vj_sterror/suppress (1).wav","vj_sterror/suppress (2).wav","vj_sterror/suppress (3).wav"}
ENT.SoundTbl_Death = {"vj_sterror/died (1).wav","vj_sterror/died (2).wav","vj_sterror/died (3).wav","vj_sterror/died (4).wav","vj_sterror/died (5).wav","vj_sterror/died (6).wav","vj_sterror/died (7).wav","vj_sterror/died (8).wav","vj_sterror/died (9).wav"}
ENT.SoundTbl_Pain = {"vj_sterror/pain (1).wav","vj_sterror/pain (2).wav","vj_sterror/pain (3).wav","vj_sterror/pain (4).wav"}

function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 90), Vector(-13, -13, 0))
	self:CapabilitiesAdd(CAP_MOVE_CLIMB)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_CLIMB_UP or act == ACT_CLIMB_DOWN then
		return ACT_RUN_AIM_PISTOL
	elseif act == ACT_CLIMB_DISMOUNT then
		return ACT_LAND
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "PreDamage" then
		self:TakeDamage(self:GetMaxHealth(), self, self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	local myPos = self:GetPos()
	util.BlastDamage(self, self, myPos, 300, 150)
	util.ScreenShake(myPos, 100, 200, 1, 2500)

	local spawnPos = myPos + self:OBBCenter()
	
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(spawnPos)
		util.Effect("Explosion", effectData)
		effectData:SetColor(colorRed)
		effectData:SetScale(150)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
		
		ParticleEffect("vj_explosion2", spawnPos, self:GetAngles())
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=spawnPos + self:GetUp() * 50})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=spawnPos + self:GetUp() * 48})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=spawnPos + self:GetUp() * 46})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/heart.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/liver.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small1.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small2.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small3.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib1.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib2.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib3.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib4.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib5.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib6.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib7.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	return true
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/