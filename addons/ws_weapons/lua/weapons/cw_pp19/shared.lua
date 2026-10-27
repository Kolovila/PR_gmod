AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PP-19 Bizon"
	SWEP.CSMuzzleFlashes = true
	
	function SWEP:getMuzzlePosition()
		return self.CW_VM:GetAttachment(self.CW_VM:LookupAttachment(self.MuzzleAttachmentName))
	end
	
	SWEP.MuzzleAttachmentName = "muzzle"
	
	SWEP.IronsightPos = Vector(-1.742, -2, 0.386)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-1.825, -2, -1.0275)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.4, -3.493, -0.98)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.0665, -2.75, -0.665)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
	SWEP.ShortenedPos = Vector(-1.825, -2, -1.0275)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
	SWEP.RPKPos = Vector(-2.418, -3.481, 0.93)
	SWEP.RPKAng = Vector(0.125, -0.25, 0)
	
	SWEP.PSOPos = Vector(-2.5, 0.65, -0.101)
	SWEP.PSOAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "bR"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "boltbone"
	SWEP.BoltShootOffset = Vector(-2, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.CustomizationMenuScale = 0.0085

	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "Framebone", pos = Vector(-0.25, -0.65, 0), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Framebone", pos = Vector(420, 0, 0), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Framebone", pos = Vector(-0.275, 2.185, -4.5), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "Framebone", pos = Vector(4.151, -0.433, -2.721), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "flash", pos = Vector(1.975, 0, -0.7), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "Framebone", pos = Vector(0.15, 1.55, 0.25), angle = Angle(0, 180, 90), size = Vector(0.525, 0.525, 0.525)},
		["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "Framebone", pos = Vector(5.521, -0.174, -1.107), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Framebone", pos = Vector(-0.333, 2.225, -4.5), angle = Angle(90, -90, 0), size = Vector(0.75, 0.75, 0.75)}
	}

	SWEP.ShortDotPos = Vector(-1.825, -2, -0.975)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.ForeGripHoldPos = {
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(19.048, 0, 0) },
		["Left19"] = {pos = Vector(0, 0, 0), angle = Angle(7.56, -5.153, -33.453) },
		["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 98.859, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(28.447, 0, 0) },
		["Left18"] = {pos = Vector(0, 0, 0), angle = Angle(31.268, 8.871, -34.725) },
		["Left17"] = {pos = Vector(0, 0, 0), angle = Angle(4.524, 0.3, -39.885) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(17.864, 0, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(8.972, 0, 0) },
		["Left_L_Arm"] = {pos = Vector(1.231, 2.617, -1.206), angle = Angle(0, 0, 84.377) },
		["Left24"] = {pos = Vector(0, 0, 0), angle = Angle(31.447, -4.021, -22.029) },
		["Left16"] = {pos = Vector(0, 0, 0), angle = Angle(7.047, 11.637, -22.139) },
		["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(14.432, -4.611, 0) },
		["Left2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 40.631, 0) },
		["Left_U_Arm"] = {pos = Vector(2.54, 0.004, 0), angle = Angle(0, 0, 0) }}
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.AttachmentPosDependency = {["md_pbs1"] = {["bg_ak74_rpkbarrel"] = Vector(-28, 0, -0.816), ["bg_ak74_ubarrel"] = Vector(-14, 0, -0.88)}}
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = true

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.BarrelBGs = {main = 2, rpk = 1, short = 4, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, heavy = 1, foldable = 2}
SWEP.ReceiverBGs = {main = 3, rpk = 1, regular = 0}
SWEP.MagBGs = {main = 4, regular = 0, rpk = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500},  atts = {"md_kobra", "md_aimpoint", "md_schmidt_shortdot"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_pbs1"}},
	[3] = {header = "NOMEN", offset = {-100, 300}, atts = {"md_fastreload"}},
	[4] = {header = "Sleeve", offset = {600, 400}, atts = {"bg_sleeveak"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"fire1", "fire2", "fire3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "deploy"}
	
SWEP.Sounds = {	deploy = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.8, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 1.1, sound = Sound("FAS2_PP19.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 2.2, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2.6, sound = Sound("FAS2_PP19.MagIn")}},
	
	reload_nomen = {[1] = {time = 0.3, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 0.5, sound = Sound("FAS2_PP19.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 1.6, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2, sound = Sound("FAS2_PP19.MagIn")}},
	
	reload_empty_nomen = {[1] = {time = 0.3, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 0.5, sound = Sound("FAS2_PP19.MagOutEmpty")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 1.6, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2, sound = Sound("FAS2_PP19.MagIn")},
	[6] = {time = 2.7, sound = Sound("FAS2_PP19.BoltPull")}},
	
	reload_empty = {[1] = {time = 1.2, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 1.7, sound = Sound("FAS2_PP19.MagOutEmpty")},
	[3] = {time = 2, sound = Sound("MagPouch_SMG")},
	[4] = {time = 2.8, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 3.2, sound = Sound("FAS2_PP19.MagIn")},
	[6] = {time = 4.1, sound = Sound("FAS2_PP19.BoltPull")}}}

SWEP.SpeedDec = 25

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/view/smgs/bizon.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_biz.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 64
SWEP.Primary.DefaultClip	= 64
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x18MM"

SWEP.FireDelay = 0.085
SWEP.FireSound = "CW_PP19_FIRE"
SWEP.FireSoundSuppressed = "CW_PP19_FIRE_SUPPRESSED"
SWEP.Recoil = 0.6

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 19
SWEP.DeployTime = 0.55

SWEP.ReloadSpeed = 0.85
SWEP.ReloadTime = 2.9
SWEP.ReloadTime_Empty = 4
SWEP.ReloadHalt = 2.9
SWEP.ReloadHalt_Empty = 4
SWEP.SnapToIdlePostReload = false