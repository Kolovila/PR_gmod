AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MK21"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "n"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_mk14_ebr.mdl"
	SWEP.WMPos = Vector(-0.4, 4, 1)
	SWEP.WMAng = Vector(-4, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.892, -0.88, 0.832)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.NXSPos = Vector(-2.872, -1.958, -0.247)
	SWEP.NXSAng = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.891, -5.979, -0.093)

	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.918, -5.728, 0.277)

	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.912, -1.869, -0.12)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.885, -5.712, -0.189)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-2.887, -2.586, -0.253)

	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.211, -4.624, 0.221)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(4.513, 0, -0.94)
	SWEP.SprintAng = Vector(-14.549, 36.645, -9.558)
	
	SWEP.CustomizePos = Vector(13.02, 2.542, 0.158)
	SWEP.CustomizeAng = Vector(13.508, 46.469, 14.621)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.221, -4.617, -1.234), [2] = Vector(0, -0.008, 0)}}

	SWEP.SightWithRail = false
	SWEP.CSGOACOGAxisAlign = {right = -0.1, up = -0.1, forward = -40}
	SWEP.LeupoldAxisAlign = {right = 1, up = 0, forward = 0}
	SWEP.NXSAlign = {right = 0.35, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.2, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.BoltBone = "j_bolt"
	SWEP.HoldBoltWhileEmpty = true
	SWEP.BoltShootOffset = Vector(-2.1, 0, 0)
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}
	
	SWEP.AttachmentModelsVM = {
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "j_gun", rel = "", pos = Vector(4.886, 0, -1.244), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "j_gun", rel = "", pos = Vector(-2.398, -0.28, -8.723), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "j_gun", rel = "", pos = Vector(4.521, 0, -1.226), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "j_gun", rel = "", pos = Vector(3.019, 0, 3.306), angle = Angle(0, 0, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "j_gun", rel = "", pos = Vector(3.019, 0, 3.306), angle = Angle(0, 0, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "j_gun", rel = "", pos = Vector(16.413, -0.055, -1.703), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_saker"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "j_gun", rel = "", pos = Vector(27.313, 0.025, 0.477), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "RINIC_MK14_Body", pos = Vector(-0.173, 6.684, 1.22), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "j_gun", rel = "", pos = Vector(1.764, -0.058, -1.991), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "RINIC_MK14_Body", pos = Vector(-0.419, -5.74, -3.297), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "RINIC_MK14_Body", pos = Vector(-0.322, -3.846, -3.984), angle = Angle(0, -90, 0), size = Vector(0.93, 0.93, 0.93)},
		["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "j_gun", rel = "", pos = Vector(5.507, 0.093, 3.404), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2)}
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1, roll = 1, forward = 1.5, pitch = 0.5}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.RailBGs = {main = 3, on = 1, off = 0}
SWEP.BipodBGs = {main = 4, on = 1, off = 0}
SWEP.SightBGs = {main = 2, sg1 = 1, none = 0}
SWEP.LuaViewmodelRecoil = true
SWEP.ADSFireAnim = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_eotech", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {-450, -300},  atts = {"md_saker"}},
	[3] = {header = "Bipod", offset = {800, 100}, atts = {}},
	["+reload"] = {header = "Ammo", offset = {-450, 100}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 1, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 4, "md_fas2_leupold")
		table.insert(SWEP.Attachments[1].atts, 3, "md_cod4_aimpoint_v2")
		table.insert(SWEP.Attachments[3].atts, 1, "md_hk416_bipod")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	fire_dry = "shoot_last",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {reload_empty = {{time = 0, sound = "CW_FOLEY_LIGHT"},
	{time = 0.55, sound = "CW_RINIC_MK14_MAGOUT"},
	{time = 1.2, sound = "CW_FOLEY_LIGHT"},
	{time = 1.79, sound = "CW_RINIC_MK14_MAGIN"},
	{time = 2.2, sound = "CW_FOLEY_LIGHT"},
	{time = 3.12, sound = "CW_RINIC_MK14_BOLTBACK"},
	{time = 3.29, sound = "CW_RINIC_MK14_BOLTFORWARD"}},

	reload = {{time = 0, sound = "CW_FOLEY_LIGHT"},
	{time = 0.55, sound = "CW_RINIC_MK14_MAGOUT"},
	{time = 1.2, sound = "CW_FOLEY_LIGHT"},
	{time = 1.79, sound = "CW_RINIC_MK14_MAGIN"},
	{time = 1.9, sound = "CW_FOLEY_LIGHT"}},
	
	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= "No M40 fam"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_mk14_ebr.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_mk14_ebr.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_RINIC_MK14_FIRE"
SWEP.FireSoundSuppressed = "CW_RINIC_MK14_FIRE_SUPPRESSED"
SWEP.Recoil = 0.85

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 58
SWEP.DeployTime = 0.8

SWEP.RecoilToSpread = 1.4 -- the RINIC_MK14 in particular will have 30% more recoil from continuous fire to give a feeling of "oh fuck I should stop firing 7.62x51MM in full auto at 750 RPM"

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.05
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadHalt = 2.2
SWEP.ReloadHalt_Empty = 3.65

SWEP.SnapToIdlePostReload = false

function SWEP:IndividualThink()
	if self.FireMode == "auto" then
		self.FireDelay = 60/725
	else
		self.FireDelay = 60/750
	end
end