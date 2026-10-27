AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RPD"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.0
	SWEP.ViewbobIntensity = 1.0
	SWEP.FireMoveMod = 1.0
	
	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(0, 3, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.IconLetter = "w"
	killicon.AddFont("", "", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = 5, z = -1.2}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -5}

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_mach_rpd.mdl"
	SWEP.WMPos = Vector(-0.5, 4, -0.5)
	SWEP.WMAng = Vector(-5, 0, 180)

	SWEP.IronsightPos = Vector(-3.842, -5.659, 1.96)
    	SWEP.IronsightAng = Vector(1.937, 0.4, 0)
	
	SWEP.AimpointPos = Vector(-3.881, -5.079, 1.577)

	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-3.911, -5.529, 1.554)

	SWEP.EoTechAng = Vector(1.514, -0.046, 0)
	
	SWEP.CoD4ReflexPos = Vector(-3.914, -3.774, 1.565)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.55, -3.224, -0.026)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
	SWEP.MicroT1Pos = Vector(-3.919, -3.738, 1.557)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-3.868, -3.565, 1.514)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(5.592, -3.03, -1.729)
    SWEP.SprintAng = Vector(-19.247, 44.048, -20.893)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.409, -6.31, -0.501), [2] = Vector(-0.84, 0.273, 0)}}
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	
	SWEP.AttachmentModelsVM = {
	["md_aimpoint"] = { model = "models/wystan/attachments/aimpoint.mdl", bone = "upper", rel = "", pos = Vector(-0.44, -12.091, -6.394), angle = Angle(0, 0, 0), size = Vector(1.1, 1.1, 1.1)},
	["md_eotech"] = { model = "models/wystan/attachments/2otech557sight.mdl", bone = "upper", rel = "", pos = Vector(0.087, -16.253, -10.935), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
	["md_microt1"] = { model = "models/cw2/attachments/microt1.mdl", bone = "upper", rel = "", pos = Vector(-0.18, -4.764, 0.018), angle = Angle(0, 180, 0), size = Vector(0.55, 0.55, 0.55)},
	["md_anpeq15"] = { model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(11.972, -5.123, 0.398), angle = Angle(-0.322, 0.083, -90.555), size = Vector(0.5, 0.5, 0.5)},
    ["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "upper", rel = "", pos = Vector(-0.098, -12.74, -4.444), angle = Angle(0, -90, 0), size = Vector(0.949, 0.949, 0.949)},
	["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Base", rel = "", pos = Vector(-0.269, 26.583, -0.168), angle = Angle(-0.709, -90, 0), size = Vector(1, 1, 1)},
	["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "cover", rel = "", pos = Vector(-0.184, -10.093, -3.815), angle = Angle(-91.204, 0.182, -88.82), size = Vector(0.754, 0.754, 0.754), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "upper", rel = "", pos = Vector(-0.185, -10.094, -3.816), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1)},
	["md_csgo_556"] = { type = "Model", model = "models/kali/weapons/csgo/eq_optic_sig.mdl", bone = "cover", rel = "", pos = Vector(-4.713, -0.533, -1.058), angle = Angle(0, 0, -89.885), size = Vector(0.736, 0.736, 0.736), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }

}
	
	SWEP.LaserPosAdjust = Vector(1, 5, 0)
	SWEP.LaserAngAdjust = Angle(2, 0, 0) 

end

SWEP.ReceiverBGs = {main = 3, regular = 0, rpd_bipod = 1}
SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	["+attack2"] = {header = "Perks", offset = {800, 100}, atts = {"pk_sleightofhand", "pk_light"}},
	[2] = {header = "Barrel", offset = {-500, -300}, atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Bipod", offset = {-500, 300}, atts = {"bg_rpd_bipod"}}}
	
	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {reload = {[1] = {time = 0.35, sound = "CW_RPD_bolt"},
	[2] = {time = 1.55, sound = "CW_RPD_Coverup"},
	[3] = {time = 2.1, sound = "CW_RPD_Boxout"},
	[4] = {time = 3, sound = "CW_RPD_Boxin"},
	[5] = {time = 3.9, sound = "CW_RPD_Chain"},
	[6] = {time = 4.45, sound = "CW_RPD_Coverdown"},
	[7] = {time = 4.62, sound = "CW_RPD_Coverup"}}}

SWEP.SpeedDec = 70

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"
SWEP.Suppressable = false

SWEP.Author			= "Rinic"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_mach_rpd.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_mach_rpd.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_RPD"
SWEP.FireSoundSuppressed = "CW_RPD_SUPP"
SWEP.Recoil = 0.65

SWEP.ADSFireAnim = false
SWEP.BipodFireAnim = true

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.09
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 4.72
SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = false
SWEP.Chamberable = false