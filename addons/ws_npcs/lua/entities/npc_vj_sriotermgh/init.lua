AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/sentry/sentrycag/riotmg/shirt.mdl","models/sentry/sentrycag/riotmg/longcoat.mdl"}
ENT.StartHealth = 45 -- or you can use a convar: GetConVarNumber("vj_dum_dummy_h")
ENT.AllowPrintingInChat = false -- Should this SNPC be allowed to post in player's chat Example Blank no longer likes you.
ENT.HasAllies = true -- Put to false if you want it not to have any allies 
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"} -- NPCs with the same class with be allied to each other 
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base 
ENT.BloodColor = "Red"
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"meleeattack01"} -- Melee Attack Animations
ENT.MeleeAttackDamage = 10
//ENT.Weapon_FiringDistanceClose = 10 -- How close until it stops shooting
ENT.FootStepTimeRun = 0.4 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
ENT.CanFlinch = 1
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_senmolotov" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeAttackModel = "models/props_junk/garbage_glassbottle003a.mdl"
ENT.AnimTbl_GrenadeAttack = {"throw1"} -- Grenade Attack Animations

function ENT:CustomInitialize()
	self:SetSkin(math.random(0,2))
end

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav","npc/footsteps/hardboot_generic2.wav","npc/footsteps/hardboot_generic3.wav","npc/footsteps/hardboot_generic4.wav","npc/footsteps/hardboot_generic5.wav","npc/footsteps/hardboot_generic6.wav","npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Alert = {"vj_sterror/alert (1).wav"}
ENT.SoundTbl_Idle = {"vj_sterror/chat (1).wav","vj_sterror/chat (2).wav","vj_sterror/chat (3).wav","vj_sterror/chat (4).wav","vj_sterror/chat (5).wav","vj_sterror/chat (6).wav","vj_sterror/chat (7).wav","vj_sterror/chat (8).wav","vj_sterror/chat (9).wav","vj_sterror/chat (10).wav","vj_sterror/chat (11).wav","vj_sterror/chat (12).wav"}
ENT.SoundTbl_CombatIdle = {"vj_sterror/combat (1).wav","vj_sterror/combat (2).wav","vj_sterror/combat (3).wav","vj_sterror/combat (4).wav","vj_sterror/combat (5).wav","vj_sterror/combat (6).wav","vj_sterror/combat (7).wav"}
ENT.SoundTbl_Death = {"vj_sterror/died (1).wav","vj_sterror/died (2).wav","vj_sterror/died (3).wav","vj_sterror/died (4).wav","vj_sterror/died (5).wav","vj_sterror/died (6).wav","vj_sterror/died (7).wav","vj_sterror/died (8).wav","vj_sterror/died (9).wav"}
ENT.SoundTbl_OnGrenadeSight = {"vj_sterror/hidegrenade (1).wav","vj_sterror/hidegrenade (3).wav","vj_sterror/hidegrenade (2).wav","vj_sterror/hidegrenade (4).wav"}
ENT.SoundTbl_CallForHelp = {"vj_sterror/hidegrenade (1).wav","vj_sterror/hidegrenade (3).wav","vj_sterror/hidegrenade (2).wav","vj_sterror/hidegrenade (4).wav"}
ENT.SoundTbl_Pain = {"vj_sterror/pain (1).wav","vj_sterror/pain (2).wav","vj_sterror/pain (3).wav","vj_sterror/pain (4).wav"}
ENT.SoundTbl_Suppressing = {"vj_sterror/combat (1).wav","vj_sterror/combat (2).wav","vj_sterror/combat (3).wav","vj_sterror/combat (4).wav","vj_sterror/combat (5).wav","vj_sterror/combat (6).wav","vj_sterror/combat (7).wav","vj_sterror/suppress (1).wav","vj_sterror/suppress (2).wav","vj_sterror/suppress (3).wav"}

/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/