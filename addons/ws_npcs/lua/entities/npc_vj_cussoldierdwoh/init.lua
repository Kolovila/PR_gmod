AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"MeleeAttack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"Heal"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"ThrowItem"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_srsrvf/alert (1).mp3","vj_srsrvf/alert (2).mp3","vj_srsrvf/alert (3).mp3","vj_srsrvf/alert (4).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_srsrvf/bump (1).mp3","vj_srsrvf/bump (2).mp3","vj_srsrvf/bump (3).mp3","vj_srsrvf/bump (4).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_srsrvf/chat (1).mp3","vj_srsrvf/chat (2).mp3","vj_srsrvf/chat (3).mp3","vj_srsrvf/chat (4).mp3","vj_srsrvf/chat (5).mp3","vj_srsrvf/chat (6).mp3","vj_srsrvf/chat (7).mp3","vj_srsrvf/chat (8).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_srsrvf/combat (1).mp3","vj_srsrvf/combat (2).mp3","vj_srsrvf/combat (3).mp3","vj_srsrvf/combat (4).mp3","vj_srsrvf/combat (5).mp3"}
ENT.B1SoundTbl_Death = {"vj_fcsoldier/died (1).mp3","vj_fcsoldier/died (2).mp3","vj_fcsoldier/died (3).mp3","vj_fcsoldier/died (4).mp3","vj_fcsoldier/died (5).mp3","vj_fcsoldier/died (6).mp3","vj_fcsoldier/died (7).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_srsrvf/follow (1).mp3","vj_srsrvf/follow (2).mp3","vj_srsrvf/follow (3).mp3","vj_srsrvf/follow (4).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_srsrvf/gotmedic (1).mp3"}
ENT.B1SoundTbl_CallForHelp = {"vj_srsrvf/help (1).mp3","vj_srsrvf/help (2).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_srsrvf/hi (1).mp3","vj_srsrvf/hi (2).mp3","vj_srsrvf/hi (3).mp3","vj_srsrvf/hi (4).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_srsrvf/hidegrenade (1).mp3","vj_srsrvf/hidegrenade (3).mp3","vj_srsrvf/hidegrenade (2).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_srsrvf/kill (1).mp3","vj_srsrvf/kill (2).mp3","vj_srsrvf/kill (3).mp3","vj_srsrvf/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_srsrvf/losthim (1).mp3","vj_srsrvf/losthim (2).mp3","vj_srsrvf/losthim (3).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_srsrvf/mandown (1).mp3","vj_srsrvf/mandown (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_srsrvf/nofollow (1).mp3","vj_srsrvf/nofollow (2).mp3","vj_srsrvf/nofollow (3).mp3","vj_srsrvf/nofollow (4).mp3","vj_srsrvf/nofollow (5).mp3"}
ENT.B1SoundTbl_Pain = {"vj_srsrvf/pain (1).mp3","vj_srsrvf/pain (2).mp3","vj_srsrvf/pain (3).mp3","vj_srsrvf/pain (4).mp3","vj_srsrvf/pain (5).mp3","vj_srsrvf/pain (6).mp3","vj_srsrvf/pain (7).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_srsrvf/playerdamage (1).mp3","vj_srsrvf/playerdamage (2).mp3","vj_srsrvf/playerdamage (3).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_srsrvf/suppress (1).mp3","vj_srsrvf/suppress (2).mp3","vj_srsrvf/suppress (3).mp3","vj_srsrvf/suppress (4).mp3"}

ENT.B2SoundTbl_Alert = {"vj_fcsoldier/alert (1).mp3","vj_fcsoldier/alert (2).mp3","vj_fcsoldier/alert (3).mp3","vj_fcsoldier/alert (4).mp3","vj_fcsoldier/alert (5).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_fcsoldier/becomehos (1).mp3","vj_fcsoldier/becomehos (2).mp3","vj_fcsoldier/becomehos (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_fcsoldier/bump (1).mp3","vj_fcsoldier/bump (2).mp3","vj_fcsoldier/bump (3).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_fcsoldier/chat (1).mp3","vj_fcsoldier/chat (2).mp3","vj_fcsoldier/chat (3).mp3","vj_fcsoldier/chat (4).mp3","vj_fcsoldier/chat (5).mp3","vj_fcsoldier/chat (6).mp3","vj_fcsoldier/chat (7).mp3","vj_fcsoldier/chat (8).mp3","vj_fcsoldier/chat (9).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_fcsoldier/combat (1).mp3","vj_fcsoldier/combat (2).mp3","vj_fcsoldier/combat (3).mp3","vj_fcsoldier/combat (4).mp3"}
ENT.B2SoundTbl_Death = {"vj_fcsoldier/died (1).mp3","vj_fcsoldier/died (2).mp3","vj_fcsoldier/died (3).mp3","vj_fcsoldier/died (4).mp3","vj_fcsoldier/died (5).mp3","vj_fcsoldier/died (6).mp3","vj_fcsoldier/died (7).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_fcsoldier/follow (1).mp3","vj_fcsoldier/follow (2).mp3","vj_fcsoldier/follow (3).mp3","vj_fcsoldier/follow (4).mp3","vj_fcsoldier/follow (5).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_fcsoldier/gotmedic (1).mp3","vj_fcsoldier/gotmedic (2).mp3"}
ENT.B2SoundTbl_CallForHelp = {"vj_fcsoldier/help (1).mp3","vj_fcsoldier/help (2).mp3","vj_fcsoldier/help (3).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_fcsoldier/hi (1).mp3","vj_fcsoldier/hi (2).mp3","vj_fcsoldier/hi (3).mp3","vj_fcsoldier/hi (4).mp3","vj_fcsoldier/hi (5).mp3","vj_fcsoldier/hi (6).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_fcsoldier/hidegrenade (1).mp3","vj_fcsoldier/hidegrenade (3).mp3","vj_fcsoldier/hidegrenade (2).mp3","vj_fcsoldier/hidegrenade (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_fcsoldier/losthim (1).mp3","vj_fcsoldier/losthim (2).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_fcsoldier/mandown (1).mp3","vj_fcsoldier/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_fcsoldier/nofollow (1).mp3","vj_fcsoldier/nofollow (2).mp3","vj_fcsoldier/nofollow (3).mp3","vj_fcsoldier/nofollow (4).mp3","vj_fcsoldier/nofollow (5).mp3"}
ENT.B2SoundTbl_Pain = {"vj_fcsoldier/pain (1).mp3","vj_fcsoldier/pain (2).mp3","vj_fcsoldier/pain (3).mp3","vj_fcsoldier/pain (4).mp3","vj_fcsoldier/pain (5).mp3","vj_fcsoldier/pain (6).mp3","vj_fcsoldier/pain (7).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_fcsoldier/playerdamage (1).mp3","vj_fcsoldier/playerdamage (2).mp3","vj_fcsoldier/playerdamage (3).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_fcsoldier/suppress (1).mp3","vj_fcsoldier/suppress (2).mp3","vj_fcsoldier/suppress (3).mp3","vj_fcsoldier/suppress (4).mp3","vj_fcsoldier/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(5,math.random(0,0))
	self:SetBodygroup(6,math.random(0,4))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(4,math.random(1,2))
	self:SetBodygroup(7,math.random(0,1))
	self:SetBodygroup(8,math.random(1,2))
	self:SetBodygroup(9,math.random(1,4))
	self:SetBodygroup(10,math.random(1,6))
	self:SetBodygroup(11,math.random(0,0))
	self:SetBodygroup(12,math.random(0,0))
	self:SetBodygroup(13,math.random(0,1))
	self:SetBodygroup(14,math.random(0,1))
	self:SetBodygroup(15,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,2)
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
		self.Model = {"models/sentry/sentrycag/desertsol/female_02.mdl","models/sentry/sentrycag/desertsol/female_04.mdl","models/sentry/sentrycag/desertsol/female_06.mdl"}
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
		self.Model = {"models/sentry/sentrycag/desertsol/female_02.mdl","models/sentry/sentrycag/desertsol/female_04.mdl","models/sentry/sentrycag/desertsol/female_06.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/