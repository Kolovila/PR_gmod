AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_WESTTERROR_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 20
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}

ENT.SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}

ENT.B3SoundTbl_Alert = {"vj_ivgunnut/alert (1).mp3","vj_ivgunnut/alert (2).mp3","vj_ivgunnut/alert (3).mp3","vj_ivgunnut/alert (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_ivgunnut/bump (1).mp3","vj_ivgunnut/bump (2).mp3","vj_ivgunnut/bump (3).mp3"} 
ENT.B3SoundTbl_CombatIdle = {"vj_ivgunnut/combat (1).mp3","vj_ivgunnut/combat (2).mp3","vj_ivgunnut/combat (3).mp3","vj_ivgunnut/combat (4).mp3","vj_ivgunnut/combat (5).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_ivgunnut/gotmedic (1).mp3","vj_ivgunnut/gotmedic (2).mp3","vj_ivgunnut/gotmedic (3).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_ivgunnut/kill (1).mp3","vj_ivgunnut/kill (2).mp3","vj_ivgunnut/kill (3).mp3","vj_ivgunnut/kill (4).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_ivgunnut/playerdamage (1).mp3","vj_ivgunnut/playerdamage (2).mp3","vj_ivgunnut/playerdamage (3).mp3","vj_ivgunnut/playerdamage (4).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_ivgunnut/suppress (1).mp3","vj_ivgunnut/suppress (2).mp3","vj_ivgunnut/suppress (3).mp3","vj_ivgunnut/suppress (4).mp3"}

function ENT:CustomInitialize()
	if math.random(1,4) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,2)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_BeforeMeleeAttack = self.B1SoundTbl_BeforeMeleeAttack
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
		self.SoundTbl_AllyDeath = self.B1SoundTbl_AllyDeath
		self.SoundTbl_Suppressing = self.B1SoundTbl_Suppressing
        self.SoundTbl_MoveOutOfPlayersWay = self.B1SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B1SoundTbl_UnFollowPlayer
        self.SoundTbl_IdleDialogue = self.B1SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B1SoundTbl_OnPlayerSight
        self.SoundTbl_MedicReceiveHeal = self.B1SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B1SoundTbl_FollowPlayer
		self.SoundTbl_WeaponReload = self.B1SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B1SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B1SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B1SoundTbl_CallForHelp
		self.Model = {"models/sentry/fbi_02.mdl","models/sentry/fbi_06.mdl","models/sentry/fbi_08.mdl"}
	else
		if randomvoice == 2 then
		self.Race = "B3"
	
        self.SoundTbl_BeforeMeleeAttack = self.B3SoundTbl_BeforeMeleeAttack
		self.SoundTbl_IdleDialogueAnswer = self.B3SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B3SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B3SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B3SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B3SoundTbl_Alert
        self.SoundTbl_MoveOutOfPlayersWay = self.B3SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B3SoundTbl_UnFollowPlayer
        self.SoundTbl_IdleDialogue = self.B3SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B3SoundTbl_OnPlayerSight
        self.SoundTbl_MedicReceiveHeal = self.B3SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B3SoundTbl_FollowPlayer
		self.SoundTbl_Suppressing = self.B3SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B3SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B3SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B3SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B3SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/robberplayer.mdl","models/sentry/sentrycag/westterror/north_connexion.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/