AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_RUSSIAN_FRIENDLY","CLASS_ARAB_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
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
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_bf2mec/alert (1).mp3","vj_bf2mec/alert (2).mp3","vj_bf2mec/alert (3).mp3","vj_bf2mec/alert (4).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_bf2mec/bump (1).mp3","vj_bf2mec/bump (2).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_bf2mec/chatar (1).mp3","vj_bf2mec/chatar (2).mp3","vj_bf2mec/chatar (3).mp3","vj_bf2mec/chatar (4).mp3","vj_bf2mec/chatar (5).mp3","vj_bf2mec/chatar (6).mp3","vj_bf2mec/chatar (7).mp3","vj_bf2mec/chatar (8).mp3","vj_bf2mec/chatar (9).mp3","vj_bf2mec/chatar (10).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_bf2mec/combat (1).mp3","vj_bf2mec/combat (2).mp3","vj_bf2mec/combat (3).mp3","vj_bf2mec/combat (4).mp3"}
ENT.B1SoundTbl_Death = {"bfdeath/death (1).mp3","bfdeath/death (2).mp3","bfdeath/death (3).mp3","bfdeath/death (4).mp3","bfdeath/death (5).mp3","bfdeath/death (6).mp3","bfdeath/death (7).mp3","bfdeath/death (8).mp3","bfdeath/death (9).mp3","bfdeath/death (10).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_bf2mec/follow (1).mp3","vj_bf2mec/follow (2).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_bf2mec/gotmedic (1).mp3","vj_bf2mec/gotmedic (2).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_bf2mec/grenade (1).mp3","vj_bf2mec/grenade (2).mp3","vj_bf2mec/grenade (3).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_bf2mec/heal (1).mp3","vj_bf2mec/heal (2).mp3","vj_bf2mec/heal (3).mp3","vj_bf2mec/heal (4).mp3"} 
ENT.B1SoundTbl_OnGrenadeSight = {"vj_bf2mec/hidegrenade (1).mp3","vj_bf2mec/hidegrenade (2).mp3","vj_bf2mec/hidegrenade (3).mp3","vj_bf2mec/hidegrenade (4).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_bf2mec/mandown (1).mp3","vj_bf2mec/mandown (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_bf2mec/nofollow (1).mp3","vj_bf2mec/nofollow (2).mp3","vj_bf2mec/nofollow (3).mp3"}
ENT.B1SoundTbl_Pain = {"bfdeath/pain (1).mp3","bfdeath/pain (2).mp3","bfdeath/pain (3).mp3","bfdeath/pain (4).mp3","bfdeath/pain (5).mp3","bfdeath/pain (6).mp3","bfdeath/pain (7).mp3","bfdeath/pain (8).mp3","bfdeath/pain (9).mp3","bfdeath/pain (10).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_bf2mec/playerdamage (1).mp3","vj_bf2mec/playerdamage (2).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_bf2mec/reload (1).mp3","vj_bf2mec/reload (2).mp3","vj_bf2mec/reload (3).mp3","vj_bf2mec/reload (4).mp3"}

ENT.B2SoundTbl_Alert = {"vj_bf2mecsr/alert (1).mp3","vj_bf2mecsr/alert (2).mp3","vj_bf2mecsr/alert (3).mp3","vj_bf2mecsr/alert (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_bf2mecsr/bump (1).mp3","vj_bf2mecsr/bump (2).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_bf2mecsr/chatar (1).mp3","vj_bf2mecsr/chatar (2).mp3","vj_bf2mecsr/chatar (3).mp3","vj_bf2mecsr/chatar (4).mp3","vj_bf2mecsr/chatar (5).mp3","vj_bf2mecsr/chatar (6).mp3","vj_bf2mecsr/chatar (7).mp3","vj_bf2mecsr/chatar (8).mp3","vj_bf2mecsr/chatar (9).mp3","vj_bf2mecsr/chatar (10).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_bf2mecsr/combat (1).mp3","vj_bf2mecsr/combat (2).mp3","vj_bf2mecsr/combat (4).mp3","vj_bf2mecsr/combat (5).mp3","vj_bf2mecsr/combat (6).mp3","vj_bf2mecsr/combat (7).mp3"}
ENT.B2SoundTbl_Death = {"bfdeath/death (1).mp3","bfdeath/death (2).mp3","bfdeath/death (3).mp3","bfdeath/death (4).mp3","bfdeath/death (5).mp3","bfdeath/death (6).mp3","bfdeath/death (7).mp3","bfdeath/death (8).mp3","bfdeath/death (9).mp3","bfdeath/death (10).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_bf2mecsr/follow (1).mp3","vj_bf2mecsr/follow (2).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_bf2mecsr/gotmedic (1).mp3","vj_bf2mecsr/gotmedic (2).mp3"}
ENT.B2SoundTbl_GrenadeAttack = {"vj_bf2mecsr/grenade (1).mp3","vj_bf2mecsr/grenade (2).mp3","vj_bf2mecsr/grenade (3).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_bf2mecsr/heal (1).mp3","vj_bf2mecsr/heal (2).mp3","vj_bf2mecsr/heal (3).mp3","vj_bf2mecsr/heal (4).mp3"} 
ENT.B2SoundTbl_OnGrenadeSight = {"vj_bf2mecsr/hidegrenade (1).mp3","vj_bf2mecsr/hidegrenade (2).mp3","vj_bf2mecsr/hidegrenade (3).mp3","vj_bf2mecsr/hidegrenade (4).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_bf2mecsr/mandown (1).mp3","vj_bf2mecsr/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_bf2mecsr/nofollow (1).mp3","vj_bf2mecsr/nofollow (2).mp3","vj_bf2mecsr/nofollow (3).mp3"}
ENT.B2SoundTbl_Pain = {"bfdeath/pain (1).mp3","bfdeath/pain (2).mp3","bfdeath/pain (3).mp3","bfdeath/pain (4).mp3","bfdeath/pain (5).mp3","bfdeath/pain (6).mp3","bfdeath/pain (7).mp3","bfdeath/pain (8).mp3","bfdeath/pain (9).mp3","bfdeath/pain (10).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_bf2mecsr/playerdamage (1).mp3","vj_bf2mecsr/playerdamage (2).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_bf2mecsr/reload (1).mp3","vj_bf2mecsr/reload (2).mp3","vj_bf2mecsr/reload (3).mp3","vj_bf2mecsr/reload (4).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(0,1))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,2))
	self:SetBodygroup(5,math.random(0,2))
	self:SetBodygroup(6,math.random(0,2))
	self:SetBodygroup(7,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,2)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_IdleDialogueAnswer = self.B1SoundTbl_IdleDialogueAnswer
        self.SoundTbl_GrenadeAttack = self.B1SoundTbl_GrenadeAttack
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
		self.SoundTbl_AllyDeath = self.B1SoundTbl_AllyDeath
		self.SoundTbl_Suppressing = self.B1SoundTbl_Suppressing
        self.SoundTbl_BecomeEnemyToPlayer = self.B1SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B1SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/irqarmy/soldier_iraqi.mdl"}
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
        self.SoundTbl_BecomeEnemyToPlayer = self.B2SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B2SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B2SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B2SoundTbl_Investigate
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
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
        self.SoundTbl_GrenadeAttack = self.B2SoundTbl_GrenadeAttack
		self.Model = {"models/sentry/sentrycag/irqarmy/soldier_iraqi.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/