AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_RUSSIAN"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"MeleeAttack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 25
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"Heal"}
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"ThrowItem"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B2SoundTbl_Alert = {"vj_senruspfe/alert (1).mp3","vj_senruspfe/alert (2).mp3","vj_senruspfe/alert (3).mp3","vj_senruspfe/alert (4).mp3","vj_senruspfe/alert (5).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_senruspfe/becomehos (1).mp3","vj_senruspfe/becomehos (2).mp3","vj_senruspfe/becomehos (3).mp3","vj_senruspfe/becomehos (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_senruspfe/bump (1).mp3","vj_senruspfe/bump (2).mp3","vj_senruspfe/bump (3).mp3","vj_senruspfe/bump (4).mp3","vj_senruspfe/bump (5).mp3","vj_senruspfe/bump (6).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_senruspfe/chat (1).mp3","vj_senruspfe/chat (2).mp3","vj_senruspfe/chat (3).mp3","vj_senruspfe/chat (4).mp3","vj_senruspfe/chat (5).mp3","vj_senruspfe/chat (6).mp3","vj_senruspfe/chat (7).mp3","vj_senruspfe/chat (8).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_senruspfe/combat (1).mp3","vj_senruspfe/combat (2).mp3","vj_senruspfe/combat (4).mp3","vj_senruspfe/combat (5).mp3","vj_senruspfe/combat (6).mp3","vj_senruspfe/combat (7).mp3","vj_senruspfe/combat (8).mp3","vj_senruspfe/combat (9).mp3"}
ENT.B2SoundTbl_Death = {"vj_senruspfe/death (1).mp3","vj_senruspfe/death (2).mp3","vj_senruspfe/death (3).mp3","vj_senruspfe/death (4).mp3","vj_senruspfe/death (5).mp3","vj_senruspfe/death (6).mp3","vj_senruspfe/death (7).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_senruspfe/follow (1).mp3","vj_senruspfe/follow (2).mp3","vj_senruspfe/follow (3).mp3","vj_senruspfe/follow (4).mp3","vj_senruspfe/follow (5).mp3","vj_senruspfe/follow (6).mp3","vj_senruspfe/follow (7).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_senruspfe/gotmedic (1).mp3","vj_senruspfe/gotmedic (2).mp3","vj_senruspfe/gotmedic (3).mp3","vj_senruspfe/gotmedic (4).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_senruspfe/heal (1).mp3","vj_senruspfe/heal (2).mp3","vj_senruspfe/heal (3).mp3","vj_senruspfe/heal (4).mp3"} 
ENT.B2SoundTbl_CallForHelp = {"vj_senruspfe/help (1).mp3","vj_senruspfe/help (2).mp3","vj_senruspfe/help (3).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_senruspfe/hi (1).mp3","vj_senruspfe/hi (2).mp3","vj_senruspfe/hi (3).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_senruspfe/hidegrenade (1).mp3","vj_senruspfe/hidegrenade (2).mp3","vj_senruspfe/hidegrenade (3).mp3","vj_senruspfe/hidegrenade (4).mp3","vj_senruspfe/hidegrenade (5).mp3"}
ENT.B2SoundTbl_IdleDialogue = {"vj_senruspfe/idle (1).mp3","vj_senruspfe/idle (2).mp3","vj_senruspfe/idle (3).mp3","vj_senruspfe/idle (4).mp3","vj_senruspfe/idle (5).mp3","vj_senruspfe/idle (6).mp3","vj_senruspfe/idle (7).mp3","vj_senruspfe/idle (8).mp3"}
ENT.B2SoundTbl_IdleDialogueAnswer = {"vj_senruspfe/idleans (1).mp3","vj_senruspfe/idleans (2).mp3","vj_senruspfe/idleans (3).mp3","vj_senruspfe/idleans (4).mp3","vj_senruspfe/idleans (5).mp3","vj_senruspfe/idleans (6).mp3","vj_senruspfe/idleans (7).mp3","vj_senruspfe/idleans (8).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_senruspfe/invest (1).mp3","vj_senruspfe/invest (2).mp3","vj_senruspfe/invest (3).mp3","vj_senruspfe/invest (4).mp3","vj_senruspfe/invest (5).mp3","vj_senruspfe/invest (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_senruspfe/kill (1).mp3","vj_senruspfe/kill (2).mp3","vj_senruspfe/kill (3).mp3","vj_senruspfe/kill (4).mp3","vj_senruspfe/kill (5).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_senruspfe/losthim (1).mp3","vj_senruspfe/losthim (2).mp3","vj_senruspfe/losthim (3).mp3","vj_senruspfe/losthim (4).mp3","vj_senruspfe/losthim (5).mp3","vj_senruspfe/losthim (6).mp3",}
ENT.B2SoundTbl_AllyDeath = {"vj_senruspfe/mandown (1).mp3","vj_senruspfe/mandown (2).mp3","vj_senruspfe/mandown (3).mp3","vj_senruspfe/mandown (4).mp3","vj_senruspfe/mandown (5).mp3","vj_senruspfe/mandown (6).mp3",}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_senruspfe/nofollow (1).mp3","vj_senruspfe/nofollow (2).mp3","vj_senruspfe/nofollow (3).mp3","vj_senruspfe/nofollow (4).mp3","vj_senruspfe/nofollow (5).mp3","vj_senruspfe/nofollow (6).mp3",}
ENT.B2SoundTbl_Pain = {"vj_senruspfe/pain (1).mp3","vj_senruspfe/pain (2).mp3","vj_senruspfe/pain (3).mp3","vj_senruspfe/pain (4).mp3","vj_senruspfe/pain (5).mp3","vj_senruspfe/pain (6).mp3","vj_senruspfe/pain (7).mp3","vj_senruspfe/pain (8).mp3","vj_senruspfe/pain (9).mp3",}
ENT.B2SoundTbl_DamageByPlayer = {"vj_senruspfe/playerdamage (1).mp3","vj_senruspfe/playerdamage (2).mp3","vj_senruspfe/playerdamage (3).mp3","vj_senruspfe/playerdamage (4).mp3","vj_senruspfe/playerdamage (5).mp3","vj_senruspfe/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_senruspfe/reload (1).mp3","vj_senruspfe/reload (2).mp3","vj_senruspfe/reload (3).mp3","vj_senruspfe/reload (4).mp3","vj_senruspfe/reload (5).mp3","vj_senruspfe/reload (6).mp3",}
ENT.B2SoundTbl_Suppressing = {"vj_senruspfe/suppress (3).mp3","vj_senruspfe/suppress (4).mp3","vj_senruspfe/suppress (5).mp3","vj_senruspfe/suppress (6).mp3"}
ENT.B2SoundTbl_OnReceiveOrder = {"vj_senruspfe/yessir (1).mp3","vj_senruspfe/yessir (2).mp3","vj_senruspfe/yessir (3).mp3","vj_senruspfe/yessir (4).mp3","vj_senruspfe/yessir (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,4))
	self:SetBodygroup(1,math.random(4,7))
	self:SetBodygroup(2,math.random(0,0))
	self:SetBodygroup(3,math.random(0,3))
	self:SetBodygroup(4,math.random(0,0))
	self:SetBodygroup(5,math.random(1,1))
	self:SetBodygroup(6,math.random(2,2))
	self:SetBodygroup(7,math.random(0,2))
	self:SetBodygroup(8,math.random(1,1))
	self:SetBodygroup(9,math.random(0,0))
	self:SetBodygroup(10,math.random(0,0))
	self:SetBodygroup(11,math.random(1,1))
	if math.random(1,6) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,2)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
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
		self.Model = {"models/sentry/sentrycag/rucop/female_01.mdl","models/sentry/sentrycag/rucop/female_02.mdl","models/sentry/sentrycag/rucop/female_03.mdl","models/sentry/sentrycag/rucop/female_04.mdl"}
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
        self.SoundTbl_OnReceiveOrder = self.B2SoundTbl_OnReceiveOrder
		self.Model = {"models/sentry/sentrycag/ruarmyspe/f_vsrf_01_spec.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/