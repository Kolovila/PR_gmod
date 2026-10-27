AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "L85A2"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))

	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.25
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = -2, z = 4}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.82

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_elle_chan.mdl"
	SWEP.WMPos = Vector(-0.7, -1, 0.5)
	SWEP.WMAng = Vector(-9, 0, 180)

	SWEP.BoltBone = "BoltCharger"
	SWEP.BoltShootOffset = Vector(-3, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.297, 1, -0.158)
	SWEP.IronsightAng = Vector(0.347, 0, 0)
	
	SWEP.EFTUH1Pos = Vector(-2.297, -1, 0.2)
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
	
	SWEP.EFTEXPS32Pos = Vector(-2.297, 1, 0.2)
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)
	
	SWEP.EFTACOGTA01Pos = Vector(-2.288, -1.5, 0.31)
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)
	
	SWEP.EFTFF3backupPos = Vector(-3.6, 0, 0.96)
	SWEP.EFTFF3backupAng = Vector(0, 0, -45)
	
	SWEP.EFTPRISM2XPos = Vector(-2.288, -1, 0.6)
	SWEP.EFTPRISM2XAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.297, -3.097, 0.732)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(1.679, -4.666, -0.046)
	SWEP.M203Ang = Vector(10.225, 0, 0)

	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-22.557, 36.025, -12)

	SWEP.CustomizePos = Vector(7.296, 0, -0.489)
	SWEP.CustomizeAng = Vector(8.762, 35.429, 8.635)
	
	SWEP.AlternativePos = Vector(0.8, 4, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.CSGO556AxisAlign = {right = 0, up = 0, forward = 50.5}
	SWEP.SUSATAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", bone = "Base", rel = "", pos = Vector(9, 0, -1.8), angle = Angle(0, 0, 0), size = Vector(0.35, 0.35, 0.35)},
		["md_eft_fg_afg_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_fde.mdl", bone = "Base", rel = "", pos = Vector(9, 0, -1.8), angle = Angle(0, 0, 0), size = Vector(0.35, 0.35, 0.35)},


	    ["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3.mdl", bone = "Base", rel = "", pos = Vector(1.5, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
        ["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "Base", rel = "", pos = Vector(1.5, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "Base", rel = "", pos = Vector(1, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eft_si_prism_2x"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/prism2x/v_prism2x.mdl", bone = "Base", rel = "", pos = Vector(1, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
        ["md_eft_si_ff3_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", bone = "Base", rel = "", pos = Vector(-1.26, 0.8, 0.93), angle = Angle(0, 0, 45), size = Vector(1, 1, 1)},
        ["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", bone = "Base", rel = "", pos = Vector(-1.26, 0, 0.8), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},

		["md_eft_sil_osprey9"] = {model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", bone = "Base", rel = "", pos = Vector(15, 0, -0.35), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},

		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", bone = "Base", rel = "", pos = Vector(8, -0.05, 0.8), angle = Angle(0, 0, 180), size = Vector(0.8, 0.8, 0.8)},


		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "Base", rel = "", pos = Vector(9.119, -12.113, -4.31), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(0.463, -0.009, 0.842), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "Base", rel = "", pos = Vector(-6.332, -2.332, 2.197), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(2.937, 0.209, -1.78), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
}
	
	SWEP.ForegripOverridePos = {
	["md_eft_fg_afg_blk"] = {
	["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.4, 0.7), angle = Angle(0, 0, 22.5) },
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(33.6, -4.2, -8) },

	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-28, -10, 0) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(13, 0, -7) },

	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 0, 0) },
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },

	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },

	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },

	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -20) },
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },

	},
	
	["md_eft_fg_rvg1"] = {
	["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 1, -1.5), angle = Angle(0, 0, 0) },
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 40) },
	
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-28, -10, 0) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(13, 0, -7) },

	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },

	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },

	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },

	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 0, 0) },
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },

	},
	}
	
	SWEP.LaserPosAdjust = Vector(0, -5, -0.4)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 3, regular = 0, l85_a2 = 1, none = 3}
	
SWEP.CustomizationMenuScale = 0.009

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {-600, -900}, atts = {"md_eft_si_exps3_tan", "md_eft_si_uh1", "md_eft_si_prism_2x", "md_eft_si_acog_ta01nsn"}},
	[2] = {header = "Barrel", offset = {-700, -500}, atts = {"md_eft_sil_osprey9"}},
	[3] = {header = "Handguard", offset = {-800, -150}, atts = {"md_eft_si_ff3_backup"}},
	[4] = {header = "Underbarrel", offset = {-900, 200}, atts = {"md_eft_fg_rvg", "md_eft_fg_afg_blk", "md_m203"}},
	[5] = {header = "Laser", offset = {-800, 630}, atts = {"md_eft_ld_anpeq15"}},
	--[6] = {header = "Magazine", offset = {200, -700}, atts = {}},
	--["+attack2"] = {header = "Perks", offset = {-600, -100}, atts = {}}, 
	["+reload"] = {header = "Ammo", offset = {1300, 800}, atts = {"am_magnum", "am_matchgrade"}}}
	


    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0.13, roll = 0.9, forward = 0.5, pitch = -0.1}
	
SWEP.Animations = {fire = {"a2shoot1"},
	reload = "a2reload",
	reload_empty = "a2reload_empty",
	idle = "a2idle",
	draw = "a2draw"}
	
SWEP.Sounds = {

    a2draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"}},
	
	a2reload = {[1] = {time = 0.30, sound = "CW_L85A1_MAGOUT"},
	[2] = {time = 1.77, sound = "CW_L85A1_MAGIN"}},

	a2reload_empty = {[1] = {time = 0.30, sound = "CW_L85A1_MAGOUT"},
	[2] = {time = 1.77, sound = "CW_L85A1_MAGIN"},
	[3] = {time = 2.9, sound = "CW_L85A1_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW-Goodgun"

SWEP.Author			= "wwdqr"--ty"Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_l85a12.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_elle_chan.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 320
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.0857
SWEP.FireSound = "CW_L85A1_FIRE"
SWEP.FireSoundSuppressed = "CW_L85A1_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1

SWEP.MuzzleVelocity = 688

SWEP.HipSpread = 0.06
SWEP.AimSpread = -0.2
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.3
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 42
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 3.9
SWEP.ReloadHalt = 2.5
SWEP.ReloadHalt_Empty = 3.4
SWEP.SnapToIdlePostReload = false

function SWEP:RenderTargetFunc()
		self.ForegripOverride = true
		if self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk  or self.ActiveAttachments.md_eft_fg_bgv_fde or self.ActiveAttachments.md_eft_fg_mod3 or self.ActiveAttachments.md_eft_fg_shift then
			self.ForegripParent = "md_eft_fg_rvg"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_rk1 then
			self.ForegripParent = "md_eft_fg_rvg1"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_blk or self.ActiveAttachments.md_eft_fg_cobra or self.ActiveAttachments.md_eft_fg_afg_mlok_fde then
			self.ForegripParent = "md_eft_fg_afg_blk"
			self.ForegripOverride = true
			return
		else
			self.ForegripParent = "md_foregrip"
			self.ForegripOverride = false
			return
			
		end
			end

