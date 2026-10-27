AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
CustomizableWeaponry:registerAmmo("4.6x30mm", "4.6x30mm NATO Rounds", 4.6, 30)
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "H&K MP7A1"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.8
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_mp7")
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ots"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.35
	SWEP.ShellOffsetMul = 0
	SWEP.Shell = "mainshell"
	SWEP.ShellPosOffset = {x = 0, y = -0, z = 0}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-0, -0, 0)
	SWEP.StopReloadBoneOffset = 0.9
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_h&k_mp7.mdl"
	SWEP.WMPos = Vector(-0.0, -1.5, -2.5)
	SWEP.WMAng = Vector(-8, -0.052, -180)
	
	SWEP.IronsightPos = Vector(-1.504, -1.213, 0.479)
	SWEP.IronsightAng = Vector(0.386, 0.788, -0.494)

	SWEP.FoldMP7Pos = Vector(-1.517, -4.186, -0.135)
	SWEP.FoldMP7Ang = Vector(0.386, 0.788, -0.494)
	
	SWEP.MicroT1Pos = Vector (-1.52, -2.56, 0.221)
	SWEP.MicroT1Ang = Vector (-0.189, 1.036, 0)
	
	SWEP.SprintPos = Vector(0, -9.332, -7.321)
	SWEP.SprintAng = Vector(65.332, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.53, -2.612, 0.03)
	SWEP.EoTechAng = Vector(-0.055, 0.857, 0)
	
	SWEP.EoTechPos_mag3x = Vector(-1.53, -3.012, 0.05)
	SWEP.EoTechAng_mag3x = Vector(-0.055, 0.857, 0)

	SWEP.EoTech553Pos = Vector(-1.53, -2.612, -0.04)
	SWEP.EoTech553Ang = Vector(-0.055, 0.857, 0)
	
	SWEP.EoTech553Pos_mag3x = Vector(-1.53, -3.012, -0.05)
	SWEP.EoTech553Ang_mag3x = Vector(-0.055, 0.857, 0)

	SWEP.EOL3Pos = Vector(-1.525, -2.612, 0.14)
	SWEP.EOL3Ang = Vector(-0.055, 0.857, 0)

	SWEP.EOL3Pos_mag3x = Vector(-1.525, -2.612, 0.08)
	SWEP.EOL3Ang_mag3x = Vector(-0.055, 0.857, 0)

	SWEP.ACOGPos = Vector(-1.522, -2.787, 0.097)
	SWEP.ACOGAng = Vector(-0.097, 1.032, 0)
	


	SWEP.KKINS2KobraPos = Vector(-1.53, -4.186, 0.13)
	SWEP.KKINS2KobraAng = Vector (0.386, 0.788, -0.494)

	SWEP.KKINS2AimpointPos = Vector(-1.515, -4.186, 0.07)
	SWEP.KKINS2AimpointAng = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2EoTechPos = Vector(-1.52, -2.612, 0.23)
	SWEP.KKINS2EoTechAng = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2EoTechPos_mag3x = Vector(-1.515, -3.012, 0.25)
	SWEP.KKINS2EoTechAng_mag3x = Vector(0.386, 0.788, -0.494)



	SWEP.KKINS2CSTMMicroT1Pos = Vector(-1.517, -4.186, 0.05)
	SWEP.KKINS2CSTMMicroT1Ang = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMCMorePos = Vector(-1.53, -4.186, 0.13)
	SWEP.KKINS2CSTMCMoreAng = Vector (0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMBarskaPos = Vector(-1.56, -4.186, 0.05)
	SWEP.KKINS2CSTMBarskaAng = Vector(0.386, 0.788, -0.494) //VERY IMPOTARNT PARAMETERS!!!


	SWEP.KKINS2CSTMBarskaPos_mag3x = Vector(-1.55, -4.186, -0.1)
	SWEP.KKINS2CSTMBarskaAng_mag3x = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMCompM4SPos = Vector(-1.53, -4.186, 0.02)
	SWEP.KKINS2CSTMCompM4SAng =  Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMCompM4SPos_mag3x = Vector(-1.54, -4.386, 0.01)
	SWEP.KKINS2CSTMCompM4SAng_mag3x = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMACOGPos = Vector(-1.517, -2.787, -0.065)
	SWEP.KKINS2CSTMACOGAng = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMEoTechXPSPos = Vector(-1.52, -2.612, 0.23)
	SWEP.KKINS2CSTMEoTechXPSAng = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2CSTMEoTechXPSPos_mag3x = Vector(-1.52, -2.612, 0.1)
	SWEP.KKINS2CSTMEoTechXPSAng_mag3x = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2ElcanPos = Vector(-1.517, -2.787, -0.065)
	SWEP.KKINS2ElcanAng = Vector(0.386, 0.788, -0.494)

	SWEP.KKINS2PO4Pos = Vector(-1.484, -3.1, 0.323)
	SWEP.KKINS2PO4Ang = Vector(0.386, 0.788, -0.494)

	SWEP.MagnifierPos = Vector(-1.504, -2.612, 0.03)
	SWEP.MagnifierAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(0, 0, -1.176)
	SWEP.SprintAng = Vector(-16.288, 0, 0) 
	
	SWEP.CustomizePos = Vector(5.953, 0, 0.745)
	SWEP.CustomizeAng = Vector(0, 38.493, 0)
	
	SWEP.AlternativePos = Vector(-0.299, -0.806, -0.443)
	SWEP.AlternativeAng = Vector(2.273, 0.615, 0)

	SWEP.BackupReflexPos = Vector(-3.28, -1.213, 1.4)
	SWEP.BackupReflexAng = Vector(0.386, 0, -45.494)
	
	SWEP.BackupSights = {
		["md_acog"] = {[1] = Vector(-1.525, -1.787, -0.6), [2] = Vector(0.1, 0.8, 0)},
		["kk_ins2_elcan"] = {[1] = Vector(-1.495, -1.787, -0.851), [2] = Vector(0.1, 0.8, 0)},	
	}

	SWEP.ACOGAxisAlign = {right = 0.55, up = -0.2, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_microt1_mp7"] = {model = "models/cw2/attachments/microt1.mdl", bone = "weapon", rel = "", pos = Vector(1.098, -1.372, 0.007), angle = Angle(-90, 90, 0), size = Vector(0.349, 0.349, 0.349)},
		["md_tundra9mm_mp7"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "weapon", rel = "", pos = Vector(-8.271, 0.201, -0.579), angle = Angle(0, 90, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", rel = "", pos = Vector(9.565, 7.601, 0.213), angle = Angle(0, 178, 90), size = Vector(0.8, 0.8, 0.8)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "weapon", rel = "", pos = Vector(3.832, 2.145, -0.226), angle = Angle(90, -90, 0), size = Vector(0.6, 0.6, 0.6)},
		--["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "weapon", rel = "", pos = Vector(-1.492, -1.211, -0.01), angle = Angle(0, 0, -90), size = Vector(0.349, 0.349, 0.349)},
		["md_cybereotechl3"] = {model = "models/cyber_attachments/red_dot_sights/cyber_eotechl3.mdl", pos = Vector(0.55, -1.45, -0.02), angle = Angle(0, 180, 90), size = Vector(0.25, 0.25, 0.25), bone = "weapon"},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", pos = Vector(-8.65, 0.24, -0.58), angle = Angle(0, 180, 0), size = Vector(0.65, 0.65, 0.65), bone = "weapon"},
		["md_cybersil"] = {model = "models/cyber_attachments/silencers/bo2_smg_sil.mdl", pos = Vector(-8.55, 0.25, 0), angle = Angle(0, 180, 0), size = Vector(0.25, 0.25, 0.25), bone = "weapon"},

		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra.mdl", pos = Vector(0.75, -1.26, 0.01), angle = Angle(0, 180, 90), size = Vector(0.81, 0.81, 0.81), bone = "weapon"},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan_m.mdl", pos = Vector(0.75, -1.26, 0.01), angle = Angle(0, 180, 90), size = Vector(0.81, 0.81, 0.81), bone = "weapon"},
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint.mdl", pos = Vector(1.2, -1.3, 0.025), angle = Angle(0, 180, 90), size = Vector(0.724, 0.724, 0.724), bone = "weapon"},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech_xl.mdl", pos = Vector(-0.5, -1.245, 0), angle = Angle(0, 180, 90), size = Vector(0.6317, 0.6317, 0.6317), bone = "weapon"},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24.mdl", pos = Vector(0.75, -1.245, 0), angle = Angle(0, 180, 90), size = Vector(0.58, 0.58, 0.58), bone = "weapon"},

		["kk_ins2_cstm_microt1"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_microt1_m.mdl", pos = Vector(1.5, -1.3, 0.019), angle = Angle(0, 180, 90), size = Vector(0.857, 0.857, 0.857), bone = "weapon"},
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_cmore.mdl", pos = Vector(0.85, -1.28, 0.005), angle = Angle(90, 180, 90), size = Vector(0.675, 0.675, 0.675), bone = "weapon"},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska_m.mdl", pos = Vector(-0.2, -1.22, 0), angle = Angle(0, 180, 90), size = Vector(0.89, 0.89, 0.89), bone = "weapon"},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_eotechxps.mdl", pos = Vector(1.32, -1.238, 0), angle = Angle(0, 180, 90), size = Vector(0.61, 0.61, 0.61), bone = "weapon"},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_compm4s.mdl", pos = Vector(1, -1.285, 0.01), angle = Angle(0, 180, 90), size = Vector(0.785, 0.785, 0.785), bone = "weapon"},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_acog_m.mdl", pos = Vector(0.4, -1.26, 0), angle = Angle(0, 180, 90), size = Vector(0.785, 0.785, 0.785), bone = "weapon"},

		["larue_mount"] = {model = "models/c_larue_kkhx.mdl", pos = Vector(-1, -1.3, -0.17), angle = Angle(0, 0, -90), size = Vector(0.8, 0.8, 0.8), bone = "weapon"},
		["md_magnifier_scope"] = {model = "models/c_magnifier_scope.mdl", pos = Vector(-3.65, -0.834, 0.01), angle = Angle(0, 180, 90), size = Vector(0.935, 0.935, 0.935), bone = "weapon"},

		["md_backup_reflex"] = {model = "models/c_docter.mdl", pos = Vector(-4.68, -0.2, -0.95), angle = Angle(0, 180, 135), size = Vector(0.8987, 0.8987, 0.8987), bone = "weapon"},
		["md_backup_reflex_rail"] = {model = "models/c_angled_rails.mdl", pos = Vector(-3.75, 0.31, -0.15), angle = Angle(0, 0, 180), size = Vector(1.2, 1.2, 1.2), bone = "weapon"},

		["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_rail.mdl", pos = Vector(-2.05, -1.185, 0), angle = Angle(0, 180, -90), size = Vector(0.77, 0.77, 0.77), bone = "weapon"},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_rail.mdl", pos = Vector(-4, 0.305, 0.61), angle = Angle(0, 180, 180), size = Vector(1.05, 1.05, 1.05), bone = "weapon"},
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_rail.mdl", pos = Vector(-4, 0.305, 0.61), angle = Angle(0, 180, 180), size = Vector(1.05, 1.05, 1.05), bone = "weapon"},

		["md_fas2_eotech"] = {model = "models/c_fas2_eotech.mdl", pos = Vector(-1.96, -0.85, 0.016), angle = Angle(0, 180, 90), size = Vector(0.92, 0.92, 0.92), bone = "weapon"},
	}
	
	SWEP.M203HoldPos = {
		["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(2.956, -0.082, -1.928), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-3.299, 1.235, -1.79), angle = Angle(-55.446, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.41) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(9.491, 14.793, -15.926) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -9.195, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}	
	
	SWEP.AttachmentPosDependency = {["md_eotech"] = {["md_magnifier_scope"] = Vector(7.745, 7.601, 0.213)},
		["kk_ins2_anpeq15"] = {["md_magnifier_scope"] = Vector(-3.85, -1.185, 0)},	
		["kk_ins2_cstm_microt1"] = {["md_magnifier_scope"] = Vector(0.8, -1.3, 0.019)},
		["kk_ins2_cstm_barska"] = {["md_magnifier_scope"] = Vector(-1.13, -1.22, 0)},
		["md_cybereotechl3"] = {["md_magnifier_scope"] = Vector(-0.57, -1.45, -0.02)},
		["kk_ins2_cstm_compm4s"] = {["md_magnifier_scope"] = Vector(-0.5, -1.285, 0.01)},
		["kk_ins2_aimpoint"] = {["md_magnifier_scope"] = Vector(-0.5, -1.3, 0.025)},
		["kk_ins2_eotech"] = {["md_magnifier_scope"] = Vector(-1.33, -1.245, 0)},
		["kk_ins2_cstm_eotechxps"] = {["md_magnifier_scope"] = Vector(0.6, -1.38, 0)},
		--["larue_mount"] = {["kk_ins2_cstm_barska"] = Vector(-1.35, -1.3, -0.17)},
		--["kk_ins2_cstm_barska"] = {["larue_mount"] = Vector(-1.13, -1.41, 0)},
		["md_fas2_eotech"] = {["md_magnifier_scope"] = Vector(-3.77, -0.85, 0.016)},
	}
	SWEP.AttachmentDependencies = {
		["md_magnifier_scope"] = {
			"md_eotech", "md_cod4_reflex", "kk_ins2_eotech", "md_cybereotechl3", "md_fas2_eotech", "md_eotech_xps_kk", 
			"md_aimpoint", "kk_ins2_cstm_compm4s", "md_fas2_holo", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_aimpoint", "kk_ins2_cstm_microt1"},	
	} 

	SWEP.WS_LaserPosAdjust = Vector(0, 0, 0)
	SWEP.WS_LaserAngAdjust = Angle(0, 90, 0)
	SWEP.WS_DbalPosAdjust = Vector(0.5, 0, 0.5)
	SWEP.WS_DbalAngAdjust = Angle(0, 180, 0)


	SWEP.LaserPosAdjust = Vector(0.3, -0, 0.0)
	SWEP.LaserAngAdjust = Angle(0.0, 0, 0) 
end
SWEP.PSO1AxisAlign = {right = -0, up = 0.4, forward = 90}
SWEP.SightBGs = {main = 2, troysight = 0, foldsight = 1, none = 2}
SWEP.BarrelBGs = {main = 4, regular = 1, long = 2}
SWEP.MagBGs = {main = 3, regular = 0, mp730rndmag = 1, mp740rndmag = 2}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {000, -250}, atts = {"bg_foldsight_mp7", "md_microt1_mp7", "md_eotech", "md_acog"}},
	[2] = {header = "Muzzle", offset = {-575, -150}, atts = {"md_tundra9mm_mp7"}},
	[3] = {header = "Barrel", offset = {-150, 50}, atts = {"bg_heavybarrel"}},
	[4] = {header = "Magazine", offset = {675, 175}, atts = {"bg_mp7_30rndmag", "bg_mp7_40rndmag"}},
	[5] = {header = "More Sights", offset = {600, -750}, atts = {}},
	[6] = {header = "Top Rail", offset = {0, -700}, atts = {}}, 
	[7] = {header = "Left Rail", offset = {-550, -650}, atts = {}}, 
	[8] = {header = "Right Rail", offset = {600, -550}, atts = {}},
	["+reload"] = {header = "Ammo", offset = {-475, 250}, atts = {"am_magnum", "am_matchgrade"}}}
if CustomizableWeaponry_UnluckyWoof then
	table.insert( SWEP.Attachments[1].atts, 4, "md_cybereotechl3" )
	table.insert( SWEP.Attachments[2].atts, 3, "md_cybersil" )
end	
if CustomizableWeaponry_KK_HK416 then
	table.insert( SWEP.Attachments[5].atts, 1, "md_magnifier_scope" )
	table.insert( SWEP.Attachments[8].atts, 1, "md_backup_reflex" )
	table.insert( SWEP.Attachments[1].atts, 3, "md_fas2_eotech" )
end	
if CustomizableWeaponry_G4P_UECW then
	table.insert( SWEP.Attachments[2].atts, 2, "md_csgo_silencer_rifle" )
end	
if CustomizableWeaponry_KK.ins2 then
	table.insert( SWEP.Attachments[1].atts, 3, "kk_ins2_cstm_cmore" )
	table.insert( SWEP.Attachments[1].atts, 4, "kk_ins2_cstm_microt1" )
	table.insert( SWEP.Attachments[1].atts, 5, "kk_ins2_cstm_barska" )
	table.insert( SWEP.Attachments[1].atts, 6, "kk_ins2_cstm_eotechxps" )
	table.insert( SWEP.Attachments[1].atts, 7, "kk_ins2_cstm_compm4s" )
	table.insert( SWEP.Attachments[1].atts, 8, "kk_ins2_cstm_acog" )
	table.insert( SWEP.Attachments[1].atts, 9, "kk_ins2_kobra" )
	table.insert( SWEP.Attachments[1].atts, 10, "kk_ins2_aimpoint" )
	table.insert( SWEP.Attachments[1].atts, 11, "kk_ins2_eotech" )
	table.insert( SWEP.Attachments[1].atts, 12, "kk_ins2_elcan" )
	table.insert( SWEP.Attachments[1].atts, 13, "kk_ins2_po4" )	
	table.insert( SWEP.Attachments[6].atts, 1, "kk_ins2_anpeq15" )
	table.insert( SWEP.Attachments[7].atts, 1, "kk_ins2_flashlight" )
	table.insert( SWEP.Attachments[7].atts, 2, "kk_ins2_lam" )
end	

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload1",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1]= {time = 0.2, sound = "CW_FOLEY_HEAVY"}},
			
	reload1 = {[1] = {time = 0.5, sound = "CW_MP7_MAGOUT"},
	[2] = {time = 1.4, sound = "CW_MP7_MAGIN"},
	[3] = {time = 2.25, sound = "CW_MP7_BOLTBACK"},
	[4] = {time = 2.4, sound = "CW_MP7_BOLTFORWARD"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Heckler & Koch"

SWEP.Author			= "HeX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 80
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_h&k_mp7.mdl"
SWEP.WorldModel		= "models/weapons/w_h&k_mp7.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "4.6x30mm"

SWEP.ADSFireAnim = false
SWEP.FireDelay = 0.06314
SWEP.FireSound = "CW_MP7_FIRE"
SWEP.FireSoundSuppressed = "CW_MP7_FIRE_SUPPRESSED"
SWEP.Recoil = 1.42
SWEP.FullAimViewmodelRecoil = true
SWEP.RecoilToSpread = 2
SWEP.FireMoveMod = 1

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 0.9
SWEP.MaxSpreadInc = 0.55
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.007
SWEP.ReloadTime = 1.85
SWEP.ReloadTime_Empty = 3.5
SWEP.ReloadHalt = 1.85
SWEP.ReloadHalt_Empty = 3.5
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()	

end
function SWEP:RenderTargetFunc()
	if self.ActiveAttachments.kk_ins2_eotech then
		if self.ActiveAttachments.md_magnifier_scope then
			self.AttachmentModelsVM.kk_ins2_anpeq15.pos = Vector(-4.45, -1.185, 0)
		else
			self.AttachmentModelsVM.kk_ins2_anpeq15.pos = Vector(-3.85, -1.185, 0)
		end
	end			
	if self.ActiveAttachments.kk_ins2_cstm_eotechxps then
		if self.ActiveAttachments.md_magnifier_scope then
			self.AttachmentModelsVM.larue_mount.active = true
		else
			self.AttachmentModelsVM.larue_mount.active = false
		end

	elseif self.ActiveAttachments.kk_ins2_cstm_barska then
		if self.ActiveAttachments.md_magnifier_scope then //or self.ActiveAttachments.kk_ins2_anpeq15 
			self.AttachmentModelsVM.larue_mount.active = true
			self.AttachmentModelsVM.kk_ins2_cstm_barska.pos = Vector(-1.13, -1.41, 0)
			self.AttachmentModelsVM.larue_mount.pos = Vector(-1.35, -1.3, -0.17)
		else
			self.AttachmentModelsVM.larue_mount.active = false
			self.AttachmentModelsVM.kk_ins2_cstm_barska.pos = Vector(-0.2, -1.22, 0)
			self.AttachmentModelsVM.larue_mount.pos = Vector(-1, -1.3, -0.17)
		end
	else
		self.AttachmentModelsVM.larue_mount.active = false
	end
end
