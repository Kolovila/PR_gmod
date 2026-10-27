AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/untroop/barney.mdl"}
ENT.StartHealth = 95 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other 
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
ENT.HasGrenadeAttack = false
ENT.AnimTbl_GrenadeAttack = {"grenThrow"} -- Grenade Attack Animations

ENT.SoundTbl_Death = {"podeath/died (1).mp3","podeath/died (2).mp3","podeath/died (3).mp3","podeath/died (4).mp3","podeath/died (5).mp3","podeath/died (6).mp3","podeath/died (7).mp3","podeath/died (8).mp3","podeath/died (9).mp3","podeath/died (10).mp3","podeath/died (11).mp3","podeath/died (12).mp3","podeath/died (13).mp3","podeath/died (14).mp3"}

function ENT:CustomInitialize()
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
  local voices = math.random(1,4)
        if voices == 1 then
self.SoundTbl_Alert = {"vj_uncop1/alert (1).mp3","vj_uncop1/alert (2).mp3","vj_uncop1/alert (3).mp3","vj_uncop1/alert (4).mp3","vj_uncop1/alert (5).mp3","vj_uncop1/alert (6).mp3","vj_uncop1/alert (7).mp3"}
self.SoundTbl_BecomeEnemyToPlayer = {"vj_uncop1/becomehos (1).mp3","vj_uncop1/becomehos (2).mp3","vj_uncop1/becomehos (3).mp3","vj_uncop1/becomehos (4).mp3"}
self.SoundTbl_MoveOutOfPlayersWay = {"vj_uncop1/bump (1).mp3","vj_uncop1/bump (2).mp3","vj_uncop1/bump (3).mp3","vj_uncop1/bump (4).mp3"} 
self.SoundTbl_Idle = {"vj_uncop1/chat (1).mp3","vj_uncop1/chat (2).mp3","vj_uncop1/chat (3).mp3","vj_uncop1/chat (4).mp3","vj_uncop1/chat (5).mp3","vj_uncop1/chat (6).mp3","vj_uncop1/chat (7).mp3","vj_uncop1/chat (8).mp3","vj_uncop1/chat (9).mp3"}
self.SoundTbl_CombatIdle = {"vj_uncop1/combat (1).mp3","vj_uncop1/combat (2).mp3","vj_uncop1/combat (3).mp3","vj_uncop1/combat (4).mp3","vj_uncop1/combat (5).mp3"}
self.SoundTbl_FollowPlayer = {"vj_uncop1/follow (1).mp3","vj_uncop1/follow (2).mp3","vj_uncop1/follow (3).mp3"}
self.SoundTbl_MedicReceiveHeal = {"vj_uncop1/gotmedic (1).mp3"}
self.SoundTbl_OnPlayerSight = {"vj_uncop1/hi (1).mp3","vj_uncop1/hi (2).mp3","vj_uncop1/hi (3).mp3","vj_uncop1/hi (5).mp3"}
self.SoundTbl_OnGrenadeSight = {"vj_uncop1/hidegrenade (1).mp3","vj_uncop1/hidegrenade (3).mp3","vj_uncop1/hidegrenade (2).mp3"}
self.SoundTbl_OnKilledEnemy = {"vj_uncop1/kill (1).mp3","vj_uncop1/kill (2).mp3","vj_uncop1/kill (3).mp3","vj_uncop1/kill (4).mp3"}
self.SoundTbl_LostEnemy = {"vj_uncop1/losthim (1).mp3","vj_uncop1/losthim (2).mp3","vj_uncop1/losthim (3).mp3","vj_uncop1/losthim (4).mp3"}
self.SoundTbl_UnFollowPlayer = {"vj_uncop1/nofollow (1).mp3","vj_uncop1/nofollow (2).mp3","vj_uncop1/nofollow (3).mp3","vj_uncop1/nofollow (4).mp3"}
self.SoundTbl_Pain = {"vj_uncop1/pain (1).mp3","vj_uncop1/pain (2).mp3","vj_uncop1/pain (3).mp3","vj_uncop1/pain (4).mp3","vj_uncop1/pain (5).mp3","vj_uncop1/pain (6).mp3"}
self.SoundTbl_DamageByPlayer = {"vj_uncop1/playerdamage (1).mp3","vj_uncop1/playerdamage (2).mp3","vj_uncop1/playerdamage (3).mp3","vj_uncop1/playerdamage (4).mp3","vj_uncop1/playerdamage (5).mp3"}
self.SoundTbl_WeaponReload = {"vj_uncop1/reload (1).mp3","vj_uncop1/reload (2).mp3","vj_uncop1/reload (3).mp3"}
	elseif voices == 2 then
self.SoundTbl_Alert = {"vj_uncop2/alert (1).mp3","vj_uncop2/alert (2).mp3","vj_uncop2/alert (3).mp3","vj_uncop2/alert (4).mp3","vj_uncop2/alert (5).mp3","vj_uncop2/alert (6).mp3","vj_uncop2/alert (7).mp3"}
self.SoundTbl_BecomeEnemyToPlayer = {"vj_uncop2/becomehos (1).mp3","vj_uncop2/becomehos (2).mp3","vj_uncop2/becomehos (3).mp3","vj_uncop2/becomehos (4).mp3"}
self.SoundTbl_MoveOutOfPlayersWay = {"vj_uncop2/bump (1).mp3","vj_uncop2/bump (2).mp3","vj_uncop2/bump (3).mp3","vj_uncop2/bump (4).mp3","vj_uncop2/bump (5).mp3"} 
self.SoundTbl_Idle = {"vj_uncop2/chat (1).mp3","vj_uncop2/chat (2).mp3","vj_uncop2/chat (3).mp3","vj_uncop2/chat (4).mp3","vj_uncop2/chat (5).mp3","vj_uncop2/chat (6).mp3","vj_uncop2/chat (7).mp3","vj_uncop2/chat (8).mp3","vj_uncop2/chat (9).mp3"}
self.SoundTbl_CombatIdle = {"vj_uncop2/combat (1).mp3","vj_uncop2/combat (2).mp3","vj_uncop2/combat (3).mp3","vj_uncop2/combat (4).mp3","vj_uncop2/combat (5).mp3","vj_uncop2/combat (6).mp3"}
self.SoundTbl_FollowPlayer = {"vj_uncop2/follow (1).mp3","vj_uncop2/follow (2).mp3","vj_uncop2/follow (3).mp3","vj_uncop2/follow (4).mp3"}
self.SoundTbl_MedicReceiveHeal = {"vj_uncop2/gotmedic (1).mp3","vj_uncop2/gotmedic (2).mp3"}
self.SoundTbl_OnPlayerSight = {"vj_uncop2/hi (1).mp3","vj_uncop2/hi (2).mp3","vj_uncop2/hi (3).mp3","vj_uncop2/hi (4).mp3"}
self.SoundTbl_OnGrenadeSight = {"vj_uncop2/hidegrenade (1).mp3","vj_uncop2/hidegrenade (3).mp3","vj_uncop2/hidegrenade (2).mp3"}
self.SoundTbl_OnKilledEnemy = {"vj_uncop2/kill (1).mp3","vj_uncop2/kill (2).mp3","vj_uncop2/kill (3).mp3","vj_uncop2/kill (4).mp3"}
self.SoundTbl_LostEnemy = {"vj_uncop2/losthim (1).mp3","vj_uncop2/losthim (2).mp3","vj_uncop2/losthim (3).mp3","vj_uncop2/losthim (4).mp3"}
self.SoundTbl_UnFollowPlayer = {"vj_uncop2/nofollow (1).mp3","vj_uncop2/nofollow (2).mp3","vj_uncop2/nofollow (3).mp3","vj_uncop2/nofollow (4).mp3","vj_uncop2/nofollow (5).mp3","vj_uncop2/nofollow (6).mp3"}
self.SoundTbl_Pain = {"vj_uncop2/pain (1).mp3","vj_uncop2/pain (2).mp3","vj_uncop2/pain (3).mp3","vj_uncop2/pain (4).mp3","vj_uncop2/pain (5).mp3","vj_uncop2/pain (6).mp3"}
self.SoundTbl_DamageByPlayer = {"vj_uncop2/playerdamage (1).mp3","vj_uncop2/playerdamage (2).mp3","vj_uncop2/playerdamage (3).mp3","vj_uncop2/playerdamage (4).mp3","vj_uncop2/playerdamage (5).mp3"}
self.SoundTbl_WeaponReload = {"vj_uncop2/reload (1).mp3","vj_uncop2/reload (2).mp3","vj_uncop2/reload (3).mp3"}
    elseif voices == 3 then
self.SoundTbl_Alert = {"vj_uncop3/alert (1).mp3","vj_uncop3/alert (2).mp3","vj_uncop3/alert (3).mp3","vj_uncop3/alert (4).mp3","vj_uncop3/alert (5).mp3","vj_uncop3/alert (6).mp3","vj_uncop3/alert (7).mp3"}
self.SoundTbl_BecomeEnemyToPlayer = {"vj_uncop3/becomehos (1).mp3","vj_uncop3/becomehos (2).mp3","vj_uncop3/becomehos (3).mp3","vj_uncop3/becomehos (4).mp3"}
self.SoundTbl_MoveOutOfPlayersWay = {"vj_uncop3/bump (1).mp3","vj_uncop3/bump (2).mp3","vj_uncop3/bump (3).mp3","vj_uncop3/bump (4).mp3"} 
self.SoundTbl_Idle = {"vj_uncop3/chat (1).mp3","vj_uncop3/chat (2).mp3","vj_uncop3/chat (3).mp3","vj_uncop3/chat (4).mp3","vj_uncop3/chat (5).mp3","vj_uncop3/chat (6).mp3","vj_uncop3/chat (7).mp3","vj_uncop3/chat (8).mp3"}
self.SoundTbl_CombatIdle = {"vj_uncop3/combat (1).mp3","vj_uncop3/combat (2).mp3","vj_uncop3/combat (3).mp3","vj_uncop3/combat (4).mp3","vj_uncop3/combat (5).mp3","vj_uncop3/combat (6).mp3"}
self.SoundTbl_FollowPlayer = {"vj_uncop3/follow (1).mp3","vj_uncop3/follow (2).mp3","vj_uncop3/follow (3).mp3"}
self.SoundTbl_MedicReceiveHeal = {"vj_uncop3/gotmedic (1).mp3"}
self.SoundTbl_OnPlayerSight = {"vj_uncop3/hi (1).mp3","vj_uncop3/hi (2).mp3","vj_uncop3/hi (3).mp3","vj_uncop3/hi (4).mp3"}
self.SoundTbl_OnGrenadeSight = {"vj_uncop3/hidegrenade (1).mp3","vj_uncop3/hidegrenade (3).mp3","vj_uncop3/hidegrenade (2).mp3","vj_uncop3/hidegrenade (3).mp3"}
self.SoundTbl_OnKilledEnemy = {"vj_uncop3/kill (1).mp3","vj_uncop3/kill (2).mp3","vj_uncop3/kill (3).mp3"}
self.SoundTbl_LostEnemy = {"vj_uncop3/losthim (1).mp3","vj_uncop3/losthim (2).mp3","vj_uncop3/losthim (3).mp3"}
self.SoundTbl_UnFollowPlayer = {"vj_uncop3/nofollow (1).mp3","vj_uncop3/nofollow (2).mp3","vj_uncop3/nofollow (3).mp3","vj_uncop3/nofollow (4).mp3","vj_uncop3/nofollow (5).mp3","vj_uncop3/nofollow (6).mp3"}
self.SoundTbl_Pain = {"vj_uncop3/pain (1).mp3","vj_uncop3/pain (2).mp3","vj_uncop3/pain (3).mp3","vj_uncop3/pain (4).mp3","vj_uncop3/pain (5).mp3","vj_uncop3/pain (6).mp3"}
self.SoundTbl_DamageByPlayer = {"vj_uncop3/playerdamage (1).mp3","vj_uncop3/playerdamage (2).mp3","vj_uncop3/playerdamage (3).mp3","vj_uncop3/playerdamage (4).mp3","vj_uncop3/playerdamage (5).mp3"}
self.SoundTbl_WeaponReload = {"vj_uncop3/reload (1).mp3","vj_uncop3/reload (2).mp3","vj_uncop3/reload (3).mp3"}
    elseif voices == 4 then
self.SoundTbl_Alert = {"vj_uncop4/alert (2).mp3","vj_uncop4/alert (3).mp3","vj_uncop4/alert (4).mp3","vj_uncop4/alert (5).mp3","vj_uncop4/alert (6).mp3","vj_uncop4/alert (7).mp3"}
self.SoundTbl_BecomeEnemyToPlayer = {"vj_uncop4/becomehos (1).mp3","vj_uncop4/becomehos (2).mp3","vj_uncop4/becomehos (3).mp3","vj_uncop4/becomehos (4).mp3","vj_uncop4/becomehos (5).mp3"}
self.SoundTbl_MoveOutOfPlayersWay = {"vj_uncop4/bump (1).mp3","vj_uncop4/bump (2).mp3","vj_uncop4/bump (3).mp3","vj_uncop4/bump (4).mp3","vj_uncop4/bump (5).mp3","vj_uncop4/bump (6).mp3"} 
self.SoundTbl_Idle = {"vj_uncop4/chat (1).mp3","vj_uncop4/chat (2).mp3","vj_uncop4/chat (3).mp3","vj_uncop4/chat (4).mp3","vj_uncop4/chat (5).mp3","vj_uncop4/chat (6).mp3","vj_uncop4/chat (7).mp3","vj_uncop4/chat (8).mp3","vj_uncop4/chat (9).mp3","vj_uncop4/chat (10).mp3"}
self.SoundTbl_CombatIdle = {"vj_uncop4/combat (1).mp3","vj_uncop4/combat (2).mp3","vj_uncop4/combat (3).mp3","vj_uncop4/combat (4).mp3","vj_uncop4/combat (5).mp3"}
self.SoundTbl_FollowPlayer = {"vj_uncop4/follow (1).mp3","vj_uncop4/follow (2).mp3","vj_uncop4/follow (3).mp3","vj_uncop4/follow (4).mp3"}
self.SoundTbl_MedicReceiveHeal = {"vj_uncop4/gotmedic (1).mp3"}
self.SoundTbl_OnPlayerSight = {"vj_uncop4/hi (1).mp3","vj_uncop4/hi (2).mp3","vj_uncop4/hi (3).mp3","vj_uncop4/hi (4).mp3","vj_uncop4/hi (5).mp3"}
self.SoundTbl_OnGrenadeSight = {"vj_uncop4/hidegrenade (1).mp3","vj_uncop4/hidegrenade (3).mp3","vj_uncop4/hidegrenade (2).mp3"}
self.SoundTbl_OnKilledEnemy = {"vj_uncop4/kill (1).mp3","vj_uncop4/kill (2).mp3","vj_uncop4/kill (3).mp3"}
self.SoundTbl_LostEnemy = {"vj_uncop4/losthim (1).mp3","vj_uncop4/losthim (2).mp3","vj_uncop4/losthim (3).mp3"}
self.SoundTbl_UnFollowPlayer = {"vj_uncop4/nofollow (1).mp3","vj_uncop4/nofollow (2).mp3","vj_uncop4/nofollow (3).mp3","vj_uncop4/nofollow (4).mp3","vj_uncop4/nofollow (5).mp3","vj_uncop4/nofollow (6).mp3"}
self.SoundTbl_Pain = {"vj_uncop4/pain (1).mp3","vj_uncop4/pain (2).mp3","vj_uncop4/pain (3).mp3","vj_uncop4/pain (4).mp3","vj_uncop4/pain (5).mp3","vj_uncop4/pain (6).mp3","vj_uncop4/pain (7).mp3","vj_uncop4/pain (8).mp3"}
self.SoundTbl_DamageByPlayer = {"vj_uncop4/playerdamage (1).mp3","vj_uncop4/playerdamage (2).mp3","vj_uncop4/playerdamage (3).mp3","vj_uncop4/playerdamage (4).mp3","vj_uncop4/playerdamage (5).mp3"}
self.SoundTbl_WeaponReload = {"vj_uncop4/reload (1).mp3","vj_uncop4/reload (2).mp3","vj_uncop4/reload (3).mp3"}
    end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/