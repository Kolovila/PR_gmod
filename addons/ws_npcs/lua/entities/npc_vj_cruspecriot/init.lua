AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = true -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_RUSSIAN_FRIENDLY","CLASS_CHINA_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
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
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_senruspec/alert (1).mp3","vj_senruspec/alert (2).mp3","vj_senruspec/alert (3).mp3","vj_senruspec/alert (4).mp3","vj_senruspec/alert (5).mp3","vj_senruspec/alert (6).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_senruspec/bump (1).mp3","vj_senruspec/bump (2).mp3","vj_senruspec/bump (3).mp3","vj_senruspec/bump (4).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_senruspec/chat (1).mp3","vj_senruspec/chat (2).mp3","vj_senruspec/chat (3).mp3","vj_senruspec/chat (4).mp3","vj_senruspec/chat (5).mp3","vj_senruspec/chat (6).mp3","vj_senruspec/chat (7).mp3","vj_senruspec/chat (8).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_senruspec/combat (1).mp3","vj_senruspec/combat (2).mp3","vj_senruspec/combat (3).mp3","vj_senruspec/combat (4).mp3","vj_senruspec/combat (5).mp3","vj_senruspec/combat (6).mp3","vj_senruspec/combat (7).mp3","vj_senruspec/combat (8).mp3","vj_senruspec/combat (9).mp3"}
ENT.B1SoundTbl_Death = {"vj_senruspol/death (1).mp3","vj_senruspol/death (2).mp3","vj_senruspol/death (3).mp3","vj_senruspol/death (4).mp3","vj_senruspol/death (5).mp3","vj_senruspol/death (6).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_senruspec/follow (1).mp3","vj_senruspec/follow (2).mp3","vj_senruspec/follow (3).mp3","vj_senruspec/follow (4).mp3","vj_senruspec/follow (5).mp3","vj_senruspec/follow (6).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_senruspec/grenade (1).mp3","vj_senruspec/grenade (2).mp3","vj_senruspec/grenade (3).mp3"}
ENT.B1SoundTbl_CallForHelp = {"vj_senruspec/help (1).mp3","vj_senruspec/help (2).mp3","vj_senruspec/help (3).mp3"}
ENT.B1SoundTbl_OnPlayerSight = {"vj_senruspec/hi (1).mp3","vj_senruspec/hi (2).mp3","vj_senruspec/hi (3).mp3","vj_senruspec/hi (4).mp3","vj_senruspec/hi (5).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_senruspec/hidegrenade (1).mp3","vj_senruspec/hidegrenade (2).mp3","vj_senruspec/hidegrenade (3).mp3","vj_senruspec/hidegrenade (4).mp3","vj_senruspec/hidegrenade (5).mp3"}
ENT.B1SoundTbl_IdleDialogue = {"vj_senruspec/idle (1).mp3","vj_senruspec/idle (2).mp3","vj_senruspec/idle (3).mp3","vj_senruspec/idle (4).mp3","vj_senruspec/idle (5).mp3","vj_senruspec/idle (6).mp3"}
ENT.B1SoundTbl_IdleDialogueAnswer = {"vj_senruspec/idleans (1).mp3","vj_senruspec/idleans (2).mp3","vj_senruspec/idleans (3).mp3","vj_senruspec/idleans (4).mp3","vj_senruspec/idleans (5).mp3","vj_senruspec/idleans (6).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_senruspec/invest (1).mp3","vj_senruspec/invest (2).mp3","vj_senruspec/invest (3).mp3","vj_senruspec/invest (4).mp3","vj_senruspec/invest (5).mp3","vj_senruspec/invest (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_senruspec/kill (1).mp3","vj_senruspec/kill (2).mp3","vj_senruspec/kill (3).mp3","vj_senruspec/kill (4).mp3","vj_senruspec/kill (5).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_senruspec/losthim (1).mp3","vj_senruspec/losthim (2).mp3","vj_senruspec/losthim (3).mp3","vj_senruspec/losthim (4).mp3","vj_senruspec/losthim (5).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_senruspec/mandown (1).mp3","vj_senruspec/mandown (2).mp3","vj_senruspec/mandown (3).mp3","vj_senruspec/mandown (4).mp3","vj_senruspec/mandown (5).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_senruspec/nofollow (1).mp3","vj_senruspec/nofollow (2).mp3","vj_senruspec/nofollow (3).mp3","vj_senruspec/nofollow (4).mp3","vj_senruspec/nofollow (5).mp3"}
ENT.B1SoundTbl_Pain = {"vj_senruspec/pain (1).mp3","vj_senruspec/pain (2).mp3","vj_senruspec/pain (3).mp3","vj_senruspec/pain (4).mp3","vj_senruspec/pain (5).mp3","vj_senruspec/pain (6).mp3","vj_senruspec/pain (7).mp3","vj_senruspec/pain (8).mp3",}
ENT.B1SoundTbl_WeaponReload = {"vj_senruspec/reload (1).mp3","vj_senruspec/reload (2).mp3","vj_senruspec/reload (3).mp3","vj_senruspec/reload (4).mp3","vj_senruspec/reload (5).mp3","vj_senruspec/reload (6).mp3",}
ENT.B1SoundTbl_Suppressing = {"vj_senruspec/suppress (1).mp3","vj_senruspec/suppress (2).mp3","vj_senruspec/suppress (3).mp3","vj_senruspec/suppress (4).mp3","vj_senruspec/suppress (5).mp3","vj_senruspec/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,6))
	self:SetBodygroup(1,math.random(0,2))  
	self:SetBodygroup(2,math.random(0,2))  
	self:SetBodygroup(3,math.random(1,1))  
	self:SetBodygroup(4,math.random(4,4))  
	   if math.random(1,10) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,1)
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/male_11.mdl"}
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
		self.Model = {"models/sentry/sentrycag/cops/policeru_01_omon.mdl","models/sentry/sentrycag/cops/policeru_02_omon.mdl","models/sentry/sentrycag/cops/policeru_03_omon.mdl","models/sentry/sentrycag/cops/policeru_04_omon.mdl","models/sentry/sentrycag/cops/policeru_05_omon.mdl","models/sentry/sentrycag/cops/policeru_06_omon.mdl","models/sentry/sentrycag/cops/policeru_07_omon.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/