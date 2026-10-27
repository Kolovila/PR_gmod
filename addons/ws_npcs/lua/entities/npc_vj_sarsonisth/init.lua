AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 50 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_ARSONIST"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.CanThrowBackDetectedGrenades = true
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 10
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_senmolotov" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeAttackModel = "models/props_junk/garbage_glassbottle003a.mdl"
ENT.AnimTbl_GrenadeAttack = {"throw1"} -- Grenade Attack Animations


ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.B2SoundTbl_Alert = {"vj_rel2/alert (1).mp3","vj_rel2/alert (2).mp3","vj_rel2/alert (3).mp3","vj_rel2/alert (4).mp3","vj_rel2/alert (5).mp3","vj_rel2/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_rel2/becomehos (1).mp3","vj_rel2/becomehos (2).mp3","vj_rel2/becomehos (3).mp3","vj_rel2/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_rel2/bump (1).mp3","vj_rel2/bump (2).mp3","vj_rel2/bump (3).mp3","vj_rel2/bump (4).mp3","vj_rel2/bump (5).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_rel2/chat (1).mp3","vj_rel2/chat (2).mp3","vj_rel2/chat (3).mp3","vj_rel2/chat (4).mp3","vj_rel2/chat (5).mp3","vj_rel2/chat (6).mp3","vj_rel2/chat (7).mp3","vj_rel2/chat (8).mp3","vj_rel2/chat (9).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_rel2/combat (1).mp3","vj_rel2/combat (2).mp3","vj_rel2/combat (3).mp3","vj_rel2/combat (4).mp3","vj_rel2/combat (5).mp3","vj_rel2/combat (6).mp3","vj_rel2/combat (7).mp3","vj_rel2/combat (8).mp3","vj_rel2/combat (9).mp3","vj_rel2/combat (10).mp3","vj_rel2/combat (11).mp3"}
ENT.B2SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_rel2/follow (1).mp3","vj_rel2/follow (2).mp3","vj_rel2/follow (3).mp3","vj_rel2/follow (4).mp3","vj_rel2/follow (5).mp3","vj_rel2/follow (6).mp3","vj_rel2/follow (7).mp3","vj_rel2/follow (8).mp3","vj_rel2/follow (9).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_rel2/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_rel2/heal (1).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_rel2/hi (1).mp3","vj_rel2/hi (2).mp3","vj_rel2/hi (3).mp3","vj_rel2/hi (4).mp3","vj_rel2/hi (5).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_rel2/hidegrenade (1).mp3","vj_rel2/hidegrenade (3).mp3","vj_rel2/hidegrenade (2).mp3","vj_rel2/hidegrenade (4).mp3","vj_rel2/hidegrenade (5).mp3","vj_rel2/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_rel2/invest (1).mp3","vj_rel2/invest (2).mp3","vj_rel2/invest (3).mp3","vj_rel2/invest (4).mp3","vj_rel2/invest (5).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_rel2/kill (1).mp3","vj_rel2/kill (2).mp3","vj_rel2/kill (3).mp3","vj_rel2/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_rel2/losthim (1).mp3","vj_rel2/losthim (2).mp3","vj_rel2/losthim (3).mp3","vj_rel2/losthim (4).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_rel2/nofollow (1).mp3","vj_rel2/nofollow (2).mp3","vj_rel2/nofollow (3).mp3","vj_rel2/nofollow (4).mp3","vj_rel2/nofollow (5).mp3","vj_rel2/nofollow (6).mp3","vj_rel2/nofollow (7).mp3","vj_rel2/nofollow (8).mp3"}
ENT.B2SoundTbl_Pain = {"vj_rel2/pain (1).mp3","vj_rel2/pain (2).mp3","vj_rel2/pain (3).mp3","vj_rel2/pain (4).mp3","vj_rel2/pain (5).mp3","vj_rel2/pain (6).mp3","vj_rel2/pain (7).mp3","vj_rel2/pain (8).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_rel2/playerdamage (1).mp3","vj_rel2/playerdamage (2).mp3","vj_rel2/playerdamage (3).mp3","vj_rel2/playerdamage (4).mp3","vj_rel2/playerdamage (5).mp3","vj_rel2/playerdamage (6).mp3","vj_rel2/playerdamage (7).mp3","vj_rel2/playerdamage (8).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_rel2/reload (1).mp3","vj_rel2/reload (2).mp3","vj_rel2/reload (3).mp3","vj_rel2/reload (4).mp3","vj_rel2/reload (5).mp3","vj_rel2/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_rel2/suppress (1).mp3","vj_rel2/suppress (2).mp3","vj_rel2/suppress (3).mp3","vj_rel2/suppress (4).mp3","vj_rel2/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_rel3/alert (1).mp3","vj_rel3/alert (2).mp3","vj_rel3/alert (3).mp3","vj_rel3/alert (4).mp3","vj_rel3/alert (5).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_rel3/bump (1).mp3","vj_rel3/bump (2).mp3","vj_rel3/bump (3).mp3","vj_rel3/bump (4).mp3","vj_rel3/bump (5).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_rel3/chat (1).mp3","vj_rel3/chat (2).mp3","vj_rel3/chat (3).mp3","vj_rel3/chat (4).mp3","vj_rel3/chat (5).mp3","vj_rel3/chat (6).mp3","vj_rel3/chat (7).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_rel3/combat (1).mp3","vj_rel3/combat (2).mp3","vj_rel3/combat (3).mp3","vj_rel3/combat (4).mp3","vj_rel3/combat (5).mp3","vj_rel3/combat (6).mp3","vj_rel3/combat (7).mp3"}
ENT.B4SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_rel3/follow (1).mp3","vj_rel3/follow (2).mp3","vj_rel3/follow (3).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_rel3/gotmedic (1).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_rel3/heal (1).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_rel3/hi (1).mp3","vj_rel3/hi (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_rel3/hidegrenade (1).mp3","vj_rel3/hidegrenade (3).mp3","vj_rel3/hidegrenade (2).mp3","vj_rel3/hidegrenade (4).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_rel3/kill (1).mp3","vj_rel3/kill (2).mp3","vj_rel3/kill (3).mp3","vj_rel3/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_rel3/losthim (1).mp3","vj_rel3/losthim (2).mp3","vj_rel3/losthim (3).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_rel3/nofollow (1).mp3","vj_rel3/nofollow (2).mp3","vj_rel3/nofollow (3).mp3"}
ENT.B4SoundTbl_Pain = {"vj_rel3/pain (1).mp3","vj_rel3/pain (2).mp3","vj_rel3/pain (3).mp3","vj_rel3/pain (4).mp3","vj_rel3/pain (5).mp3","vj_rel3/pain (6).mp3","vj_rel3/pain (7).mp3","vj_rel3/pain (8).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_rel3/playerdamage (1).mp3","vj_rel3/playerdamage (2).mp3","vj_rel3/playerdamage (3).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_rel3/suppress (1).mp3","vj_rel3/suppress (2).mp3","vj_rel3/suppress (3).mp3","vj_rel3/suppress (4).mp3","vj_rel3/suppress (5).mp3"}


	function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,3)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
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
		self.Model = {"models/sentry/rednecks/hillbilly2g.mdl"}
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
		self.Model = {"models/sentry/sentrycag/cookies114.mdl"}
		end
		if randomvoice == 3 then
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
		self.Model = {"models/sentry/sentrycag/cookies114.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/