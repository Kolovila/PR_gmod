/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
AddCSLuaFile("shared.lua")
include('shared.lua')
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/gibs/metal_gib4.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {"npc_vj_chvk_usec","npc_vj_chvk_usec1","npc_vj_chvk_usec2","npc_vj_chvk_usec3","npc_vj_chvk_usec4"},WeaponsList = {"weapon_vj_ak74_spec","weapon_vj_asval_spec","weapon_vj_m870","weapon_vj_ak74_spec2","weapon_vj_ak74n","weapon_vj_aks74u_spec","weapon_vj_m4a1_spec","weapon_vj_asval","weapon_vj_ak74n_Plum","weapon_vj_m4a1_spec2","weapon_vj_ump45_silenced","weapon_vj_colt_m4a1","weapon_vj_saiga12"}},
}