AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 95 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
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
ENT.AnimTbl_MeleeAttack = {"pushplayer"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 30
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"buttonfront"}
ENT.HasGrenadeAttack = false
ENT.AnimTbl_GrenadeAttack = {"grenThrow"} -- Grenade Attack Animations
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.B1SoundTbl_Alert = {"vj_ro2rus1/alertcom (1).mp3","vj_ro2rus1/alertcom (2).mp3","vj_ro2rus1/alertcom (3).mp3","vj_ro2rus1/alertcom (4).mp3","vj_ro2rus1/alertcom (5).mp3","vj_ro2rus1/alertcom (6).mp3"} 
ENT.B1SoundTbl_MoveOutOfPlayersWay = {"vj_ro2rus1/bump (1).mp3","vj_ro2rus1/bump (2).mp3","vj_ro2rus1/bump (3).mp3"} 
ENT.B1SoundTbl_Idle = {"vj_ro2rus1/chatcom (1).mp3","vj_ro2rus1/chatcom (2).mp3","vj_ro2rus1/chatcom (3).mp3","vj_ro2rus1/chatcom (4).mp3","vj_ro2rus1/chatcom (5).mp3","vj_ro2rus1/chatcom (6).mp3","vj_ro2rus1/chatcom (7).mp3","vj_ro2rus1/chatcom (8).mp3","vj_ro2rus1/chatcom (9).mp3","vj_ro2rus1/chatcom (10).mp3"}
ENT.B1SoundTbl_CombatIdle = {"vj_ro2rus1/combatcom (1).mp3","vj_ro2rus1/combatcom (2).mp3","vj_ro2rus1/combatcom (3).mp3","vj_ro2rus1/combatcom (4).mp3","vj_ro2rus1/combatcom (5).mp3","vj_ro2rus1/combatcom (6).mp3","vj_ro2rus1/combatcom (7).mp3","vj_ro2rus1/combatcom (8).mp3","vj_ro2rus1/combatcom (9).mp3","vj_ro2rus1/combatcom (10).mp3"}
ENT.B1SoundTbl_Death = {"vj_ro2rus1/death (1).mp3","vj_ro2rus1/death (2).mp3","vj_ro2rus1/death (3).mp3","vj_ro2rus1/death (4).mp3","vj_ro2rus1/death (5).mp3","vj_ro2rus1/death (6).mp3","vj_ro2rus1/death (7).mp3","vj_ro2rus1/death (8).mp3"}
ENT.B1SoundTbl_FollowPlayer = {"vj_ro2rus1/follow (1).mp3","vj_ro2rus1/follow (2).mp3","vj_ro2rus1/follow (3).mp3","vj_ro2rus1/follow (4).mp3","vj_ro2rus1/follow (5).mp3","vj_ro2rus1/follow (6).mp3"}
ENT.B1SoundTbl_MedicReceiveHeal = {"vj_ro2rus1/gotmedic (1).mp3","vj_ro2rus1/gotmedic (2).mp3"}
ENT.B1SoundTbl_GrenadeAttack = {"vj_ro2rus1/grenade (1).mp3","vj_ro2rus1/grenade (2).mp3","vj_ro2rus1/grenade (3).mp3"}
ENT.B1SoundTbl_MedicBeforeHeal = {"vj_ro2rus1/heal (1).mp3","vj_ro2rus1/heal (2).mp3","vj_ro2rus1/heal (3).mp3"} 
ENT.B1SoundTbl_CallForHelp = {"vj_ro2rus1/help (1).mp3","vj_ro2rus1/help (2).mp3","vj_ro2rus1/help (3).mp3","vj_ro2rus1/help (4).mp3","vj_ro2rus1/help (5).mp3"}
ENT.B1SoundTbl_OnGrenadeSight = {"vj_ro2rus1/hidegrenade (1).mp3","vj_ro2rus1/hidegrenade (2).mp3","vj_ro2rus1/hidegrenade (3).mp3","vj_ro2rus1/hidegrenade (4).mp3","vj_ro2rus1/hidegrenade (5).mp3","vj_ro2rus1/hidegrenade (6).mp3"}
--ENT.B1SoundTbl_IdleDialogue = {"vj_ro2rus1/idle (1).mp3","vj_ro2rus1/idle (2).mp3","vj_ro2rus1/idle (3).mp3","vj_ro2rus1/idle (4).mp3","vj_ro2rus1/idle (5).mp3","vj_ro2rus1/idle (6).mp3","vj_ro2rus1/idle (7).mp3","vj_ro2rus1/idle (8).mp3"}
ENT.B1SoundTbl_Investigate = {"vj_ro2rus1/invest (1).mp3","vj_ro2rus1/invest (2).mp3","vj_ro2rus1/invest (3).mp3","vj_ro2rus1/invest (4).mp3","vj_ro2rus1/invest (5).mp3"}
ENT.B1SoundTbl_OnKilledEnemy = {"vj_ro2rus1/kill (1).mp3","vj_ro2rus1/kill (2).mp3","vj_ro2rus1/kill (3).mp3","vj_ro2rus1/kill (4).mp3","vj_ro2rus1/kill (5).mp3","vj_ro2rus1/kill (6).mp3"}
ENT.B1SoundTbl_LostEnemy = {"vj_ro2rus1/losthim (1).mp3","vj_ro2rus1/losthim (2).mp3","vj_ro2rus1/losthim (3).mp3","vj_ro2rus1/losthim (4).mp3","vj_ro2rus1/losthim (5).mp3","vj_ro2rus1/losthim (6).mp3"}
ENT.B1SoundTbl_AllyDeath = {"vj_ro2rus1/mandownsar (1).mp3","vj_ro2rus1/mandownsar (2).mp3","vj_ro2rus1/mandownsar (3).mp3","vj_ro2rus1/mandownsar (4).mp3","vj_ro2rus1/mandownsar (5).mp3"}
ENT.B1SoundTbl_UnFollowPlayer = {"vj_ro2rus1/nofollow (1).mp3","vj_ro2rus1/nofollow (2).mp3","vj_ro2rus1/nofollow (3).mp3","vj_ro2rus1/nofollow (4).mp3","vj_ro2rus1/nofollow (5).mp3","vj_ro2rus1/nofollow (6).mp3"}
ENT.B1SoundTbl_Pain = {"vj_ro2rus1/pain (1).mp3","vj_ro2rus1/pain (2).mp3","vj_ro2rus1/pain (3).mp3","vj_ro2rus1/pain (4).mp3","vj_ro2rus1/pain (5).mp3","vj_ro2rus1/pain (6).mp3","vj_ro2rus1/pain (7).mp3","vj_ro2rus1/pain (8).mp3","vj_ro2rus1/pain (9).mp3"}
ENT.B1SoundTbl_DamageByPlayer = {"vj_ro2rus1/playerdamage (1).mp3","vj_ro2rus1/playerdamage (2).mp3","vj_ro2rus1/playerdamage (3).mp3","vj_ro2rus1/playerdamage (4).mp3","vj_ro2rus1/playerdamage (5).mp3","vj_ro2rus1/playerdamage (6).mp3"}
ENT.B1SoundTbl_WeaponReload = {"vj_ro2rus1/reloadsar (1).mp3","vj_ro2rus1/reloadsar (2).mp3","vj_ro2rus1/reloadsar (3).mp3","vj_ro2rus1/reloadsar (4).mp3","vj_ro2rus1/reloadsar (5).mp3","vj_ro2rus1/reloadsar (6).mp3"}
ENT.B1SoundTbl_Suppressing = {"vj_ro2rus1/suppresssar (1).mp3","vj_ro2rus1/suppresssar (2).mp3","vj_ro2rus1/suppresssar (3).mp3","vj_ro2rus1/suppresssar (4).mp3","vj_ro2rus1/suppresssar (5).mp3","vj_ro2rus1/suppresssar (6).mp3"}

ENT.B2SoundTbl_Alert = {"vj_ro2rus2/alertcom (1).mp3","vj_ro2rus2/alertcom (2).mp3","vj_ro2rus2/alertcom (3).mp3","vj_ro2rus2/alertcom (4).mp3","vj_ro2rus2/alertcom (5).mp3","vj_ro2rus2/alertcom (6).mp3"} 
ENT.B2SoundTbl_MoveOutOfPlayersWay = {"vj_ro2rus2/bump (1).mp3","vj_ro2rus2/bump (2).mp3","vj_ro2rus2/bump (3).mp3"} 
ENT.B2SoundTbl_Idle = {"vj_ro2rus2/chatcom (1).mp3","vj_ro2rus2/chatcom (2).mp3","vj_ro2rus2/chatcom (3).mp3","vj_ro2rus2/chatcom (4).mp3","vj_ro2rus2/chatcom (5).mp3","vj_ro2rus2/chatcom (6).mp3","vj_ro2rus2/chatcom (7).mp3","vj_ro2rus2/chatcom (8).mp3","vj_ro2rus2/chatcom (9).mp3","vj_ro2rus2/chatcom (10).mp3"}
ENT.B2SoundTbl_CombatIdle = {"vj_ro2rus2/combatcom (1).mp3","vj_ro2rus2/combatcom (2).mp3","vj_ro2rus2/combatcom (3).mp3","vj_ro2rus2/combatcom (4).mp3","vj_ro2rus2/combatcom (5).mp3","vj_ro2rus2/combatcom (6).mp3","vj_ro2rus2/combatcom (7).mp3","vj_ro2rus2/combatcom (8).mp3","vj_ro2rus2/combatcom (9).mp3","vj_ro2rus2/combatcom (10).mp3"}
ENT.B2SoundTbl_Death = {"vj_ro2rus2/death (1).mp3","vj_ro2rus2/death (2).mp3","vj_ro2rus2/death (3).mp3","vj_ro2rus2/death (4).mp3","vj_ro2rus2/death (5).mp3","vj_ro2rus2/death (6).mp3","vj_ro2rus2/death (7).mp3","vj_ro2rus2/death (8).mp3"}
ENT.B2SoundTbl_FollowPlayer = {"vj_ro2rus2/follow (1).mp3","vj_ro2rus2/follow (2).mp3","vj_ro2rus2/follow (3).mp3","vj_ro2rus2/follow (4).mp3","vj_ro2rus2/follow (5).mp3","vj_ro2rus2/follow (6).mp3"}
ENT.B2SoundTbl_MedicReceiveHeal = {"vj_ro2rus2/gotmedic (1).mp3","vj_ro2rus2/gotmedic (2).mp3"}
ENT.B2SoundTbl_GrenadeAttack = {"vj_ro2rus2/grenade (1).mp3","vj_ro2rus2/grenade (2).mp3","vj_ro2rus2/grenade (3).mp3"}
ENT.B2SoundTbl_MedicBeforeHeal = {"vj_ro2rus2/heal (1).mp3","vj_ro2rus2/heal (2).mp3","vj_ro2rus2/heal (3).mp3"} 
ENT.B2SoundTbl_CallForHelp = {"vj_ro2rus2/help (1).mp3","vj_ro2rus2/help (2).mp3","vj_ro2rus2/help (3).mp3","vj_ro2rus2/help (4).mp3","vj_ro2rus2/help (5).mp3"}
ENT.B2SoundTbl_OnGrenadeSight = {"vj_ro2rus2/hidegrenade (1).mp3","vj_ro2rus2/hidegrenade (2).mp3","vj_ro2rus2/hidegrenade (3).mp3","vj_ro2rus2/hidegrenade (4).mp3","vj_ro2rus2/hidegrenade (5).mp3","vj_ro2rus2/hidegrenade (6).mp3"}
--ENT.B2SoundTbl_IdleDialogue = {"vj_ro2rus2/idle (1).mp3","vj_ro2rus2/idle (2).mp3","vj_ro2rus2/idle (3).mp3","vj_ro2rus2/idle (4).mp3","vj_ro2rus2/idle (5).mp3","vj_ro2rus2/idle (6).mp3","vj_ro2rus2/idle (7).mp3","vj_ro2rus2/idle (8).mp3"}
ENT.B2SoundTbl_Investigate = {"vj_ro2rus2/invest (1).mp3","vj_ro2rus2/invest (2).mp3","vj_ro2rus2/invest (3).mp3","vj_ro2rus2/invest (4).mp3","vj_ro2rus2/invest (5).mp3","vj_ro2rus2/invest (6).mp3"}
ENT.B2SoundTbl_OnKilledEnemy = {"vj_ro2rus2/kill (1).mp3","vj_ro2rus2/kill (2).mp3","vj_ro2rus2/kill (3).mp3","vj_ro2rus2/kill (4).mp3","vj_ro2rus2/kill (5).mp3","vj_ro2rus2/kill (6).mp3"}
ENT.B2SoundTbl_LostEnemy = {"vj_ro2rus2/losthim (1).mp3","vj_ro2rus2/losthim (2).mp3","vj_ro2rus2/losthim (3).mp3","vj_ro2rus2/losthim (4).mp3","vj_ro2rus2/losthim (5).mp3","vj_ro2rus2/losthim (6).mp3"}
ENT.B2SoundTbl_AllyDeath = {"vj_ro2rus2/mandownsar (1).mp3","vj_ro2rus2/mandownsar (2).mp3","vj_ro2rus2/mandownsar (3).mp3","vj_ro2rus2/mandownsar (4).mp3","vj_ro2rus2/mandownsar (5).mp3"}
ENT.B2SoundTbl_UnFollowPlayer = {"vj_ro2rus2/nofollow (1).mp3","vj_ro2rus2/nofollow (2).mp3","vj_ro2rus2/nofollow (3).mp3","vj_ro2rus2/nofollow (4).mp3","vj_ro2rus2/nofollow (5).mp3","vj_ro2rus2/nofollow (6).mp3"}
ENT.B2SoundTbl_Pain = {"vj_ro2rus2/pain (1).mp3","vj_ro2rus2/pain (2).mp3","vj_ro2rus2/pain (3).mp3","vj_ro2rus2/pain (4).mp3","vj_ro2rus2/pain (5).mp3","vj_ro2rus2/pain (6).mp3","vj_ro2rus2/pain (7).mp3","vj_ro2rus2/pain (8).mp3","vj_ro2rus2/pain (9).mp3"}
ENT.B2SoundTbl_DamageByPlayer = {"vj_ro2rus2/playerdamage (1).mp3","vj_ro2rus2/playerdamage (2).mp3","vj_ro2rus2/playerdamage (3).mp3","vj_ro2rus2/playerdamage (4).mp3","vj_ro2rus2/playerdamage (5).mp3","vj_ro2rus2/playerdamage (6).mp3"}
ENT.B2SoundTbl_WeaponReload = {"vj_ro2rus2/reloadsar (1).mp3","vj_ro2rus2/reloadsar (2).mp3","vj_ro2rus2/reloadsar (3).mp3","vj_ro2rus2/reloadsar (4).mp3","vj_ro2rus2/reloadsar (5).mp3","vj_ro2rus2/reloadsar (6).mp3"}
ENT.B2SoundTbl_Suppressing = {"vj_ro2rus2/suppresssar (1).mp3","vj_ro2rus2/suppresssar (2).mp3","vj_ro2rus2/suppresssar (3).mp3","vj_ro2rus2/suppresssar (4).mp3","vj_ro2rus2/suppresssar (5).mp3","vj_ro2rus2/suppresssar (6).mp3"}

ENT.B3SoundTbl_Alert = {"vj_ro2rus3/alertcom (1).mp3","vj_ro2rus3/alertcom (2).mp3","vj_ro2rus3/alertcom (3).mp3","vj_ro2rus3/alertcom (4).mp3","vj_ro2rus3/alertcom (5).mp3","vj_ro2rus3/alertcom (6).mp3"} 
ENT.B3SoundTbl_MoveOutOfPlayersWay = {"vj_ro2rus3/bump (1).mp3","vj_ro2rus3/bump (2).mp3","vj_ro2rus3/bump (3).mp3"} 
ENT.B3SoundTbl_Idle = {"vj_ro2rus3/chatcom (1).mp3","vj_ro2rus3/chatcom (2).mp3","vj_ro2rus3/chatcom (3).mp3","vj_ro2rus3/chatcom (4).mp3","vj_ro2rus3/chatcom (5).mp3","vj_ro2rus3/chatcom (6).mp3","vj_ro2rus3/chatcom (7).mp3","vj_ro2rus3/chatcom (8).mp3","vj_ro2rus3/chatcom (9).mp3","vj_ro2rus3/chatcom (10).mp3"}
ENT.B3SoundTbl_CombatIdle = {"vj_ro2rus3/combatcom (1).mp3","vj_ro2rus3/combatcom (2).mp3","vj_ro2rus3/combatcom (3).mp3","vj_ro2rus3/combatcom (4).mp3","vj_ro2rus3/combatcom (5).mp3","vj_ro2rus3/combatcom (6).mp3","vj_ro2rus3/combatcom (7).mp3","vj_ro2rus3/combatcom (8).mp3","vj_ro2rus3/combatcom (9).mp3","vj_ro2rus3/combatcom (10).mp3"}
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
ENT.B3SoundTbl_AllyDeath = {"vj_ro2rus3/mandownsar (1).mp3","vj_ro2rus3/mandownsar (2).mp3","vj_ro2rus3/mandownsar (3).mp3","vj_ro2rus3/mandownsar (4).mp3","vj_ro2rus3/mandownsar (5).mp3"}
ENT.B3SoundTbl_UnFollowPlayer = {"vj_ro2rus3/nofollow (1).mp3","vj_ro2rus3/nofollow (2).mp3","vj_ro2rus3/nofollow (3).mp3","vj_ro2rus3/nofollow (4).mp3","vj_ro2rus3/nofollow (5).mp3","vj_ro2rus3/nofollow (6).mp3"}
ENT.B3SoundTbl_Pain = {"vj_ro2rus3/pain (1).mp3","vj_ro2rus3/pain (2).mp3","vj_ro2rus3/pain (3).mp3","vj_ro2rus3/pain (4).mp3","vj_ro2rus3/pain (5).mp3","vj_ro2rus3/pain (6).mp3","vj_ro2rus3/pain (7).mp3","vj_ro2rus3/pain (8).mp3","vj_ro2rus3/pain (9).mp3"}
ENT.B3SoundTbl_DamageByPlayer = {"vj_ro2rus3/playerdamage (1).mp3","vj_ro2rus3/playerdamage (2).mp3","vj_ro2rus3/playerdamage (3).mp3","vj_ro2rus3/playerdamage (4).mp3","vj_ro2rus3/playerdamage (5).mp3","vj_ro2rus3/playerdamage (6).mp3"}
ENT.B3SoundTbl_WeaponReload = {"vj_ro2rus3/reloadsar (1).mp3","vj_ro2rus3/reloadsar (2).mp3","vj_ro2rus3/reloadsar (3).mp3","vj_ro2rus3/reloadsar (4).mp3","vj_ro2rus3/reloadsar (5).mp3","vj_ro2rus3/reloadsar (6).mp3"}
ENT.B3SoundTbl_Suppressing = {"vj_ro2rus3/suppresssar (1).mp3","vj_ro2rus3/suppresssar (2).mp3","vj_ro2rus3/suppresssar (3).mp3","vj_ro2rus3/suppresssar (4).mp3","vj_ro2rus3/suppresssar (5).mp3","vj_ro2rus3/suppresssar (6).mp3"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(2,2))
	self:SetBodygroup(1,math.random(2,7))
	self:SetBodygroup(2,math.random(0,1))
	self:SetBodygroup(3,math.random(0,1))
	self:SetBodygroup(4,math.random(1,4))
	self:SetBodygroup(5,math.random(0,1))
	self:SetBodygroup(6,math.random(0,0))
	self:SetBodygroup(7,math.random(0,1))
	self:SetBodygroup(8,math.random(0,3))
	self:SetBodygroup(9,math.random(0,1))
	if math.random(1,4) == 1 then self.IsMedicSNPC = true end
end

function ENT:CustomOnPreInitialize()
	local randomvoice = math.random(1,3)
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/ruofmale_07.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_04.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_05.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_08.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_09.mdl"}
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/ruofmale_07.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_04.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_05.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_08.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_09.mdl"}
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
		self.Model = {"models/sentry/sentrycag/ruarmyspe/ruofmale_07.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_04.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_05.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_08.mdl","models/sentry/sentrycag/ruarmyspe/ruofmale_09.mdl"}
		end
		end
		end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/