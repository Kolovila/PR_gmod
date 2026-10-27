AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/props_junk/popcan01a.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=40,vRight=40,vUp=0},Entities = {"npc_vj_cusmarinebreach"},WeaponsList = {"weapon_vj_senbmssmgarmy","weapon_vj_senbmssmgarmy","weapon_vj_senbmspumpshotarmy"}},
	{EntityName = "NPC2",SpawnPosition = {vForward=-40,vRight=-40,vUp=0},Entities = {"npc_vj_cusmarinemed"}, WeaponsList = {"weapon_vj_sensmgarmy","weapon_vj_sensmgarmy","weapon_vj_senpumpshotarmy"}},
	{EntityName = "NPC3",SpawnPosition = {vForward=40,vRight=-40,vUp=0},Entities = {"npc_vj_cusmarine","npc_vj_cusmarinegas"}, WeaponsList = {"weapon_vj_senretroriflearmy","weapon_vj_sencarbinearmy"}},
	{EntityName = "NPC4",SpawnPosition = {vForward=-40,vRight=40,vUp=0},Entities = {"npc_vj_cusmarinecomm"}, WeaponsList = {"weapon_vj_senpumpshotarmy","weapon_vj_sencarbinearmy","weapon_vj_sensmgarmy"}},
	{EntityName = "NPC5",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {"npc_vj_cusmarine","npc_vj_cusmarinegas"}, WeaponsList = {"weapon_vj_senretroriflearmy","weapon_vj_sencarbinearmy"}}
	}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/