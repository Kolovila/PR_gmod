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
	{EntityName = "NPC1",SpawnPosition = {vForward=30,vRight=30,vUp=0},Entities = {"npc_vj_snkmobgang"},WeaponsList = {"weapon_vj_sentercarbine","weapon_vj_senterassault"}},
	{EntityName = "NPC2",SpawnPosition = {vForward=-30,vRight=-30,vUp=0},Entities = {"npc_vj_snkmobgang","npc_vj_snkmobgangwo"}, WeaponsList = {"weapon_vj_senterpistol","weapon_vj_senterpumpshot"}},
	{EntityName = "NPC3",SpawnPosition = {vForward=30,vRight=-30,vUp=0},Entities = {"npc_vj_snkmobgang"}, WeaponsList = {"weapon_vj_senterpistol","weapon_vj_sentercarbine"}},
	{EntityName = "NPC4",SpawnPosition = {vForward=-30,vRight=30,vUp=0},Entities = {"npc_vj_snkmobhench"}, WeaponsList = {"weapon_vj_senterassault","weapon_vj_senterpumpshot","weapon_vj_sentermg"}}
	}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/