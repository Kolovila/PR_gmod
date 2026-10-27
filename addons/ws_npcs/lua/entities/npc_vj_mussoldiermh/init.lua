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
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_merryguard/alert (1).mp3","vj_merryguard/alert (2).mp3","vj_merryguard/alert (3).mp3","vj_merryguard/alert (4).mp3","vj_merryguard/alert (5).mp3","vj_merryguard/alert (6).mp3","vj_merryguard/alert (7).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_merryguard/becomehos (1).mp3","vj_merryguard/becomehos (2).mp3","vj_merryguard/becomehos (3).mp3","vj_merryguard/becomehos (4).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_merryguard/bump (1).mp3","vj_merryguard/bump (2).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_merryguard/chat (1).mp3","vj_merryguard/chat (2).mp3","vj_merryguard/chat (3).mp3","vj_merryguard/chat (5).mp3","vj_merryguard/chat (6).mp3","vj_merryguard/chat (7).mp3","vj_merryguard/chat (8).mp3","vj_merryguard/chat (9).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_merryguard/combat (1).mp3","vj_merryguard/combat (2).mp3","vj_merryguard/combat (3).mp3","vj_merryguard/combat (4).mp3","vj_merryguard/combat (5).mp3","vj_merryguard/combat (6).mp3","vj_merryguard/combat (7).mp3","vj_merryguard/combat (8).mp3","vj_merryguard/combat (9).mp3","vj_merryguard/combat (10).mp3"}
ENT.B1SoundTbl_Death = {"vj_merryguard/died (1).mp3","vj_merryguard/died (2).mp3","vj_merryguard/died (3).mp3","vj_merryguard/died (4).mp3","vj_merryguard/died (5).mp3","vj_merryguard/died (6).mp3","vj_merryguard/died (7).mp3","vj_merryguard/died (8).mp3","vj_merryguard/died (9).mp3","vj_merryguard/died (10).mp3","vj_merryguard/died (11).mp3","vj_merryguard/died (12).mp3","vj_merryguard/died (13).mp3","vj_merryguard/died (14).mp3",}
ENT.B1SoundTbl_FollowPlayer = {"vj_merryguard/follow (1).mp3","vj_merryguard/follow (2).mp3","vj_merryguard/follow (3).mp3","vj_merryguard/follow (4).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_merryguard/gotmedic (1).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_merryguard/heal (1).mp3","vj_merryguard/heal (2).mp3","vj_merryguard/heal (3).mp3"} 
ENT.B1SoundTbl_OnPlayerSight = {"vj_merryguard/hi (1).mp3","vj_merryguard/hi (2).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_merryguard/hidegrenade (1).mp3","vj_merryguard/hidegrenade (3).mp3","vj_merryguard/hidegrenade (2).mp3","vj_merryguard/hidegrenade (4).mp3","vj_merryguard/hidegrenade (5).mp3","vj_merryguard/hidegrenade (6).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_merryguard/invest (1).mp3","vj_merryguard/invest (2).mp3","vj_merryguard/invest (3).mp3","vj_merryguard/invest (4).mp3","vj_merryguard/invest (5).mp3",}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_merryguard/kill (1).mp3","vj_merryguard/kill (2).mp3","vj_merryguard/kill (3).mp3","vj_merryguard/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_merryguard/losthim (1).mp3","vj_merryguard/losthim (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_merryguard/nofollow (1).mp3","vj_merryguard/nofollow (2).mp3","vj_merryguard/nofollow (3).mp3","vj_merryguard/nofollow (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_merryguard/pain (1).mp3","vj_merryguard/pain (2).mp3","vj_merryguard/pain (3).mp3","vj_merryguard/pain (4).mp3","vj_merryguard/pain (5).mp3","vj_merryguard/pain (6).mp3","vj_merryguard/pain (7).mp3","vj_merryguard/pain (8).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_merryguard/playerdamage (1).mp3","vj_merryguard/playerdamage (2).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_merryguard/reload (1).mp3","vj_merryguard/reload (2).mp3","vj_merryguard/reload (3).mp3","vj_merryguard/reload (4).mp3","vj_merryguard/reload (5).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_merryguard/suppress (1).mp3","vj_merryguard/suppress (2).mp3","vj_merryguard/suppress (3).mp3","vj_merryguard/suppress (4).mp3","vj_merryguard/suppress (5).mp3"}

ENT.B2SoundTbl_Alert = {"vj_merryla1/alert (1).mp3","vj_merryla1/alert (2).mp3","vj_merryla1/alert (3).mp3","vj_merryla1/alert (4).mp3","vj_merryla1/alert (5).mp3","vj_merryla1/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_merryla1/becomehos (1).mp3","vj_merryla1/becomehos (2).mp3","vj_merryla1/becomehos (3).mp3","vj_merryla1/becomehos (4).mp3","vj_merryla1/becomehos (5).mp3","vj_merryla1/becomehos (6).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_merryla1/bump (1).mp3","vj_merryla1/bump (2).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_merryla1/chat (1).mp3","vj_merryla1/chat (2).mp3","vj_merryla1/chat (3).mp3","vj_merryla1/chat (4).mp3","vj_merryla1/chat (5).mp3","vj_merryla1/chat (6).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_merryla1/combat (1).mp3","vj_merryla1/combat (2).mp3","vj_merryla1/combat (3).mp3","vj_merryla1/combat (4).mp3","vj_merryla1/combat (5).mp3","vj_merryla1/combat (6).mp3","vj_merryla1/combat (7).mp3","vj_merryla1/combat (8).mp3","vj_merryla1/combat (9).mp3","vj_merryla1/combat (10).mp3","vj_merryla1/combat (11).mp3","vj_merryla1/combat (12).mp3","vj_merryla1/combat (13).mp3"}
ENT.B2SoundTbl_Death = {"vj_merryguard/died (1).mp3","vj_merryguard/died (2).mp3","vj_merryguard/died (3).mp3","vj_merryguard/died (4).mp3","vj_merryguard/died (5).mp3","vj_merryguard/died (6).mp3","vj_merryguard/died (7).mp3","vj_merryguard/died (8).mp3","vj_merryguard/died (9).mp3","vj_merryguard/died (10).mp3","vj_merryguard/died (11).mp3","vj_merryguard/died (12).mp3","vj_merryguard/died (13).mp3","vj_merryguard/died (14).mp3",}
ENT.B2SoundTbl_FollowPlayer = {"vj_merryla1/follow (1).mp3","vj_merryla1/follow (2).mp3","vj_merryla1/follow (3).mp3","vj_merryla1/follow (4).mp3","vj_merryla1/follow (5).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_merryla1/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_merryla1/heal (1).mp3","vj_merryla1/heal (2).mp3","vj_merryla1/heal (3).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_merryla1/hi (1).mp3","vj_merryla1/hi (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_merryla1/hidegrenade (1).mp3","vj_merryla1/hidegrenade (3).mp3","vj_merryla1/hidegrenade (2).mp3","vj_merryla1/hidegrenade (4).mp3","vj_merryla1/hidegrenade (5).mp3","vj_merryla1/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_merryla1/invest (1).mp3","vj_merryla1/invest (2).mp3","vj_merryla1/invest (3).mp3","vj_merryla1/invest (4).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_merryla1/kill (1).mp3","vj_merryla1/kill (2).mp3","vj_merryla1/kill (3).mp3","vj_merryla1/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_merryla1/losthim (1).mp3","vj_merryla1/losthim (2).mp3","vj_merryla1/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_merryla1/mandown (1).mp3","vj_merryla1/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_merryla1/nofollow (1).mp3","vj_merryla1/nofollow (2).mp3","vj_merryla1/nofollow (3).mp3","vj_merryla1/nofollow (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_merryla1/pain (1).mp3","vj_merryla1/pain (2).mp3","vj_merryla1/pain (3).mp3","vj_merryla1/pain (4).mp3","vj_merryla1/pain (5).mp3","vj_merryla1/pain (6).mp3","vj_merryla1/pain (7).mp3","vj_merryla1/pain (8).mp3","vj_merryla1/pain (9).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_merryla1/playerdamage (1).mp3","vj_merryla1/playerdamage (2).mp3","vj_merryla1/playerdamage (3).mp3","vj_merryla1/playerdamage (4).mp3","vj_merryla1/playerdamage (5).mp3","vj_merryla1/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_merryla1/reload (1).mp3","vj_merryla1/reload (2).mp3","vj_merryla1/reload (3).mp3","vj_merryla1/reload (4).mp3","vj_merryla1/reload (5).mp3","vj_merryla1/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_merryla1/suppress (1).mp3","vj_merryla1/suppress (2).mp3","vj_merryla1/suppress (3).mp3","vj_merryla1/suppress (4).mp3","vj_merryla1/suppress (5).mp3"}

ENT.B3SoundTbl_Alert = {"vj_merryopaf/alert (1).mp3","vj_merryopaf/alert (2).mp3","vj_merryopaf/alert (3).mp3","vj_merryopaf/alert (4).mp3","vj_merryopaf/alert (5).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_merryopaf/becomehos (1).mp3","vj_merryopaf/becomehos (2).mp3","vj_merryopaf/becomehos (3).mp3","vj_merryopaf/becomehos (4).mp3","vj_merryopaf/becomehos (5).mp3","vj_merryopaf/becomehos (6).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_merryopaf/bump (1).mp3","vj_merryopaf/bump (2).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_merryopaf/chat (1).mp3","vj_merryopaf/chat (2).mp3","vj_merryopaf/chat (3).mp3","vj_merryopaf/chat (4).mp3","vj_merryopaf/chat (5).mp3","vj_merryopaf/chat (6).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_merryopaf/combat (1).mp3","vj_merryopaf/combat (2).mp3","vj_merryopaf/combat (3).mp3","vj_merryopaf/combat (4).mp3","vj_merryopaf/combat (5).mp3","vj_merryopaf/combat (6).mp3","vj_merryopaf/combat (7).mp3","vj_merryopaf/combat (8).mp3","vj_merryopaf/combat (9).mp3","vj_merryopaf/combat (10).mp3","vj_merryopaf/combat (11).mp3","vj_merryopaf/combat (12).mp3"}
ENT.B3SoundTbl_Death = {"vj_merryopaf/died (1).mp3","vj_merryopaf/died (2).mp3","vj_merryopaf/died (3).mp3","vj_merryopaf/died (4).mp3","vj_merryopaf/died (5).mp3","vj_merryopaf/died (6).mp3","vj_merryopaf/died (7).mp3","vj_merryopaf/died (8).mp3","vj_merryopaf/died (9).mp3","vj_merryopaf/died (10).mp3","vj_merryopaf/died (11).mp3","vj_merryopaf/died (12).mp3","vj_merryopaf/died (13).mp3","vj_merryopaf/died (14).mp3",}
ENT.B3SoundTbl_FollowPlayer = {"vj_merryopaf/follow (1).mp3","vj_merryopaf/follow (2).mp3","vj_merryopaf/follow (3).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_merryopaf/gotmedic (1).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_merryopaf/heal (1).mp3","vj_merryopaf/heal (2).mp3","vj_merryopaf/heal (3).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_merryopaf/hi (1).mp3","vj_merryopaf/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_merryopaf/hidegrenade (1).mp3","vj_merryopaf/hidegrenade (3).mp3","vj_merryopaf/hidegrenade (2).mp3","vj_merryopaf/hidegrenade (4).mp3","vj_merryopaf/hidegrenade (5).mp3","vj_merryopaf/hidegrenade (6).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_merryopaf/invest (1).mp3","vj_merryopaf/invest (2).mp3","vj_merryopaf/invest (3).mp3","vj_merryopaf/invest (4).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_merryopaf/kill (1).mp3","vj_merryopaf/kill (2).mp3","vj_merryopaf/kill (3).mp3","vj_merryopaf/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_merryopaf/losthim (1).mp3","vj_merryopaf/losthim (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_merryopaf/nofollow (1).mp3","vj_merryopaf/nofollow (2).mp3","vj_merryopaf/nofollow (3).mp3","vj_merryopaf/nofollow (4).mp3"}
ENT.B3SoundTbl_Pain = {"vj_merryopaf/pain (1).mp3","vj_merryopaf/pain (2).mp3","vj_merryopaf/pain (3).mp3","vj_merryopaf/pain (4).mp3","vj_merryopaf/pain (5).mp3","vj_merryopaf/pain (6).mp3","vj_merryopaf/pain (7).mp3","vj_merryopaf/pain (8).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_merryopaf/playerdamage (1).mp3","vj_merryopaf/playerdamage (2).mp3","vj_merryopaf/playerdamage (8).mp3","vj_merryopaf/playerdamage (7).mp3","vj_merryopaf/playerdamage (3).mp3","vj_merryopaf/playerdamage (4).mp3","vj_merryopaf/playerdamage (5).mp3","vj_merryopaf/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_merryopaf/reload (1).mp3","vj_merryopaf/reload (2).mp3","vj_merryopaf/reload (3).mp3","vj_merryopaf/reload (4).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_merryopaf/suppress (1).mp3","vj_merryopaf/suppress (2).mp3","vj_merryopaf/suppress (3).mp3","vj_merryopaf/suppress (4).mp3","vj_merryopaf/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_merryhu/alert (1).mp3","vj_merryhu/alert (2).mp3","vj_merryhu/alert (3).mp3","vj_merryhu/alert (4).mp3","vj_merryhu/alert (5).mp3","vj_merryhu/alert (6).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_merryhu/becomehos (1).mp3","vj_merryhu/becomehos (2).mp3","vj_merryhu/becomehos (3).mp3","vj_merryhu/becomehos (4).mp3","vj_merryhu/becomehos (5).mp3","vj_merryhu/becomehos (6).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_merryhu/bump (1).mp3","vj_merryhu/bump (2).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_merryhu/chat (1).mp3","vj_merryhu/chat (2).mp3","vj_merryhu/chat (3).mp3","vj_merryhu/chat (4).mp3","vj_merryhu/chat (5).mp3","vj_merryhu/chat (6).mp3","vj_merryhu/chat (7).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_merryhu/combat (1).mp3","vj_merryhu/combat (2).mp3","vj_merryhu/combat (3).mp3","vj_merryhu/combat (4).mp3","vj_merryhu/combat (5).mp3","vj_merryhu/combat (6).mp3","vj_merryhu/combat (7).mp3","vj_merryhu/combat (8).mp3","vj_merryhu/combat (9).mp3","vj_merryhu/combat (10).mp3","vj_merryhu/combat (11).mp3","vj_merryhu/combat (12).mp3","vj_merryhu/combat (13).mp3"}
ENT.B4SoundTbl_Death = {"vj_merryhu/died (1).mp3","vj_merryhu/died (2).mp3","vj_merryhu/died (3).mp3","vj_merryhu/died (4).mp3","vj_merryhu/died (5).mp3","vj_merryguard/died (6).mp3","vj_merryhu/died (7).mp3","vj_merryhu/died (8).mp3","vj_merryhu/died (9).mp3","vj_merryhu/died (10).mp3","vj_merryhu/died (11).mp3","vj_merryhu/died (12).mp3","vj_merryhu/died (13).mp3","vj_merryhu/died (14).mp3",}
ENT.B4SoundTbl_FollowPlayer = {"vj_merryhu/follow (1).mp3","vj_merryhu/follow (2).mp3","vj_merryhu/follow (3).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_merryhu/gotmedic (1).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_merryhu/heal (1).mp3","vj_merryhu/heal (2).mp3","vj_merryhu/heal (3).mp3","vj_merryhu/heal (4).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_merryhu/hi (1).mp3","vj_merryhu/hi (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_merryhu/hidegrenade (1).mp3","vj_merryhu/hidegrenade (3).mp3","vj_merryhu/hidegrenade (2).mp3","vj_merryhu/hidegrenade (4).mp3","vj_merryhu/hidegrenade (5).mp3","vj_merryhu/hidegrenade (6).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_merryhu/invest (1).mp3","vj_merryhu/invest (2).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_merryhu/kill (1).mp3","vj_merryhu/kill (2).mp3","vj_merryhu/kill (3).mp3","vj_merryhu/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_merryhu/losthim (1).mp3","vj_merryhu/losthim (2).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_merryhu/nofollow (1).mp3","vj_merryhu/nofollow (2).mp3","vj_merryhu/nofollow (3).mp3","vj_merryhu/nofollow (4).mp3"}
ENT.B4SoundTbl_Pain = {"vj_merryhu/pain (1).mp3","vj_merryhu/pain (2).mp3","vj_merryhu/pain (3).mp3","vj_merryhu/pain (4).mp3","vj_merryhu/pain (5).mp3","vj_merryhu/pain (6).mp3","vj_merryhu/pain (7).mp3","vj_merryhu/pain (8).mp3","vj_merryhu/pain (9).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_merryhu/playerdamage (1).mp3","vj_merryhu/playerdamage (2).mp3","vj_merryhu/playerdamage (3).mp3","vj_merryhu/playerdamage (4).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_merryhu/reload (1).mp3","vj_merryhu/reload (2).mp3","vj_merryhu/reload (3).mp3","vj_merryhu/reload (4).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_merryhu/suppress (1).mp3","vj_merryhu/suppress (2).mp3","vj_merryhu/suppress (3).mp3","vj_merryhu/suppress (4).mp3","vj_merryhu/suppress (5).mp3"}

ENT.B5SoundTbl_Alert = {"vj_soll/alert (1).mp3","vj_soll/alert (2).mp3","vj_soll/alert (3).mp3","vj_soll/alert (4).mp3","vj_soll/alert (5).mp3","vj_soll/alert (6).mp3"}
ENT.B5SoundTbl_BecomeEnemyToPlayer = {"vj_soll/becomehos (1).mp3","vj_soll/becomehos (2).mp3","vj_soll/becomehos (5).mp3"}
ENT.B5SoundTbl_MoveOutOfPlayersWay = {"vj_soll/bump (1).mp3","vj_soll/bump (2).mp3","vj_soll/bump (3).mp3","vj_soll/bump (4).mp3","vj_soll/bump (5).mp3"} 
ENT.B5SoundTbl_Idle = {"vj_soll/chat (1).mp3","vj_soll/chat (2).mp3","vj_soll/chat (3).mp3","vj_soll/chat (4).mp3","vj_soll/chat (5).mp3","vj_soll/chat (6).mp3","vj_soll/chat (7).mp3","vj_soll/chat (8).mp3"}
ENT.B5SoundTbl_CombatIdle = {"vj_soll/combat (1).mp3","vj_soll/combat (2).mp3","vj_soll/combat (3).mp3","vj_soll/combat (4).mp3","vj_soll/combat (5).mp3","vj_soll/combat (6).mp3","vj_soll/combat (7).mp3","vj_soll/combat (8).mp3","vj_soll/combat (9).mp3","vj_soll/combat (10).mp3"}
ENT.B5SoundTbl_Death = {"vj_merryguard/died (1).mp3","vj_merryguard/died (2).mp3","vj_merryguard/died (3).mp3","vj_merryguard/died (4).mp3","vj_merryguard/died (5).mp3","vj_merryguard/died (6).mp3","vj_merryguard/died (7).mp3","vj_merryguard/died (8).mp3","vj_merryguard/died (9).mp3","vj_merryguard/died (10).mp3","vj_merryguard/died (11).mp3","vj_merryguard/died (12).mp3","vj_merryguard/died (13).mp3","vj_merryguard/died (14).mp3",}
ENT.B5SoundTbl_FollowPlayer = {"vj_soll/follow (1).mp3","vj_soll/follow (2).mp3","vj_soll/follow (3).mp3","vj_soll/follow (4).mp3","vj_soll/follow (5).mp3","vj_soll/follow (6).mp3"}
ENT.B5SoundTbl_MedicReceiveHeal = {"vj_soll/gotmedic (1).mp3"}
ENT.B5SoundTbl_GrenadeAttack = {"vj_soll/grenade (1).mp3","vj_soll/grenade (2).mp3","vj_soll/grenade (3).mp3","vj_soll/grenade (4).mp3",}
ENT.B5SoundTbl_MedicBeforeHeal = {"vj_soll/heal (1).mp3","vj_soll/heal (2).mp3","vj_soll/heal (3).mp3","vj_soll/heal (4).mp3"} 
ENT.B5SoundTbl_OnPlayerSight = {"vj_soll/hi (1).mp3","vj_soll/hi (2).mp3","vj_soll/hi (3).mp3","vj_soll/hi (4).mp3"}
ENT.B5SoundTbl_OnGrenadeSight = {"vj_soll/hidegrenade (1).mp3","vj_soll/hidegrenade (3).mp3","vj_soll/hidegrenade (2).mp3","vj_soll/hidegrenade (4).mp3","vj_soll/hidegrenade (5).mp3","vj_soll/hidegrenade (6).mp3"}
ENT.B5SoundTbl_OnKilledEnemy = {"vj_soll/kill (1).mp3","vj_soll/kill (2).mp3","vj_soll/kill (3).mp3","vj_soll/kill (4).mp3"}
ENT.B5SoundTbl_LostEnemy = {"vj_soll/losthim (1).mp3","vj_soll/losthim (2).mp3","vj_soll/losthim (3).mp3"}
ENT.B5SoundTbl_AllyDeath = {"vj_soll/mandown (1).mp3","vj_soll/mandown (2).mp3"}
ENT.B5SoundTbl_UnFollowPlayer = {"vj_soll/nofollow (1).mp3","vj_soll/nofollow (2).mp3","vj_soll/nofollow (3).mp3","vj_soll/nofollow (4).mp3","vj_soll/nofollow (5).mp3"}
ENT.B5SoundTbl_Pain = {"vj_soll/pain (1).mp3","vj_soll/pain (2).mp3","vj_soll/pain (3).mp3","vj_soll/pain (4).mp3","vj_soll/pain (5).mp3","vj_soll/pain (6).mp3","vj_soll/pain (7).mp3","vj_soll/pain (8).mp3"}
ENT.B5SoundTbl_DamageByPlayer = {"vj_soll/playerdamage (1).mp3","vj_soll/playerdamage (2).mp3","vj_soll/playerdamage (3).mp3","vj_soll/playerdamage (4).mp3","vj_soll/playerdamage (5).mp3","vj_soll/playerdamage (6).mp3","vj_soll/playerdamage (7).mp3"}
ENT.B5SoundTbl_WeaponReload = {"vj_soll/reload (1).mp3","vj_soll/reload (2).mp3","vj_soll/reload (3).mp3","vj_soll/reload (4).mp3","vj_soll/reload (5).mp3","vj_soll/reload (6).mp3"}
ENT.B5SoundTbl_Suppressing = {"vj_soll/suppress (1).mp3","vj_soll/suppress (2).mp3","vj_soll/suppress (3).mp3","vj_soll/suppress (4).mp3","vj_soll/suppress (5).mp3","vj_soll/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetBodygroup(1,math.random(1,1))
	self:SetBodygroup(2,math.random(4,6))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,6))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,5)
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
		self.Model = {"models/sentry/sentrycag/mw2mo/mw2_soldier_02.mdl"}
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
		self.Model = {"models/sentry/sentrycag/mw2mo/mw2_soldier_02.mdl"}
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
		self.Model = {"models/sentry/sentrycag/mw2mo/mw2_soldier_02.mdl"}
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
		self.Model = {"models/sentry/sentrycag/mw2mo/mw2_soldier_02.mdl"}
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
		self.Model = {"models/sentry/sentrycag/mw2mo/mw2_soldier_02.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/