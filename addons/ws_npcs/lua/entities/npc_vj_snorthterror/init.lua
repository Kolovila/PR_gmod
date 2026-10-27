AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_NORTHERN_FRIENDLY","CLASS_SURVIVALIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"meleeattack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.B1SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B1SoundTbl_Alert = {"vj_avgoon1/alert (1).mp3","vj_avgoon1/alert (2).mp3","vj_avgoon1/alert (3).mp3","vj_avgoon1/alert (4).mp3","vj_avgoon1/alert (5).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_avgoon1/bump (1).mp3","vj_avgoon1/bump (2).mp3","vj_avgoon1/bump (3).mp3","vj_avgoon1/bump (4).mp3","vj_avgoon1/bump (5).mp3"} 
ENT.B1SoundTbl_CombatIdle = {"vj_avgoon1/combat (1).mp3","vj_avgoon1/combat (2).mp3","vj_avgoon1/combat (3).mp3","vj_avgoon1/combat (4).mp3","vj_avgoon1/combat (5).mp3","vj_avgoon1/combat (6).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_avgoon1/follow (1).mp3","vj_avgoon1/follow (2).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_avgoon1/gotmedic (1).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_avgoon1/hi (1).mp3","vj_avgoon1/hi (2).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_avgoon1/hidegrenade (1).mp3","vj_avgoon1/hidegrenade (3).mp3","vj_avgoon1/hidegrenade (2).mp3","vj_avgoon1/hidegrenade (4).mp3","vj_avgoon1/hidegrenade (5).mp3","vj_avgoon1/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_avgoon1/kill (1).mp3","vj_avgoon1/kill (2).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_avgoon1/losthim (1).mp3","vj_avgoon1/losthim (2).mp3","vj_avgoon1/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_avgoon1/nofollow (1).mp3","vj_avgoon1/nofollow (2).mp3","vj_avgoon1/nofollow (3).mp3"}
ENT.B1SoundTbl_Pain = {"vj_avgoon1/pain (1).mp3","vj_avgoon1/pain (2).mp3","vj_avgoon1/pain (3).mp3","vj_avgoon1/pain (4).mp3","vj_avgoon1/pain (5).mp3","vj_avgoon1/pain (6).mp3","vj_avgoon1/pain (7).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_avgoon1/playerdamage (1).mp3","vj_avgoon1/playerdamage (2).mp3","vj_avgoon1/playerdamage (3).mp3","vj_avgoon1/playerdamage (4).mp3","vj_avgoon1/playerdamage (5).mp3","vj_avgoon1/playerdamage (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_avgoon1/suppress (1).mp3","vj_avgoon1/suppress (2).mp3","vj_avgoon1/suppress (3).mp3","vj_avgoon1/suppress (4).mp3","vj_avgoon1/suppress (5).mp3"}

ENT.B2SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B2SoundTbl_Alert = {"vj_avgoon2/alert (1).mp3","vj_avgoon2/alert (2).mp3","vj_avgoon2/alert (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_avgoon2/bump (1).mp3","vj_avgoon2/bump (2).mp3"} 
ENT.B2SoundTbl_CombatIdle = {"vj_avgoon2/combat (1).mp3","vj_avgoon2/combat (2).mp3","vj_avgoon2/combat (3).mp3","vj_avgoon2/combat (4).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_avgoon2/follow (1).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_avgoon2/gotmedic (1).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_avgoon2/hi (1).mp3","vj_avgoon2/hi (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_avgoon2/hidegrenade (1).mp3","vj_avgoon2/hidegrenade (3).mp3","vj_avgoon2/hidegrenade (2).mp3","vj_avgoon2/hidegrenade (4).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_avgoon2/nofollow (1).mp3","vj_avgoon2/nofollow (2).mp3","vj_avgoon2/nofollow (3).mp3"}
ENT.B2SoundTbl_Pain = {"vj_avgoon2/pain (1).mp3","vj_avgoon2/pain (2).mp3","vj_avgoon2/pain (3).mp3","vj_avgoon2/pain (4).mp3","vj_avgoon2/pain (5).mp3","vj_avgoon2/pain (6).mp3","vj_avgoon2/pain (7).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_avgoon2/playerdamage (1).mp3","vj_avgoon2/playerdamage (2).mp3","vj_avgoon2/playerdamage (3).mp3"}

ENT.B3SoundTbl_Alert = {"vj_arm3/alert (1).mp3","vj_arm3/alert (2).mp3","vj_arm3/alert (3).mp3","vj_arm3/alert (4).mp3","vj_arm3/alert (5).mp3","vj_arm3/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_arm3/becomehos (1).mp3","vj_arm3/becomehos (2).mp3","vj_arm3/becomehos (3).mp3","vj_arm3/becomehos (4).mp3","vj_arm3/becomehos (5).mp3","vj_arm3/becomehos (6).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_arm3/bump (1).mp3","vj_arm3/bump (2).mp3","vj_arm3/bump (3).mp3","vj_arm3/bump (4).mp3","vj_arm3/bump (5).mp3","vj_arm3/bump (6).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_arm3/chat (1).mp3","vj_arm3/chat (2).mp3","vj_arm3/chat (3).mp3","vj_arm3/chat (4).mp3","vj_arm3/chat (5).mp3","vj_arm3/chat (6).mp3","vj_arm3/chat (7).mp3","vj_arm3/chat (8).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_arm3/combat (1).mp3","vj_arm3/combat (2).mp3","vj_arm3/combat (3).mp3","vj_arm3/combat (4).mp3","vj_arm3/combat (5).mp3","vj_arm3/combat (6).mp3","vj_arm3/combat (7).mp3","vj_arm3/combat (8).mp3","vj_arm3/combat (9).mp3","vj_arm3/combat (10).mp3"}
ENT.B3SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_arm3/follow (1).mp3","vj_arm3/follow (2).mp3","vj_arm3/follow (3).mp3","vj_arm3/follow (4).mp3","vj_arm3/follow (5).mp3","vj_arm3/follow (6).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_arm3/gotmedic (1).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_arm3/heal (1).mp3","vj_arm3/heal (2).mp3","vj_arm3/heal (3).mp3","vj_arm3/heal (4).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_arm3/hi (1).mp3","vj_arm3/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_arm3/hidegrenade (1).mp3","vj_arm3/hidegrenade (3).mp3","vj_arm3/hidegrenade (2).mp3","vj_arm3/hidegrenade (4).mp3","vj_arm3/hidegrenade (5).mp3","vj_arm3/hidegrenade (6).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_arm3/invest (1).mp3","vj_arm3/invest (2).mp3","vj_arm3/invest (3).mp3","vj_arm3/invest (4).mp3","vj_arm3/invest (5).mp3","vj_arm3/invest (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_arm3/kill (1).mp3","vj_arm3/kill (2).mp3","vj_arm3/kill (3).mp3","vj_arm3/kill (4).mp3","vj_arm3/kill (5).mp3","vj_arm3/kill (6).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_arm3/losthim (1).mp3","vj_arm3/losthim (2).mp3","vj_arm3/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_arm3/mandown (1).mp3","vj_arm3/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_arm3/nofollow (1).mp3","vj_arm3/nofollow (2).mp3","vj_arm3/nofollow (3).mp3","vj_arm3/nofollow (4).mp3"}
ENT.B3SoundTbl_Pain = {"vj_arm3/pain (1).mp3","vj_arm3/pain (2).mp3","vj_arm3/pain (3).mp3","vj_arm3/pain (4).mp3","vj_arm3/pain (5).mp3","vj_arm3/pain (6).mp3","vj_arm3/pain (7).mp3","vj_arm3/pain (8).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_arm3/playerdamage (1).mp3","vj_arm3/playerdamage (2).mp3","vj_arm3/playerdamage (3).mp3","vj_arm3/playerdamage (4).mp3","vj_arm3/playerdamage (5).mp3","vj_arm3/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_arm3/reload (1).mp3","vj_arm3/reload (2).mp3","vj_arm3/reload (3).mp3","vj_arm3/reload (4).mp3","vj_arm3/reload (5).mp3","vj_arm3/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_arm3/suppress (1).mp3","vj_arm3/suppress (2).mp3","vj_arm3/suppress (3).mp3","vj_arm3/suppress (4).mp3","vj_arm3/suppress (5).mp3","vj_arm3/suppress (6).mp3"}

ENT.B4SoundTbl_Alert = {"vj_arm2/alert (1).mp3","vj_arm2/alert (2).mp3","vj_arm2/alert (3).mp3","vj_arm2/alert (4).mp3","vj_arm2/alert (5).mp3","vj_arm2/alert (6).mp3","vj_arm2/alert (7).mp3","vj_arm2/alert (8).mp3","vj_arm2/alert (9).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_arm2/becomehos (1).mp3","vj_arm2/becomehos (2).mp3","vj_arm2/becomehos (3).mp3","vj_arm2/becomehos (4).mp3","vj_arm2/becomehos (5).mp3","vj_arm2/becomehos (6).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_arm2/bump (1).mp3","vj_arm2/bump (2).mp3","vj_arm2/bump (3).mp3","vj_arm2/bump (4).mp3","vj_arm2/bump (5).mp3","vj_arm2/bump (6).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_arm2/chat (1).mp3","vj_arm2/chat (3).mp3","vj_arm2/chat (4).mp3","vj_arm2/chat (5).mp3","vj_arm2/chat (6).mp3","vj_arm2/chat (8).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_arm2/combat (1).mp3","vj_arm2/combat (2).mp3","vj_arm2/combat (3).mp3","vj_arm2/combat (4).mp3","vj_arm2/combat (5).mp3","vj_arm2/combat (6).mp3","vj_arm2/combat (7).mp3","vj_arm2/combat (8).mp3","vj_arm2/combat (9).mp3"}
ENT.B4SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_arm2/follow (1).mp3","vj_arm2/follow (2).mp3","vj_arm2/follow (3).mp3","vj_arm2/follow (4).mp3","vj_arm2/follow (5).mp3","vj_arm2/follow (6).mp3","vj_arm2/follow (7).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_arm2/gotmedic (1).mp3"}
ENT.B4SoundTbl_OnPlayerSight = {"vj_arm2/hi (1).mp3","vj_arm2/hi (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_arm2/hidegrenade (1).mp3","vj_arm2/hidegrenade (3).mp3","vj_arm2/hidegrenade (2).mp3","vj_arm2/hidegrenade (4).mp3","vj_arm2/hidegrenade (5).mp3","vj_arm2/hidegrenade (6).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_arm2/invest (1).mp3","vj_arm2/invest (2).mp3","vj_arm2/invest (3).mp3","vj_arm2/invest (4).mp3","vj_arm2/invest (5).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_arm2/kill (1).mp3","vj_arm2/kill (2).mp3","vj_arm2/kill (3).mp3","vj_arm2/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_arm2/losthim (1).mp3","vj_arm2/losthim (2).mp3","vj_arm2/losthim (3).mp3","vj_arm2/losthim (4).mp3"}
ENT.B4SoundTbl_AllyDeath = {"vj_arm2/mandown (1).mp3","vj_arm2/mandown (2).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_arm2/nofollow (1).mp3","vj_arm2/nofollow (2).mp3","vj_arm2/nofollow (3).mp3"}
ENT.B4SoundTbl_Pain = {"vj_arm2/pain (1).mp3","vj_arm2/pain (2).mp3","vj_arm2/pain (3).mp3","vj_arm2/pain (4).mp3","vj_arm2/pain (5).mp3","vj_arm2/pain (6).mp3","vj_arm2/pain (7).mp3","vj_arm2/pain (8).mp3","vj_arm2/pain (9).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_arm2/playerdamage (1).mp3","vj_arm2/playerdamage (2).mp3","vj_arm2/playerdamage (3).mp3","vj_arm2/playerdamage (4).mp3","vj_arm2/playerdamage (5).mp3","vj_arm2/playerdamage (6).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_arm2/reload (1).mp3","vj_arm2/reload (2).mp3","vj_arm2/reload (3).mp3","vj_arm2/reload (4).mp3","vj_arm2/reload (5).mp3","vj_arm2/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_arm2/suppress (1).mp3","vj_arm2/suppress (2).mp3","vj_arm2/suppress (3).mp3","vj_arm2/suppress (4).mp3","vj_arm2/suppress (5).mp3","vj_arm2/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetBodygroup(1,math.random(3,8))
	self:SetBodygroup(2,math.random(3,6))
	self:SetBodygroup(3,math.random(1,1))
	self:SetBodygroup(4,math.random(0,3))
	end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,4)
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
		self.Model = {"models/sentry/sentrycag/northern/male_02.mdl","models/sentry/sentrycag/northern/male_04.mdl","models/sentry/sentrycag/northern/male_06.mdl","models/sentry/sentrycag/northern/male_07.mdl","models/sentry/sentrycag/northern/male_09.mdl"}
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
		self.Model = {"models/sentry/sentrycag/northern/male_02.mdl","models/sentry/sentrycag/northern/male_04.mdl","models/sentry/sentrycag/northern/male_06.mdl","models/sentry/sentrycag/northern/male_07.mdl","models/sentry/sentrycag/northern/male_09.mdl"}
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
		self.Model = {"models/sentry/sentrycag/northern/male_02.mdl","models/sentry/sentrycag/northern/male_04.mdl","models/sentry/sentrycag/northern/male_06.mdl","models/sentry/sentrycag/northern/male_07.mdl","models/sentry/sentrycag/northern/male_09.mdl"}
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
		self.Model = {"models/sentry/sentrycag/northern/male_02.mdl","models/sentry/sentrycag/northern/male_04.mdl","models/sentry/sentrycag/northern/male_06.mdl","models/sentry/sentrycag/northern/male_07.mdl","models/sentry/sentrycag/northern/male_09.mdl"}
		end	
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/