--Add Playermodel
player_manager.AddValidModel( "Ins2 Insurgent VIP", "models/player/ins_insurgent_vip.mdl" )
player_manager.AddValidHands( "Ins2 Insurgent VIP", "models/arms/insurgent_vip_arms.mdl", 0, "00000000" )

local Category = "Insurgency 2"

local NPC =
{
	Name = "Ins2 Insurgent VIP (Friendly)",
	Class = "npc_citizen",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/ins_insurgent_vip_f.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_vip_friendly", NPC )

local NPC =
{
	Name = "Ins2 Insurgent VIP (Enemy)",
	Class = "npc_combine_s",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	Numgrenades = "4",
	Model = "models/npc/ins_insurgent_vip_e.mdl",
	Category = Category
}

list.Set( "NPC", "ins_insurgent_vip_enemy", NPC )
