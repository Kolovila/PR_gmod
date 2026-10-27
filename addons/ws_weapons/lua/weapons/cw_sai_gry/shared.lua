AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SAI GRY"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.45
	SWEP.ShellOffsetMul = -2
	SWEP.ShellPosOffset = {x = 1.5, y = 0, z = -1.2}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
SWEP.VMPos = Vector(0, 6, 1) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 2, 0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse

	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_sai_gry.mdl"
	SWEP.WMPos = Vector(-1, -0.3, -0.2)
	SWEP.WMAng = Vector(-6, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.52, -0.5, 0.46)
	SWEP.IronsightAng = Vector(-0.072, 0.025, 0)
	
	SWEP.EFTUH1Pos = Vector(-2.52, -0.5, 0.32)  --EFT
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
	
	SWEP.EFTEKPPos = Vector(-2.52, -0.5, 0.32)  --EFT
	SWEP.EFTEKPAng = Vector(0, 0, 0)
	
	SWEP.EFTSRS02Pos = Vector(-2.52, -0.5, 0.4)  --EFT
	SWEP.EFTSRS02Ang = Vector(0, 0, 0)

	SWEP.EFTEXPS32Pos = Vector(-2.51, -1, 0.33)  --EFT
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)

	SWEP.EFTG33Pos = Vector(-2.52, -2, 0.45)  --EFT-----G33
	SWEP.EFTG33Ang = Vector(0, 0, 0)

	SWEP.EFTHAMRPos = Vector(-2.51, -2.4, 0.35)  --EFT
	SWEP.EFTHAMRAng = Vector(0, 0, 0)

	SWEP.EFTDPmountPos = Vector(-2.51, -1, -0.8)  --EFT-HAMA用的
	SWEP.EFTDPmountAng = Vector(0, 0, 0)

	SWEP.EFTRMRmountPos = Vector(-2.541, -1, -1.55)  --EFT
	SWEP.EFTRMRmountAng = Vector(1, 0, 4.6)

	SWEP.EFTROMEO4Pos = Vector(-2.63, -1, -0.58)  --EFT
	SWEP.EFTROMEO4Ang = Vector(1, 0, 4.6)

	SWEP.EFTP1X42Pos = Vector(-2.63, -1, -0.45)  --EFT
	SWEP.EFTP1X42Ang = Vector(1, 0, 4.6)
	
	SWEP.EFTACOGTA01Pos = Vector(-2.508, -2.6, 0.53)  --EFT
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)
	
	SWEP.EFTDPPos = Vector(-2.65, -1, -0.25)  --EFT
	SWEP.EFTDPAng = Vector(1, 0, 4.6)
	
	SWEP.EFTFF3Pos = Vector(-2.675, -1, 0.05)  --EFT
	SWEP.EFTFF3Ang = Vector(1, 0, 4.6)
	
	SWEP.EFTRMRmountPos = Vector(-2.51, -1, -0.55)  --EFT-ACOG用的
	SWEP.EFTRMRmountAng = Vector(0, 0, 0)
	
	SWEP.EFTElcanPos = Vector(-2.508, -2.8, 0.53)  --EFT
	SWEP.EFTElcanAng = Vector(0, 0, 0)
	
	SWEP.EFTFF3backupPos = Vector(-3.55, -2, 1.13)  --EFT-侧瞄
	SWEP.EFTFF3backupAng = Vector(0, 0, -45)
	
	
	
	SWEP.AlternativePos = Vector(0.3, 0, 0.2)
	SWEP.AlternativeAng = Vector(0.4, 0, 0.5)
	
	SWEP.BackupReflexPos = Vector(-3.6, 1.5, 0.9)
	SWEP.BackupReflexAng = Vector(-0.23, 0.07, -45)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.498, -3.313, -0.181), [2] = Vector(0, 0, 0)}}
	SWEP.BackupSights = {["cod_mw3_hamr"] = {[1] = Vector(-2.498, 8, -0.181), [2] = Vector(-1.5, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	SWEP.CustomizationMenuScale = 0.0115

	SWEP.SprintViewNormals = {x = 1.5, y = -1, z = 5} --
	
    SWEP.LuaVMRecoilAxisMod = {vert = 0.042, hor = 0.11, roll = 0.6, forward = 0.8, pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  

	SWEP.SightWithRail = true
    SWEP.SightBGs = {main = 1, none = 1}
	SWEP.LaserPosAdjust = {x = -0.5, y = -2, z = -0.5}
	SWEP.LaserAngAdjust = {p = 0.07, y = 0, r = 0}
	
	SWEP.AttachmentModelsVM = {
	    ["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", bone = "objM4_Main", pos = Vector(0.12, -1, 2.3), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "objM4_Main", pos = Vector(0.12, -1.5, 2.3), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_hamr"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/hamr/v_hamr.mdl", bone = "objM4_Main", pos = Vector(0.12, -1.5, 2.3), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eft_si_srs"] = {model = "models/weapons/cw_eft/upgrades/scopes/srs/v_srs.mdl", bone = "objM4_Main", pos = Vector(0.1, -1, 2.36), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_acog_ta01nsn_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/fde/v_ta01nsn.mdl", bone = "objM4_Main", pos = Vector(0.12, -1.8, 2.32), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_elcan_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/fde/v_elcan.mdl", bone = "objM4_Main", pos = Vector(0.12, -0.98, 2.32), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", bone = "objM4_Main", pos = Vector(0.12, -0.5, 2.33), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},	
		["md_eft_si_g33_tan"] = {model = "models/weapons/cw_eft/upgrades/reflex/g33/c_eotech_g33_tan.mdl", bone = "objM4_Main", pos = Vector(0.12, 3.5, 1.85), angle = Angle(0, -90, 0), size = Vector(1.19, 1.19, 1.19)},	

	    ["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(0.1, 10.05, 2.25), angle = Angle(180, 90, 0), size = Vector(0.74, 0.74, 0.74), bone = "objM4_Main"},	
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(0.1, 10.5, 2.25), angle = Angle(180, 90, 0), size = Vector(0.83, 0.83, 0.83), bone = "objM4_Main"},
	    ["md_eft_fl_xc1"] = {model = "models/weapons/cw_eft/upgrades/tactical/xc1/xc1.mdl", pos = Vector(1.2, 12, 1.2), angle = Angle(180, 90, -90), size = Vector(0.78, 0.78, 0.78), bone = "objM4_Main"},	
	    --["md_eft_fl_dbalpl"] = {model = "models/weapons/cw_eft/upgrades/tactical/dbalpl/dbalpl.mdl", pos = Vector(-0.95, 12, 1.2), angle = Angle(180, 90, 90), size = Vector(0.78, 0.78, 0.78), bone = "objM4_Main"},	
	    ["md_eft_fl_wf501b"] = {model = "models/weapons/cw_eft/upgrades/tactical/wf501b/v_wf501b.mdl", pos = Vector(-0.95, 11, 1.2), angle = Angle(180, 90, 90), size = Vector(0.78, 0.78, 0.78), bone = "objM4_Main"},	

		["md_eft_fg_cqr"] = {model = "models/weapons/cw_eft/upgrades/foregrips/cqr/v_cqr.mdl", pos = Vector(0.1, 6, 0.15), angle = Angle(0, -90, 0), size = Vector(0.34, 0.34, 0.34), bone = "objM4_Main"},
		["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", pos = Vector(0.1, 6, 0.224), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "objM4_Main"},
		["md_eft_fg_bgv_fde"] = {model = "models/weapons/cw_eft/upgrades/foregrips/bgv-mk46/v_bgv_fde.mdl", pos = Vector(0.1, 6, 0.15), angle = Angle(0, -90, 0), size = Vector(0.3, 0.3, 0.3), bone = "objM4_Main"},
		["md_eft_fg_afg_mlok_fde"] = {model = "models/weapons/cw_eft/upgrades/foregrips/m-lok_afg/v_mlok_fde.mdl", pos = Vector(0.1, 7, 0.15), angle = Angle(0, -90, 0), size = Vector(0.3, 0.3, 0.3), bone = "objM4_Main"},
		["md_eft_fg_rk1b"] = {model = "models/weapons/cw_eft/upgrades/foregrips/b-25u_rk-1/v_rk1b.mdl", pos = Vector(0.1, 6, 0.13), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35), bone = "objM4_Main"},
		["md_eft_fg_mod3"] = {model = "models/weapons/cw_eft/upgrades/foregrips/mod3/v_mod3.mdl", pos = Vector(0.12, 6, 0.13), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35), bone = "objM4_Main"},
		["md_eft_fg_shift"] = {model = "models/weapons/cw_eft/upgrades/foregrips/shift/v_shift.mdl", pos = Vector(0.1, 6, 0.08), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35), bone = "objM4_Main"},
		["md_eft_fg_rk1"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rk-1/v_rk1.mdl", pos = Vector(0.1, 6, 0.13), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35), bone = "objM4_Main"},

		["md_eft_mt_rm35"] = {model = "models/weapons/cw_eft/upgrades/mounts/rm35/mount_acog_trijicon_rm35.mdl", bone = "objM4_Main", pos = Vector(0.12, -4.46, 3.6), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", bone = "objM4_Main", pos = Vector(0.12, -3.3, 2.36), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6)},

		["md_eft_si_rmr_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr_wo_mount.mdl", bone = "objM4_Main", pos = Vector(0.12, -4.1, 3.4), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_eft_si_ff3_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", bone = "objM4_Main", pos = Vector(-0.5, -3.3, 2.48), angle = Angle(0, -90, 45), size = Vector(0.78, 0.78, 0.78)},
		["md_eft_si_dp_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp_wo_mount.mdl", bone = "objM4_Main", pos = Vector(0.12, -0.78, 3.9), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},

		["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", pos = Vector(0.15, 11, -0.4), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6), bone = "objM4_Main"},

	    ["md_foregrip"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", bone = "objM4_Main", rel = "", pos = Vector(0.1, 6, 0.224), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "objM4_Main", pos = Vector(0.13, 3, -0.4), angle = Angle(0, 0, 0), size = Vector(0.54, 0.54, 0.54)},
		--["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "objM4_Main", pos = Vector(0.125, -0.15, 2.527), adjustment = {min = -2.445, max = 0.6, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, 180, 0), size = Vector(0.35, 0.35, 0.35)},
		--["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "objM4_Main", pos = Vector(-0.144, -6.582, -1.943), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},	
		--["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "objM4_Main", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "objM4_Main", pos = Vector(-0.144, -6.514, -1.941), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)}
	}

	SWEP.ForeGripHoldPos =  {
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 20, 0) }, --无名指
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -10, 10) },--无名指
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, -5, 0) },--无名指
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },--中指
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 10, 0) }, --中指
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 0, 0) }, --中指
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, --食指
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },  --食指
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(80, 50, 60) }, --食指
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 10, -10) }, --拇指
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 10, -10) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-18, -10, -0) }, --拇指
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) }, --小拇指
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-13, -10, 10) },  --小拇指
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) }, --小拇指
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, -10, 10) }, --手掌
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-2.5, 2, -2), angle = Angle(-40, 15, 40) }
}

		SWEP.ForegripOverridePos = {
	["md_eft_fg_rvg2"] = { --
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 10, 8) }, --无名指
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -10, 10) },--无名指
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11, 0, 0) },--无名指
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },--中指
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(17, 0, 18) }, --中指
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) }, --中指
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 5, 18) }, --食指
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },  --食指
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(60, 0, 0) }, --食指
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 30, -10) }, --拇指
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 60, -10) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(35, 0, 10) }, --拇指
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, -20, -10) }, --小拇指
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },  --小拇指
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, 0, 0) }, --小拇指
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19, -1, 14) }, --手掌
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 15, 27) },
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.5, 0, 0) },
    ["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.5), angle = Angle(0, 3, 10) }		
	},
	["md_eft_fg_rvg1"] = { --
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 10, 8) }, --无名指
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -10, 10) },--无名指
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, -5, 0) },--无名指
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },--中指
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 18) }, --中指
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 0, 0) }, --中指
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 18) }, --食指
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },  --食指
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(80, 50, 60) }, --食指
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 30, -10) }, --拇指
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 60, -10) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(35, 0, 10) }, --拇指
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, -20, -10) }, --小拇指
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-33, -20, 30) },  --小拇指
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, -13, 5) }, --小拇指
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19, -1, 14) }, --手掌
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 15, 27) },
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.5, 0, 0) },
    ["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.8), angle = Angle(0, 3, 10) }		
	},
	["md_eft_fg_rvg"] = {
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 20, 0) }, --无名指
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -10, 10) },--无名指
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, -5, 0) },--无名指
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },--中指
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 10, 0) }, --中指
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 0, 0) }, --中指
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, --食指
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },  --食指
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(80, 50, 60) }, --食指
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 10, -10) }, --拇指
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 47, -10) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-9, -30, -20) }, --拇指
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) }, --小拇指
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-13, -10, 10) },  --小拇指
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) }, --小拇指
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19, -1, 14) }, --手掌
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 15, 27) },
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.5, 0, 0) }	
	},
	["md_eft_fg_afg_blk"] = {
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 20, 0) }, --无名指
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, -3, 10) },--无名指
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3, 4.2, -12.8) },--无名指
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },--中指
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 10, 0) }, --中指
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3, 16.4, -11.5) }, --中指
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, --食指
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },  --食指
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(18, -1.4285, 17) }, --食指
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 10, -10) }, --拇指
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 45 -10) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(28, -10, 6.87) }, --拇指
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, -3.75) }, --小拇指
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 0.1, -13) },  --小拇指
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) }, --小拇指
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.1, 0), angle = Angle(10, 23.7, 0.42) }, --手掌
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 15, 27) },
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, -3, -4.5) }	
	},
	
		}

end

SWEP.MuzzleVelocity = 550 -- in meter/s

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {1000, -200}, atts = {"md_eft_si_cobra", "md_eft_si_exps3_tan", "md_eft_si_uh1", "md_eft_si_elcan_tan", "md_eft_si_acog_ta01nsn_tan", "md_eft_si_hamr"}},
	--["impulse 100"] = {header = "Barrel", offset = {-500, -200}, atts = {"md_saker"}},
	[2] = {header = "Handguard", offset = {-500, 300}, atts = {"md_eft_fg_afg_mlok_fde",  "md_eft_fg_bgv_fde", "md_eft_fg_rvg", "md_eft_fg_cqr"}},
	[3] = {header = "LD", offset = {0, -200}, atts = {"md_eft_ld_la5","md_eft_ld_ls321"}},
	[4] = {header = "misc", offset = {1000, 200}, atts = {"md_eft_si_g33_tan", "md_eft_mt_rm35", "md_eft_si_ff3_backup", "md_eft_si_dp_wo_mount"}},
	[5] = {header = "misc", offset = {1000, 500}, atts = {"md_eft_si_rmr_wo_mount"}},
	[6] = {header = "misc", offset = {-500, 700}, atts = {"md_bipod"}},
    ["+attack"]= {header = "LD", offset = {300, -700}, atts = {"md_eft_fl_wf501b", "md_eft_fl_xc1"}},
    ["+attack2"]= {header = "LD", offset = {1000, -700}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {300, 600}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.AttachmentDependencies = {
	["md_eft_si_g33_tan"] = {"md_eft_si_exps3_tan"},
	["md_eft_si_rmr_wo_mount"] = {"md_eft_mt_rm35"},
	["md_eft_mt_rm35"] = {"md_eft_si_acog_ta01nsn_tan"},
	["md_eft_si_ff3_backup"] = {"md_eft_si_elcan_tan"},
	["md_eft_mt_mpr45"] = {"md_eft_si_ff3_backup"},
	["md_eft_si_dp_wo_mount"] = {"md_eft_si_hamr"}


}
	SWEP.AttachmentExclusions = {["md_cmore"] = {"md_Mtasker"},["md_microt1"] = {"md_Mtasker"}}
	

SWEP.Animations = {fire = {"shoot1","shoot2","shoot1","shoot3","shoot2","shoot1"},
	reload = "reload_clatch",
	reload_empty = "reload",
	idle = "idle",
	draw = "normal_draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
                       [2] = {time = 0.5, sound = "SAI_GRY_BOLTP"},
					   [3] = {time = 0.8, sound = "SAI_GRY_BOLTF"}},

	reload_clatch = {[1] = {time = 0.35, sound = "SAI_GRY_MAGOUT"},
	[2] = {time = 1.2, sound = "SAI_GRY_MAGIN"},
	[3] = {time = 1.8, sound = "SAI_GRY_BOLTH"}},
	
	reload = {[1] = {time = 0.35, sound = "SAI_GRY_MAGOUT"},
	[2] = {time = 1.2, sound = "SAI_GRY_MAGIN"},
	[3] = {time = 1.9, sound = "SAI_GRY_BOLTP"},
	[4] = {time = 2.1, sound = "SAI_GRY_BOLTF"}} 
}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Jobin" --Thank you! The Mod is great
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_sai_gry.mdl"
SWEP.WorldModel		= "models/weapons/w_sai_gry.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 40
SWEP.Primary.DefaultClip	= 260
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.074
SWEP.FireSound = "SAI_GRY_FIRE"
SWEP.FireSoundSuppressed = "SAI_GRY_FIRE_SUPPRESSED"
SWEP.Recoil = 0.72

SWEP.HipSpread = 0.031
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.3

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Empty = 2.40
SWEP.ReloadHalt = 2
SWEP.ReloadHalt_Empty = 2.9
SWEP.SnapToIdlePostReload = true

	function SWEP:RenderTargetFunc()
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