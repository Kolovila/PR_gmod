AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/ultranation/rnu_02.mdl","models/sentry/sentrycag/ultranation/rnu_04.mdl","models/sentry/sentrycag/ultranation/rnu_06.mdl","models/sentry/sentrycag/ultranation/rnu_07.mdl","models/sentry/sentrycag/ultranation/rnu_08.mdl","models/sentry/sentrycag/ultranation/rnu_09.mdl",}
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_NATIONALIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 20
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Alert = {"vj_csdeltrus/alert (1).mp3","vj_csdeltrus/alert (2).mp3","vj_csdeltrus/alert (3).mp3","vj_csdeltrus/alert (4).mp3","vj_csdeltrus/alert (5).mp3"}
ENT.SoundTbl_Idle = {"vj_csdeltrus/chat (1).mp3","vj_csdeltrus/chat (2).mp3","vj_csdeltrus/chat (3).mp3","vj_csdeltrus/chat (4).mp3","vj_csdeltrus/chat (5).mp3","vj_csdeltrus/chat (6).mp3","vj_csdeltrus/chat (7).mp3"}
ENT.SoundTbl_CombatIdle = {"vj_csdeltrus/combat (1).mp3","vj_csdeltrus/combat (2).mp3","vj_csdeltrus/combat (3).mp3","vj_csdeltrus/combat (4).mp3","vj_csdeltrus/combat (5).mp3","vj_csdeltrus/combat (6).mp3","vj_csdeltrus/combat (7).mp3"}
ENT.SoundTbl_Death = {"vj_csdeltrus/death (1).mp3","vj_csdeltrus/death (2).mp3","vj_csdeltrus/death (3).mp3","vj_csdeltrus/death (4).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_csdeltrus/follow (1).mp3","vj_csdeltrus/follow (2).mp3","vj_csdeltrus/follow (3).mp3"}
ENT.SoundTbl_GrenadeAttack = {"vj_csdeltrus/grenade (1).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_csdeltrus/hidegrenade (1).mp3","vj_csdeltrus/hidegrenade (2).mp3","vj_csdeltrus/hidegrenade (3).mp3"}
ENT.SoundTbl_IdleDialogue = {"vj_csdeltrus/idle (1).mp3","vj_csdeltrus/idle (2).mp3","vj_csdeltrus/idle (3).mp3","vj_csdeltrus/idle (4).mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_csdeltrus/idleans (1).mp3","vj_csdeltrus/idleans (2).mp3"}
ENT.SoundTbl_Investigate = {"vj_csdeltrus/invest (1).mp3","vj_csdeltrus/invest (2).mp3","vj_csdeltrus/invest (3).mp3","vj_csdeltrus/invest (4).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_csdeltrus/nofollow (1).mp3","vj_csdeltrus/nofollow (2).mp3","vj_csdeltrus/nofollow (3).mp3"}
ENT.SoundTbl_Pain = {"vj_csdeltrus/pain (1).mp3","vj_csdeltrus/pain (2).mp3","vj_csdeltrus/pain (3).mp3","vj_csdeltrus/pain (4).mp3","vj_csdeltrus/pain (5).mp3","vj_csdeltrus/pain (6).mp3"}
ENT.SoundTbl_Suppressing = {"vj_csdeltrus/suppress (1).mp3","vj_csdeltrus/suppress (2).mp3","vj_csdeltrus/suppress (3).mp3","vj_csdeltrus/suppress (4).mp3","vj_csdeltrus/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(3,math.random(0,0))
	self:SetBodygroup(4,math.random(0,2))
	self:SetBodygroup(5,math.random(0,0))
   local suit = math.random(1,2)
        if suit == 1 then
self:SetBodygroup(1,0)
self:SetBodygroup(2,0)	
	elseif suit == 2 then
self:SetBodygroup(1,1)
self:SetBodygroup(2,1)	
       end   
	end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/