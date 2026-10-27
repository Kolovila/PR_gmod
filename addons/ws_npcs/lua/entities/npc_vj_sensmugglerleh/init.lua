AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/sensmuggler/somali_pirate_mp.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_LATINOMOB","CLASS_WESTTERROR","CLASS_NATIONALIST","CLASS_MILITIA","CLASS_PARAMILITARY"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Alert = {"vj_vgenchwrkb1/alert (1).mp3","vj_vgenchwrkb1/alert (2).mp3","vj_vgenchwrkb1/alert (3).mp3","vj_vgenchwrkb1/alert (4).mp3"}
ENT.SoundTbl_MoveOutOfPlayersWay = {"vj_vgenchwrkb1/bump (1).mp3","vj_vgenchwrkb1/bump (2).mp3","vj_vgenchwrkb1/bump (3).mp3","vj_vgenchwrkb1/bump (4).mp3"} 
ENT.SoundTbl_Idle = {"vj_vgenchwrkb1/chat (1).mp3","vj_vgenchwrkb1/chat (2).mp3","vj_vgenchwrkb1/chat (3).mp3","vj_vgenchwrkb1/chat (4).mp3","vj_vgenchwrkb1/chat (5).mp3","vj_vgenchwrkb1/chat (6).mp3","vj_vgenchwrkb1/chat (7).mp3","vj_vgenchwrkb1/chat (8).mp3"}
ENT.SoundTbl_CombatIdle = {"vj_vgenchwrkb1/combat (1).mp3","vj_vgenchwrkb1/combat (2).mp3","vj_vgenchwrkb1/combat (3).mp3","vj_vgenchwrkb1/combat (4).mp3","vj_vgenchwrkb1/combat (5).mp3"}
ENT.SoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3","death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_vgenchwrkb1/follow (1).mp3","vj_vgenchwrkb1/follow (2).mp3","vj_vgenchwrkb1/follow (3).mp3","vj_vgenchwrkb1/follow (4).mp3"}
ENT.SoundTbl_MedicReceiveHeal = {"vj_vgenchwrkb1/gotmedic (1).mp3"}
ENT.SoundTbl_MedicBeforeHeal = {"vj_vgenchwrkb1/heal (1).mp3","vj_vgenchwrkb1/heal (2).mp3"} 
ENT.SoundTbl_OnPlayerSight = {"vj_vgenchwrkb1/hi (1).mp3","vj_vgenchwrkb1/hi (2).mp3","vj_vgenchwrkb1/hi (3).mp3","vj_vgenchwrkb1/hi (4).mp3","vj_vgenchwrkb1/hi (5).mp3","vj_vgenchwrkb1/hi (6).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_vgenchwrkb1/hidegrenade (1).mp3","vj_vgenchwrkb1/hidegrenade (3).mp3","vj_vgenchwrkb1/hidegrenade (2).mp3","vj_vgenchwrkb1/hidegrenade (4).mp3"}
ENT.SoundTbl_Investigate = {"vj_vgenchwrkb1/invest (1).mp3","vj_vgenchwrkb1/invest (2).mp3","vj_vgenchwrkb1/invest (3).mp3","vj_vgenchwrkb1/invest (4).mp3"}
ENT.SoundTbl_OnKilledEnemy = {"vj_vgenchwrkb1/kill (1).mp3","vj_vgenchwrkb1/kill (2).mp3","vj_vgenchwrkb1/kill (3).mp3"}
ENT.SoundTbl_LostEnemy = {"vj_vgenchwrkb1/losthim (1).mp3","vj_vgenchwrkb1/losthim (2).mp3","vj_vgenchwrkb1/losthim (3).mp3"}
ENT.SoundTbl_AllyDeath = {"vj_vgenchwrkb1/mandown (1).mp3","vj_vgenchwrkb1/mandown (2).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_vgenchwrkb1/nofollow (1).mp3","vj_vgenchwrkb1/nofollow (2).mp3","vj_vgenchwrkb1/nofollow (3).mp3","vj_vgenchwrkb1/nofollow (4).mp3"}
ENT.SoundTbl_Pain = {"vj_vgenchwrkb1/pain (1).mp3","vj_vgenchwrkb1/pain (2).mp3","vj_vgenchwrkb1/pain (3).mp3","vj_vgenchwrkb1/pain (4).mp3","vj_vgenchwrkb1/pain (5).mp3","vj_vgenchwrkb1/pain (6).mp3","vj_vgenchwrkb1/pain (7).mp3"}
ENT.SoundTbl_DamageByPlayer = {"vj_vgenchwrkb1/playerdamage (1).mp3","vj_vgenchwrkb1/playerdamage (2).mp3","vj_vgenchwrkb1/playerdamage (3).mp3","vj_vgenchwrkb1/playerdamage (4).mp3","vj_vgenchwrkb1/playerdamage (5).mp3"}
ENT.SoundTbl_Suppressing = {"vj_vgenchwrkb1/suppress (1).mp3","vj_vgenchwrkb1/suppress (2).mp3","vj_vgenchwrkb1/suppress (3).mp3","vj_vgenchwrkb1/suppress (4).mp3","vj_vgenchwrkb1/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(0,2))
	self:SetBodygroup(3,math.random(0,1))
	self:SetBodygroup(4,math.random(0,3))
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
	end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/