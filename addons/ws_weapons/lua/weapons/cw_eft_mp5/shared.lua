if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

util.PrecacheModel("models/cw_eft/c_eft_mp5.mdl")
util.PrecacheModel("models/cw_eft/w_eft_mp5.mdl")

local Vec0 = Vector(0,0,0)
local Vec1 = Vector(1,1,1)
local Ang0 = Angle(0,0,0)
	
local USE_OLD_WELEMENTS = true		//requires map restart

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "H&K MP5"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	SWEP.MuzzleAttachment = 1
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = -5
	SWEP.ShellPosOffset = {x = 2, y = 5, z = 1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-3.34, -9.323, 1.8)
	SWEP.IronsightAng = Vector(0.388, -0.051, 0)
	
	SWEP.PronePos = Vector(-7.397, -12.497, -8.551)
	SWEP.ProneAng = Vector(16.9, 53.4, -60)

	SWEP.MicroT1Pos = Vector(2.042, -0.2, 0.66)
	SWEP.MicroT1Ang = Vector(-1.668, 0, 0)		

	SWEP.EoTechPos = Vector(2.042, -5.042, 0.014)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.AimpointPos = Vector(2.03, -5.14, 0.171)
	SWEP.AimpointAng = Vector(0, -0.105, 0)
	
	SWEP.ACOGPos = Vector(2.028, -5.613, -0.113)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.MagnifierPos = Vector(2.03, -5.042, 0.05)
	SWEP.MagnifierAng = Vector(0, 0, 0)

	SWEP.BackupReflexPos = Vector(3.63, -1.9945, 1.65)
	SWEP.BackupReflexAng = Vector(0, 0, 45)
	
	SWEP.SprintPos = Vector(9.1954, -6, 0.082)
	SWEP.SprintAng = Vector(-12.849, 37, 0)

	SWEP.CustomizePos = Vector(15, -5, -1.)
	SWEP.CustomizeAng = Vector(13.66, 45.86, 0)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
		
	SWEP.ShortDotPos = Vector(2.009, -5.844, 0.263)
	SWEP.ShortDotAng = Vector(0, 0, 0)



	SWEP.EFTMICROT1Pos =  Vector(-3.34, -9.323, 0.85)
	SWEP.EFTMICROT1Ang = Vector(0, 0, 0)

	SWEP.EFTSRS02Pos =  Vector(-3.33, -9.323, 0.146)
	SWEP.EFTSRS02Ang = Vector(-2.8, 0.1, 0)	

	SWEP.EFTDPPos = Vector(-3.35, -7.323, 0.4)
	SWEP.EFTDPAng = Vector(0, 0, 0)	

	SWEP.EFTMRSPos =  Vector(-3.35, -9.323, -0.02)
	SWEP.EFTMRSAng = Vector(0, 0, 0)		

	SWEP.EFTROMEO4Pos =  Vector(-3.35, -9.323, -0.15)
	SWEP.EFTROMEO4Ang = Vector(0, 0, 0)	

	SWEP.EFTPS320Pos =  Vector(-3.35, -7, -0.1)
	SWEP.EFTPS320Ang = Vector(0, 0, 0)

	SWEP.EFTPK06Pos =  Vector(-3.36, -7, 0.55)
	SWEP.EFTPK06Ang = Vector(0, 0, 0)	

	SWEP.EFTOKP7Pos =  Vector(-3.35, -7, 0.35)
	SWEP.EFTOKP7Ang = Vector(0, 0, 0)			

	SWEP.EFTEKPPos =  Vector(-3.35, -9.323, -0.45)
	SWEP.EFTEKPAng = Vector(0, 0, 0)	

	SWEP.EFTFF3Pos =  Vector(-3.35, -7, 0.9)
	SWEP.EFTFF3Ang = Vector(0, 0, 0)

	SWEP.EFTRMRPos =  Vector(-3.35, -7, -0.25)
	SWEP.EFTRMRAng = Vector(0, 0, 0)	

	SWEP.EFTP1X42Pos =  Vector(-3.35, -7, 0)
	SWEP.EFTP1X42Ang = Vector(0, 0, 0)	

	SWEP.EFT1P87Pos =  Vector(-3.29, -5, -0.8)
	SWEP.EFT1P87Ang = Vector(0, 0, 0)	

	SWEP.EFTHS401G5Pos =  Vector(-3.35, -9.323, 0)
	SWEP.EFTHS401G5Ang = Vector(0, 0, 0)	

	SWEP.EFTCOMPM4Pos =  Vector(-3.35, -9.323, 0.3)
	SWEP.EFTCOMPM4Ang = Vector(0, 0, 0)

	SWEP.EFTPRISM2XPos =  Vector(-3.35, -7, 0.35)
	SWEP.EFTPRISM2XAng = Vector(0, 0, 0)

	SWEP.EFTPRISMPos =  Vector(-3.35, -7, -0.35)
	SWEP.EFTPRISMAng = Vector(0, 0, 0)

	SWEP.EFT553Pos =  Vector(-3.35, -5, -0.35)
	SWEP.EFT553Ang = Vector(0, 0, 0)		

	SWEP.EFTACOGTA11DPos =  Vector(-3.33, -7, -0.35)
	SWEP.EFTACOGTA11DAng = Vector(0, 0, 0)

	SWEP.EFTBRAVO4Pos =  Vector(-3.35, -7, 0)
	SWEP.EFTBRAVO4Ang = Vector(0, 0, 0)

	SWEP.EFTUH1Pos = Vector(-3.35, -7, -0.45)
	SWEP.EFTUH1Ang = Vector(0.4, 0, 0)	

	SWEP.EFTACOGTA01Pos = Vector(-3.35, -7, -0.35)
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)

	SWEP.EFTHAMRPos =  Vector(-3.33, -7, -0.35)
	SWEP.EFTHAMRAng = Vector(0, 0, 0)

	SWEP.EFTElcanPos =  Vector(-3.35, -7, -0.3)
	SWEP.EFTElcanAng = Vector(0, 0, 0)

	SWEP.EFTEXPS32Pos = Vector(-3.35, -7, -0.45)
	SWEP.EFTEXPS32Ang = Vector(0.4, 0, 0)		



	SWEP.EFTRMRmountPos = Vector(-3.34, -7, -2)
	SWEP.EFTRMRmountAng = Vector(0, 0, 0)	

	SWEP.EFTRMRbackupPos = Vector(-5.8, -5, 0.05)
	SWEP.EFTRMRbackupAng = Vector(0, 0, -45)

		--SWEP.EFTP1X42backupPos = Vector(-5.3, -5, 0.57)
		--SWEP.EFTP1X42backupAng = Vector(0, 0, -45)

	SWEP.EFTFF3backupPos = Vector(-5, -5, 0.855)
	SWEP.EFTFF3backupAng = Vector(0, 0, -45)

	SWEP.EFTPK06backupPos = Vector(-5.22, -5, 0.65)
	SWEP.EFTPK06backupAng = Vector(0, 0, -45)	

	SWEP.EFTDPmountPos = Vector(-3.33, -9, -2)
	SWEP.EFTDPmountAng = Vector(0, 0, 0)	

	SWEP.EFTDPbackupPos = Vector(-5.3, -5, 0.57)
	SWEP.EFTDPbackupAng = Vector(0, 0, -45)	




	SWEP.BackupSights = {			
		["md_eft_si_elcan"] = {[1]= Vector(-3.35, -7, -1.7), [2] = Vector(0, 0, 0)}, 
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 3, roll = 1, forward = 1, pitch = 1}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.SprintViewNormals = {x = 1, y = -1, z = 1}


	SWEP.AttachmentModelsVM = {
		["md_eft_sil_aac"] = {model = "models/weapons/cw_eft/upgrades/silencers/aac/v_aac.mdl", pos = Vector(14.43, -0.835, 0), angle = Angle(0, 0, -90), size = Vector(1.4, 1.4, 1.4), bone = "A_Suppressor"},
		["md_eft_sil_rotor43"] = {model = "models/weapons/cw_eft/upgrades/silencers/rotor/v_rotor.mdl", pos = Vector(14.43, -0.835, 0), angle = Angle(0, 0, -90), size = Vector(1.4, 1.4, 1.4), bone = "A_Suppressor"},
		["md_eft_sil_srd9"] = {model = "models/weapons/cw_eft/upgrades/silencers/srd/v_srd.mdl", pos = Vector(14.42, -0.835, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Suppressor"},
		["md_eft_sil_osprey9"] = { model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", pos = Vector(14.43, -0.835, 0), angle = Angle(0, 0, -90), size = Vector(1.4, 1.4, 1.4), bone = "A_Suppressor"},

		["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", pos = Vector(9.9, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},
		["md_eft_fg_afg_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_blk.mdl", pos = Vector(9.67, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},
		["md_eft_fg_vpg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/vpg/v_vpg.mdl", pos = Vector(10.16, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},
		["md_eft_fg_bgv_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/bgv-mk46/v_bgv_blk.mdl", pos = Vector(9.65, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},
		--["md_eft_fg_cqr"] = {model = "models/weapons/cw_eft/upgrades/foregrips/cqr/v_cqr.mdl", pos = Vector(9.9, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},
		["md_eft_fg_cobra"] = {model = "models/weapons/cw_eft/upgrades/foregrips/cobra/v_cobra.mdl", pos = Vector(9.5, 0.77, -0.02), angle = Angle(0, 0, -90), size = Vector(0.505, 0.505, 0.505), bone = "Dummy01"},

		["md_eft_si_t1"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/t1/v_t1.mdl", pos = Vector(1.75, -3.1, -0.02), angle = Angle(0, 0, -90), size = Vector(1.25, 1.25, 1.25), bone = "A_Optic"},
		["md_eft_si_romeo"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/romeo/v_romeo.mdl", pos = Vector(1.75, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},		
		["md_eft_si_mrs"] = {model = "models/weapons/cw_eft/upgrades/scopes/mrs/v_mrs.mdl", pos = Vector(1.32, -3.17, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},			
		["md_eft_si_dp"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp.mdl", pos = Vector(1.32, -3.17, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},			
		["md_eft_si_srs"] = {model = "models/weapons/cw_eft/upgrades/scopes/srs/v_srs.mdl", pos = Vector(1.32, -3.17, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},			
			["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", pos = Vector(1.32, -3.17, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},				
			["md_eft_si_okp7"] = {model = "models/weapons/cw_eft/upgrades/scopes/okp7/v_okp7.mdl", pos = Vector(0.11, -3.17, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},					
			["md_eft_si_pk06"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/pk06/v_pk06.mdl", pos = Vector(1.32, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},			
			["md_eft_si_rmr"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr.mdl", pos = Vector(1.32, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			["md_eft_si_pilad"] = {model = "models/weapons/cw_eft/upgrades/scopes/pilad/v_pilad.mdl", pos = Vector(1.32, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			["md_eft_si_ff3"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", pos = Vector(1.32, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},


		["md_eft_si_ps320"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ps320/v_ps320.mdl", pos = Vector(0.36, -3.14, 0.04), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_acog_ta11d"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta11d/v_ta11d.mdl", pos = Vector(0.295, -3.025, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_prism"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/prism/v_prism.mdl", pos = Vector(1.75, -3.08, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_prism_2x"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/prism2x/v_prism2x.mdl", pos = Vector(1.75, -3.08, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},		
		["md_eft_si_hs401g5"] = {model = "models/weapons/cw_eft/upgrades/scopes/hs401g5/v_hs401g5.mdl", pos = Vector(1.75, -3.1, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_elcan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/v_elcan.mdl", pos = Vector(0.45, -3.19, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_hamr"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/hamr/v_hamr.mdl", pos = Vector(1.37, -3.09, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", pos = Vector(0.29, -3.025, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_bravo4"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/bravo4/v_bravo4.mdl", pos = Vector(1.35, -3.08, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},

		["md_eft_si_553"] = {model = "models/weapons/cw_eft/upgrades/scopes/553/v_553.mdl", pos = Vector(0.25, -3.15, -0.02), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},	
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", pos = Vector(1.6, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},	
		["md_eft_si_exps3"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3.mdl", pos = Vector(1.6, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", pos = Vector(1.285, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", pos = Vector(-0.9, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},	
		["md_eft_si_m4"] = {model = "models/weapons/cw_eft/upgrades/scopes/comp_m4/v_m4.mdl", pos = Vector(0.37, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", pos = Vector(-0.15, -3.11, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},

		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", pos = Vector(11.92, -0.58, 1.373), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},
		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(11.9, -0.58, 1.373), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},
		["md_eft_ld_perst3"] = {model = "models/weapons/cw_eft/upgrades/tactical/perst3/v_perst3.mdl", pos = Vector(12.08, -0.6, 1.331), angle = Angle(0, 0, 180), size = Vector(1.1, 1.1, 1.1), bone = "A_LaserFlashlight"},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(11.85, -0.575, 1.37), angle = Angle(0, 0, 180), size = Vector(1.27, 1.27, 1.27), bone = "A_LaserFlashlight"},

			["md_eft_si_dp_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp.mdl", pos = Vector(5.23, -3.395, 0.98), angle = Angle(0, 0, -45), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_dp_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp_wo_mount.mdl", pos = Vector(2.27, -5.6, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			["md_eft_si_pk06_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/pk06/v_pk06.mdl", pos = Vector(5.23, -3.395, 0.98), angle = Angle(0, 0, -45), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			["md_eft_si_ff3_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", pos = Vector(5.23, -3.395, 0.98), angle = Angle(0, 0, -45), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			--["md_eft_si_pilad_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/pilad/v_pilad.mdl", pos = Vector(5.23, -3.395, 0.98), angle = Angle(0, 0, -45), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
			["md_eft_si_rmr_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr.mdl", pos = Vector(5.23, -3.395, 0.98), angle = Angle(0, 0, -45), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},
		["md_eft_si_rmr_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr_wo_mount.mdl", pos = Vector(-3.7, -4.82, -0.01), angle = Angle(0, 0, -90), size = Vector(1.27, 1.27, 1.27), bone = "A_Optic"},

		//hax["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(7.8, -0.805, 1.1), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
		--["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(6.58, -0.59, 1.56), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
		//ptrtri["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(7.8, -0.795, 1.325), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
		//ring["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(14.75, -0.825, 1.465), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
		["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", pos = Vector(5, -3.22, -0.02), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
		["md_eft_mt_rm35"] = {model = "models/weapons/cw_eft/upgrades/mounts/rm35/mount_acog_trijicon_rm35.mdl", pos = Vector(-4.35, -5.27, -0.01), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},


	}
		

	SWEP.ForegripOverridePos = {
		["foregrip"] = {
			["Left Annularis Phalanges2"] = {pos = Vector(), angle = Angle(0, 25.9771, 0)},
			["Left Annularis Phalanges1"] = {pos = Vector(), angle = Angle(0, -26.9215, -11.6353)},
			["Left Polex Phalange3"] = {pos = Vector(), angle = Angle(-15.3168, -43.8863, 24.0837)},
			["Left Impudicus Phalanges1"] = {pos = Vector(), angle = Angle(0, -20.7424, -5.6857)},
			["Left Auricularis Phalanges1"] = {pos = Vector(), angle = Angle(0, -17.4852, 0)},
			["Left Demonstratus Phalanges1"] = {pos = Vector(), angle = Angle(0, -16.4449, 0)},
			["Left Polex Phalange2"] = {pos = Vector(), angle = Angle(-13.3286, -18.1104, 7.7047)},
			["Left Lower Arm 2"] = {pos = Vector(), angle = Angle(4.9718, -16.1535, 0)},
			["Left Hand"] = {pos = Vector(2.9, 0.5119, -0.9926), angle = Angle(-2.4797, -6.2081, 80.5231)},
			["Left Polex Metacarpal"] = {pos = Vector(), angle = Angle(0, -6.1644, 0)},
			["Left Demonstratus Phalanges2"] = {pos = Vector(), angle = Angle(0, -33.9395, 0)},
			["Left Polex Phalange1"] = {pos = Vector(), angle = Angle(-4.6797, 0, 0)},
		},
		["anglegrip"] = {
			["Left Annularis Phalanges1"] = {pos = Vector(), angle = Angle(17.9551, -29.5823, 0)},
			["Left Polex Phalange3"] = {pos = Vector(), angle = Angle(-3.5899, -19.4021, 22.0267)},
			["Left Polex Phalange2"] = {pos = Vector(), angle = Angle(7.971, 16.918, -5.4222)},
			["Left Lower Arm 2"] = {pos = Vector(), angle = Angle(7.7364, -15.8316, 0)},
			["Left Polex Phalange1"] = {pos = Vector(), angle = Angle(2.7502, 0, 0)},
			["Left Impudicus Phalanges1"] = {pos = Vector(), angle = Angle(22.1594, -35.1957, 0)},
			["Left Demonstratus Phalanges1"] = {pos = Vector(), angle = Angle(10.1245, -27.1747, 14.9469)},
			["Left Hand"] = {pos = Vector(2.2379, 0.8, -0.1313), angle = Angle(0.0795, 3.6652, 26.2415)},
			["Left Auricularis Phalanges1"] = {pos = Vector(), angle = Angle(21.9354, -26.7329, 0)},
			["Left Polex Metacarpal"] = {pos = Vector(), angle = Angle(22.3231, 20.4329, 6.76)},
		},
		["none"] = {},
	}

	SWEP.AttachmentPosDependency = {
		["md_eft_fg_rvg"] = {
			["handguard_mp5_caa_hx5"] = Vector(9.75, 0.13, -0.04),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(9.8, 0.4, -0.05),
		},
		["md_eft_fg_afg_blk"] = { 
			["handguard_mp5_caa_hx5"] = Vector(9.52, 0.13, -0.05),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(9.57, 0.4, -0.05),
		},
		["md_eft_fg_vpg"] = { 
			["handguard_mp5_caa_hx5"] = Vector(10.01, 0.12, -0.05),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(10.06, 0.4, -0.05),
		},
		["md_eft_fg_bgv_blk"] = { 
			["handguard_mp5_caa_hx5"] = Vector(9.5, 0.12, -0.05),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(9.55, 0.4, -0.02),
		},
		["md_eft_fg_cobra"] = { 
			["handguard_mp5_caa_hx5"] = Vector(9.35, 0.12, -0.05),
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(9.4, 0.4, -0.05),
		},

		["md_eft_ld_anpeq15"] = { 
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(12.72, -0.78, 1.13),
			["handguard_mp5_caa_hx5"] = Vector(13.63, -0.8, 0.9),
			["mount_mp5sd_bt_tri_rail_ring"]= Vector(16.1, -0.8, -1.3),
		},
		["md_eft_ld_la5"] = { 
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(12.72, -0.78, 1.13),
			["handguard_mp5_caa_hx5"] = Vector(13.63, -0.8, 0.9),
			["mount_mp5sd_bt_tri_rail_ring"]= Vector(16.1, -0.8, -1.3),
		},
		["md_eft_ld_perst3"] = { 
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(12.84, -0.8, 1.11),
			["handguard_mp5_caa_hx5"] = Vector(13.79, -0.825, 0.86),
			["mount_mp5sd_bt_tri_rail_ring"]= Vector(16.25, -0.8, -1.3),
		},
		["md_eft_ld_ls321"] = { 
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(12.6081, -0.77, 1.13),
			["handguard_mp5_caa_hx5"] = Vector(13.53, -0.78, 0.9), 
			["mount_mp5sd_bt_tri_rail_ring"]= Vector(16.03, -0.8, -1.3),
		},
		["md_eft_mt_rm35"] = {
			["md_eft_si_acog_ta11d"] = Vector(-4.5, -5.47, -0.02)
		},
		["md_eft_si_rmr_wo_mount"] = {
			["md_eft_si_acog_ta11d"] = Vector(-3.85, -5.02, -0.02)
		},

		["md_eft_si_dp_backup"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(6.35, -1.59, 1.745),
			["handguard_mp5_caa_hx5"] = Vector(7.57, -1.805, 1.285),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(7.57, -1.795, 1.515),
			["mount_mp5sd_bt_tri_rail_ring"] = Vector(14.52, -1.825, 1.84),
		},
		["md_eft_si_rmr_backup"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(6.38, -1.59, 1.745),
			["handguard_mp5_caa_hx5"] = Vector(7.6, -1.805, 1.285),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(7.6, -1.795, 1.515),
			["mount_mp5sd_bt_tri_rail_ring"] = Vector(14.55, -1.825, 1.84),
		},
		["md_eft_si_pk06_backup"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(6.6, -1.59, 1.745),
			["handguard_mp5_caa_hx5"] = Vector(7.82, -1.805, 1.285),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(7.82, -1.795, 1.515),
			["mount_mp5sd_bt_tri_rail_ring"] = Vector(14.77, -1.825, 1.84),
		},
		["md_eft_si_ff3_backup"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(6.35, -1.59, 1.745),
			["handguard_mp5_caa_hx5"] = Vector(7.57, -1.805, 1.285),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(7.57, -1.795, 1.515),
			["mount_mp5sd_bt_tri_rail_ring"] = Vector(14.52, -1.825, 1.84),
		},
		["md_eft_mt_mpr45"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Vector(6.58, -0.59, 1.56),
			["handguard_mp5_caa_hx5"] = Vector(7.8, -0.805, 1.1),
			["handguard_mp5_ptr_tri_rail_forearm"] = Vector(7.8, -0.795, 1.325),
			["mount_mp5sd_bt_tri_rail_ring"] = Vector(14.75, -0.825, 1.465),
		},
	}
	SWEP.AttachmentAngDependency = {
		["md_eft_ld_anpeq15"] = { 
			["mount_mp5sd_bt_tri_rail_ring"]= Angle(),
		},
		["md_eft_ld_la5"] = { 
			["mount_mp5sd_bt_tri_rail_ring"]= Angle(),
		},
		["md_eft_ld_perst3"] = { 
			["mount_mp5sd_bt_tri_rail_ring"]= Angle(),
		},
		["md_eft_ld_ls321"] = { 
			["mount_mp5sd_bt_tri_rail_ring"]= Angle(),
		},
		["md_eft_mt_mpr45"] = {
			["handguard_mp5_bt_tl_99_3x_nar"] = Angle(0, 180, 0),
			["handguard_mp5_caa_hx5"] = Angle(0, 180, 0),
			["handguard_mp5_ptr_tri_rail_forearm"] = Angle(0, 180, 0),
			["mount_mp5sd_bt_tri_rail_ring"] = Angle(0, 180, 0),
		},
	}

	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0)
	SWEP.CustomizationMenuScale = 0.01
end

SWEP.MuzzleVelocity = 400 -- in meter/s


SWEP.HandguardBGs = {main = 7, none = 0, tropical = 1, trirail = 2, hx5 = 3, nar = 4, sd = 5}
SWEP.MagBGs = {main = 8, none= 0, round20 = 1, round30 = 2, round50 = 3}
SWEP.MountBGs = {main = 9, off = 0, on = 1}
SWEP.RailBGs = {main = 10, off = 0, on = 1}
SWEP.BarrelBGs = {main = 11, none = 0, regular = 1, navyadap = 2, navyprotect = 3, none1 = 4, sd = 5 }
SWEP.ReceiverBGs = {main = 12, std = 0, sd = 1, none = 2}
SWEP.SightBGs = {main = 13, none = 0, drum = 1}
SWEP.StockBGs = {main = 14, none = 0, a2 = 1, a3 = 2, pcap = 3}
SWEP.MuzzleBGs = {main = 15, none = 0, noveske = 1}

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {
[1] = {header = "Sight", offset = {-1000, -200}, atts = {"sight_rear_mp5_hk_drum", "md_eft_si_t1", "md_eft_si_okp7", "md_eft_si_cobra", "md_eft_si_mrs", "md_eft_si_dp", "md_eft_si_pk06", "md_eft_si_ff3", "md_eft_si_pilad", "md_eft_si_rmr", "md_eft_si_srs", "md_eft_si_romeo", "md_eft_si_553", "md_eft_si_exps3",  "md_eft_si_exps3_tan", "md_eft_si_hs401g5", "md_eft_si_m4", "md_eft_si_uh1", "md_eft_si_1p87", "md_eft_si_prism", "md_eft_si_prism_2x", "md_eft_si_bravo4", "md_eft_si_elcan", "md_eft_si_hamr", "md_eft_si_acog_ta01nsn", "md_eft_si_acog_ta11d", "md_eft_si_ps320"}},
[2] = {header = "Magazine", offset = {1100, 0}, atts = {"mag_mp5_hk_kurtz_std_9x19_20", "mag_mp5_hk_std_curved_9x19_30", "mag_mp5_x_products_x_5_9x19_50"}},
[3] = {header = "Stock", offset = {700, 350}, atts = {"stock_mp5_hk_pistol_end_cap", "stock_mp5_hk_a3_std", "stock_mp5_hk_a2_std"}},
//["+impulse 100"] = {header = "Lam", offset = {-400, 200}, atts = {"kk_ins2_flashlight", "kk_ins2_lam", "kk_ins2_anpeq15"}, dependencies = { mp5_forearm_fab_by_kry = true}},
[5] = {header = "Handguard", offset = {-600, 300}, atts = {"handguard_mp5_hk_wide_tropical", "handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm"}},
[6] = {header = "More Rail", offset = {000, 0}, atts = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, exclusions = {sight_rear_mp5_hk_drum = true} },
[0] = {header = "Barrel Rail", offset = {1100, -700}, atts = {"mount_mp5sd_bt_tri_rail_ring"}, dependencies = {reciever_mp5_hk_sd = true}},
["+use"] = {header = "Receiver", offset = {-1000, -600}, atts = {"reciever_mp5_hk_sd"}},
[7] = {header = "Backup Sights", offset = {-700, -650}, atts = {"md_eft_si_dp_wo_mount", "md_eft_si_rmr_wo_mount", "md_eft_si_dp_backup", "md_eft_si_rmr_backup", "md_eft_si_ff3_backup", "md_eft_si_pk06_backup"}, dependencies = { mount_mp5sd_bt_tri_rail_ring = true, mount_mp5_bt_mounting_rail_nar_low_profile_long = true, handguard_mp5_caa_hx5 = true, handguard_mp5_bt_tl_99_3x_nar = true, handguard_mp5_ptr_tri_rail_forearm = true}},
[8] = {header = "Lasers", offset = {400, 800}, atts = {"md_eft_ld_anpeq15", "md_eft_ld_la5", "md_eft_ld_perst3", "md_eft_ld_ls321"}, dependencies = {handguard_mp5_caa_hx5 = true, handguard_mp5_bt_tl_99_3x_nar = true, handguard_mp5_ptr_tri_rail_forearm = true, mount_mp5sd_bt_tri_rail_ring = true}},
[9] = {header = "Barrel", offset = {1100, -700}, atts = {"muzzle_mp5_hk_lug_adapter_9x19", "muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"}, exclusions = {reciever_mp5_hk_sd = true} },
["+attack"]= {header = "Muzzle", offset = {300, -700}, atts = {"muzzle_mp5_hk_noveske_style_3_lug_9x19", "md_eft_sil_aac", "md_eft_sil_rotor43", "md_eft_sil_srd9", "md_eft_sil_osprey9"}, dependencies = {muzzle_mp5_hk_lug_adapter_9x19 = true, muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19 = true}},
["+attack2"]= {header = "Handgrips", offset = {-700, 800}, atts = {"md_eft_fg_rvg", "md_eft_fg_afg_blk", "md_eft_fg_vpg", "md_eft_fg_bgv_blk", "md_eft_fg_cobra"}, dependencies = {handguard_mp5_caa_hx5 = true, handguard_mp5_bt_tl_99_3x_nar = true, handguard_mp5_ptr_tri_rail_forearm = true}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"am_magnum", "am_matchgrade"}}
}
SWEP.AttachmentDependencies = {
	["md_eft_si_t1"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_okp7"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_cobra"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_mrs"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_dp"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_pk06"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_ff3"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_pilad"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_rmr"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_srs"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_romeo"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_553"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_exps3"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"},  
	["md_eft_si_exps3_tan"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_hs401g5"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_m4"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_uh1"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_1p87"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_prism"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_prism_2x"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"},
	["md_eft_si_bravo4"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_elcan"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_hamr"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_acog_ta01nsn"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_acog_ta11d"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"}, 
	["md_eft_si_ps320"] = {"mount_mp5_bt_mounting_rail_nar_low_profile_long"},

	["md_eft_ld_anpeq15"] = {"handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm", "mount_mp5sd_bt_tri_rail_ring"},
	["md_eft_ld_la5"] = {"handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm", "mount_mp5sd_bt_tri_rail_ring"},
	["md_eft_ld_perst3"] = {"handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm", "mount_mp5sd_bt_tri_rail_ring"},
	["md_eft_ld_ls321"] = {"handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm", "mount_mp5sd_bt_tri_rail_ring"},
	
	["md_eft_si_dp_wo_mount"] = {"md_eft_si_hamr"},

	["muzzle_mp5_hk_noveske_style_3_lug_9x19"] = {"muzzle_mp5_hk_lug_adapter_9x19", "muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"},

	["md_eft_sil_aac"] = {"muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"},
	["md_eft_sil_rotor43"] = {"muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"},
	["md_eft_sil_osprey9"] = {"muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"},
	["md_eft_sil_srd9"] = {"muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"},
	["md_eft_si_rmr_wo_mount"] = {"md_eft_si_acog_ta01nsn", "md_eft_si_acog_ta11d"},
}
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
SWEP.Animations = {fire = {"mp5_shoot", "mp5_shoot2"},
	reload = "mp5_reload",
	reload_empty = "mp5_reload_empty",
	idle = "mp5_idle",
	draw = "mp5_deploy"}
	
SWEP.Sounds = {
	mp5_deploy = {[1] = {time = 0, sound = "CW_EFT_DRAW"},
	[2] = {time = 5/30, sound = "CW_EFT_GEARMOVEMENT"},
	[3] = {time = 10/30, sound = "CW_EFT_LEANIN"},
	[4] = {time = 45/100, sound = "CW_EFT_HANDGRIP"},
	},

	mp5_reload = {[1] = {time = 7/30, sound = "CW_EFT_GEARMOVEMENT"},
	[2] = {time = 13/30, sound = "CW_EFT_MP5_MAGOUT"},
	[3] = {time = 13/30, sound = "CW_EFT_MP5_MAGRELEASE"},
	[4] = {time = 32/30, sound = "CW_EFT_CLOTHMOVEMENT"},
	[5] = {time = 55/30, sound = "CW_EFT_MAGPULLOUT"},
	[6] = {time = 55/30, sound = "CW_EFT_MP5_MAGIN"},
	[7] = {time = 80/30, sound = "CW_EFT_CLOTHMOVEMENT"},
	[8] = {time = 82/30, sound = "CW_EFT_MP5_LEANIN"},
	[9] = {time = 83/30, sound = "CW_EFT_HANDGRIP"},
	},
	
	mp5_reload_empty = {[1] = {time = 0, sound = "CW_EFT_GEARMOVEMENT"},
	[2] = {time = 5/30, sound = "CW_EFT_MAGPULLOUT"},
	[3] = {time = 20/30, sound = "CW_EFT_MP5_MAGOUT"},
	[4] = {time = 20/30, sound = "CW_EFT_MP5_MAGRELEASE"},
	[5] = {time = 27/30, sound = "CW_EFT_MP5_MAGIN"},
	[6] = {time = 29/ 30, sound = "CW_EFT_CLOTHMOVEMENT"},
	[7] = {time = 51 / 30, sound = "CW_EFT_MP5_BOLT"},
	[8] = {time = 51 / 30, sound = "CW_EFT_MP5_BOLTBACK"},
	[9] = {time = 60 / 30, sound = "CW_EFT_MP5_BOLTFORWARD"},	
	[10] = {time = 64 / 30, sound = "CW_EFT_CLOTHMOVEMENT"},
	[11] = {time = 68 / 30, sound = "CW_EFT_GEARMOVEMENT"},
	[12] = {time = 75 / 30, sound = "CW_EFT_HANDGRIP"},
	}
}
SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 EFT Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw_eft/c_eft_mp5.mdl"
SWEP.WorldModel		=  "models/cw_eft/w_eft_mp5.mdl" --"models/cw2/smgs/w_mp5.mdl"
SWEP.UseHands = true
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/cw_eft/w_eft_mp5.mdl" --"models/cw2/smgs/w_mp5.mdl"
SWEP.WMPos = Vector(-1, -6.5, -1)
SWEP.WMAng = Vector(0, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.075
SWEP.FireSound = "CW_EFT_MP5_FIRE"
SWEP.FireSoundSuppressed = "CW_EFT_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 2
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 2.8

if CLIENT then
	function SWEP:RenderTargetFunc()
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk then
			self.ForegripParent = "foregrip"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_blk or self.ActiveAttachments.md_eft_fg_cobra then
			self.ForegripParent = "anglegrip"
			self.ForegripOverride = true
			return
		else
			self.ForegripParent = "none"
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
		local sil_on = self.dt.Suppressed or self.ActiveAttachments.reciever_mp5_hk_sd
		if sil_on then
			self.MuzzleAttachmentName = "muzzle2"
		else
			self.MuzzleAttachmentName = "muzzle"
		end

	end

	function SWEP:IndividualThink()	
		if self.ActiveAttachments.md_eft_si_acog_ta11d then
			self.EFTRMRmountPos = Vector(-3.34, -6, -2.2)
			self.EFTRMRmountAng = Vector(0, 0, 0)					
		else
			self.EFTRMRmountPos = Vector(-3.34, -7, -2)
			self.EFTRMRmountAng = Vector(0, 0, 0)			
		end	
		if (self.ActiveAttachments.md_eft_si_acog_ta11d or self.ActiveAttachments.md_eft_si_acog_ta01nsn or self.ActiveAttachments.md_eft_si_acog_ta01nsn_tan) and self.ActiveAttachments.md_eft_si_rmr_wo_mount  then
			self.AttachmentModelsVM.md_eft_mt_rm35.active = true
		else
			self.AttachmentModelsVM.md_eft_mt_rm35.active = false
		end

--"handguard_mp5_caa_hx5", "handguard_mp5_bt_tl_99_3x_nar", "handguard_mp5_ptr_tri_rail_forearm", "mount_mp5sd_bt_tri_rail_ring"





		if self.ActiveAttachments.handguard_mp5_caa_hx5 then
			self.EFTRMRbackupPos = Vector(-6.12, -5, 1.6)
			self.EFTRMRbackupAng = Vector(0, 0, -45)

			self.EFTFF3backupPos = Vector(-5.32, -5, 2.395)
			self.EFTFF3backupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-5.54, -5, 2.2)
			self.EFTPK06backupAng = Vector(0, 0, -45)	

			self.EFTDPbackupPos = Vector(-5.62, -5, 2.12)
			self.EFTDPbackupAng = Vector(0, 0, -45)

		elseif self.ActiveAttachments.handguard_mp5_bt_tl_99_3x_nar then
			self.EFTRMRbackupPos = Vector(-6.613, -5, 1.794)
			self.EFTRMRbackupAng = Vector(0, 0, -45)

			self.EFTFF3backupPos = Vector(-5.775, -5, 2.6494)
			self.EFTFF3backupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-5.995, -5, 2.43)
			self.EFTPK06backupAng = Vector(0, 0, -45)	

			self.EFTDPbackupPos = Vector(-6.075, -5, 2.35)
			self.EFTDPbackupAng = Vector(0, 0, -45)

		elseif self.ActiveAttachments.handguard_mp5_ptr_tri_rail_forearm then
			self.EFTRMRbackupPos = Vector(-6.36, -5, 1.63)
			self.EFTRMRbackupAng = Vector(0, 0, -45)

			self.EFTFF3backupPos = Vector(-5.55, -5, 2.423)
			self.EFTFF3backupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-5.78, -5, 2.23)
			self.EFTPK06backupAng = Vector(0, 0, -45)	

			self.EFTDPbackupPos = Vector(-5.85, -5, 2.123)
			self.EFTDPbackupAng = Vector(0, 0, -45)

		elseif self.ActiveAttachments.mount_mp5sd_bt_tri_rail_ring then
			self.EFTRMRbackupPos = Vector(-6.66, -5, 1.6)
			self.EFTRMRbackupAng = Vector(0, 0, -45)

			self.EFTFF3backupPos = Vector(-5.84, -5, 2.44)
			self.EFTFF3backupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-6.1, -5, 2.2)
			self.EFTPK06backupAng = Vector(0, 0, -45)	

			self.EFTDPbackupPos = Vector(-6.19, -5, 2.1)
			self.EFTDPbackupAng = Vector(0, 0, -45)

		else
			self.EFTRMRbackupPos = Vector(-5.8, -5, 0.05)
			self.EFTRMRbackupAng = Vector(0, 0, -45)
		
			self.EFTFF3backupPos = Vector(-5, -5, 0.855)
			self.EFTFF3backupAng = Vector(0, 0, -45)

			self.EFTPK06backupPos = Vector(-5.22, -5, 0.65)
			self.EFTPK06backupAng = Vector(0, 0, -45)	

			self.EFTDPbackupPos = Vector(-5.3, -5, 0.57)
			self.EFTDPbackupAng = Vector(0, 0, -45)
		end	



	end
end//if client
	if USE_OLD_WELEMENTS then
		if CLIENT then
			CustomizableWeaponry.callbacks:addNew("initialize", "H&K MP5", function(wep) // instead of copy pasting 50+ lines of func, 5 lines can do even more
				if wep and wep:GetClass() == "cw_eft_mp5" then
					wep:CreateModels(wep.WElements)
				end
			end)
		
			function SWEP:WElementThink()
					if self.ActiveAttachments.bg_mp530rndmag then
						self.WMEnt:SetBodygroup(4,1)
					else
						self.WMEnt:SetBodygroup(4,0)
					end	
					if self.ActiveAttachments.bg_retractablestock then
						self.WMEnt:SetBodygroup(1,2)
					end	
	
	
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
