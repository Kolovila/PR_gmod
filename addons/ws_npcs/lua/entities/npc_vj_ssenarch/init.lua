AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 75 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_ARCTIC"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.CanThrowBackDetectedGrenades = true
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
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.SoundTbl_Death = {"ivdeath/dead (1).mp3","ivdeath/dead (2).mp3","ivdeath/dead (3).mp3","ivdeath/dead (4).mp3","ivdeath/dead (5).mp3","ivdeath/dead (6).mp3","ivdeath/dead (7).mp3","ivdeath/dead (8).mp3","ivdeath/dead (9).mp3","ivdeath/dead (10).mp3","ivdeath/dead (11).mp3","ivdeath/dead (12).mp3"}
ENT.SoundTbl_Pain = {"ivpain/pain (1).mp3","ivpain/pain (2).mp3","ivpain/pain (3).mp3","ivpain/pain (4).mp3","ivpain/pain (5).mp3","ivpain/pain (6).mp3","ivpain/pain (7).mp3","ivpain/pain (8).mp3","ivpain/pain (9).mp3","ivpain/pain (10).mp3"}

ENT.B1SoundTbl_Alert = {"vj_senarc1/alert (1).mp3","vj_senarc1/alert (2).mp3","vj_senarc1/alert (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_senarc1/bump (1).mp3","vj_senarc1/bump (2).mp3","vj_senarc1/bump (3).mp3"} 
ENT.B1SoundTbl_CombatIdle = {"vj_senarc1/combat (1).mp3","vj_senarc1/combat (2).mp3","vj_senarc1/combat (3).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_senarc1/follow (1).mp3","vj_senarc1/follow (2).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_senarc1/hidegrenade (1).mp3","vj_senarc1/hidegrenade (3).mp3","vj_senarc1/hidegrenade (2).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_senarc1/kill (1).mp3","vj_senarc1/kill (2).mp3","vj_senarc1/kill (3).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_senarc1/losthim (1).mp3","vj_senarc1/losthim (2).mp3","vj_senarc1/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_senarc1/nofollow (1).mp3","vj_senarc1/nofollow (2).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_senarc1/playerdamage (1).mp3","vj_senarc1/playerdamage (2).mp3","vj_senarc1/playerdamage (3).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_senarc1/reload (1).mp3","vj_senarc1/reload (2).mp3","vj_senarc1/reload (3).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_senarc1/suppress (1).mp3","vj_senarc1/suppress (2).mp3","vj_senarc1/suppress (3).mp3"}

ENT.B2SoundTbl_Alert = {"vj_senarc2/alert (1).mp3","vj_senarc2/alert (2).mp3","vj_senarc2/alert (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_senarc2/bump (1).mp3","vj_senarc2/bump (2).mp3","vj_senarc2/bump (3).mp3"} 
ENT.B2SoundTbl_CombatIdle = {"vj_senarc2/combat (1).mp3","vj_senarc2/combat (2).mp3","vj_senarc2/combat (3).mp3","vj_senarc2/combat (4).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_senarc2/follow (1).mp3","vj_senarc2/follow (2).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_senarc2/hidegrenade (1).mp3","vj_senarc2/hidegrenade (3).mp3","vj_senarc2/hidegrenade (2).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_senarc2/kill (1).mp3","vj_senarc2/kill (2).mp3","vj_senarc2/kill (3).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_senarc2/losthim (1).mp3","vj_senarc2/losthim (2).mp3","vj_senarc2/losthim (3).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_senarc2/nofollow (1).mp3","vj_senarc2/nofollow (2).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_senarc2/playerdamage (1).mp3","vj_senarc2/playerdamage (2).mp3","vj_senarc2/playerdamage (3).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_senarc2/reload (1).mp3","vj_senarc2/reload (2).mp3","vj_senarc2/reload (3).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_senarc2/suppress (1).mp3","vj_senarc2/suppress (2).mp3","vj_senarc2/suppress (3).mp3"}

ENT.B3SoundTbl_Alert = {"vj_senarc3/alert (1).mp3","vj_senarc3/alert (2).mp3","vj_senarc3/alert (3).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_senarc3/bump (1).mp3","vj_senarc3/bump (2).mp3","vj_senarc3/bump (3).mp3"} 
ENT.B3SoundTbl_CombatIdle = {"vj_senarc3/combat (1).mp3","vj_senarc3/combat (2).mp3","vj_senarc3/combat (3).mp3","vj_senarc3/combat (4).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_senarc3/follow (1).mp3","vj_senarc3/follow (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_senarc3/hidegrenade (1).mp3","vj_senarc3/hidegrenade (3).mp3","vj_senarc3/hidegrenade (2).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_senarc3/kill (1).mp3","vj_senarc3/kill (2).mp3","vj_senarc3/kill (3).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_senarc3/losthim (1).mp3","vj_senarc3/losthim (2).mp3","vj_senarc3/losthim (3).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_senarc3/nofollow (1).mp3","vj_senarc3/nofollow (2).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_senarc3/playerdamage (1).mp3","vj_senarc3/playerdamage (2).mp3","vj_senarc3/playerdamage (3).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_senarc3/reload (1).mp3","vj_senarc3/reload (2).mp3","vj_senarc3/reload (3).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_senarc3/suppress (1).mp3","vj_senarc3/suppress (2).mp3","vj_senarc3/suppress (3).mp3"}

ENT.B4SoundTbl_Alert = {"vj_senarc4/alert (1).mp3","vj_senarc4/alert (2).mp3","vj_senarc4/alert (3).mp3"}
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_senarc4/bump (1).mp3","vj_senarc4/bump (2).mp3","vj_senarc4/bump (3).mp3"} 
ENT.B4SoundTbl_CombatIdle = {"vj_senarc4/combat (1).mp3","vj_senarc4/combat (2).mp3","vj_senarc4/combat (3).mp3","vj_senarc4/combat (4).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_senarc4/follow (1).mp3","vj_senarc4/follow (2).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_senarc4/hidegrenade (1).mp3","vj_senarc4/hidegrenade (3).mp3","vj_senarc4/hidegrenade (2).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_senarc4/kill (1).mp3","vj_senarc4/kill (2).mp3","vj_senarc4/kill (3).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_senarc4/losthim (1).mp3","vj_senarc4/losthim (2).mp3","vj_senarc4/losthim (3).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_senarc4/nofollow (1).mp3","vj_senarc4/nofollow (2).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_senarc4/playerdamage (1).mp3","vj_senarc4/playerdamage (2).mp3","vj_senarc4/playerdamage (3).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_senarc4/reload (1).mp3","vj_senarc4/reload (2).mp3","vj_senarc4/reload (3).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_senarc4/suppress (1).mp3","vj_senarc4/suppress (2).mp3","vj_senarc4/suppress (3).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(3,4))
	self:SetBodygroup(5,math.random(1,1))
	self:SetBodygroup(6,math.random(0,1))
	if math.random(1,10) == 1 then self.IsMedicSNPC = true end
   local Arctic = math.random(1,4)
        if Arctic == 1 then
self:SetBodygroup(3,0)
self:SetBodygroup(4,0)	
	elseif Arctic == 2 then
self:SetBodygroup(3,1)
self:SetBodygroup(4,0)	
    elseif Arctic == 3 then
self:SetBodygroup(3,2)
self:SetBodygroup(4,1)	
    elseif Arctic == 4 then
self:SetBodygroup(3,3)
self:SetBodygroup(4,1)	
       end   
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,4)
	if randomvoice == 1 then
		self.Race = "B1"
	
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
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
		self.Model = {"models/sentry/sentrycag/senarc/sentrysenarcmale6.mdl"}
	else
	if randomvoice == 2 then
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
		self.Model = {"models/sentry/sentrycag/senarc/sentrysenarcmale6.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
		self.SoundTbl_Idle = self.B3SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B3SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B3SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B3SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B3SoundTbl_CombatIdle
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
		self.Model = {"models/sentry/sentrycag/senarc/sentrysenarcmale6.mdl"}
		end
		if randomvoice == 4 then
		self.Race = "B4"
	
		self.SoundTbl_Idle = self.B4SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B4SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B4SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B4SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B4SoundTbl_CombatIdle
		self.SoundTbl_Alert = self.B4SoundTbl_Alert
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
		self.Model = {"models/sentry/sentrycag/senarc/sentrysenarcmale6.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/