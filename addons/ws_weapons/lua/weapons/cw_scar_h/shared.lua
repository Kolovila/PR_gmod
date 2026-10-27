if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SCAR-H"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_ber_scar_h", "weaponicons/scarh-k", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/select/scarh-h")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.34
	
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.FireMoveMod = 0.6
	SWEP.SightWithRail = false
	SWEP.ForeGripOffsetCycle_Draw = 0.2
	SWEP.ForeGripOffsetCycle_Reload = 0.85
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.85
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_dber_mk17.mdl"
	SWEP.WMPos = Vector(-1, -1, 1)
	SWEP.WMAng = Vector(0, 0, 180)

	SWEP.IronsightPos = Vector(-2.547, 2, 0.07)
	SWEP.IronsightAng = Vector(-0.169, 0.046, 0)
	
	SWEP.EFTElcanPos = Vector(-2.55, 0.12, -0.18)
	SWEP.EFTElcanAng = Vector(0, 0, 0)
		
	SWEP.EFTEXPS32Pos = Vector(-2.55, 1, -0.25)
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.51, 0.5, 0.08)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.55, 1, 0.13)
	SWEP.KobraAng = Vector(0, 0, 0)


	SWEP.ACOGV4Pos = Vector(-2.563, -0.362, 0)
	SWEP.ACOGV4Ang = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_ber_elcan"] = {[1] = Vector(-2.526, 0, -0.99), [2] = Vector(0.4, 0.07, 0)}}

	SWEP.SprintPos = Vector(0, 3, -0.41)
	SWEP.SprintAng = Vector(-12.124, 20, -12)
	
	SWEP.BaseArm = "Left Arm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.CustomizePos = Vector(1.94, 2, -0.361)
	SWEP.CustomizeAng = Vector(6.888, 15, 8.737)

	SWEP.AlternativePos = Vector(0.1, 3.5, -0.5)
	SWEP.AlternativeAng = Vector(0, 0, -5)
	
	SWEP.ACOGV4AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ELCANBERAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "l_forearm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

--[1] = {header = "Sight", offset = {800, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acogv2"}},	
	
	
	SWEP.AttachmentModelsVM = {
		["md_eft_si_elcan_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/fde/v_elcan.mdl", bone = "SCAR_Body", pos = Vector(0, 1, 1.45), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3.mdl", bone = "SCAR_Body", pos = Vector(0, 1, 1.35), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85)},

		["md_9mmzj"] = {model = "models/weapons/upgrades/mag/calsmg.mdl", bone = "SCAR_Body", pos = Vector(2.55, -7.3, 2.5), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},

	
		["md_scar_longhg"] = {model = "models/weapons/upgrades/mk20long.mdl", bone = "SCAR_Body", pos = Vector(2.55, -7.3, 2.64), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_schmidt2"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "SCAR_Body", pos = Vector(-0.3, -6.1, -3.7), angle = Angle(0, -90, 0), size = Vector(0.92, 0.92, 0.92)},

		["md_exmag"] = {model = "models/weapons/upgrades/mag/exmag.mdl", bone = "SCAR_Magazine", pos = Vector(2.55, -9.25, 6.3), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_exxmag"] = {model = "models/weapons/upgrades/mag/EXXmag1.mdl", bone = "SCAR_Magazine", pos = Vector(2.55, -9.25, 6.3), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},

	    ["md_9mm_mag"] = {model = "models/weapons/upgrades/mag/c_f9mm_mag.mdl", bone = "SCAR_Magazine", pos = Vector(0, -7.13, 4.5), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},

		["md_arstock"] = {model = "models/weapons/upgrades/stock/mk17_ar.mdl", bone = "SCAR_Body", pos = Vector(2.55, -7.25, 2.64), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_emod"] = {model = "models/weapons/upgrades/stock/stock_ar15_vltor_emod.mdl", bone = "SCAR_Body", pos = Vector(0, -9.5, 0.2), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_bus"] = {model = "models/weapons/upgrades/stock/stock_ar15_mft_bus.mdl", bone = "SCAR_Body", pos = Vector(0, -10, 0.22), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_ctr"] = {model = "models/weapons/upgrades/stock/stock_ar15_magpul_ctr_carbine.mdl", bone = "SCAR_Body", pos = Vector(0, -9.5, 0.2), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_f93"] = {model = "models/weapons/upgrades/stock/stock_ar15_ergo_f93_pro_stock.mdl", bone = "SCAR_Body", pos = Vector(0, -11.3, 0.25), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},

		["md_pdwstock"] = {model = "models/weapons/upgrades/stock/mk17_pdw.mdl", bone = "SCAR_Body", pos = Vector(0, -4.47, 0.35), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},


		--["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "SCAR_Body", pos = Vector(2.342, -8.78, 2.342), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		--["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", pos = Vector(1.156, -1.922, 0.032), angle = Angle(-89.999, 0.001, -90.001), size = Vector(0.308, 0.308, 0.308)},
		
		["md_anpeq15"] = { model = "models/weapons/upgrades/peq15.mdl", bone = "SCAR_Body", pos = Vector(0.769, 10.055, 0.07), angle = Angle(0, 90, 90), size = Vector(0.574, 0.574, 0.574)},
		["md_acogv4"] = {model = "models/weapons/v_dber_acoh.mdl", bone = "SCAR_Body", pos = Vector(-0.00, -1, 1.245), adjustment = {min =  -1, max = 1.8, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/weapons/upgrades/f_foregrip_sec.mdl", bone = "SCAR_Body", pos = Vector(0, 6.579, -0.95), angle = Angle(0, 90, 0), size = Vector(0.43, 0.43, 0.43)},
		
		["md_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra.mdl", bone = "SCAR_Body", pos = Vector(0, -1, 1.539), adjustment = {min =  -1, max = 2.7, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_ber_assault_suppressor"] = {model = "models/weapons/upgrades/a_suppressor_sec2.mdl", bone = "SCAR_Body", pos = Vector(0, 15.5, -0.2), angle = Angle(0, -90, 0), size = Vector(1.141, 1.141, 1.141)},
	}
	
	SWEP.M203HoldPos = {
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(2.819, 0.275, -2.033), angle = Angle(0, 0, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_ber_assault_suppressor"] = {["bg_scar_shortbarrel"] = Vector(0, 12, -0.2)}}
	
	SWEP.ForeGripHoldPos = {
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(16.885, -48.002, 22.427) },
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.873, -70.747, 15.76) },
	["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0.365, -0.525, -1.446), angle = Angle(0.179, 0, 0) },
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 7.795, -14.171) },
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.236, -32.443, 0) },
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -0.06), angle = Angle(-0.463, 21.566, 13.196) },
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-18.623, 4.936, 0) },
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(2.68, -25.205, 56.798) },
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.035), angle = Angle(-2.896, -82.111, 5.993) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.879, -40.105, 19.472) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.903, -52.074, 0) },
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(1.919, -5.311, -15.83) },
	["l_armtwist_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 62.223) },
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0.029, -0.033, 0), angle = Angle(-2.181, 9.513, -6.007) },
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(18.53, -18.01, 11.848) },
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -37.389, 0) },
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(1.47, -90.611, -4.321) },
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-1.032, -24.512, 20.424) }
	}
		

		----
	SWEP.BoltBone = "SCAR_Charger"
	SWEP.BoltShootOffset = Vector(0, 3.5, 0)
	SWEP.BoltBonePositionRecoverySpeed = 50
	SWEP.EmptyBoltHoldAnimExclusion = "shoot_over"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	----
	
    SWEP.LuaVMRecoilAxisMod = {vert = 0.02, hor = 0.23, roll = 1.5, forward = 1,  pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
 
	
	SWEP.LaserPosAdjust = Vector(0, -3, 0.2)
	SWEP.LaserAngAdjust = Angle(-0.05, 181, -1) 
	
	SWEP.CustomizationMenuScale = 0.01
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 3, short = 1, long = 0}
SWEP.stockBGs = {main = 4, stk = 1, none = 0}
SWEP.magBGs = {main = 5, mag = 1, none = 0}

SWEP.MuzzleVelocity = 800 -- in meter/s


SWEP.Attachments = {
[1] = {header = "Sight", offset = {-1600, -800},  atts = {"md_eft_si_exps3_tan", "md_eft_si_elcan_tan", "md_schmidt2"}}, --"md_acog"
[2] = {header = "Muzzle", offset = {-1600, -400},  atts = {"md_ber_assault_suppressor"}},
[3] = {header = "UnderBarrel", offset = {-1600, 0},  atts = {"md_foregrip"}},
[4] = {header = "Rail", offset = {-1600, 400},  atts = {"md_anpeq15"}},
[5] = {header = "stock", offset = {1800, -1500},  atts = {"md_f93", "md_bus", "md_ctr", "md_emod"}},
[6] = {header = "Barrel", offset = {1800, -600},  atts = {"bg_scar_shortbarrel"}},
["impulse 100"] = {header = "stock", offset = {1800, -100},  atts = {"md_arstock", "md_pdwstock"}},
["+attack"] = {header = "mag", offset = {1800, -1000},  atts = {"md_9mm_mag", "md_exmag", "md_exxmag"}},
["+attack2"] = {header = "Skin", offset = {-1600, 840},  atts = {"bg_ber_scar_tan"}},
["+use"] = {header = "hg", offset = {1800, 400}, atts = {"md_9mmzj"}},
["+reload"] = {header = "Ammo", offset = {650, 1000}, atts = {"am_magnum", "am_matchgrade"}}}

	SWEP.AttachmentExclusions = {
	["bg_scar_shortbarrel"] = {"md_scar_longhg"},
	["md_exmag"] = {"md_9mmzj"},
	["md_exxmag"] = {"md_9mmzj"},
	}
	
	SWEP.AttachmentDependencies = {
	["md_f93"] = {"md_arstock"},
	["md_bus"] = {"md_arstock"},
	["md_ctr"] = {"md_arstock"},
	["md_emod"] = {"md_arstock"},
	["md_9mm_mag"] = {"md_9mmzj"},
				
				
	
	}

SWEP.Animations = {fire = {"shoot2"},
    fire_dry = "shoot_over",
	reload = "reload_cham",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	

SWEP.Sounds = {draw = {
{time = 0.5, sound = "CW_BER_SCAR_H_SELECTOR"},
{time = 0, sound = "CW_FOLEY_MEDIUM"}},

reload_cham = {
{time = 0.5, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 1.25, sound = "CW_BER_SCAR_H_MAGIN"}},

smgreload_cham = {
{time = 0.5, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 1.25, sound = "CW_BER_SCAR_H_MAGIN"}},

lmgreload_cham = {
{time = 0.5, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 1.25, sound = "CW_BER_SCAR_H_MAGIN"}},

reload = {
{time = 0.5, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 1.3, sound = "CW_BER_SCAR_H_MAGIN"},
{time = 1.96, sound = "CW_BER_SCAR_H_MAGKG"},
{time = 2, sound = "CW_FOLEY_MEDIUM"}},

smgreload = {
{time = 0.2, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 2, sound = "CW_BER_SCAR_H_MAGIN"},
{time = 2.7, sound = "CW_BER_SCAR_H_MAGKG"},
{time = 2.5, sound = "CW_FOLEY_MEDIUM"}},

lmgreload = {
{time = 0.5, sound = "CW_BER_SCAR_H_MAGOUT"},
{time = 1.3, sound = "CW_BER_SCAR_H_MAGIN"},
{time = 1.96, sound = "CW_BER_SCAR_H_MAGKG"},
{time = 2, sound = "CW_FOLEY_MEDIUM"}},

shoot_over = {
{time = 0, sound = "CW_BER_SCAR_H_MAGKG1"}},

}


SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW-Goodgun"

SWEP.Author			= "BER_"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_dber_sh.mdl"
SWEP.WorldModel		= "models/weapons/w_dber_mk17.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 220
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.1035
SWEP.FireSound = "CW_BER_SCAR_H_FIRE"
SWEP.FireSoundSuppressed = "CW_BER_SCAR_H_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.04
SWEP.AimSpread = -0.02
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.3
SWEP.SpreadPerShot = 0.1
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 43
SWEP.DeployTime = 1
SWEP.ADSFireAnim = false
	
SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 1.3
SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 2.3

SWEP.SnapToIdlePostReload = false

end

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