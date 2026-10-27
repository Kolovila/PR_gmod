AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HK VP70"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 1, z = 1}

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_pist_hkvp70z.mdl"
	SWEP.WMPos = Vector(-1.168, -0.5, -1.0)
	SWEP.WMAng = Vector(-4.452, 0, -171.924)

	SWEP.IronsightPos = Vector(-2.036, -3.189, 1.044)
	SWEP.IronsightAng = Vector(2.128, -0.749, 0)
		
	SWEP.MicroT1Pos = Vector(-2.28, -4.661, -0.292)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.25, -6.198, -0.32)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.809, -2.211, 0.402)
	SWEP.SprintAng = Vector(-16.885, 30.25, -12.664)

	SWEP.PronePos = Vector(2.181, -5.053, 0.463)
	SWEP.ProneAng = Vector(-12.346, 60.861, -8.143)

	SWEP.CustomizePos = Vector(4.221, 0.804, 0)
	SWEP.CustomizeAng = Vector(12.161, 28.141, 7.738)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.5
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBone = "Object003"
	SWEP.BoltShootOffset = Vector(1.2, 0, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = false
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 1.5, roll = 3, forward = 4, pitch = 7}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_lasersight"] = {model = "models/rageattachments/pistoltribeam.mdl", bone = "Object001", rel = "", pos = Vector(-8.084, 0.101, 0.129), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_saker"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Object001", rel = "", pos = Vector(-10.933, 0.017, 1.513), angle = Angle(0, 180, 0), size = Vector(0.6, 0.6, 0.6)}
	}

	SWEP.LaserPosAdjust = Vector(1, 3, -1.5)
	SWEP.LaserAngAdjust = Angle(2, 0.5, 0) 
end

SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = false
SWEP.ZoomAmount = 5

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-600, -200}, atts = {"md_saker"}},
[2] = {header = "Laser", offset = {-600, 300}, atts = {"md_lasersight"}},
["+attack2"] = {header = "Perks", offset = {450, -350}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {450, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.4, sound = "CW_VP70_SLIDEBACK"},
	[3] = {time = 0.6, sound = "CW_VP70_SLIDEFORWARD"}}, 

	reload = {[1] = {time = 0.42, sound = "CW_VP70_MAGOUT"},
	[2] = {time = 1.5, sound = "CW_VP70_MAGIN"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi", "3burst"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_pist_hkvp70z.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_pist_hkvp70z.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 54
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_VP70_FIRE"
SWEP.FireSoundSuppressed = "CW_VP70_FIRE_SUPPRESSED"
SWEP.Recoil = 0.55
SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.04
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.71
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.5
SWEP.ReloadTime = 1.65
SWEP.ReloadHalt = 1.9

SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt_Empty = 2.0

function SWEP:IndividualThink()
	if self.FireMode == "3burst" then
		self.FireDelay = 0.0272727272727273
	else
		self.FireDelay = 0.08
	end
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end