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
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.B2SoundTbl_Alert = {"vj_senrussol/alert (1).mp3","vj_senrussol/alert (2).mp3","vj_senrussol/alert (3).mp3","vj_senrussol/alert (4).mp3","vj_senrussol/alert (5).mp3","vj_senrussol/alert (6).mp3"}
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
ENT.B2SoundTbl_WeaponReload = {"vj_senrussol/reload (1).mp3","vj_senrussol/reload (2).mp3","vj_senrussol/reload (3).mp3","vj_senrussol/reload (4).mp3","vj_senrussol/reload (5).mp3","vj_senrussol/reload (6).mp3",}
ENT.B2SoundTbl_Suppressing = {"vj_senrussol/suppress (1).mp3","vj_senrussol/suppress (2).mp3","vj_senrussol/suppress (3).mp3","vj_senrussol/suppress (4).mp3","vj_senrussol/suppress (5).mp3","vj_senrussol/suppress (6).mp3"}

ENT.B3SoundTbl_Alert = {"vj_ro2rus3/alert (1).mp3","vj_ro2rus3/alert (2).mp3","vj_ro2rus3/alert (3).mp3","vj_ro2rus3/alert (4).mp3","vj_ro2rus3/alert (5).mp3","vj_ro2rus3/alert (6).mp3"} 
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_ro2rus3/bump (1).mp3","vj_ro2rus3/bump (2).mp3","vj_ro2rus3/bump (3).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_ro2rus3/chat (1).mp3","vj_ro2rus3/chat (2).mp3","vj_ro2rus3/chat (3).mp3","vj_ro2rus3/chat (4).mp3","vj_ro2rus3/chat (5).mp3","vj_ro2rus3/chat (6).mp3","vj_ro2rus3/chat (7).mp3","vj_ro2rus3/chat (8).mp3","vj_ro2rus3/chat (9).mp3","vj_ro2rus3/chat (10).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_ro2rus3/combat (1).mp3","vj_ro2rus3/combat (2).mp3","vj_ro2rus3/combat (3).mp3","vj_ro2rus3/combat (4).mp3","vj_ro2rus3/combat (5).mp3","vj_ro2rus3/combat (6).mp3","vj_ro2rus3/combat (7).mp3","vj_ro2rus3/combat (8).mp3","vj_ro2rus3/combat (9).mp3","vj_ro2rus3/combat (10).mp3"}
ENT.B3SoundTbl_Death = {"vj_ro2rus3/death (1).mp3","vj_ro2rus3/death (2).mp3","vj_ro2rus3/death (3).mp3","vj_ro2rus3/death (4).mp3","vj_ro2rus3/death (5).mp3","vj_ro2rus3/death (6).mp3","vj_ro2rus3/death (7).mp3","vj_ro2rus3/death (8).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_ro2rus3/follow (1).mp3","vj_ro2rus3/follow (2).mp3","vj_ro2rus3/follow (3).mp3","vj_ro2rus3/follow (4).mp3","vj_ro2rus3/follow (5).mp3","vj_ro2rus3/follow (6).mp3"}
ENT.B3SoundTbl_MedicReceiveHeal = {"vj_ro2rus3/gotmedic (1).mp3","vj_ro2rus3/gotmedic (2).mp3"}
ENT.B3SoundTbl_GrenadeAttack = {"vj_ro2rus3/grenade (1).mp3","vj_ro2rus3/grenade (2).mp3","vj_ro2rus3/grenade (3).mp3"}
ENT.B3SoundTbl_MedicBeforeHeal = {"vj_ro2rus3/heal (1).mp3","vj_ro2rus3/heal (2).mp3","vj_ro2rus3/heal (3).mp3"} 
ENT.B3SoundTbl_CallForHelp = {"vj_ro2rus3/help (1).mp3","vj_ro2rus3/help (2).mp3","vj_ro2rus3/help (3).mp3","vj_ro2rus3/help (4).mp3","vj_ro2rus3/help (5).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_ro2rus3/hidegrenade (1).mp3","vj_ro2rus3/hidegrenade (2).mp3","vj_ro2rus3/hidegrenade (3).mp3","vj_ro2rus3/hidegrenade (4).mp3","vj_ro2rus3/hidegrenade (5).mp3","vj_ro2rus3/hidegrenade (6).mp3"}
--ENT.B3SoundTbl_IdleDialogue = {"vj_ro2rus3/idle (1).mp3","vj_ro2rus3/idle (2).mp3","vj_ro2rus3/idle (3).mp3","vj_ro2rus3/idle (4).mp3","vj_ro2rus3/idle (5).mp3","vj_ro2rus3/idle (6).mp3","vj_ro2rus3/idle (7).mp3","vj_ro2rus3/idle (8).mp3"}
ENT.B3SoundTbl_Investigate = {"vj_ro2rus3/invest (1).mp3","vj_ro2rus3/invest (2).mp3","vj_ro2rus3/invest (3).mp3","vj_ro2rus3/invest (4).mp3","vj_ro2rus3/invest (5).mp3","vj_ro2rus3/invest (6).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_ro2rus3/kill (1).mp3","vj_ro2rus3/kill (2).mp3","vj_ro2rus3/kill (3).mp3","vj_ro2rus3/kill (4).mp3","vj_ro2rus3/kill (5).mp3","vj_ro2rus3/kill (6).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_ro2rus3/losthim (1).mp3","vj_ro2rus3/losthim (2).mp3","vj_ro2rus3/losthim (3).mp3","vj_ro2rus3/losthim (4).mp3","vj_ro2rus3/losthim (5).mp3","vj_ro2rus3/losthim (6).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_ro2rus3/mandown (1).mp3","vj_ro2rus3/mandown (2).mp3","vj_ro2rus3/mandown (3).mp3","vj_ro2rus3/mandown (4).mp3","vj_ro2rus3/mandown (5).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_ro2rus3/nofollow (1).mp3","vj_ro2rus3/nofollow (2).mp3","vj_ro2rus3/nofollow (3).mp3","vj_ro2rus3/nofollow (4).mp3","vj_ro2rus3/nofollow (5).mp3","vj_ro2rus3/nofollow (6).mp3"}
ENT.B3SoundTbl_Pain = {"vj_ro2rus3/pain (1).mp3","vj_ro2rus3/pain (2).mp3","vj_ro2rus3/pain (3).mp3","vj_ro2rus3/pain (4).mp3","vj_ro2rus3/pain (5).mp3","vj_ro2rus3/pain (6).mp3","vj_ro2rus3/pain (7).mp3","vj_ro2rus3/pain (8).mp3","vj_ro2rus3/pain (9).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_ro2rus3/playerdamage (1).mp3","vj_ro2rus3/playerdamage (2).mp3","vj_ro2rus3/playerdamage (3).mp3","vj_ro2rus3/playerdamage (4).mp3","vj_ro2rus3/playerdamage (5).mp3","vj_ro2rus3/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_ro2rus3/reload (1).mp3","vj_ro2rus3/reload (2).mp3","vj_ro2rus3/reload (3).mp3","vj_ro2rus3/reload (4).mp3","vj_ro2rus3/reload (5).mp3","vj_ro2rus3/reload (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_ro2rus3/suppress (1).mp3","vj_ro2rus3/suppress (2).mp3","vj_ro2rus3/suppress (3).mp3","vj_ro2rus3/suppress (4).mp3","vj_ro2rus3/suppress (5).mp3","vj_ro2rus3/suppress (6).mp3","vj_ro2rus3/suppress (7).mp3"}

ENT.B4SoundTbl_Alert = {"vj_ro2rus2/alert (1).mp3","vj_ro2rus2/alert (2).mp3","vj_ro2rus2/alert (3).mp3","vj_ro2rus2/alert (4).mp3","vj_ro2rus2/alert (5).mp3","vj_ro2rus2/alert (6).mp3"} 
ENT.B4SoundTbl_MoveOutOfPlayersWay = {"vj_ro2rus2/bump (1).mp3","vj_ro2rus2/bump (2).mp3","vj_ro2rus2/bump (3).mp3"} 
ENT.B4SoundTbl_Idle = {"vj_ro2rus2/chat (1).mp3","vj_ro2rus2/chat (2).mp3","vj_ro2rus2/chat (3).mp3","vj_ro2rus2/chat (4).mp3","vj_ro2rus2/chat (5).mp3","vj_ro2rus2/chat (6).mp3","vj_ro2rus2/chat (7).mp3","vj_ro2rus2/chat (8).mp3","vj_ro2rus2/chat (9).mp3","vj_ro2rus2/chat (10).mp3"}
ENT.B4SoundTbl_CombatIdle = {"vj_ro2rus2/combat (1).mp3","vj_ro2rus2/combat (2).mp3","vj_ro2rus2/combat (3).mp3","vj_ro2rus2/combat (4).mp3","vj_ro2rus2/combat (5).mp3","vj_ro2rus2/combat (6).mp3","vj_ro2rus2/combat (7).mp3","vj_ro2rus2/combat (8).mp3","vj_ro2rus2/combat (9).mp3","vj_ro2rus2/combat (10).mp3"}
ENT.B4SoundTbl_Death = {"vj_ro2rus2/death (1).mp3","vj_ro2rus2/death (2).mp3","vj_ro2rus2/death (3).mp3","vj_ro2rus2/death (4).mp3","vj_ro2rus2/death (5).mp3","vj_ro2rus2/death (6).mp3","vj_ro2rus2/death (7).mp3","vj_ro2rus2/death (8).mp3"}
ENT.B4SoundTbl_FollowPlayer = {"vj_ro2rus2/follow (1).mp3","vj_ro2rus2/follow (2).mp3","vj_ro2rus2/follow (3).mp3","vj_ro2rus2/follow (4).mp3","vj_ro2rus2/follow (5).mp3","vj_ro2rus2/follow (6).mp3"}
ENT.B4SoundTbl_MedicReceiveHeal = {"vj_ro2rus2/gotmedic (1).mp3","vj_ro2rus2/gotmedic (2).mp3"}
ENT.B4SoundTbl_GrenadeAttack = {"vj_ro2rus2/grenade (1).mp3","vj_ro2rus2/grenade (2).mp3","vj_ro2rus2/grenade (3).mp3"}
ENT.B4SoundTbl_MedicBeforeHeal = {"vj_ro2rus2/heal (1).mp3","vj_ro2rus2/heal (2).mp3","vj_ro2rus2/heal (3).mp3"} 
ENT.B4SoundTbl_CallForHelp = {"vj_ro2rus2/help (1).mp3","vj_ro2rus2/help (2).mp3","vj_ro2rus2/help (3).mp3","vj_ro2rus2/help (4).mp3","vj_ro2rus2/help (5).mp3"}
ENT.B4SoundTbl_OnGrenadeSight = {"vj_ro2rus2/hidegrenade (1).mp3","vj_ro2rus2/hidegrenade (2).mp3","vj_ro2rus2/hidegrenade (3).mp3","vj_ro2rus2/hidegrenade (4).mp3","vj_ro2rus2/hidegrenade (5).mp3","vj_ro2rus2/hidegrenade (6).mp3"}
--ENT.B4SoundTbl_IdleDialogue = {"vj_ro2rus2/idle (1).mp3","vj_ro2rus2/idle (2).mp3","vj_ro2rus2/idle (3).mp3","vj_ro2rus2/idle (4).mp3","vj_ro2rus2/idle (5).mp3","vj_ro2rus2/idle (6).mp3","vj_ro2rus2/idle (7).mp3","vj_ro2rus2/idle (8).mp3"}
ENT.B4SoundTbl_Investigate = {"vj_ro2rus2/invest (1).mp3","vj_ro2rus2/invest (2).mp3","vj_ro2rus2/invest (3).mp3","vj_ro2rus2/invest (4).mp3","vj_ro2rus2/invest (5).mp3","vj_ro2rus2/invest (6).mp3"}
ENT.B4SoundTbl_OnKilledEnemy = {"vj_ro2rus2/kill (1).mp3","vj_ro2rus2/kill (2).mp3","vj_ro2rus2/kill (3).mp3","vj_ro2rus2/kill (4).mp3","vj_ro2rus2/kill (5).mp3","vj_ro2rus2/kill (6).mp3"}
ENT.B4SoundTbl_LostEnemy = {"vj_ro2rus2/losthim (1).mp3","vj_ro2rus2/losthim (2).mp3","vj_ro2rus2/losthim (3).mp3","vj_ro2rus2/losthim (4).mp3","vj_ro2rus2/losthim (5).mp3","vj_ro2rus2/losthim (6).mp3"}
ENT.B4SoundTbl_AllyDeath = {"vj_ro2rus2/mandown (1).mp3","vj_ro2rus2/mandown (2).mp3","vj_ro2rus2/mandown (3).mp3","vj_ro2rus2/mandown (4).mp3","vj_ro2rus2/mandown (5).mp3"}
ENT.B4SoundTbl_UnFollowPlayer = {"vj_ro2rus2/nofollow (1).mp3","vj_ro2rus2/nofollow (2).mp3","vj_ro2rus2/nofollow (3).mp3","vj_ro2rus2/nofollow (4).mp3","vj_ro2rus2/nofollow (5).mp3","vj_ro2rus2/nofollow (6).mp3"}
ENT.B4SoundTbl_Pain = {"vj_ro2rus2/pain (1).mp3","vj_ro2rus2/pain (2).mp3","vj_ro2rus2/pain (3).mp3","vj_ro2rus2/pain (4).mp3","vj_ro2rus2/pain (5).mp3","vj_ro2rus2/pain (6).mp3","vj_ro2rus2/pain (7).mp3","vj_ro2rus2/pain (8).mp3","vj_ro2rus2/pain (9).mp3"}
ENT.B4SoundTbl_DamageByPlayer = {"vj_ro2rus2/playerdamage (1).mp3","vj_ro2rus2/playerdamage (2).mp3","vj_ro2rus2/playerdamage (3).mp3","vj_ro2rus2/playerdamage (4).mp3","vj_ro2rus2/playerdamage (5).mp3","vj_ro2rus2/playerdamage (6).mp3"}
ENT.B4SoundTbl_WeaponReload = {"vj_ro2rus2/reload (1).mp3","vj_ro2rus2/reload (2).mp3","vj_ro2rus2/reload (3).mp3","vj_ro2rus2/reload (4).mp3","vj_ro2rus2/reload (5).mp3","vj_ro2rus2/reload (6).mp3"}
ENT.B4SoundTbl_Suppressing = {"vj_ro2rus2/suppress (1).mp3","vj_ro2rus2/suppress (2).mp3","vj_ro2rus2/suppress (3).mp3","vj_ro2rus2/suppress (4).mp3","vj_ro2rus2/suppress (5).mp3","vj_ro2rus2/suppress (6).mp3","vj_ro2rus2/suppress (7).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,2))
	self:SetBodygroup(1,math.random(5,5))
	self:SetBodygroup(2,math.random(0,3))
	self:SetBodygroup(3,math.random(2,2))
	self:SetBodygroup(4,math.random(0,0))
	self:SetBodygroup(5,math.random(0,0))
	self:SetBodygroup(6,math.random(0,1))
	self:SetBodygroup(7,math.random(1,1))
	self:SetBodygroup(8,math.random(0,0))
	self:SetBodygroup(9,math.random(1,1))
	self:SetBodygroup(10,math.random(1,1))
	self:SetBodygroup(11,math.random(2,2))
	if math.random(1,4) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,4)
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/rumale_02.mdl","models/sentry/sentrycag/ruarmyspe/rumale_04.mdl","models/sentry/sentrycag/ruarmyspe/rumale_06.mdl"}
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/rumale_02.mdl","models/sentry/sentrycag/ruarmyspe/rumale_04.mdl","models/sentry/sentrycag/ruarmyspe/rumale_06.mdl","models/sentry/sentrycag/ruarmyspe/rumale_07.mdl"}
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
        self.SoundTbl_MoveOutOfPlayersWay = self.B3SoundTbl_MoveOutOfPlayersWay
        self.SoundTbl_UnFollowPlayer = self.B3SoundTbl_UnFollowPlayer
        self.SoundTbl_Pain = self.B3SoundTbl_Pain
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
        self.SoundTbl_GrenadeAttack = self.B3SoundTbl_GrenadeAttack
		self.Model = {"models/sentry/sentrycag/ruarmyspe/rumale_02.mdl","models/sentry/sentrycag/ruarmyspe/rumale_04.mdl","models/sentry/sentrycag/ruarmyspe/rumale_06.mdl","models/sentry/sentrycag/ruarmyspe/rumale_07.mdl"}
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
        self.SoundTbl_GrenadeAttack = self.B4SoundTbl_GrenadeAttack
		self.Model = {"models/sentry/sentrycag/ruarmyspe/rumale_02.mdl","models/sentry/sentrycag/ruarmyspe/rumale_04.mdl","models/sentry/sentrycag/ruarmyspe/rumale_06.mdl","models/sentry/sentrycag/ruarmyspe/rumale_07.mdl"}
		end	
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/