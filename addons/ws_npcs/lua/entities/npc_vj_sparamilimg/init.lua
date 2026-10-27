AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 80 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_PARAMILITARY_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation


ENT.B2SoundTbl_Alert = {"vj_lostle2/alert (1).mp3","vj_lostle2/alert (2).mp3","vj_lostle2/alert (3).mp3","vj_lostle2/alert (4).mp3","vj_lostle2/alert (5).mp3","vj_lostle2/alert (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_lostle2/becomehos (1).mp3","vj_lostle2/becomehos (2).mp3","vj_lostle2/becomehos (3).mp3","vj_lostle2/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_lostle2/bump (1).mp3","vj_lostle2/bump (2).mp3","vj_lostle2/bump (3).mp3","vj_lostle2/bump (4).mp3","vj_lostle2/bump (5).mp3","vj_lostle2/bump (6).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_lostle2/chat (1).mp3","vj_lostle2/chat (2).mp3","vj_lostle2/chat (3).mp3","vj_lostle2/chat (4).mp3","vj_lostle2/chat (5).mp3","vj_lostle2/chat (6).mp3","vj_lostle2/chat (7).mp3","vj_lostle2/chat (8).mp3","vj_lostle2/chat (9).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_lostle2/combat (1).mp3","vj_lostle2/combat (2).mp3","vj_lostle2/combat (3).mp3","vj_lostle2/combat (4).mp3","vj_lostle2/combat (5).mp3","vj_lostle2/combat (6).mp3","vj_lostle2/combat (7).mp3","vj_lostle2/combat (10).mp3"}
ENT.B2SoundTbl_Death = {"vj_lostle2/died (1).mp3","vj_lostle2/died (2).mp3","vj_lostle2/died (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_lostle2/follow (1).mp3","vj_lostle2/follow (2).mp3","vj_lostle2/follow (3).mp3","vj_lostle2/follow (4).mp3","vj_lostle2/follow (5).mp3","vj_lostle2/follow (6).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_lostle2/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_lostle2/heal (1).mp3","vj_lostle2/heal (2).mp3","vj_lostle2/heal (3).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_lostle2/hi (1).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_lostle2/hidegrenade (1).mp3","vj_lostle2/hidegrenade (3).mp3","vj_lostle2/hidegrenade (2).mp3","vj_lostle2/hidegrenade (4).mp3","vj_lostle2/hidegrenade (5).mp3","vj_lostle2/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_lostle2/invest (1).mp3","vj_lostle2/invest (2).mp3","vj_lostle2/invest (3).mp3","vj_lostle2/invest (4).mp3","vj_lostle2/invest (5).mp3","vj_lostle2/invest (6).mp3",}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_lostle2/kill (1).mp3","vj_lostle2/kill (2).mp3","vj_lostle2/kill (3).mp3","vj_lostle2/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_lostle2/losthim (1).mp3","vj_lostle2/losthim (2).mp3","vj_lostle2/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_lostle2/mandown (1).mp3","vj_lostle2/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_lostle2/nofollow (1).mp3","vj_lostle2/nofollow (2).mp3"}
ENT.B2SoundTbl_Pain = {"vj_lostle2/pain (1).mp3","vj_lostle2/pain (2).mp3","vj_lostle2/pain (3).mp3","vj_lostle2/pain (4).mp3","vj_lostle2/pain (5).mp3","vj_lostle2/pain (6).mp3","vj_lostle2/pain (7).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_lostle2/playerdamage (1).mp3","vj_lostle2/playerdamage (2).mp3","vj_lostle2/playerdamage (3).mp3","vj_lostle2/playerdamage (4).mp3","vj_lostle2/playerdamage (5).mp3","vj_lostle2/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_lostle2/reload (1).mp3","vj_lostle2/reload (2).mp3","vj_lostle2/reload (3).mp3","vj_lostle2/reload (4).mp3","vj_lostle2/reload (5).mp3","vj_lostle2/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_lostle2/suppress (1).mp3","vj_lostle2/suppress (2).mp3","vj_lostle2/suppress (3).mp3","vj_lostle2/suppress (4).mp3","vj_lostle2/suppress (6).mp3","vj_lostle2/playerdamage (7).mp3","vj_lostle2/playerdamage (8).mp3"}

ENT.B3SoundTbl_Alert = {"vj_lost3/alert (1).mp3","vj_lost3/alert (2).mp3","vj_lost3/alert (3).mp3","vj_lost3/alert (4).mp3","vj_lost3/alert (5).mp3","vj_lost3/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_lost3/becomehos (1).mp3","vj_lost3/becomehos (2).mp3","vj_lost3/becomehos (3).mp3","vj_lost3/becomehos (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_lost3/bump (1).mp3","vj_lost3/bump (2).mp3","vj_lost3/bump (3).mp3","vj_lost3/bump (4).mp3","vj_lost3/bump (5).mp3","vj_lost3/bump (6).mp3","vj_lost3/bump (7).mp3","vj_lost3/bump (8).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_lost3/chat (1).mp3","vj_lost3/chat (2).mp3","vj_lost3/chat (3).mp3","vj_lost3/chat (4).mp3","vj_lost3/chat (5).mp3","vj_lost3/chat (6).mp3","vj_lost3/chat (8).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_lost3/combat (3).mp3","vj_lost3/combat (4).mp3","vj_lost3/combat (5).mp3","vj_lost3/combat (6).mp3","vj_lost3/combat (8).mp3","vj_lost3/alert (7).mp3","vj_lost3/alert (9).mp3"}
ENT.B3SoundTbl_Death = {"vj_lost3/died (1).mp3","vj_lost3/died (2).mp3","vj_lost3/died (3).mp3","vj_lost3/died (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_lost3/follow (1).mp3","vj_lost3/follow (2).mp3","vj_lost3/follow (3).mp3","vj_lost3/follow (4).mp3","vj_lost3/follow (5).mp3","vj_lost3/follow (6).mp3","vj_lost3/follow (7).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_lost3/gotmedic (1).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_lost3/heal (1).mp3","vj_lost3/heal (2).mp3","vj_lost3/heal (3).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_lost3/hi (1).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_lost3/hidegrenade (2).mp3","vj_lost3/hidegrenade (4).mp3","vj_lost3/hidegrenade (5).mp3","vj_lost3/hidegrenade (6).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_lost3/invest (1).mp3","vj_lost3/invest (2).mp3","vj_lost3/invest (4).mp3","vj_lost3/invest (5).mp3","vj_lost3/invest (6).mp3",}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_lost3/kill (3).mp3","vj_lost3/kill (4).mp3","vj_lost3/kill (5).mp3","vj_lost3/kill (6).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_lost3/losthim (1).mp3","vj_lost3/losthim (2).mp3","vj_lost3/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_lost3/mandown (1).mp3","vj_lost3/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_lost3/nofollow (1).mp3","vj_lost3/nofollow (2).mp3","vj_lost3/nofollow (3).mp3"}
ENT.B3SoundTbl_Pain = {"vj_lost3/pain (1).mp3","vj_lost3/pain (2).mp3","vj_lost3/pain (3).mp3","vj_lost3/pain (5).mp3","vj_lost3/pain (6).mp3","vj_lost3/pain (7).mp3","vj_lost3/pain (8).mp3","vj_lost3/pain (9).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_lost3/playerdamage (1).mp3","vj_lost3/playerdamage (2).mp3","vj_lost3/playerdamage (3).mp3","vj_lost3/playerdamage (5).mp3","vj_lost3/playerdamage (6).mp3","vj_lost3/playerdamage (7).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_lost3/reload (1).mp3","vj_lost3/reload (2).mp3","vj_lost3/reload (3).mp3","vj_lost3/reload (5).mp3","vj_lost3/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_lost3/suppress (1).mp3","vj_lost3/suppress (4).mp3","vj_lost3/suppress (6).mp3","vj_lost3/invest (3).mp3","vj_lost3/alert (8).mp3"}

ENT.B4SoundTbl_Alert = {"vj_lostle/alert (1).mp3","vj_lostle/alert (2).mp3","vj_lostle/alert (3).mp3","vj_lostle/alert (4).mp3","vj_lostle/alert (5).mp3"}
ENT.B4SoundTbl_BecomeEnemyToPlayer = {"vj_lostle/becomehos (1).mp3","vj_lostle/becomehos (2).mp3","vj_lostle/becomehos (3).mp3","vj_lostle/becomehos (4).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_lostle/bump (1).mp3","vj_lostle/bump (2).mp3","vj_lostle/bump (3).mp3","vj_lostle/bump (4).mp3","vj_lostle/bump (5).mp3","vj_lostle/bump (6).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_lostle/chat (1).mp3","vj_lostle/chat (2).mp3","vj_lostle/chat (3).mp3","vj_lostle/chat (5).mp3","vj_lostle/chat (6).mp3","vj_lostle/chat (7).mp3","vj_lostle/chat (8).mp3","vj_lostle/chat (9).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_lostle/combat (1).mp3","vj_lostle/combat (2).mp3","vj_lostle/combat (3).mp3","vj_lostle/combat (4).mp3","vj_lostle/combat (5).mp3","vj_lostle/combat (6).mp3","vj_lostle/combat (7).mp3","vj_lostle/combat (8).mp3","vj_lostle/combat (9).mp3","vj_lostle/combat (10).mp3"}
ENT.B4SoundTbl_Death = {"vj_lostle/died (1).mp3","vj_lostle/died (2).mp3","vj_lostle/died (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_lostle/follow (1).mp3","vj_lostle/follow (2).mp3","vj_lostle/follow (3).mp3","vj_lostle/follow (4).mp3","vj_lostle/follow (5).mp3","vj_lostle/follow (6).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_lostle/gotmedic (1).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_lostle/heal (1).mp3","vj_lostle/heal (2).mp3"} 
ENT.B4SoundTbl_OnPlayerSight = {"vj_lostle/hi (1).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_lostle/hidegrenade (1).mp3","vj_lostle/hidegrenade (3).mp3","vj_lostle/hidegrenade (2).mp3","vj_lostle/hidegrenade (4).mp3","vj_lostle/hidegrenade (5).mp3","vj_lostle/hidegrenade (6).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_lostle/invest (1).mp3","vj_lostle/invest (2).mp3","vj_lostle/invest (3).mp3","vj_lostle/invest (4).mp3","vj_lostle/invest (5).mp3","vj_lostle/invest (6).mp3",}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_lostle/kill (1).mp3","vj_lostle/kill (2).mp3","vj_lostle/kill (3).mp3","vj_lostle/kill (4).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_lostle/losthim (1).mp3","vj_lostle/losthim (2).mp3"}
ENT.B4SoundTbl_AllyDeath = {"vj_lostle/mandown (1).mp3","vj_lostle/mandown (2).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_lostle/nofollow (1).mp3","vj_lostle/nofollow (2).mp3","vj_lostle/nofollow (3).mp3"}
ENT.B4SoundTbl_Pain = {"vj_lostle/pain (1).mp3","vj_lostle/pain (2).mp3","vj_lostle/pain (3).mp3","vj_lostle/pain (4).mp3","vj_lostle/pain (5).mp3","vj_lostle/pain (6).mp3","vj_lostle/pain (7).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_lostle/playerdamage (1).mp3","vj_lostle/playerdamage (2).mp3","vj_lostle/playerdamage (3).mp3","vj_lostle/playerdamage (4).mp3","vj_lostle/playerdamage (5).mp3","vj_lostle/playerdamage (6).mp3","vj_lostle/playerdamage (7).mp3","vj_lostle/playerdamage (8).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_lostle/reload (1).mp3","vj_lostle/reload (2).mp3","vj_lostle/reload (3).mp3","vj_lostle/reload (4).mp3","vj_lostle/reload (5).mp3","vj_lostle/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_lostle/suppress (1).mp3","vj_lostle/suppress (2).mp3","vj_lostle/suppress (3).mp3","vj_lostle/suppress (4).mp3","vj_lostle/suppress (5).mp3","vj_lostle/suppress (6).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(1,5))
	self:SetBodygroup(4,math.random(0,1))
   local hand = math.random(1,3)
        if hand == 1 then
self:SetBodygroup(2,0)
self:SetBodygroup(3,0)	
	elseif hand == 2 then
self:SetBodygroup(2,1)
self:SetBodygroup(3,1)
	elseif hand == 3 then
self:SetBodygroup(2,2)
self:SetBodygroup(3,2)
end	
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,4)
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
		self.Model = {"models/sentry/sentrycag/paramilisup/m02_ply.mdl","models/sentry/sentrycag/paramilisup/m03_ply.mdl","models/sentry/sentrycag/paramilisup/m04_ply.mdl","models/sentry/sentrycag/paramilisup/m07_ply.mdl"}
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
		self.Model = {"models/sentry/sentrycag/paramilisup/m02_ply.mdl","models/sentry/sentrycag/paramilisup/m03_ply.mdl","models/sentry/sentrycag/paramilisup/m04_ply.mdl","models/sentry/sentrycag/paramilisup/m07_ply.mdl"}
		end
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
		self.Model = {"models/sentry/sentrycag/paramilisup/m02_ply.mdl","models/sentry/sentrycag/paramilisup/m03_ply.mdl","models/sentry/sentrycag/paramilisup/m04_ply.mdl","models/sentry/sentrycag/paramilisup/m07_ply.mdl"}
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
		self.Model = {"models/sentry/sentrycag/paramilisup/m02_ply.mdl","models/sentry/sentrycag/paramilisup/m03_ply.mdl","models/sentry/sentrycag/paramilisup/m04_ply.mdl","models/sentry/sentrycag/paramilisup/m07_ply.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/