AddCSLuaFile()

SWEP.Base = "cw_blackops3_base_essential"

SWEP.AttachmentDependencies = {
	["h1_att_reddot"] = {"h1_att_contract"},
	["h1_att_reflex"] = {"h1_att_contract"},
	["h1_att_holosight"] = {"h1_att_contract"},
	["h1_att_acog"] = {"h1_att_contract"},
	}
	
SWEP.AttachmentExclusions = {
	["md_blackops3_elo"] = {"h1_att_contract"},
	["md_blackops3_reflex"] = {"h1_att_contract"},
	["md_blackops3_acog"] = {"h1_att_contract"},
	["md_blackops3_hybrid"] = {"h1_att_contract"},
	["md_blackops3_holo"] = {"h1_att_contract"},
	["md_blackops3_ir"] = {"h1_att_contract"},
	}