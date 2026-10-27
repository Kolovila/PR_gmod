AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HK416A5"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("entities/cw_hk416a5")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -.7}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.7
	
	SWEP.IronsightPos = Vector(-3.898, -3, 1.16)
	SWEP.IronsightAng = Vector(-0.08, -0.036, 0)

	SWEP.MicroT1Pos = Vector(-3.921, -1, 1.187)
	SWEP.MicroT1Ang = Vector(0, -0.051, 0)
	
	SWEP.ACOGPos = Vector(-3.895, -2, 0.8)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-3.815, -3.5, 1.08)
	SWEP.ShortDotAng = Vector(2.282, 0.296, 0)
	
	SWEP.EFTEXPS32Pos = Vector(-3.87, 0, 0.65) --EFT
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)
	
	SWEP.EFTG33Pos = Vector(-3.87, -2, 0.65) --EFT
	SWEP.EFTG33Ang = Vector(0, 0, 0)
	
	SWEP.EFTUH1Pos = Vector(-3.87, -1, 0.65) --EFT
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
	
	SWEP.EFTElcanPos = Vector(-3.87, -3, 0.76) --EFT
	SWEP.EFTElcanAng = Vector(0, 0, 0)
	
    SWEP.EFTACOGTA01Pos = Vector(-3.87, -3, 0.76) --EFT
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)
	
	SWEP.EFTHAMRPos = Vector(-3.87, -3.2, 0.69) --EFT
	SWEP.EFTHAMRAng = Vector(0, 0, 0)
	
	SWEP.EFTDPmountPos = Vector(-3.87, -3.2, -0.69) --EFT
	SWEP.EFTDPmountAng = Vector(0, 0, 0)
	
	SWEP.EFTCOMPM4Pos = Vector(-3.87, -1, 1.14) --EFT
	SWEP.EFTCOMPM4Ang = Vector(0, 0, 0)
	
	SWEP.EFTEKPPos = Vector(-3.87, -1, 0.5) --EFT
	SWEP.EFTEKPAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-1, -0.6, 0.7)
	SWEP.AlternativeAng = Vector(0, 0, -4)
	
	SWEP.BackupReflexPos = Vector(-4.94, -2, 1.5)
	SWEP.BackupReflexAng = Vector(-0.23, 0.07, -45)
	
	SWEP.MagnifierPos = Vector(-3.915, -2, 1.27)
	SWEP.MagnifierAng = Vector(-1.11, -0.095, 0)
	
	--SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.908, 0, -0.529), [2] = Vector(0, 0, 0)}}

	--SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	--SWEP.M203Ang = Vector(0, 0, 0)

	--SWEP.M203OffsetCycle_Reload = 0.65
	--SWEP.M203OffsetCycle_Reload_Empty = 0.73
	--SWEP.M203OffsetCycle_Draw = 0
	--SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}

	--SWEP.M203HoldPos = {
		--["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(4.034, 0.331, -2.458), angle = Angle(0, 0, 0)}
	--}
	
	SWEP.ACOGAxisAlign = {right = -0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2.3, up = -0.3, forward = 0}
		
	SWEP.LaserPosAdjust = Vector(0, 0, -0.4)
	SWEP.LaserAngAdjust = Angle(0, 0.1, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0.2, 2.25), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 2.5, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0.2, 2.2), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 2.5, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_si_g33_tan"] = {model = "models/weapons/cw_eft/upgrades/reflex/g33/c_eotech_g33_tan.mdl", bone = "m416_d", rel = "", pos = Vector(-0.05, 5.35, 1.7), angle = Angle(0, -90, 0), adjustment = {min = 5.35, max = 10, axis = "y", inverseOffsetCalc = true}, size = Vector(1.5, 1.5, 1.5)},
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0.2, 2.2), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 2.5, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_si_elcan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/v_elcan.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0, 2.2), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 3.5, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_si_m4"] = {model = "models/weapons/cw_eft/upgrades/scopes/comp_m4/v_m4.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0.2, 2.25), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 2.5, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, 0, 2.2), angle = Angle(0, -90, 0), adjustment = {min = -1.7, max = 3.5, axis = "y", inverseOffsetCalc = true}, size = Vector(0.98, 0.98, 0.98)},
		["md_eft_si_hamr"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/hamr/v_hamr.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, -1, 2.2), angle = Angle(0, -90, 0),size = Vector(0.98, 0.98, 0.98)},
		["md_eft_si_dp_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp_wo_mount.mdl", bone = "m416_d", rel = "", pos = Vector(-0.06, -0.3, 4.2), angle = Angle(0, -90, 0),size = Vector(0.98, 0.98, 0.98)},

		["md_eft_fg_cqr"] = {model = "models/weapons/cw_eft/upgrades/foregrips/cqr/v_cqr.mdl", pos = Vector(-0.05, 6.5, -0.2), angle = Angle(0, -90, 0), size = Vector(0.38, 0.38, 0.38), bone = "m416_d"},
		["md_eft_fg_bgv_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/bgv-mk46/v_bgv_blk.mdl", pos = Vector(-0.05, 6.5, -0.2), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35), bone = "m416_d"},
		["md_eft_fg_afg_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_blk.mdl", pos = Vector(-0.05, 6.5, -0.2), angle = Angle(0, -90, 0), size = Vector(0.38, 0.38, 0.38), bone = "m416_d"},

		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", bone = "m416_d", rel = "", pos = Vector(-1.1, 10, 0.9), angle = Angle(180, 90, 90), adjustment = {min = 4, max = 9.8, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", bone = "m416_d", rel = "", pos = Vector(0.9, 10, 0.9), angle = Angle(180, 90, -90), adjustment = {min = 4, max = 9.8, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},
		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", bone = "m416_d", rel = "", pos = Vector(-0.05, 6, 2.25), angle = Angle(180, 90, 0), adjustment = {min = 6, max = 8, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},

		["md_eft_sil_osprey9"] = {model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", bone = "m416_d", rel = "", pos = Vector(-0.08, 12.9, 0.93), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1)},

		["md_eft_fl_wf501b"] = {model = "models/weapons/cw_eft/upgrades/tactical/wf501b/v_wf501b.mdl", bone = "m416_d", rel = "", pos = Vector(-1.1, 10, 0.9), angle = Angle(180, 90, 90), size = Vector(1, 1, 1), adjustment = {min = 4, max = 9.8, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eft_fl_xc1"] = {model = "models/weapons/cw_eft/upgrades/tactical/xc1/xc1.mdl", bone = "m416_d", rel = "", pos = Vector(-0.07, 9.5, 2.25), angle = Angle(180, 90, 0), adjustment = {min = 4.5, max = 9, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},


	   	--["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "m416_d", rel = "", pos = Vector(2.377, -7.051, 2.167), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},

		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "m416_d", rel = "", pos = Vector(-0.047, -0.661, -1.446), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		--["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "m416_d", rel = "", pos = Vector(-0.362, -7, -2.786), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899)}
	}

	SWEP.ForeGripHoldPos = {
	["l_wrist"] = {pos = Vector(0, 0, 0), angle = Angle(0, -20, 50) },
	["l_armtwist_1"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 70) },
	["l_index_low"] = {pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["l_index_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_index_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_mid"] = {pos = Vector(0, 0, 0), angle = Angle(28, 0, 0) },
	["l_middle_tip"] = {pos = Vector(0, 0, 0), angle = Angle(19, 0, 0) },
	["l_ring_low"] = {pos = Vector(0, 0, 0), angle = Angle(-9, 0, 0) },
	["l_ring_mid"] = {pos = Vector(0, 0, 0), angle = Angle(5, 0, 0) },
	["l_ring_tip"] = {pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	["l_pinky_low"] = {pos = Vector(0, 0, 0), angle = Angle(-31, 0, 0) },
	["l_pinky_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_pinky_tip"] = {pos = Vector(0, 0, 0), angle = Angle(26, 0, 0) },
	["l_thumb_low"] = {pos = Vector(0, 0, 0), angle = Angle(-30, -35, -10) },
	["l_thumb_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
	["l_thumb_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
	["arm_controller_01"] = {pos = Vector(2.5, 0, -1.2), angle = Angle(0, 0, 0) }
	}
	
	SWEP.ForegripOverridePos = {
    ["md_eft_fg_rvg2"] = { --CQR握把手型
	["l_upperarm"] = {pos = Vector(-.8, 0.5, 0.7), angle = Angle(0, 0, 0) },
	["l_wrist"] = {pos = Vector(0, 0, 0), angle = Angle(0, -11, 44.8) },
	["l_armtwist_1"] = {pos = Vector(1.5, -5.1, -1.6), angle = Angle(-15.6855, 35, 20) },
	["l_armtwist_2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 8.8) },	
	["l_index_low"] = {pos = Vector(0, 0, 0), angle = Angle(10, 0, 10) },
	["l_index_mid"] = {pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	["l_index_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_mid"] = {pos = Vector(0, 0, 0), angle = Angle(35, 0, 0) },
	["l_middle_tip"] = {pos = Vector(0, 0, 0), angle = Angle(19, 0, 0) },
	["l_ring_low"] = {pos = Vector(0, 0, 0), angle = Angle(7, 0, 0) },
	["l_ring_mid"] = {pos = Vector(0, 0, 0), angle = Angle(15, 0, 0) },
	["l_ring_tip"] = {pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	["l_pinky_low"] = {pos = Vector(0, 0, 0), angle = Angle(-31, 0, 0) },
	["l_pinky_mid"] = {pos = Vector(0, 0, 0), angle = Angle(31, 0, 0) },
	["l_pinky_tip"] = {pos = Vector(0, 0, 0), angle = Angle(26, 0, 0) },
	["l_thumb_low"] = {pos = Vector(0, 0, 0), angle = Angle(23, 23, 38) },
	["l_thumb_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
	["l_thumb_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
	["arm_controller_01"] = {pos = Vector(2.5, 0, -1.2), angle = Angle(0, 0, 0) }
	},
	["md_eft_fg_rvg"] = { --RVG握把手型
	["l_wrist"] = {pos = Vector(0, 0, 0), angle = Angle(0, -20, 50) },
	["l_upperarm"] = {pos = Vector(-1, 0, 0), angle = Angle(0, 0, 0) },
	["l_armtwist_1"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 70) },
	["l_index_low"] = {pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	["l_index_mid"] = {pos = Vector(0, 0, 0), angle = Angle(10, 10, 0) },
	["l_index_tip"] = {pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
	["l_middle_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_mid"] = {pos = Vector(0, 0, 0), angle = Angle(28, 0, 0) },
	["l_middle_tip"] = {pos = Vector(0, 0, 0), angle = Angle(19, 0, 0) },
	["l_ring_low"] = {pos = Vector(0, 0, 0), angle = Angle(-9, 0, 0) },
	["l_ring_mid"] = {pos = Vector(0, 0, 0), angle = Angle(5, 0, 0) },
	["l_ring_tip"] = {pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	["l_pinky_low"] = {pos = Vector(0, 0, 0), angle = Angle(-30, 0, 0) },
	["l_pinky_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_pinky_tip"] = {pos = Vector(0, 0, 0), angle = Angle(36, 0, 0) },
	["l_thumb_low"] = {pos = Vector(0, 0, 0), angle = Angle(-20, -35, -10) },
	["l_thumb_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
	["l_thumb_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
	["arm_controller_01"] = {pos = Vector(2.5, 0, -1.2), angle = Angle(0, 0, 0) }
	},
	["md_eft_fg_afg_blk"] = { --转角握把
	["l_wrist"] = {pos = Vector(0, 0, 0), angle = Angle(0.1, -8,35.1) },
	["l_upperarm"] = {pos = Vector(1.5, 0, 0.8), angle = Angle(0, 0, 0) },
	["l_armtwist_1"] = {pos = Vector(0, 0, 0.1), angle = Angle(1, 1, 18) },
	
	["l_index_low"] = {pos = Vector(0, 0, 0), angle = Angle(-1, 2, 12) },
	["l_index_mid"] = {pos = Vector(0, 0, 0), angle = Angle(5, 0, 0) },
	["l_index_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["l_middle_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_mid"] = {pos = Vector(0, 0, 0), angle = Angle(-10, 0, 0) },
	["l_middle_tip"] = {pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	
	["l_ring_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, -5) },
	["l_ring_mid"] = {pos = Vector(0, 0, 0), angle = Angle(-10, 0, 0) },
	["l_ring_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["l_pinky_low"] = {pos = Vector(0, 0, 0), angle = Angle(-15, 0, -13) },
	["l_pinky_mid"] = {pos = Vector(0, 0, 0), angle = Angle(-5, 0, -10) },
	["l_pinky_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["l_thumb_low"] = {pos = Vector(0, 0, 0), angle = Angle(10, -20, 0) },
	["l_thumb_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 15, 0) },
	["l_thumb_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25, 0) },
	
	["arm_controller_01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	},
	
		}

end

SWEP.MuzzleVelocity = 470 -- in meter/saw

SWEP.SightBGs = {main = 2, regular = 0, none = 1}
SWEP.StockBGs = {main = 3, regular = 0, none = 1}
SWEP.MagBGs = {main = 4, regular = 0, extended = 1}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.1, hor = 0.13, roll = 0.15, forward = 1, pitch = -0.2}
	
	SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
	SWEP.ADSFireAnim = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {900, -500}, atts = {"md_eft_si_cobra", "md_eft_si_m4", "md_eft_si_uh1", "md_eft_si_exps3_tan", "md_eft_si_acog_ta01nsn", "md_eft_si_elcan", "md_eft_si_hamr"}},
	[2] = {header = "Barrel", offset = {-400, -500}, atts = {"md_eft_sil_osprey9", "md_saker"}},
	[3] = {header = "Grip", offset = {-400, 0}, atts = {"md_eft_fg_afg_blk", "md_eft_fg_bgv_blk", "md_eft_fg_cqr"}},
	[4] = {header = "Lasers", offset = {100, -500}, atts = {"md_eft_ld_la5", "md_eft_ld_anpeq15", "md_eft_ld_ls321"}},
	--[7] = {header = "Stock", offset = {800, 500}, atts = {"bg_nostock"}},
	[5] = {header = "Flashlights", offset = {-400, 500}, atts = {"md_eft_fl_wf501b", "md_eft_fl_xc1"}},
    [6] = {header = "misc", offset = {1300, 500}, atts = {"md_eft_si_dp_wo_mount", "md_eft_si_g33_tan"}},

	["+reload"] = {header = "Ammo", offset = {1300, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.AttachmentDependencies = {
	["md_eft_fl_wf501b"] = {"md_eft_ld_la5", "md_eft_ld_ls321"},
	["md_eft_si_dp_wo_mount"] = {"md_eft_si_hamr"},
	["md_eft_fl_xc1"] = {"md_eft_ld_anpeq15"},
	["md_eft_si_g33_tan"] = {"md_eft_si_exps3_tan"},

	["md_magnifier_scope"] = {"md_microt1","md_cod4_reflex","md_eotech","md_fas2_aimpoint"}
}
	SWEP.AttachmentExclusions = {["md_cmore"] = {"md_Mtasker"},["md_microt1"] = {"md_Mtasker"}}
	

SWEP.Animations = {fire = {"shoot", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_HK416A5_DRAW"}},

	reload = {[1] = {time = 0, sound = "CW_HK416A5_STARTRELOAD"},
	[2] = {time = 0.48, sound = "CW_HK416A5_MAGOUT"},
	[3] = {time = 1.11, sound = "CW_HK416A5_HOLSTER"},
	[4] = {time = 1.31, sound = "CW_HK416A5_MAGINSERT"},
	[5] = {time = 1.4, sound = "CW_HK416A5_MAGIN"},
	[6] = {time = 2.17, sound = "CW_HK416A5_BOLTBACK"},
	[7] = {time = 2.54, sound = "CW_HK416A5_BOLTFORWARD"},
	[8] = {time = 2.8, sound = "CW_HK416A5_ENDRELOAD"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Pepaund"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/rifles/hk416a5.mdl"
SWEP.WorldModel		= "models/cw2/rifles/w_hk416a5.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.0769
SWEP.FireSound = "CW_HK416A5_FIRE"
SWEP.FireSoundSuppressed = "CW_HK416A5_FIRE_SUPPRESSED"
SWEP.Recoil = 0.75

SWEP.ADSSpeed = 1
SWEP.ADSSpeed_Orig = 1

SWEP.HipSpread = 0.041
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.25
SWEP.SpreadPerShot = 0.07
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 41
SWEP.DeployTime = 0.35

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.72
SWEP.ReloadTime_Empty = 1.62
SWEP.ReloadHalt = 1.72
SWEP.ReloadHalt_Empty = 3.3
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
if self:isAiming() then
self.NormalHoldType = "ar2"
else
self.NormalHoldType = "crossbow"
end
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk  or self.ActiveAttachments.md_eft_fg_bgv_fde or self.ActiveAttachments.md_eft_fg_mod3 or self.ActiveAttachments.md_eft_fg_shift then
			self.ForegripParent = "md_eft_fg_rvg"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_rk1 then
			self.ForegripParent = "md_eft_fg_rvg1"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_cqr then
			self.ForegripParent = "md_eft_fg_rvg2"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_blk or self.ActiveAttachments.md_eft_fg_cobra or self.ActiveAttachments.md_eft_fg_afg_mlok_fde then
			self.ForegripParent = "md_eft_fg_afg_blk"
			self.ForegripOverride = true
			return
		else
			self.ForegripParent = "none"
			self.ForegripOverride = true
			return
			
		end

	end