AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Rinic Custom's 'Glock''"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_custom_glock.mdl"
	SWEP.WMPos = Vector(-1.168, 0.2, -1.0)
	SWEP.WMAng = Vector(-4.452, 0, -171.924)
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 4, y = 2, z = 2}
		
	SWEP.DocterPos = Vector(-2.738, -4.18, 0.379)
	SWEP.DocterAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.724, -2.342, 0.709)


	SWEP.IronsightAng = Vector(0.209, 0.052, 0)
	
	SWEP.SprintPos = Vector(-0.603, 0.402, 2.009)
	SWEP.SprintAng = Vector(-26.734, -2.814, 6.5)

	SWEP.PronePos = Vector(2.086, -4.336, -1.655)
	SWEP.ProneAng = Vector(-9.822, 60.486, -19.431)

	SWEP.CustomizePos = Vector(3.233, -2.264, -0.789)
    	SWEP.CustomizeAng = Vector(12.31, 32.655, 3.729)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.2
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(0, -1.5, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0, roll = 7, forward = 10, pitch = 20}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_docter"] = {model = "models/wystan/attachments/2octorrds.mdl", bone = "Slide", rel = "", pos = Vector(0.263, -0.438, 0.261), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/pistoltribeam.mdl", bone = "mnine", rel = "", pos = Vector(-1.55, -13.124, -3.73), angle = Angle(-4.594, 90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Gun", rel = "", pos = Vector(0.014, -6.132, 0.052), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6)}
	}

	SWEP.LaserPosAdjust = Vector(1, 3, -1.5)
	SWEP.LaserAngAdjust = Angle(1, 1.8, 0) 
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = true
SWEP.ADSFireAnim = false
SWEP.CanRestOnObjects = false
SWEP.ZoomAmount = 10

SWEP.Attachments = {[1] = {header = "Sight", offset = {450, -350}, atts = {"md_docter"}},
[2] = {header = "Barrel", offset = {-400, -350}, atts = {"md_csgo_silencer_rifle"}},
["+attack2"] = {header = "Perks", offset = {-400, 200}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {650, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.25, sound = "CW_CUSTOM_GLOCK_SLIDEBACK"},
	[3] = {time = 0.42, sound = "CW_CUSTOM_GLOCK_SLIDEFORWARD"}},

	reload = {[1] = {time = 0.38, sound = "CW_CUSTOM_GLOCK_MAGOUT"},
	[2] = {time = 0.95, sound = "CW_CUSTOM_GLOCK_MAGIN"},
	[3] = {time = 1.4, sound = "CW_CUSTOM_GLOCK_SLIDEFORWARD"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi", "auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_custom_glock.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_custom_glock.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 72
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.0697674418604651
SWEP.FireSound = "CW_CUSTOM_GLOCK_FIRE"
SWEP.FireSoundSuppressed = "CW_CUSTOM_GLOCK_FIRE_SUPPRESSED"
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.04
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.10
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.03
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.5
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.38
SWEP.ReloadHalt = 1.45
SWEP.ReloadTime_Empty = 1.75
SWEP.ReloadHalt_Empty = 1.85
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.21
	end
end