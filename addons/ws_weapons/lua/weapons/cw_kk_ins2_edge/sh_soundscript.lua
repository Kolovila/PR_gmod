
local function m203(wep)
	if SERVER then return end

	wep:shellEvent203()
end

SWEP.Sounds = {
	base_ready = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_BOLTBACK"},
		{time = 26/30, sound = "CW_KK_INS2_M4A1_BOLTRELEASE"},
	},

	base_draw = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	base_holster = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	base_crawl = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
		{time = 22/30, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
	},

	base_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	base_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	base_reload = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 62/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
	},

	base_reloadempty = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 83/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
		{time = 109/30, sound = "CW_KK_INS2_M4A1_BOLTRELEASE"},
	},

	iron_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	iron_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	foregrip_ready = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_BOLTBACK"},
		{time = 26/30, sound = "CW_KK_INS2_M4A1_BOLTRELEASE"},
	},

	foregrip_draw = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	foregrip_holster = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	foregrip_crawl = {
		{time = 0/30, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
		{time = 22/30, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
	},

	foregrip_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	foregrip_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	foregrip_iron_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	foregrip_iron_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	foregrip_reload = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 62/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
	},

	foregrip_reload_empty = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 83/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
		{time = 109/30, sound = "CW_KK_INS2_M4A1_BOLTRELEASE"},
	},

	deployed_in = {
		{time = 16/30, sound = "CW_KK_INS2_UNIVERSAL_BIPOD_DEPLOYSTART"},
		{time = 23/30, sound = "CW_KK_INS2_UNIVERSAL_BIPOD_DEPLOYEND"},
	},

	deployed_out = {
		{time = 7/30, sound = "CW_KK_INS2_UNIVERSAL_BIPOD_RETRACT"},
	},

	deployed_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	deployed_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	deployed_iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M4A1_EMPTY"},
	},

	deployed_iron_fireselect = {
		{time = 8/30, sound = "CW_KK_INS2_M4A1_FIRESELECT"},
	},

	deployed_reload = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 62/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
	},

	deployed_reloadempty = {
		{time = 16/30, sound = "CW_KK_INS2_M4A1_MAGRELEASE"},
		{time = 17/30, sound = "CW_KK_INS2_M4A1_MAGOUT"},
		{time = 78/30, sound = "CW_KK_INS2_M4A1_MAGIN"},
		{time = 105/30, sound = "CW_KK_INS2_M4A1_BOLTBACK"},
		{time = 119/30, sound = "CW_KK_INS2_M4A1_BOLTRELEASE"},
	},
}
