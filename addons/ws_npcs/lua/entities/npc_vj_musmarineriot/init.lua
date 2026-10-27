AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 30
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 0
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_solw/alert (1).mp3","vj_solw/alert (2).mp3","vj_solw/alert (3).mp3","vj_solw/alert (4).mp3","vj_solw/alert (5).mp3","vj_solw/alert (6).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_solw/becomehos (1).mp3","vj_solw/becomehos (2).mp3","vj_solw/becomehos (3).mp3","vj_solw/becomehos (4).mp3","vj_solw/becomehos (5).mp3","vj_solw/becomehos (6).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_solw/bump (1).mp3","vj_solw/bump (2).mp3","vj_solw/bump (3).mp3","vj_solw/bump (4).mp3","vj_solw/bump (5).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_solw/chat (1).mp3","vj_solw/chat (2).mp3","vj_solw/chat (3).mp3","vj_solw/chat (4).mp3","vj_solw/chat (5).mp3","vj_solw/chat (6).mp3","vj_solw/chat (7).mp3","vj_solw/chat (8).mp3","vj_solw/chat (9).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_solw/combat (1).mp3","vj_solw/combat (2).mp3","vj_solw/combat (3).mp3","vj_solw/combat (4).mp3","vj_solw/combat (5).mp3","vj_solw/combat (6).mp3","vj_solw/combat (7).mp3","vj_solw/combat (8).mp3","vj_solw/combat (9).mp3","vj_solw/combat (10).mp3"}
ENT.B1SoundTbl_Death = {"vj_solw/died (1).mp3","vj_solw/died (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_solw/follow (1).mp3","vj_solw/follow (2).mp3","vj_solw/follow (3).mp3","vj_solw/follow (4).mp3","vj_solw/follow (5).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_solw/gotmedic (1).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_solw/grenade (1).mp3","vj_solw/grenade (2).mp3","vj_solw/grenade (3).mp3","vj_solw/grenade (4).mp3",}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_solw/heal (1).mp3","vj_solw/heal (2).mp3","vj_solw/heal (3).mp3","vj_solw/heal (4).mp3"} 
ENT.B1SoundTbl_CallForHelp = {"vj_solw/help (1).mp3","vj_solw/help (2).mp3","vj_solw/help (3).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_solw/hi (1).mp3","vj_solw/hi (2).mp3","vj_solw/hi (3).mp3","vj_solw/hi (4).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_solw/hidegrenade (1).mp3","vj_solw/hidegrenade (3).mp3","vj_solw/hidegrenade (2).mp3","vj_solw/hidegrenade (4).mp3","vj_solw/hidegrenade (5).mp3","vj_solw/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_solw/kill (1).mp3","vj_solw/kill (2).mp3","vj_solw/kill (3).mp3","vj_solw/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_solw/losthim (1).mp3","vj_solw/losthim (2).mp3","vj_solw/losthim (3).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_solw/mandown (1).mp3","vj_solw/mandown (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_solw/nofollow (1).mp3","vj_solw/nofollow (2).mp3","vj_solw/nofollow (3).mp3","vj_solw/nofollow (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_solw/pain (1).mp3","vj_solw/pain (2).mp3","vj_solw/pain (3).mp3","vj_solw/pain (4).mp3","vj_solw/pain (5).mp3","vj_solw/pain (6).mp3","vj_solw/pain (7).mp3","vj_solw/pain (8).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_solw/playerdamage (1).mp3","vj_solw/playerdamage (2).mp3","vj_solw/playerdamage (3).mp3","vj_solw/playerdamage (4).mp3","vj_solw/playerdamage (5).mp3","vj_solw/playerdamage (6).mp3","vj_solw/playerdamage (7).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_solw/reload (1).mp3","vj_solw/reload (2).mp3","vj_solw/reload (3).mp3","vj_solw/reload (4).mp3","vj_solw/reload (5).mp3","vj_solw/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_solw/suppress (1).mp3","vj_solw/suppress (2).mp3","vj_solw/suppress (3).mp3","vj_solw/suppress (4).mp3","vj_solw/suppress (5).mp3"}

ENT.B2SoundTbl_Alert = {"vj_hsolw/alert (1).mp3","vj_hsolw/alert (2).mp3","vj_hsolw/alert (3).mp3","vj_hsolw/alert (4).mp3","vj_hsolw/alert (5).mp3","vj_hsolw/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_hsolw/becomehos (1).mp3","vj_hsolw/becomehos (2).mp3","vj_hsolw/becomehos (3).mp3","vj_hsolw/becomehos (4).mp3","vj_hsolw/becomehos (5).mp3","vj_hsolw/becomehos (6).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_hsolw/bump (1).mp3","vj_hsolw/bump (2).mp3","vj_hsolw/bump (3).mp3","vj_hsolw/bump (4).mp3","vj_hsolw/bump (5).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_hsolw/chat (1).mp3","vj_hsolw/chat (2).mp3","vj_hsolw/chat (3).mp3","vj_hsolw/chat (4).mp3","vj_hsolw/chat (5).mp3","vj_hsolw/chat (6).mp3","vj_hsolw/chat (7).mp3","vj_hsolw/chat (8).mp3","vj_hsolw/chat (9).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_hsolw/combat (1).mp3","vj_hsolw/combat (2).mp3","vj_hsolw/combat (3).mp3","vj_hsolw/combat (4).mp3","vj_hsolw/combat (5).mp3","vj_hsolw/combat (6).mp3","vj_hsolw/combat (7).mp3","vj_hsolw/combat (8).mp3","vj_hsolw/combat (9).mp3","vj_hsolw/combat (10).mp3"}
ENT.B2SoundTbl_Death = {"vj_hsolw/died (1).mp3","vj_hsolw/died (2).mp3","vj_hsolw/died (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_hsolw/follow (1).mp3","vj_hsolw/follow (2).mp3","vj_hsolw/follow (3).mp3","vj_hsolw/follow (4).mp3","vj_hsolw/follow (5).mp3","vj_hsolw/follow (6).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_hsolw/gotmedic (1).mp3"}
ENT.B2SoundTbl_GrenadeAttack = {"vj_hsolw/grenade (1).mp3","vj_hsolw/grenade (2).mp3","vj_hsolw/grenade (3).mp3","vj_hsolw/grenade (4).mp3",}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_hsolw/heal (1).mp3","vj_hsolw/heal (2).mp3","vj_hsolw/heal (3).mp3","vj_hsolw/heal (4).mp3","vj_hsolw/heal (5).mp3","vj_hsolw/heal (6).mp3"} 
ENT.B2SoundTbl_CallForHelp = {"vj_hsolw/help (1).mp3","vj_hsolw/help (2).mp3","vj_hsolw/help (3).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_hsolw/hi (1).mp3","vj_hsolw/hi (2).mp3","vj_hsolw/hi (3).mp3","vj_hsolw/hi (4).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_hsolw/hidegrenade (1).mp3","vj_hsolw/hidegrenade (3).mp3","vj_hsolw/hidegrenade (2).mp3","vj_hsolw/hidegrenade (4).mp3","vj_hsolw/hidegrenade (5).mp3","vj_hsolw/hidegrenade (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_hsolw/kill (1).mp3","vj_hsolw/kill (2).mp3","vj_hsolw/kill (3).mp3","vj_hsolw/kill (4).mp3","vj_hsolw/kill (5).mp3","vj_hsolw/kill (6).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_hsolw/losthim (1).mp3","vj_hsolw/losthim (2).mp3","vj_hsolw/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_hsolw/mandown (1).mp3","vj_hsolw/mandown (2).mp3","vj_hsolw/mandown (3).mp3","vj_hsolw/mandown (4).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_hsolw/nofollow (1).mp3","vj_hsolw/nofollow (2).mp3","vj_hsolw/nofollow (3).mp3","vj_hsolw/nofollow (4).mp3","vj_hsolw/nofollow (5).mp3","vj_hsolw/nofollow (6).mp3"}
ENT.B2SoundTbl_Pain = {"vj_hsolw/pain (1).mp3","vj_hsolw/pain (2).mp3","vj_hsolw/pain (3).mp3","vj_hsolw/pain (4).mp3","vj_hsolw/pain (5).mp3","vj_hsolw/pain (6).mp3","vj_hsolw/pain (7).mp3","vj_hsolw/pain (8).mp3","vj_hsolw/pain (9).mp3","vj_hsolw/pain (10).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_hsolw/playerdamage (1).mp3","vj_hsolw/playerdamage (2).mp3","vj_hsolw/playerdamage (3).mp3","vj_hsolw/playerdamage (4).mp3","vj_hsolw/playerdamage (5).mp3","vj_hsolw/playerdamage (6).mp3","vj_hsolw/playerdamage (7).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_hsolw/reload (1).mp3","vj_hsolw/reload (2).mp3","vj_hsolw/reload (3).mp3","vj_hsolw/reload (4).mp3","vj_hsolw/reload (5).mp3","vj_hsolw/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_hsolw/suppress (1).mp3","vj_hsolw/suppress (2).mp3","vj_hsolw/suppress (3).mp3","vj_hsolw/suppress (4).mp3","vj_hsolw/suppress (5).mp3"}

ENT.B3SoundTbl_Alert = {"vj_hsolb/alert (1).mp3","vj_hsolb/alert (2).mp3","vj_hsolb/alert (3).mp3","vj_hsolb/alert (4).mp3","vj_hsolb/alert (5).mp3","vj_hsolb/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_hsolb/becomehos (1).mp3","vj_hsolb/becomehos (2).mp3","vj_hsolb/becomehos (3).mp3","vj_hsolb/becomehos (4).mp3","vj_hsolb/becomehos (5).mp3","vj_hsolb/becomehos (6).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_hsolb/bump (1).mp3","vj_hsolb/bump (2).mp3","vj_hsolb/bump (3).mp3","vj_hsolb/bump (4).mp3","vj_hsolb/bump (5).mp3","vj_hsolb/bump (6).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_hsolb/chat (1).mp3","vj_hsolb/chat (2).mp3","vj_hsolb/chat (3).mp3","vj_hsolb/chat (4).mp3","vj_hsolb/chat (5).mp3","vj_hsolb/chat (6).mp3","vj_hsolb/chat (7).mp3","vj_hsolb/chat (8).mp3","vj_hsolb/chat (9).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_hsolb/combat (1).mp3","vj_hsolb/combat (2).mp3","vj_hsolb/combat (3).mp3","vj_hsolb/combat (4).mp3","vj_hsolb/combat (5).mp3","vj_hsolb/combat (6).mp3","vj_hsolb/combat (7).mp3","vj_hsolb/combat (8).mp3","vj_hsolb/combat (9).mp3","vj_hsolb/combat (10).mp3"}
ENT.B3SoundTbl_Death = {"vj_hsolb/died (1).mp3","vj_hsolb/died (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_hsolb/follow (1).mp3","vj_hsolb/follow (2).mp3","vj_hsolb/follow (3).mp3","vj_hsolb/follow (4).mp3","vj_hsolb/follow (5).mp3","vj_hsolb/follow (6).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_hsolb/gotmedic (1).mp3"}
ENT.B3SoundTbl_GrenadeAttack = {"vj_hsolb/grenade (1).mp3","vj_hsolb/grenade (2).mp3","vj_hsolb/grenade (3).mp3","vj_hsolb/grenade (4).mp3",}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_hsolb/heal (1).mp3","vj_hsolb/heal (2).mp3","vj_hsolb/heal (3).mp3","vj_hsolb/heal (4).mp3","vj_hsolb/heal (5).mp3"} 
ENT.B3SoundTbl_CallForHelp = {"vj_hsolb/help (1).mp3","vj_hsolb/help (2).mp3","vj_hsolb/help (3).mp3"}
ENT.B3SoundTbl_OnPlayerSight = {"vj_hsolb/hi (1).mp3","vj_hsolb/hi (2).mp3","vj_hsolb/hi (3).mp3","vj_hsolb/hi (4).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_hsolb/hidegrenade (1).mp3","vj_hsolb/hidegrenade (3).mp3","vj_hsolb/hidegrenade (2).mp3","vj_hsolb/hidegrenade (4).mp3","vj_hsolb/hidegrenade (5).mp3","vj_hsolb/hidegrenade (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_hsolb/kill (1).mp3","vj_hsolb/kill (2).mp3","vj_hsolb/kill (3).mp3","vj_hsolb/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_hsolb/losthim (1).mp3","vj_hsolb/losthim (2).mp3","vj_hsolb/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_hsolb/mandown (1).mp3","vj_hsolb/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_hsolb/nofollow (1).mp3","vj_hsolb/nofollow (2).mp3","vj_hsolb/nofollow (3).mp3","vj_hsolb/nofollow (4).mp3","vj_hsolb/nofollow (5).mp3","vj_hsolb/nofollow (6).mp3"}
ENT.B3SoundTbl_Pain = {"vj_hsolb/pain (1).mp3","vj_hsolb/pain (2).mp3","vj_hsolb/pain (3).mp3","vj_hsolb/pain (4).mp3","vj_hsolb/pain (5).mp3","vj_hsolb/pain (6).mp3","vj_hsolb/pain (7).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_hsolb/playerdamage (1).mp3","vj_hsolb/playerdamage (2).mp3","vj_hsolb/playerdamage (3).mp3","vj_hsolb/playerdamage (4).mp3","vj_hsolb/playerdamage (5).mp3","vj_hsolb/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_hsolb/reload (1).mp3","vj_hsolb/reload (2).mp3","vj_hsolb/reload (3).mp3","vj_hsolb/reload (4).mp3","vj_hsolb/reload (5).mp3","vj_hsolb/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_hsolb/suppress (1).mp3","vj_hsolb/suppress (2).mp3","vj_hsolb/suppress (3).mp3","vj_hsolb/suppress (4).mp3","vj_hsolb/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_solb/alert (1).mp3","vj_solb/alert (2).mp3","vj_solb/alert (3).mp3","vj_solb/alert (4).mp3","vj_solb/alert (5).mp3","vj_solb/alert (6).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_solb/becomehos (1).mp3","vj_solb/becomehos (2).mp3","vj_solb/becomehos (3).mp3","vj_solb/becomehos (4).mp3","vj_solb/becomehos (5).mp3","vj_solb/becomehos (6).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_solb/bump (1).mp3","vj_solb/bump (2).mp3","vj_solb/bump (3).mp3","vj_solb/bump (4).mp3","vj_solb/bump (5).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_solb/chat (1).mp3","vj_solb/chat (2).mp3","vj_solb/chat (3).mp3","vj_solb/chat (4).mp3","vj_solb/chat (5).mp3","vj_solb/chat (6).mp3","vj_solb/chat (7).mp3","vj_solb/chat (8).mp3","vj_solb/chat (9).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_solb/combat (1).mp3","vj_solb/combat (2).mp3","vj_solb/combat (3).mp3","vj_solb/combat (4).mp3","vj_solb/combat (5).mp3","vj_solb/combat (6).mp3","vj_solb/combat (7).mp3","vj_solb/combat (8).mp3","vj_solb/combat (9).mp3","vj_solb/combat (10).mp3"}
ENT.B4SoundTbl_Death = {"vj_solb/died (1).mp3","vj_solb/died (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_solb/follow (1).mp3","vj_solb/follow (2).mp3","vj_solb/follow (3).mp3","vj_solb/follow (4).mp3","vj_solb/follow (5).mp3","vj_solb/follow (6).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_solb/gotmedic (1).mp3"}
ENT.B4SoundTbl_GrenadeAttack = {"vj_solb/grenade (1).mp3","vj_solb/grenade (2).mp3","vj_solb/grenade (3).mp3","vj_solb/grenade (4).mp3",}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_solb/heal (1).mp3","vj_solb/heal (2).mp3","vj_solb/heal (3).mp3","vj_solb/heal (4).mp3"} 
ENT.B4SoundTbl_CallForHelp = {"vj_solb/help (1).mp3","vj_solb/help (2).mp3","vj_solb/help (3).mp3"}
ENT.B4SoundTbl_OnPlayerSight = {"vj_solb/hi (1).mp3","vj_solb/hi (2).mp3","vj_solb/hi (3).mp3","vj_solb/hi (4).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_solb/hidegrenade (1).mp3","vj_solb/hidegrenade (3).mp3","vj_solb/hidegrenade (2).mp3","vj_solb/hidegrenade (4).mp3","vj_solb/hidegrenade (5).mp3","vj_solb/hidegrenade (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_solb/kill (1).mp3","vj_solb/kill (2).mp3","vj_solb/kill (3).mp3","vj_solb/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_solb/losthim (1).mp3","vj_solb/losthim (2).mp3","vj_solb/losthim (3).mp3"}
ENT.B4SoundTbl_AllyDeath = {"vj_solb/mandown (1).mp3","vj_solb/mandown (2).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_solb/nofollow (1).mp3","vj_solb/nofollow (2).mp3","vj_solb/nofollow (3).mp3","vj_solb/nofollow (4).mp3","vj_solb/nofollow (5).mp3","vj_solb/nofollow (6).mp3"}
ENT.B4SoundTbl_Pain = {"vj_solb/pain (1).mp3","vj_solb/pain (2).mp3","vj_solb/pain (3).mp3","vj_solb/pain (4).mp3","vj_solb/pain (5).mp3","vj_solb/pain (6).mp3","vj_solb/pain (7).mp3","vj_solb/pain (8).mp3","vj_solb/pain (9).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_solb/playerdamage (1).mp3","vj_solb/playerdamage (2).mp3","vj_solb/playerdamage (3).mp3","vj_solb/playerdamage (4).mp3","vj_solb/playerdamage (5).mp3","vj_solb/playerdamage (6).mp3","vj_solb/playerdamage (7).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_solb/reload (1).mp3","vj_solb/reload (2).mp3","vj_solb/reload (3).mp3","vj_solb/reload (4).mp3","vj_solb/reload (5).mp3","vj_solb/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_solb/suppress (1).mp3","vj_solb/suppress (2).mp3","vj_solb/suppress (3).mp3","vj_solb/suppress (4).mp3","vj_solb/suppress (5).mp3"}

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,4)
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
		self.Model = {"models/sentry/sentrycag/pmcma/pmc__13.mdl","models/sentry/sentrycag/pmcma/pmc__14.mdl"}
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
		self.Model = {"models/sentry/sentrycag/pmcma/pmc__13.mdl","models/sentry/sentrycag/pmcma/pmc__14.mdl"}
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
		self.Model = {"models/sentry/sentrycag/pmcma/pmc__13.mdl","models/sentry/sentrycag/pmcma/pmc__14.mdl"}
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
		self.Model = {"models/sentry/sentrycag/pmcma/pmc__13.mdl","models/sentry/sentrycag/pmcma/pmc__14.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/