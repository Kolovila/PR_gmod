AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_ANARCHIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
--ENT.AnimTbl_IdleStand = {"pistolidle1"}

ENT.B3SoundTbl_Alert = {"vj_senjoeen/alert (1).mp3","vj_senjoeen/alert (2).mp3","vj_senjoeen/alert (3).mp3","vj_senjoeen/alert (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_senjoeen/bump (1).mp3","vj_senjoeen/bump (2).mp3","vj_senjoeen/bump (3).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_senjoeen/chat (1).mp3","vj_senjoeen/chat (2).mp3","vj_senjoeen/chat (3).mp3","vj_senjoeen/chat (4).mp3","vj_senjoeen/chat (5).mp3","vj_senjoeen/chat (6).mp3","vj_senjoeen/chat (7).mp3","vj_senjoeen/chat (8).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_senjoeen/combat (1).mp3","vj_senjoeen/combat (2).mp3","vj_senjoeen/combat (3).mp3","vj_senjoeen/combat (4).mp3","vj_senjoeen/combat (5).mp3"}
ENT.B3SoundTbl_Death = {"vj_senjoeen/death (1).mp3","vj_senjoeen/death (2).mp3","vj_senjoeen/death (3).mp3","vj_senjoeen/death (4).mp3","vj_senjoeen/death (5).mp3","vj_senjoeen/death (6).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_senjoeen/follow (1).mp3","vj_senjoeen/follow (2).mp3","vj_senjoeen/follow (3).mp3","vj_senjoeen/follow (4).mp3","vj_senjoeen/follow (5).mp3","vj_senjoeen/follow (6).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_senjoeen/gotmedic (1).mp3","vj_senjoeen/gotmedic (2).mp3"}
ENT.B3SoundTbl_CallForHelp = {"vj_senjoeen/help (1).mp3","vj_senjoeen/help (2).mp3","vj_senjoeen/help (3).mp3"}
ENT.B3SoundTbl_OnPlayerSight = {"vj_senjoeen/hi (1).mp3","vj_senjoeen/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_senjoeen/hidegrenade (1).mp3","vj_senjoeen/hidegrenade (3).mp3","vj_senjoeen/hidegrenade (2).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_senjoeen/invest (1).mp3","vj_senjoeen/invest (2).mp3","vj_senjoeen/invest (3).mp3","vj_senjoeen/invest (4).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_senjoeen/kill (1).mp3","vj_senjoeen/kill (2).mp3","vj_senjoeen/kill (3).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_senjoeen/losthim (1).mp3","vj_senjoeen/losthim (2).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_senjoeen/mandown (1).mp3","vj_senjoeen/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_senjoeen/nofollow (1).mp3","vj_senjoeen/nofollow (2).mp3","vj_senjoeen/nofollow (3).mp3","vj_senjoeen/nofollow (4).mp3","vj_senjoeen/nofollow (5).mp3"}
ENT.B3SoundTbl_Pain = {"vj_senjoeen/pain (1).mp3","vj_senjoeen/pain (2).mp3","vj_senjoeen/pain (3).mp3","vj_senjoeen/pain (4).mp3","vj_senjoeen/pain (5).mp3","vj_senjoeen/pain (6).mp3","vj_senjoeen/pain (7).mp3","vj_senjoeen/pain (8).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_senjoeen/reload (1).mp3","vj_senjoeen/reload (2).mp3","vj_senjoeen/reload (3).mp3","vj_senjoeen/reload (4).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_senjoeen/suppress (1).mp3","vj_senjoeen/suppress (2).mp3","vj_senjoeen/suppress (3).mp3","vj_senjoeen/suppress (4).mp3","vj_senjoeen/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,0))
	self:SetBodygroup(1,math.random(0,0))
	self:SetBodygroup(2,math.random(0,2))
	self:SetBodygroup(3,math.random(0,3))
	self:SetBodygroup(4,math.random(0,1))
	self:SetBodygroup(5,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(3,3)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/crewman1.mdl"}
	else
		if randomvoice == 3 then
		self.Race = "B3"
	
        self.SoundTbl_Death = self.B3SoundTbl_Death
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
		self.Model = {"models/sentry/sentrycag/crewman1.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/