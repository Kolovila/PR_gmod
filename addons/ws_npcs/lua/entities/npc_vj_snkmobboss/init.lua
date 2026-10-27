AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_REDMAFIA_FRIENDLY","CLASS_CHINA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
	-- Common Classes Combine = CLASS_COMBINE  Zombie = CLASS_ZOMBIE  Antlions = CLASS_ANTLION  Xen = CLASS_XEN  Player Friendly = CLASS_PLAYER_ALLY 
ENT.PlayerFriendly = true
ENT.BloodColor = "Red"
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","pushplayer","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 20
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}

ENT.B4SoundTbl_Alert = {"vj_sennkmob1/alert (1).mp3","vj_sennkmob1/alert (2).mp3","vj_sennkmob1/alert (3).mp3","vj_sennkmob1/alert (4).mp3","vj_sennkmob1/alert (5).mp3","vj_sennkmob1/alert (6).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_sennkmob1/becomehos (1).mp3","vj_sennkmob1/becomehos (2).mp3","vj_sennkmob1/becomehos (3).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob1/bump (1).mp3","vj_sennkmob1/bump (2).mp3","vj_sennkmob1/bump (3).mp3","vj_sennkmob1/bump (4).mp3","vj_sennkmob1/bump (5).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_sennkmob1/chat (1).mp3","vj_sennkmob1/chat (2).mp3","vj_sennkmob1/chat (3).mp3","vj_sennkmob1/chat (4).mp3","vj_sennkmob1/chat (5).mp3","vj_sennkmob1/chat (6).mp3","vj_sennkmob1/chat (7).mp3","vj_sennkmob1/chat (8).mp3","vj_sennkmob1/chat (9).mp3","vj_sennkmob1/chat (10).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_sennkmob1/combat (1).mp3","vj_sennkmob1/combat (2).mp3","vj_sennkmob1/combat (3).mp3","vj_sennkmob1/combat (4).mp3","vj_sennkmob1/combat (5).mp3","vj_sennkmob1/combat (6).mp3","vj_sennkmob1/combat (7).mp3","vj_sennkmob1/combat (8).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_sennkmob1/follow (1).mp3","vj_sennkmob1/follow (2).mp3","vj_sennkmob1/follow (3).mp3","vj_sennkmob1/follow (4).mp3","vj_sennkmob1/follow (5).mp3","vj_sennkmob1/follow (6).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_sennkmob1/gotmedic (1).mp3","vj_sennkmob1/gotmedic (2).mp3","vj_sennkmob1/gotmedic (3).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_sennkmob1/heal (1).mp3","vj_sennkmob1/heal (2).mp3","vj_sennkmob1/heal (3).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_sennkmob1/hi (1).mp3","vj_sennkmob1/hi (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_sennkmob1/hidegrenade (1).mp3","vj_sennkmob1/hidegrenade (3).mp3","vj_sennkmob1/hidegrenade (2).mp3","vj_sennkmob1/hidegrenade (4).mp3","vj_sennkmob1/hidegrenade (5).mp3","vj_sennkmob1/hidegrenade (6).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_sennkmob1/invest (1).mp3","vj_sennkmob1/invest (2).mp3","vj_sennkmob1/invest (3).mp3","vj_sennkmob1/invest (4).mp3","vj_sennkmob1/invest (5).mp3","vj_sennkmob1/invest (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_sennkmob1/kill (1).mp3","vj_sennkmob1/kill (2).mp3","vj_sennkmob1/kill (3).mp3","vj_sennkmob1/kill (4).mp3","vj_sennkmob1/kill (5).mp3","vj_sennkmob1/kill (6).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_sennkmob1/losthim (1).mp3","vj_sennkmob1/losthim (2).mp3","vj_sennkmob1/losthim (3).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_sennkmob1/nofollow (1).mp3","vj_sennkmob1/nofollow (2).mp3","vj_sennkmob1/nofollow (3).mp3","vj_sennkmob1/nofollow (4).mp3","vj_sennkmob1/nofollow (5).mp3","vj_sennkmob1/nofollow (6).mp3"}
ENT.B4SoundTbl_Pain = {"vj_sennkmob1/pain (1).mp3","vj_sennkmob1/pain (2).mp3","vj_sennkmob1/pain (3).mp3","vj_sennkmob1/pain (4).mp3","vj_sennkmob1/pain (5).mp3","vj_sennkmob1/pain (6).mp3","vj_sennkmob1/pain (7).mp3","vj_sennkmob1/pain (8).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_sennkmob1/playerdamage (1).mp3","vj_sennkmob1/playerdamage (2).mp3","vj_sennkmob1/playerdamage (3).mp3","vj_sennkmob1/playerdamage (4).mp3","vj_sennkmob1/playerdamage (5).mp3","vj_sennkmob1/playerdamage (6).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_sennkmob1/reload (1).mp3","vj_sennkmob1/reload (2).mp3","vj_sennkmob1/reload (3).mp3","vj_sennkmob1/reload (4).mp3","vj_sennkmob1/reload (5).mp3","vj_sennkmob1/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_sennkmob1/suppress (1).mp3","vj_sennkmob1/suppress (2).mp3","vj_sennkmob1/suppress (3).mp3","vj_sennkmob1/suppress (4).mp3","vj_sennkmob1/suppress (5).mp3","vj_sennkmob1/suppress (6).mp3"}

ENT.B5SoundTbl_Alert = {"vj_sennkmob2/alert (1).mp3","vj_sennkmob2/alert (2).mp3","vj_sennkmob2/alert (3).mp3","vj_sennkmob2/alert (4).mp3","vj_sennkmob2/alert (5).mp3","vj_sennkmob2/alert (6).mp3"}
ENT.B5SoundTbl_BecomeEnemyToPlayer = {"vj_sennkmob2/becomehos (1).mp3","vj_sennkmob2/becomehos (2).mp3","vj_sennkmob2/becomehos (3).mp3"}
ENT.B5SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob2/bump (1).mp3","vj_sennkmob2/bump (2).mp3","vj_sennkmob2/bump (3).mp3","vj_sennkmob2/bump (4).mp3","vj_sennkmob2/bump (5).mp3"} 
ENT.B5SoundTbl_Idle = {"vj_sennkmob2/chat (1).mp3","vj_sennkmob2/chat (2).mp3","vj_sennkmob2/chat (3).mp3","vj_sennkmob2/chat (4).mp3","vj_sennkmob2/chat (5).mp3","vj_sennkmob2/chat (6).mp3","vj_sennkmob2/chat (7).mp3","vj_sennkmob2/chat (8).mp3","vj_sennkmob2/chat (9).mp3","vj_sennkmob2/chat (10).mp3"}
ENT.B5SoundTbl_CombatIdle = {"vj_sennkmob2/combat (1).mp3","vj_sennkmob2/combat (2).mp3","vj_sennkmob2/combat (3).mp3","vj_sennkmob2/combat (4).mp3","vj_sennkmob2/combat (5).mp3","vj_sennkmob2/combat (6).mp3","vj_sennkmob2/combat (7).mp3","vj_sennkmob2/combat (8).mp3"}
ENT.B5SoundTbl_FollowPlayer = {"vj_sennkmob2/follow (1).mp3","vj_sennkmob2/follow (2).mp3","vj_sennkmob2/follow (3).mp3","vj_sennkmob2/follow (4).mp3","vj_sennkmob2/follow (5).mp3","vj_sennkmob2/follow (6).mp3"}
ENT.B5SoundTbl_MedicReceiveHeal = {"vj_sennkmob2/gotmedic (1).mp3","vj_sennkmob2/gotmedic (2).mp3","vj_sennkmob2/gotmedic (3).mp3"}
ENT.B5SoundTbl_MedicBeforeHeal = {"vj_sennkmob2/heal (1).mp3","vj_sennkmob2/heal (2).mp3","vj_sennkmob2/heal (3).mp3"} 
ENT.B5SoundTbl_OnPlayerSight = {"vj_sennkmob2/hi (1).mp3","vj_sennkmob2/hi (2).mp3"}
ENT.B5SoundTbl_OnGrenadeSight = {"vj_sennkmob2/hidegrenade (1).mp3","vj_sennkmob2/hidegrenade (3).mp3","vj_sennkmob2/hidegrenade (2).mp3","vj_sennkmob2/hidegrenade (4).mp3","vj_sennkmob2/hidegrenade (5).mp3"}
ENT.B5SoundTbl_Investigate = {"vj_sennkmob2/invest (1).mp3","vj_sennkmob2/invest (2).mp3","vj_sennkmob2/invest (3).mp3","vj_sennkmob2/invest (4).mp3","vj_sennkmob2/invest (5).mp3","vj_sennkmob2/invest (6).mp3"}
ENT.B5SoundTbl_OnKilledEnemy = {"vj_sennkmob2/kill (1).mp3","vj_sennkmob2/kill (2).mp3","vj_sennkmob2/kill (3).mp3","vj_sennkmob2/kill (4).mp3","vj_sennkmob2/kill (5).mp3","vj_sennkmob2/kill (6).mp3"}
ENT.B5SoundTbl_LostEnemy = {"vj_sennkmob2/losthim (1).mp3","vj_sennkmob2/losthim (2).mp3","vj_sennkmob2/losthim (3).mp3"}
ENT.B5SoundTbl_UnFollowPlayer = {"vj_sennkmob2/nofollow (1).mp3","vj_sennkmob2/nofollow (2).mp3","vj_sennkmob2/nofollow (3).mp3","vj_sennkmob2/nofollow (4).mp3","vj_sennkmob2/nofollow (5).mp3","vj_sennkmob2/nofollow (6).mp3"}
ENT.B5SoundTbl_Pain = {"vj_sennkmob2/pain (1).mp3","vj_sennkmob2/pain (2).mp3","vj_sennkmob2/pain (3).mp3","vj_sennkmob2/pain (4).mp3","vj_sennkmob2/pain (5).mp3","vj_sennkmob2/pain (6).mp3","vj_sennkmob2/pain (7).mp3","vj_sennkmob2/pain (8).mp3"}
ENT.B5SoundTbl_DamageByPlayer = {"vj_sennkmob2/playerdamage (1).mp3","vj_sennkmob2/playerdamage (2).mp3","vj_sennkmob2/playerdamage (3).mp3","vj_sennkmob2/playerdamage (4).mp3","vj_sennkmob2/playerdamage (5).mp3","vj_sennkmob2/playerdamage (6).mp3"}
ENT.B5SoundTbl_WeaponReload = {"vj_sennkmob2/reload (1).mp3","vj_sennkmob2/reload (2).mp3","vj_sennkmob2/reload (3).mp3","vj_sennkmob2/reload (4).mp3","vj_sennkmob2/reload (5).mp3","vj_sennkmob2/reload (6).mp3"}
ENT.B5SoundTbl_Suppressing = {"vj_sennkmob2/suppress (1).mp3","vj_sennkmob2/suppress (2).mp3","vj_sennkmob2/suppress (3).mp3","vj_sennkmob2/suppress (4).mp3","vj_sennkmob2/suppress (5).mp3","vj_sennkmob2/suppress (6).mp3"}

ENT.B6SoundTbl_Alert = {"vj_sennkmob3/alert (1).mp3","vj_sennkmob3/alert (2).mp3","vj_sennkmob3/alert (3).mp3","vj_sennkmob3/alert (4).mp3","vj_sennkmob3/alert (5).mp3","vj_sennkmob3/alert (6).mp3"}
ENT.B6SoundTbl_BecomeEnemyToPlayer = {"vj_sennkmob3/becomehos (1).mp3","vj_sennkmob3/becomehos (2).mp3","vj_sennkmob3/becomehos (3).mp3"}
ENT.B6SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob3/bump (1).mp3","vj_sennkmob3/bump (2).mp3","vj_sennkmob3/bump (3).mp3","vj_sennkmob3/bump (4).mp3","vj_sennkmob3/bump (5).mp3"} 
ENT.B6SoundTbl_Idle = {"vj_sennkmob3/chat (1).mp3","vj_sennkmob3/chat (2).mp3","vj_sennkmob3/chat (3).mp3","vj_sennkmob3/chat (4).mp3","vj_sennkmob3/chat (5).mp3","vj_sennkmob3/chat (6).mp3","vj_sennkmob3/chat (7).mp3","vj_sennkmob3/chat (8).mp3","vj_sennkmob3/chat (9).mp3","vj_sennkmob3/chat (10).mp3"}
ENT.B6SoundTbl_CombatIdle = {"vj_sennkmob3/combat (1).mp3","vj_sennkmob3/combat (2).mp3","vj_sennkmob3/combat (3).mp3","vj_sennkmob3/combat (4).mp3","vj_sennkmob3/combat (5).mp3","vj_sennkmob3/combat (6).mp3","vj_sennkmob3/combat (7).mp3","vj_sennkmob3/combat (8).mp3"}
ENT.B6SoundTbl_FollowPlayer = {"vj_sennkmob3/follow (1).mp3","vj_sennkmob3/follow (2).mp3","vj_sennkmob3/follow (3).mp3","vj_sennkmob3/follow (4).mp3","vj_sennkmob3/follow (5).mp3","vj_sennkmob3/follow (6).mp3"}
ENT.B6SoundTbl_MedicReceiveHeal = {"vj_sennkmob3/gotmedic (1).mp3","vj_sennkmob3/gotmedic (2).mp3"}
ENT.B6SoundTbl_MedicBeforeHeal = {"vj_sennkmob3/heal (1).mp3","vj_sennkmob3/heal (2).mp3"} 
ENT.B6SoundTbl_OnPlayerSight = {"vj_sennkmob3/hi (1).mp3","vj_sennkmob3/hi (2).mp3"}
ENT.B6SoundTbl_OnGrenadeSight = {"vj_sennkmob3/hidegrenade (1).mp3","vj_sennkmob3/hidegrenade (3).mp3","vj_sennkmob3/hidegrenade (2).mp3","vj_sennkmob3/hidegrenade (4).mp3"}
ENT.B6SoundTbl_Investigate = {"vj_sennkmob3/invest (1).mp3","vj_sennkmob3/invest (2).mp3","vj_sennkmob3/invest (3).mp3","vj_sennkmob3/invest (4).mp3","vj_sennkmob3/invest (5).mp3"}
ENT.B6SoundTbl_OnKilledEnemy = {"vj_sennkmob3/kill (1).mp3","vj_sennkmob3/kill (2).mp3","vj_sennkmob3/kill (3).mp3","vj_sennkmob3/kill (4).mp3","vj_sennkmob3/kill (5).mp3"}
ENT.B6SoundTbl_LostEnemy = {"vj_sennkmob3/losthim (1).mp3","vj_sennkmob3/losthim (2).mp3","vj_sennkmob3/losthim (3).mp3"}
ENT.B6SoundTbl_UnFollowPlayer = {"vj_sennkmob3/nofollow (1).mp3","vj_sennkmob3/nofollow (2).mp3","vj_sennkmob3/nofollow (3).mp3","vj_sennkmob3/nofollow (4).mp3","vj_sennkmob3/nofollow (5).mp3","vj_sennkmob3/nofollow (6).mp3"}
ENT.B6SoundTbl_Pain = {"vj_sennkmob3/pain (1).mp3","vj_sennkmob3/pain (2).mp3","vj_sennkmob3/pain (3).mp3","vj_sennkmob3/pain (4).mp3","vj_sennkmob3/pain (5).mp3","vj_sennkmob3/pain (6).mp3","vj_sennkmob3/pain (7).mp3","vj_sennkmob3/pain (8).mp3"}
ENT.B6SoundTbl_DamageByPlayer = {"vj_sennkmob3/playerdamage (1).mp3","vj_sennkmob3/playerdamage (2).mp3","vj_sennkmob3/playerdamage (3).mp3","vj_sennkmob3/playerdamage (4).mp3","vj_sennkmob3/playerdamage (5).mp3","vj_sennkmob3/playerdamage (6).mp3"}
ENT.B6SoundTbl_WeaponReload = {"vj_sennkmob3/reload (1).mp3","vj_sennkmob3/reload (2).mp3","vj_sennkmob3/reload (3).mp3","vj_sennkmob3/reload (4).mp3","vj_sennkmob3/reload (5).mp3","vj_sennkmob3/reload (6).mp3"}
ENT.B6SoundTbl_Suppressing = {"vj_sennkmob3/suppress (1).mp3","vj_sennkmob3/suppress (2).mp3","vj_sennkmob3/suppress (3).mp3","vj_sennkmob3/suppress (4).mp3","vj_sennkmob3/suppress (5).mp3"}

ENT.B7SoundTbl_Alert = {"vj_sennkmob4/alert (1).mp3","vj_sennkmob4/alert (2).mp3","vj_sennkmob4/alert (3).mp3","vj_sennkmob4/alert (4).mp3","vj_sennkmob4/alert (5).mp3","vj_sennkmob4/alert (6).mp3"}
ENT.B7SoundTbl_BecomeEnemyToPlayer = {"vj_sennkmob4/becomehos (1).mp3","vj_sennkmob4/becomehos (2).mp3","vj_sennkmob4/becomehos (3).mp3"}
ENT.B7SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob4/bump (1).mp3","vj_sennkmob4/bump (2).mp3","vj_sennkmob4/bump (3).mp3","vj_sennkmob4/bump (4).mp3","vj_sennkmob4/bump (5).mp3"} 
ENT.B7SoundTbl_Idle = {"vj_sennkmob4/chat (1).mp3","vj_sennkmob4/chat (2).mp3","vj_sennkmob4/chat (3).mp3","vj_sennkmob4/chat (4).mp3","vj_sennkmob4/chat (5).mp3","vj_sennkmob4/chat (6).mp3","vj_sennkmob4/chat (7).mp3","vj_sennkmob4/chat (8).mp3","vj_sennkmob4/chat (9).mp3","vj_sennkmob4/chat (10).mp3"}
ENT.B7SoundTbl_CombatIdle = {"vj_sennkmob4/combat (1).mp3","vj_sennkmob4/combat (2).mp3","vj_sennkmob4/combat (3).mp3","vj_sennkmob4/combat (4).mp3","vj_sennkmob4/combat (5).mp3","vj_sennkmob4/combat (6).mp3","vj_sennkmob4/combat (7).mp3","vj_sennkmob4/combat (8).mp3"}
ENT.B7SoundTbl_FollowPlayer = {"vj_sennkmob4/follow (1).mp3","vj_sennkmob4/follow (2).mp3","vj_sennkmob4/follow (3).mp3","vj_sennkmob4/follow (4).mp3","vj_sennkmob4/follow (5).mp3","vj_sennkmob4/follow (6).mp3"}
ENT.B7SoundTbl_MedicReceiveHeal = {"vj_sennkmob4/gotmedic (1).mp3","vj_sennkmob4/gotmedic (2).mp3"}
ENT.B7SoundTbl_MedicBeforeHeal = {"vj_sennkmob4/heal (1).mp3","vj_sennkmob4/heal (2).mp3"} 
ENT.B7SoundTbl_OnPlayerSight = {"vj_sennkmob4/hi (1).mp3","vj_sennkmob4/hi (2).mp3"}
ENT.B7SoundTbl_OnGrenadeSight = {"vj_sennkmob4/hidegrenade (1).mp3","vj_sennkmob4/hidegrenade (3).mp3","vj_sennkmob4/hidegrenade (2).mp3","vj_sennkmob4/hidegrenade (4).mp3"}
ENT.B7SoundTbl_Investigate = {"vj_sennkmob4/invest (1).mp3","vj_sennkmob4/invest (2).mp3","vj_sennkmob4/invest (3).mp3","vj_sennkmob4/invest (4).mp3","vj_sennkmob4/invest (5).mp3"}
ENT.B7SoundTbl_OnKilledEnemy = {"vj_sennkmob4/kill (1).mp3","vj_sennkmob4/kill (2).mp3","vj_sennkmob4/kill (3).mp3","vj_sennkmob4/kill (4).mp3"}
ENT.B7SoundTbl_LostEnemy = {"vj_sennkmob4/losthim (1).mp3","vj_sennkmob4/losthim (2).mp3","vj_sennkmob4/losthim (3).mp3"}
ENT.B7SoundTbl_UnFollowPlayer = {"vj_sennkmob4/nofollow (1).mp3","vj_sennkmob4/nofollow (2).mp3","vj_sennkmob4/nofollow (3).mp3","vj_sennkmob4/nofollow (4).mp3","vj_sennkmob4/nofollow (5).mp3","vj_sennkmob4/nofollow (6).mp3"}
ENT.B7SoundTbl_Pain = {"vj_sennkmob4/pain (1).mp3","vj_sennkmob4/pain (2).mp3","vj_sennkmob4/pain (3).mp3","vj_sennkmob4/pain (4).mp3","vj_sennkmob4/pain (5).mp3","vj_sennkmob4/pain (6).mp3","vj_sennkmob4/pain (7).mp3","vj_sennkmob4/pain (8).mp3"}
ENT.B7SoundTbl_DamageByPlayer = {"vj_sennkmob4/playerdamage (1).mp3","vj_sennkmob4/playerdamage (2).mp3","vj_sennkmob4/playerdamage (3).mp3","vj_sennkmob4/playerdamage (4).mp3","vj_sennkmob4/playerdamage (5).mp3"}
ENT.B7SoundTbl_WeaponReload = {"vj_sennkmob4/reload (1).mp3","vj_sennkmob4/reload (2).mp3","vj_sennkmob4/reload (3).mp3","vj_sennkmob4/reload (4).mp3","vj_sennkmob4/reload (5).mp3"}
ENT.B7SoundTbl_Suppressing = {"vj_sennkmob4/suppress (1).mp3","vj_sennkmob4/suppress (2).mp3","vj_sennkmob4/suppress (3).mp3","vj_sennkmob4/suppress (4).mp3","vj_sennkmob4/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,6))
	self:SetBodygroup(1,math.random(5,5))
	self:SetBodygroup(2,math.random(2,2))
	self:SetBodygroup(3,math.random(3,3))
	self:SetBodygroup(4,math.random(0,1))
	self:SetBodygroup(5,math.random(2,2))
	if math.random(1,4) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(4,7)
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
		self.Model = {"models/sentry/sentrycag/nkgang/le/sentrynkgangmale5.mdl"}
	else
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
		self.Model = {"models/sentry/sentrycag/nkgang/le/sentrynkgangmale5.mdl"}
		end	
		if randomvoice == 5 then
		self.Race = "B5"
	
		self.SoundTbl_Idle = self.B5SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B5SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B5SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B5SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B5SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B5SoundTbl_Pain
		self.SoundTbl_Alert = self.B5SoundTbl_Alert
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
		self.Model = {"models/sentry/sentrycag/nkgang/le/sentrynkgangmale5.mdl"}
		end	
		if randomvoice == 6 then
		self.Race = "B6"
	
        self.SoundTbl_Pain = self.B6SoundTbl_Pain
		self.SoundTbl_Idle = self.B6SoundTbl_Idle
		self.SoundTbl_Alert = self.B6SoundTbl_Alert
		self.SoundTbl_LostEnemy = self.B6SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B6SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B6SoundTbl_CombatIdle
		self.SoundTbl_Suppressing = self.B6SoundTbl_Suppressing
        self.SoundTbl_Investigate = self.B6SoundTbl_Investigate
		self.SoundTbl_CallForHelp = self.B6SoundTbl_CallForHelp
        self.SoundTbl_FollowPlayer = self.B6SoundTbl_FollowPlayer
        self.SoundTbl_IdleDialogue = self.B6SoundTbl_IdleDialogue
		self.SoundTbl_WeaponReload = self.B6SoundTbl_WeaponReload
        self.SoundTbl_OnPlayerSight = self.B6SoundTbl_OnPlayerSight
		self.SoundTbl_OnKilledEnemy = self.B6SoundTbl_OnKilledEnemy
        self.SoundTbl_UnFollowPlayer = self.B6SoundTbl_UnFollowPlayer
        self.SoundTbl_DamageByPlayer = self.B6SoundTbl_DamageByPlayer
		self.SoundTbl_OnGrenadeSight = self.B6SoundTbl_OnGrenadeSight
        self.SoundTbl_MedicBeforeHeal = self.B6SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B6SoundTbl_MedicReceiveHeal
		self.SoundTbl_IdleDialogueAnswer = self.B6SoundTbl_IdleDialogueAnswer
        self.SoundTbl_BecomeEnemyToPlayer = self.B6SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B6SoundTbl_MoveOutOfPlayersWay
		self.Model = {"models/sentry/sentrycag/nkgang/le/sentrynkgangmale5.mdl"}
		end	
		if randomvoice == 7 then
		self.Race = "B7"
	
        self.SoundTbl_Pain = self.B7SoundTbl_Pain
		self.SoundTbl_Idle = self.B7SoundTbl_Idle
		self.SoundTbl_Alert = self.B7SoundTbl_Alert
		self.SoundTbl_LostEnemy = self.B7SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B7SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B7SoundTbl_CombatIdle
		self.SoundTbl_Suppressing = self.B7SoundTbl_Suppressing
        self.SoundTbl_Investigate = self.B7SoundTbl_Investigate
		self.SoundTbl_CallForHelp = self.B7SoundTbl_CallForHelp
        self.SoundTbl_FollowPlayer = self.B7SoundTbl_FollowPlayer
        self.SoundTbl_IdleDialogue = self.B7SoundTbl_IdleDialogue
		self.SoundTbl_WeaponReload = self.B7SoundTbl_WeaponReload
        self.SoundTbl_OnPlayerSight = self.B7SoundTbl_OnPlayerSight
		self.SoundTbl_OnKilledEnemy = self.B7SoundTbl_OnKilledEnemy
        self.SoundTbl_UnFollowPlayer = self.B7SoundTbl_UnFollowPlayer
        self.SoundTbl_DamageByPlayer = self.B7SoundTbl_DamageByPlayer
		self.SoundTbl_OnGrenadeSight = self.B7SoundTbl_OnGrenadeSight
        self.SoundTbl_MedicBeforeHeal = self.B7SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B7SoundTbl_MedicReceiveHeal
		self.SoundTbl_IdleDialogueAnswer = self.B7SoundTbl_IdleDialogueAnswer
        self.SoundTbl_BecomeEnemyToPlayer = self.B7SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B7SoundTbl_MoveOutOfPlayersWay
		self.Model = {"models/sentry/sentrycag/nkgang/le/sentrynkgangmale5.mdl"}
		end	
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/