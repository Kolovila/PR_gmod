AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AKS-74"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.7
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0.0
	SWEP.ShellPosOffset = {x = 0.5, y = 1, z = -1}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0.5
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.95
	SWEP.BoltShootOffset = Vector(-2.5, 0, -0)
	SWEP.OffsetBoltOnBipodShoot = false
	SWEP.BoltBone = "Bolt"
	SWEP.ADSFireAnim = false
	
	SWEP.WM = "models/weapons/w_rifaks74.mdl"
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WMPos = Vector(-1.0, 3.3, -2)
	SWEP.WMAng = Vector(168, 180, -0)
	
	
	SWEP.IronsightPos = Vector(-2.518, 1, 0.5)
	SWEP.IronsightAng = Vector(0.8, -0.091, 0)
		
	SWEP.EFTUH1Pos = Vector(-2.518, -1, -0.5)
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
	
	SWEP.EFTEXPS32Pos = Vector(-2.518, -1, -0.5)
	SWEP.EFTEXPS32Ang = Vector(0, 0, 0)
	
	SWEP.EFTROMEO4Pos = Vector(-2.525, -1, -0.37)
	SWEP.EFTROMEO4Ang = Vector(0, 0, 0)
	
	SWEP.EFTSRS02Pos = Vector(-2.525, -1, -0.39)
	SWEP.EFTSRS02Ang = Vector(0, 0, 0)
	
	SWEP.EFTACOGTA01Pos = Vector(-2.526, -2, -0.55)
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)
	
	SWEP.EFTOKP7Pos = Vector(-2.518, -1, -0.1)
	SWEP.EFTOKP7Ang = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0.091, -4.321, 0.839)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.297, -3.812, -0.493)
	SWEP.ShortDotAng = Vector(-0.0, 0.0, 0)
	
	SWEP.AlternativePos = Vector(1, 1, -0.6)
	SWEP.AlternativeAng = Vector(1.615, 1.212, 0)
	
	SWEP.CustomizePos = Vector(6, 0, 1.254)
	SWEP.CustomizeAng = Vector(10.998, 25.957, 20)
	
	SWEP.SprintPos = Vector(3, 0, 0)
	SWEP.SprintAng = Vector(-12, 35, 0) 
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.491, -3.958, -0.962), [2] = Vector(-0.496, -0.031, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.0, forward = 0}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
			----
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-4.4, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 50
	SWEP.EmptyBoltHoldAnimExclusion = "shot1"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	----
	
	SWEP.AttachmentModelsVM = {
        ["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", bone = "AK", rel = "", pos = Vector(-0.31, -21.5, 2.7), angle = Angle(0, 90, -90), size = Vector(0.77, 0.77, 0.77)},
        ["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", bone = "AK", rel = "", pos = Vector(-1.35, -23, 3.6), angle = Angle(0, 90, 180), size = Vector(0.87, 0.82, 0.82)},
        ["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", bone = "AK", rel = "", pos = Vector(-0.31, -21.5, 2.7), angle = Angle(0, 90, -90), size = Vector(0.77, 0.77, 0.77)},

	
		["md_eft_fg_afg_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_blk.mdl", bone = "AK", rel = "", pos = Vector(-1.31, -15.5, 3.55), angle = Angle(0, 90, 180), size = Vector(0.4, 0.4, 0.4)},
        ["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", bone = "AK", rel = "", pos = Vector(-1.31, -16.7, 3.5), angle = Angle(0, 90, 180), size = Vector(0.4, 0.4, 0.4)},

	    ["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.75), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.75), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_romeo"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/romeo/v_romeo.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.75), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_srs"] = {model = "models/weapons/cw_eft/upgrades/scopes/srs/v_srs.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.75), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -8.5, 0.75), angle = Angle(0, 90, 180), size = Vector(0.82, 0.82, 0.82)},
		["md_eft_si_okp7"] = {model = "models/weapons/cw_eft/upgrades/scopes/okp7/v_okp7.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.72), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "AK", rel = "", pos = Vector(-1.37, -9, 0.75), angle = Angle(0, 90, 180), size = Vector(0.73, 0.73, 0.73)},



		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "AK", rel = "", pos = Vector(-1.525, -3.464, 4.478), angle = Angle(0, 0, -180), size = Vector(0.699, 0.699, 0.699)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "AK", rel = "", pos = Vector(-0.879, -8.556, 4.274), angle = Angle(0, 180, -180), size = Vector(0.55, 0.55, 0.55)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "body", rel = "", pos = Vector(1.713, -2.566, 1.774), angle = Angle(0, -90, 0), size = Vector(0.737, 0.737, 0.737)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "AK", rel = "", pos = Vector(-1.3, -29.5, 1.65), angle = Angle(0, -1, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "AK", rel = "", pos = Vector(7.73, -14.799, 5.117), angle = Angle(0, 90, 180), size = Vector(0.6, 0.6, 0.6)},
	}
	
	SWEP.M203HoldPos = {
		["r-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(2.956, -0.082, -1.928), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
	["Left10"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(16.035, -1.341, -3.464) },
	["Left15"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 27.916, 8.286) },
	["Left9"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(51.026, 0, 0) },
	["Left_L_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(-0.881, 0.536, 1.554), angle = Angle(-6.798, -3.32, 62.46) },
	["Left1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(42.08, 22.83, 11.543) }

}
SWEP.ForegripOverridePos = {
	["md_eft_fg_rvg"] = {
	["Left_U_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(4.8, 0.1, -4.6), angle = Angle(0, -40, 0) },

	["Left_L_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["Left_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-15, 15, 30) },
	
	["Left1"] = { scale = Vector(1, 1, 1), pos = Vector(0, -1, 0), angle = Angle(20, 10, 0) },	
	["Left2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
	["Left3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 70, 0) },

	["Left4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 30, 0) },	
	["Left5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-30, 0, 0) },
	["Left6"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },

	["Left7"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 10, -10) },	
	["Left8"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 0, 0) },
	["Left9"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
	
	["Left10"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 10, -20) },	
	["Left11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 0, 0) },
	["Left12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(60, 0, 0) },
	
	["Left13"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-50, 0, 0) },	
	["Left14"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["Left15"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(70, 0, 0) },
	},
	
	["md_eft_fg_afg_blk"] = {
	
    ["Left_U_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },

	["Left_L_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(1, -0.35, 0), angle = Angle(0, 0, 0) },
	
	["Left_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.1, 0), angle = Angle(0, 10, 10) },
	
	["Left1"] = { scale = Vector(1, 1, 1), pos = Vector(0, -1, 0), angle = Angle(0, 0, 0) },	
	["Left2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0, 0, 0) },
	["Left3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },

	["Left4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(40, 30, 0) },	
	["Left5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-80, 0, 0) },
	["Left6"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },

	["Left7"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 20, -10) },	
	["Left8"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-50, 0, 0) },
	["Left9"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
	
	["Left10"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 10, -20) },	
	["Left11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-40, 0, 0) },
	["Left12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	
	["Left13"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 10, 0) },	
	["Left14"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["Left15"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	}
		}
	
	SWEP.AttachmentPosDependency = {[""] = {[""] = Vector(-0.225, 13, 3.15)},
	[""] = {[""] = Vector(-0.042, 9, -0.1), [""] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0.5, 0, 0) 
end
SWEP.PSO1AxisAlign = {right = -0.01, up = 0.0, forward = 90}
SWEP.SchmidtShortDotAxisAlign = {right = 0.0, up = 0.0, forward = 0}
SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 2}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 0, regular = 0, fastmag = 1, exmagmk1 = 2}

    SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0.13, roll = 1, forward = 1, pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  

SWEP.CustomizationMenuScale = 0.012

SWEP.Attachments = {[1] = {header = "Sight", offset = {-1000, -500}, atts = {"md_eft_si_okp7", "md_eft_si_romeo", 
	"md_eft_si_exps3_tan", "md_eft_si_srs", "md_eft_si_uh1", "md_eft_si_acog_ta01nsn"}},
	[2] = {header = "Barrel", offset = {-1000, -100}, atts = {"md_pbs1"}},
	[3] = {header = "Grip", offset = {-1000, 330}, atts = {"md_eft_fg_rvg", "md_eft_fg_afg_blk"}},
	[4] = {header = "device", offset = {-1000, 700}, atts = {"md_eft_ld_la5", "md_eft_ld_ls321","md_eft_ld_anpeq15" }},
	["+reload"] = {header = "Ammo", offset = {500, 800}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"shot1"},
	reload = "reload_non_empty",
	reload_empty = "reload_empty2",
	idle = "idle",
	draw = "second_draw"}
	
SWEP.Sounds = {second_draw = {{time = 0.0, sound = "CW_FOLEY_HEAVY"},
				{time = 0.7, sound = "CW_DRAWAKS74"}},

	reload_empty2 = {[1] = {time = 0.6, sound = "CW_AKS74_MAGOUT"},
	[2] = {time = 1.3, sound = "CW_AKS74_MAGIN"},
	[3] = {time = 3.0, sound = "CW_AKS74_BOLTPULL"}},

	reload_non_empty = {[1] = {time = 0.6, sound = "CW_AKS74_MAGOUT"},
	[2] = {time = 1.3, sound = "CW_AKS74_MAGIN"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW2.0 good ak"

SWEP.Author			= "Silent"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rifaks74.mdl"
SWEP.WorldModel		= "models/weapons/w_rifaks74.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_AKS74_FIRE"
SWEP.FireSoundSuppressed = "CW_AKS74_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.036
SWEP.SpreadCooldown = 0.03
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 1.4

SWEP.ReloadViewBobEnabled = true
SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Empty = 3.8
SWEP.ReloadHalt = 2.6
SWEP.ReloadHalt_Empty = 3.8
SWEP.SnapToIdlePostReload = true

	function SWEP:RenderTargetFunc()
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk then
			self.ForegripParent = "md_eft_fg_rvg"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_blk or self.ActiveAttachments.md_eft_fg_cobra then
			self.ForegripParent = "md_eft_fg_afg_blk"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_foregrip then
			self.ForegripParent = "md_foregrip"
			self.ForegripOverride = true
			return		
		end

	end
