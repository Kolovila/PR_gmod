--Add Playermodel
player_manager.AddValidModel( "Ins2 Insurgent Standard", "models/player/ins_insurgent_standard.mdl" )
player_manager.AddValidHands( "Ins2 Insurgent Standard", "models/arms/insurgent_standard_arms.mdl", 0, "00000000" )

local Category = "Insurgency 2"

local NPC =
{
	Name = "Ins2 Insurgent Standard (Friendly)",
	Class = "npc_citizen",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "100",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/ins_insurgent_standard_f.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_standard_friendly", NPC )

local NPC =
{
	Name = "Ins2 Insurgent Standard (Enemy)",
	Class = "npc_combine_s",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "100",
	Numgrenades = "4",
	Model = "models/npc/ins_insurgent_standard_e.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_standard_enemy", NPC )
