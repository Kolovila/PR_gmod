
local function shell(wep) 
	wep:shellEvent() 
end

SWEP.Sounds = {
	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	base_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 27/30, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 38/30, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
	},

	base_crawl = {
		{time = 15/30, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
		{time = 38/30, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
	},

	base_fire_cock_1 = {
		// shell @ 3 ""},
		{time = 4.8/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 9.6/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 11 ""},
	},

	base_fire_cock_2 = {
		// shell @ 3 ""},
		{time = 4.8/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 9.6/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 11 ""},
	},

	base_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M590_EMPTY"},
	},

	base_reload_start = {
		{time = 5/30, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	base_reload_start_empty = {
		{time = 7/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
		{time = 20/35, sound = "CW_KK_INS2_M590_PUMPBACK"},
		// shell @ 20 ""},
		{time = 61/35, sound = "CW_KK_INS2_M590_SHELLINSERTSINGLE"},
		{time = 83/35, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// reloaded @ 85 ""},
	},

	base_reload_insert = {
		{time = 4/36, sound = "CW_KK_INS2_M590_SHELLINSERT"},
		// reloaded @ 15 ""},
	},

	base_reload_end = {
		{time = 5/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	base_reload_end_empty = {
		{time = 5/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	iron_fire_cock_1 = {
		// shell @ 4 ""},
		{time = 4.8/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 9.6/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 11 ""},
	},

	iron_fire_cock_2 = {
		// shell @ 4 ""},
		{time = 4.8/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 9.6/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 11 ""},
	},

	iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M590_EMPTY"},
	},

	foregrip_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	foregrip_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	foregrip_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 26/30, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 36/30, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
	},

	foregrip_crawl = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
		{time = 22/30, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
	},

	foregrip_fire_cock_1 = {
		// shell @ 2 ""},
		{time = 3.5/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 7/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 9 ""},
	},

	foregrip_fire_cock_2 = {
		// shell @ 2 ""},
		{time = 3.5/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 7/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 9 ""},
	},

	foregrip_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M590_EMPTY"},
	},

	foregrip_reload_start = {
		{time = 5/30, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	foregrip_reload_start_empty = {
		{time = 7/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
		{time = 20/35, sound = "CW_KK_INS2_M590_PUMPBACK"},
		// shell @ 20 ""},
		{time = 61/35, sound = "CW_KK_INS2_M590_SHELLINSERTSINGLE"},
		{time = 83/35, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// reloaded @ 85 ""},
	},

	foregrip_reload_insert = {
		{time = 4/36, sound = "CW_KK_INS2_M590_SHELLINSERT"},
		// reloaded @ 15 ""},
	},

	foregrip_reload_end = {
		{time = 5/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	foregrip_reload_end_empty = {
		{time = 5/35, sound = "CW_KK_INS2_UNIVERSAL_LEANIN"},
	},

	foregrip_iron_fire_cock_1 = {
		// shell @ 3 ""},
		{time = 3.5/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 7/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 12 ""},
	},

	foregrip_iron_fire_cock_2 = {
		// shell @ 3 ""},
		{time = 3.5/24, sound = "CW_KK_INS2_M590_PUMPBACK"},
		{time = 7/24, sound = "CW_KK_INS2_M590_PUMPFORWARD"},
		// pumpedrdy @ 12 ""},
	},

	foregrip_iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M590_EMPTY"},
	},
}
