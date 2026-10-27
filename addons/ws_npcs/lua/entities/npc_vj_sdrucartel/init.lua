AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 80 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_LATINOMOB_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_slice","kick_door"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenadeThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_vrubig3/alert (1).mp3","vj_vrubig3/alert (2).mp3","vj_vrubig3/alert (3).mp3","vj_vrubig3/alert (4).mp3","vj_vrubig3/alert (5).mp3","vj_vrubig3/alert (6).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_vrubig3/becomehos (1).mp3","vj_vrubig3/becomehos (2).mp3","vj_vrubig3/becomehos (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_vrubig3/bump (1).mp3","vj_vrubig3/bump (2).mp3","vj_vrubig3/bump (3).mp3","vj_vrubig3/bump (4).mp3","vj_vrubig3/bump (5).mp3"} 
ENT.B1SoundTbl_CombatIdle = {"vj_vrubig3/combat (1).mp3","vj_vrubig3/combat (2).mp3","vj_vrubig3/combat (3).mp3","vj_vrubig3/combat (4).mp3","vj_vrubig3/combat (5).mp3","vj_vrubig3/combat (6).mp3","vj_vrubig3/combat (7).mp3","vj_vrubig3/combat (8).mp3","vj_vrubig3/combat (9).mp3"}
ENT.B1SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_vrubig3/follow (1).mp3","vj_vrubig3/follow (2).mp3","vj_vrubig3/follow (3).mp3","vj_vrubig3/follow (4).mp3","vj_vrubig3/follow (5).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_vrubig3/gotmedic (1).mp3","vj_vrubig3/gotmedic (2).mp3","vj_vrubig3/gotmedic (3).mp3"}
ENT.B1SoundTbl_CallForHelp = {"vj_vrubig3/help (1).mp3","vj_vrubig3/help (2).mp3","vj_vrubig3/help (3).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_vrubig3/hi (1).mp3","vj_vrubig3/hi (2).mp3","vj_vrubig3/hi (3).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_vrubig3/hidegrenade (1).mp3","vj_vrubig3/hidegrenade (3).mp3","vj_vrubig3/hidegrenade (2).mp3","vj_vrubig3/hidegrenade (4).mp3","vj_vrubig3/hidegrenade (5).mp3","vj_vrubig3/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_vrubig3/kill (1).mp3","vj_vrubig3/kill (2).mp3","vj_vrubig3/kill (3).mp3","vj_vrubig3/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_vrubig3/losthim (1).mp3","vj_vrubig3/losthim (2).mp3","vj_vrubig3/losthim (3).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_vrubig3/mandown (1).mp3","vj_vrubig3/mandown (2).mp3","vj_vrubig3/mandown (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_vrubig3/nofollow (1).mp3","vj_vrubig3/nofollow (2).mp3","vj_vrubig3/nofollow (3).mp3"}
ENT.B1SoundTbl_Pain = {"vj_vrubig3/pain (1).mp3","vj_vrubig3/pain (2).mp3","vj_vrubig3/pain (3).mp3","vj_vrubig3/pain (4).mp3","vj_vrubig3/pain (5).mp3","vj_vrubig3/pain (6).mp3","vj_vrubig3/pain (7).mp3","vj_vrubig3/pain (8).mp3","vj_vrubig3/pain (9).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_vrubig3/playerdamage (1).mp3","vj_vrubig3/playerdamage (2).mp3","vj_vrubig3/playerdamage (3).mp3","vj_vrubig3/playerdamage (4).mp3","vj_vrubig3/playerdamage (5).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_vrubig3/reload (1).mp3","vj_vrubig3/reload (2).mp3","vj_vrubig3/reload (3).mp3","vj_vrubig3/reload (4).mp3","vj_vrubig3/reload (5).mp3","vj_vrubig3/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_vrubig3/suppress (1).mp3","vj_vrubig3/suppress (2).mp3","vj_vrubig3/suppress (3).mp3","vj_vrubig3/suppress (4).mp3","vj_vrubig3/suppress (5).mp3","vj_vrubig3/suppress (6).mp3"}

ENT.B2SoundTbl_Alert = {"vj_vrubig4/alert (1).mp3","vj_vrubig4/alert (2).mp3","vj_vrubig4/alert (3).mp3","vj_vrubig4/alert (4).mp3","vj_vrubig4/alert (5).mp3","vj_vrubig4/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_vrubig4/becomehos (1).mp3","vj_vrubig4/becomehos (2).mp3","vj_vrubig4/becomehos (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_vrubig4/bump (1).mp3","vj_vrubig4/bump (2).mp3","vj_vrubig4/bump (3).mp3","vj_vrubig4/bump (4).mp3","vj_vrubig4/bump (5).mp3"} 
ENT.B2SoundTbl_CombatIdle = {"vj_vrubig4/combat (1).mp3","vj_vrubig4/combat (2).mp3","vj_vrubig4/combat (3).mp3","vj_vrubig4/combat (4).mp3","vj_vrubig4/combat (5).mp3","vj_vrubig4/combat (6).mp3","vj_vrubig4/combat (7).mp3","vj_vrubig4/combat (8).mp3","vj_vrubig4/combat (9).mp3"}
ENT.B2SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_vrubig4/follow (1).mp3","vj_vrubig4/follow (2).mp3","vj_vrubig4/follow (3).mp3","vj_vrubig4/follow (4).mp3","vj_vrubig4/follow (5).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_vrubig4/gotmedic (1).mp3","vj_vrubig4/gotmedic (2).mp3","vj_vrubig4/gotmedic (3).mp3"}
ENT.B2SoundTbl_CallForHelp = {"vj_vrubig4/help (1).mp3","vj_vrubig4/help (2).mp3","vj_vrubig4/help (3).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_vrubig4/hi (1).mp3","vj_vrubig4/hi (2).mp3","vj_vrubig4/hi (3).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_vrubig4/hidegrenade (1).mp3","vj_vrubig4/hidegrenade (3).mp3","vj_vrubig4/hidegrenade (2).mp3","vj_vrubig4/hidegrenade (4).mp3","vj_vrubig4/hidegrenade (5).mp3","vj_vrubig4/hidegrenade (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_vrubig4/kill (1).mp3","vj_vrubig4/kill (2).mp3","vj_vrubig4/kill (3).mp3","vj_vrubig4/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_vrubig4/losthim (1).mp3","vj_vrubig4/losthim (2).mp3","vj_vrubig4/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_vrubig4/mandown (1).mp3","vj_vrubig4/mandown (2).mp3","vj_vrubig4/mandown (3).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_vrubig4/nofollow (1).mp3","vj_vrubig4/nofollow (2).mp3","vj_vrubig4/nofollow (3).mp3"}
ENT.B2SoundTbl_Pain = {"vj_vrubig4/pain (1).mp3","vj_vrubig4/pain (2).mp3","vj_vrubig4/pain (3).mp3","vj_vrubig4/pain (4).mp3","vj_vrubig4/pain (5).mp3","vj_vrubig4/pain (6).mp3","vj_vrubig4/pain (7).mp3","vj_vrubig4/pain (8).mp3","vj_vrubig4/pain (9).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_vrubig4/playerdamage (1).mp3","vj_vrubig4/playerdamage (2).mp3","vj_vrubig4/playerdamage (3).mp3","vj_vrubig4/playerdamage (4).mp3","vj_vrubig4/playerdamage (5).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_vrubig4/reload (1).mp3","vj_vrubig4/reload (2).mp3","vj_vrubig4/reload (3).mp3","vj_vrubig4/reload (4).mp3","vj_vrubig4/reload (5).mp3","vj_vrubig4/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_vrubig4/suppress (1).mp3","vj_vrubig4/suppress (2).mp3","vj_vrubig4/suppress (3).mp3","vj_vrubig4/suppress (4).mp3","vj_vrubig4/suppress (5).mp3","vj_vrubig4/suppress (6).mp3"}

ENT.B3SoundTbl_Alert = {"vj_vrubig5/alert (1).mp3","vj_vrubig5/alert (2).mp3","vj_vrubig5/alert (3).mp3","vj_vrubig5/alert (4).mp3","vj_vrubig5/alert (5).mp3","vj_vrubig5/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_vrubig5/becomehos (1).mp3","vj_vrubig5/becomehos (2).mp3","vj_vrubig5/becomehos (3).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_vrubig5/bump (1).mp3","vj_vrubig5/bump (2).mp3","vj_vrubig5/bump (3).mp3","vj_vrubig5/bump (4).mp3","vj_vrubig5/bump (5).mp3"} 
ENT.B3SoundTbl_CombatIdle = {"vj_vrubig5/combat (1).mp3","vj_vrubig5/combat (2).mp3","vj_vrubig5/combat (3).mp3","vj_vrubig5/combat (4).mp3","vj_vrubig5/combat (5).mp3","vj_vrubig5/combat (6).mp3","vj_vrubig5/combat (7).mp3","vj_vrubig5/combat (8).mp3","vj_vrubig5/combat (9).mp3"}
ENT.B3SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_vrubig5/follow (1).mp3","vj_vrubig5/follow (2).mp3","vj_vrubig5/follow (3).mp3","vj_vrubig5/follow (4).mp3","vj_vrubig5/follow (5).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_vrubig5/gotmedic (1).mp3","vj_vrubig5/gotmedic (2).mp3","vj_vrubig5/gotmedic (3).mp3"}
ENT.B3SoundTbl_CallForHelp = {"vj_vrubig5/help (1).mp3","vj_vrubig5/help (2).mp3","vj_vrubig5/help (3).mp3"}
ENT.B3SoundTbl_OnPlayerSight = {"vj_vrubig5/hi (1).mp3","vj_vrubig5/hi (2).mp3","vj_vrubig5/hi (3).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_vrubig5/hidegrenade (1).mp3","vj_vrubig5/hidegrenade (3).mp3","vj_vrubig5/hidegrenade (2).mp3","vj_vrubig5/hidegrenade (4).mp3","vj_vrubig5/hidegrenade (5).mp3","vj_vrubig5/hidegrenade (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_vrubig5/kill (1).mp3","vj_vrubig5/kill (2).mp3","vj_vrubig5/kill (3).mp3","vj_vrubig5/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_vrubig5/losthim (1).mp3","vj_vrubig5/losthim (2).mp3","vj_vrubig5/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_vrubig5/mandown (1).mp3","vj_vrubig5/mandown (2).mp3","vj_vrubig5/mandown (3).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_vrubig5/nofollow (1).mp3","vj_vrubig5/nofollow (2).mp3","vj_vrubig5/nofollow (3).mp3"}
ENT.B3SoundTbl_Pain = {"vj_vrubig5/pain (1).mp3","vj_vrubig5/pain (2).mp3","vj_vrubig5/pain (3).mp3","vj_vrubig5/pain (4).mp3","vj_vrubig5/pain (5).mp3","vj_vrubig5/pain (6).mp3","vj_vrubig5/pain (7).mp3","vj_vrubig5/pain (8).mp3","vj_vrubig5/pain (9).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_vrubig5/playerdamage (1).mp3","vj_vrubig5/playerdamage (2).mp3","vj_vrubig5/playerdamage (3).mp3","vj_vrubig5/playerdamage (4).mp3","vj_vrubig5/playerdamage (5).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_vrubig5/reload (1).mp3","vj_vrubig5/reload (2).mp3","vj_vrubig5/reload (3).mp3","vj_vrubig5/reload (4).mp3","vj_vrubig5/reload (5).mp3","vj_vrubig5/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_vrubig5/suppress (1).mp3","vj_vrubig5/suppress (2).mp3","vj_vrubig5/suppress (3).mp3","vj_vrubig5/suppress (4).mp3","vj_vrubig5/suppress (5).mp3","vj_vrubig5/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,12))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(0,0))
	self:SetBodygroup(3,math.random(2,4))
	self:SetBodygroup(4,math.random(6,8))
	self:SetBodygroup(5,math.random(2,2))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,3)
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
		self.Model = {"models/sentry/sentrycag/cartel/senmfc3.mdl"}
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
		self.Model = {"models/sentry/sentrycag/cartel/senmfc3.mdl"}
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
		self.Model = {"models/sentry/sentrycag/cartel/senmfc3.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/