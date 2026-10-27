AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Beretta PX4 Storm"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_pist_canaan_px4.mdl"
	SWEP.WMPos = Vector(0.2, 0.9, -1.5)
	SWEP.WMAng = Vector(-29.452, -90, -171.924)

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
		
	SWEP.MicroT1Pos = Vector(-2.28, -4.661, -0.292)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.25, -6.198, -0.32)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(1.72, 0, 1.118)
	SWEP.IronsightAng = Vector(0.324, -0.033, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.CustomizePos = Vector(-5.628, -4.422, -1.81)
    	SWEP.CustomizeAng = Vector(21.809, -40.805, -13.367)
	
	SWEP.SprintPos = Vector(-2.859, -7.665, -7.053)

	SWEP.SprintAng = Vector(70, 0.495, 0)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBone = "slidey"
	SWEP.BoltShootOffset = Vector(-1.2, 0, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 1.5, roll = 3, forward = 17, pitch = 17}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 25 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "weapon", pos = Vector(3.325, -1.075, 0.209), angle = Angle(90, 0, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", pos = Vector(-6.054, 8.47, -0.035), angle = Angle(0, 1.5, -90), size = Vector(0.85, 0.85, 0.85)},
		["md_lasersight"] = {model = "models/rageattachments/pistoltribeam.mdl", bone = "mnine", rel = "", pos = Vector(-1.461, -12.995, -4.297), angle = Angle(-4.71, 90, 0), size = Vector(1, 1, 1)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "mnine", rel = "", pos = Vector(-1.367, -6.693, -0.454), angle = Angle(0, 1.103, 176.826), size = Vector(0.4, 0.4, 0.4)}
	}

	SWEP.LaserPosAdjust = Vector(1, 3, -1.5)
	SWEP.LaserAngAdjust = Angle(1, 1.8, 0)
end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = false
SWEP.ZoomAmount = 10

SWEP.Attachments = {[2] = {header = "Barrel", offset = {-400, -350}, atts = {"md_saker"}},
["+attack2"] = {header = "Perks", offset = {450, -350}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {650, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload = {[1] = {time = 0.42, sound = "CW_PX4_STORM_MAGOUT"},
	[2] = {time = 0.98, sound = "CW_PX4_STORM_MAGIN"}},
	
	reload_empty = {[1] = {time = 0.42, sound = "CW_PX4_STORM_MAGOUT"},
	[2] = {time = 0.98, sound = "CW_PX4_STORM_MAGIN"},
	[3] = {time = 1.78, sound = "CW_PX4_STORM_SLIDE"}}}

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

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_pist_canaan_px4.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_pist_canaan_px4.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 17
SWEP.Primary.DefaultClip	= 68
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.0666666666666667
SWEP.FireSound = "CW_PX4_STORM_FIRE"
SWEP.FireSoundSuppressed = "CW_PX4_STORM_FIRE_SUPPRESSED"
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.06
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.4
SWEP.Chamberable = true
SWEP.SnapToIdlePostReload = false

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.58
SWEP.ReloadHalt = 1.78

SWEP.ReloadTime_Empty = 1.88
SWEP.ReloadHalt_Empty = 2.08