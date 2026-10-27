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
	{EntityName = "NPC1",SpawnPosition = {vForward=40,vRight=40,vUp=0},Entities = {"npc_vj_senrogueguardleh"},WeaponsList = {"weapon_vj_sentercarbine","weapon_vj_senterrifle"}},
	{EntityName = "NPC2",SpawnPosition = {vForward=-40,vRight=-40,vUp=0},Entities = {"npc_vj_senrogueguardleh"}, WeaponsList = {"weapon_vj_sentersniper"}},
	{EntityName = "NPC3",SpawnPosition = {vForward=40,vRight=-40,vUp=0},Entities = {"npc_vj_senrogueguardspeh"}, WeaponsList = {"weapon_vj_sentermilrifle","weapon_vj_sentermilrifle","weapon_vj_senterrifle"}},
	{EntityName = "NPC4",SpawnPosition = {vForward=-40,vRight=40,vUp=0},Entities = {"npc_vj_senrogueguardleh","npc_vj_senrogueguardspeh","npc_vj_senrogueguardspeh"}, WeaponsList = {"weapon_vj_sentermilrifle"}},
	{EntityName = "NPC5",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = {"npc_vj_senrogueguardleh"}, WeaponsList = {"weapon_vj_sentermg"}}
	}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/