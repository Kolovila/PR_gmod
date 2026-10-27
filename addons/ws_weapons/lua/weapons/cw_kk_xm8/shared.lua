
if CustomizableWeaponry then

	AddCSLuaFile()
	AddCSLuaFile("sh_sounds.lua")
	include("sh_sounds.lua")
	
	util.PrecacheModel("models/weapons/v_cwkk_xm8.mdl")
	util.PrecacheModel("models/weapons/w_cwkk_xm8.mdl")
	util.PrecacheModel("models/weapons/v_cwkk_xm8_2.mdl")
	util.PrecacheModel("models/weapons/w_cwkk_xm8_2.mdl")
	
	local Vec0 = Vector(0,0,0)
	local Vec1 = Vector(1,1,1)
	local Ang0 = Angle(0,0,0)
	
	SWEP.magType = "arMag"
	
	if CLIENT then
		SWEP.DrawCrosshair = false
		SWEP.PrintName = "HK XM8"
		SWEP.CSMuzzleFlashes = true
		SWEP.ViewModelMovementScale = 1.15
		
		SWEP.IconLetter = "w"
		killicon.Add( "cw_kk_xm8", "qq_icons/kills/cw_kk_xm8", Color(255, 80, 0, 150))
		SWEP.SelectIcon = surface.GetTextureID("qq_icons/select/cw_kk_xm8")
		
		SWEP.MuzzleEffect = "muzzleflash_6"
		
		SWEP.SnapToGrip = true
		SWEP.ShellScale = 0.4
		
		SWEP.ForeGripOffsetCycle_Draw = 0
		SWEP.ForeGripOffsetCycle_Reload = 0.8
		SWEP.ForeGripOffsetCycle_Reload_Empty = 0.85
		
		SWEP.M203OffsetCycle_Draw = 0
		SWEP.M203OffsetCycle_Reload = 0.8
		SWEP.M203OffsetCycle_Reload_Empty =  0.85
		
		SWEP.BoltBone = "Bolt"
		SWEP.BoltShootOffset = Vector(-2.553, 0, 0)
		SWEP.OffsetBoltOnBipodShoot = true

		SWEP.BaseArm = "R_Armdummy"
		SWEP.BaseArmBoneOffset = Vector(0, 0, -50)
		
		SWEP.AttachmentModelsVM = {
			-- ["md_cod4_reflex_2"] = {model = "models/v_cod4_reflex.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.045, 4.803), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
			["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.045, 4.803), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
			["md_cod4_eotech_v2"] = {model = "models/v_cod4_eotech.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.045, 4.297), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
			-- /* different model */["md_cod4_eotech_v2"] = {model = "models/v_cod4_eotech.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.045, 4.797), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75), bodygroups = {[2] = 1}},
			-- /* scope replacement */["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "XM8", rel = "", pos = Vector(-2.188, -0.132, 6.446), angle = Angle(90, -90, 0), size = Vector(0.8, 0.8, 0.8), bodygroups = {[1] = 1, [2] = 1}},
			["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.045, 4.719), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
			["md_cod4_acog_v2"] = {model = "models/v_cod4_acog.mdl", bone = "XM8", rel = "", pos = Vector(-2.202, -1.254, 3.388), angle = Angle(90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
			
			["md_fas2_aimpoint"] = {model = "models/c_fas2_aimpoint_rigged.mdl", bone = "XM8", rel = "", pos = Vector(-2.218, -2.869, -1.611), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1), bodygroups = {[2] = 5,[3] = 3}},
			["md_fas2_eotech"] = {model = "models/c_fas2_eotech.mdl", bone = "XM8", rel = "", pos = Vector(-2.218, -3.053, -1.821), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1)},
			["md_fas2_eotech_stencil"] = {model = "models/c_fas2_eotech_stencil.mdl", bone = "XM8", rel = "", pos = Vector(-2.218, -3.053, -1.821), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1)},
			["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "XM8", rel = "", pos = Vector(-2.191, -4.387, 2.845), angle = Angle(-90, 90, 0), size = Vector(1.6, 1.6, 1.6)},
			["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "XM8", rel = "", pos = Vector(-2.191, -4.387, 2.695), angle = Angle(-90, 90, 0), size = Vector(1.6, 1.6, 1.6), bodygroups = {[1] = 2}},
			["md_fas2_leupold_mount_2"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "XM8", rel = "", pos = Vector(-2.191, -4.387, 0.195), angle = Angle(-90, 90, 0), size = Vector(1.6, 1.6, 1.6), bodygroups = {[1] = 2}},
			
			["md_fas2_holo"] = {model = "models/v_holo_sight_kkrc.mdl", bone = "XM8", rel = "", pos = Vector(-2.208, 0.365, 3.47), angle = Angle(-90, 90, 0), size = Vector(0.699, 0.699, 0.699)},
			["md_fas2_holo_aim"] = {model = "models/v_holo_sight_orig_hx.mdl", bone = "XM8", rel = "", pos = Vector(-2.208, 0.365, 3.47), angle = Angle(-90, 90, 0), size = Vector(0.699, 0.699, 0.699)},

			["md_magnifier_scope"] = {model = "models/c_magnifier_scope.mdl", bone = "XM8", rel = "", pos = Vector(-2.214, -3.09, -3.307), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1)},
			["md_eotech_xps_kk"] = {model = "models/c_ins2_eotech_xps.mdl", bone = "XM8", rel = "", pos = Vector(-2.224, -3.09, -3.563), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1)},

			["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "XM8", rel = "", pos = Vector(-2.201, -2.902, -0.32), angle = Angle(0, 0, 90), size = Vector(0.6, 0.6, 0.6)},
			["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "XM8", rel = "", pos = Vector(-2.586, 1.965, -15.007), angle = Angle(0, 0, -90), size = Vector(0.699, 0.699, 0.699)},
			["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "XM8", rel = "", pos = Vector(-1.551, -1.397, -4.364), angle = Angle(90, 0, 180), size = Vector(0.55, 0.55, 0.55)},
			["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "XM8", rel = "", pos = Vector(-4.074, -3.004, 7.943), angle = Angle(-90, 90, 0), size = Vector(0.8, 0.8, 0.8), animated = true},
			["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "XM8", rel = "", pos = Vector(-2.28, 0, -9.625), angle = Angle(0, 180, 90), size = Vector(0.8, 0.8, 0.8)},
		}
		
		SWEP.CompM4SBoneMod = { // bonemod uses SCK OUTPUT form
			["front01"] = { scale = Vec1, pos = Vec0, angle = Angle(-85, 0, 0) },
			["rear01"] = { scale = Vec1, pos = Vec0, angle = Angle(-45, 0, 0) },
			["rear02"] = { scale = Vec1, pos = Vec0, angle = Angle(0, 0, 10) },
		}
		
		SWEP.M203HoldPos = {
			["R_Armdummy"] = {pos = Vector(0.781, -0.212, -1.777), angle = Angle(0, 0, 0)}
		}

		SWEP.ForeGripHoldPos = {
			-- ["stock"] = { scale = Vector(1, 1, 1), pos = Vector(-2, 0, 0), angle = Angle(0, 0, 0) },
			["R_Forearm"] = {pos = Vector(0.05, 0.993, 2.934), angle = Angle(24.658, 2.414, -73.983) },
			["R_Pinky2"] = {pos = Vector(0, 0, 0), angle = Angle(13.383, 0, 0) },
			["R_Thumb1"] = {pos = Vector(0, 0, 0), angle = Angle(-17.209, 20.82, -11.589) },
			["R_Thumb2"] = {pos = Vector(0, 0, 0), angle = Angle(5, 0, 0) },
			["R_Thumb3"] = {pos = Vector(0, 0, 0), angle = Angle(5, 50, 0) },
			["R_Pinky1"] = {pos = Vector(0, 0, 0), angle = Angle(15.378, 0, 0) },
			["R_Wrist"] = {pos = Vector(0, 0, 0), angle = Angle(-5.926, -9.929, -16.143) },
			["R_Mid1"] = {pos = Vector(0, 0, 0), angle = Angle(-25.55, 0, 0) },
			["R_Index1"] = {pos = Vector(0, 0, 0), angle = Angle(-27.022, 0, 0) },
			["R_Index2"] = {pos = Vector(0, 0, 0), angle = Angle(-19.612, 0, 0) },
			["R_Ring1"] = {pos = Vector(0, 0, 0), angle = Angle(-6.483, 0, 0) }
		}
		
		SWEP.ForegripOverridePos = {
			["bg_kk_xm8_foregrip_compact"] = {
				["R_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(-2, 0, 0), angle = Angle(0, 0, 0) },
				-- ["stock"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
			},
			
			["bg_kk_xm8_stock_compact"] = {
				-- ["stock"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
			},
			
			["bipod_active"] = {
				-- ["stock"] = { scale = Vector(1, 1, 1), pos = Vector(-2, 0, 0), angle = Angle(0, 0, 0) },
				["R_Mid1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(9.446, 0, 0) },
				["R_Ring3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(41.541, 0, 0) },
				["R_Thumb1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.51, -5.369, 0) },
				["R_Pinky2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20.486, 0, 0) },
				["R_Pinky1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(38.275, 0, 0) },
				["R_Pinky3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(41.332, 0, 0) },
				["R_Index1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.535, 0, 0) },
				["R_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(-11.664, 0, -3), angle = Angle(0, 0, 0) },
				["R_Mid2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(37.805, 0, 0) },
				["R_Index2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(42.159, 0, 0) },
				["R_Thumb3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
				["R_Ring2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(31.173, 0, 0) },
				["R_Ring1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(18.656, 0, 0) }
			}
		}
		
		SWEP.AttachmentPosDependency = {
			["md_saker"] = {
				["bg_kk_xm8_foregrip_long"] = Vector(-2.201, -2.902, -4.871),
				["bg_kk_xm8_foregrip_compact"] = Vector(-2.201, -2.902, 2.584),
			} 
		}
		
		SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
		
		SWEP.LaserPosAdjust = Vector(-0.8, -5, 0.4)
		SWEP.LaserAngAdjust = Angle(0, 180, 0)
		
		SWEP.XM8ScopePos = Vector(2.352, -4, -0.045)
		SWEP.XM8ScopeAng = Vector(0.136, 0.067, 0)

		SWEP.RailedAimPos = Vector(2.378, -2, 0.075)
		SWEP.RailedAimAng = Vector(0.097, -0.015, 0)
		
		SWEP.CoD4ReflexPos = Vector(2.364, -5, -0.565)
		SWEP.CoD4ReflexAng = Vector(0, -0.047, 0)
		
		SWEP.EoTech552Pos = Vector(2.34, -5, -0.71)
		SWEP.EoTech552Ang = Vector(-0.644, -0.292, 0)
		
		SWEP.CoD4TascoPos = Vector(2.372, -4, -0.29)
		SWEP.CoD4TascoAng = Vector(-0.018, -0.109, 0)
		
		SWEP.FAS2AimpointPos = Vector(2.369, -5, -0.539)
		SWEP.FAS2AimpointAng = Vector(-0.231, 0.041, 0)
		
		SWEP.CoD4ACOGPos = Vector(2.369, -5.5, -0.635)
		SWEP.CoD4ACOGAng = Vector(-0.105, -0.093, 0)
		
		SWEP.LeupoldPos = Vector(2.384, -4, -0.603)
		SWEP.LeupoldAng = Vector(0, 0, 0)
		
		SWEP.HoloPos = Vector(2.357, -3.5, -0.823)
		SWEP.HoloAng = Vector(0.032, -0.029, 0)
		
		SWEP.AlternativePos = Vector(-0.601, 0, 0.36)
		SWEP.AlternativeAng = Vector(0, 0, 0)
		
		SWEP.CustomizePos = Vector(-5.54, -1, -0.764)
		SWEP.CustomizeAng = Vector(21.302, -28.997, -18.444)
		
		SWEP.SprintPos = Vector(-2.161, -0.621, -1.081)
		SWEP.SprintAng = Vector(-15.775, -42.013, 26.052)
			
		SWEP.M203Pos = Vector(-0.16, 0, 0.801)
		SWEP.M203Ang = Vector(0, -1.043, 1.19)

		SWEP.EoTech553Pos = Vector(2.375, -5, -0.817)
		SWEP.EoTech553Ang = Vector(0, 0, 0)
			
		-- SWEP.MagnifierPos = Vector(2.365, -5, -0.853)
		-- SWEP.MagnifierAng = Vector(2.184, -0.15, 0)
				
		SWEP.MagnifierPos = Vector(2.365, -5, -0.7811)
		SWEP.MagnifierAng = Vector(0, -0.15, 0)

		SWEP.EoTechXPSPos = Vector(2.358, -5, -0.89)
		SWEP.EoTechXPSAng = Vector(2.184, -0.071, 0)
			
		SWEP.IronsightPos = SWEP.XM8ScopePos
		SWEP.IronsightAng = SWEP.XM8ScopeAng
			
		SWEP.AimSwayIntensity = 0.6
		
		SWEP.CustomizationMenuScale = 0.013
		
		SWEP.WorldShellEjectionAttachmentID = 5
	end
	
	SWEP.BarrelBGs		= {main = 2, ass = 0, ass_sd = 1, compact = 2, compact_sd = 3, dmr = 4, dmr_sd = 5, none = 6}
	SWEP.MagBGs			= {main = 3, regular = 0, regular_empty = 1, round100 = 2, round100_empty = 3, none = 4}
	SWEP.ReceiverBGs	= {main = 4, regular = 0, railed = 1, none = 3}
	SWEP.IronsightBGs	= {main = 5, assault = 1, compact = 2, scope_idle = 3, scope_aim = 4, scope_aim_trans = 5, none = 0}
	SWEP.HandsBGs		= {main = 6, regular = 0, none = 1}
	SWEP.StockBGs		= {main = 7, regular = 0, compact = 2, heavy = 3, none = 4}

	SWEP.LuaViewmodelRecoil = true
	
	if CustomizableWeaponry_KK_HK416 then
		SWEP.Attachments = {
			{header = "Sight", offset = {500, -500}, atts = {"md_cod4_reflex", "md_cod4_eotech_v2", "md_fas2_eotech", "md_eotech_xps_kk", "md_fas2_holo", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_cod4_acog_v2", "md_fas2_leupold", "bg_kk_xm8_reticle1", "bg_kk_xm8_reticle2", "bg_kk_xm8_reticle3", "bg_kk_xm8_reticle4", "bg_kk_xm8_reticle5"}},
			{header = "Handguard w/ Barrel", offset = {-100, -500}, atts = {"bg_kk_xm8_foregrip_long", "bg_kk_xm8_foregrip_compact"}},
			{header = "Barrel ext", offset = {-600, -500}, atts = {"md_saker", "bg_hk416_silencer"}},
			{header = "Under Barrel", offset = {-600, -75}, atts = {"md_foregrip", "md_hk416_bipod", "md_m203"}},
			{header = "Magazine", offset = {-600, 375}, atts = {"bg_hk416_cmag"}, exclusions = {md_m203 = true}},
			{header = "Receiver", offset = {-50, 475}, atts = {"bg_kk_xm8_receiver_railed"}},
			{header = "Stock", offset = {750, 75}, atts = {"bg_kk_xm8_stock_heavy", "bg_kk_xm8_stock_compact"}},
			{header = "Extras", offset = {0, -10}, atts = {"md_anpeq15", "md_magnifier_scope"}},
			{header = "Body", offset = {550, 475}, atts = {"bg_kk_xm8_paint1", "bg_kk_xm8_paint2", "bg_kk_xm8_paint3", "bg_kk_xm8_paint4"}},
			["+reload"] = {header = "Ammo", offset = {1050, -75}, atts = {"am_magnum", "am_matchgrade"}},
		}
	else
		SWEP.Attachments = {
			{header = "Sight", offset = {600, -500}, atts = {"bg_kk_xm8_reticle2", "bg_kk_xm8_reticle3", "bg_kk_xm8_reticle4", "bg_kk_xm8_reticle5"}, exclusions = {bg_kk_xm8_receiver_railed = true}},
			{header = "Handguard w/ Barrel", offset = {-100, -500}, atts = {"bg_kk_xm8_foregrip_long", "bg_kk_xm8_foregrip_compact"}},
			{header = "Barrel ext", offset = {-600, -500}, atts = {"md_saker"}},
			{header = "Under Barrel", offset = {-600, -75}, atts = {"md_foregrip", "md_m203"}},
			{header = "Receiver", offset = {-50, 475}, atts = {"bg_kk_xm8_receiver_railed"}},
			{header = "Stock", offset = {700, 75}, atts = {"bg_kk_xm8_stock_heavy", "bg_kk_xm8_stock_compact"}},
			{header = "Laser", offset = {0, -10}, atts = {"md_anpeq15"}},
			{header = "Body", offset = {550, 475}, atts = {"bg_kk_xm8_paint1", "bg_kk_xm8_paint2", "bg_kk_xm8_paint3", "bg_kk_xm8_paint4"}},
			["+reload"] = {header = "Ammo", offset = {1050, -75}, atts = {"am_magnum", "am_matchgrade"}},
		}
	end
	
	if CustomizableWeaponry_KK_EXTRA then
	end
	
	SWEP.AttachmentDependencies = {
		["md_cod4_reflex"] = {"bg_kk_xm8_receiver_railed"},
		["md_cod4_reflex_2"] = {"bg_kk_xm8_receiver_railed"},
		["md_cod4_eotech_v2"] = {"bg_kk_xm8_receiver_railed"},
		["md_cod4_aimpoint_v2"] = {"bg_kk_xm8_receiver_railed"},
		["md_cod4_acog_v2"] = {"bg_kk_xm8_receiver_railed"},
		["md_fas2_aimpoint"] = {"bg_kk_xm8_receiver_railed"},
		["md_fas2_leupold"] = {"bg_kk_xm8_receiver_railed"},
		["md_fas2_holo"] = {"bg_kk_xm8_receiver_railed"},
		["md_fas2_eotech"] = {"bg_kk_xm8_receiver_railed"},
		["md_eotech_xps_kk"] = {"bg_kk_xm8_receiver_railed"},
		["md_magnifier_scope"] = {"bg_kk_xm8_receiver_railed" and "md_eotech_xps_kk"},
	}

	SWEP.AttachmentExclusions = {
		["bg_kk_xm8_reticle1"] = {"bg_kk_xm8_receiver_railed"},
		["bg_kk_xm8_reticle2"] = {"bg_kk_xm8_receiver_railed"},
		["bg_kk_xm8_reticle3"] = {"bg_kk_xm8_receiver_railed"},
		["bg_kk_xm8_reticle4"] = {"bg_kk_xm8_receiver_railed"},
		["bg_kk_xm8_reticle5"] = {"bg_kk_xm8_receiver_railed"},
		["md_hk416_bipod"] = {"bg_kk_xm8_foregrip_compact"},
		["md_m203"] = {"bg_kk_xm8_foregrip_compact"},
	}

	SWEP.Animations = {
		fire = {"shoot1", "shoot2", "shoot3"},
		reload_empty = "reload",
		reload = "reload_tacticool",
		idle = "idle",
		draw = "draw"
	}
		
	SWEP.Sounds = {
		reload = {
			[1] = {time = 0, sound = "CW_KK_XM8_DRAW"},
			[2] = {time = 0.543, sound = "CW_KK_XM8_MAGOUT"},
			[3] = {time = 1.4857, sound = "CW_KK_XM8_DRAW"},
			[4] = {time = 1.8, sound = "CW_KK_XM8_MAGFIDDLE"},
			[5] = {time = 2.171, sound = "CW_KK_XM8_MAGIN"},
			[6] = {time = 2.914, sound = "CW_KK_XM8_BOLTBACK"},
			[7] = {time = 3.2714, sound = "CW_KK_XM8_BOLTFORWARD"}
		},
		
		reload_tacticool = {
			[1] = {time = 0, sound = "CW_KK_XM8_DRAW"},
			[2] = {time = 0.543, sound = "CW_KK_XM8_MAGOUT"},
			[3] = {time = 1.4857, sound = "CW_KK_XM8_DRAW"},
			[4] = {time = 1.8, sound = "CW_KK_XM8_MAGFIDDLE"},
			[5] = {time = 2.171, sound = "CW_KK_XM8_MAGIN"},
		},
		
		draw = {
			[1] = {time = 0, sound = "CW_KK_XM8_DRAW"},
			[2] = {time = 0.466, sound = "CW_KK_XM8_SAFETY"}
		}
	}

	SWEP.SpeedDec = 30

	SWEP.Slot = 3
	SWEP.SlotPos = 0
	SWEP.NormalHoldType = "ar2"
	SWEP.RunHoldType = "passive"
	SWEP.FireModes = {"auto", "semi"}
	SWEP.Base = "cw_base"
	SWEP.Category = "CW 2.0"

	SWEP.Author			= "Spy & Knife Kitty"
	SWEP.Contact		= ""
	SWEP.Purpose		= ""
	SWEP.Instructions	= ""

	SWEP.ViewModelFOV	= 70
	SWEP.ViewModelFlip	= true
	SWEP.ViewModel		= "models/weapons/v_cwkk_xm8.mdl"
	SWEP.WorldModel		= "models/weapons/w_cwkk_xm8.mdl"
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_cwkk_xm8.mdl"
	SWEP.WMPos = Vector(0,0,0)
	SWEP.WMAng = Vector(-5,1,180)

	SWEP.Spawnable			= true
	SWEP.AdminSpawnable		= true

	SWEP.Primary.ClipSize		= 30
	SWEP.Primary.DefaultClip	= 30
	SWEP.Primary.Automatic		= true
	SWEP.Primary.Ammo			= "5.56x45MM"

	SWEP.FireDelay = 0.066666666666667
	SWEP.FireSound = "CW_KK_XM8_FIRE"
	SWEP.FireSoundSuppressed = "CW_KK_XM8_FIRE_SUPPRESSED"
	SWEP.Recoil = 0.85

	SWEP.HipSpread = 0.045
	SWEP.AimSpread = 0.003
	SWEP.VelocitySensitivity = 1.8
	SWEP.MaxSpreadInc = 0.04
	SWEP.SpreadPerShot = 0.007
	SWEP.SpreadCooldown = 0.13
	SWEP.Shots = 1
	SWEP.Damage = 30
	SWEP.DeployTime = 0.6

	SWEP.ReloadSpeed = 1
	SWEP.ReloadTime = 2.2
	SWEP.ReloadTime_Empty = 3.2
	SWEP.ReloadHalt = 2.5
	SWEP.ReloadHalt_Empty = 3.5

	function SWEP:IndividualThink()
	end
	
	if CLIENT then
		function SWEP:getMuzzlePosition()
			if self.CustomizeMenuAlpha > 0 then 
				return self.CW_VM:GetAttachment(1)
			end
		
			// 1 - default barrel, 2 - shell, 3 - short barrel, 4 - long barrel
			if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
				self.MuzzleAttachmentName = "muzzle_short"
				return self.CW_VM:GetAttachment(3)
			elseif self.ActiveAttachments.bg_kk_xm8_foregrip_long then
				self.MuzzleAttachmentName = "muzzle_long"
				return self.CW_VM:GetAttachment(4)
			else
				self.MuzzleAttachmentName = "1"
				return self.CW_VM:GetAttachment(1)
			end
		end

		local scopeInit = true
		local cd = {}
		cd.x = 0
		cd.y = 0
		cd.w = 512
		cd.h = 512
		cd.fov = 22
		cd.drawviewmodel = false
		cd.drawhud = false
		cd.dopostprocess = false
		
		SWEP.XM8TSGlass = Material("models/qq_rec/v_rif_xm8/rt")
		SWEP.XM8TSGlassSimple = Material("models/qq_rec/v_rif_xm8/rt_trans")
		SWEP.XM8ScopeRT = GetRenderTarget("xm8_scope_rt", 512, 512, false)		
		local reticleTextures = {
			[1] = surface.GetTextureID("models/qq_rec/v_rif_xm8/fake"),
			[2] = surface.GetTextureID("qq_sprites/bigdot_xm8"),
			["bg_kk_xm8_reticle1"] = surface.GetTextureID("qq_sprites/circledot"),
			["bg_kk_xm8_reticle2"] = surface.GetTextureID("qq_sprites/circlecross"),
			["bg_kk_xm8_reticle3"] = surface.GetTextureID("qq_sprites/bigcircle"),
			["bg_kk_xm8_reticle4"] = surface.GetTextureID("qq_sprites/kobra"),
			["bg_kk_xm8_reticle5"] = surface.GetTextureID("qq_sprites/chevron"),
		}

		function SWEP:RenderTargetFunc()
			if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
				self.WorldMuzzleAttachmentID = 3
			elseif self.ActiveAttachments.bg_kk_xm8_foregrip_long then
				self.WorldMuzzleAttachmentID = 2
			else
				self.WorldMuzzleAttachmentID = 1
			end

			local wm = self.WMEnt
			self:getMuzzlePosition()
			
			-- if self.dt.Suppressed then
			if self.ActiveAttachments.bg_hk416_silencer then
				if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.compact_sd)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.compact_sd)
				elseif self.ActiveAttachments.bg_kk_xm8_foregrip_long then
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.dmr_sd)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.dmr_sd)
				else
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.ass_sd)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.ass_sd)
				end
			else
				if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.compact)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.compact)
				elseif self.ActiveAttachments.bg_kk_xm8_foregrip_long then
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.dmr)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.dmr)
				else
					self:setBodygroup(self.BarrelBGs.main,self.BarrelBGs.ass)
					wm:SetBodygroup(self.BarrelBGs.main,self.BarrelBGs.ass)
				end
			end
			
			local vm = self.CW_VM
			if self:isAiming() then		//if you aim right after reloading non-empty, idle animation phucks up aiming
				vm:SetCycle(1)
			end
			
			local cycle = vm:GetCycle()
			local reloading = self.Sequence == self.Animations.reload_empty
			
			if (reloading and cycle < 1) then		//and here, HK disappointed me as the charging handle and bolt arent separate parts
				self:setBodygroup(1,0)
			else
				self:setBodygroup(1,1)
			end
				
			local loaded, empty
			if self.ActiveAttachments.bg_hk416_cmag then
				loaded = self.MagBGs.round100
				empty = self.MagBGs.round100_empty
			else
				loaded = self.MagBGs.regular
				empty = self.MagBGs.regular_empty
			end
			
			local cycle = self.CW_VM:GetCycle()
			local lowAmmo = self:Clip1() < 2
			
			local reloadingEmpty = (self.Sequence == self.Animations.reload_empty) and cycle < 0.3
			local pullingEmptyMag = (self.Sequence == self.Animations.reload) and lowAmmo and cycle < 0.3
			local idleEmpty = (self.Sequence != self.Animations.reload_empty) and (self.Sequence != self.Animations.reload) and lowAmmo
			
			if reloadingEmpty or pullingEmptyMag or idleEmpty then		//mag bullets	
				self:setBodygroup(self.MagBGs.main,empty)
				wm:SetBodygroup(self.MagBGs.main,empty)
			else
				self:setBodygroup(self.MagBGs.main,loaded)
				wm:SetBodygroup(self.MagBGs.main,loaded)
			end
			
			if not magBone then 
				magBone = self.CW_VM:LookupBone("MAG")
			else
				if self.unloadedMagazine and (cycle < 0.3 or cycle == 1) then
					self.CW_VM:ManipulateBoneScale(magBone, Vec0)
				else
					self.CW_VM:ManipulateBoneScale(magBone, Vec1)
				end
			end
			
			if self.ActiveAttachments.bg_kk_xm8_receiver_railed then
				self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.railed)
				wm:SetBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.railed)
				self.AimSwayIntensity = 0.6
				
				if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
					self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.compact)
					wm:SetBodygroup(self.IronsightBGs.main,self.IronsightBGs.compact)
				else
					self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.assault)
					wm:SetBodygroup(self.IronsightBGs.main,self.IronsightBGs.assault)
				end
			else
				self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.regular)
				wm:SetBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.regular)
				wm:SetBodygroup(self.IronsightBGs.main,self.IronsightBGs.none)
				-- self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.none)
				
				if self:canSeeThroughTelescopics("XM8ScopePos") then
					-- local complex = self:canUseComplexTelescopics()
					local complex = true // coz simple sux and its inaccurate
				
					local retMod = self:getActiveAttachmentInCategory(1)
					local reticleTexture
					
					if retMod then
						reticleTexture = reticleTextures[retMod]
						rc = self:getSightColor(retMod)
					else
						reticleTexture = reticleTextures[2]
						rc = Color(255,0,0,255)
					end
					
					local old, x, y, ang
		
					// old rt
					x, y = ScrW(), ScrH()
					old = render.GetRenderTarget()
				
					if self.freeAimOn then
						ang = self:getTelescopeAngles()
					else
						ang = self:getReticleAngles() // fug everyone, this is the best way 2 go
					end
		
					ang.r = -self.BlendAng.z
					
					cd.angles = ang
					cd.origin = self.Owner:GetShootPos()
					
					render.SetRenderTarget(self.XM8ScopeRT)
					render.SetViewPort(0, 0, 512, 512)
						if complex then
							render.RenderView(cd)
							self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.scope_aim)
							self.AimSwayIntensity = 0.15
						elseif scopeInit then
							render.RenderView()
							render.Clear(0,0,0,0,false,false)
							scopeInit = false
						else
							render.Clear(0,0,0,0,false,false)
							self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.scope_aim_trans)
							self.AimSwayIntensity = 0
						end
						
						ang = self.Owner:EyeAngles()
						ang.p = ang.p + self.BlendAng.x
						ang.y = ang.y + self.BlendAng.y
						ang.r = ang.r + self.BlendAng.z
						ang = -ang:Forward()
						
						cam.Start2D()
							surface.SetDrawColor(rc.r, rc.g, rc.b, 255)
							surface.SetTexture(reticleTexture)
							surface.DrawTexturedRect(192, 192, 128, 128)
							
							if retMod == nil then
								surface.SetDrawColor(255, 255, 255, 255)
								surface.SetTexture(reticleTexture)
								surface.DrawTexturedRect(224, 224, 64, 64)
							end
						
							surface.SetDrawColor(255, 255, 255, 255)
							surface.SetTexture(reticleTextures[1])
							surface.DrawTexturedRect(0, 0, 512, 512)
						cam.End2D()
					
					// restore old rt
					render.SetViewPort(0, 0, x, y)
					render.SetRenderTarget(old)

					if complex then
						if self.XM8TSGlass then
							self.XM8TSGlass:SetTexture("$basetexture", self.XM8ScopeRT)
						end
					else
						if self.XM8TSGlassSimple then
							self.XM8TSGlassSimple:SetTexture("$basetexture", self.XM8ScopeRT)
						end
					end
				else
					self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.scope_idle)
				end
			end
			
			-- if cycle == 0 and self.Sequence == self.Animations.draw then
				-- local md_fas2_aimpoint_rear = math.random(4) - 1
				-- if md_fas2_aimpoint_rear == 3 then
					-- md_fas2_aimpoint_rear = 6
				-- end
				-- local md_fas2_aimpoint_front = math.random(3) - 1
				-- if md_fas2_aimpoint_front == 2 then
					-- md_fas2_aimpoint_front = 3
				-- end
				-- local ard = math.random(2) - 1
				
				-- local md_fas2_aimpoint_rear = math.random(3) - 1
				-- local md_fas2_aimpoint_front = math.random(2) - 1
				-- local ard = 0
				
				-- local md_fas2_aimpoint_rear = 6
				-- local md_fas2_aimpoint_front = 3
				-- local ard = 1
				
				-- self.AttachmentModelsVM.md_fas2_aimpoint.ent:SetBodygroup(2, md_fas2_aimpoint_rear)
				-- self.AttachmentModelsVM.md_fas2_aimpoint.ent:SetBodygroup(3, md_fas2_aimpoint_front)
				-- self.AttachmentModelsVM.md_fas2_aimpoint.ent:SetBodygroup(5, ard)
			-- end
			
			self.ForegripOverride = false
			if self.ActiveAttachments.md_foregrip or self.ActiveAttachments.md_m203 then
				return
			elseif self.ActiveAttachments.md_hk416_bipod and self.dt.BipodDeployed then
				self.ForegripParent = "bipod_active"
				self.ForegripOverride = true
				return
			end	
			
			if self.ActiveAttachments.bg_kk_xm8_foregrip_compact then
				self.ForegripParent = "bg_kk_xm8_foregrip_compact"
				self.ForegripOverride = true
			end
		end
	end
end