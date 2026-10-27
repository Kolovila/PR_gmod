AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/terrorist/gearbox_leet.mdl","models/sentry/sentrycag/terrorist/gearbox_leet.mdl","models/sentry/sentrycag/terrorist/zarqawi.mdl"}
ENT.StartHealth = 65 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_TERRORIST_FRIENDLY","CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other 
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it 
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player 
ENT.BecomeEnemyToPlayerLevel = 2 -- How many times does the player have to hit the SNPC for it to become enemy 
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"meleeattack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 20
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.AnimTbl_IdleStand = {"pistolidle1"}

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,1))
	if math.random(1,5) == 1 then self.IsMedicSNPC = true end
end

ENT.SoundTbl_Alert = {"vj_sterrle/alert (1).wav","vj_sterrle/alert (2).wav","vj_sterrle/alert (3).wav","vj_sterrle/alert (4).wav","vj_sterrle/alert (5).wav"}
ENT.SoundTbl_CombatIdle = {"vj_sterrle/combat (1).wav","vj_sterrle/combat (2).wav","vj_sterrle/combat (3).wav","vj_sterrle/combat (4).wav","vj_sterrle/combat (5).wav","vj_sterrle/combat (6).wav"}
ENT.SoundTbl_Death = {"vj_sterrle/died (1).wav","vj_sterrle/died (2).wav","vj_sterrle/died (3).wav","vj_sterrle/died (4).wav"}
ENT.SoundTbl_Pain = {"vj_sterrle/pain (1).wav","vj_sterrle/pain (2).wav","vj_sterrle/pain (3).wav","vj_sterrle/pain (4).wav","vj_sterrle/pain (5).wav","vj_sterrle/pain (6).wav"}
ENT.SoundTbl_OnKilledEnemy = {"vj_sterrle/kill (1).wav","vj_sterrle/kill (2).wav","vj_sterrle/kill (3).wav","vj_sterrle/kill (4).wav"}
ENT.SoundTbl_LostEnemy = {"vj_sterrle/losthim (1).wav","vj_sterrle/losthim (2).wav","vj_sterrle/losthim (3).wav","vj_sterrle/losthim (4).wav"}

ENT.SoundTbl_Idle = {"vj_csdeltmi/chat (1).mp3","vj_csdeltmi/chat (2).mp3","vj_csdeltmi/chat (3).mp3","vj_csdeltmi/chat (4).mp3","vj_csdeltmi/chat (5).mp3","vj_csdeltmi/chat (6).mp3","vj_csdeltmi/chat (7).mp3"}
ENT.SoundTbl_FollowPlayer = {"vj_csdeltmi/follow (1).mp3","vj_csdeltmi/follow (2).mp3","vj_csdeltmi/follow (3).mp3"}
ENT.SoundTbl_GrenadeAttack = {"vj_csdeltmi/grenade (1).mp3"}
ENT.SoundTbl_OnGrenadeSight = {"vj_csdeltmi/hidegrenade (1).mp3","vj_csdeltmi/hidegrenade (2).mp3","vj_csdeltmi/hidegrenade (3).mp3"}
ENT.SoundTbl_IdleDialogue = {"vj_csdeltmi/idle (1).mp3","vj_csdeltmi/idle (2).mp3","vj_csdeltmi/idle (3).mp3","vj_csdeltmi/idle (4).mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_csdeltmi/idleans (1).mp3","vj_csdeltmi/idleans (2).mp3"}
ENT.SoundTbl_Investigate = {"vj_csdeltmi/invest (1).mp3","vj_csdeltmi/invest (2).mp3","vj_csdeltmi/invest (3).mp3","vj_csdeltmi/invest (4).mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vj_csdeltmi/nofollow (1).mp3","vj_csdeltmi/nofollow (2).mp3","vj_csdeltmi/nofollow (3).mp3"}
ENT.SoundTbl_Suppressing = {"vj_csdeltmi/suppress (1).mp3","vj_csdeltmi/suppress (2).mp3","vj_csdeltmi/suppress (3).mp3","vj_csdeltmi/suppress (4).mp3","vj_csdeltmi/suppress (5).mp3"}

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/