AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 60 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_CHINA"} -- NPCs with the same class with be allied to each other 
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
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}

ENT.B1SoundTbl_Alert = {"vj_ivruciv1/alert (1).mp3","vj_ivruciv1/alert (2).mp3","vj_ivruciv1/alert (3).mp3","vj_ivruciv1/alert (4).mp3","vj_ivruciv1/alert (5).mp3","vj_ivruciv1/alert (6).mp3"}
ENT.B1SoundTbl_BecomeEnemyToPlayer = {"vj_ivruciv1/becomehos (1).mp3","vj_ivruciv1/becomehos (2).mp3","vj_ivruciv1/becomehos (3).mp3"}
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_ivruciv1/bump (1).mp3","vj_ivruciv1/bump (2).mp3","vj_ivruciv1/bump (3).mp3","vj_ivruciv1/bump (4).mp3","vj_ivruciv1/bump (5).mp3","vj_ivruciv1/bump (6).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_ivruciv1/chat (1).mp3","vj_ivruciv1/chat (2).mp3","vj_ivruciv1/chat (3).mp3","vj_ivruciv1/chat (4).mp3","vj_ivruciv1/chat (5).mp3","vj_ivruciv1/chat (6).mp3","vj_ivruciv1/chat (7).mp3","vj_ivruciv1/chat (8).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_ivruciv1/combat (1).mp3","vj_ivruciv1/combat (2).mp3","vj_ivruciv1/combat (3).mp3","vj_ivruciv1/combat (4).mp3","vj_ivruciv1/combat (5).mp3","vj_ivruciv1/combat (6).mp3","vj_ivruciv1/combat (7).mp3","vj_ivruciv1/combat (8).mp3"}
ENT.B1SoundTbl_Death = {"death/death (1).mp3","death/death (2).mp3","death/death (3).mp3","death/death (4).mp3","death/death (5).mp3","death/death (6).mp3","death/death (7).mp3","death/death (8).mp3","death/death (9).mp3","death/death (10).mp3","death/death (11).mp3","death/death (12).mp3","death/death (13).mp3","death/death (14).mp3","death/death (15).mp3","death/death (16).mp3","death/death (18).mp3","death/death (17).mp3","death/death (19).mp3","death/death (20).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_ivruciv1/follow (1).mp3","vj_ivruciv1/follow (2).mp3","vj_ivruciv1/follow (3).mp3","vj_ivruciv1/follow (4).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_ivruciv1/gotmedic (1).mp3","vj_ivruciv1/gotmedic (2).mp3","vj_ivruciv1/gotmedic (3).mp3",}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_ivruciv1/heal (1).mp3"} 
ENT.B1SoundTbl_OnGrenadeSight = {"vj_ivruciv1/hidegrenade (1).mp3","vj_ivruciv1/hidegrenade (3).mp3","vj_ivruciv1/hidegrenade (2).mp3","vj_ivruciv1/hidegrenade (4).mp3","vj_ivruciv1/hidegrenade (5).mp3","vj_ivruciv1/hidegrenade (6).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_ivruciv1/kill (1).mp3","vj_ivruciv1/kill (2).mp3","vj_ivruciv1/kill (3).mp3","vj_ivruciv1/kill (4).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_ivruciv1/losthim (1).mp3","vj_ivruciv1/losthim (2).mp3","vj_ivruciv1/losthim (3).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_ivruciv1/nofollow (1).mp3","vj_ivruciv1/nofollow (2).mp3","vj_ivruciv1/nofollow (3).mp3","vj_ivruciv1/nofollow (4).mp3"}
ENT.B1SoundTbl_Pain = {"vj_ivruciv1/pain (1).mp3","vj_ivruciv1/pain (2).mp3","vj_ivruciv1/pain (3).mp3","vj_ivruciv1/pain (4).mp3","vj_ivruciv1/pain (5).mp3","vj_ivruciv1/pain (6).mp3","vj_ivruciv1/pain (7).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_ivruciv1/playerdamage (1).mp3","vj_ivruciv1/playerdamage (2).mp3","vj_ivruciv1/playerdamage (3).mp3","vj_ivruciv1/playerdamage (4).mp3","vj_ivruciv1/playerdamage (5).mp3","vj_ivruciv1/playerdamage (6).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_ivruciv1/reload (1).mp3","vj_ivruciv1/reload (2).mp3","vj_ivruciv1/reload (3).mp3","vj_ivruciv1/reload (4).mp3","vj_ivruciv1/reload (5).mp3","vj_ivruciv1/reload (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_ivruciv1/suppress (1).mp3","vj_ivruciv1/suppress (2).mp3","vj_ivruciv1/suppress (3).mp3","vj_ivruciv1/suppress (4).mp3","vj_ivruciv1/suppress (5).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_ivruciv1/mandown (1).mp3","vj_ivruciv1/mandown (2).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(3,math.random(0,0))   
	self:SetBodygroup(4,math.random(0,2))   
	self:SetBodygroup(5,math.random(0,1))   
	self:SetBodygroup(6,math.random(0,0))   
   local suit = math.random(1,6)
        if suit == 1 then
self:SetBodygroup(1,0)
self:SetBodygroup(2,0)	
	elseif suit == 2 then
self:SetBodygroup(1,1)
self:SetBodygroup(2,0)	
    elseif suit == 3 then
self:SetBodygroup(1,2)
self:SetBodygroup(2,1)	
    elseif suit == 4 then
self:SetBodygroup(1,3)
self:SetBodygroup(2,1)	
    elseif suit == 5 then
self:SetBodygroup(1,4)
self:SetBodygroup(2,2)	
    elseif suit == 6 then
self:SetBodygroup(1,5)
self:SetBodygroup(2,3)	
       end   
	   end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,1)
	if randomvoice == 1 then
		self.Race = "B1"
	
        self.SoundTbl_Death = self.B1SoundTbl_Death
		self.SoundTbl_Idle = self.B1SoundTbl_Idle
		self.SoundTbl_LostEnemy = self.B1SoundTbl_LostEnemy
		self.SoundTbl_CombatIdle = self.B1SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B1SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/sencomie/nbp_02.mdl","models/sentry/sentrycag/sencomie/nbp_04.mdl","models/sentry/sentrycag/sencomie/nbp_07.mdl","models/sentry/sentrycag/sencomie/nbp_09.mdl"}
	else
	if randomvoice == 2 then
		self.Race = "B2"
	
		self.SoundTbl_Idle = self.B2SoundTbl_Idle
		self.SoundTbl_IdleDialogueAnswer = self.B2SoundTbl_IdleDialogueAnswer
		self.SoundTbl_LostEnemy = self.B2SoundTbl_LostEnemy
		self.SoundTbl_AllyDeath = self.B2SoundTbl_AllyDeath
		self.SoundTbl_CombatIdle = self.B2SoundTbl_CombatIdle
        self.SoundTbl_Pain = self.B2SoundTbl_Pain
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
		self.Model = {"models/sentry/sentrycag/sencomie/male_02.mdl","models/sentry/sentrycag/sencomie/male_04.mdl"}
		end
		if randomvoice == 3 then
		self.Race = "B3"
	
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
		self.Model = {"models/sentry/sentrycag/sencomie/male_03.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/