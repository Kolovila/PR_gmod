AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("14.5MM AP", " 14.5MM AP Rounds", 14.5, 114)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "KPV HMG"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.Add( "cw_kpv_hmg", "vgui/hud/hmg", Color(255, 80, 0, 150)) 
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/hmg")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Sprinting = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-0.38, 0.504, 1.019)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.HoloPos = Vector(-2.141, 0.086, 0.66)
	SWEP.HoloAng = Vector(0, 0, 0)
		
	SWEP.FoldSightPos = Vector(-2.141, 0.086, 0.66)
	SWEP.FoldSightAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.194, -4.686, 0.338)
	SWEP.AimpointAng = Vector(-1.951, 0, -0.217)
	
	SWEP.ReflexPos = Vector(-2.141, 0.086, 0.779)
    SWEP.ReflexAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.211, -4, 0.146)
	SWEP.ACOGAng = Vector(-1.4, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}

	
	SWEP.AttachmentModelsVM = {
		["md_reflex_sight"] = {model = "models/v_cod4_reflex.mdl", bone = "body", rel = "", pos = Vector(-2.026, -1.76, -0.051), angle = Angle(-0.419, -180, 89.925), size = Vector(0.639, 0.639, 0.639)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "smdimport001", rel = "", pos = Vector(0.238, -8.943, -7.223), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = { model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(6.287, 0.021, 0.263), angle = Angle(-90.894, 86.646, -4.607), size = Vector(0.5, 0.5, 0.5)},
		["md_bipod"] = {model = "models/attachment/crysis_laser.mdl", bone = "body", rel = "", pos = Vector(-3.306, -2.987, 0.615), angle = Angle(0, -0.699, 89.983), size = Vector(0, 0, 0)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "smdimport001", pos = Vector(-0.027, 2.812, 3.634), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "smdimport001", pos = Vector(-0.401, -3.291, -2.22), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport001", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "smdimport001", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
	["Left12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(31.468, 0, 0) },
	["Left4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(41.939, 1.761, 0) },
	["Left1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(18.801, 19.385, 20.295) },
	["Left6"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(47.568, 0, 0) },
	["Left3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.33, 58.685, 0) },
	["Left8"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(26.697, -6.296, 0) },
	["Left5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(34.016, 0.921, 0) },
	["Dummy02"] = { scale = Vector(1, 1, 1), pos = Vector(9.027, 2.121, -4.316), angle = Angle(-65.665, -11.089, 4.506) },
	["Left11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -2.191, 0) },
	["Left9"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.963, 0, 0) },
	["Left10"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.125, -0.248, 0) },
	["Left2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-9.945, 25.044, 33.799) },
	["Left_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(14.38, 13.793, 11.875) },
	["Left_L_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(-4.564, 0.061, -0.622), angle = Angle(-0.973, -19.126, -2.543) }

	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
    SWEP.CustomizationMenuScale = 0.030
end

SWEP.HandBGs = {main = 1, none = 0}
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false
SWEP.BoltBonePositionRecoverySpeed = 60

SWEP.Attachments = {[1] = {header = "Handguard", offset = {-200, -100}, atts = {"md_bipod"}},
	["+reload"] = {header = "Ammo", offset = {400, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_HMG_COVERUP"}},

	reload = {[1] = {time = 0.35, sound = "CW_HMG_COVERUP"},
	[2] = {time = 1.8, sound = "CW_HMG_COVERDOWN"}}}

SWEP.SpeedDec = 120

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 80
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/crysis/v_hmg.mdl"
SWEP.WorldModel		= "models/weapons/w_hmg.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/w_hmg.mdl"
SWEP.WMPos = Vector(-1.081, 2.818, -0.0)
SWEP.WMAng = Vector(-7.152, 2.841, 178.483)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 150
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "14.5MM AP"

SWEP.FireDelay = 60/600
SWEP.FireSound = "CW_HMG_FIRE"
SWEP.Recoil = 4.75

SWEP.HipSpread = 0.005
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 2.7
SWEP.MaxSpreadInc = 0.001
SWEP.SpreadPerShot = 0.0001
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 85
SWEP.DeployTime = 1.4

SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 4
SWEP.ReloadTime_Empty = 4.5
SWEP.ReloadHalt = 4.5
SWEP.ReloadHalt_Empty = 5
SWEP.SnapToIdlePostReload = false