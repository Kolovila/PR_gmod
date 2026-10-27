AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_REDMAFIA_FRIENDLY","CLASS_CHINA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
	-- Common Classes Combine = CLASS_COMBINE  Zombie = CLASS_ZOMBIE  Antlions = CLASS_ANTLION  Xen = CLASS_XEN  Player Friendly = CLASS_PLAYER_ALLY 
ENT.PlayerFriendly = true
ENT.BloodColor = "Red"
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","pushplayer","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}
ENT.SoundTbl_Pain = {"ivpain/pain (1).mp3","ivpain/pain (2).mp3","ivpain/pain (3).mp3","ivpain/pain (4).mp3","ivpain/pain (5).mp3","ivpain/pain (6).mp3","ivpain/pain (7).mp3","ivpain/pain (8).mp3","ivpain/pain (9).mp3","ivpain/pain (10).mp3"}

ENT.B1SoundTbl_Alert = {"vj_sennkmob5/alert (1).mp3","vj_sennkmob5/alert (2).mp3","vj_sennkmob5/alert (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob5/bump (1).mp3","vj_sennkmob5/bump (2).mp3","vj_sennkmob5/bump (3).mp3"} 
ENT.B1SoundTbl_CombatIdle = {"vj_sennkmob5/combat (1).mp3","vj_sennkmob5/combat (2).mp3","vj_sennkmob5/combat (3).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_sennkmob5/follow (1).mp3","vj_sennkmob5/follow (2).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_sennkmob5/hidegrenade (1).mp3","vj_sennkmob5/hidegrenade (3).mp3","vj_sennkmob5/hidegrenade (2).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_sennkmob5/kill (1).mp3","vj_sennkmob5/kill (2).mp3","vj_sennkmob5/kill (3).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_sennkmob5/losthim (1).mp3","vj_sennkmob5/losthim (2).mp3","vj_sennkmob5/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_sennkmob5/nofollow (1).mp3","vj_sennkmob5/nofollow (2).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_sennkmob5/playerdamage (1).mp3","vj_sennkmob5/playerdamage (2).mp3","vj_sennkmob5/playerdamage (3).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_sennkmob5/reload (1).mp3","vj_sennkmob5/reload (2).mp3","vj_sennkmob5/reload (3).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_sennkmob5/suppress (1).mp3","vj_sennkmob5/suppress (2).mp3","vj_sennkmob5/suppress (3).mp3"}

ENT.B2SoundTbl_Alert = {"vj_sennkmob6/alert (1).mp3","vj_sennkmob6/alert (2).mp3","vj_sennkmob6/alert (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_sennkmob6/bump (1).mp3","vj_sennkmob6/bump (2).mp3","vj_sennkmob6/bump (3).mp3"} 
ENT.B2SoundTbl_CombatIdle = {"vj_sennkmob6/combat (1).mp3","vj_sennkmob6/combat (2).mp3","vj_sennkmob6/combat (3).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_sennkmob6/follow (1).mp3","vj_sennkmob6/follow (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_sennkmob6/hidegrenade (1).mp3","vj_sennkmob6/hidegrenade (3).mp3","vj_sennkmob6/hidegrenade (2).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_sennkmob6/kill (1).mp3","vj_sennkmob6/kill (2).mp3","vj_sennkmob6/kill (3).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_sennkmob6/losthim (1).mp3","vj_sennkmob6/losthim (2).mp3","vj_sennkmob6/losthim (3).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_sennkmob6/nofollow (1).mp3","vj_sennkmob6/nofollow (2).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_sennkmob6/playerdamage (1).mp3","vj_sennkmob6/playerdamage (2).mp3","vj_sennkmob6/playerdamage (3).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_sennkmob6/reload (1).mp3","vj_sennkmob6/reload (2).mp3","vj_sennkmob6/reload (3).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_sennkmob6/suppress (1).mp3","vj_sennkmob6/suppress (2).mp3","vj_sennkmob6/suppress (3).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,6))
	self:SetBodygroup(1,math.random(3,6))
	self:SetBodygroup(2,math.random(0,3))
	self:SetBodygroup(3,math.random(1,3))
	self:SetBodygroup(4,math.random(0,1))
	self:SetBodygroup(5,math.random(0,1))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(0,1)
	if randomvoice == 0 then
		self.Race = "B1"
	
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B1SoundTbl_Alert
		self.SoundTbl_AllyDeath = self.B4SoundTbl_AllyDeath
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
		self.Model = {"models/sentry/sentrycag/nkgang/mu/sentrynkgangmale5.mdl"}
	else
	if randomvoice == 1 then
		self.Race = "B2"
	
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
		self.Model = {"models/sentry/sentrycag/nkgang/mu/sentrynkgangmale5.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/