AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/sencomie/male_05ara.mdl"}
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_CHINA","CLASS_RUSSIAN"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Alert = {"vj_csdeltya/alert (1).mp3","vj_csdeltya/alert (2).mp3","vj_csdeltya/alert (3).mp3","vj_csdeltya/alert (4).mp3","vj_csdeltya/alert (5).mp3"}
ENT.SoundTbl_Idle = {"vj_csdeltya/chat (1).mp3","vj_csdeltya/chat (2).mp3","vj_csdeltya/chat (3).mp3","vj_csdeltya/chat (4).mp3","vj_csdeltya/chat (5).mp3","vj_csdeltya/chat (6).mp3","vj_csdeltya/chat (7).mp3"}
ENT.SoundTbl_CombatIdle = {"vj_csdeltya/combat (1).mp3","vj_csdeltya/combat (2).mp3","vj_csdeltya/combat (3).mp3","vj_csdeltya/combat (4).mp3","vj_csdeltya/combat (5).mp3","vj_csdeltya/combat (6).mp3","vj_csdeltya/combat (7).mp3"}
ENT.SoundTbl_Death = {"vj_csdeltya/death (1).mp3","vj_csdeltya/death (2).mp3","vj_csdeltya/death (3).mp3","vj_csdeltya/death (4).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_csdeltya/follow (1).mp3","vj_csdeltya/follow (2).mp3","vj_csdeltya/follow (3).mp3"}
ENT.SoundTbl_GrenadeAttack = {"vj_csdeltya/grenade (1).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_csdeltya/hidegrenade (1).mp3","vj_csdeltya/hidegrenade (2).mp3","vj_csdeltya/hidegrenade (3).mp3"}
ENT.SoundTbl_IdleDialogue = {"vj_csdeltya/idle (1).mp3","vj_csdeltya/idle (2).mp3","vj_csdeltya/idle (3).mp3","vj_csdeltya/idle (4).mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_csdeltya/idleans (1).mp3","vj_csdeltya/idleans (2).mp3"}
ENT.SoundTbl_Investigate = {"vj_csdeltya/invest (1).mp3","vj_csdeltya/invest (2).mp3","vj_csdeltya/invest (3).mp3","vj_csdeltya/invest (4).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_csdeltya/nofollow (1).mp3","vj_csdeltya/nofollow (2).mp3","vj_csdeltya/nofollow (3).mp3"}
ENT.SoundTbl_Pain = {"vj_csdeltya/pain (1).mp3","vj_csdeltya/pain (2).mp3","vj_csdeltya/pain (3).mp3","vj_csdeltya/pain (4).mp3","vj_csdeltya/pain (5).mp3","vj_csdeltya/pain (6).mp3"}
ENT.SoundTbl_Suppressing = {"vj_csdeltya/suppress (1).mp3","vj_csdeltya/suppress (2).mp3","vj_csdeltya/suppress (3).mp3","vj_csdeltya/suppress (4).mp3","vj_csdeltya/suppress (5).mp3","vj_csdeltya/suppress (6).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,3))
	self:SetBodygroup(2,math.random(0,3))
	self:SetBodygroup(3,math.random(0,2))   
	self:SetBodygroup(4,math.random(3,3))   
	self:SetBodygroup(5,math.random(0,0))   
	self:SetBodygroup(6,math.random(0,0))   
	   end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/