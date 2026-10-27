AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M249 SAW"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.0
	SWEP.ViewbobIntensity = 1.0
	SWEP.FireMoveMod = 1.3
	
	SWEP.BoltBone = "BoltHandle"
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
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_m249_saw_rinic.mdl"
	SWEP.WMPos = Vector(-1.5, 2, 0)
	SWEP.WMAng = Vector(-5, 0, 180)

	SWEP.IronsightPos = Vector(-2.049, -2.073, 0.962)

    	SWEP.IronsightAng = Vector(0.158, 0.029, 0)
	
	SWEP.AimpointPos = Vector(-2.003, -3.392, 0.252)
	SWEP.AimpointAng = Vector(0, 0.256, 0)
	
	SWEP.EoTechPos = Vector(-2.05, -3.55, 0.037)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.027, -2.287, 0.381)
	SWEP.CoD4ReflexAng = Vector(0, 0.008, 0)
	
	SWEP.KobraPos = Vector(-2.55, -3.224, -0.026)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
	SWEP.MicroT1Pos = Vector(-2.052, -2.287, 0.279)

	SWEP.MicroT1Ang = Vector(0, 0.071, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.001, -3.392, 0.141)
	SWEP.CSGOACOGAng = Vector(0, 0.256, 0)
	
	SWEP.SprintPos = Vector(5.592, -3.03, -1.729)
    	SWEP.SprintAng = Vector(-19.247, 44.048, -20.893)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.409, -6.31, -0.501), [2] = Vector(-0.84, 0.273, 0)}}
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	
	SWEP.AttachmentModelsVM = {
	["md_aimpoint"] = { model = "models/wystan/attachments/aimpoint.mdl", bone = "LidCont", rel = "", pos = Vector(-0.399, -9.374, -4.285), angle = Angle(0, 0, 0), size = Vector(0.85, 0.85, 0.85)},
	["md_eotech"] = { model = "models/wystan/attachments/2otech557sight.mdl", bone = "LidCont", rel = "", pos = Vector(0.061, -15.476, -10.188), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
	["md_microt1"] = { model = "models/cw2/attachments/microt1.mdl", bone = "LidCont", rel = "", pos = Vector(-0.201, -4.468, 0.67), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
	["md_anpeq15"] = { model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(11.972, -5.123, 0.398), angle = Angle(-0.322, 0.083, -90.555), size = Vector(0.5, 0.5, 0.5)},
	["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "LidCont", rel = "", pos = Vector(-0.134, -9.49, -3.09), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
	["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Weapon", rel = "", pos = Vector(-0.004, 16.517, 2.763), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6)},
	["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "cover", rel = "", pos = Vector(-0.184, -10.093, -3.815), angle = Angle(-91.204, 0.182, -88.82), size = Vector(0.754, 0.754, 0.754), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "LidCont", rel = "", pos = Vector(-0.204, -7.46, -1.974), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},
	["md_csgo_556"] = { type = "Model", model = "models/kali/weapons/csgo/eq_optic_sig.mdl", bone = "cover", rel = "", pos = Vector(-4.713, -0.533, -1.058), angle = Angle(0, 0, -89.885), size = Vector(0.736, 0.736, 0.736), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }

}
	
	SWEP.LaserPosAdjust = Vector(1, 5, 0)
	SWEP.LaserAngAdjust = Angle(2, 0, 0) 

end

SWEP.ReceiverBGs = {main = 2, m249_bipod = 1, regular = 0}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	["+attack2"] = {header = "Perks", offset = {800, 100}, atts = {"pk_sleightofhand", "pk_light"}},
	[2] = {header = "Barrel", offset = {-500, -300}, atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Bipod", offset = {-500, 300}, atts = {"bg_m249_bipod"}},
	["+reload"] = {header = "Ammo", offset = {800, 500}, atts = {"am_magnum", "am_matchgrade"}}}
	
	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_RINIC_M249_DRAW"},
	[2] = {time = 0.65, sound = "CW_RINIC_M249_boltback"},
	[3] = {time = 0.85, sound = "CW_RINIC_M249_boltforward"}},

	reload = {[1] = {time = 0.15, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.76, sound = "CW_RINIC_M249_Coverup"},
	[3] = {time = 1.79, sound = "CW_RINIC_M249_Boxoutfull"},
	[4] = {time = 2.87, sound = "CW_FOLEY_MEDIUM"},
	[5] = {time = 4, sound = "CW_RINIC_M249_Boxin"},
	[6] = {time = 4.62, sound = "CW_RINIC_M249_Chain"},
	[7] = {time = 5.86, sound = "CW_RINIC_M249_Coverdown"}},

	reload_empty = {[1] = {time = 0.15, sound = "CW_FOLEY_HEAVY"},
	[2] = {time = 0.85, sound = "CW_RINIC_M249_boltback"},
	[3] = {time = 1.05, sound = "CW_RINIC_M249_boltforward"},
	[4] = {time = 2.47, sound = "CW_RINIC_M249_Coverup"},
	[5] = {time = 3.55, sound = "CW_RINIC_M249_Boxout"},
	[6] = {time = 4.56, sound = "CW_FOLEY_MEDIUM"},
	[7] = {time = 5.62, sound = "CW_RINIC_M249_Boxin"},
	[8] = {time = 6.32, sound = "CW_RINIC_M249_Chain"},
	[9] = {time = 7.59, sound = "CW_RINIC_M249_Coverdown"}}}

SWEP.SpeedDec = 95

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
SWEP.ViewModel		= "models/cw2/weapons/v_m249_saw_rinic.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_m249_saw_rinic.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 60/900
SWEP.FireSound = "CW_RINIC_M249"
SWEP.FireSoundSuppressed = "CW_RINIC_M249_SUPP"
SWEP.Recoil = 0.45

SWEP.ADSFireAnim = false
SWEP.BipodFireAnim = true

SWEP.HipSpread = 0.145
SWEP.AimSpread = 0.03
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.12
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 5.95
SWEP.ReloadTime_Empty = 7.65
SWEP.ReloadHalt = 6.12
SWEP.ReloadHalt_Empty = 7.95
SWEP.SnapToIdlePostReload = false
SWEP.Chamberable = false