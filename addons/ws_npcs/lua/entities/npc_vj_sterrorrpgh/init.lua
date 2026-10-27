AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/terrorist/taliban_rpgmp.mdl"}
ENT.StartHealth = 55 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.CanThrowBackDetectedGrenades = true
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"meleeattack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.SuppressingSoundChance = 1

ENT.SoundTbl_Alert = {"vj_sterror1/alert (1).wav","vj_sterror1/alert (2).wav","vj_sterror1/alert (3).wav"}
ENT.SoundTbl_Idle = {"vj_sterror1/chat (1).wav","vj_sterror1/chat (2).wav","vj_sterror1/chat (3).wav","vj_sterror1/chat (4).wav","vj_sterror1/chat (5).wav","vj_sterror1/chat (6).wav","vj_sterror1/chat (7).wav","vj_sterror1/chat (8).wav","vj_sterror1/chat (9).wav"}
ENT.SoundTbl_CombatIdle = {"vj_sterror1/combat (1).wav","vj_sterror1/combat (2).wav","vj_sterror1/combat (3).wav","vj_sterror1/combat (4).wav","vj_sterror1/combat (5).wav","vj_sterror1/combat (6).wav","vj_sterror1/combat (7).wav"}
ENT.SoundTbl_Death = {"vj_sterror/died (1).wav","vj_sterror/died (2).wav","vj_sterror/died (3).wav","vj_sterror/died (4).wav","vj_sterror/died (5).wav","vj_sterror/died (6).wav","vj_sterror/died (7).wav","vj_sterror/died (8).wav","vj_sterror/died (9).wav"}
ENT.SoundTbl_OnGrenadeSight = {"vj_sterror1/hidegrenade (1).wav","vj_sterror1/hidegrenade (3).wav","vj_sterror1/hidegrenade (2).wav","vj_sterror1/hidegrenade (4).wav","vj_sterror1/hidegrenade (5).wav","vj_sterror1/hidegrenade (6).wav"}
ENT.SoundTbl_CallForHelp = {"vj_sterror1/alert (1).wav","vj_sterror1/alert (2).wav","vj_sterror1/alert (3).wav"}
ENT.SoundTbl_Pain = {"vj_sterror1/pain (1).wav","vj_sterror1/pain (2).wav","vj_sterror1/pain (3).wav","vj_sterror1/pain (4).wav"}
ENT.SoundTbl_Suppressing = {"vj_sterror/combat (6).wav","vj_sterror/suppress (1).wav","vj_sterror/suppress (2).wav","vj_sterror/suppress (3).wav"}
ENT.SoundTbl_OnKilledEnemy = {"vj_sterror1/kill (1).wav","vj_sterror1/kill (2).wav","vj_sterror1/kill (3).wav","vj_sterror1/kill (4).wav"}
ENT.SoundTbl_LostEnemy = {"vj_sterror1/losthim (1).wav","vj_sterror1/losthim (2).wav","vj_sterror1/losthim (3).wav","vj_sterror1/losthim (4).wav"}
ENT.SoundTbl_AllyDeath = {"vj_sterror1/mandown (1).wav","vj_sterror1/mandown (2).wav","vj_sterror1/mandown (3).wav","vj_sterror1/mandown (4).wav"}

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/