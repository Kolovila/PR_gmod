--Add Playermodel
player_manager.AddValidModel( "Ins2 Insurgent Light", "models/player/ins_insurgent_light.mdl" )
player_manager.AddValidHands( "Ins2 Insurgent Light", "models/arms/insurgent_light_arms.mdl", 0, "00000000" )

local Category = "Insurgency 2"

local NPC =
{
	Name = "Ins2 Insurgent Light (Friendly)",
	Class = "npc_citizen",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/ins_insurgent_light_f.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_light_friendly", NPC )

local NPC =
{
	Name = "Ins2 Insurgent Light (Enemy)",
	Class = "npc_combine_s",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	Numgrenades = "4",
	Model = "models/npc/ins_insurgent_light_e.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_light_enemy", NPC )
