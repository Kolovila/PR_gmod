AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 115 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
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
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_senhecu/alertar (1).mp3","vj_senhecu/alertar (2).mp3","vj_senhecu/alertar (3).mp3","vj_senhecu/alertar (4).mp3","vj_senhecu/alertar (5).mp3","vj_senhecu/alertar (6).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_senhecu/chatsar (1).mp3","vj_senhecu/chatsar (2).mp3","vj_senhecu/chatsar (3).mp3","vj_senhecu/chatsar (4).mp3","vj_senhecu/chatsar (5).mp3","vj_senhecu/chatsar (6).mp3","vj_senhecu/chatsar (7).mp3","vj_senhecu/chatsar (8).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_senhecu/combatsar (1).mp3","vj_senhecu/combatsar (2).mp3","vj_senhecu/combatsar (3).mp3","vj_senhecu/combatsar (4).mp3","vj_senhecu/combatsar (5).mp3","vj_senhecu/combatsar (6).mp3","vj_senhecu/combatsar (7).mp3","vj_senhecu/combatsar (8).mp3"}
ENT.B1SoundTbl_Death = {"vj_senhecu/death (1).mp3","vj_senhecu/death (2).mp3","vj_senhecu/death (3).mp3","vj_senhecu/death (4).mp3","vj_senhecu/death (5).mp3","vj_senhecu/death (6).mp3","vj_senhecu/death (7).mp3","vj_senhecu/death (8).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_senhecu/follow (1).mp3","vj_senhecu/follow (2).mp3","vj_senhecu/follow (3).mp3","vj_senhecu/follow (4).mp3","vj_senhecu/follow (5).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_senhecu/grenade (1).mp3","vj_senhecu/grenade (2).mp3","vj_senhecu/grenade (3).mp3","vj_senhecu/grenade (4).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_senhecu/hidegrenade (1).mp3","vj_senhecu/hidegrenade (2).mp3","vj_senhecu/hidegrenade (3).mp3","vj_senhecu/hidegrenade (4).mp3","vj_senhecu/hidegrenade (5).mp3","vj_senhecu/hidegrenade (6).mp3"}
ENT.B1SoundTbl_IdleDialogue = {"vj_senhecu/idle (1).mp3","vj_senhecu/idle (2).mp3","vj_senhecu/idle (3).mp3","vj_senhecu/idle (4).mp3","vj_senhecu/idle (5).mp3","vj_senhecu/idle (6).mp3","vj_senhecu/idle (7).mp3","vj_senhecu/idle (8).mp3","vj_senhecu/idle (9).mp3"}
ENT.B1SoundTbl_IdleDialogueAnswer = {"vj_senhecu/idleans (1).mp3","vj_senhecu/idleans (2).mp3","vj_senhecu/idleans (3).mp3","vj_senhecu/idleans (4).mp3","vj_senhecu/idleans (5).mp3","vj_senhecu/idleans (6).mp3","vj_senhecu/idleans (7).mp3","vj_senhecu/idleans (8).mp3","vj_senhecu/idleans (9).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_senhecu/invest (1).mp3","vj_senhecu/invest (2).mp3","vj_senhecu/invest (3).mp3","vj_senhecu/invest (4).mp3","vj_senhecu/invest (5).mp3","vj_senhecu/invest (6).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_senhecu/losthim (1).mp3","vj_senhecu/losthim (2).mp3","vj_senhecu/losthim (3).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_senhecu/mandown (3).mp3","vj_senhecu/mandown (2).mp3","vj_senhecu/mandown (1).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_senhecu/nofollow (1).mp3","vj_senhecu/nofollow (2).mp3"}
ENT.B1SoundTbl_Pain = {"vj_senhecu/pain (1).mp3","vj_senhecu/pain (2).mp3","vj_senhecu/pain (3).mp3","vj_senhecu/pain (4).mp3","vj_senhecu/pain (5).mp3","vj_senhecu/pain (6).mp3","vj_senhecu/pain (7).mp3","vj_senhecu/pain (8).mp3","vj_senhecu/pain (9).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_senhecu/reload (1).mp3","vj_senhecu/reload (2).mp3","vj_senhecu/reload (3).mp3","vj_senhecu/reload (4).mp3","vj_senhecu/reload (5).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_senhecu/suppressar (1).mp3","vj_senhecu/suppressar (2).mp3","vj_senhecu/suppressar (3).mp3","vj_senhecu/suppressar (4).mp3","vj_senhecu/suppressar (5).mp3","vj_senhecu/suppressar (6).mp3"}
ENT.B1SoundTbl_OnReceiveOrder = {"vj_senhecu/yessir (1).mp3","vj_senhecu/yessir (2).mp3","vj_senhecu/yessir (3).mp3","vj_senhecu/yessir (4).mp3"}
--ENT.B1SoundTbl_OnPlayerSight = {"vj_senhecu/freeman (1).mp3","vj_senhecu/freeman (2).mp3","vj_senhecu/freeman (3).mp3","vj_senhecu/freeman (4).mp3","vj_senhecu/freeman (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,5))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(1,1))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(5,math.random(0,1))
	self:SetBodygroup(6,math.random(1,1))
	self:SetBodygroup(7,math.random(1,1))
	self:SetBodygroup(8,math.random(1,1))
	if math.random(1,6) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,1)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
		self.SoundTbl_AllyDeath = self.B1SoundTbl_AllyDeath
		self.SoundTbl_Suppressing = self.B1SoundTbl_Suppressing
        self.SoundTbl_BecomeEnemyToPlayer = self.B1SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B1SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B1SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B1SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B1SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B1SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B1SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B1SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B1SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B1SoundTbl_DamageByPlayer
		self.SoundTbl_WeaponReload = self.B1SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B1SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B1SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B1SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/sentryus/m_usmarine_01_spec.mdl"}
	else
	if randomvoice == 2 then
		self.Race = "B2"
	
        self.SoundTbl_Death = self.B2SoundTbl_Death
		self.SoundTbl_Idle = self.B2SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B2SoundTbl_Alert
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
        self.SoundTbl_BecomeEnemyToPlayer = self.B2SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B2SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B2SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B2SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B2SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B2SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B2SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B2SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B2SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B2SoundTbl_DamageByPlayer
		self.SoundTbl_Suppressing = self.B2SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B2SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B2SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B2SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B2SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/sentryus/m_usmarine_01_spec.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
        self.SoundTbl_Death = self.B3SoundTbl_Death
		self.SoundTbl_Idle = self.B3SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B3SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B3SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B3SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B3SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B3SoundTbl_Alert
        self.SoundTbl_BecomeEnemyToPlayer = self.B3SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_Pain = self.B3SoundTbl_Pain
        self.SoundTbl_MoveOutOfPlayersWay = self.B3SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B3SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B3SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B3SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B3SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B3SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B3SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B3SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B3SoundTbl_DamageByPlayer
		self.SoundTbl_Suppressing = self.B3SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B3SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B3SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B3SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B3SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/sentryus/m_usmarine_01_spec.mdl"}
		end
		if randomvoice == 4 then
		self.Race = "B4"
	
        self.SoundTbl_Death = self.B4SoundTbl_Death
		self.SoundTbl_Idle = self.B4SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B4SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B4SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B4SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B4SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B4SoundTbl_Alert
        self.SoundTbl_Pain = self.B4SoundTbl_Pain
        self.SoundTbl_BecomeEnemyToPlayer = self.B4SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B4SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B4SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B4SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B4SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B4SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B4SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B4SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B4SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B4SoundTbl_DamageByPlayer
		self.SoundTbl_Suppressing = self.B4SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B4SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B4SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B4SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B4SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/sentryus/m_usmarine_01_spec.mdl"}
		end	
		if randomvoice == 5 then
		self.Race = "B5"
	
        self.SoundTbl_Death = self.B5SoundTbl_Death
		self.SoundTbl_Idle = self.B5SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B5SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B5SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B5SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B5SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B5SoundTbl_Alert
        self.SoundTbl_Pain = self.B5SoundTbl_Pain
        self.SoundTbl_BecomeEnemyToPlayer = self.B5SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B5SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B5SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B5SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B5SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B5SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B5SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B5SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B5SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B5SoundTbl_DamageByPlayer
		self.SoundTbl_Suppressing = self.B5SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B5SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B5SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B5SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B5SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/sentryus/m_usmarine_01_spec.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/