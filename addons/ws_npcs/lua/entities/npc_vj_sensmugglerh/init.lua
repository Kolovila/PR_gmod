AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_LATINOMOB","CLASS_WESTTERROR","CLASS_NATIONALIST","CLASS_MILITIA","CLASS_PARAMILITARY"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}

ENT.B3SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B3SoundTbl_Alert = {"vj_avgoon3/alert (1).mp3","vj_avgoon3/alert (2).mp3","vj_avgoon3/alert (3).mp3","vj_avgoon3/alert (4).mp3","vj_avgoon3/alert (5).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_avgoon3/bump (1).mp3","vj_avgoon3/bump (2).mp3","vj_avgoon3/bump (3).mp3","vj_avgoon3/bump (4).mp3","vj_avgoon3/bump (5).mp3"} 
ENT.B3SoundTbl_CombatIdle = {"vj_avgoon3/combat (1).mp3","vj_avgoon3/combat (2).mp3","vj_avgoon3/combat (3).mp3","vj_avgoon3/combat (4).mp3","vj_avgoon3/combat (5).mp3","vj_avgoon3/combat (6).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_avgoon3/follow (1).mp3","vj_avgoon3/follow (2).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_avgoon3/gotmedic (1).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_avgoon3/hidegrenade (1).mp3","vj_avgoon3/hidegrenade (3).mp3","vj_avgoon3/hidegrenade (2).mp3","vj_avgoon3/hidegrenade (4).mp3","vj_avgoon3/hidegrenade (5).mp3","vj_avgoon3/hidegrenade (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_avgoon3/kill (1).mp3","vj_avgoon3/kill (2).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_avgoon3/losthim (1).mp3","vj_avgoon3/losthim (2).mp3","vj_avgoon3/losthim (3).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_avgoon3/nofollow (1).mp3","vj_avgoon3/nofollow (2).mp3","vj_avgoon3/nofollow (3).mp3"}
ENT.B3SoundTbl_Pain = {"vj_avgoon3/pain (1).mp3","vj_avgoon3/pain (2).mp3","vj_avgoon3/pain (3).mp3","vj_avgoon3/pain (4).mp3","vj_avgoon3/pain (5).mp3","vj_avgoon3/pain (6).mp3","vj_avgoon3/pain (7).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_avgoon3/playerdamage (1).mp3","vj_avgoon3/playerdamage (2).mp3","vj_avgoon3/playerdamage (3).mp3","vj_avgoon3/playerdamage (4).mp3","vj_avgoon3/playerdamage (5).mp3","vj_avgoon3/playerdamage (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_avgoon3/suppress (1).mp3","vj_avgoon3/suppress (2).mp3","vj_avgoon3/suppress (3).mp3","vj_avgoon3/suppress (4).mp3","vj_avgoon3/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_avgoon4/alert (1).mp3","vj_avgoon4/alert (2).mp3","vj_avgoon4/alert (3).mp3","vj_avgoon4/alert (4).mp3","vj_avgoon4/alert (5).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_avgoon4/bump (1).mp3","vj_avgoon4/bump (2).mp3","vj_avgoon4/bump (3).mp3","vj_avgoon4/bump (4).mp3","vj_avgoon4/bump (5).mp3"} 
ENT.B4SoundTbl_CombatIdle = {"vj_avgoon4/combat (1).mp3","vj_avgoon4/combat (2).mp3","vj_avgoon4/combat (3).mp3","vj_avgoon4/combat (4).mp3","vj_avgoon4/combat (5).mp3","vj_avgoon4/combat (6).mp3"}
ENT.B4SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_avgoon4/follow (1).mp3","vj_avgoon4/follow (2).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_avgoon4/gotmedic (1).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_avgoon4/hidegrenade (1).mp3","vj_avgoon4/hidegrenade (3).mp3","vj_avgoon4/hidegrenade (2).mp3","vj_avgoon4/hidegrenade (4).mp3","vj_avgoon4/hidegrenade (5).mp3","vj_avgoon4/hidegrenade (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_avgoon4/kill (1).mp3","vj_avgoon4/kill (2).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_avgoon4/losthim (1).mp3","vj_avgoon4/losthim (2).mp3","vj_avgoon4/losthim (3).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_avgoon4/nofollow (1).mp3","vj_avgoon4/nofollow (2).mp3"}
ENT.B4SoundTbl_Pain = {"vj_avgoon4/pain (1).mp3","vj_avgoon4/pain (2).mp3","vj_avgoon4/pain (3).mp3","vj_avgoon4/pain (4).mp3","vj_avgoon4/pain (5).mp3","vj_avgoon4/pain (6).mp3","vj_avgoon4/pain (7).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_avgoon4/playerdamage (1).mp3","vj_avgoon4/playerdamage (2).mp3","vj_avgoon4/playerdamage (3).mp3","vj_avgoon4/playerdamage (4).mp3","vj_avgoon4/playerdamage (5).mp3","vj_avgoon4/playerdamage (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_avgoon4/suppress (1).mp3","vj_avgoon4/suppress (2).mp3","vj_avgoon4/suppress (3).mp3","vj_avgoon4/suppress (4).mp3","vj_avgoon4/suppress (5).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,12))
	self:SetBodygroup(1,math.random(2,2))
	self:SetBodygroup(2,math.random(3,5))
	self:SetBodygroup(3,math.random(2,4))
	self:SetBodygroup(4,math.random(0,1))
	self:SetBodygroup(5,math.random(0,3))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(3,4)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
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
		self.Model = {"models/sentry/gtav/clifford/avongoon.mdl"}
	else
	if randomvoice == 2 then
		self.Race = "B2"
	
        self.SoundTbl_Death = self.B2SoundTbl_Death
		self.SoundTbl_Idle = self.B2SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B2SoundTbl_Alert
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
		self.Model = {"models/sentry/gtav/clifford/avongoon.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
        self.SoundTbl_Death = self.B3SoundTbl_Death
		self.SoundTbl_Idle = self.B3SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B3SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B3SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B3SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B3SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B3SoundTbl_Pain
		self.SoundTbl_Alert = self.B3SoundTbl_Alert
        self.SoundTbl_BecomeEnemyToPlayer = self.B3SoundTbl_BecomeEnemyToPlayer
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
		self.Model = {"models/sentry/sentrycag/sensmuggler/senmfc1.mdl"}
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
        self.SoundTbl_BecomeEnemyToPlayer = self.B4SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_Pain = self.B4SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/sensmuggler/senmfc1.mdl"}
		end	
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/