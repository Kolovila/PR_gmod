AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 80 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_IRISH"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.CanThrowBackDetectedGrenades = true
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"Melee_Slice","Kick_Door"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 0
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}

ENT.B1SoundTbl_Alert = {"vj_sirish1/alert (1).mp3","vj_sirish1/alert (2).mp3","vj_sirish1/alert (3).mp3","vj_sirish1/alert (4).mp3","vj_sirish1/alert (5).mp3","vj_sirish1/alert (6).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_sirish1/becomehos (1).mp3","vj_sirish1/becomehos (2).mp3","vj_sirish1/becomehos (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_sirish1/bump (1).mp3","vj_sirish1/bump (2).mp3","vj_sirish1/bump (3).mp3","vj_sirish1/bump (4).mp3","vj_sirish1/bump (5).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_sirish1/chat (1).mp3","vj_sirish1/chat (2).mp3","vj_sirish1/chat (3).mp3","vj_sirish1/chat (4).mp3","vj_sirish1/chat (5).mp3","vj_sirish1/chat (6).mp3","vj_sirish1/chat (7).mp3","vj_sirish1/chat (8).mp3","vj_sirish1/chat (9).mp3","vj_sirish1/chat (10).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_sirish1/combat (1).mp3","vj_sirish1/combat (2).mp3","vj_sirish1/combat (3).mp3","vj_sirish1/combat (4).mp3","vj_sirish1/combat (5).mp3","vj_sirish1/combat (6).mp3","vj_sirish1/combat (7).mp3","vj_sirish1/combat (8).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_sirish1/follow (1).mp3","vj_sirish1/follow (2).mp3","vj_sirish1/follow (3).mp3","vj_sirish1/follow (4).mp3","vj_sirish1/follow (5).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_sirish1/gotmedic (1).mp3","vj_sirish1/gotmedic (2).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_sirish1/heal (1).mp3","vj_sirish1/heal (2).mp3","vj_sirish1/heal (3).mp3"} 
ENT.B1SoundTbl_OnPlayerSight = {"vj_sirish1/hi (1).mp3","vj_sirish1/hi (2).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_sirish1/hidegrenade (1).mp3","vj_sirish1/hidegrenade (3).mp3","vj_sirish1/hidegrenade (2).mp3","vj_sirish1/hidegrenade (4).mp3","vj_sirish1/hidegrenade (5).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_sirish1/invest (1).mp3","vj_sirish1/invest (2).mp3","vj_sirish1/invest (3).mp3","vj_sirish1/invest (4).mp3","vj_sirish1/invest (5).mp3","vj_sirish1/invest (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_sirish1/kill (1).mp3","vj_sirish1/kill (2).mp3","vj_sirish1/kill (3).mp3","vj_sirish1/kill (4).mp3","vj_sirish1/kill (5).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_sirish1/losthim (1).mp3","vj_sirish1/losthim (2).mp3","vj_sirish1/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_sirish1/nofollow (1).mp3","vj_sirish1/nofollow (2).mp3","vj_sirish1/nofollow (3).mp3","vj_sirish1/nofollow (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_sirish1/pain (1).mp3","vj_sirish1/pain (2).mp3","vj_sirish1/pain (3).mp3","vj_sirish1/pain (4).mp3","vj_sirish1/pain (5).mp3","vj_sirish1/pain (6).mp3","vj_sirish1/pain (7).mp3","vj_sirish1/pain (8).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_sirish1/playerdamage (1).mp3","vj_sirish1/playerdamage (2).mp3","vj_sirish1/playerdamage (3).mp3","vj_sirish1/playerdamage (4).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_sirish1/reload (1).mp3","vj_sirish1/reload (2).mp3","vj_sirish1/reload (3).mp3","vj_sirish1/reload (4).mp3","vj_sirish1/reload (5).mp3","vj_sirish1/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_sirish1/suppress (1).mp3","vj_sirish1/suppress (2).mp3","vj_sirish1/suppress (3).mp3","vj_sirish1/suppress (4).mp3","vj_sirish1/suppress (5).mp3"}

ENT.B2SoundTbl_Alert = {"vj_sirish2/alert (1).mp3","vj_sirish2/alert (2).mp3","vj_sirish2/alert (3).mp3","vj_sirish2/alert (4).mp3","vj_sirish2/alert (5).mp3","vj_sirish2/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_sirish2/becomehos (1).mp3","vj_sirish2/becomehos (2).mp3","vj_sirish2/becomehos (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_sirish2/bump (1).mp3","vj_sirish2/bump (2).mp3","vj_sirish2/bump (3).mp3","vj_sirish2/bump (4).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_sirish2/chat (1).mp3","vj_sirish2/chat (2).mp3","vj_sirish2/chat (3).mp3","vj_sirish2/chat (4).mp3","vj_sirish2/chat (5).mp3","vj_sirish2/chat (6).mp3","vj_sirish2/chat (7).mp3","vj_sirish2/chat (8).mp3","vj_sirish2/chat (9).mp3","vj_sirish2/chat (10).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_sirish2/combat (1).mp3","vj_sirish2/combat (2).mp3","vj_sirish2/combat (3).mp3","vj_sirish2/combat (4).mp3","vj_sirish2/combat (5).mp3","vj_sirish2/combat (6).mp3","vj_sirish2/combat (7).mp3","vj_sirish2/combat (8).mp3","vj_sirish2/combat (9).mp3","vj_sirish2/combat (10).mp3","vj_sirish2/combat (11).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_sirish2/follow (1).mp3","vj_sirish2/follow (2).mp3","vj_sirish2/follow (3).mp3","vj_sirish2/follow (4).mp3","vj_sirish2/follow (5).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_sirish2/gotmedic (1).mp3","vj_sirish2/gotmedic (2).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_sirish2/heal (1).mp3","vj_sirish2/heal (2).mp3","vj_sirish2/heal (3).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_sirish2/hi (1).mp3","vj_sirish2/hi (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_sirish2/hidegrenade (1).mp3","vj_sirish2/hidegrenade (3).mp3","vj_sirish2/hidegrenade (2).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_sirish2/invest (1).mp3","vj_sirish2/invest (2).mp3","vj_sirish2/invest (3).mp3","vj_sirish2/invest (4).mp3","vj_sirish2/invest (5).mp3","vj_sirish2/invest (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_sirish2/kill (1).mp3","vj_sirish2/kill (2).mp3","vj_sirish2/kill (3).mp3","vj_sirish2/kill (4).mp3","vj_sirish2/kill (5).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_sirish2/losthim (1).mp3","vj_sirish2/losthim (2).mp3","vj_sirish2/losthim (3).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_sirish2/nofollow (1).mp3","vj_sirish2/nofollow (2).mp3","vj_sirish2/nofollow (3).mp3","vj_sirish2/nofollow (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_sirish2/pain (1).mp3","vj_sirish2/pain (2).mp3","vj_sirish2/pain (3).mp3","vj_sirish2/pain (4).mp3","vj_sirish2/pain (5).mp3","vj_sirish2/pain (6).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_sirish2/playerdamage (1).mp3","vj_sirish2/playerdamage (2).mp3","vj_sirish2/playerdamage (3).mp3","vj_sirish2/playerdamage (4).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_sirish2/reload (1).mp3","vj_sirish2/reload (2).mp3","vj_sirish2/reload (3).mp3","vj_sirish2/reload (4).mp3","vj_sirish2/reload (5).mp3","vj_sirish2/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_sirish2/suppress (1).mp3","vj_sirish2/suppress (2).mp3","vj_sirish2/suppress (3).mp3","vj_sirish2/suppress (4).mp3","vj_sirish2/suppress (5).mp3"}

ENT.B3SoundTbl_Alert = {"vj_sirish3/alert (1).mp3","vj_sirish3/alert (2).mp3","vj_sirish3/alert (3).mp3","vj_sirish3/alert (4).mp3","vj_sirish3/alert (5).mp3","vj_sirish3/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_sirish3/becomehos (1).mp3","vj_sirish3/becomehos (2).mp3","vj_sirish3/becomehos (3).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_sirish3/bump (1).mp3","vj_sirish3/bump (2).mp3","vj_sirish3/bump (3).mp3","vj_sirish3/bump (4).mp3","vj_sirish3/bump (5).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_sirish3/chat (1).mp3","vj_sirish3/chat (2).mp3","vj_sirish3/chat (3).mp3","vj_sirish3/chat (4).mp3","vj_sirish3/chat (5).mp3","vj_sirish3/chat (6).mp3","vj_sirish3/chat (7).mp3","vj_sirish3/chat (8).mp3","vj_sirish3/chat (9).mp3","vj_sirish3/chat (10).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_sirish3/combat (1).mp3","vj_sirish3/combat (2).mp3","vj_sirish3/combat (3).mp3","vj_sirish3/combat (4).mp3","vj_sirish3/combat (5).mp3","vj_sirish3/combat (6).mp3","vj_sirish3/combat (7).mp3","vj_sirish3/combat (8).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_sirish3/follow (1).mp3","vj_sirish3/follow (2).mp3","vj_sirish3/follow (3).mp3","vj_sirish3/follow (4).mp3","vj_sirish3/follow (5).mp3","vj_sirish3/follow (6).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_sirish3/gotmedic (1).mp3","vj_sirish3/gotmedic (2).mp3","vj_sirish3/gotmedic (3).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_sirish3/heal (1).mp3","vj_sirish3/heal (2).mp3","vj_sirish3/heal (3).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_sirish3/hi (1).mp3","vj_sirish3/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_sirish3/hidegrenade (1).mp3","vj_sirish3/hidegrenade (3).mp3","vj_sirish3/hidegrenade (2).mp3","vj_sirish3/hidegrenade (4).mp3","vj_sirish3/hidegrenade (5).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_sirish3/invest (1).mp3","vj_sirish3/invest (2).mp3","vj_sirish3/invest (3).mp3","vj_sirish3/invest (4).mp3","vj_sirish3/invest (5).mp3","vj_sirish3/invest (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_sirish3/kill (1).mp3","vj_sirish3/kill (2).mp3","vj_sirish3/kill (3).mp3","vj_sirish3/kill (4).mp3","vj_sirish3/kill (5).mp3","vj_sirish3/kill (6).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_sirish3/losthim (1).mp3","vj_sirish3/losthim (2).mp3","vj_sirish3/losthim (3).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_sirish3/nofollow (1).mp3","vj_sirish3/nofollow (2).mp3","vj_sirish3/nofollow (3).mp3","vj_sirish3/nofollow (4).mp3","vj_sirish3/nofollow (5).mp3","vj_sirish3/nofollow (6).mp3"}
ENT.B3SoundTbl_Pain = {"vj_sirish3/pain (1).mp3","vj_sirish3/pain (2).mp3","vj_sirish3/pain (3).mp3","vj_sirish3/pain (4).mp3","vj_sirish3/pain (5).mp3","vj_sirish3/pain (6).mp3","vj_sirish3/pain (7).mp3","vj_sirish3/pain (8).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_sirish3/playerdamage (1).mp3","vj_sirish3/playerdamage (2).mp3","vj_sirish3/playerdamage (3).mp3","vj_sirish3/playerdamage (4).mp3","vj_sirish3/playerdamage (5).mp3","vj_sirish3/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_sirish3/reload (1).mp3","vj_sirish3/reload (2).mp3","vj_sirish3/reload (3).mp3","vj_sirish3/reload (4).mp3","vj_sirish3/reload (5).mp3","vj_sirish3/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_sirish3/suppress (1).mp3","vj_sirish3/suppress (2).mp3","vj_sirish3/suppress (3).mp3","vj_sirish3/suppress (4).mp3","vj_sirish3/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_sirish4/alert (1).mp3","vj_sirish4/alert (2).mp3","vj_sirish4/alert (3).mp3","vj_sirish4/alert (4).mp3","vj_sirish4/alert (5).mp3","vj_sirish4/alert (6).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_sirish4/becomehos (1).mp3","vj_sirish4/becomehos (2).mp3","vj_sirish4/becomehos (3).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_sirish4/bump (1).mp3","vj_sirish4/bump (2).mp3","vj_sirish4/bump (3).mp3","vj_sirish4/bump (4).mp3","vj_sirish4/bump (5).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_sirish4/chat (1).mp3","vj_sirish4/chat (2).mp3","vj_sirish4/chat (3).mp3","vj_sirish4/chat (4).mp3","vj_sirish4/chat (5).mp3","vj_sirish4/chat (6).mp3","vj_sirish4/chat (7).mp3","vj_sirish4/chat (8).mp3","vj_sirish4/chat (9).mp3","vj_sirish4/chat (10).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_sirish4/combat (1).mp3","vj_sirish4/combat (2).mp3","vj_sirish4/combat (3).mp3","vj_sirish4/combat (4).mp3","vj_sirish4/combat (5).mp3","vj_sirish4/combat (6).mp3","vj_sirish4/combat (7).mp3","vj_sirish4/combat (8).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_sirish4/follow (1).mp3","vj_sirish4/follow (2).mp3","vj_sirish4/follow (3).mp3","vj_sirish4/follow (4).mp3","vj_sirish4/follow (5).mp3","vj_sirish4/follow (6).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_sirish4/gotmedic (1).mp3","vj_sirish4/gotmedic (2).mp3","vj_sirish4/gotmedic (3).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_sirish4/heal (1).mp3","vj_sirish4/heal (2).mp3","vj_sirish4/heal (3).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_sirish4/hi (1).mp3","vj_sirish4/hi (2).mp3","vj_sirish4/hi (3).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_sirish4/hidegrenade (1).mp3","vj_sirish4/hidegrenade (3).mp3","vj_sirish4/hidegrenade (2).mp3","vj_sirish4/hidegrenade (4).mp3","vj_sirish4/hidegrenade (5).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_sirish4/invest (1).mp3","vj_sirish4/invest (2).mp3","vj_sirish4/invest (3).mp3","vj_sirish4/invest (4).mp3","vj_sirish4/invest (5).mp3","vj_sirish4/invest (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_sirish4/kill (1).mp3","vj_sirish4/kill (2).mp3","vj_sirish4/kill (3).mp3","vj_sirish4/kill (4).mp3","vj_sirish4/kill (5).mp3","vj_sirish4/kill (6).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_sirish4/losthim (1).mp3","vj_sirish4/losthim (2).mp3","vj_sirish4/losthim (3).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_sirish4/nofollow (1).mp3","vj_sirish4/nofollow (2).mp3","vj_sirish4/nofollow (3).mp3","vj_sirish4/nofollow (4).mp3","vj_sirish4/nofollow (5).mp3","vj_sirish4/nofollow (6).mp3"}
ENT.B4SoundTbl_Pain = {"vj_sirish4/pain (1).mp3","vj_sirish4/pain (2).mp3","vj_sirish4/pain (3).mp3","vj_sirish4/pain (4).mp3","vj_sirish4/pain (5).mp3","vj_sirish4/pain (6).mp3","vj_sirish4/pain (7).mp3","vj_sirish4/pain (8).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_sirish4/playerdamage (1).mp3","vj_sirish4/playerdamage (2).mp3","vj_sirish4/playerdamage (3).mp3","vj_sirish4/playerdamage (4).mp3","vj_sirish4/playerdamage (5).mp3","vj_sirish4/playerdamage (6).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_sirish4/reload (1).mp3","vj_sirish4/reload (2).mp3","vj_sirish4/reload (3).mp3","vj_sirish4/reload (4).mp3","vj_sirish4/reload (5).mp3","vj_sirish4/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_sirish4/suppress (1).mp3","vj_sirish4/suppress (2).mp3","vj_sirish4/suppress (3).mp3","vj_sirish4/suppress (4).mp3","vj_sirish4/suppress (5).mp3","vj_sirish4/suppress (6).mp3"}

ENT.B5SoundTbl_Alert = {"vj_sirish5/alert (1).mp3","vj_sirish5/alert (2).mp3","vj_sirish5/alert (3).mp3","vj_sirish5/alert (4).mp3","vj_sirish5/alert (5).mp3","vj_sirish5/alert (6).mp3"}
ENT.B5SoundTbl_BecomeEnemyToPlayer = {"vj_sirish5/becomehos (1).mp3","vj_sirish5/becomehos (2).mp3","vj_sirish5/becomehos (3).mp3"}
ENT.B5SoundTbl_MoveOutOfPlayersWay = {"vj_sirish5/bump (1).mp3","vj_sirish5/bump (2).mp3","vj_sirish5/bump (3).mp3","vj_sirish5/bump (4).mp3","vj_sirish5/bump (5).mp3"} 
ENT.B5SoundTbl_Idle = {"vj_sirish5/chat (1).mp3","vj_sirish5/chat (2).mp3","vj_sirish5/chat (3).mp3","vj_sirish5/chat (4).mp3","vj_sirish5/chat (5).mp3","vj_sirish5/chat (6).mp3","vj_sirish5/chat (7).mp3","vj_sirish5/chat (8).mp3","vj_sirish5/chat (9).mp3","vj_sirish5/chat (10).mp3"}
ENT.B5SoundTbl_CombatIdle = {"vj_sirish5/combat (1).mp3","vj_sirish5/combat (2).mp3","vj_sirish5/combat (3).mp3","vj_sirish5/combat (4).mp3","vj_sirish5/combat (5).mp3","vj_sirish5/combat (6).mp3","vj_sirish5/combat (7).mp3","vj_sirish5/combat (8).mp3"}
ENT.B5SoundTbl_FollowPlayer = {"vj_sirish5/follow (1).mp3","vj_sirish5/follow (2).mp3","vj_sirish5/follow (3).mp3","vj_sirish5/follow (4).mp3","vj_sirish5/follow (5).mp3","vj_sirish5/follow (6).mp3"}
ENT.B5SoundTbl_MedicReceiveHeal = {"vj_sirish5/gotmedic (1).mp3","vj_sirish5/gotmedic (2).mp3","vj_sirish5/gotmedic (3).mp3"}
ENT.B5SoundTbl_MedicBeforeHeal = {"vj_sirish5/heal (1).mp3","vj_sirish5/heal (2).mp3","vj_sirish5/heal (3).mp3"} 
ENT.B5SoundTbl_OnPlayerSight = {"vj_sirish5/hi (1).mp3","vj_sirish5/hi (2).mp3"}
ENT.B5SoundTbl_OnGrenadeSight = {"vj_sirish5/hidegrenade (1).mp3","vj_sirish5/hidegrenade (3).mp3","vj_sirish5/hidegrenade (2).mp3","vj_sirish5/hidegrenade (4).mp3","vj_sirish5/hidegrenade (5).mp3"}
ENT.B5SoundTbl_Investigate = {"vj_sirish5/invest (1).mp3","vj_sirish5/invest (2).mp3","vj_sirish5/invest (3).mp3","vj_sirish5/invest (4).mp3","vj_sirish5/invest (5).mp3","vj_sirish5/invest (6).mp3"}
ENT.B5SoundTbl_OnKilledEnemy = {"vj_sirish5/kill (1).mp3","vj_sirish5/kill (2).mp3","vj_sirish5/kill (3).mp3","vj_sirish5/kill (4).mp3","vj_sirish5/kill (5).mp3","vj_sirish5/kill (6).mp3"}
ENT.B5SoundTbl_LostEnemy = {"vj_sirish5/losthim (1).mp3","vj_sirish5/losthim (2).mp3","vj_sirish5/losthim (3).mp3"}
ENT.B5SoundTbl_UnFollowPlayer = {"vj_sirish5/nofollow (1).mp3","vj_sirish5/nofollow (2).mp3","vj_sirish5/nofollow (3).mp3","vj_sirish5/nofollow (4).mp3","vj_sirish5/nofollow (5).mp3","vj_sirish5/nofollow (6).mp3"}
ENT.B5SoundTbl_Pain = {"vj_sirish5/pain (1).mp3","vj_sirish5/pain (2).mp3","vj_sirish5/pain (3).mp3","vj_sirish5/pain (4).mp3","vj_sirish5/pain (5).mp3","vj_sirish5/pain (6).mp3","vj_sirish5/pain (7).mp3","vj_sirish5/pain (8).mp3"}
ENT.B5SoundTbl_DamageByPlayer = {"vj_sirish5/playerdamage (1).mp3","vj_sirish5/playerdamage (2).mp3","vj_sirish5/playerdamage (3).mp3","vj_sirish5/playerdamage (4).mp3","vj_sirish5/playerdamage (5).mp3","vj_sirish5/playerdamage (6).mp3"}
ENT.B5SoundTbl_WeaponReload = {"vj_sirish5/reload (1).mp3","vj_sirish5/reload (2).mp3","vj_sirish5/reload (3).mp3","vj_sirish5/reload (4).mp3","vj_sirish5/reload (5).mp3","vj_sirish5/reload (6).mp3"}
ENT.B5SoundTbl_Suppressing = {"vj_sirish5/suppress (1).mp3","vj_sirish5/suppress (2).mp3","vj_sirish5/suppress (3).mp3","vj_sirish5/suppress (4).mp3","vj_sirish5/suppress (5).mp3","vj_sirish5/suppress (6).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,0))
	self:SetBodygroup(2,math.random(0,3))
	self:SetBodygroup(3,math.random(1,2))
	self:SetBodygroup(4,math.random(1,3))
	self:SetBodygroup(5,math.random(0,2))
	self:SetBodygroup(6,math.random(0,1))
	if math.random(1,10) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,5)
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
		self.Model = {"models/sentry/sentrycag/senira/su/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/su/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/su/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/su/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/su/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/sentryseniramale2.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/