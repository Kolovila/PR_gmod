if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

local Vec0 = Vector(0,0,0)
local Vec1 = Vector(1,1,1)
local Ang0 = Angle(0,0,0)
	
local USE_OLD_WELEMENTS = true		//requires map restart

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MP7A2"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	SWEP.MuzzleAttachment = 1
	SWEP.MuzzleAttachmentName = "1"
	SWEP.MuzzleEffect = "muzzleflash_smg"

	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = -2, z = 1.5}
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = -5
	SWEP.ShellPosOffset = {x = 8, y = 3, z = -1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87

	SWEP.IronsightPos = Vector(-3.605, -4.7577, 0.88)
	SWEP.IronsightAng = Vector(0, 0, 0)
	

	SWEP.UnFoldSightPos = Vector(-3.61, -5, 0.2)
	SWEP.UnFoldSightAng = Vector()


	SWEP.FoldSightPos = Vector(-3.61, -5, 1)
	SWEP.FoldSightAng = Vector(0, 0, 0)


	SWEP.PronePos = Vector(-7.397, -12.497, -8.551)
	SWEP.ProneAng = Vector(16.9, 53.4, -60)
	
	SWEP.SprintPos = Vector(9.1954, 0, 2.082)
	SWEP.SprintAng = Vector(-12.849, 37, 0)

	SWEP.CustomizePos = Vector(15, 0, -2)
	SWEP.CustomizeAng = Vector(13.66, 45.86, 0)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.EFTMICROT1Pos = Vector(-3.605, -4.7577, 0.88)
	SWEP.EFTMICROT1Ang = Vector()

	SWEP.EFTSRS02Pos =  Vector(-3.61, -4.7577, 0.28)
	SWEP.EFTSRS02Ang = Vector(-2.1, 0.1, 0)	

	SWEP.EFTDPPos = Vector(-3.61, -4.7577, 0.48)
	SWEP.EFTDPAng = Vector(0, 0, 0)	

	SWEP.EFTMRSPos =  Vector(-3.615, -4.7577, 0.15)
	SWEP.EFTMRSAng = Vector(0, 0, 0)		

	SWEP.EFTROMEO4Pos =  Vector(-3.615, -4.7577, 0.01)
	SWEP.EFTROMEO4Ang = Vector(0, 0, 0)	

	SWEP.EFTPS320Pos = Vector(-3.62, -4.5, -0.05)
	SWEP.EFTPS320Ang = Vector(0, 0, 0)

	SWEP.EFTPK06Pos =  Vector(-3.63, -4.7577, 0.65)
	SWEP.EFTPK06Ang = Vector(0, 0, 0)	

	SWEP.EFTOKP7Pos = Vector(-3.605, -4.7577, 0.5)
	SWEP.EFTOKP7Ang = Vector()
		




	SWEP.EFTEKPPos = Vector(-3.62, -4.7577, -0.25)
	SWEP.EFTEKPAng = Vector()

	SWEP.EFTFF3Pos =  Vector(-3.61, -4.7577, 0.9)
	SWEP.EFTFF3Ang = Vector(0, 0, 0)

	SWEP.EFTRMRPos =  Vector(-3.61, -5, -0.1)
	SWEP.EFTRMRAng = Vector(0, 0, 0)	

	SWEP.EFTP1X42Pos =  Vector(-3.61, -5, 0.12)
	SWEP.EFTP1X42Ang = Vector(0, 0, 0)	




	SWEP.EFT1P87Pos =  Vector(-3.57, -4, -0.53)
	SWEP.EFT1P87Ang = Vector(0, 0, 0)	

	SWEP.EFTHS401G5Pos = Vector(-3.61, -5, 0.13)
	SWEP.EFTHS401G5Ang = Vector()

	SWEP.EFTCOMPM4Pos =  Vector(-3.62, -5, 0.42)
	SWEP.EFTCOMPM4Ang = Vector(0, 0, 0)

	SWEP.EFTPRISM2XPos =  Vector(-3.62, -5, 0.35)
	SWEP.EFTPRISM2XAng = Vector(0, 0, 0)

	SWEP.EFTPRISMPos =  Vector(-3.62, -4, -0.15)
	SWEP.EFTPRISMAng = Vector(0, 0, 0)


	SWEP.EFT553Pos = Vector(-3.61, -2.8, -0.15)
	SWEP.EFT553Ang = Vector()
		

	SWEP.EFTACOGTA11DPos =  Vector(-3.62, -4, 0.05)
	SWEP.EFTACOGTA11DAng = Vector(0, 0, 0)

	SWEP.EFTBRAVO4Pos =  Vector(-3.62, -4, 0.05)
	SWEP.EFTBRAVO4Ang = Vector(0, 0, 0)

	SWEP.EFTUH1Pos = Vector(-3.62, -5, -0.3)
	SWEP.EFTUH1Ang = Vector(0.4, 0, 0)	

	SWEP.EFTACOGTA01Pos = Vector(-3.62, -4, 0.05)
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)

	SWEP.EFTHAMRPos =  Vector(-3.62, -4.5, -0.25)
	SWEP.EFTHAMRAng = Vector(0, 0, 0)

	SWEP.EFTElcanPos =  Vector(-3.615, -5.5, -0.1)
	SWEP.EFTElcanAng = Vector(0, 0, 0)

	SWEP.EFTEXPS32Pos = Vector(-3.61, -2.8, -0.22)
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)		


	SWEP.EFTG33Pos = Vector(-3.61, -3, -0.22)
	SWEP.EFTG33Ang = Vector(0, 0, 0)	

	SWEP.EFTEXPS32Pos_g33_3x = Vector(-3.61, -2.7, -0.22)
	SWEP.EFTEXPS32Ang_g33_3x = Vector(0, 0, 0)	


	SWEP.EFTRMRmountPos = Vector(-3.34, -7, -2)
	SWEP.EFTRMRmountAng = Vector(0, 0, 0)	

	SWEP.EFTRMRbackupPos = Vector(-6.15, -5, 1.66)
	SWEP.EFTRMRbackupAng = Vector(0, 0, -45)

	SWEP.EFTFF3backupPos = Vector(-5.45, -5, 2.36)
	SWEP.EFTFF3backupAng = Vector(0, 0, -45)

	SWEP.EFTPK06backupPos = Vector(-5.65, -5, 2.18)
	SWEP.EFTPK06backupAng = Vector(0, 0, -45)	

	SWEP.EFTDPmountPos = Vector(-3.62, -4.5, -1.55)
	SWEP.EFTDPmountAng = Vector(0, 0, 0)	

	SWEP.EFTDPbackupPos = Vector(-5.65, -5, 2.17)
	SWEP.EFTDPbackupAng = Vector(0, 0, -45)	




	SWEP.BackupSights = {			
		["md_eft_si_elcan"] = {[1]= Vector(-3.615, -5.5, -1.2), [2] = Vector(0, 0, 0)}, 
		["md_eft_si_elcan_tan"] = {[1]= Vector(-3.615, -5.5, -1.2), [2] = Vector(0, 0, 0)}, 
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 3, roll = 1, forward = 1, pitch = 1}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.SprintViewNormals = {x = 1, y = -1, z = 1}


	SWEP.AttachmentModelsVM = {
		["md_eft_sil_rotex"] = {model = "models/weapons/cw_eft/upgrades/silencers/rotex/v_rotex.mdl", pos = Vector(2.22, 0.03, 1.46), angle = Angle(), size = Vector(0.75, 0.75, 0.75), bone = "A_Suppressor"},

		["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", pos = Vector(5.45, 0.03, -0.56), angle = Angle(), size = Vector(0.43, 0.43, 0.43), bone = "tag_weapon"},
		["md_eft_fg_vpg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/vpg/v_vpg.mdl", pos = Vector(5.25, 0.03, -0.54), angle = Angle(), size = Vector(0.42, 0.42, 0.42), bone = "tag_weapon"},
		["md_eft_fg_bgv_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/bgv-mk46/v_bgv_blk.mdl", pos = Vector(5.25, 0.035, -0.515), angle = Angle(), size = Vector(0.42, 0.42, 0.42), bone = "tag_weapon"},
		["md_eft_fg_cobra"] = {model = "models/weapons/cw_eft/upgrades/foregrips/cobra/v_cobra.mdl", pos = Vector(5.55, 0.008, -0.53), angle = Angle(), size = Vector(0.42, 0.42, 0.42), bone = "tag_weapon"},

		["md_eft_si_t1"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/t1/v_t1.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
		["md_eft_si_romeo"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/romeo/v_romeo.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
		["md_eft_si_mrs"] = {model = "models/weapons/cw_eft/upgrades/scopes/mrs/v_mrs.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},	
		["md_eft_si_dp"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},			
		["md_eft_si_srs"] = {model = "models/weapons/cw_eft/upgrades/scopes/srs/v_srs.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},		
			["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_okp7"] = {model = "models/weapons/cw_eft/upgrades/scopes/okp7/v_okp7.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_pk06"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/pk06/v_pk06.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_rmr"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_pilad"] = {model = "models/weapons/cw_eft/upgrades/scopes/pilad/v_pilad.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_ff3"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
		["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", pos = Vector(-6.1, 0.025, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},

		["md_eft_si_ps320"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ps320/v_ps320.mdl", pos = Vector(-6.4, 0.07, 3.52), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_acog_ta11d"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta11d/v_ta11d.mdl", pos = Vector(-6.02, 0.027, 3.4), angle = Angle(), size = Vector(1.075, 1.075, 1.075), bone = "A_Optic"},
		["md_eft_si_prism"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/prism/v_prism.mdl", pos = Vector(-6.13, 0.03, 3.445), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_prism_2x"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/prism2x/v_prism2x.mdl", pos = Vector(-6.13, 0.03, 3.445), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},

		["md_eft_si_hs401g5"] = {model = "models/weapons/cw_eft/upgrades/scopes/hs401g5/v_hs401g5.mdl", pos = Vector(-6.41, 0.023, 3.47), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_elcan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/v_elcan.mdl", pos = Vector(-6.18, 0.03, 3.545), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_elcan_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/fde/v_elcan.mdl", pos = Vector(-6.18, 0.03, 3.545), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_hamr"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/hamr/v_hamr.mdl", pos = Vector(-6.43, 0.03, 3.445), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", pos = Vector(-6.02, 0.03, 3.41), angle = Angle(), size = Vector(1.075, 1.075, 1.075), bone = "A_Optic"},
		["md_eft_si_acog_ta01nsn_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/fde/v_ta01nsn.mdl", pos = Vector(-6.02, 0.03, 3.41), angle = Angle(), size = Vector(1.075, 1.075, 1.075), bone = "A_Optic"},
		["md_eft_si_bravo4"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/bravo4/v_bravo4.mdl", pos = Vector(-6.13, 0.025, 3.445), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},

		["md_eft_si_553"] = {model = "models/weapons/cw_eft/upgrades/scopes/553/v_553.mdl", pos = Vector(-6.22, 0.03, 3.47), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl",  pos = Vector(-6.22, 0.03, 3.47), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_exps3"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3.mdl", pos = Vector(-6.22, 0.03, 3.47), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", pos = Vector(-6.05, 0.03, 3.46), angle = Angle(), size = Vector(1.078, 1.078, 1.078), bone = "A_Optic"},
		["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", pos = Vector(-6.62, 0.03, 3.47), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
		["md_eft_si_m4"] = {model = "models/weapons/cw_eft/upgrades/scopes/comp_m4/v_m4.mdl", pos = Vector(-6.41, 0.023, 3.47), angle = Angle(), size = Vector(1.06, 1.06, 1.06), bone = "A_Optic"},


		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", pos = Vector(11.92, -0.58, 1.373), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},
		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(11.9, -0.58, 1.373), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},
		["md_eft_ld_perst3"] = {model = "models/weapons/cw_eft/upgrades/tactical/perst3/v_perst3.mdl", pos = Vector(12.08, -0.6, 1.331), angle = Angle(0, 0, 180), size = Vector(1.1, 1.1, 1.1), bone = "A_LaserFlashlight"},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(11.85, -0.575, 1.37), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},

			["md_eft_si_dp_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp.mdl", pos = Vector(-0.73, 1.3, 2.22), angle = Angle(0, 0, 45), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
		["md_eft_si_dp_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp_wo_mount.mdl", pos = Vector(-5.7, 0.025, 5.55), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_pk06_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/pk06/v_pk06.mdl", pos = Vector(-0.73, 1.3, 2.22), angle = Angle(0, 0, 45), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},	
			["md_eft_si_ff3_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", pos = Vector(-0.73, 1.3, 2.22), angle = Angle(0, 0, 45), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			--["md_eft_si_pilad_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/pilad/v_pilad.mdl", pos = Vector(-0.73, 1.3, 2.22), angle = Angle(0, 0, 45), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},
			["md_eft_si_rmr_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr.mdl", pos = Vector(-0.73, 1.3, 2.22), angle = Angle(0, 0, 45), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},	
		["md_eft_si_rmr_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr_wo_mount.mdl", pos = Vector(-9.4, 0.04, 4.91), angle = Angle(), size = Vector(1.07, 1.07, 1.07), bone = "A_Optic"},

		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", pos = Vector(0.35, 0.02, 3.43), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), bone = "A_LaserFlashlight"},
		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(0.3, 0.03, 3.41), angle = Angle(0, 0, 180), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},
		["md_eft_ld_perst3"] = {model = "models/weapons/cw_eft/upgrades/tactical/perst3/v_perst3.mdl", pos = Vector(0.1, 0.05, 3.38), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), bone = "A_LaserFlashlight"},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(0.15, 0.05, 3.45), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), bone = "A_LaserFlashlight"},


		["md_eft_fl_xc1"] = {model = "models/weapons/cw_eft/upgrades/tactical/xc1/xc1.mdl", pos = Vector(-0.5, -0.95, 1.4), angle = Angle(0, 0, 90), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},
		["md_eft_fl_x400"] = {model = "models/weapons/cw_eft/upgrades/tactical/x400/x400.mdl", pos = Vector(-0.5, -0.95, 1.4), angle = Angle(0, 0, 90), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},
		["md_eft_fl_dbalpl"] = {model = "models/weapons/cw_eft/upgrades/tactical/dbalpl/dbalpl.mdl", pos = Vector(-0.5, -0.95, 1.4), angle = Angle(0, 0, 90), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},
		["md_eft_fl_2u"] = {model = "models/weapons/cw_eft/upgrades/tactical/2u/2u.mdl", pos = Vector(-0.5, -0.95, 1.4), angle = Angle(0, 0, 90), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},
		["md_eft_fl_lastac2"] = {model = "models/weapons/cw_eft/upgrades/tactical/lastac2/lastac2.mdl", pos = Vector(-0.5, -0.95, 1.4), angle = Angle(0, 0, 90), size = Vector(1.07, 1.07, 1.07), bone = "A_LaserFlashlight"},





		["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(-0.53, 1.13, 1.38), angle = Angle(0, 180, -90), size = Vector(0.84, 0.84, 0.84), bone = "A_Optic"},
		["md_eft_mt_rm35"] = {model = "models/weapons/cw_eft/upgrades/mounts/rm35/mount_acog_trijicon_rm35.mdl", pos = Vector(-9.94, 0.04, 5.295), angle = Angle(), size = Vector(0.84, 0.84, 0.84), bone = "A_Optic"},
		["md_eft_si_g33"] = {model = "models/weapons/cw_eft/upgrades/reflex/g33/c_eotech_g33.mdl", pos = Vector(-0.33, 0.01, 2.84), angle = Angle(), size = Vector(1.71, 1.71, 1.71), bone = "A_Optic"},
		["md_eft_si_g33_tan"] = {model = "models/weapons/cw_eft/upgrades/reflex/g33/c_eotech_g33_tan.mdl", pos = Vector(-0.33, 0.01, 2.84), angle = Angle(), size = Vector(1.71, 1.71, 1.71), bone = "A_Optic"},

	}
		

	SWEP.ForegripOverridePos = {
		["anglegrip"] = {
			["j_thumb_le_0"] = {pos = Vector(), angle = Angle(22.3807, 14.872, 75.6173)},
			["j_pinky_le_2"] = {pos = Vector(), angle = Angle(0, -32.213, 0)},
			["j_index_le_0"] = {pos = Vector(), angle = Angle(0, -60, 0)},
			["j_thumb_le_1"] = {pos = Vector(), angle = Angle(-39.491, 28.6382, -64.8415)},
			["j_shoulder_le"] = {pos = Vector(0, 0, -1.1707), angle = Angle(0, 0, -180)},
			["j_pinky_le_0"] = {pos = Vector(), angle = Angle(0, -60, 0)},
			["j_mid_le_0"] = {pos = Vector(), angle = Angle(0, -19.1763, 0)},
			["j_elbow_le"] = {pos = Vector(), angle = Angle(0.2042, -107.8494, 88.6989)},
			["j_thumb_le_2"] = {pos = Vector(), angle = Angle(0, 17.5344, 0)},
			["j_wrist_le"] = {pos = Vector(), angle = Angle(-19.5521, -14.6405, 0)},
		},

		["foregrip"] = {
			["j_wrist_le"] = {pos = Vector(), angle = Angle(5, 0, 0)},
			["j_elbow_le"] = {pos = Vector(0, 0, 2), angle = Angle(-1, 3, 0)},
		},

		["idle"] = {
			["j_mid_le_1"] = {pos = Vector(), angle = Angle(0, -69, 0)},
			["j_index_le_0"] = {pos = Vector(), angle = Angle(0, -35.6912, 0)},
			["j_ring_le_1"] = {pos = Vector(), angle = Angle(-14.8454, -33.4021, 1.59)},
			["j_pinkypalm_le"] = {pos = Vector(), angle = Angle(0, -18.5567, 0)},
			["j_pinky_le_0"] = {pos = Vector(), angle = Angle(0, -52.226, 0)},
			["j_mid_le_0"] = {pos = Vector(), angle = Angle(0, -19.0264, 0)},
			["j_elbow_le"] = {pos = Vector(), angle = Angle(-6, 7, -127.7727)},
			["j_ring_le_0"] = {pos = Vector(), angle = Angle(0, -46.3072, -21.936)},
			["j_wrist_le"] = {pos = Vector(), angle = Angle(0, 12.77, 10)},
			["j_thumb_le_0"] = {pos = Vector(), angle = Angle(0, 9.198, 0)},
			["j_pinky_le_2"] = {pos = Vector(), angle = Angle(-3.7113, -77.9381, -25.9794)},
			["j_ring_le_2"] = {pos = Vector(), angle = Angle(33.4021, -54.353, -40.5195)},
			["j_index_le_1"] = {pos = Vector(), angle = Angle(0, -45.3289, 0)},
			["j_thumb_le_2"] = {pos = Vector(0, 1, 0), angle = Angle(0, 40, 0)},
		},

		["none"] = {},
	}

	SWEP.AttachmentPosDependency = {
		["md_eft_mt_rm35"] = {
			["md_eft_si_acog_ta11d"] = Vector(-10.05, 0.04, 5.47)
		},
		["md_eft_si_rmr_wo_mount"] = {
			["md_eft_si_acog_ta11d"] = Vector(-9.5, 0.04, 5.08)
		},
	}

	SWEP.AttachmentAngDependency = {
	}

	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0)
	SWEP.CustomizationMenuScale = 0.012
end

SWEP.MuzzleVelocity = 725 -- in meter/s

SWEP.MagBGs = {main = 1, none = 0, mp720 = 1, mp730 = 2, mp740 = 3}
SWEP.StockBGs = {main = 2, extended = 0, folded = 1}
SWEP.RailBGs = {main = 3, none = 0, a1 = 1, a2 = 2}
SWEP.SightBGs = {main = 4, none = 0, unfolded = 1, folded = 2}
SWEP.MuzzleBGs = {main = 5, none = 0, on = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {
[1] = {header = "Sight", offset = {-1400, -200}, atts = { "sight_all_hk_mp7_std_unfolded", "sight_all_hk_mp7_std_folded", "md_eft_si_t1", "md_eft_si_okp7", "md_eft_si_cobra", "md_eft_si_mrs", "md_eft_si_dp", "md_eft_si_pk06", "md_eft_si_ff3", "md_eft_si_pilad", "md_eft_si_rmr", "md_eft_si_srs", "md_eft_si_romeo", "md_eft_si_553", "md_eft_si_exps3",  "md_eft_si_exps3_tan", "md_eft_si_hs401g5", "md_eft_si_m4", "md_eft_si_uh1", "md_eft_si_1p87", "md_eft_si_prism", "md_eft_si_prism_2x", "md_eft_si_bravo4", "md_eft_si_elcan", "md_eft_si_elcan_tan", "md_eft_si_hamr", "md_eft_si_acog_ta01nsn", "md_eft_si_acog_ta01nsn_tan", "md_eft_si_acog_ta11d", "md_eft_si_ps320"}},
[2] = {header = "Magazine", offset = {-1400, 350}, atts = {"mag_mp7_hk_std_46x30_20", "mag_mp7_hk_std_46x30_30", "mag_mp7_hk_std_46x30_40"}},
[5] = {header = "Stock", offset = {-100, 100}, atts = {"mp7a2_stock_fold"}},
[8] = {header = "Lam", offset = {-400, -800}, atts = {"md_eft_fl_xc1", "md_eft_fl_x400", "md_eft_fl_dbalpl", "md_eft_fl_2u", "md_eft_fl_lastac2"}, dependencies = { mp7a1_rails_std = true, mp7a2_rails_navy = true}},
[3] = {header = "Rails", offset = {-700, 100}, atts = {"mp7a1_rails_std", "mp7a2_rails_navy"}},
//[6] = {header = "More Rail", offset = {000, 0}, atts = {"mp7a1_rails_std", "mp7a2_rails_navy"},
[0] = {header = "Adjust", offset = {-1000, -800}, atts = {"laser_backup_switch"}, dependencies = {mp7a1_rails_std = true, mp7a2_rails_navy = true}},
["+use"] = {header = "Skin", offset = {-1100, -500}, atts = {"skin_mp7a1"}},
[7] = {header = "More Sights", offset = {-700, -500}, atts = {"md_eft_si_g33", "md_eft_si_g33_tan", "md_eft_si_dp_wo_mount", "md_eft_si_rmr_wo_mount", "md_eft_si_dp_backup", "md_eft_si_rmr_backup", "md_eft_si_ff3_backup", "md_eft_si_pk06_backup"}},
[6] = {header = "Lasers", offset = {100, 500}, atts = {"md_eft_ld_anpeq15", "md_eft_ld_la5", "md_eft_ld_perst3", "md_eft_ld_ls321"}},
["+attack2"] = {header = "Barrel", offset = {1100, -700}, atts = {"md_eft_sil_rotex"}},
["+attack"]= {header = "Muzzle", offset = {300, -700}, atts = {"muzzle_mp7_hk_a1_std_46x30"}, exclusions = {md_eft_sil_rotex = true}},
[4]= {header = "Handgrips", offset = {-700, 500}, atts = {"md_eft_fg_rvg", "md_eft_fg_vpg", "md_eft_fg_bgv_blk", "md_eft_fg_cobra"}, dependencies = {mp7a2_rails_navy = true}},
["+reload"] = {header = "Ammo", offset = {700, 100}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.AttachmentDependencies = {
	["md_eft_si_dp_wo_mount"] = {"md_eft_si_hamr"},

	["md_eft_sil_rotex"] = {"muzzle_mp7_hk_a1_std_46x30"},
	["md_eft_si_rmr_wo_mount"] = {"md_eft_si_acog_ta01nsn", "md_eft_si_acog_ta01nsn_tan", "md_eft_si_acog_ta11d"},

	["md_eft_fg_rvg"] = { "mp7a2_rails_navy"},
	["md_eft_fg_vpg"] = { "mp7a2_rails_navy"},
	["md_eft_fg_bgv_blk"] = { "mp7a2_rails_navy"},
	["md_eft_fg_cobra"] = { "mp7a2_rails_navy"},
	["md_eft_si_g33"] ={"md_eft_si_exps3", "md_eft_si_exps3_tan"},
	["md_eft_si_g33_tan"] ={"md_eft_si_exps3", "md_eft_si_exps3_tan"},

}
/*
SWEP.AttachmentExclusions = {
	["mount_mp5_bt_mounting_rail_nar_low_profile_long"] = {"sight_rear_mp5_hk_drum"},
	["sight_rear_mp5_hk_drum"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"},
	["handguard_mp5_hk_wide_tropical"] = {"reciever_mp5_hk_sd"}, 
	["handguard_mp5_caa_hx5"] = {"reciever_mp5_hk_sd"}, 
	["handguard_mp5_bt_tl_99_3x_nar"] = {"reciever_mp5_hk_sd"}, 
	["handguard_mp5_ptr_tri_rail_forearm"] = {"reciever_mp5_hk_sd"},
	["muzzle_mp5_hk_lug_adapter_9x19"] = {"reciever_mp5_hk_sd"}, 
	["muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"] = {"reciever_mp5_hk_sd"},

	["muzzle_mp5_hk_lug_adapter_9x19"] = {"md_eft_sil_aac", "md_eft_sil_rotor43", "md_eft_sil_osprey9", "md_eft_sil_srd9"},
	["md_eft_fg_rvg"] = {"reciever_mp5_hk_sd"},
	["md_eft_fg_afg_blk"] = {"reciever_mp5_hk_sd"},
	["md_eft_fg_vpg"] = {"reciever_mp5_hk_sd"},
	["md_eft_fg_bgv_blk"] = {"reciever_mp5_hk_sd"},
	["md_eft_fg_cobra"] = {"reciever_mp5_hk_sd"},
}
*/
SWEP.Animations = {fire = {"fire"},
	reload = "reload_tac",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
	draw = {
		[1] = {time = 0, sound = "CW_EFT_DRAW"},
		[2] = {time = 5 / 30, sound = "CW_EFT_GEARMOVEMENT"},
		[3] = {time = 10 / 30, sound = "CW_EFT_LEANIN"},
		[4] = {time = 45 / 100, sound = "CW_EFT_HANDGRIP"},

	},

	reload_tac = {
		[1] = {time = 0, sound = "CW_EFT_GEARMOVEMENT"},
		[2] = {time = 35 / 90, sound = "CW_EFT_MP7_MAGRELEASE"},
		[3] = {time = 42 / 90, sound = "CW_EFT_MP7_MAGOUT"},
		[4] = {time = 80 / 90, sound = "CW_EFT_GEARMOVEMENT"},
		[5] = {time = 110 / 90, sound = "CW_EFT_MAGPULLOUT"},
		[6] = {time = 160 / 90, sound = "CW_EFT_MAGLOCK"},
		[7] = {time = 130 / 90, sound = "CW_EFT_MP7_MAGIN"},
		[8] = {time = 172 / 90, sound = "CW_EFT_CLOTHMOVEMENT"},
		[9] = {time = 188 / 90, sound = "CW_EFT_HANDGRIP"},
		[10] = {time = 190 / 90, sound = "CW_EFT_LEANIN"},
	},
	
	reload_empty = {
		[1] = {time = 0, sound = "CW_EFT_GEARMOVEMENT"},
		[2] = {time = 35 / 90, sound = "CW_EFT_MP7_MAGRELEASE"},
		[3] = {time = 42 / 90, sound = "CW_EFT_MP7_MAGOUT"},
		[4] = {time = 80 / 90, sound = "CW_EFT_GEARMOVEMENT"},
		[5] = {time = 110 / 90, sound = "CW_EFT_MAGPULLOUT"},
		[6] = {time = 160 / 90, sound = "CW_EFT_MAGLOCK"},
		[7] = {time = 130 / 90, sound = "CW_EFT_MP7_MAGIN"},
		[8] = {time = 172 / 90, sound = "CW_EFT_CLOTHMOVEMENT"},
		[9] = {time = 188 / 90, sound = "CW_EFT_HANDGRIP"},
		[10] = {time = 190 / 90, sound = "CW_EFT_GEARMOVEMENT"},
		[11] = {time = 210 / 90, sound = "CW_EFT_CATCH"},
		[12] = {time = 220 / 90, sound = "CW_EFT_MP7_BOLTBACK"},
		[13] = {time = 230 / 90, sound = "CW_EFT_MP7_BOLTFORWARD"},
		[14] = {time = 250 / 90, sound = "CW_EFT_LEANIN"},
	}
}
SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 EFT Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw_eft/mp7a2/c_eft_mp7a2.mdl"
SWEP.WorldModel		=  "models/weapons/cw_eft/mp7a2/w_eft_mp7a2.mdl"
SWEP.UseHands = true
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/cw_eft/mp7a2/w_eft_mp7a2.mdl"
SWEP.WMPos = Vector(-1, -3.5, -1)
SWEP.WMAng = Vector(0, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "4.6x30MM"
SWEP.Chamberable = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Empty = 2.3
SWEP.ReloadHalt = 2.6
SWEP.ReloadHalt_Empty = 3.4



SWEP.FireDelay = 60/950
SWEP.FireSound = "CW_EFT_MP7_FIRE"
SWEP.FireSoundSuppressed = "CW_EFT_MP7_FIRE_SUPPRESSED"
SWEP.Recoil = 1.05

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.55
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 28


if CLIENT then
	function SWEP:RenderTargetFunc()
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk then
			self.ForegripParent = "foregrip"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_cobra then
			self.ForegripParent = "anglegrip"
			self.ForegripOverride = true
			return
		else
			self.ForegripParent = "idle"
			self.ForegripOverride = true
			return
		end
	end
//The code block below comes from KnifeKitty's c-hand plugin. He just removed it from his workshop so I have to copy and paste it here. I DO NOT claim credit from it.
	local hands, pos, ang

	CustomizableWeaponry.callbacks:addNew("initialize", "KK_GM_HANDS", function(wep)
		if wep and wep.UseHands and wep.elementRender then
			wep.CW_GREN:SetModel("models/weapons/cstrike/c_eq_fraggrenade.mdl")
			
			wep.elementRender.KK_GM_HANDS = function(self)
				hands = self.Owner:GetHands()
				
				if CurTime() > self.grenadeTime then
					hands:SetParent(self.CW_VM)
					hands:AddEffects(EF_BONEMERGE)
					if self.ViewModelFlip then
						render.CullMode(MATERIAL_CULLMODE_CW)
							hands:DrawModel()
						render.CullMode(MATERIAL_CULLMODE_CCW)
					else
						hands:DrawModel()
					end
				else
					hands:SetParent(self.CW_GREN)
					hands:AddEffects(EF_BONEMERGE_FASTCULL)
				end				
			end
			
			wep.drawGrenade = function(self)
				if CurTime() > self.grenadeTime then
					return
				end
				
				if self.CW_GREN:GetCycle() >= 0.98 then
					return
				end
				
				pos, ang = EyePos(), EyeAngles()
				
				self.GrenadePos.z = Lerp(FrameTime() * 10, self.GrenadePos.z, 0)
				
				pos = pos + ang:Up() * self.GrenadePos.z
				pos = pos + ang:Forward() * 2
				
				self.CW_GREN:SetPos(pos)
				self.CW_GREN:SetAngles(ang)
				self.CW_GREN:FrameAdvance(FrameTime())
				self.CW_GREN:FrameAdvance(FrameTime())
				
				cam.IgnoreZ(true)
					self.CW_GREN:DrawModel()
					self.Owner:GetHands():DrawModel()
				cam.IgnoreZ(false)
			end
		end
	end)

	function SWEP:getMuzzlePosition()
		if self.CustomizeMenuAlpha > 0 then 
			return self.CW_VM:GetAttachment(1)

		end
	end




	function SWEP:IndividualThink()	
		if self.ActiveAttachments.md_eft_si_acog_ta11d then
			self.EFTRMRmountPos = Vector(-3.61, -5, -1.7)
			self.EFTRMRmountAng = Vector(0, 0, 0)					
		else
			self.EFTRMRmountPos = Vector(-3.61, -5, -1.5)
			self.EFTRMRmountAng = Vector(0, 0, 0)			
		end	
		if (self.ActiveAttachments.md_eft_si_acog_ta11d or self.ActiveAttachments.md_eft_si_acog_ta01nsn or self.ActiveAttachments.md_eft_si_acog_ta01nsn_tan) and self.ActiveAttachments.md_eft_si_rmr_wo_mount  then
			self.AttachmentModelsVM.md_eft_mt_rm35.active = true
		else
			self.AttachmentModelsVM.md_eft_mt_rm35.active = false
		end

		if not self.ActiveAttachments.md_eft_si_hamr then
			self.AttachmentModelsVM.md_eft_si_dp_wo_mount.active = false
		end

		if not (self.ActiveAttachments.md_eft_si_acog_ta01nsn or self.ActiveAttachments.md_eft_si_acog_ta01nsn_tan or self.ActiveAttachments.md_eft_si_acog_ta11d) then
			self.AttachmentModelsVM.md_eft_si_rmr_wo_mount.active = false
		end

		local no_rail = not (self.ActiveAttachments.mp7a1_rails_std or self.ActiveAttachments.mp7a2_rails_navy)
		local iron = self.ActiveAttachments.sight_all_hk_mp7_std_unfolded or self.ActiveAttachments.sight_all_hk_mp7_std_folded
		local laser = self.ActiveAttachments.md_eft_ld_anpeq15 or self.ActiveAttachments.md_eft_ld_la5 or self.ActiveAttachments.md_eft_ld_perst3 or self.ActiveAttachments.md_eft_ld_ls321
		if no_rail then
			self.EFTDPbackupPos = Vector(-5.25, -5, 0.65)
			self.EFTDPbackupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-5.25, -5, 0.66)
			self.EFTPK06backupAng = Vector(0, 0, -45)

			self.EFTRMRbackupPos = Vector(-5.75, -5, 0.14)
			self.EFTRMRbackupAng = Vector(0, 0, -45)

			self.EFTFF3backupPos = Vector(-5.05, -5, 0.84)
			self.EFTFF3backupAng = Vector(0, 0, -45)	
			if not iron then
				if laser then
					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-11, 0.02, 3.58)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle()

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-11.2, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-11.2, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-11.2, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-11.2, 0.88, 3.72)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(0.35, 0.02, 3.43)
					self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(0.3, 0.03, 3.41)
					self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(0.1, 0.05, 3.38)
					self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(0.15, 0.05, 3.45)

				else
					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-0.88, 0.02, 3.58)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle()

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-1.08, 0.88, 3.72)
				end
			else
				self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-8.44, 0.02, 3.58)
				self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle()

				self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-8.65, 0.88, 3.72)
				self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-8.65, 0.88, 3.72)
				self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-8.65, 0.88, 3.72)
				self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-8.65, 0.88, 3.72)

				self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(-4.07, 0.05, 3.38)
				self.AttachmentModelsVM.md_eft_ld_perst3.angle = Angle(0, 0, 180)

				self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(-3.82, 0.02, 3.43)
				self.AttachmentModelsVM.md_eft_ld_anpeq15.angle = Angle(0, 0, 180)

				self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(-3.87, 0.03, 3.41)
				self.AttachmentModelsVM.md_eft_ld_la5.angle = Angle(0, 0, 180)

				self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(-4.02, 0.05, 3.45)
				self.AttachmentModelsVM.md_eft_ld_ls321.angle = Angle(0, 0, 180)
			end
		else
			if not iron then
				if self.ActiveAttachments.laser_backup_switch then
					self.EFTDPbackupPos = Vector(-5.25, -5, 0.65)
					self.EFTDPbackupAng = Vector(0, 0, -45)

					self.EFTPK06backupPos = Vector(-5.25, -5, 0.66)
					self.EFTPK06backupAng = Vector(0, 0, -45)
	
					self.EFTRMRbackupPos = Vector(-5.75, -5, 0.14)
					self.EFTRMRbackupAng = Vector(0, 0, -45)
	
					self.EFTFF3backupPos = Vector(-5.05, -5, 0.84)
					self.EFTFF3backupAng = Vector(0, 0, -45)	
	

					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-0.88, 0.02, 3.58)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle()

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-1.08, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-1.08, 0.88, 3.72)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(0.1, 1, 1.35)
					self.AttachmentModelsVM.md_eft_ld_anpeq15.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(0.2, 0.97, 1.38)
					self.AttachmentModelsVM.md_eft_ld_la5.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(0.05, 0.97, 1.35)
					self.AttachmentModelsVM.md_eft_ld_ls321.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(0.45, 0.95, 1.4)
					self.AttachmentModelsVM.md_eft_ld_perst3.angle = Angle(0, 0, -90)

				else
					self.EFTRMRbackupPos = Vector(-6.15, -5, 1.66)
					self.EFTRMRbackupAng = Vector(0, 0, -45)

					self.EFTFF3backupPos = Vector(-5.45, -5, 2.36)
					self.EFTFF3backupAng = Vector(0, 0, -45)

					self.EFTPK06backupPos = Vector(-5.65, -5, 2.18)
					self.EFTPK06backupAng = Vector(0, 0, -45)	

					self.EFTDPbackupPos = Vector(-5.65, -5, 2.17)
					self.EFTDPbackupAng = Vector(0, 0, -45)	

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-0.73, 1.3, 2.22)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-0.73, 1.3, 2.22)	
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-0.73, 1.3, 2.22)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-0.73, 1.3, 2.22)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(0.35, 0.02, 3.43)
					self.AttachmentModelsVM.md_eft_ld_anpeq15.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(0.3, 0.03, 3.41)
					self.AttachmentModelsVM.md_eft_ld_la5.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(0.1, 0.05, 3.38)
					self.AttachmentModelsVM.md_eft_ld_perst3.angle = Angle(0, 0, 180)
	
					self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(0.15, 0.05, 3.45)
					self.AttachmentModelsVM.md_eft_ld_ls321.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-0.53, 1.13, 1.38)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle(0, 180, -90)
				end
			else
				if self.ActiveAttachments.laser_backup_switch then
					self.EFTDPbackupPos = Vector(-5.25, -5, 0.65)
					self.EFTDPbackupAng = Vector(0, 0, -45)

					self.EFTPK06backupPos = Vector(-5.25, -5, 0.66)
					self.EFTPK06backupAng = Vector(0, 0, -45)
	
					self.EFTRMRbackupPos = Vector(-5.75, -5, 0.14)
					self.EFTRMRbackupAng = Vector(0, 0, -45)
	
					self.EFTFF3backupPos = Vector(-5.05, -5, 0.84)
					self.EFTFF3backupAng = Vector(0, 0, -45)	
	

					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-8.44, 0.02, 3.58)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle()

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-8.65, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-8.65, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-8.65, 0.88, 3.72)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-8.65, 0.88, 3.72)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(0.1, 1, 1.35)
					self.AttachmentModelsVM.md_eft_ld_anpeq15.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(0.2, 0.97, 1.38)
					self.AttachmentModelsVM.md_eft_ld_la5.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(0.05, 0.97, 1.35)
					self.AttachmentModelsVM.md_eft_ld_ls321.angle = Angle(0, 0, -90)

					self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(0.45, 0.95, 1.4)
					self.AttachmentModelsVM.md_eft_ld_perst3.angle = Angle(0, 0, -90)

				else
					self.EFTRMRbackupPos = Vector(-6.15, -5, 1.66)
					self.EFTRMRbackupAng = Vector(0, 0, -45)

					self.EFTFF3backupPos = Vector(-5.45, -5, 2.36)
					self.EFTFF3backupAng = Vector(0, 0, -45)

					self.EFTPK06backupPos = Vector(-5.65, -5, 2.18)
					self.EFTPK06backupAng = Vector(0, 0, -45)	

					self.EFTDPbackupPos = Vector(-5.65, -5, 2.17)
					self.EFTDPbackupAng = Vector(0, 0, -45)	

					self.AttachmentModelsVM.md_eft_si_dp_backup.pos = Vector(-0.73, 1.3, 2.22)
					self.AttachmentModelsVM.md_eft_si_pk06_backup.pos = Vector(-0.73, 1.3, 2.22)	
					self.AttachmentModelsVM.md_eft_si_ff3_backup.pos = Vector(-0.73, 1.3, 2.22)
					self.AttachmentModelsVM.md_eft_si_rmr_backup.pos = Vector(-0.73, 1.3, 2.22)

					self.AttachmentModelsVM.md_eft_ld_perst3.pos = Vector(-4.07, 0.05, 3.38)
					self.AttachmentModelsVM.md_eft_ld_perst3.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.pos = Vector(-3.82, 0.02, 3.43)

					self.AttachmentModelsVM.md_eft_ld_anpeq15.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_ld_la5.pos = Vector(-3.87, 0.03, 3.41)
					self.AttachmentModelsVM.md_eft_ld_la5.angle = Angle(0, 0, 180)

					self.AttachmentModelsVM.md_eft_ld_ls321.pos = Vector(-4.02, 0.05, 3.45)
					self.AttachmentModelsVM.md_eft_ld_ls321.angle = Angle(0, 0, 180)


					self.AttachmentModelsVM.md_eft_mt_mpr45.pos = Vector(-0.53, 1.13, 1.38)
					self.AttachmentModelsVM.md_eft_mt_mpr45.angle = Angle(0, 180, -90)
				end	
			end			
		end
	end
end//if client
	if USE_OLD_WELEMENTS then
		if CLIENT then
			CustomizableWeaponry.callbacks:addNew("initialize", "SA-58", function(wep) // instead of copy pasting 50+ lines of func, 5 lines can do even more
				if wep and wep:GetClass() == "cw_eft_mp5" then
					wep:CreateModels(wep.WElements)
				end
			end)
		
			function SWEP:WElementThink()
					//if self.ActiveAttachments.bg_mp530rndmag then
					//	self.WMEnt:SetBodygroup(4,1)
					//else
					//	self.WMEnt:SetBodygroup(4,0)
					//end	
					//if self.ActiveAttachments.bg_retractablestock then
					//	self.WMEnt:SetBodygroup(1,2)
					//end	
	
	
			end
	 
			local Vec0, Ang0 = Vector(0, 0, 0), Angle(0, 0, 0)
			local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, EA, delta, sin2, mul, vm, muz, muz2, tr, att
			local td = {}
			local LerpVector, LerpAngle, Lerp = LerpVector, LerpAngle, Lerp
	
			local reg = debug.getregistry()
			local GetVelocity = reg.Entity.GetVelocity
			local Length = reg.Vector.Length
			local Right = reg.Angle.Right
			local Up = reg.Angle.Up
			local Forward = reg.Angle.Forward
			local RotateAroundAxis = reg.Angle.RotateAroundAxis
			local GetBonePosition = reg.Entity.GetBonePosition
	
			local ManipulateBonePosition, ManipulateBoneAngles = reg.Entity.ManipulateBonePosition, reg.Entity.ManipulateBoneAngles
			
			local wm, pos, ang
			SWEP.wRenderOrder = nil
	
			function SWEP:DrawWorldModel()
				if self.dt.Safe then
					if self.CHoldType != self.RunHoldType then
						self:SetHoldType(self.RunHoldType)
						self.CHoldType = self.RunHoldType
					end
				else
					if self.dt.State == CW_RUNNING or self.dt.State == CW_ACTION then
						if self.CHoldType != self.RunHoldType then
							self:SetHoldType(self.RunHoldType)
							self.CHoldType = self.RunHoldType
						end
					else
						if self.CHoldType != self.NormalHoldType then
							self:SetHoldType(self.NormalHoldType)
							self.CHoldType = self.NormalHoldType
						end
					end
				end
						
				-- /*
				if self.DrawTraditionalWorldModel then
					self:DrawModel()
				else
					wm = self.WMEnt
						
					if IsValid(wm) then
						if IsValid(self.Owner) then
							pos, ang = GetBonePosition(self.Owner, self.Owner:LookupBone("ValveBiped.Bip01_R_Hand"))
								
							if pos and ang then
								RotateAroundAxis(ang, Right(ang), self.WMAng[1])
								RotateAroundAxis(ang, Up(ang), self.WMAng[2])
								RotateAroundAxis(ang, Forward(ang), self.WMAng[3])
	
								pos = pos + self.WMPos[1] * Right(ang) 
								pos = pos + self.WMPos[2] * Forward(ang)
								pos = pos + self.WMPos[3] * Up(ang)
									
								wm:SetRenderOrigin(pos)
								wm:SetRenderAngles(ang)
								wm:DrawModel()
							end
						else
							wm:SetRenderOrigin(self:GetPos())
							wm:SetRenderAngles(self:GetAngles())
							wm:DrawModel()
							wm:DrawShadow()
						end
					else
						self:DrawModel()
					end
				end  //*/
					
				self:WElementThink()
					
				if (!self.WElements) then return end
					
				if (!self.wRenderOrder) then
					self.wRenderOrder = {}
	
					for k, v in pairs( self.WElements ) do
						if (v.type == "Model") then
							table.insert(self.wRenderOrder, 1, k)
						elseif (v.type == "Sprite" or v.type == "Quad") then
							table.insert(self.wRenderOrder, k)
						end
					end
				end
					
				if (IsValid(self.Owner)) then
					bone_ent = self.Owner
				else
						// when the weapon is dropped
					bone_ent = self
					-- bone_ent = self.WElements["wm"].modelEnt
					-- bone_ent = self.WMEnt
				end
					
				for k, name in pairs( self.wRenderOrder ) do
					
					local v = self.WElements[name]
					if (!v) then self.wRenderOrder = nil break end
					if (v.hide) then continue end
						
					local pos, ang
						
					if (v.bone) then
						pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
					else
						pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
					end
						
					if (!pos) then continue end
						
					local model = v.modelEnt
					local sprite = v.spriteMaterial
						
					if (v.type == "Model" and IsValid(model)) then
	
						if IsValid(self.Owner) then
							model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
							ang:RotateAroundAxis(ang:Up(), v.angle.y)
							ang:RotateAroundAxis(ang:Right(), v.angle.p)
							ang:RotateAroundAxis(ang:Forward(), v.angle.r)
						else
							model:SetPos(pos + ang:Forward() * v.pos_dropped.x + ang:Right() * v.pos_dropped.y + ang:Up() * v.pos_dropped.z )
							ang:RotateAroundAxis(ang:Up(), v.angle_dropped.y)
							ang:RotateAroundAxis(ang:Right(), v.angle_dropped.p)
							ang:RotateAroundAxis(ang:Forward(), v.angle_dropped.r)
						end
							
						model:SetAngles(ang)
						//model:SetModelScale(v.size)
						local matrix = Matrix()
						matrix:Scale(v.size)
						model:EnableMatrix( "RenderMultiply", matrix )
							
						if (v.material == "") then
							model:SetMaterial("")
						elseif (model:GetMaterial() != v.material) then
							model:SetMaterial( v.material )
						end
							
						if (v.skin and v.skin != model:GetSkin()) then
							model:SetSkin(v.skin)
						end
						
						if (v.bodygroup) then
							for k, v in pairs( v.bodygroup ) do
								if (model:GetBodygroup(k) != v) then
									model:SetBodygroup(k, v)
								end
							end
						end
							
						if (v.surpresslightning) then
							render.SuppressEngineLighting(true)
						end
							
						render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
						render.SetBlend(v.color.a/255)
						model:DrawModel()
						render.SetBlend(1)
						render.SetColorModulation(1, 1, 1)
							
						if (v.surpresslightning) then
							render.SuppressEngineLighting(false)
						end
							
					-- elseif (v.type == "Sprite" and sprite) then
							
						-- local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
						-- render.SetMaterial(sprite)
						-- render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
							
					-- elseif (v.type == "Quad" and v.draw_func) then
							
						-- local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
						-- ang:RotateAroundAxis(ang:Up(), v.angle.y)
						-- ang:RotateAroundAxis(ang:Right(), v.angle.p)
						-- ang:RotateAroundAxis(ang:Forward(), v.angle.r)
							
						-- cam.Start3D2D(drawpos, ang, v.size)
							-- v.draw_func( self )
						-- cam.End3D2D()
					end
				end
			end
			
			function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
					
				local bone, pos, ang
				if (tab.rel and tab.rel != "") then
						
					local v = basetab[tab.rel]
						
					if (!v) then return end
						
					// Technically, if there exists an element with the same name as a bone
					// you can get in an infinite loop. Let's just hope nobody's that stupid.
					pos, ang = self:GetBoneOrientation( basetab, v, ent )
						
					if (!pos) then return end
						
					pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
					ang:RotateAroundAxis(ang:Up(), v.angle.y)
					ang:RotateAroundAxis(ang:Right(), v.angle.p)
					ang:RotateAroundAxis(ang:Forward(), v.angle.r)
							
				else
					
					bone = ent:LookupBone(bone_override or tab.bone)
	
					if (!bone) then return end
						
					pos, ang = Vector(0,0,0), Angle(0,0,0)
					local m = ent:GetBoneMatrix(bone)
					if (m) then
						pos, ang = m:GetTranslation(), m:GetAngles()
					end
						
					if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
						ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
						ang.r = -ang.r // Fixes mirrored models
					end
					
				end
			end
	
			function SWEP:CreateModels( tab )
	
				if (!tab) then return end
	
				-- Create the clientside models here because Garry says we cannot do it in the render hook 
				for k, v in pairs( tab ) do
					if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
							string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
						
						v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
						if (IsValid(v.modelEnt)) then
							v.modelEnt:SetPos(self:GetPos())
							v.modelEnt:SetAngles(self:GetAngles())
							v.modelEnt:SetParent(self)
							v.modelEnt:SetNoDraw(true)
							v.createdModel = v.model
						else
							v.modelEnt = nil
						end
							
					elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
						and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
							
						local name = v.sprite.."-"
						local params = { ["$basetexture"] = v.sprite }
						-- make sure we create a unique name based on the selected options
						local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
						for i, j in pairs( tocheck ) do
							if (v[j]) then
								params["$"..j] = 1
								name = name.."1"
							else
								name = name.."0"
							end
						end
	
						v.createdSprite = v.sprite
						v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
							
					end
				end
					
			end
				
			/**************************
				Global utility code
			**************************/
	
			// Fully copies the table, meaning all tables inside this table are copied too and so on (Normal table. Copy copies only their reference).
			// Does not copy entities of course.
			// WARNING: do not use on tables that contain themselves somewhere down the line or you will get an infinite loop
			function table.FullCopy( tab )
	
				if (!tab) then return nil end
					
				local res = {}
				for k, v in pairs( tab ) do
					if (type(v) == "table") then
						res[k] = table.FullCopy(v) -- recursion ho!
					elseif (type(v) == "Vector") then
						res[k] = Vector(v.x, v.y, v.z)
					elseif (type(v) == "Angle") then
						res[k] = Angle(v.p, v.y, v.r)
					else
						res[k] = v
					end
				end
					
				return res
			end
		end
	end


end //if cw
