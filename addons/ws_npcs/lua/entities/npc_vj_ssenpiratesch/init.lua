AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/senpirate/re/sentrysenpiratemale1.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.BlackModels = {"models/sentry/sentrycag/senpirate/re/sentrysenpiratemale1.mdl"}
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_PIRATE"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing","thrust"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"grenDrop"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.WSoundTbl_Alert = {"vj_lostb2/alert (1).mp3","vj_lostb2/alert (2).mp3","vj_lostb2/alert (3).mp3","vj_lostb2/alert (4).mp3","vj_lostb2/alert (5).mp3"}
ENT.WSoundTbl_BecomeEnemyToPlayer = {"vj_lostb2/becomehos (1).mp3","vj_lostb2/becomehos (2).mp3","vj_lostb2/becomehos (3).mp3"}
ENT.WSoundTbl_MoveOutOfPlayersWay = {"vj_lostb2/bump (1).mp3","vj_lostb2/bump (2).mp3","vj_lostb2/bump (3).mp3"} 
ENT.WSoundTbl_Idle = {"vj_lostb2/chat (1).mp3","vj_lostb2/chat (2).mp3","vj_lostb2/chat (3).mp3","vj_lostb2/chat (4).mp3","vj_lostb2/chat (5).mp3","vj_lostb2/chat (6).mp3"}
ENT.WSoundTbl_CombatIdle = {"vj_lostb2/combat (1).mp3","vj_lostb2/combat (2).mp3","vj_lostb2/combat (3).mp3","vj_lostb2/combat (4).mp3","vj_lostb2/combat (5).mp3","vj_lostb2/combat (6).mp3","vj_lostb2/combat (7).mp3","vj_lostb2/combat (8).mp3","vj_lostb2/combat (9).mp3","vj_lostb2/combat (10).mp3","vj_lostb2/combat (11).mp3"}
ENT.WSoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3"}
ENT.WSoundTbl_FollowPlayer = {"vj_lostb2/follow (1).mp3","vj_lostb2/follow (2).mp3","vj_lostb2/follow (3).mp3","vj_lostb2/follow (4).mp3","vj_lostb2/follow (5).mp3","vj_lostb2/follow (6).mp3"}
ENT.WSoundTbl_MedicReceiveHeal = {"vj_lostb2/gotmedic (1).mp3"}
ENT.WSoundTbl_MedicBeforeHeal = {"vj_lostb2/heal (1).mp3","vj_lostb2/heal (2).mp3"} 
ENT.WSoundTbl_OnPlayerSight = {"vj_lostb2/hi (1).mp3",}
ENT.WSoundTbl_OnGrenadeSight = {"vj_lostb2/hidegrenade (1).mp3","vj_lostb2/hidegrenade (3).mp3","vj_lostb2/hidegrenade (2).mp3","vj_lostb2/hidegrenade (4).mp3","vj_lostb2/hidegrenade (5).mp3","vj_lostb2/hidegrenade (6).mp3"}
ENT.WSoundTbl_Investigate = {"vj_lostb2/invest (1).mp3","vj_lostb2/invest (2).mp3","vj_lostb2/invest (3).mp3","vj_lostb2/invest (4).mp3","vj_lostb2/invest (5).mp3"}
ENT.WSoundTbl_OnKilledEnemy = {"vj_lostb2/kill (1).mp3","vj_lostb2/kill (2).mp3","vj_lostb2/kill (3).mp3","vj_lostb2/kill (4).mp3"}
ENT.WSoundTbl_LostEnemy = {"vj_lostb2/losthim (1).mp3","vj_lostb2/losthim (2).mp3","vj_lostb2/losthim (3).mp3","vj_lostb2/losthim (4).mp3"}
ENT.WSoundTbl_AllyDeath = {"vj_lostb2/mandown (1).mp3","vj_lostb2/mandown (2).mp3"}
ENT.WSoundTbl_UnFollowPlayer = {"vj_lostb2/nofollow (1).mp3","vj_lostb2/nofollow (2).mp3","vj_lostb2/nofollow (3).mp3"}
ENT.WSoundTbl_Pain = {"vj_lostb2/pain (1).mp3","vj_lostb2/pain (2).mp3","vj_lostb2/pain (3).mp3","vj_lostb2/pain (4).mp3","vj_lostb2/pain (5).mp3","vj_lostb2/pain (6).mp3","vj_lostb2/pain (7).mp3","vj_lostb2/pain (8).mp3"}
ENT.WSoundTbl_DamageByPlayer = {"vj_lostb2/playerdamage (1).mp3","vj_lostb2/playerdamage (2).mp3","vj_lostb2/playerdamage (3).mp3","vj_lostb2/playerdamage (4).mp3","vj_lostb2/playerdamage (5).mp3","vj_lostb2/playerdamage (6).mp3"}
ENT.WSoundTbl_WeaponReload = {"vj_lostb2/reload (1).mp3","vj_lostb2/reload (2).mp3","vj_lostb2/reload (3).mp3","vj_lostb2/reload (4).mp3","vj_lostb2/reload (5).mp3","vj_lostb2/reload (6).mp3"}
ENT.WSoundTbl_Suppressing = {"vj_lostb2/suppress (1).mp3","vj_lostb2/suppress (2).mp3","vj_lostb2/suppress (3).mp3","vj_lostb2/suppress (4).mp3","vj_lostb2/suppress (5).mp3","vj_lostb2/suppress (6).mp3"}

ENT.BSoundTbl_Alert = {"vj_lostb3/alert (1).mp3","vj_lostb3/alert (2).mp3","vj_lostb3/alert (3).mp3","vj_lostb3/alert (4).mp3","vj_lostb3/alert (5).mp3","vj_lostb3/alert (6).mp3"}
ENT.BSoundTbl_BecomeEnemyToPlayer = {"vj_lostb3/becomehos (1).mp3","vj_lostb3/becomehos (2).mp3","vj_lostb3/becomehos (3).mp3"}
ENT.BSoundTbl_MoveOutOfPlayersWay = {"vj_lostb3/bump (1).mp3","vj_lostb3/bump (2).mp3","vj_lostb3/bump (3).mp3","vj_lostb3/bump (4).mp3"} 
ENT.BSoundTbl_Idle = {"vj_lostb3/chat (1).mp3","vj_lostb3/chat (2).mp3","vj_lostb3/chat (3).mp3","vj_lostb3/chat (4).mp3","vj_lostb3/chat (5).mp3","vj_lostb3/chat (6).mp3"}
ENT.BSoundTbl_CombatIdle = {"vj_lostb3/combat (1).mp3","vj_lostb3/combat (2).mp3","vj_lostb3/combat (3).mp3","vj_lostb3/combat (4).mp3","vj_lostb3/combat (5).mp3","vj_lostb3/combat (6).mp3","vj_lostb3/combat (7).mp3","vj_lostb3/combat (8).mp3","vj_lostb3/combat (9).mp3","vj_lostb3/combat (10).mp3"}
ENT.BSoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3"}
ENT.BSoundTbl_FollowPlayer = {"vj_lostb3/follow (1).mp3","vj_lostb3/follow (2).mp3","vj_lostb3/follow (3).mp3","vj_lostb3/follow (4).mp3","vj_lostb3/follow (5).mp3"}
ENT.BSoundTbl_MedicReceiveHeal = {"vj_lostb3/gotmedic (1).mp3"}
ENT.BSoundTbl_MedicBeforeHeal = {"vj_lostb3/heal (1).mp3","vj_lostb3/heal (2).mp3","vj_lostb3/heal (3).mp3","vj_lostb3/heal (4).mp3"} 
ENT.BSoundTbl_OnPlayerSight = {"vj_lostb3/hi (1).mp3"}
ENT.BSoundTbl_OnGrenadeSight = {"vj_lostb3/hidegrenade (1).mp3","vj_lostb3/hidegrenade (3).mp3","vj_lostb3/hidegrenade (2).mp3","vj_lostb3/hidegrenade (4).mp3","vj_lostb3/hidegrenade (5).mp3","vj_lostb3/hidegrenade (6).mp3"}
ENT.BSoundTbl_Investigate = {"vj_lostb3/invest (1).mp3","vj_lostb3/invest (2).mp3","vj_lostb3/invest (3).mp3","vj_lostb3/invest (4).mp3","vj_lostb3/invest (5).mp3","vj_lostb3/invest (6).mp3"}
ENT.BSoundTbl_OnKilledEnemy = {"vj_lostb3/kill (1).mp3","vj_lostb3/kill (2).mp3","vj_lostb3/kill (3).mp3","vj_lostb3/kill (4).mp3","vj_lostb3/kill (5).mp3","vj_lostb3/kill (6).mp3"}
ENT.BSoundTbl_LostEnemy = {"vj_lostb3/losthim (1).mp3","vj_lostb3/losthim (2).mp3","vj_lostb3/losthim (3).mp3"}
ENT.BSoundTbl_AllyDeath = {"vj_lostb3/mandown (1).mp3","vj_lostb3/mandown (2).mp3"}
ENT.BSoundTbl_UnFollowPlayer = {"vj_lostb3/nofollow (1).mp3","vj_lostb3/nofollow (2).mp3","vj_lostb3/nofollow (3).mp3","vj_lostb3/nofollow (4).mp3"}
ENT.BSoundTbl_Pain = {"vj_lostb3/pain (1).mp3","vj_lostb3/pain (2).mp3","vj_lostb3/pain (3).mp3","vj_lostb3/pain (4).mp3","vj_lostb3/pain (5).mp3","vj_lostb3/pain (6).mp3","vj_lostb3/pain (7).mp3","vj_lostb3/pain (8).mp3"}
ENT.BSoundTbl_DamageByPlayer = {"vj_lostb3/playerdamage (1).mp3","vj_lostb3/playerdamage (2).mp3","vj_lostb3/playerdamage (3).mp3","vj_lostb3/playerdamage (4).mp3","vj_lostb3/playerdamage (5).mp3","vj_lostb3/playerdamage (6).mp3"}
ENT.BSoundTbl_WeaponReload = {"vj_lostb3/reload (1).mp3","vj_lostb3/reload (2).mp3","vj_lostb3/reload (3).mp3","vj_lostb3/reload (4).mp3","vj_lostb3/reload (5).mp3","vj_lostb3/reload (6).mp3"}
ENT.BSoundTbl_Suppressing = {"vj_lostb3/suppress (1).mp3","vj_lostb3/suppress (2).mp3","vj_lostb3/suppress (3).mp3","vj_lostb3/suppress (4).mp3","vj_lostb3/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,5))
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(2,math.random(2,4))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,3))
	self:SetBodygroup(5,math.random(0,2))
	self:SetBodygroup(6,math.random(2,2))
	if(math.random(0,1) == 0) then
		self.Race = "B"
	
		self.SoundTbl_Idle = self.BSoundTbl_Idle
		self.SoundTbl_MoveOutOfPlayersWay = self.BSoundTbl_MoveOutOfPlayersWay
		self.SoundTbl_LostEnemy = self.BSoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.BSoundTbl_AllyDeath
		self.SoundTbl_UnFollowPlayer = self.BSoundTbl_UnFollowPlayer
		self.SoundTbl_FollowPlayer = self.BSoundTbl_FollowPlayer
		self.SoundTbl_CombatIdle = self.BSoundTbl_CombatIdle
		self.SoundTbl_MedicBeforeHeal = self.BSoundTbl_MedicBeforeHeal
		self.SoundTbl_MedicReceiveHeal = self.BSoundTbl_MedicReceiveHeal
		self.SoundTbl_OnPlayerSight = self.BSoundTbl_OnPlayerSight
		self.SoundTbl_Alert = self.BSoundTbl_Alert
		self.SoundTbl_CallForHelp = self.BSoundTbl_CallForHelp
		self.SoundTbl_BecomeEnemyToPlayer = self.BSoundTbl_BecomeEnemyToPlayer
		self.SoundTbl_Suppressing = self.BSoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.BSoundTbl_WeaponReload
		self.SoundTbl_BeforeMeleeAttack = self.BSoundTbl_BeforeMeleeAttack
		self.SoundTbl_GrenadeAttack = self.BSoundTbl_GrenadeAttack
		self.SoundTbl_OnGrenadeSight = self.BSoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.BSoundTbl_OnKilledEnemy
		self.SoundTbl_Pain = self.BSoundTbl_Pain
		self.SoundTbl_DamageByPlayer = self.BSoundTbl_DamageByPlayer
		self.SoundTbl_Death = self.BSoundTbl_Death
	else
		self.Race = "W"
	
		self.SoundTbl_Idle = self.WSoundTbl_Idle
		self.SoundTbl_MoveOutOfPlayersWay = self.WSoundTbl_MoveOutOfPlayersWay
		self.SoundTbl_LostEnemy = self.WSoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.WSoundTbl_AllyDeath
		self.SoundTbl_UnFollowPlayer = self.WSoundTbl_UnFollowPlayer
		self.SoundTbl_FollowPlayer = self.WSoundTbl_FollowPlayer
		self.SoundTbl_CombatIdle = self.WSoundTbl_CombatIdle
		self.SoundTbl_MedicBeforeHeal = self.WSoundTbl_MedicBeforeHeal
		self.SoundTbl_MedicReceiveHeal = self.WSoundTbl_MedicReceiveHeal
		self.SoundTbl_OnPlayerSight = self.WSoundTbl_OnPlayerSight
		self.SoundTbl_Alert = self.WSoundTbl_Alert
		self.SoundTbl_CallForHelp = self.WSoundTbl_CallForHelp
		self.SoundTbl_BecomeEnemyToPlayer = self.WSoundTbl_BecomeEnemyToPlayer
		self.SoundTbl_Suppressing = self.WSoundTbl_Suppressing
		self.SoundTbl_WeaponReload = self.WSoundTbl_WeaponReload
		self.SoundTbl_BeforeMeleeAttack = self.WSoundTbl_BeforeMeleeAttack
		self.SoundTbl_GrenadeAttack = self.WSoundTbl_GrenadeAttack
		self.SoundTbl_OnGrenadeSight = self.WSoundTbl_OnGrenadeSight
		self.SoundTbl_OnKilledEnemy = self.WSoundTbl_OnKilledEnemy
		self.SoundTbl_Pain = self.WSoundTbl_Pain
		self.SoundTbl_DamageByPlayer = self.WSoundTbl_DamageByPlayer
		self.SoundTbl_Death = self.WSoundTbl_Death
	end
	end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/