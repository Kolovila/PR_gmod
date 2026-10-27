AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/seneta/sentryetamale2.mdl"}
ENT.StartHealth = 75 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
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
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenadeThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation


ENT.SoundTbl_Alert = {"vj_csdeltspn/alert (1).mp3","vj_csdeltspn/alert (2).mp3","vj_csdeltspn/alert (3).mp3","vj_csdeltspn/alert (4).mp3","vj_csdeltspn/alert (5).mp3"}
ENT.SoundTbl_Idle = {"vj_csdeltspn/chat (1).mp3","vj_csdeltspn/chat (2).mp3","vj_csdeltspn/chat (3).mp3","vj_csdeltspn/chat (4).mp3","vj_csdeltspn/chat (5).mp3","vj_csdeltspn/chat (6).mp3","vj_csdeltspn/chat (7).mp3","vj_csdeltspn/chat (8).mp3","vj_csdeltspn/chat (9).mp3","vj_csdeltspn/chat (10).mp3"}
ENT.SoundTbl_CombatIdle = {"vj_csdeltspn/combat (1).mp3","vj_csdeltspn/combat (2).mp3","vj_csdeltspn/combat (3).mp3","vj_csdeltspn/combat (4).mp3","vj_csdeltspn/combat (5).mp3","vj_csdeltspn/combat (6).mp3","vj_csdeltspn/combat (7).mp3"}
ENT.SoundTbl_Death = {"vj_csdeltspn/death (1).mp3","vj_csdeltspn/death (2).mp3","vj_csdeltspn/death (3).mp3","vj_csdeltspn/death (4).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_csdeltspn/follow (1).mp3","vj_csdeltspn/follow (2).mp3","vj_csdeltspn/follow (3).mp3"}
ENT.SoundTbl_GrenadeAttack = {"vj_csdeltspn/grenade (1).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_csdeltspn/hidegrenade (1).mp3","vj_csdeltspn/hidegrenade (2).mp3","vj_csdeltspn/hidegrenade (3).mp3"}
ENT.SoundTbl_IdleDialogue = {"vj_csdeltspn/idle (1).mp3","vj_csdeltspn/idle (2).mp3","vj_csdeltspn/idle (3).mp3","vj_csdeltspn/idle (4).mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_csdeltspn/idleans (1).mp3","vj_csdeltspn/idleans (2).mp3"}
ENT.SoundTbl_Investigate = {"vj_csdeltspn/invest (1).mp3","vj_csdeltspn/invest (2).mp3","vj_csdeltspn/invest (3).mp3","vj_csdeltspn/invest (4).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_csdeltspn/nofollow (1).mp3","vj_csdeltspn/nofollow (2).mp3","vj_csdeltspn/nofollow (3).mp3"}
ENT.SoundTbl_Pain = {"vj_csdeltspn/pain (1).mp3","vj_csdeltspn/pain (2).mp3","vj_csdeltspn/pain (3).mp3","vj_csdeltspn/pain (4).mp3","vj_csdeltspn/pain (5).mp3","vj_csdeltspn/pain (6).mp3"}
ENT.SoundTbl_Suppressing = {"vj_csdeltspn/suppress (1).mp3","vj_csdeltspn/suppress (2).mp3","vj_csdeltspn/suppress (3).mp3","vj_csdeltspn/suppress (4).mp3","vj_csdeltspn/suppress (5).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,0))
	self:SetBodygroup(2,math.random(0,2))
	self:SetBodygroup(3,math.random(0,3))
	self:SetBodygroup(4,math.random(0,0))
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/