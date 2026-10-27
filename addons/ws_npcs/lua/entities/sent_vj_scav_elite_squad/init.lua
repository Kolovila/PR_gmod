/*--------------------------------------------------
	While you must respect the original copyrights in which this work is built upon (namely DrVrej's VJ Base),
	permission is granted to re-use any aspects of this code for your own purposes. Credit where necessary would be appreciated.
	All I ask is that you do not claim the entirety of this addon as your own. Thank you and enjoy! - KrazyCake
--------------------------------------------------*/
AddCSLuaFile("entities/sent_vj_scav_elite/init.lua")
include("entities/sent_vj_scav_elite/init.lua")
---------------------------------------------------------------------------------------------------------------------------------------------
AddCSLuaFile("shared.lua")
include('shared.lua')
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/gibs/metal_gib4.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=15,vRight=-30,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},
	{EntityName = "NPC2",SpawnPosition = {vForward=15,vRight=30,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},
	{EntityName = "NPC3",SpawnPosition = {vForward=80,vRight=30,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},
	{EntityName = "NPC4",SpawnPosition = {vForward=80,vRight=-30,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},
	{EntityName = "NPC5",SpawnPosition = {vForward=50,vRight=-0,vUp=0},Entities = {"npc_vj_scav_elite","npc_vj_scav_elite2","npc_vj_scav_elite3","npc_vj_scav_elite4","npc_vj_scav_elite5","npc_vj_scav_elite6"},WeaponsList = {"weapon_vj_m4a1_raider","weapon_vj_m4a1_raider2","weapon_vj_m870_raider","weapon_vj_ak74_raider","weapon_vj_ak74_raider2","weapon_vj_ak12_raider","weapon_vj_mr153_raider","weapon_vj_sa58_raider","weapon_vj_mpx_raider","weapon_vj_uzi_raider","weapon_vj_aks74u_raider"}},	
	}