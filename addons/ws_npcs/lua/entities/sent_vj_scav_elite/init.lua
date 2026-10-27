AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/gibs/metal_gib4.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},
}