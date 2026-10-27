/*--------------------------------------------------
	While you must respect the original copyrights in which this work is built upon (namely DrVrej's VJ Base),
	permission is granted to re-use any aspects of this code for your own purposes. Credit where necessary would be appreciated.
	All I ask is that you do not claim the entirety of this addon as your own. Thank you and enjoy! - KrazyCake
--------------------------------------------------*/
AddCSLuaFile("shared.lua")
include('shared.lua')
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/gibs/metal_gib4.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {
	"npc_vj_ruaf_support","npc_vj_ruaf_sniper","npc_vj_ruaf_rocketman"
	},WeaponsList = {"default"}},
}