AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/senroguecop/su/senmfc2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 70 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_WESTTERROR_FRIENDLY","CLASS_NATIONALIST_FRIENDLY","CLASS_MILITIA_FRIENDLY","CLASS_PARAMILITARY_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_slice","kick_door"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_Alert = {"vj_senlincen/alert (1).mp3","vj_senlincen/alert (2).mp3","vj_senlincen/alert (3).mp3","vj_senlincen/alert (4).mp3"}
ENT.SoundTbl_Idle = {"vj_senlincen/chat (1).mp3","vj_senlincen/chat (2).mp3","vj_senlincen/chat (3).mp3","vj_senlincen/chat (4).mp3","vj_senlincen/chat (5).mp3","vj_senlincen/chat (6).mp3","vj_senlincen/chat (7).mp3","vj_senlincen/chat (8).mp3","vj_senlincen/chat (9).mp3","vj_senlincen/chat (10).mp3"}
ENT.SoundTbl_CombatIdle = {"vj_senlincen/combat (1).mp3","vj_senlincen/combat (2).mp3","vj_senlincen/combat (3).mp3","vj_senlincen/combat (4).mp3","vj_senlincen/combat (5).mp3"}
ENT.SoundTbl_Death = {"vj_senlincen/death (1).mp3","vj_senlincen/death (2).mp3","vj_senlincen/death (3).mp3","vj_senlincen/death (4).mp3","vj_senlincen/death (5).mp3","vj_senlincen/death (6).mp3","vj_senlincen/death (7).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_senlincen/follow (1).mp3","vj_senlincen/follow (2).mp3","vj_senlincen/follow (3).mp3","vj_senlincen/follow (4).mp3","vj_senlincen/follow (5).mp3"}
ENT.SoundTbl_GrenadeAttack = {"vj_senlincen/grenade (1).mp3","vj_senlincen/grenade (2).mp3"}
ENT.SoundTbl_CallForHelp = {"vj_senlincen/help (1).mp3","vj_senlincen/help (2).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_senlincen/hidegrenade (1).mp3","vj_senlincen/hidegrenade (2).mp3"}
ENT.SoundTbl_OnKilledEnemy = {"vj_senlincen/kill (1).mp3","vj_senlincen/kill (2).mp3","vj_senlincen/kill (3).mp3","vj_senlincen/kill (4).mp3","vj_senlincen/kill (5).mp3"}
ENT.SoundTbl_LostEnemy = {"vj_senlincen/losthim (1).mp3","vj_senlincen/losthim (2).mp3","vj_senlincen/losthim (3).mp3"}
ENT.SoundTbl_AllyDeath = {"vj_senlincen/mandown (1).mp3","vj_senlincen/mandown (2).mp3","vj_senlincen/mandown (3).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_senlincen/nofollow (1).mp3","vj_senlincen/nofollow (2).mp3","vj_senlincen/nofollow (3).mp3","vj_senlincen/nofollow (4).mp3"}
ENT.SoundTbl_Pain = {"vj_senlincen/pain (1).mp3","vj_senlincen/pain (2).mp3","vj_senlincen/pain (3).mp3","vj_senlincen/pain (4).mp3","vj_senlincen/pain (5).mp3","vj_senlincen/pain (6).mp3","vj_senlincen/pain (7).mp3","vj_senlincen/pain (8).mp3"}
ENT.SoundTbl_WeaponReload = {"vj_senlincen/reload (1).mp3","vj_senlincen/reload (2).mp3","vj_senlincen/reload (3).mp3","vj_senlincen/reload (4).mp3","vj_senlincen/reload (5).mp3","vj_senlincen/reload (6).mp3"}
ENT.SoundTbl_Suppressing = {"vj_senlincen/suppress (1).mp3","vj_senlincen/suppress (2).mp3","vj_senlincen/suppress (3).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,12))
	self:SetBodygroup(1,math.random(1,3))
	self:SetBodygroup(2,math.random(2,2))
	self:SetBodygroup(3,math.random(2,3))
	self:SetBodygroup(4,math.random(0,2))
	self:SetBodygroup(5,math.random(2,3))
	self:SetBodygroup(6,math.random(1,1))
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
	end


/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/