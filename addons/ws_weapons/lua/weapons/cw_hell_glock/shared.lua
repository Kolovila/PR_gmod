AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Full-Auto G17"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_hell_glock.mdl"
	SWEP.WMPos = Vector(-1.168, 0.2, -1.0)
	SWEP.WMAng = Vector(-4.452, 0, -171.924)
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
		
	SWEP.DeltaPos = Vector(-1.637, -4.636, -0.014)

	SWEP.DeltaAng = Vector(0, -0.366, 0)

	SWEP.IronsightPos = Vector(-1.678, -5.036, 0.469)
	SWEP.IronsightAng = Vector(-0.498, -0.58, 0)
	
	SWEP.SprintPos = Vector(-0.603, 0.402, 2.009)
	SWEP.SprintAng = Vector(-26.734, -2.814, 6.5)

	SWEP.PronePos = Vector(1.345, -10.577, -1.823)
	SWEP.ProneAng = Vector(8.67, 14.75, 0.411)

	SWEP.CustomizePos = Vector(8.171, -3.208, -0.417)
    	SWEP.CustomizeAng = Vector(8.312, 37.143, 7.403)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.2
	SWEP.FullAimViewmodelRecoil = false
	SWEP.BoltBone = "Object04"
	SWEP.BoltShootOffset = Vector(-1.5, 0, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 0, forward = 10, pitch = 10}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_deltasight"] = {model = "models/rageattachments/deltasight.mdl", bone = "Object04", rel = "", pos = Vector(-0.04, 0.565, -0.027), angle = Angle(0, 92.871, 0), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/pistoltribeam.mdl", bone = "Box05", rel = "", pos = Vector(-0.005, -4.016, -0.81), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Box05", rel = "", pos = Vector(-0.009, -6.856, 0.954), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)}
	}

	SWEP.LaserPosAdjust = Vector(1, 10, -1)
	SWEP.LaserAngAdjust = Angle(-0.5, 0, 0) 
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -450}, atts = {"md_deltasight"}},
[2] = {header = "Barrel", offset = {200, -450}, atts = {"md_csgo_silencer_rifle"}},
[3] = {header = "Laser", offset = {-600, -450}, atts = {"md_lasersight"}},
["+attack2"] = {header = "Perks", offset = {-600, 200}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload = {[1] = {time = 0.38, sound = "CW_HELL_GLOCK_MAGOUT"},
	[2] = {time = 1.02, sound = "CW_HELL_GLOCK_MAGIN"}},

	reload_empty = {[1] = {time = 0.38, sound = "CW_HELL_GLOCK_MAGOUT"},
	[2] = {time = 1.02, sound = "CW_HELL_GLOCK_MAGIN"},
	[3] = {time = 1.68, sound = "CW_HELL_GLOCK_SLIDE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_hell_glock.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_hell_glock.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.066666666666667
SWEP.FireSound = "CW_HELL_GLOCK_FIRE"
SWEP.FireSoundSuppressed = "CW_HELL_GLOCK_FIRE_SUPPRESSED"
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.22
SWEP.Shots = 1
SWEP.Damage = 27
SWEP.DeployTime = 0.5
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.38
SWEP.ReloadHalt = 1.45
SWEP.ReloadTime_Empty = 1.8
SWEP.ReloadHalt_Empty = 1.95
SWEP.SnapToIdlePostReload = false