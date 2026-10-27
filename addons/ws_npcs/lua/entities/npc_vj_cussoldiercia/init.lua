AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 105 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
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
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}
ENT.SoundTbl_Pain = {"vj_fib/pain (4).mp3","vj_fib/pain (5).mp3","vj_fib/pain (6).mp3","vj_fib/pain (7).mp3","vj_fib/pain (8).mp3","vj_fib/pain (9).mp3","vj_fib/pain (10).mp3"}

ENT.B2SoundTbl_Alert = {"vj_fibiv1/alert (2).mp3","vj_fibiv1/alert (3).mp3","vj_fibiv1/alert (1).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_fibiv1/bump (1).mp3","vj_fibiv1/bump (2).mp3","vj_fibiv1/bump (3).mp3"} 
ENT.B2SoundTbl_CombatIdle = {"vj_fibiv1/combat (1).mp3","vj_fibiv1/combat (2).mp3","vj_fibiv1/combat (3).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_fibiv1/follow (1).mp3","vj_fibiv1/follow (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_fibiv1/nofollow (1).mp3","vj_fibiv1/nofollow (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_fibiv1/hidegrenade (1).mp3","vj_fibiv1/hidegrenade (2).mp3","vj_fibiv1/hidegrenade (3).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_fibiv1/kill (1).mp3","vj_fibiv1/kill (2).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_fibiv1/reload (1).mp3","vj_fibiv1/reload (2).mp3","vj_fibiv1/reload (3).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_fibiv1/suppress (1).mp3","vj_fibiv1/suppress (2).mp3","vj_fibiv1/suppress (3).mp3"}

ENT.B3SoundTbl_Alert = {"vj_fibiv2/alert (2).mp3","vj_fibiv2/alert (3).mp3","vj_fibiv2/alert (1).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_fibiv2/combat (1).mp3","vj_fibiv2/combat (2).mp3","vj_fibiv2/combat (3).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_fibiv2/hidegrenade (1).mp3","vj_fibiv2/hidegrenade (2).mp3","vj_fibiv2/hidegrenade (3).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_fibiv2/kill (1).mp3","vj_fibiv2/kill (2).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_fibiv2/reload (1).mp3","vj_fibiv2/reload (2).mp3","vj_fibiv2/reload (3).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_fibiv2/suppress (1).mp3","vj_fibiv2/suppress (2).mp3","vj_fibiv2/suppress (3).mp3"}

function ENT:CustomInitialize()
	self:SetBodygroup(1,math.random(1,1))
	self:SetBodygroup(2,math.random(4,6))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,6))
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,3)
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
		self.Race = "B2"
	
        self.SoundTbl_BeforeMeleeAttack = self.B2SoundTbl_BeforeMeleeAttack
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B2SoundTbl_Alert
        self.SoundTbl_MoveOutOfPlayersWay = self.B2SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B2SoundTbl_UnFollowPlayer
        self.SoundTbl_IdleDialogue = self.B2SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B2SoundTbl_OnPlayerSight
        self.SoundTbl_MedicReceiveHeal = self.B2SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B2SoundTbl_FollowPlayer
		self.SoundTbl_Suppressing = self.B2SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B2SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B2SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B2SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B2SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/mw2cia/mw2_soldier_02.mdl"}
		end
		if randomvoice == 3 then
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
		self.Model = {"models/sentry/sentrycag/mw2cia/mw2_soldier_02.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/