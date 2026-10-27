--Add Playermodel
player_manager.AddValidModel( "Ins2 Security VIP", "models/player/ins_security_vip.mdl" )
player_manager.AddValidHands( "Ins2 Security VIP", "models/arms/security_vip_arms.mdl", 0, "00000000" )

local Category = "Insurgency 2"

local NPC =
{
	Name = "Ins2 Security VIP (Friendly)",
	Class = "npc_citizen",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/ins_security_vip_f.mdl",
	Category = Category
}

list.Set( "NPC", "ins_security_vip_friendly", NPC )

local NPC =
{
	Name = "Ins2 Security VIP (Enemy)",
	Class = "npc_combine_s",
	Weapons = { "weapon_smg1" },
	Numgrenades = "4",
	Health = "70",
	Numgrenades = "4",
	Model = "models/npc/ins_security_vip_e.mdl",
	Category = Category
}

list.Set( "NPC", "ins_security_vip_enemy", NPC )
