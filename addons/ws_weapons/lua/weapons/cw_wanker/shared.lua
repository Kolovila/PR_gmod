if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

util.PrecacheModel("models/weapons/therambotnic09/v_cw2_mk18.mdl")
util.PrecacheModel("models/weapons/therambotnic09/w_cw2_mk18.mdl")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "DD MK18"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_tr09_mk18", "vgui/kills/cw_tr09_mk18_kill", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_tr09_mk18_select")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.6
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = -2, z = -2}
	SWEP.ForeGripOffsetCycle_Draw = 0.6
	SWEP.ForeGripOffsetCycle_Reload = 0.62
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.85
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0.6
	
	SWEP.IronsightPos = Vector(-1.98, -1.5, 0.560)
	SWEP.IronsightAng = Vector(0, 0, 0)
	SWEP.FOVPerShot = 0.2
	
	SWEP.TroySightPos = Vector(-1.985, -2, 0.13)
	SWEP.TroySightAng = Vector(0.35, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.005, 2.5, 0.15)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CmorePos = Vector(-2.01, -1.5, 0.02)
	SWEP.CmoreAng = Vector(0, 0, 0)
	
	SWEP.WS_CMOREPos = Vector(-2, -1.5, -0.03)
	SWEP.WS_CMOREAng = Vector(0, 0, 0)
	
	SWEP.ReflexPos = Vector(-2.02, -1.5, 0.125)
	SWEP.ReflexAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-1.99, -2, 0.27)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.WS_BarskaPos = Vector(-2.04, -1.5, 0.06)
	SWEP.WS_BarskaAng = Vector(0, 0, 0)
	
	SWEP.TrijiconPos = Vector(-1.965, -1.5, 0.08)
	SWEP.TrijiconAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.0, -1, -0.11)
	SWEP.EoTechAng = Vector(0, 0, 0)
		
	SWEP.EoTech553Pos = Vector(-2.015, -1, -0.11)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	SWEP.WS_EoTech557Pos = Vector(-2.015, -1, -0.21)
	SWEP.WS_EoTech557Ang = Vector(0, 0, 0)
	
	SWEP.HoloPos = Vector(-1.98, -0.5, -0.11)
	SWEP.HoloAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.01, -1, 0.12)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.015, -2, 0.48)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-1.98, -1, 0.07)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(-1.975, 0, -0.195)
	SWEP.ELCANAng = Vector(0, 0, 0)
	
	SWEP.WS_ELCANPos = Vector(-1.99, -0.5, -0.32)
	SWEP.WS_ELCANAng = Vector(0, 0, 0)
	SWEP.WS_ELCANAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.ACOG_FixedPos = Vector(-1.99, -0.5, -0.13)
	SWEP.ACOG_FixedAng = Vector(0, 0, 0)
	SWEP.ACOG_FixedAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CSGOACOGPos = Vector(-1.99, -0.5, 0.08)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CoD4ACOGPos = Vector(-1.995, -1, 0.074)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.WS_ACOGPos  = Vector(-2.01, -0.5, 0.01)
	SWEP.WS_ACOGAng = Vector(0 ,0 , 0)
	SWEP.WS_ACOGAxisAlign = {right = -0.05, up = 0.03, forward = -135}
	
	SWEP.LeupoldPos = Vector(-2.015, -1, -0.015)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CSGOSSGPos = Vector(-1.995, -0.5, 0.04)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	SWEP.CSGOSSGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.M203Pos = Vector(-0.55, -2.4, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.BackupReflexPos = Vector(-3.69, 0, 0.89)
	SWEP.BackupReflexAng = Vector(0, 0, -45)
	
	-- *Magnifier Scope Aim Code* --
	SWEP.MagnifierPos = Vector(-1.98, -1, 0)
	SWEP.MagnifierAng = Vector(0, 0, 0)
	SWEP.MagnifierScopeAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.WS_BarskaPos_mag3x = Vector(-2.04, -2, 0.06)
	SWEP.WS_BarskaAng_mag3x = Vector(0, 0, 0)
	
	SWEP.EoTechPos_mag3x = Vector(-2.005, -2, -0.1)
	SWEP.EoTechAng_mag3x = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos_mag3x = Vector(-2.02, -1, -0.11)
	SWEP.EoTech553Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.WS_EoTech557Pos_mag3x = Vector(-2.02, -1, -0.2)
	SWEP.WS_EoTech557Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.HoloPos_mag3x = Vector(-1.98, -1, -0.11)
	SWEP.HoloAng_mag3x = Vector(0, 0, 0)
	
	SWEP.AimpointPos_mag3x = Vector(-2.01, -2, 0.12)
	SWEP.AimpointAng_mag3x = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos_mag3x = Vector(-1.98, -1.5, 0.025)
	SWEP.FAS2AimpointAng_mag3x = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.250, 0, -0.523)
	SWEP.CustomizeAng = Vector(18.015, 32.270, 10)
	
	SWEP.SprintPos = Vector(1, 0, 0)
	SWEP.SprintAng = Vector(-15, 30, -15)
	
	SWEP.AlternativePos = Vector(-0.62, 1, -0.4)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["mk18_acog_fixed"] = {[1] = Vector(-1.99, -1, -1.02), [2] = Vector(0, 0, 0)},
	["md_elcan"] = {[1] = Vector(-1.98, -1.2, -0.96), [2] = Vector(0, -0.1, 0)},
	["md_ws_elcan"] = {[1] = Vector(-1.96, -1, -1.17), [2] = Vector(0, 0.1, 0)},
	["md_ws_acog"] = {[1] = Vector(-1.995, -1.5, -0.72), [2] = Vector(-0.8, 0, 0)}}

	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.CustomizationMenuScale = 0.008
	
	SWEP.BaseArm = "l_forearm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_backup_reflex_rail"] = { type = "Model", model = "models/c_angled_rails.mdl", bone = "gun", rel = "", pos = Vector(0.3, -5.070, 0.24), angle = Angle(0, -90, -90), size = Vector(1.2, 1.2, 1.2)},
		["md_backup_reflex"] = { type = "Model", model = "models/c_docter.mdl", bone = "gun", rel = "", pos = Vector(1.1, -5.95, 0.75), angle = Angle(0, 90, 45), size = Vector(0.82, 0.82, 0.82)},
		["md_magnifier_scope"] = { type = "Model", model = "models/c_magnifier_scope.mdl", bone = "gun", rel = "", pos = Vector(-0.02, -5.9, 0.73), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "gun", rel = "", pos = Vector(0.02, -0.5, 2.225), angle = Angle(0, 90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "gun", rel = "", pos = Vector(0.02, -0.5, 2.225), angle = Angle(0, 90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(0.2, 4.1, -3.33), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun", rel = "", pos = Vector(-0.26, 8.5, -8.89), angle = Angle(3, 90, 0), size = Vector(0.9, 0.9, 0.9)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "gun", rel = "", pos = Vector(0, 2.1, -1.14), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_ws_eotech557"] = {model = "models/attachments/ws_eotech557.mdl", bone = "gun", pos = Vector(0.95, 6.8, -4.58), angle = Angle(0, 90, 0), size = Vector(1.05, 1.05, 1.05)},
		["md_ws_elcan"] = { type = "Model", model = "models/attachments/ws_elcan.mdl", bone = "gun", rel = "", pos = Vector(0.11, 4, -2.25), angle = Angle(0, 90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "gun", rel = "", pos = Vector(-0.330, -15.595, -2.316), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_ws_afg"] = { type = "Model", model = "models/attachments/afg_plane.mdl", bone = "gun", rel = "", pos = Vector(0, -5.906, -1.08), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_ws_grippod"] = {model = "models/attachments/white_snow/ws_grippod.mdl", bone = "gun", rel = "", pos = Vector(-14.49, -6.52, -2.92), angle = Angle(0, -15, 0), size = Vector(2.4, 2.4, 2.4)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "gun", pos = Vector(0, 1.865, -1.75), angle = Angle(0, -180, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_ws_scifi_silencer"] = { type = "Model", model = "models/attachments/White_Snow/ws_scifi_silencer.mdl", bone = "gun", rel = "", pos = Vector(3.495, 29.870, -7.1), angle = Angle(0, -180, 0), size = Vector(1.3, 1.3, 1.3)},
		["md_ws_dbal"] = { type = "Model", model = "models/attachments/White_Snow/ws_dbal.mdl", bone = "gun", rel = "", pos = Vector(1.25, -7.983, 0.223), angle = Angle(0, -90, -90), size = Vector(0.6, 0.6, 0.6)},
		["md_ws_c_more"] = { type = "Model", model = "models/attachments/white_snow/ws_c_more.mdl", bone = "gun", rel = "", pos = Vector(0.06, -1.5, 1.315), angle = Angle(0, 180, 0), size = Vector(0.26, 0.26, 0.26)},
		["md_ws_barska"] = { type = "Model", model = "models/attachments/white_snow/ws_barska.mdl", bone = "gun", rel = "", pos = Vector(0.02, -1.2, 1.3), angle = Angle(0, 180, 0), size = Vector(0.18, 0.18, 0.18)},
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "gun", rel = "", pos = Vector(0, -1.5, 1.18), angle = Angle(0, 180, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "gun", rel = "", pos = Vector(-0.02, -4.1, 0.76), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_fas2_aimpoint"] = {model = "models/c_fas2_aimpoint_rigged.mdl", bone = "gun", rel = "", pos = Vector(-0.03, -4, 0.5), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_fas2_holo_aim"] = {model = "models/v_holo_sight_orig_hx.mdl", bone = "gun", rel = "", pos = Vector(-0.01, 1.6, -2.65), angle = Angle(0, 90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_fas2_holo"] = {model = "models/v_holo_sight_kkrc.mdl", bone = "gun", rel = "", pos = Vector(-0.01, 1.6, -2.65), angle = Angle(0, 90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "gun", rel = "", pos = Vector(0, 2.4, -1.3), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "gun", rel = "", pos = Vector(0.27, 3.2, -3.32), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "gun", rel = "", pos = Vector(0.01, -3.8, 1.44), angle = Angle(0, 180, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "gun", rel = "", pos = Vector(-0.04, -3.1, -1.144), angle = Angle(0, 180, 0), size = Vector(2, 2, 2)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", pos = Vector(-0.02, -1.05, 1.35), angle = Angle(0, 0, 0), size = Vector(0.37, 0.37, 0.37)},
		["mk18_acog_fixed"] = {model = "models/wystan/attachments/2cog.mdl", bone = "gun", pos = Vector(0.29, 3.8, -3.35), angle = Angle(0, -180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_acog_v2"] = {model = "models/v_cod4_acog.mdl", bone = "gun", rel = "", pos = Vector(0, 2, -1.247), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_ws_acog"] = { type = "Model", model = "models/attachments/White_Snow/ws_acog.mdl", bone = "gun", rel = "", pos = Vector(1.890, 10, 2.920), angle = Angle(0, 180, 0), size = Vector(0.95, 0.95, 0.95)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", pos = Vector(0.78, -8.7, 0.223), angle = Angle(0, -90, -90), size = Vector(0.4, 0.4, 0.4)},
		["mk18_bipod"] = { type = "Model", model = "models/attachments/mk18_bipod.mdl", bone = "gun", rel = "", pos = Vector(-0.03, -8.3, -0.93), angle = Angle(0, 90, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "gun", pos = Vector(-1.65, 4.87, 1.565), angle = Angle(0, 90, 0), size = Vector(0.65, 0.65, 0.65), animated = true}
	}
		
	SWEP.M203HoldPos = {
		["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0.7, 0.1, -1.7), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.273, 31.198) },
		["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.807, 4.173, 56.374) },
		["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0.9, -0.22, -1.6), angle = Angle(0, 0, 0) },
		["l_armtwist_4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
		["l_armtwist_3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
		["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 32.676) },
		["l_armtwist_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
		["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.616, -4.147, 23.656) },
		["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.815, 38.255) },
		["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50.317, 27.833, 3.444) },
		["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 4.52, 6.515) },
		["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -20, -10.261) },
		["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10.341, 8.996, 61.457) },
		["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -13.86, 31.634) },
		["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -23.821) },
		["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 5.791, 8.321) },
		["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -76.631, 0) },
		["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 9.673) },
		["l_armtwist_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
		["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11.409, -5.075, 53.347) }
	}
   
	SWEP.ForegripOverridePos = {
		["md_ws_grippod"] = {
			["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.273, 31.198) },
			["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.807, 4.173, 56.374) },
			["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0.9, -0.22, -1.6), angle = Angle(0, 0, 0) },
			["l_armtwist_4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
			["l_armtwist_3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
			["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 32.676) },
			["l_armtwist_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
			["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.616, -4.147, 23.656) },
			["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.815, 38.255) },
			["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50.317, 27.833, 3.444) },
			["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 4.52, 6.515) },
			["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -20, -10.261) },
			["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10.341, 8.996, 61.457) },
			["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -13.86, 31.634) },
			["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -23.821) },
			["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 5.791, 8.321) },
			["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -76.631, 0) },
			["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 9.673) },
			["l_armtwist_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
			["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11.409, -5.075, 53.347) }},
       
		["md_ws_afg"] = {  
			["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0.25, 0, 0.029), angle = Angle(0, 0, -16) },
			["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 41.749) }}
	}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0)
	SWEP.WS_DbalPosAdjust = Vector(0.5, 0, 0.5)
	SWEP.WS_DbalAngAdjust = Angle(0, 180, 0)
end

SWEP.SightBGs = {main = 3, regular = 0, troy = 1, none = 2}
SWEP.TritiumBGs = {main = 2, off = 0, on = 1}
SWEP.MagBGs = {main = 4, regular = 0, pmag = 1, round60 = 2}
SWEP.StockBGs = {main = 5, regular = 0, sturdy = 1, heavy = 2}
SWEP.LuaViewmodelRecoil = true
SWEP.BipodFireAnim = true

function SWEP:IndividualThink()
	if self.ActiveAttachments.troy_sights or self.ActiveAttachments.md_microt1 or self.ActiveAttachments.md_cmore or self.ActiveAttachments.md_ws_c_more or self.ActiveAttachments.md_reflex or self.ActiveAttachments.md_cod4_reflex or self.ActiveAttachments.md_ws_barska or self.ActiveAttachments.md_trijicon or self.ActiveAttachments.md_eotech or self.ActiveAttachments.md_fas2_eotech or self.ActiveAttachments.md_ws_eotech557 or self.ActiveAttachments.md_fas2_holo or self.ActiveAttachments.md_aimpoint or self.ActiveAttachments.md_fas2_aimpoint or self.ActiveAttachments.md_elcan or self.ActiveAttachments.md_ws_elcan or self.ActiveAttachments.md_uecw_csgo_acog or self.ActiveAttachments.md_cod4_acog_v2 or self.ActiveAttachments.md_ws_acog or self.ActiveAttachments.md_fas2_leupold or self.ActiveAttachments.md_uecw_csgo_scope_ssg then
		self:setBodygroup(self.TritiumBGs.main, self.TritiumBGs.off)
	end
	
	if self.dt.State == CW_AIMING then
		self.ViewModelMovementScale = 0.3
	else
		self.ViewModelMovementScale = 1
	end
end

function SWEP:fireAnimFunc()
	local cyc = 0
	local clip = self:Clip1()
		
	if self:isAiming() or self.ActiveAttachments.md_ws_afg or self.ActiveAttachments.md_m203 then
		cyc = 1
	end
		
	if clip > 1 then
		self:sendWeaponAnim("fire",1,cyc)
	end
end

SWEP.AttachmentDependencies = {
	["md_magnifier_scope"] = {"md_eotech", "md_fas2_eotech", "md_fas2_holo", "md_aimpoint", "md_fas2_aimpoint"}}
	
SWEP.AttachmentPosDependency = {
	["md_eotech"] = {["md_magnifier_scope"] = Vector(-0.26, 6.7, -8.89)},
	["md_fas2_eotech"] = {["md_magnifier_scope"] = Vector(-0.02, -6.1, 0.76)},
	["md_fas2_holo"] = {["md_magnifier_scope"] = Vector(-0.01, -0.5, -2.65)},
	["md_aimpoint"] = {["md_magnifier_scope"] = Vector(0.2, 1.5, -3.33)},
	["md_fas2_aimpoint"] = {["md_magnifier_scope"] = Vector(-0.03, -6.4, 0.55)},
}
	
SWEP.AttachmentExclusions = {
	["md_backup_reflex"] = {"md_microt1", "md_fas2_holo", "mk18_acog_fixed"},
	["mk18_tritium"] = {"troy_sights", "md_microt1", "md_cmore", "md_ws_c_more", "md_reflex", "md_cod4_reflex", "md_ws_barska", "md_trijicon", "md_eotech", "md_fas2_eotech", "md_ws_eotech557", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_elcan", "md_ws_elcan", "mk18_acog_fixed", "md_cod4_acog_v2", "md_ws_acog", "md_fas2_leupold", "md_uecw_csgo_scope_ssg"}}

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_G4P_UECW and CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {-250, -450}, atts = {"troy_sights", "md_microt1", "md_cmore", "md_ws_c_more", "md_reflex", "md_cod4_reflex", "md_ws_barska", "md_trijicon", "md_eotech", "md_fas2_eotech", "md_ws_eotech557", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_elcan", "md_ws_elcan", "mk18_acog_fixed"}},
		[2] = {header = "Barrel", offset = {-750, -450}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-750, -20}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-750, 450}, atts = {"md_ws_afg", "md_foregrip", "md_ws_grippod"}},
		[5] = {header = "Hybrid Sights", offset = {250, -20}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
		[6] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[7] = {header = "Tritium", offset = {1200, -70}, atts = {"mk18_tritium"}},
		[8] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {1200, 250}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack and CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {-50, -450}, atts = {"troy_sights", "md_microt1", "md_ws_c_more", "md_cod4_reflex", "md_ws_barska", "md_eotech", "md_fas2_eotech", "md_ws_eotech557", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_ws_elcan", "mk18_acog_fixed", "md_cod4_acog_v2", "md_ws_acog", "md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-600, -450}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-600, -20}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-600, 450}, atts = {"md_ws_afg", "md_foregrip", "md_ws_grippod"}},
		[5] = {header = "Hybrid Sights", offset = {250, -20}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
		[6] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[7] = {header = "Tritium", offset = {1200, -70}, atts = {"mk18_tritium"}},
		[8] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {1200, 250}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_G4P_UECW and CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {-50, -450}, atts = {"troy_sights", "md_microt1", "md_cmore", "md_reflex", "md_cod4_reflex", "md_trijicon", "md_eotech", "md_fas2_eotech", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_elcan", "mk18_acog_fixed", "md_cod4_acog_v2", "md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-600, -450}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-600, -20}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-600, 450}, atts = {"md_foregrip"}},
		[5] = {header = "Hybrid Sights", offset = {250, -20}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
		[6] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[7] = {header = "Tritium", offset = {1200, -70}, atts = {"mk18_tritium"}},
		[8] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {1200, 250}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack and CustomizableWeaponry_G4P_UECW then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {0, -450}, atts = {"troy_sights", "md_microt1", "md_cmore", "md_ws_c_more", "md_reflex", "md_ws_barska", "md_trijicon", "md_eotech", "md_ws_eotech557", "md_aimpoint", "md_elcan", "md_ws_elcan", "mk18_acog_fixed", "md_uecw_csgo_acog", "md_ws_acog", "md_uecw_csgo_scope_ssg"}},
		[2] = {header = "Barrel", offset = {-600, -450}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-600, -20}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-600, 450}, atts = {"md_ws_afg", "md_foregrip", "md_ws_grippod"}},
		[5] = {header = "Magazine", offset = {450, 750}, atts = {"mk18_pmag", "quad_stack60"}},
		[6] = {header = "Tritium", offset = {1300, 100}, atts = {"mk18_tritium"}},
		[7] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {450, -20}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {250, -450}, atts = {"troy_sights", "md_microt1", "md_cod4_reflex", "md_eotech", "md_fas2_eotech", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "mk18_acog_fixed", "md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-500, -450}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-500, -20}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-500, 450}, atts = {"md_foregrip"}},
		[5] = {header = "Hybrid Sights", offset = {250, -20}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
		[6] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[7] = {header = "Tritium", offset = {1200, -70}, atts = {"mk18_tritium"}},
		[8] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {1200, 250}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_G4P_UECW then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {250, -450}, atts = {"troy_sights", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_eotech", "md_aimpoint", "md_elcan", "mk18_acog_fixed"}},
		[2] = {header = "Barrel", offset = {-400, -450}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, -20}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 450}, atts = {"md_foregrip"}},
		[5] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[6] = {header = "Tritium", offset = {1300, 100}, atts = {"mk18_tritium"}},
		[7] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {450, -20}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -450}, atts = {"troy_sights", "md_microt1", "md_ws_c_more", "md_ws_barska", "md_eotech", "md_ws_eotech557", "md_aimpoint", "md_ws_elcan", "mk18_acog_fixed", "md_ws_acog"}},
		[2] = {header = "Barrel", offset = {-400, -450}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-400, -20}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-400, 450}, atts = {"md_ws_afg", "md_foregrip", "md_ws_grippod"}},
		[5] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[6] = {header = "Tritium", offset = {1300, 100}, atts = {"mk18_tritium"}},
		[7] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {450, -20}, atts = {"am_magnum", "am_matchgrade"}}
	}
else
	SWEP.Attachments = {[1] = {header = "Sight", offset = {450, -450}, atts = {"troy_sights", "md_microt1", "md_eotech", "md_aimpoint"}},
		[2] = {header = "Barrel", offset = {-400, -450}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, -20}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 450}, atts = {"md_foregrip"}},
		[5] = {header = "Magazine", offset = {450, 700}, atts = {"mk18_pmag", "quad_stack60"}},
		[6] = {header = "Tritium", offset = {1300, 100}, atts = {"mk18_tritium"}},
		[7] = {header = "Stock", offset = {1200, 700}, atts = {"sturdy_stock", "heavy_stock"}},
		["+reload"] = {header = "Ammo", offset = {450, -20}, atts = {"am_magnum", "am_matchgrade"}}
	}
end
		
SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_MK18_CLOTH"},
	{time = 0.33, sound = "CW_MK18_BOLTPULL"},
	{time = 0.52, sound = "CW_MK18_BOLTRELEASE"}},

	reload = {[1] = {time = 0, sound = "CW_MK18_CLOTH"},
	[2] = {time = 0.42, sound = "CW_MK18_MAGOUT"},
	[3] = {time = 1.5, sound = "CW_MK18_MAGIN"},
	[4] = {time = 2.15, sound = "CW_MK18_BOLTPULL"},
	[5] = {time = 2.33, sound = "CW_MK18_BOLTRELEASE"},
	[6] = {time = 2.7, sound = "CW_MK18_CLOTH"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "2burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rei's sweps"

SWEP.Author		= "TheRambotnic09"
SWEP.Contact		= ""
SWEP.Purpose		= "To kill bad guys. Duh!"
SWEP.Instructions	= "Press your primary PEW-PEW key to kill the bad guys."

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/therambotnic09/v_cw2_mk18.mdl"
SWEP.WorldModel	= "models/weapons/therambotnic09/w_cw2_mk18.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/therambotnic09/w_cw2_mk18.mdl"
SWEP.WMPos = Vector(0, -0.5, -0.5)
SWEP.WMAng = Vector(0, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize	= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic	= true
SWEP.Primary.Ammo		= "5.56x45MM"

SWEP.FireDelay = 60/700
SWEP.FireSound = "CW_MK18_FIRE"
SWEP.FireSoundSuppressed = "CW_MK18_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 70
SWEP.DeployTime = 0.9

SWEP.ReloadSpeed = 0.95
SWEP.ReloadTime = 2
SWEP.ReloadTime_Empty = 3.1
SWEP.ReloadHalt = 2
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true

end