AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
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
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.B1SoundTbl_Alert = {"vj_bf2hebrew/alert (1).mp3","vj_bf2hebrew/alert (2).mp3","vj_bf2hebrew/alert (3).mp3","vj_bf2hebrew/alert (4).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_bf2hebrew/bump (1).mp3","vj_bf2hebrew/bump (2).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_bf2hebrew/chatsar (1).mp3","vj_bf2hebrew/chatsar (2).mp3","vj_bf2hebrew/chatsar (3).mp3","vj_bf2hebrew/chatsar (4).mp3","vj_bf2hebrew/chatsar (5).mp3","vj_bf2hebrew/chatsar (6).mp3","vj_bf2hebrew/chatsar (7).mp3","vj_bf2hebrew/chatsar (8).mp3","vj_bf2hebrew/chatsar (9).mp3","vj_bf2hebrew/chatsar (10).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_bf2hebrew/combat (1).mp3","vj_bf2hebrew/combat (2).mp3","vj_bf2hebrew/combat (3).mp3","vj_bf2hebrew/combat (4).mp3"}
ENT.B1SoundTbl_Death = {"bfdeath/death (1).mp3","bfdeath/death (2).mp3","bfdeath/death (3).mp3","bfdeath/death (4).mp3","bfdeath/death (5).mp3","bfdeath/death (6).mp3","bfdeath/death (7).mp3","bfdeath/death (8).mp3","bfdeath/death (9).mp3","bfdeath/death (10).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_bf2hebrew/follow (1).mp3","vj_bf2hebrew/follow (2).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_bf2hebrew/gotmedic (1).mp3","vj_bf2hebrew/gotmedic (2).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_bf2hebrew/grenade (1).mp3","vj_bf2hebrew/grenade (2).mp3","vj_bf2hebrew/grenade (3).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_bf2hebrew/heal (1).mp3","vj_bf2hebrew/heal (2).mp3","vj_bf2hebrew/heal (3).mp3","vj_bf2hebrew/heal (4).mp3"} 
ENT.B1SoundTbl_OnGrenadeSight = {"vj_bf2hebrew/hidegrenade (1).mp3","vj_bf2hebrew/hidegrenade (2).mp3","vj_bf2hebrew/hidegrenade (3).mp3","vj_bf2hebrew/hidegrenade (4).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_bf2hebrew/mandown (1).mp3","vj_bf2hebrew/mandown (2).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_bf2hebrew/nofollow (1).mp3","vj_bf2hebrew/nofollow (2).mp3","vj_bf2hebrew/nofollow (3).mp3"}
ENT.B1SoundTbl_Pain = {"bfdeath/pain (1).mp3","bfdeath/pain (2).mp3","bfdeath/pain (3).mp3","bfdeath/pain (4).mp3","bfdeath/pain (5).mp3","bfdeath/pain (6).mp3","bfdeath/pain (7).mp3","bfdeath/pain (8).mp3","bfdeath/pain (9).mp3","bfdeath/pain (10).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_bf2hebrew/playerdamage (1).mp3","vj_bf2hebrew/playerdamage (2).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_bf2hebrew/reload (1).mp3","vj_bf2hebrew/reload (2).mp3","vj_bf2hebrew/reload (3).mp3","vj_bf2hebrew/reload (4).mp3"}

ENT.B2SoundTbl_Alert = {"vj_bf2hebrewsr/alert (1).mp3","vj_bf2hebrewsr/alert (2).mp3","vj_bf2hebrewsr/alert (3).mp3","vj_bf2hebrewsr/alert (4).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_bf2hebrewsr/bump (1).mp3","vj_bf2hebrewsr/bump (2).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_bf2hebrewsr/chatsar (1).mp3","vj_bf2hebrewsr/chatsar (2).mp3","vj_bf2hebrewsr/chatsar (3).mp3","vj_bf2hebrewsr/chatsar (4).mp3","vj_bf2hebrewsr/chatsar (5).mp3","vj_bf2hebrewsr/chatsar (6).mp3","vj_bf2hebrewsr/chatsar (7).mp3","vj_bf2hebrewsr/chatsar (8).mp3","vj_bf2hebrewsr/chatsarchatsar (9).mp3","vj_bf2hebrewsr/chatsar (10).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_bf2hebrewsr/combat (1).mp3","vj_bf2hebrewsr/combat (2).mp3","vj_bf2hebrewsr/combat (4).mp3","vj_bf2hebrewsr/combat (5).mp3","vj_bf2hebrewsr/combat (6).mp3","vj_bf2hebrewsr/combat (7).mp3"}
ENT.B2SoundTbl_Death = {"bfdeath/death (1).mp3","bfdeath/death (2).mp3","bfdeath/death (3).mp3","bfdeath/death (4).mp3","bfdeath/death (5).mp3","bfdeath/death (6).mp3","bfdeath/death (7).mp3","bfdeath/death (8).mp3","bfdeath/death (9).mp3","bfdeath/death (10).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_bf2hebrewsr/follow (1).mp3","vj_bf2hebrewsr/follow (2).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_bf2hebrewsr/gotmedic (1).mp3","vj_bf2hebrewsr/gotmedic (2).mp3"}
ENT.B2SoundTbl_GrenadeAttack = {"vj_bf2hebrewsr/grenade (1).mp3","vj_bf2hebrewsr/grenade (2).mp3","vj_bf2hebrewsr/grenade (3).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_bf2hebrewsr/heal (1).mp3","vj_bf2hebrewsr/heal (2).mp3","vj_bf2hebrewsr/heal (3).mp3","vj_bf2hebrewsr/heal (4).mp3"} 
ENT.B2SoundTbl_OnGrenadeSight = {"vj_bf2hebrewsr/hidegrenade (1).mp3","vj_bf2hebrewsr/hidegrenade (2).mp3","vj_bf2hebrewsr/hidegrenade (3).mp3","vj_bf2hebrewsr/hidegrenade (4).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_bf2hebrewsr/mandown (1).mp3","vj_bf2hebrewsr/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_bf2hebrewsr/nofollow (1).mp3","vj_bf2hebrewsr/nofollow (2).mp3","vj_bf2hebrewsr/nofollow (3).mp3"}
ENT.B2SoundTbl_Pain = {"bfdeath/pain (1).mp3","bfdeath/pain (2).mp3","bfdeath/pain (3).mp3","bfdeath/pain (4).mp3","bfdeath/pain (5).mp3","bfdeath/pain (6).mp3","bfdeath/pain (7).mp3","bfdeath/pain (8).mp3","bfdeath/pain (9).mp3","bfdeath/pain (10).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_bf2hebrewsr/playerdamage (1).mp3","vj_bf2hebrewsr/playerdamage (2).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_bf2hebrewsr/reload (1).mp3","vj_bf2hebrewsr/reload (2).mp3","vj_bf2hebrewsr/reload (3).mp3","vj_bf2hebrewsr/reload (4).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,10))
	self:SetBodygroup(1,math.random(0,2))
	self:SetBodygroup(2,math.random(2,2))
	self:SetBodygroup(3,math.random(0,0))
	self:SetBodygroup(4,math.random(1,1))
	self:SetBodygroup(5,math.random(0,0))
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
end


function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,2)
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
		self.Model = {"models/sentry/sentrycag/idfarmy/sarge/older_israeli2.mdl"}
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
		self.Model = {"models/sentry/sentrycag/idfarmy/sarge/older_israeli2.mdl"}
		end
		end
		end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/