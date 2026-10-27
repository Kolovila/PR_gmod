AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/senpirate/le/sentrysenpiratemale1.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.BlackModels = {"models/sentry/sentrycag/senpirate/le/sentrysenpiratemale1.mdl"}
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_PIRATE"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"MeleeAttack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 15
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.WSoundTbl_Alert = {"vj_spirat/alert (1).mp3","vj_spirat/alert (2).mp3","vj_spirat/alert (3).mp3","vj_spirat/alert (4).mp3","vj_spirat/alert (5).mp3","vj_spirat/alert (6).mp3"}
ENT.WSoundTbl_BecomeEnemyToPlayer = {"vj_spirat/becomehos (1).mp3","vj_spirat/becomehos (2).mp3","vj_spirat/becomehos (3).mp3"}
ENT.WSoundTbl_MoveOutOfPlayersWay = {"vj_spirat/bump (1).mp3","vj_spirat/bump (2).mp3","vj_spirat/bump (3).mp3","vj_spirat/bump (4).mp3","vj_spirat/bump (5).mp3","vj_spirat/bump (6).mp3"} 
ENT.WSoundTbl_Idle = {"vj_spirat/chat (1).mp3","vj_spirat/chat (2).mp3","vj_spirat/chat (3).mp3","vj_spirat/chat (4).mp3","vj_spirat/chat (5).mp3","vj_spirat/chat (6).mp3","vj_spirat/chat (7).mp3","vj_spirat/chat (8).mp3"}
ENT.WSoundTbl_CombatIdle = {"vj_spirat/combat (1).mp3","vj_spirat/combat (2).mp3","vj_spirat/combat (3).mp3","vj_spirat/combat (4).mp3","vj_spirat/combat (5).mp3","vj_spirat/combat (6).mp3","vj_spirat/combat (7).mp3","vj_spirat/combat (8).mp3"}
ENT.WSoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3"}
ENT.WSoundTbl_FollowPlayer = {"vj_spirat/follow (1).mp3","vj_spirat/follow (2).mp3","vj_spirat/follow (3).mp3","vj_spirat/follow (4).mp3","vj_spirat/follow (5).mp3","vj_spirat/follow (6).mp3"}
ENT.WSoundTbl_MedicReceiveHeal = {"vj_spirat/gotmedic (1).mp3"}
ENT.WSoundTbl_MedicBeforeHeal = {"vj_spirat/heal (1).mp3","vj_spirat/heal (2).mp3","vj_spirat/heal (3).mp3","vj_spirat/heal (4).mp3"} 
ENT.WSoundTbl_OnPlayerSight = {"vj_spirat/hi (1).mp3","vj_spirat/hi (2).mp3","vj_spirat/hi (3).mp3","vj_spirat/hi (4).mp3"}
ENT.WSoundTbl_OnGrenadeSight = {"vj_spirat/hidegrenade (1).mp3","vj_spirat/hidegrenade (3).mp3","vj_spirat/hidegrenade (2).mp3","vj_spirat/hidegrenade (4).mp3","vj_spirat/hidegrenade (5).mp3","vj_spirat/hidegrenade (6).mp3"}
ENT.WSoundTbl_OnKilledEnemy = {"vj_spirat/kill (1).mp3","vj_spirat/kill (2).mp3","vj_spirat/kill (3).mp3","vj_spirat/kill (5).mp3"}
ENT.WSoundTbl_LostEnemy = {"vj_spirat/losthim (1).mp3","vj_spirat/losthim (2).mp3","vj_spirat/losthim (3).mp3"}
ENT.WSoundTbl_AllyDeath = {"vj_spirat/mandown (1).mp3","vj_spirat/mandown (2).mp3"}
ENT.WSoundTbl_UnFollowPlayer = {"vj_spirat/nofollow (1).mp3","vj_spirat/nofollow (2).mp3","vj_spirat/nofollow (3).mp3","vj_spirat/nofollow (4).mp3"}
ENT.WSoundTbl_Pain = {"vj_spirat/pain (1).mp3","vj_spirat/pain (2).mp3","vj_spirat/pain (3).mp3","vj_spirat/pain (4).mp3","vj_spirat/pain (5).mp3","vj_spirat/pain (6).mp3","vj_spirat/pain (7).mp3","vj_spirat/pain (8).mp3"}
ENT.WSoundTbl_DamageByPlayer = {"vj_spirat/playerdamage (1).mp3","vj_spirat/playerdamage (2).mp3","vj_spirat/playerdamage (3).mp3","vj_spirat/playerdamage (4).mp3","vj_spirat/playerdamage (5).mp3","vj_spirat/playerdamage (6).mp3"}
ENT.WSoundTbl_WeaponReload = {"vj_spirat/reload (1).mp3","vj_spirat/reload (2).mp3","vj_spirat/reload (3).mp3","vj_spirat/reload (4).mp3","vj_spirat/reload (5).mp3","vj_spirat/reload (6).mp3"}
ENT.WSoundTbl_Suppressing = {"vj_spirat/suppress (1).mp3","vj_spirat/suppress (2).mp3","vj_spirat/suppress (3).mp3","vj_spirat/suppress (4).mp3","vj_spirat/suppress (5).mp3"}

ENT.BSoundTbl_Alert = {"vj_armbo2/alert (2).mp3","vj_armbo2/alert (3).mp3","vj_armbo2/alert (5).mp3","vj_armbo2/alert (6).mp3"}
ENT.BSoundTbl_BecomeEnemyToPlayer = {"vj_armbo2/becomehos (1).mp3","vj_armbo2/becomehos (3).mp3","vj_armbo2/becomehos (4).mp3","vj_armbo2/becomehos (5).mp3","vj_armbo2/becomehos (6).mp3"}
ENT.BSoundTbl_MoveOutOfPlayersWay = {"vj_armbo2/bump (1).mp3","vj_armbo2/bump (2).mp3","vj_armbo2/bump (3).mp3","vj_armbo2/bump (4).mp3","vj_armbo2/bump (5).mp3"} 
ENT.BSoundTbl_Idle = {"vj_armbo2/chat (1).mp3","vj_armbo2/chat (2).mp3","vj_armbo2/chat (3).mp3","vj_armbo2/chat (5).mp3","vj_armbo2/chat (6).mp3","vj_armbo2/chat (8).mp3"}
ENT.BSoundTbl_CombatIdle = {"vj_armbo2/combat (1).mp3","vj_armbo2/combat (2).mp3","vj_armbo2/combat (3).mp3","vj_armbo2/combat (4).mp3","vj_armbo2/combat (5).mp3","vj_armbo2/combat (6).mp3","vj_armbo2/combat (7).mp3","vj_armbo2/combat (8).mp3","vj_armbo2/combat (9).mp3","vj_armbo2/combat (10).mp3"}
ENT.BSoundTbl_Death = {"death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}
ENT.BSoundTbl_FollowPlayer = {"vj_armbo2/follow (1).mp3","vj_armbo2/follow (2).mp3","vj_armbo2/follow (3).mp3","vj_armbo2/follow (4).mp3","vj_armbo2/follow (5).mp3","vj_armbo2/follow (6).mp3"}
ENT.BSoundTbl_MedicReceiveHeal = {"vj_armbo2/gotmedic (1).mp3"}
ENT.BSoundTbl_MedicBeforeHeal = {"vj_armbo2/heal (1).mp3","vj_armbo2/heal (2).mp3","vj_armbo2/heal (3).mp3","vj_armbo2/heal (4).mp3"} 
ENT.BSoundTbl_OnPlayerSight = {"vj_armbo2/hi (1).mp3",}
ENT.BSoundTbl_OnGrenadeSight = {"vj_armbo2/hidegrenade (1).mp3","vj_armbo2/hidegrenade (3).mp3","vj_armbo2/hidegrenade (2).mp3","vj_armbo2/hidegrenade (4).mp3","vj_armbo2/hidegrenade (5).mp3","vj_armbo2/hidegrenade (6).mp3"}
ENT.BSoundTbl_Investigate = {"vj_armbo2/invest (1).mp3","vj_armbo2/invest (2).mp3","vj_armbo2/invest (3).mp3","vj_armbo2/invest (4).mp3","vj_armbo2/invest (5).mp3","vj_armbo2/invest (6).mp3"}
ENT.BSoundTbl_OnKilledEnemy = {"vj_armbo2/kill (1).mp3","vj_armbo2/kill (3).mp3","vj_armbo2/kill (4).mp3","vj_armbo2/kill (6).mp3"}
ENT.BSoundTbl_LostEnemy = {"vj_armbo2/losthim (1).mp3","vj_armbo2/losthim (2).mp3","vj_armbo2/losthim (3).mp3"}
ENT.BSoundTbl_AllyDeath = {"vj_armbo2/mandown (1).mp3","vj_armbo2/mandown (2).mp3"}
ENT.BSoundTbl_UnFollowPlayer = {"vj_armbo2/nofollow (1).mp3","vj_armbo2/nofollow (2).mp3","vj_armbo2/nofollow (3).mp3","vj_armbo2/nofollow (4).mp3"}
ENT.BSoundTbl_Pain = {"vj_armbo2/pain (1).mp3","vj_armbo2/pain (2).mp3","vj_armbo2/pain (3).mp3","vj_armbo2/pain (4).mp3","vj_armbo2/pain (5).mp3","vj_armbo2/pain (6).mp3","vj_armbo2/pain (7).mp3","vj_armbo2/pain (8).mp3"}
ENT.BSoundTbl_DamageByPlayer = {"vj_armbo2/playerdamage (1).mp3","vj_armbo2/playerdamage (2).mp3","vj_armbo2/playerdamage (3).mp3","vj_armbo2/playerdamage (4).mp3","vj_armbo2/playerdamage (5).mp3","vj_armbo2/playerdamage (6).mp3"}
ENT.BSoundTbl_WeaponReload = {"vj_armbo2/reload (1).mp3","vj_armbo2/reload (2).mp3","vj_armbo2/reload (3).mp3","vj_armbo2/reload (4).mp3","vj_armbo2/reload (5).mp3","vj_armbo2/reload (6).mp3"}
ENT.BSoundTbl_Suppressing = {"vj_armbo2/suppress (1).mp3","vj_armbo2/suppress (2).mp3","vj_armbo2/suppress (3).mp3","vj_armbo2/suppress (4).mp3","vj_armbo2/suppress (5).mp3","vj_armbo2/suppress (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,5))
	self:SetBodygroup(1,math.random(0,0))
	self:SetBodygroup(2,math.random(0,1))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,3))
	self:SetBodygroup(5,math.random(0,2))
	self:SetBodygroup(6,math.random(0,1))
	if math.random(1,10) == 1 then self.IsMedicSNPC = true end
	if(math.random(1,1) == 0) then
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