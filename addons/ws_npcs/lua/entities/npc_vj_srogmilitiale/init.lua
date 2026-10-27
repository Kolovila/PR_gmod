AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 80 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_MILITIA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
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
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"grenThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_salton1/alert (1).mp3","vj_salton1/alert (2).mp3","vj_salton1/alert (3).mp3","vj_salton1/alert (4).mp3","vj_salton1/alert (5).mp3","vj_salton1/alert (6).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_salton1/becomehos (1).mp3","vj_salton1/becomehos (2).mp3","vj_salton1/becomehos (3).mp3","vj_salton1/becomehos (4).mp3","vj_salton1/becomehos (5).mp3","vj_salton1/becomehos (6).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_salton1/bump (1).mp3","vj_salton1/bump (2).mp3","vj_salton1/bump (3).mp3","vj_salton1/bump (4).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_salton1/chat (1).mp3","vj_salton1/chat (2).mp3","vj_salton1/chat (3).mp3","vj_salton1/chat (4).mp3","vj_salton1/chat (5).mp3","vj_salton1/chat (6).mp3","vj_salton1/chat (7).mp3","vj_salton1/chat (8).mp3","vj_salton1/chat (9).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_salton1/combat (1).mp3","vj_salton1/combat (2).mp3","vj_salton1/combat (3).mp3","vj_salton1/combat (4).mp3","vj_salton1/combat (5).mp3","vj_salton1/combat (6).mp3","vj_salton1/combat (7).mp3","vj_salton1/combat (8).mp3","vj_salton1/combat (9).mp3","vj_salton1/combat (10).mp3"}
ENT.B1SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_salton1/follow (1).mp3","vj_salton1/follow (2).mp3","vj_salton1/follow (3).mp3","vj_salton1/follow (4).mp3","vj_salton1/follow (5).mp3","vj_salton1/follow (6).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_salton1/gotmedic (1).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_salton1/grenade (1).mp3","vj_salton1/grenade (2).mp3","vj_salton1/grenade (3).mp3","vj_salton1/grenade (4).mp3",}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_salton1/heal (1).mp3","vj_salton1/heal (2).mp3","vj_salton1/heal (3).mp3","vj_salton1/heal (4).mp3"} 
ENT.B1SoundTbl_CallForHelp = {"vj_salton1/help (1).mp3","vj_salton1/help (2).mp3","vj_salton1/help (3).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_salton1/hi (1).mp3","vj_salton1/hi (2).mp3","vj_salton1/hi (3).mp3","vj_salton1/hi (4).mp3","vj_salton1/hi (5).mp3","vj_salton1/hi (6).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_salton1/hidegrenade (1).mp3","vj_salton1/hidegrenade (3).mp3","vj_salton1/hidegrenade (2).mp3","vj_salton1/hidegrenade (4).mp3","vj_salton1/hidegrenade (5).mp3","vj_salton1/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_salton1/kill (1).mp3","vj_salton1/kill (2).mp3","vj_salton1/kill (3).mp3","vj_salton1/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_salton1/losthim (1).mp3","vj_salton1/losthim (2).mp3","vj_salton1/losthim (3).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_salton1/mandown (1).mp3","vj_salton1/mandown (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_salton1/nofollow (1).mp3","vj_salton1/nofollow (2).mp3","vj_salton1/nofollow (3).mp3","vj_salton1/nofollow (4).mp3","vj_salton1/nofollow (5).mp3","vj_salton1/nofollow (6).mp3"}
ENT.B1SoundTbl_Pain = {"vj_salton1/pain (1).mp3","vj_salton1/pain (2).mp3","vj_salton1/pain (3).mp3","vj_salton1/pain (4).mp3","vj_salton1/pain (5).mp3","vj_salton1/pain (6).mp3","vj_salton1/pain (7).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_salton1/playerdamage (1).mp3","vj_salton1/playerdamage (2).mp3","vj_salton1/playerdamage (3).mp3","vj_salton1/playerdamage (4).mp3","vj_salton1/playerdamage (5).mp3","vj_salton1/playerdamage (6).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_salton1/reload (1).mp3","vj_salton1/reload (2).mp3","vj_salton1/reload (3).mp3","vj_salton1/reload (4).mp3","vj_salton1/reload (5).mp3","vj_salton1/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_salton1/suppress (1).mp3","vj_salton1/suppress (2).mp3","vj_salton1/suppress (3).mp3","vj_salton1/suppress (4).mp3","vj_salton1/suppress (5).mp3"}

ENT.B2SoundTbl_Alert = {"vj_lostw1/alert (1).mp3","vj_lostw1/alert (2).mp3","vj_lostw1/alert (3).mp3","vj_lostw1/alert (4).mp3","vj_lostw1/alert (5).mp3","vj_lostw1/alert (6).mp3","vj_lostw1/alert (7).mp3","vj_lostw1/alert (8).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_lostw1/becomehos (1).mp3","vj_lostw1/becomehos (2).mp3","vj_lostw1/becomehos (3).mp3","vj_lostw1/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_lostw1/bump (1).mp3","vj_lostw1/bump (2).mp3","vj_lostw1/bump (3).mp3","vj_lostw1/bump (4).mp3","vj_lostw1/bump (5).mp3","vj_lostw1/bump (6).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_lostw1/chat (1).mp3","vj_lostw1/chat (2).mp3","vj_lostw1/chat (3).mp3","vj_lostw1/chat (4).mp3","vj_lostw1/chat (5).mp3","vj_lostw1/chat (6).mp3","vj_lostw1/chat (7).mp3","vj_lostw1/chat (8).mp3","vj_lostw1/chat (9).mp3","vj_lostw1/chat (12).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_lostw1/combat (1).mp3","vj_lostw1/combat (2).mp3","vj_lostw1/combat (3).mp3","vj_lostw1/combat (5).mp3","vj_lostw1/combat (6).mp3","vj_lostw1/combat (7).mp3","vj_lostw1/combat (10).mp3","vj_lostw1/combat (12).mp3"}
ENT.B2SoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_lostw1/follow (1).mp3","vj_lostw1/follow (2).mp3","vj_lostw1/follow (3).mp3","vj_lostw1/follow (4).mp3","vj_lostw1/follow (5).mp3","vj_lostw1/follow (6).mp3","vj_lostw1/follow (7).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_lostw1/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_lostw1/heal (1).mp3","vj_lostw1/heal (2).mp3","vj_lostw1/heal (3).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_lostw1/hi (1).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_lostw1/hidegrenade (1).mp3","vj_lostw1/hidegrenade (3).mp3","vj_lostw1/hidegrenade (2).mp3","vj_lostw1/hidegrenade (4).mp3","vj_lostw1/hidegrenade (5).mp3","vj_lostw1/hidegrenade (6).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_lostw1/invest (1).mp3","vj_lostw1/invest (2).mp3","vj_lostw1/invest (3).mp3","vj_lostw1/invest (4).mp3","vj_lostw1/invest (5).mp3","vj_lostw1/invest (6).mp3",}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_lostw1/kill (1).mp3","vj_lostw1/kill (2).mp3","vj_lostw1/kill (4).mp3","vj_lostw1/kill (5).mp3","vj_lostw1/kill (6).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_lostw1/losthim (1).mp3","vj_lostw1/losthim (2).mp3","vj_lostw1/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_lostw1/mandown (1).mp3","vj_lostw1/mandown (2).mp3","vj_lostw1/mandown (3).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_lostw1/nofollow (1).mp3","vj_lostw1/nofollow (2).mp3","vj_lostw1/nofollow (3).mp3","vj_lostw1/nofollow (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_lostw1/pain (1).mp3","vj_lostw1/pain (2).mp3","vj_lostw1/pain (3).mp3","vj_lostw1/pain (4).mp3","vj_lostw1/pain (5).mp3","vj_lostw1/pain (6).mp3","vj_lostw1/pain (7).mp3","vj_lostw1/pain (8).mp3","vj_lostw1/pain (9).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_lostw1/playerdamage (1).mp3","vj_lostw1/playerdamage (2).mp3","vj_lostw1/playerdamage (4).mp3","vj_lostw1/playerdamage (5).mp3","vj_lostw1/playerdamage (6).mp3","vj_lostw1/playerdamage (7).mp3","vj_lostw1/playerdamage (8).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_lostw1/reload (1).mp3","vj_lostw1/reload (2).mp3","vj_lostw1/reload (3).mp3","vj_lostw1/reload (4).mp3","vj_lostw1/reload (5).mp3","vj_lostw1/reload (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_lostw1/suppress (1).mp3","vj_lostw1/suppress (4).mp3","vj_lostw1/suppress (5).mp3","vj_lostw1/suppress (6).mp3","vj_lostw1/combat (4).mp3"}

ENT.B3SoundTbl_Alert = {"vj_lostb1/alert (1).mp3","vj_lostb1/alert (2).mp3","vj_lostb1/alert (3).mp3","vj_lostb1/alert (4).mp3","vj_lostb1/alert (5).mp3","vj_lostb1/alert (6).mp3"}
ENT.B3SoundTbl_BecomeEnemyToPlayer = {"vj_lostb1/becomehos (1).mp3","vj_lostb1/becomehos (2).mp3","vj_lostb1/becomehos (3).mp3","vj_lostb1/becomehos (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_lostb1/bump (1).mp3","vj_lostb1/bump (2).mp3","vj_lostb1/bump (3).mp3","vj_lostb1/bump (4).mp3","vj_lostb1/bump (5).mp3","vj_lostb1/bump (6).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_lostb1/chat (1).mp3","vj_lostb1/chat (2).mp3","vj_lostb1/chat (3).mp3","vj_lostb1/chat (4).mp3","vj_lostb1/chat (5).mp3","vj_lostb1/chat (6).mp3","vj_lostb1/chat (7).mp3","vj_lostb1/chat (8).mp3","vj_lostb1/chat (9).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_lostb1/combat (1).mp3","vj_lostb1/combat (2).mp3","vj_lostb1/combat (3).mp3","vj_lostb1/combat (4).mp3","vj_lostb1/combat (5).mp3","vj_lostb1/combat (6).mp3","vj_lostb1/combat (7).mp3","vj_lostb1/combat (11).mp3"}
ENT.B3SoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_lostb1/follow (1).mp3","vj_lostb1/follow (2).mp3","vj_lostb1/follow (3).mp3","vj_lostb1/follow (4).mp3","vj_lostb1/follow (5).mp3","vj_lostb1/follow (6).mp3","vj_lostb1/follow (7).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_lostb1/gotmedic (1).mp3","vj_lostb1/gotmedic (2).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_lostb1/heal (1).mp3","vj_lostb1/heal (2).mp3"} 
ENT.B3SoundTbl_OnPlayerSight = {"vj_lostb1/hi (1).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_lostb1/hidegrenade (1).mp3","vj_lostb1/hidegrenade (3).mp3","vj_lostb1/hidegrenade (2).mp3","vj_lostb1/hidegrenade (4).mp3","vj_lostb1/hidegrenade (5).mp3","vj_lostb1/hidegrenade (6).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_lostb1/invest (1).mp3","vj_lostb1/invest (2).mp3","vj_lostb1/invest (3).mp3","vj_lostb1/invest (4).mp3","vj_lostb1/invest (5).mp3","vj_lostb1/invest (6).mp3",}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_lostb1/kill (1).mp3","vj_lostb1/kill (2).mp3","vj_lostb1/kill (3).mp3","vj_lostb1/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_lostb1/losthim (1).mp3","vj_lostb1/losthim (2).mp3","vj_lostb1/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_lostb1/mandown (1).mp3","vj_lostb1/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_lostb1/nofollow (1).mp3","vj_lostb1/nofollow (2).mp3","vj_lostb1/nofollow (3).mp3"}
ENT.B3SoundTbl_Pain = {"vj_lostb1/pain (1).mp3","vj_lostb1/pain (2).mp3","vj_lostb1/pain (3).mp3","vj_lostb1/pain (4).mp3","vj_lostb1/pain (5).mp3","vj_lostb1/pain (6).mp3","vj_lostb1/pain (7).mp3","vj_lostb1/pain (8).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_lostb1/playerdamage (1).mp3","vj_lostb1/playerdamage (2).mp3","vj_lostb1/playerdamage (3).mp3","vj_lostb1/playerdamage (4).mp3","vj_lostb1/playerdamage (5).mp3","vj_lostb1/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_lostb1/reload (1).mp3","vj_lostb1/reload (2).mp3","vj_lostb1/reload (3).mp3","vj_lostb1/reload (4).mp3","vj_lostb1/reload (5).mp3","vj_lostb1/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_lostb1/suppress (1).mp3","vj_lostb1/suppress (2).mp3","vj_lostb1/suppress (3).mp3","vj_lostb1/suppress (5).mp3","vj_lostb1/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(1,math.random(6,6))
	self:SetBodygroup(2,math.random(3,4))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(5,5))
	self:SetBodygroup(5,math.random(0,1))
	self:SetBodygroup(6,math.random(0,1))
	self:SetBodygroup(7,math.random(0,0))
	self:SetBodygroup(8,math.random(2,2))
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,3)
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
		self.Model = {"models/sentry/sentrycag/rebelmilitia/male_06.mdl","models/sentry/sentrycag/rebelmilitia/male_08.mdl","models/sentry/sentrycag/rebelmilitia/male_07.mdl"}
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
		self.Model = {"models/sentry/sentrycag/rebelmilitia/male_06.mdl","models/sentry/sentrycag/rebelmilitia/male_08.mdl","models/sentry/sentrycag/rebelmilitia/male_07.mdl"}
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
		self.Model = {"models/sentry/sentrycag/rebelmilitia/male_01.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/