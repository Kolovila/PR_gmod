AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 70 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_NATIONALIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"meleeattack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 20
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}

ENT.SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.B1SoundTbl_Idle = {"vj_pocivil1/chat (1).mp3","vj_pocivil1/chat (2).mp3","vj_pocivil1/chat (3).mp3","vj_pocivil1/chat (4).mp3"}
ENT.B1SoundTbl_Alert = {"vj_pocivil1/alert (1).mp3","vj_pocivil1/alert (2).mp3","vj_pocivil1/alert (3).mp3","vj_pocivil1/alert (4).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_pocivil1/combat (1).mp3","vj_pocivil1/combat (2).mp3","vj_pocivil1/combat (3).mp3","vj_pocivil1/combat (4).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_pocivil1/hidegrenade (1).mp3","vj_pocivil1/hidegrenade (2).mp3","vj_pocivil1/hidegrenade (3).mp3","vj_pocivil1/hidegrenade (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_pocivil1/pain (1).mp3","vj_pocivil1/pain (2).mp3","vj_pocivil1/pain (3).mp3","vj_pocivil1/pain (4).mp3","vj_pocivil1/pain (5).mp3","vj_pocivil1/pain (6).mp3","vj_pocivil1/pain (7).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_pocivil1/follow (1).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_pocivil1/nofollow (1).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_pocivil1/becomehos (1).mp3","vj_pocivil1/becomehos (2).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_pocivil1/hi (1).mp3","vj_pocivil1/hi (2).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_pocivil1/bump (1).mp3","vj_pocivil1/bump (2).mp3","vj_pocivil1/bump (3).mp3","vj_pocivil1/bump (4).mp3","vj_pocivil1/bump (5).mp3"} 
ENT.B1SoundTbl_DamageByPlayer = {"vj_pocivil1/playerdamage (1).mp3","vj_pocivil1/playerdamage (2).mp3","vj_pocivil1/playerdamage (3).mp3","vj_pocivil1/playerdamage (4).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_pocivil1/kill (1).mp3","vj_pocivil1/kill (2).mp3","vj_pocivil1/kill (3).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_pocivil1/losthim (1).mp3","vj_pocivil1/losthim (2).mp3","vj_pocivil1/losthim (3).mp3"}

ENT.B2SoundTbl_Idle = {"vj_pocivil2/chat (1).mp3","vj_pocivil2/chat (2).mp3","vj_pocivil2/chat (3).mp3","vj_pocivil2/chat (4).mp3","vj_pocivil2/chat (5).mp3","vj_pocivil2/chat (6).mp3"}
ENT.B2SoundTbl_Alert = {"vj_pocivil2/alert (1).mp3","vj_pocivil2/alert (2).mp3","vj_pocivil2/alert (3).mp3","vj_pocivil2/alert (4).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_pocivil2/combat (1).mp3","vj_pocivil2/combat (2).mp3","vj_pocivil2/combat (3).mp3","vj_pocivil2/combat (4).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_pocivil2/hidegrenade (1).mp3","vj_pocivil2/hidegrenade (2).mp3","vj_pocivil2/hidegrenade (3).mp3","vj_pocivil2/hidegrenade (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_pocivil2/pain (1).mp3","vj_pocivil2/pain (2).mp3","vj_pocivil2/pain (3).mp3","vj_pocivil2/pain (4).mp3","vj_pocivil2/pain (5).mp3","vj_pocivil2/pain (6).mp3","vj_pocivil2/pain (7).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_pocivil2/follow (1).mp3","vj_pocivil2/follow (2).mp3","vj_pocivil2/follow (3).mp3","vj_pocivil2/follow (4).mp3",}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_pocivil2/nofollow (1).mp3","vj_pocivil2/nofollow (2).mp3","vj_pocivil2/nofollow (3).mp3","vj_pocivil2/nofollow (4).mp3","vj_pocivil2/nofollow (5).mp3","vj_pocivil2/nofollow (6).mp3",}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_pocivil2/becomehos (1).mp3","vj_pocivil2/becomehos (2).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_pocivil2/hi (1).mp3","vj_pocivil2/hi (2).mp3","vj_pocivil2/hi (3).mp3","vj_pocivil2/hi (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_pocivil2/bump (1).mp3","vj_pocivil2/bump (2).mp3","vj_pocivil2/bump (3).mp3","vj_pocivil2/bump (4).mp3","vj_pocivil2/bump (5).mp3"} 
ENT.B2SoundTbl_DamageByPlayer = {"vj_pocivil2/playerdamage (1).mp3","vj_pocivil2/playerdamage (2).mp3","vj_pocivil2/playerdamage (3).mp3","vj_pocivil2/playerdamage (4).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_pocivil2/kill (1).mp3","vj_pocivil2/kill (2).mp3","vj_pocivil2/kill (3).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_pocivil2/losthim (1).mp3","vj_pocivil2/losthim (2).mp3","vj_pocivil2/losthim (3).mp3"}

ENT.B3SoundTbl_Alert = {"vj_pocivilb1/alert (1).mp3","vj_pocivilb1/alert (2).mp3","vj_pocivilb1/alert (3).mp3","vj_pocivilb1/alert (4).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_pocivilb1/combat (1).mp3","vj_pocivilb1/combat (2).mp3","vj_pocivilb1/combat (3).mp3","vj_pocivilb1/combat (4).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_pocivilb1/hidegrenade (1).mp3","vj_pocivilb1/hidegrenade (2).mp3","vj_pocivilb1/hidegrenade (3).mp3","vj_pocivilb1/hidegrenade (4).mp3"}
ENT.B3SoundTbl_Pain = {"vj_pocivilb1/pain (1).mp3","vj_pocivilb1/pain (2).mp3","vj_pocivilb1/pain (3).mp3","vj_pocivilb1/pain (4).mp3","vj_pocivilb1/pain (5).mp3","vj_pocivilb1/pain (6).mp3","vj_pocivilb1/pain (7).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_pocivilb1/follow (1).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_pocivilb1/nofollow (1).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_pocivilb1/becomehos (1).mp3","vj_pocivilb1/becomehos (2).mp3"}
ENT.B3SoundTbl_OnPlayerSight = {"vj_pocivilb1/hi (1).mp3","vj_pocivilb1/hi (2).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_pocivilb1/bump (1).mp3","vj_pocivilb1/bump (2).mp3","vj_pocivilb1/bump (3).mp3","vj_pocivilb1/bump (4).mp3","vj_pocivilb1/bump (5).mp3"} 
ENT.B3SoundTbl_DamageByPlayer = {"vj_pocivilb1/playerdamage (1).mp3","vj_pocivilb1/playerdamage (2).mp3","vj_pocivilb1/playerdamage (3).mp3","vj_pocivilb1/playerdamage (4).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_pocivilb1/kill (1).mp3","vj_pocivilb1/kill (2).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_pocivilb1/losthim (1).mp3","vj_pocivilb1/losthim (2).mp3"}

ENT.B4SoundTbl_Idle = {"vj_pocivilb2/chat (1).mp3","vj_pocivilb2/chat (2).mp3","vj_pocivilb2/chat (3).mp3","vj_pocivilb2/chat (4).mp3","vj_pocivilb2/chat (5).mp3"}
ENT.B4SoundTbl_Alert = {"vj_pocivilb2/alert (1).mp3","vj_pocivilb2/alert (2).mp3","vj_pocivilb2/alert (3).mp3","vj_pocivilb2/alert (4).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_pocivilb2/combat (1).mp3","vj_pocivilb2/combat (2).mp3","vj_pocivilb2/combat (3).mp3","vj_pocivilb2/combat (4).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_pocivilb2/hidegrenade (1).mp3","vj_pocivilb2/hidegrenade (2).mp3","vj_pocivilb2/hidegrenade (3).mp3","vj_pocivilb2/hidegrenade (4).mp3"}
ENT.B4SoundTbl_Pain = {"vj_pocivilb2/pain (1).mp3","vj_pocivilb2/pain (2).mp3","vj_pocivilb2/pain (3).mp3","vj_pocivilb2/pain (4).mp3","vj_pocivilb2/pain (5).mp3","vj_pocivilb2/pain (6).mp3","vj_pocivilb2/pain (7).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_pocivilb2/follow (1).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_pocivilb2/nofollow (1).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_pocivilb2/becomehos (1).mp3","vj_pocivilb2/becomehos (2).mp3"}
ENT.B4SoundTbl_OnPlayerSight = {"vj_pocivilb2/hi (1).mp3","vj_pocivilb2/hi (2).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_pocivilb2/bump (1).mp3","vj_pocivilb2/bump (2).mp3","vj_pocivilb2/bump (3).mp3","vj_pocivilb2/bump (4).mp3","vj_pocivilb2/bump (5).mp3","vj_pocivilb2/bump (6).mp3"} 
ENT.B4SoundTbl_DamageByPlayer = {"vj_pocivilb2/playerdamage (1).mp3","vj_pocivilb2/playerdamage (2).mp3","vj_pocivilb2/playerdamage (3).mp3","vj_pocivilb2/playerdamage (4).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_pocivilb2/kill (1).mp3","vj_pocivilb2/kill (2).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_pocivilb2/losthim (1).mp3","vj_pocivilb2/losthim (2).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(1,math.random(0,3))
	self:SetBodygroup(2,math.random(0,1))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,0))
	self:SetBodygroup(5,math.random(0,0))
	self:SetBodygroup(6,math.random(0,0))
	self:SetBodygroup(7,math.random(1,3))
	self:SetBodygroup(8,math.random(1,2))
	end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,4)
	if randomvoice == 1 then
		self.Race = "B1"
	
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
		self.Model = {"models/sentry/sentrycag/ultranation/male_06.mdl","models/sentry/sentrycag/ultranation/male_08.mdl"}
	else
	if randomvoice == 2 then
		self.Race = "B2"
	
		self.SoundTbl_Idle = self.B2SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/ultranation/male_02.mdl","models/sentry/sentrycag/ultranation/male_04.mdl","models/sentry/sentrycag/ultranation/male_07.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
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
		self.Model = {"models/sentry/sentrycag/ultranation/male_01.mdl","models/sentry/sentrycag/ultranation/male_03.mdl"}
		end
		if randomvoice == 4 then
		self.Race = "B4"
	
		self.SoundTbl_Idle = self.B4SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B4SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B4SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B4SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B4SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B4SoundTbl_Alert
        self.SoundTbl_BecomeEnemyToPlayer = self.B4SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B4SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_Pain = self.B4SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/ultranation/male_01.mdl","models/sentry/sentrycag/ultranation/male_03.mdl"}
		end	
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/