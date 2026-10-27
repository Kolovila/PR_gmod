AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 80 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_IRISH_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"Melee_Slice","Kick_Door"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenadethrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}

ENT.B1SoundTbl_Alert = {"vj_derekmc/alert (1).mp3","vj_derekmc/alert (2).mp3","vj_derekmc/alert (3).mp3","vj_derekmc/alert (4).mp3","vj_derekmc/alert (5).mp3","vj_derekmc/alert (6).mp3","vj_derekmc/alert (7).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_derekmc/becomehos (1).mp3","vj_derekmc/becomehos (2).mp3","vj_derekmc/becomehos (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_derekmc/bump (1).mp3","vj_derekmc/bump (2).mp3","vj_derekmc/bump (3).mp3","vj_derekmc/bump (4).mp3","vj_derekmc/bump (5).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_derekmc/chat (1).mp3","vj_derekmc/chat (2).mp3","vj_derekmc/chat (3).mp3","vj_derekmc/chat (4).mp3","vj_derekmc/chat (5).mp3","vj_derekmc/chat (6).mp3","vj_derekmc/chat (7).mp3","vj_derekmc/chat (8).mp3","vj_derekmc/chat (9).mp3","vj_derekmc/chat (10).mp3","vj_derekmc/chat (11).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_derekmc/combat (1).mp3","vj_derekmc/combat (2).mp3","vj_derekmc/combat (3).mp3","vj_derekmc/combat (4).mp3","vj_derekmc/combat (5).mp3","vj_derekmc/combat (6).mp3","vj_derekmc/combat (7).mp3","vj_derekmc/combat (8).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_derekmc/follow (1).mp3","vj_derekmc/follow (2).mp3","vj_derekmc/follow (3).mp3","vj_derekmc/follow (4).mp3","vj_derekmc/follow (5).mp3","vj_derekmc/follow (6).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_derekmc/gotmedic (1).mp3","vj_derekmc/gotmedic (2).mp3","vj_derekmc/gotmedic (3).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_derekmc/heal (1).mp3","vj_derekmc/heal (2).mp3","vj_derekmc/heal (3).mp3"} 
ENT.B1SoundTbl_OnPlayerSight = {"vj_derekmc/hi (1).mp3","vj_derekmc/hi (2).mp3","vj_derekmc/hi (3).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_derekmc/hidegrenade (1).mp3","vj_derekmc/hidegrenade (3).mp3","vj_derekmc/hidegrenade (2).mp3","vj_derekmc/hidegrenade (4).mp3","vj_derekmc/hidegrenade (5).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_derekmc/invest (1).mp3","vj_derekmc/invest (2).mp3","vj_derekmc/invest (3).mp3","vj_derekmc/invest (4).mp3","vj_derekmc/invest (5).mp3","vj_derekmc/invest (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_derekmc/kill (1).mp3","vj_derekmc/kill (2).mp3","vj_derekmc/kill (3).mp3","vj_derekmc/kill (4).mp3","vj_derekmc/kill (5).mp3","vj_derekmc/kill (6).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_derekmc/losthim (1).mp3","vj_derekmc/losthim (2).mp3","vj_derekmc/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_derekmc/nofollow (1).mp3","vj_derekmc/nofollow (2).mp3","vj_derekmc/nofollow (3).mp3","vj_derekmc/nofollow (4).mp3","vj_derekmc/nofollow (5).mp3","vj_derekmc/nofollow (6).mp3"}
ENT.B1SoundTbl_Pain = {"vj_derekmc/pain (1).mp3","vj_derekmc/pain (2).mp3","vj_derekmc/pain (3).mp3","vj_derekmc/pain (4).mp3","vj_derekmc/pain (5).mp3","vj_derekmc/pain (6).mp3","vj_derekmc/pain (7).mp3","vj_derekmc/pain (8).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_derekmc/playerdamage (1).mp3","vj_derekmc/playerdamage (2).mp3","vj_derekmc/playerdamage (3).mp3","vj_derekmc/playerdamage (4).mp3","vj_derekmc/playerdamage (5).mp3","vj_derekmc/playerdamage (6).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_derekmc/reload (1).mp3","vj_derekmc/reload (2).mp3","vj_derekmc/reload (3).mp3","vj_derekmc/reload (4).mp3","vj_derekmc/reload (5).mp3","vj_derekmc/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_derekmc/suppress (1).mp3","vj_derekmc/suppress (2).mp3","vj_derekmc/suppress (3).mp3","vj_derekmc/suppress (4).mp3","vj_derekmc/suppress (5).mp3","vj_derekmc/suppress (6).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(3,3))
	self:SetBodygroup(3,math.random(0,0))
	self:SetBodygroup(4,math.random(0,0))
	self:SetBodygroup(5,math.random(1,1))
	self:SetBodygroup(6,math.random(0,1))
	if math.random(1,10) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,1)
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
		self.Model = {"models/sentry/sentrycag/senira/le/sentryseniramale2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/senira/sentryseniramale2.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/