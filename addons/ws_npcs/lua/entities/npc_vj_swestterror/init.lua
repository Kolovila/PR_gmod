AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_WESTTERROR_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
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
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.AnimTbl_IdleStand = {"pistolidle1"}

ENT.B1SoundTbl_Alert = {"vj_senog1/alert (1).mp3","vj_senog1/alert (2).mp3","vj_senog1/alert (3).mp3","vj_senog1/alert (4).mp3","vj_senog1/alert (5).mp3","vj_senog1/alert (6).mp3","vj_senog1/alert (7).mp3","vj_senog1/alert (8).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_senog1/becomehos (1).mp3","vj_senog1/becomehos (2).mp3","vj_senog1/becomehos (3).mp3","vj_senog1/becomehos (4).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_senog1/bump (1).mp3","vj_senog1/bump (2).mp3","vj_senog1/bump (3).mp3","vj_senog1/bump (4).mp3","vj_senog1/bump (5).mp3","vj_senog1/bump (6).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_senog1/chat (1).mp3","vj_senog1/chat (2).mp3","vj_senog1/chat (3).mp3","vj_senog1/chat (4).mp3","vj_senog1/chat (5).mp3","vj_senog1/chat (6).mp3","vj_senog1/chat (7).mp3","vj_senog1/chat (8).mp3","vj_senog1/chat (9).mp3","vj_senog1/chat (10).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_senog1/combat (1).mp3","vj_senog1/combat (2).mp3","vj_senog1/combat (3).mp3","vj_senog1/combat (4).mp3","vj_senog1/combat (5).mp3","vj_senog1/combat (6).mp3","vj_senog1/combat (7).mp3","vj_senog1/combat (8).mp3"}
ENT.B1SoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_senog1/follow (1).mp3","vj_senog1/follow (2).mp3","vj_senog1/follow (3).mp3","vj_senog1/follow (4).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_senog1/gotmedic (1).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_senog1/heal (1).mp3","vj_senog1/heal (2).mp3"} 
ENT.B1SoundTbl_OnPlayerSight = {"vj_senog1/hi (1).mp3","vj_senog1/hi (2).mp3","vj_senog1/hi (3).mp3","vj_senog1/hi (4).mp3","vj_senog1/hi (5).mp3","vj_senog1/hi (6).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_senog1/hidegrenade (1).mp3","vj_senog1/hidegrenade (3).mp3","vj_senog1/hidegrenade (2).mp3","vj_senog1/hidegrenade (4).mp3","vj_senog1/hidegrenade (5).mp3","vj_senog1/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_senog1/kill (1).mp3","vj_senog1/kill (2).mp3","vj_senog1/kill (3).mp3","vj_senog1/kill (4).mp3","vj_senog1/kill (5).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_senog1/losthim (1).mp3","vj_senog1/losthim (2).mp3","vj_senog1/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_senog1/nofollow (1).mp3","vj_senog1/nofollow (2).mp3","vj_senog1/nofollow (3).mp3","vj_senog1/nofollow (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_senog1/pain (1).mp3","vj_senog1/pain (2).mp3","vj_senog1/pain (3).mp3","vj_senog1/pain (4).mp3","vj_senog1/pain (5).mp3","vj_senog1/pain (6).mp3","vj_senog1/pain (7).mp3","vj_senog1/pain (8).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_senog1/playerdamage (1).mp3","vj_senog1/playerdamage (2).mp3","vj_senog1/playerdamage (3).mp3","vj_senog1/playerdamage (4).mp3","vj_senog1/playerdamage (5).mp3","vj_senog1/playerdamage (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_senog1/suppress (1).mp3","vj_senog1/suppress (2).mp3","vj_senog1/suppress (3).mp3","vj_senog1/suppress (4).mp3","vj_senog1/suppress (5).mp3"}

ENT.B2SoundTbl_Alert = {"vj_salgoon5/alert (1).mp3","vj_salgoon5/alert (2).mp3","vj_salgoon5/alert (3).mp3","vj_salgoon5/alert (4).mp3","vj_salgoon5/alert (5).mp3","vj_salgoon5/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_salgoon5/becomehos (1).mp3","vj_salgoon5/becomehos (2).mp3","vj_salgoon5/becomehos (3).mp3","vj_salgoon5/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_salgoon5/bump (1).mp3","vj_salgoon5/bump (2).mp3","vj_salgoon5/bump (3).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_salgoon5/chat (1).mp3","vj_salgoon5/chat (2).mp3","vj_salgoon5/chat (3).mp3","vj_salgoon5/chat (4).mp3","vj_salgoon5/chat (5).mp3","vj_salgoon5/chat (6).mp3","vj_salgoon5/chat (7).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_salgoon5/combat (1).mp3","vj_salgoon5/combat (2).mp3","vj_salgoon5/combat (3).mp3","vj_salgoon5/combat (4).mp3","vj_salgoon5/combat (5).mp3","vj_salgoon5/combat (6).mp3","vj_salgoon5/combat (7).mp3","vj_salgoon5/combat (8).mp3","vj_salgoon5/combat (9).mp3","vj_salgoon5/combat (10).mp3"}
ENT.B2SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_salgoon5/follow (1).mp3","vj_salgoon5/follow (2).mp3","vj_salgoon5/follow (3).mp3","vj_salgoon5/follow (4).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_salgoon5/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_salgoon5/heal (1).mp3","vj_salgoon5/heal (2).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_salgoon5/hi (1).mp3",}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_salgoon5/hidegrenade (1).mp3","vj_salgoon5/hidegrenade (3).mp3","vj_salgoon5/hidegrenade (2).mp3","vj_salgoon5/hidegrenade (4).mp3","vj_salgoon5/hidegrenade (5).mp3","vj_salgoon5/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_salgoon5/invest (1).mp3","vj_salgoon5/invest (2).mp3","vj_salgoon5/invest (3).mp3","vj_salgoon5/invest (4).mp3","vj_salgoon5/invest (5).mp3","vj_salgoon5/invest (6).mp3",}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_salgoon5/kill (1).mp3","vj_salgoon5/kill (2).mp3","vj_salgoon5/kill (3).mp3","vj_salgoon5/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_salgoon5/losthim (1).mp3","vj_salgoon5/losthim (2).mp3","vj_salgoon5/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_salgoon5/mandown (1).mp3","vj_salgoon5/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_salgoon5/nofollow (1).mp3"}
ENT.B2SoundTbl_Pain = {"vj_salgoon5/pain (1).mp3","vj_salgoon5/pain (2).mp3","vj_salgoon5/pain (3).mp3","vj_salgoon5/pain (4).mp3","vj_salgoon5/pain (5).mp3","vj_salgoon5/pain (6).mp3","vj_salgoon5/pain (7).mp3","vj_salgoon5/pain (8).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_salgoon5/playerdamage (1).mp3","vj_salgoon5/playerdamage (2).mp3","vj_salgoon5/playerdamage (3).mp3","vj_salgoon5/playerdamage (4).mp3","vj_salgoon5/playerdamage (5).mp3","vj_salgoon5/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_salgoon5/reload (1).mp3","vj_salgoon5/reload (2).mp3","vj_salgoon5/reload (3).mp3","vj_salgoon5/reload (4).mp3","vj_salgoon5/reload (5).mp3","vj_salgoon5/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_salgoon5/suppress (1).mp3","vj_salgoon5/suppress (2).mp3","vj_salgoon5/suppress (3).mp3","vj_salgoon5/suppress (4).mp3","vj_salgoon5/suppress (5).mp3","vj_salgoon5/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,1))
	self:SetBodygroup(0,math.random(0,1))
	self:SetBodygroup(1,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,2)
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
		self.Model = {"models/sentry/sentrycag/westterror/robber_npccit.mdl","models/sentry/sentrycag/westterror/2055_teror.mdl","models/sentry/sentrycag/westterror/woodland_miltia.mdl"}
	else
	if randomvoice == 2 then
		self.Race = "B2"
	
        self.SoundTbl_Death = self.B2SoundTbl_Death
		self.SoundTbl_Idle = self.B2SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
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
		self.Model = {"models/sentry/sentrycag/westterror/robber_npccit.mdl","models/sentry/sentrycag/westterror/2055_teror.mdl","models/sentry/sentrycag/westterror/woodland_miltia.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/