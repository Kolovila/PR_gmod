AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/sentry/sentrycag/hecu/su/marine_02_sgg.mdl"
ENT.StartHealth = 90 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 30
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation
ENT.Medic_HealthAmount = 50

ENT.SoundTbl_Idle = {"vj_bms_hecu/idle1.wav", "vj_bms_hecu/idle2.wav", "vj_bms_hecu/idle3.wav", "vj_bms_hecu/idle4.wav", "vj_bms_hecu/idle5.wav", "vj_bms_hecu/idle6.wav", "vj_bms_hecu/idle7.wav", "vj_bms_hecu/idle8.wav", "vj_bms_hecu/idle9.wav", "vj_bms_hecu/idle10.wav", "vj_bms_hecu/idle11.wav", "vj_bms_hecu/idle12.wav", "vj_bms_hecu/idle13.wav", "vj_bms_hecu/idle14.wav", "vj_bms_hecu/idle15.wav", "vj_bms_hecu/idle16.wav"}
ENT.SoundTbl_CombatIdle = {"vj_bms_hecu/idle_combat1.wav", "vj_bms_hecu/idle_combat2.wav", "vj_bms_hecu/idle_combat3.wav", "vj_bms_hecu/idle_combat4.wav", "vj_bms_hecu/idle_combat5.wav", "vj_bms_hecu/idle_combat6.wav"}
--ENT.SoundTbl_OnPlayerSight = {"vj_bms_hecu/freeman1.wav", "vj_bms_hecu/freeman2.wav", "vj_bms_hecu/freeman3.wav"}
ENT.SoundTbl_Alert = {"vj_bms_hecu/alert1.wav", "vj_bms_hecu/alert2.wav", "vj_bms_hecu/alert3.wav", "vj_bms_hecu/alert4.wav", "vj_bms_hecu/alert5.wav", "vj_bms_hecu/alert6.wav", "vj_bms_hecu/alert7.wav", "vj_bms_hecu/alert8.wav", "vj_bms_hecu/alert9.wav", "vj_bms_hecu/alert10.wav"}
ENT.SoundTbl_ReceiveOrder = {"vj_bms_hecu/answer1.wav", "vj_bms_hecu/answer2.wav", "vj_bms_hecu/answer3.wav", "vj_bms_hecu/answer4.wav", "vj_bms_hecu/answer5.wav"}
ENT.SoundTbl_Suppressing = {"vj_bms_hecu/supressing1.wav", "vj_bms_hecu/supressing2.wav", "vj_bms_hecu/supressing3.wav", "vj_bms_hecu/supressing4.wav", "vj_bms_hecu/supressing5.wav", "vj_bms_hecu/supressing6.wav", "vj_bms_hecu/supressing7.wav", "vj_bms_hecu/supressing8.wav", }
ENT.SoundTbl_GrenadeAttack = {"vj_bms_hecu/throwgrenade1.wav", "vj_bms_hecu/throwgrenade2.wav", "vj_bms_hecu/throwgrenade3.wav", "vj_bms_hecu/throwgrenade4.wav", "vj_bms_hecu/throwgrenade5.wav", "vj_bms_hecu/throwgrenade6.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_bms_hecu/grenade1.wav", "vj_bms_hecu/grenade2.wav", "vj_bms_hecu/grenade3.wav", "vj_bms_hecu/grenade4.wav", "vj_bms_hecu/grenade5.wav", "vj_bms_hecu/grenade6.wav", "vj_bms_hecu/grenade7.wav", "vj_bms_hecu/grenade8.wav", "vj_bms_hecu/grenade9.wav"}
ENT.SoundTbl_Pain = {"vj_bms_hecu/pain1.wav", "vj_bms_hecu/pain2.wav", "vj_bms_hecu/pain3.wav", "vj_bms_hecu/pain4.wav", "vj_bms_hecu/pain5.wav", "vj_bms_hecu/pain6.wav", "vj_bms_hecu/pain7.wav", "vj_bms_hecu/pain8.wav", "vj_bms_hecu/pain9.wav", "vj_bms_hecu/pain10.wav"}
ENT.SoundTbl_Death = {"vj_bms_hecu/die1.wav", "vj_bms_hecu/die2.wav", "vj_bms_hecu/die3.wav", "vj_bms_hecu/die4.wav", "vj_bms_hecu/die5.wav", "vj_bms_hecu/die6.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_bms_hecu/answer1.wav", "vj_bms_hecu/answer2.wav", "vj_bms_hecu/answer3.wav", "vj_bms_hecu/answer4.wav", "vj_bms_hecu/answer5.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_bms_hecu/answer1.wav", "vj_bms_hecu/answer2.wav", "vj_bms_hecu/answer3.wav", "vj_bms_hecu/answer4.wav", "vj_bms_hecu/answer5.wav"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(1,11))
	self:SetBodygroup(1,math.random(0,0))
	self:SetBodygroup(2,math.random(0,0))
	self:SetBodygroup(3,math.random(5,5))
	self:SetBodygroup(4,math.random(0,1))
	self:SetBodygroup(5,math.random(0,1))
	self:SetBodygroup(6,math.random(1,1))
	self:SetBodygroup(7,math.random(0,1))
	if GetConVarNumber("vj_senhecuclothes_custom") > 0 then
	self:SetBodygroup(3,math.random(7,7))
	end
	if math.random(1,1) == 1 then self.IsMedicSNPC = true end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/