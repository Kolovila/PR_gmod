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
	{EntityName = "NPC1",SpawnPosition = {vForward=30,vRight=30,vUp=0},Entities = {"npc_vj_cafgsoldier"},WeaponsList = {"weapon_vj_senarabassault"}},
	{EntityName = "NPC2",SpawnPosition = {vForward=-30,vRight=-30,vUp=0},Entities = {"npc_vj_cafgsoldier"}, WeaponsList = {"weapon_vj_senarabcarbinearmy"}},
	{EntityName = "NPC3",SpawnPosition = {vForward=30,vRight=-30,vUp=0},Entities = {"npc_vj_cafgsoldier"}, WeaponsList = {"weapon_vj_senarabassault"}},
	{EntityName = "NPC4",SpawnPosition = {vForward=-30,vRight=30,vUp=0},Entities = {"npc_vj_cafgsoldier"}, WeaponsList = {"weapon_vj_senarabmg"}}
	}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/