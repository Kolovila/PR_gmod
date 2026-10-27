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
ENT.VJ_NPC_Class = {"CLASS_RUSSIAN"} -- NPCs with the same class with be allied to each other 
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

ENT.B2SoundTbl_Alert = {"vj_senrussol/alertar (1).mp3","vj_senrussol/alertar (2).mp3","vj_senrussol/alertar (3).mp3","vj_senrussol/alertar (4).mp3","vj_senrussol/alertar (5).mp3","vj_senrussol/alertar (6).mp3"}
ENT.B2SoundTbl_BecomeEnemyToPlayer = {"vj_senrussol/becomehos (1).mp3","vj_senrussol/becomehos (2).mp3","vj_senrussol/becomehos (3).mp3","vj_senrussol/becomehos (4).mp3"}
ENT.B2SoundTbl_Idle = {"vj_senrussol/chat (1).mp3","vj_senrussol/chat (2).mp3","vj_senrussol/chat (3).mp3","vj_senrussol/chat (4).mp3","vj_senrussol/chat (5).mp3","vj_senrussol/chat (6).mp3","vj_senrussol/chat (7).mp3","vj_senrussol/chat (8).mp3","vj_senrussol/chat (9).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_senrussol/combat (1).mp3","vj_senrussol/combat (2).mp3","vj_senrussol/combat (3).mp3","vj_senrussol/combat (4).mp3","vj_senrussol/combat (5).mp3","vj_senrussol/combat (6).mp3","vj_senrussol/combat (7).mp3","vj_senrussol/combat (8).mp3","vj_senrussol/combat (9).mp3","vj_senrussol/combat (10).mp3"}
ENT.B2SoundTbl_Death = {"vj_senrussol/death (1).mp3","vj_senrussol/death (2).mp3","vj_senrussol/death (3).mp3","vj_senrussol/death (4).mp3","vj_senrussol/death (5).mp3","vj_senrussol/death (6).mp3","vj_senrussol/death (7).mp3","vj_senrussol/death (8).mp3","vj_senrussol/death (9).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_senrussol/follow (1).mp3","vj_senrussol/follow (2).mp3","vj_senrussol/follow (3).mp3","vj_senrussol/follow (4).mp3","vj_senrussol/follow (5).mp3","vj_senrussol/follow (6).mp3","vj_senrussol/follow (7).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_senrussol/gotmedic (1).mp3","vj_senrussol/gotmedic (2).mp3","vj_senrussol/gotmedic (3).mp3","vj_senrussol/gotmedic (4).mp3","vj_senrussol/gotmedic (5).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_senrussol/heal (1).mp3","vj_senrussol/heal (2).mp3","vj_senrussol/heal (3).mp3","vj_senrussol/heal (4).mp3","vj_senrussol/heal (5).mp3","vj_senrussol/heal (6).mp3",} 
ENT.B2SoundTbl_CallForHelp = {"vj_senrussol/help (1).mp3","vj_senrussol/help (2).mp3","vj_senrussol/help (3).mp3","vj_senrussol/help (4).mp3","vj_senrussol/help (5).mp3","vj_senrussol/help (6).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_senrussol/hidegrenade (1).mp3","vj_senrussol/hidegrenade (2).mp3","vj_senrussol/hidegrenade (3).mp3","vj_senrussol/hidegrenade (4).mp3","vj_senrussol/hidegrenade (5).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_senrussol/invest (1).mp3","vj_senrussol/invest (2).mp3","vj_senrussol/invest (3).mp3","vj_senrussol/invest (4).mp3","vj_senrussol/invest (5).mp3","vj_senrussol/invest (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_senrussol/kill (1).mp3","vj_senrussol/kill (2).mp3","vj_senrussol/kill (3).mp3","vj_senrussol/kill (4).mp3","vj_senrussol/kill (5).mp3","vj_senrussol/kill (6).mp3","vj_senrussol/kill (7).mp3","vj_senrussol/kill (8).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_senrussol/losthim (1).mp3","vj_senrussol/losthim (2).mp3","vj_senrussol/losthim (3).mp3","vj_senrussol/losthim (4).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_senrussol/mandown (1).mp3","vj_senrussol/mandown (2).mp3","vj_senrussol/mandown (3).mp3","vj_senrussol/mandown (4).mp3","vj_senrussol/mandown (5).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_senrussol/nofollow (1).mp3","vj_senrussol/nofollow (2).mp3","vj_senrussol/nofollow (3).mp3","vj_senrussol/nofollow (4).mp3",}
ENT.B2SoundTbl_Pain = {"vj_senrussol/pain (1).mp3","vj_senrussol/pain (2).mp3","vj_senrussol/pain (3).mp3","vj_senrussol/pain (4).mp3","vj_senrussol/pain (5).mp3","vj_senrussol/pain (6).mp3","vj_senrussol/pain (7).mp3","vj_senrussol/pain (8).mp3","vj_senrussol/pain (9).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_senrussol/playerdamage (1).mp3","vj_senrussol/playerdamage (2).mp3","vj_senrussol/playerdamage (3).mp3","vj_senrussol/playerdamage (4).mp3","vj_senrussol/playerdamage (5).mp3","vj_senrussol/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_senrussol/reloadar (1).mp3","vj_senrussol/reloadar (2).mp3","vj_senrussol/reloadar (3).mp3","vj_senrussol/reloadar (4).mp3","vj_senrussol/reloadar (5).mp3","vj_senrussol/reloadar (6).mp3",}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,2))
	self:SetBodygroup(1,math.random(4,4))
	self:SetBodygroup(2,math.random(3,3))
	self:SetBodygroup(3,math.random(0,0))
	self:SetBodygroup(4,math.random(0,0))
	self:SetBodygroup(5,math.random(2,2))
	self:SetBodygroup(6,math.random(2,3))
	self:SetBodygroup(7,math.random(1,1))
	self:SetBodygroup(8,math.random(0,0))
	self:SetBodygroup(9,math.random(0,1))
	self:SetBodygroup(10,math.random(1,1))
	self:SetBodygroup(11,math.random(2,2))
	if math.random(1,6) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,2)
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/rumale_05.mdl","models/sentry/sentrycag/ruarmyspe/rumale_07.mdl","models/sentry/sentrycag/ruarmyspe/rumale_08.mdl","models/sentry/sentrycag/ruarmyspe/rumale_09.mdl","models/sentry/sentrycag/ruarmy/rumale_04.mdl"}
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
		self.Model = {"models/sentry/sentrycag/ruarmy/rumale_02.mdl","models/sentry/sentrycag/ruarmy/rumale_04.mdl","models/sentry/sentrycag/ruarmy/rumale_05.mdl","models/sentry/sentrycag/ruarmy/rumale_07.mdl","models/sentry/sentrycag/ruarmy/rumale_06.mdl","models/sentry/sentrycag/ruarmy/rumale_08.mdl","models/sentry/sentrycag/ruarmy/rumale_09.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/