AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MOE-1974"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.3
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0.0
	SWEP.ShellPosOffset = {x = 1, y = -0.5, z = -1}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0.3
	SWEP.ForeGripOffsetCycle_Reload = 0.86
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.86
	SWEP.BoltShootOffset = Vector(-1.5, 0, -0)
	SWEP.OffsetBoltOnBipodShoot = false
	SWEP.BoltBone = "Bolt"
	
	SWEP.WM = "models/weapons/w_hex_ak74.mdl"
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WMPos = Vector(-1.0, 3.3, -2)
	SWEP.WMAng = Vector(170, 180, -0)
	
	
	SWEP.IronsightPos = Vector(-1.624, 2, 0.15)
	SWEP.IronsightAng = Vector(0.85, -0.009, 0)
	
	SWEP.EFTEXPS32Pos = Vector(-1.62, 1, -0.65)
	SWEP.EFTEXPS32Ang = Vector(-0.156, 0, 0)
	
	SWEP.EFTROMEO4Pos = Vector(-1.62, 1, -0.51)
	SWEP.EFTROMEO4Ang = Vector(-0.156, 0, 0)
	
	SWEP.EFTSRS02Pos = Vector(-1.62, 0, -0.51)
	SWEP.EFTSRS02Ang = Vector(-0.156, 0, 0)
		
	SWEP.EFTUH1Pos = Vector(-1.62, 0, -0.65)
	SWEP.EFTUH1Ang = Vector(-0.156, 0, 0)
	
	SWEP.EFTACOGTA01Pos = Vector(-1.62, -1, -0.53)
	SWEP.EFTACOGTA01Ang = Vector(-0.156, 0, 0)
	
	SWEP.EFTOKP7Pos = Vector(-1.62, 2, -0.2)
	SWEP.EFTOKP7Ang = Vector(-0.156, 0, 0)
	
	SWEP.M203Pos = Vector(0.091, -4.321, 0.839)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-1.599, -2.027, -0.167)
	SWEP.ShortDotAng = Vector(-0.0, 0.0, 0)
	
	SWEP.AlternativePos = Vector(1, 2, -0.5)
	SWEP.AlternativeAng = Vector(1.598, 0.486, -5)
	
	SWEP.CustomizePos = Vector(3, 1, 1)
	SWEP.CustomizeAng = Vector(1, 15, 15)
	
	SWEP.SprintPos = Vector(2, 0, -1)
	SWEP.SprintAng = Vector(-12, 35, 0) 
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-5.08, -2.698, -0.78), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.0, forward = 0}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
		
	SWEP.CustomizationMenuScale = 0.011
	
				----
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-3.4, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 50
	SWEP.EmptyBoltHoldAnimExclusion = "ak47_fire1"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	----
	
			
    SWEP.LuaVMRecoilAxisMod = {vert = 0.01, hor = 0.1, roll = 0.6, forward = 0.5, pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  
	
	SWEP.AttachmentModelsVM = {
	
		["md_eft_fg_afg_mlok_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/m-lok_afg/v_mlok_blk.mdl", bone = "body", rel = "", pos = Vector(0, 7.2, -0.5), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35)},
        ["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", bone = "body", rel = "", pos = Vector(0, 6.5, -0.4), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35)},

        ["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", bone = "body", rel = "", pos = Vector(-0.84, 8.2, 0.55), angle = Angle(0, -90, -90), size = Vector(0.77, 0.77, 0.77)},
        ["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", bone = "body", rel = "", pos = Vector(-0.84, 8.2, 0.55), angle = Angle(0, -90, -90), size = Vector(0.77, 0.77, 0.77)},
        ["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", bone = "body", rel = "", pos = Vector(-0.84, 8.2, 0.55), angle = Angle(0, -90, -90), size = Vector(0.77, 0.77, 0.77)},

		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", bone = "body", rel = "", pos = Vector(0, 0, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1, max = 1.7, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_romeo"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/romeo/v_romeo.mdl", bone = "body", rel = "", pos = Vector(0, 0, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1.5, max = 1.7, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_srs"] = {model = "models/weapons/cw_eft/upgrades/scopes/srs/v_srs.mdl", bone = "body", rel = "", pos = Vector(0, 0, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1, max = 1.7, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "body", rel = "", pos = Vector(0, 0, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1, max = 1.7, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_okp7"] = {model = "models/weapons/cw_eft/upgrades/scopes/okp7/v_okp7.mdl", bone = "body", rel = "", pos = Vector(0, -1, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1, max = 1, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "body", rel = "", pos = Vector(0, 0, 1.62), angle = Angle(0, -90, 0), size = Vector(0.73, 0.73, 0.73), adjustment = {min = -1, max = 1.7, axis = "y", inverseOffsetCalc = true}, size = Vector(0.73, 0.73, 0.73)},

		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(7.73, -14.799, 5.117), angle = Angle(0, 90, 180), size = Vector(0.6, 0.6, 0.6)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "body", rel = "", pos = Vector(-0.161, -4.036, -0.973), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "body", rel = "", pos = Vector(0.027, 18.52, -0.547), angle = Angle(0, -178.5, 0), size = Vector(0.75, 0.75, 0.75)},
		
	}


	SWEP.ForeGripHoldPos = {
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-3.888, 1.307, -0.274), angle = Angle(-37.051, -3.116, 44.86) },
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(11.477, 11.503, 7.939) },
	["Bip01 L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.123, 0), angle = Angle(0, 4.046, 15.251) }
}

SWEP.ForegripOverridePos = {
	["md_eft_fg_rvg"] = {
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(5.5, 0.5, 0), angle = Angle(0, 0, 40) },

	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, 15, 35) },
	
	["Bip01 L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 13) },
		
	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 10) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 30, 0) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) },	
	
	["Bip01 L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 40, 0) },
	["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
	["Bip01 L Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },	
	
	["Bip01 L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
	["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },	
	
	["Bip01 L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -10, 0) },
	["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },	

	["Bip01 L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -40, 10) },
	["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },	
	},
	
	["md_eft_fg_afg_blk"] = {
	
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(6, 0.2, -0.3), angle = Angle(0, 0, 40) },

	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.2), angle = Angle(0, 0, 0) },
	
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, 15, 15) },
	
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-11, -10, 10) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }		}
		}
		
	
	SWEP.AttachmentPosDependency = {[""] = {[""] = Vector(-0.225, 13, 3.15)},
	[""] = {[""] = Vector(-0.042, 9, -0.1), [""] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(-0.4, 0.1, 0) 
end

--SWEP.PSO1AxisAlign = {right = -0.01, up = 0.0, forward = 90}
--SWEP.SchmidtShortDotAxisAlign = {right = 0.0, up = 0.0, forward = 0}
--SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 2}
--SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
--SWEP.MagBGs = {main = 0, regular = 0, fastmag = 1, exmagmk1 = 2}


SWEP.Attachments = {
    [1] = {header = "Sight", offset = {-1000, -700}, atts = {"md_eft_si_okp7", "md_eft_si_romeo", 
	"md_eft_si_exps3_tan", "md_eft_si_romeo", "md_eft_si_srs", "md_eft_si_uh1", "md_eft_si_acog_ta01nsn"}},
	[2] = {header = "Barrel", offset = {-1000, -300}, atts = {"md_pbs1"}},
	[3] = {header = "Grip", offset = {-1000, 120}, atts = {"md_eft_fg_rvg", "md_eft_fg_afg_mlok_blk"}},
	[4] = {header = "device", offset = {-1000, 500}, atts = {"md_eft_ld_la5", "md_eft_ld_ls321","md_eft_ld_anpeq15" }},
	["+reload"] = {header = "Ammo", offset = {250, 600}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"ak47_fire1", "ak47_fire3", "ak47_fire2"},
	reload = "ak47_reload",
	idle = "ak47_idle",
	draw = "ak47_draw"}
	
SWEP.Sounds = {ak47_draw = {{time = 0.1, sound = "CW_FOLEY_MEDIUM"}},

	ak47_reload = {[1] = {time = 0.2, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.5, sound = "CW_KALASHNIKOV1974_MAGOUT"},
	[3] = {time = 1.4, sound = "CW_KALASHNIKOV1974_MAGIN"},
	[4] = {time = 2.3, sound = "CW_KALASHNIKOV1974_BOLTPULL"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW2.0 good ak"

SWEP.Author			= "HeX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_hex_ak74.mdl"
SWEP.WorldModel		= "models/weapons/w_hex_ak74.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 160
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_KALASHNIKOV1974_FIRE"
SWEP.FireSoundSuppressed = "CW_KALASHNIKOV1974_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.05
SWEP.AimSpread = -0.01
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.036
SWEP.SpreadCooldown = 0.03
SWEP.Shots = 1
SWEP.Damage = 41
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 3.1
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt = 3.1
SWEP.ReloadHalt_Empty = 3.2
SWEP.SnapToIdlePostReload = false

	function SWEP:RenderTargetFunc()
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk then
			self.ForegripParent = "md_eft_fg_rvg"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_mlok_blk or self.ActiveAttachments.md_eft_fg_cobra then
			self.ForegripParent = "md_eft_fg_afg_blk"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_foregrip then
			self.ForegripParent = "md_foregrip"
			self.ForegripOverride = true
			return		
		end

	end
