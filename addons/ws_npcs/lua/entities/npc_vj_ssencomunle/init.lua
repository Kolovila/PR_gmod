AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_CHINA_FRIENDLY","CLASS_RUSSIAN_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 1 -- How many times does the player have to hit the SNPC for it to become enemy 
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
ENT.SoundTbl_Death = {"death/bdeath (1).mp3","death/bdeath (2).mp3","death/bdeath (3).mp3","death/bdeath (4).mp3","death/bdeath (5).mp3","death/bdeath (6).mp3","death/bdeath (7).mp3","death/bdeath (8).mp3","death/bdeath (9).mp3","death/bdeath (10).mp3","death/wdeath (1).mp3","death/wdeath (2).mp3","death/wdeath (3).mp3","death/wdeath (4).mp3","death/wdeath (5).mp3","death/wdeath (6).mp3","death/wdeath (7).mp3","death/wdeath (8).mp3","death/wdeath (9).mp3","death/wdeath (10).mp3","death/wdeath (11).mp3","death/wdeath (12).mp3"}

ENT.B2SoundTbl_Alert = {"vj_sencomil/alert (1).mp3","vj_sencomil/alert (2).mp3","vj_sencomil/alert (3).mp3","vj_sencomil/alert (4).mp3","vj_sencomil/alert (5).mp3"}
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_sencomil/bump (1).mp3","vj_sencomil/bump (2).mp3","vj_sencomil/bump (3).mp3","vj_sencomil/bump (4).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_sencomil/chat (1).mp3","vj_sencomil/chat (2).mp3","vj_sencomil/chat (3).mp3","vj_sencomil/chat (4).mp3","vj_sencomil/chat (5).mp3","vj_sencomil/chat (6).mp3","vj_sencomil/chat (7).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_sencomil/combat (1).mp3","vj_sencomil/combat (2).mp3","vj_sencomil/combat (3).mp3","vj_sencomil/combat (4).mp3","vj_sencomil/combat (5).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_sencomil/follow (1).mp3","vj_sencomil/follow (2).mp3","vj_sencomil/follow (3).mp3","vj_sencomil/follow (4).mp3","vj_sencomil/follow (5).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_sencomil/gotmedic (1).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_sencomil/heal (1).mp3","vj_sencomil/heal (2).mp3"} 
ENT.B2SoundTbl_OnPlayerSight = {"vj_sencomil/hi (1).mp3","vj_sencomil/hi (2).mp3","vj_sencomil/hi (3).mp3","vj_sencomil/hi (4).mp3","vj_sencomil/hi (5).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_sencomil/hidegrenade (1).mp3","vj_sencomil/hidegrenade (3).mp3","vj_sencomil/hidegrenade (2).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_sencomil/kill (1).mp3","vj_sencomil/kill (2).mp3","vj_sencomil/kill (3).mp3","vj_sencomil/kill (4).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_sencomil/losthim (1).mp3","vj_sencomil/losthim (2).mp3","vj_sencomil/losthim (3).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_sencomil/mandown (1).mp3","vj_sencomil/mandown (2).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_sencomil/nofollow (1).mp3","vj_sencomil/nofollow (2).mp3","vj_sencomil/nofollow (3).mp3","vj_sencomil/nofollow (4).mp3","vj_sencomil/nofollow (5).mp3"}
ENT.B2SoundTbl_Pain = {"vj_sencomil/pain (1).mp3","vj_sencomil/pain (2).mp3","vj_sencomil/pain (3).mp3","vj_sencomil/pain (4).mp3","vj_sencomil/pain (5).mp3","vj_sencomil/pain (6).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_sencomil/playerdamage (1).mp3","vj_sencomil/playerdamage (2).mp3"}

ENT.B3SoundTbl_Alert = {"vj_sencomib/alert (1).mp3","vj_sencomib/alert (2).mp3","vj_sencomib/alert (3).mp3","vj_sencomib/alert (4).mp3"}
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_sencomib/bump (1).mp3","vj_sencomib/bump (2).mp3","vj_sencomib/bump (3).mp3","vj_sencomib/bump (4).mp3"} 
ENT.B3SoundTbl_CombatIdle = {"vj_sencomib/combat (1).mp3","vj_sencomib/combat (2).mp3","vj_sencomib/combat (3).mp3","vj_sencomib/combat (4).mp3","vj_sencomib/combat (5).mp3"}
ENT.B3SoundTbl_FollowPlayer = {"vj_sencomib/follow (1).mp3","vj_sencomib/follow (2).mp3"}
ENT.B3SoundTbl_OnPlayerSight = {"vj_sencomib/hi (1).mp3","vj_sencomib/hi (2).mp3"}
ENT.B3SoundTbl_OnGrenadeSight = {"vj_sencomib/hidegrenade (1).mp3","vj_sencomib/hidegrenade (3).mp3","vj_sencomib/hidegrenade (2).mp3"}
ENT.B3SoundTbl_OnKilledEnemy = {"vj_sencomib/kill (1).mp3","vj_sencomib/kill (2).mp3","vj_sencomib/kill (3).mp3","vj_sencomib/kill (4).mp3"}
ENT.B3SoundTbl_LostEnemy = {"vj_sencomib/losthim (1).mp3","vj_sencomib/losthim (2).mp3","vj_sencomib/losthim (3).mp3"}
ENT.B3SoundTbl_AllyDeath = {"vj_sencomib/mandown (1).mp3","vj_sencomib/mandown (2).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_sencomib/nofollow (1).mp3","vj_sencomib/nofollow (2).mp3"}
ENT.B3SoundTbl_Pain = {"vj_sencomib/pain (1).mp3","vj_sencomib/pain (2).mp3","vj_sencomib/pain (3).mp3","vj_sencomib/pain (4).mp3","vj_sencomib/pain (5).mp3","vj_sencomib/pain (6).mp3","vj_sencomib/pain (7).mp3","vj_sencomib/pain (8).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_sencomib/playerdamage (1).mp3","vj_sencomib/playerdamage (2).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_sencomib/suppress (1).mp3","vj_sencomib/suppress (2).mp3","vj_sencomib/suppress (3).mp3","vj_sencomib/suppress (4).mp3","vj_sencomib/suppress (5).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(3,math.random(0,0))   
	self:SetBodygroup(4,math.random(0,0))   
	self:SetBodygroup(5,math.random(1,1))   
	self:SetBodygroup(6,math.random(0,1))   
	if math.random(1,1) == 1 then self.IsMedicSNPC = true end
   local suit = math.random(1,3)
        if suit == 1 then
self:SetBodygroup(1,7)
self:SetBodygroup(2,4)	
	elseif suit == 2 then
self:SetBodygroup(1,5)
self:SetBodygroup(2,5)	
    elseif suit == 3 then
self:SetBodygroup(1,6)
self:SetBodygroup(2,4)	
       end   
	   end
	   
function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(2,3)
	if randomvoice == 1 then
		self.Race = "B1"
	
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
		self.Model = {"models/sentry/sentrycag/sencomie/male_02.mdl","models/sentry/sentrycag/sencomie/male_04.mdl"}
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
		self.Model = {"models/sentry/sentrycag/sencomie/male_06.mdl","models/sentry/sentrycag/sencomie/male_08.mdl"}
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
		self.Model = {"models/sentry/sentrycag/sencomie/male_01.mdl"}
		end
		end
		end
		
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/