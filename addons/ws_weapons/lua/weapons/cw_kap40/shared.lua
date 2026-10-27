AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "KAP-40"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_kap_40.mdl"
	SWEP.WMPos = Vector(-0.5, -0.5, -1.0)
	SWEP.WMAng = Vector(-4, 0, -180)
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.6
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -1}
		
	SWEP.DocterPos = Vector(2.227, -5.2, 0.34)
	SWEP.DocterAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(2.262, -2.57, 0.615)
	SWEP.IronsightAng = Vector(0.3, 0.119, 0)
	
	SWEP.SprintPos = Vector(-0.603, 0.402, 2.009)
	SWEP.SprintAng = Vector(-26.734, -2.814, 6.5)

	SWEP.PronePos = Vector(-0.633, -6.593, -2.26)
	SWEP.ProneAng = Vector(11.078, 1.549, 0.757)

	SWEP.CustomizePos = Vector(-5.557, -3.441, -1.877)
	SWEP.CustomizeAng = Vector(14.769, -29.254, -2.878)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.KAP40BoneMod = {
		["Bone_L_UpperArm01"] = { scale = Vec1, pos = Vec0, angle = Angle(0, 0, 0) }
	}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 1.2
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(0, 0, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 0, forward = 15, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_docter"] = {model = "models/wystan/attachments/2octorrds.mdl", bone = "gun", rel = "", pos = Vector(0.163, 2.224, 2.003), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "gun", rel = "", pos = Vector(-1.101, -4.468, -1.392), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "gun", rel = "", pos = Vector(-0.084, -7.337, 0.558), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)}
	}
			
	SWEP.LaserPosAdjust = Vector(0.5, 5, -0.5)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = false
SWEP.ZoomAmount = 10

SWEP.Attachments = {[1] = {header = "Sight", offset = {450, -350}, atts = {"md_docter"}},
[2] = {header = "Barrel", offset = {-400, -350}, atts = {"md_csgo_silencer_rifle"}},
[3] = {header = "Laser", offset = {-400, 200}, atts = {"md_lasersight"}},
["+attack2"] = {header = "Perks", offset = {650, 400}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {650, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.43, sound = "CW_KAP40_SLIDE"}},

	reload = {[1] = {time = 0.4, sound = "CW_KAP40_MAGOUT"},
	[2] = {time = 1.18, sound = "CW_KAP40_MAGIN"},
	[3] = {time = 1.79, sound = "CW_KAP40_SLIDEBACK"},
	[4] = {time = 2.02, sound = "CW_KAP40_SLIDE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_kap_40.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_kap_40.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 0.064034151547492
SWEP.FireSound = "CW_KAP40_FIRE"
SWEP.FireSoundSuppressed = "CW_KAP40_FIRE_SUPPRESSED"
SWEP.Recoil = 0.29

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.04
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.075
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 45
SWEP.DeployTime = 0.5
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 1.6
SWEP.ReloadHalt = 1.75

SWEP.ReloadTime_Empty = 1.95
SWEP.ReloadHalt_Empty = 2
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end