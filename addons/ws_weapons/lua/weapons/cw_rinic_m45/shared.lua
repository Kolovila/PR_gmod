AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M45 MEUSOC"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_m45.mdl"
	SWEP.WMPos = Vector(-0.7, 5, 1)
	SWEP.WMAng = Vector(-6.7, 0, -180)

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
		
	SWEP.MicroT1Pos = Vector(-2.28, -4.661, -0.292)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.25, -6.198, -0.32)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-1.65, 0, 0.231)

	SWEP.IronsightAng = Vector(0.279, 0.018, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.CustomizePos = Vector(5.381, 0, -3.918)
    	SWEP.CustomizeAng = Vector(13.862, 25.283, 0)
	
	SWEP.SprintPos = Vector(0, 0, 2.125)
	SWEP.SprintAng = Vector(-23.475, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.2
	SWEP.FullAimViewmodelRecoil = false
	SWEP.BoltBone = "slide"
	SWEP.BoltShootOffset = Vector(0, 0, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = false
	SWEP.DisableSprintViewSimulation = true

	SWEP.LaserPosAdjust = Vector(0.5, 0, -1)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	SWEP.SightWithRail = true	

	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "weapon", pos = Vector(3.325, -1.075, 0.209), angle = Angle(90, 0, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", pos = Vector(-6.054, 8.47, -0.035), angle = Angle(0, 1.5, -90), size = Vector(0.85, 0.85, 0.85)},
		["md_insight_x2"] = { type = "Model", model = "models/cw2/attachments/pistollaser.mdl", bone = "Weapon", rel = "", pos = Vector(0, 0.344, -0.468), angle = Angle(0, 90, 0), size = Vector(0.119, 0.119, 0.119), bodygroups = {[1] = 1}},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Weapon", rel = "", pos = Vector(0.045, -4.706, -0.977), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)}
	}
end

SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false
SWEP.ZoomAmount = 5

SWEP.Attachments = {[2] = {header = "Barrel", offset = {-400, -350}, atts = {"md_saker"}},
--[3] = {header = "Rail", offset = {-350, 200}, atts = {"md_insight_x2"}},
["+attack2"] = {header = "Perks", offset = {450, -350}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {650, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	fire_dry = "shoot3",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.39, sound = "CW_RINIC_M45_SLIDEBACK"},
	[3] = {time = 0.59, sound = "CW_RINIC_M45_SLIDEFORWARD"}},

	reload = {[1] = {time = 0.67, sound = "CW_RINIC_M45_MAGCLICK"},
	[2] = {time = 0.91, sound = "CW_RINIC_M45_MAGOUT"},
	[3] = {time = 1.71, sound = "CW_RINIC_M45_MAGIN"},
	[4] = {time = 2.01, sound = "CW_RINIC_M45_MAGTAP"}},
	
	reload_empty = {[1] = {time = 0.61, sound = "CW_RINIC_M45_MAGOUT"},
	[2] = {time = 1.54, sound = "CW_RINIC_M45_MAGTAP"},
	[3] = {time = 2.15, sound = "CW_RINIC_M45_SLIDEFORWARD"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_m45.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_m45.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 21
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 60/750
SWEP.FireSound = "CW_RINIC_M45_FIRE"
SWEP.FireSoundSuppressed = "CW_RINIC_M45_FIRE_SUPPRESSED"
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.4
SWEP.Chamberable = true
SWEP.SnapToIdlePostReload = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.15
SWEP.ReloadHalt = 2.45

SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt_Empty = 2.45