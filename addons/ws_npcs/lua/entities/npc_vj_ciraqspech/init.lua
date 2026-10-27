AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES","CLASS_RUSSIAN","CLASS_ARAB"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
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

ENT.B1SoundTbl_Alert = {"vj_senarabic/alert (1).mp3","vj_senarabic/alert (2).mp3","vj_senarabic/alert (3).mp3","vj_senarabic/alert (4).mp3","vj_senarabic/alert (5).mp3","vj_senarabic/alert (6).mp3"}
ENT.B1SoundTbl_Idle = {"vj_senarabic/chat (1).mp3","vj_senarabic/chat (2).mp3","vj_senarabic/chat (3).mp3","vj_senarabic/chat (4).mp3","vj_senarabic/chat (5).mp3","vj_senarabic/chat (6).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_senarabic/combat (1).mp3","vj_senarabic/combat (2).mp3","vj_senarabic/combat (3).mp3","vj_senarabic/combat (4).mp3","vj_senarabic/combat (5).mp3","vj_senarabic/combat (6).mp3"}
ENT.B1SoundTbl_Death = {"vj_senarabic/death (1).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_senarabic/follow (1).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_senarabic/hidegrenade (1).mp3","vj_senarabic/hidegrenade (2).mp3","vj_senarabic/hidegrenade (3).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_senarabic/invest (1).mp3","vj_senarabic/invest (2).mp3","vj_senarabic/invest (3).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_senarabic/kill (1).mp3","vj_senarabic/kill (2).mp3","vj_senarabic/kill (3).mp3","vj_senarabic/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_senarabic/losthim (1).mp3","vj_senarabic/losthim (2).mp3","vj_senarabic/losthim (3).mp3","vj_senarabic/losthim (4).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_senarabic/mandown (1).mp3","vj_senarabic/mandown (2).mp3","vj_senarabic/mandown (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_senarabic/nofollow (1).mp3"}
ENT.B1SoundTbl_Pain = {"vj_senarabic/pain (1).mp3","vj_senarabic/pain (2).mp3","vj_senarabic/pain (3).mp3","vj_senarabic/pain (4).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_senarabic/playerdamage (1).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_senarabic/reload (1).mp3","vj_senarabic/reload (2).mp3","vj_senarabic/reload (3).mp3","vj_senarabic/reload (4).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_senarabic/suppress (3).mp3","vj_senarabic/suppress (2).mp3","vj_senarabic/suppress (1).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(0,1))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,2))
	self:SetBodygroup(5,math.random(0,2))
	self:SetBodygroup(6,math.random(0,2))
	self:SetBodygroup(7,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,2)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_IdleDialogueAnswer = self.B1SoundTbl_IdleDialogueAnswer
        self.SoundTbl_GrenadeAttack = self.B1SoundTbl_GrenadeAttack
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
		self.SoundTbl_AllyDeath = self.B1SoundTbl_AllyDeath
		self.SoundTbl_Suppressing = self.B1SoundTbl_Suppressing
        self.SoundTbl_BecomeEnemyToPlayer = self.B1SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B1SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/irqarmy/soldier_iraqi.mdl"}
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
        self.SoundTbl_BecomeEnemyToPlayer = self.B2SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B2SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B2SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B2SoundTbl_Investigate
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
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
        self.SoundTbl_GrenadeAttack = self.B2SoundTbl_GrenadeAttack
		self.Model = {"models/sentry/sentrycag/irqarmy/soldier_iraqi.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/