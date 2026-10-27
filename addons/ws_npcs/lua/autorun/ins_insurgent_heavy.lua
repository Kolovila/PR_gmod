--Add Playermodel
player_manager.AddValidModel( "Ins2 Insurgent Heavy", "models/player/ins_insurgent_heavy.mdl" )
player_manager.AddValidHands( "Ins2 Insurgent Heavy", "models/arms/insurgent_heavy_arms.mdl", 0, "00000000" )

local Category = "Insurgency 2"

local NPC =
{
	Name = "Ins2 Insurgent Heavy (Friendly)",
	Class = "npc_citizen",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "150",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/ins_insurgent_heavy_f.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_heavy_friendly", NPC )

local NPC =
{
	Name = "Ins2 Insurgent Heavy (Enemy)",
	Class = "npc_combine_s",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "150",
	Numgrenades = "4",
	Model = "models/npc/ins_insurgent_heavy_e.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_heavy_enemy", NPC )
