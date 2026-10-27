AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Beretta 92FS Inox (Sword Cutlass)"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rev_92fs.mdl"
	SWEP.WMPos = Vector(1, -5.5, 3)
	SWEP.WMAng = Vector(-7, 180, 180)
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 1, y = 0, z = 0}
		
	SWEP.RMRPos = Vector(2.693, -4.248, 0.4)
	SWEP.RMRAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-3.961, 0, 0.56)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, 0, 2.618)
	SWEP.SprintAng = Vector(-21.859, 0, 0)

	SWEP.PronePos = Vector(-1.496, -9.41, -2.191)
	SWEP.ProneAng = Vector(5.592, 55.314, -22.717)

	SWEP.CustomizePos = Vector(7.656, 0, -1.367)

    	SWEP.CustomizeAng = Vector(11.838, 32.549, 9.692)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.2
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(-1.2, 0, 0)
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/wystan/attachments/2octorrds.mdl", bone = "slidey", rel = "", pos = Vector(-1.18, -9.881, -1.132), angle = Angle(-0.835, -178.18, 5.185), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/pistoltribeam.mdl", bone = "mnine", rel = "", pos = Vector(-1.55, -13.124, -3.73), angle = Angle(-4.594, 90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Object007", rel = "", pos = Vector(-2.886, 17.954, -1.7), angle = Angle(1.621, -90, 0), size = Vector(0.5, 0.5, 0.5)}
	}

	SWEP.LaserPosAdjust = Vector(1, 3, -1.5)
	SWEP.LaserAngAdjust = Angle(1, 1.8, 0) 
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {["+attack2"] = {header = "Perks", offset = {-400, -350}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {650, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.5, sound = "CW_SC92FS_SLIDEBACK"},
	[3] = {time = 0.7, sound = "CW_SC92FS_SLIDEFORWARD"}},

	reload = {[1] = {time = 0.44, sound = "CW_SC92FS_MAGOUT"},
	[2] = {time = 1.35, sound = "CW_SC92FS_MAGIN"},
	[3] = {time = 2.2, sound = "CW_SC92FS_SLIDEBACK"},
	[4] = {time = 2.45, sound = "CW_SC92FS_SLIDEFORWARD"}}}

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

SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rev_92fs.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rev_92fs.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.0666666666666667
SWEP.FireSound = "CW_SC92FS_FIRE"
SWEP.Recoil = 0.25

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.20
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.35
SWEP.Shots = 1
SWEP.Damage = 45
SWEP.DeployTime = 0.71
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.9
SWEP.ReloadHalt = 1.9

SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.12
	end
end