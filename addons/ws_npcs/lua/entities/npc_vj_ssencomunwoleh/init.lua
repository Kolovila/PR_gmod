AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_CHINA","CLASS_RUSSIAN"} -- NPCs with the same class with be allied to each other 
	-- Common Classes Combine = CLASS_COMBINE  Zombie = CLASS_ZOMBIE  Antlions = CLASS_ANTLION  Xen = CLASS_XEN  Player Friendly = CLASS_PLAYER_ALLY 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"swing"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 10
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle and etc.)
ENT.BloodParticle = "blood_impact_red_01" -- Particle that the SNPC spawns when it's damaged
ENT.BloodDecal = "Blood" -- (Red = Blood) (Yellow Blood = YellowBlood) | Leave blank for none
ENT.BloodDecalRate = 500 -- The more the number is the more chance is has to spawn | 1000 is a good number for yellow blood, for red blood 500 is good | Make the number smaller if you are using big decal like Antlion Splat, Which 5 or 10 is a really good number for this stuff
ENT.AnimTbl_IdleStand = {"LineIdle03"}
ENT.CanCrouchOnWeaponAttack = false
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.B2SoundTbl_Alert = {"vj_vhipf41/alert (1).mp3","vj_vhipf41/alert (2).mp3","vj_vhipf41/alert (3).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_vhipf41/bump (1).mp3","vj_vhipf41/bump (2).mp3","vj_vhipf41/bump (3).mp3","vj_vhipf41/bump (4).mp3","vj_vhipf41/bump (5).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_vhipf41/chat (1).mp3","vj_vhipf41/chat (2).mp3","vj_vhipf41/chat (3).mp3","vj_vhipf41/chat (4).mp3","vj_vhipf41/chat (5).mp3","vj_vhipf41/chat (6).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_vhipf41/combat (1).mp3","vj_vhipf41/combat (2).mp3","vj_vhipf41/combat (3).mp3","vj_vhipf41/combat (4).mp3"}
ENT.B2SoundTbl_Death = {"death/wfdeath (1).mp3","death/wfdeath (2).mp3","death/wfdeath (3).mp3","death/wfdeath (4).mp3","death/wfdeath (5).mp3","death/wfdeath (6).mp3","death/wfdeath (7).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_vhipf41/follow (1).mp3","vj_vhipf41/follow (2).mp3","vj_vhipf41/follow (3).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_vhipf41/gotmedic (1).mp3"}
ENT.B2SoundTbl_OnPlayerSight = {"vj_vhipf41/hi (1).mp3","vj_vhipf41/hi (2).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_vhipf41/kill (1).mp3","vj_vhipf41/kill (2).mp3","vj_vhipf41/kill (3).mp3","vj_vhipf41/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_vhipf41/losthim (1).mp3","vj_vhipf41/losthim (2).mp3","vj_vhipf41/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_vhipf41/mandown (1).mp3","vj_vhipf41/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_vhipf41/nofollow (1).mp3","vj_vhipf41/nofollow (2).mp3","vj_vhipf41/nofollow (3).mp3","vj_vhipf41/nofollow (4).mp3"}
ENT.B2SoundTbl_Pain = {"vj_vhipf41/pain (1).mp3","vj_vhipf41/pain (2).mp3","vj_vhipf41/pain (3).mp3","vj_vhipf41/pain (4).mp3","vj_vhipf41/pain (5).mp3","vj_vhipf41/pain (6).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_vhipf41/playerdamage (1).mp3","vj_vhipf41/playerdamage (2).mp3","vj_vhipf41/playerdamage (3).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_vhipf41/suppress (1).mp3","vj_vhipf41/suppress (2).mp3","vj_vhipf41/suppress (3).mp3","vj_vhipf41/suppress (4).mp3"}


function ENT:CustomInitialize()
	self:SetSkin(math.random(0,5))
	self:SetBodygroup(3,math.random(0,0))
	self:SetBodygroup(4,math.random(1,1))
	self:SetBodygroup(5,math.random(0,1))
   local suit = math.random(1,3)
        if suit == 1 then
self:SetBodygroup(1,5)
self:SetBodygroup(2,3)	
	elseif suit == 2 then
self:SetBodygroup(1,6)
self:SetBodygroup(2,4)	
    elseif suit == 3 then
self:SetBodygroup(1,7)
self:SetBodygroup(2,3)	
       end   
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
		self.Model = {"models/sentry/sentrycag/sensmuggler/female_terrorist_1mp.mdl","models/sentry/sentrycag/northern/female_08.mdl"}
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
		self.Model = {"models/sentry/sentrycag/sencomie/female_02.mdl","models/sentry/sentrycag/sencomie/female_06.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/