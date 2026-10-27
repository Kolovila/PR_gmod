AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'BLACK's Custom Deagle'"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol_deagle"
	SWEP.PosBasedMuz = false
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_deagle.mdl"
	SWEP.WMPos = Vector(-0, -0.5, -0.5)
	SWEP.WMAng = Vector(-3, -7, 180)

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
		
	SWEP.MicroT1Pos = Vector(-2.28, -4.661, -0.292)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.25, -6.198, -0.32)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.511, 4.152, 0.703)
	SWEP.IronsightAng = Vector(0.083, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, 0, 2.427)
	SWEP.SprintAng = Vector(-26.778, 0, 0)
	
	SWEP.CustomizePos = Vector(3.782, -4.224, -4.56)
	SWEP.CustomizeAng = Vector(28.843, 17.739, 0)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.3
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.FullAimViewmodelRecoil = false
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "weapon", pos = Vector(3.325, -1.075, 0.209), angle = Angle(90, 0, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", pos = Vector(-6.054, 8.47, -0.035), angle = Angle(0, 1.5, -90), size = Vector(0.85, 0.85, 0.85)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "weapon", pos = Vector(-1.831, 3.892, 0.504), angle = Angle(-90, 0, -90), size = Vector(0.85, 0.85, 0.85)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "weapon", pos = Vector(-4.784, -0.408, -1.581), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6)}
	}
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {["+attack2"] = {header = "Perks", offset = {-600, -350}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {450, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	fire_dry = "shoot_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_BLACKS_DEAGLE_DRAW"}},

	reload = {[1] = {time = 0.37, sound = "CW_BLACKS_DEAGLE_MAGOUT"},
	[2] = {time = 0.91, sound = "CW_BLACKS_DEAGLE_MAGIN"}},
	
	reload_empty = {[1] = {time = 0.37, sound = "CW_BLACKS_DEAGLE_MAGOUT"},
	[2] = {time = 0.91, sound = "CW_BLACKS_DEAGLE_MAGIN"},
	[3] = {time = 1.49, sound = "CW_BLACKS_DEAGLE_SLIDE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_deagle.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_deagle.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 28
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".50 AE"

SWEP.FireDelay = 60/600
SWEP.FireSound = "CW_BLACKS_DEAGLE_FIRE"
SWEP.FireSoundSuppressed = "CW_BLACKS_DEAGLE_FIRE_SUPPRESSED"
SWEP.Recoil = 1.5

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.05
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.08
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 80
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.19
SWEP.ReloadHalt = 1.52

SWEP.ReloadTime_Empty = 1.61
SWEP.ReloadHalt_Empty = 1.82