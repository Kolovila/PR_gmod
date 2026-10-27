AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 30
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B2SoundTbl_Alert = {"vj_merryop/alert (1).mp3","vj_merryop/alert (2).mp3","vj_merryop/alert (3).mp3","vj_merryop/alert (4).mp3","vj_merryop/alert (5).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_merryop/becomehos (1).mp3","vj_merryop/becomehos (2).mp3","vj_merryop/becomehos (3).mp3","vj_merryop/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_merryop/bump (1).mp3","vj_merryop/bump (2).mp3","vj_merryop/bump (3).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_merryop/chat (1).mp3","vj_merryop/chat (2).mp3","vj_merryop/chat (3).mp3","vj_merryop/chat (4).mp3","vj_merryop/chat (5).mp3","vj_merryop/chat (6).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_merryop/combat (1).mp3","vj_merryop/combat (2).mp3","vj_merryop/combat (3).mp3","vj_merryop/combat (4).mp3","vj_merryop/combat (5).mp3","vj_merryop/combat (6).mp3","vj_merryop/combat (7).mp3","vj_merryop/combat (8).mp3","vj_merryop/combat (9).mp3","vj_merryop/combat (10).mp3","vj_merryop/combat (11).mp3"}
ENT.B2SoundTbl_Death = {"vj_merryhu/died (1).mp3","vj_merryhu/died (2).mp3","vj_merryhu/died (3).mp3","vj_merryhu/died (4).mp3","vj_merryhu/died (5).mp3","vj_merryguard/died (6).mp3","vj_merryhu/died (7).mp3","vj_merryhu/died (8).mp3","vj_merryhu/died (9).mp3","vj_merryhu/died (10).mp3","vj_merryhu/died (11).mp3","vj_merryhu/died (12).mp3","vj_merryhu/died (13).mp3","vj_merryhu/died (14).mp3",}
ENT.B2SoundTbl_FollowPlayer = {"vj_merryop/follow (1).mp3","vj_merryop/follow (2).mp3","vj_merryop/follow (3).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_merryop/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_merryop/heal (1).mp3","vj_merryop/heal (2).mp3","vj_merryop/heal (3).mp3","vj_merryop/heal (3).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_merryop/hi (1).mp3","vj_merryop/hi (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_merryop/hidegrenade (1).mp3","vj_merryop/hidegrenade (3).mp3","vj_merryop/hidegrenade (2).mp3","vj_merryop/hidegrenade (4).mp3","vj_merryop/hidegrenade (5).mp3","vj_merryop/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_merryop/invest (1).mp3","vj_merryop/invest (2).mp3","vj_merryop/invest (3).mp3","vj_merryop/invest (4).mp3","vj_merryop/invest (5).mp3","vj_merryop/invest (6).mp3",}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_merryop/kill (1).mp3","vj_merryop/kill (2).mp3","vj_merryop/kill (3).mp3","vj_merryop/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_merryop/losthim (1).mp3","vj_merryop/losthim (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_merryop/nofollow (1).mp3","vj_merryop/nofollow (2).mp3","vj_merryop/nofollow (3).mp3","vj_merryop/nofollow (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_merryop/pain (1).mp3","vj_merryop/pain (2).mp3","vj_merryop/pain (3).mp3","vj_merryop/pain (4).mp3","vj_merryop/pain (5).mp3","vj_merryop/pain (6).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_merryop/playerdamage (1).mp3","vj_merryop/playerdamage (2).mp3","vj_merryop/playerdamage (3).mp3","vj_merryop/playerdamage (4).mp3","vj_merryop/playerdamage (5).mp3","vj_merryop/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_merryop/reload (1).mp3","vj_merryop/reload (2).mp3","vj_merryop/reload (3).mp3","vj_merryop/reload (4).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_merryop/suppress (1).mp3","vj_merryop/suppress (2).mp3","vj_merryop/suppress (3).mp3","vj_merryop/suppress (4).mp3","vj_merryop/suppress (5).mp3"}

ENT.B3SoundTbl_Alert = {"vj_merryla2/alert (1).mp3","vj_merryla2/alert (2).mp3","vj_merryla2/alert (3).mp3","vj_merryla2/alert (4).mp3","vj_merryla2/alert (5).mp3","vj_merryla2/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_merryla2/becomehos (1).mp3","vj_merryla2/becomehos (2).mp3","vj_merryla2/becomehos (3).mp3","vj_merryla2/becomehos (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_merryla2/bump (1).mp3","vj_merryla2/bump (2).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_merryla2/chat (1).mp3","vj_merryla2/chat (2).mp3","vj_merryla2/chat (3).mp3","vj_merryla2/chat (4).mp3","vj_merryla2/chat (5).mp3","vj_merryla2/chat (6).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_merryla2/combat (1).mp3","vj_merryla2/combat (2).mp3","vj_merryla2/combat (3).mp3","vj_merryla2/combat (4).mp3","vj_merryla2/combat (5).mp3","vj_merryla2/combat (6).mp3","vj_merryla2/combat (7).mp3","vj_merryla2/combat (8).mp3","vj_merryla2/combat (9).mp3","vj_merryla2/combat (10).mp3","vj_merryla2/combat (11).mp3","vj_merryla2/combat (12).mp3","vj_merryla2/combat (13).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_merryla2/follow (1).mp3","vj_merryla2/follow (2).mp3","vj_merryla2/follow (3).mp3","vj_merryla2/follow (4).mp3","vj_merryla2/follow (5).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_merryla2/gotmedic (1).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_merryla2/heal (2).mp3","vj_merryla2/heal (3).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_merryla2/hi (1).mp3","vj_merryla2/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_merryla2/hidegrenade (1).mp3","vj_merryla2/hidegrenade (3).mp3","vj_merryla2/hidegrenade (2).mp3","vj_merryla2/hidegrenade (4).mp3","vj_merryla2/hidegrenade (5).mp3","vj_merryla2/hidegrenade (6).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_merryla2/invest (1).mp3","vj_merryla2/invest (2).mp3","vj_merryla2/invest (3).mp3","vj_merryla2/invest (4).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_merryla2/kill (1).mp3","vj_merryla2/kill (2).mp3","vj_merryla2/kill (3).mp3","vj_merryla2/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_merryla2/losthim (1).mp3","vj_merryla2/losthim (2).mp3","vj_merryla2/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_merryla2/mandown (1).mp3","vj_merryla2/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_merryla2/nofollow (1).mp3","vj_merryla2/nofollow (2).mp3","vj_merryla2/nofollow (3).mp3","vj_merryla2/nofollow (4).mp3"}
ENT.B3SoundTbl_Pain = {"vj_merryla2/pain (1).mp3","vj_merryla2/pain (2).mp3","vj_merryla2/pain (3).mp3","vj_merryla2/pain (4).mp3","vj_merryla2/pain (5).mp3","vj_merryla2/pain (6).mp3","vj_merryla2/pain (7).mp3","vj_merryla2/pain (8).mp3","vj_merryla2/pain (9).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_merryla2/playerdamage (1).mp3","vj_merryla2/playerdamage (2).mp3","vj_merryla2/playerdamage (3).mp3","vj_merryla2/playerdamage (4).mp3","vj_merryla2/playerdamage (5).mp3","vj_merryla2/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_merryla2/reload (1).mp3","vj_merryla2/reload (2).mp3","vj_merryla2/reload (3).mp3","vj_merryla2/reload (4).mp3","vj_merryla2/reload (5).mp3","vj_merryla2/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_merryla2/suppress (1).mp3","vj_merryla2/suppress (2).mp3","vj_merryla2/suppress (3).mp3","vj_merryla2/suppress (4).mp3","vj_merryla2/suppress (5).mp3"}

ENT.B4SoundTbl_Alert = {"vj_merryguardaf/alert (1).mp3","vj_merryguardaf/alert (2).mp3","vj_merryguardaf/alert (3).mp3","vj_merryguardaf/alert (4).mp3","vj_merryguardaf/alert (5).mp3","vj_merryguardaf/alert (6).mp3","vj_merryguardaf/alert (7).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_merryguardaf/becomehos (1).mp3","vj_merryguardaf/becomehos (2).mp3","vj_merryguardaf/becomehos (3).mp3","vj_merryguardaf/becomehos (4).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_merryguardaf/bump (1).mp3","vj_merryguardaf/bump (2).mp3","vj_merryguardaf/bump (3).mp3","vj_merryguardaf/bump (4).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_merryguardaf/chat (1).mp3","vj_merryguardaf/chat (2).mp3","vj_merryguardaf/chat (3).mp3","vj_merryguardaf/chat (4).mp3","vj_merryguardaf/chat (5).mp3","vj_merryguardaf/chat (6).mp3","vj_merryguardaf/chat (7).mp3","vj_merryguardaf/chat (8).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_merryguardaf/combat (1).mp3","vj_merryguardaf/combat (2).mp3","vj_merryguardaf/combat (3).mp3","vj_merryguardaf/combat (4).mp3","vj_merryguardaf/combat (5).mp3","vj_merryguardaf/combat (6).mp3","vj_merryguardaf/combat (7).mp3","vj_merryguardaf/combat (8).mp3","vj_merryguardaf/combat (9).mp3","vj_merryguardaf/combat (10).mp3"}
ENT.B4SoundTbl_Death = {"vj_merryguardaf/died (1).mp3","vj_merryguardaf/died (2).mp3","vj_merryguardaf/died (3).mp3","vj_merryguardaf/died (4).mp3","vj_merryguardaf/died (5).mp3","vj_merryguardaf/died (6).mp3","vj_merryguardaf/died (7).mp3","vj_merryguardaf/died (8).mp3","vj_merryguardaf/died (9).mp3","vj_merryguardaf/died (10).mp3","vj_merryguardaf/died (11).mp3","vj_merryguardaf/died (12).mp3","vj_merryguardaf/died (13).mp3","vj_merryguardaf/died (14).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_merryguardaf/follow (1).mp3","vj_merryguardaf/follow (2).mp3","vj_merryguardaf/follow (3).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_merryguardaf/gotmedic (1).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_merryguardaf/heal (1).mp3","vj_merryguardaf/heal (2).mp3","vj_merryguardaf/heal (3).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_merryguardaf/hi (1).mp3","vj_merryguardaf/hi (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_merryguardaf/hidegrenade (1).mp3","vj_merryguardaf/hidegrenade (3).mp3","vj_merryguardaf/hidegrenade (2).mp3","vj_merryguardaf/hidegrenade (4).mp3","vj_merryguardaf/hidegrenade (5).mp3","vj_merryguardaf/hidegrenade (6).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_merryguardaf/invest (1).mp3","vj_merryguardaf/invest (2).mp3","vj_merryguardaf/invest (3).mp3","vj_merryguardaf/invest (4).mp3","vj_merryguardaf/invest (5).mp3","vj_merryguardaf/invest (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_merryguardaf/kill (1).mp3","vj_merryguardaf/kill (2).mp3","vj_merryguardaf/kill (3).mp3","vj_merryguardaf/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_merryguardaf/losthim (1).mp3","vj_merryguardaf/losthim (2).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_merryguardaf/nofollow (1).mp3","vj_merryguardaf/nofollow (2).mp3","vj_merryguardaf/nofollow (3).mp3","vj_merryguardaf/nofollow (4).mp3"}
ENT.B4SoundTbl_Pain = {"vj_merryguardaf/pain (1).mp3","vj_merryguardaf/pain (2).mp3","vj_merryguardaf/pain (3).mp3","vj_merryguardaf/pain (4).mp3","vj_merryguardaf/pain (5).mp3","vj_merryguardaf/pain (6).mp3","vj_merryguardaf/pain (7).mp3","vj_merryguardaf/pain (8).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_merryguardaf/playerdamage (1).mp3","vj_merryguardaf/playerdamage (2).mp3","vj_merryguardaf/playerdamage (3).mp3","vj_merryguardaf/playerdamage (4).mp3","vj_merryguardaf/playerdamage (5).mp3","vj_merryguardaf/playerdamage (6).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_merryguardaf/reload (1).mp3","vj_merryguardaf/reload (2).mp3","vj_merryguardaf/reload (3).mp3","vj_merryguardaf/reload (4).mp3","vj_merryguardaf/reload (5).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_merryguardaf/suppress (1).mp3","vj_merryguardaf/suppress (2).mp3","vj_merryguardaf/suppress (3).mp3","vj_merryguardaf/suppress (4).mp3","vj_merryguardaf/suppress (5).mp3"}

function ENT:CustomInitialize()
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,4)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
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
		self.Model = {"models/sentry/sentrycag/pmcd/pmc__02.mdl","models/sentry/sentrycag/pmcd/pmc__03.mdl"}
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
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/pmcd/pmc__02.mdl","models/sentry/sentrycag/pmcd/pmc__03.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
        self.SoundTbl_Death = self.B3SoundTbl_Death
		self.SoundTbl_Idle = self.B3SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B3SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B3SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B3SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B3SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B3SoundTbl_Alert
        self.SoundTbl_BecomeEnemyToPlayer = self.B3SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_Pain = self.B3SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/pmcd/pmc__02.mdl","models/sentry/sentrycag/pmcd/pmc__03.mdl"}
		end
		if randomvoice == 4 then
		self.Race = "B4"
	
        self.SoundTbl_Death = self.B4SoundTbl_Death
		self.SoundTbl_Idle = self.B4SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B4SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B4SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B4SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B4SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B4SoundTbl_Alert
        self.SoundTbl_Pain = self.B4SoundTbl_Pain
        self.SoundTbl_BecomeEnemyToPlayer = self.B4SoundTbl_BecomeEnemyToPlayer
        self.SoundTbl_MoveOutOfPlayersWay = self.B4SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B4SoundTbl_UnFollowPlayer
        self.SoundTbl_Investigate = self.B4SoundTbl_Investigate
        self.SoundTbl_IdleDialogue = self.B4SoundTbl_IdleDialogue
        self.SoundTbl_OnPlayerSight = self.B4SoundTbl_OnPlayerSight
        self.SoundTbl_MedicBeforeHeal = self.B4SoundTbl_MedicBeforeHeal
        self.SoundTbl_MedicReceiveHeal = self.B4SoundTbl_MedicReceiveHeal
        self.SoundTbl_FollowPlayer = self.B4SoundTbl_FollowPlayer
        self.SoundTbl_DamageByPlayer = self.B4SoundTbl_DamageByPlayer
		self.SoundTbl_Suppressing = self.B4SoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.B4SoundTbl_WeaponReload
		self.SoundTbl_OnGrenadeSight = self.B4SoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.B4SoundTbl_OnKilledEnemy
		self.SoundTbl_CallForHelp = self.B4SoundTbl_CallForHelp
		self.Model = {"models/sentry/sentrycag/pmcd/pmc__02.mdl","models/sentry/sentrycag/pmcd/pmc__03.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/