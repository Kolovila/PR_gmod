if CustomizableWeaponry then


AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
if server then
CustomizableWeaponry:registerAmmo(".300 AAC Blackout", ".300 AAC Blackout Rounds", 5.62, 35)
end

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Honey Badger"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_ber_honey_badger", "weaponicons/honeybadg-k", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/select/honeybadg-h")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.3
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 1.5}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.82
	SWEP.FireMoveMod = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_dber_badg.mdl"
	SWEP.WMPos = Vector(0, -0.5, 0.5)
	SWEP.WMAng = Vector(0, 0, 180)

	SWEP.IronsightPos = Vector(-2.021, 0, 0.026)
	SWEP.IronsightAng = Vector(0.282, 0.059, 0)

	SWEP.MicroT1Pos = Vector(-2.03, -1.866, 0.47)
	SWEP.MicroT1Ang = Vector(-0.138, -0.09, 0)

	SWEP.EoTechPos = Vector(-2.01, -1.318, 0.232)
	SWEP.EoTechAng = Vector(0.23, 0, 0)

	SWEP.AimpointPos = Vector(-2.027, -2.593, 0.3)
	SWEP.AimpointAng = Vector(0.14, 0, 0)

	SWEP.ACOGV2Pos = Vector(-1.992, -2.129, 0.143)
	SWEP.ACOGV2Ang = Vector(-0.211, -0.033, 0)

	SWEP.SprintPos = Vector(0.55, 2.276, -1.002)
	SWEP.SprintAng = Vector(-7.265, 24.724, -18.144)

	SWEP.CustomizePos = Vector(1.71, -0.742, -1.8)
	SWEP.CustomizeAng = Vector(12.157, 21.783, 0)

	SWEP.BackupSights = {["md_acogv2"] = {[1] = Vector(-1.99, -2.129, -0.819), [2] = Vector(0.25, 0.035, 0)}}

    SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.SightWithRail = false
	SWEP.ACOGV2AxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AlternativePos = Vector(0.2, 1.641, -0.08)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.015

	SWEP.AttachmentModelsVM = {
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Honey_Body", pos = Vector(0.25, 1.228, 36.812), angle = Angle(3, -90.004, 0), size = Vector(0.896, 0.896, 0.896)},		
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Honey_Body", pos = Vector(0.014, 12.557, 47.007), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Masada", pos = Vector(0.05, 1.707, -1.482), angle = Angle(0, 0, 0), size = Vector(0.758, 0.758, 0.758)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "honey_body", pos = Vector(-0.44, -7.298, -2.293), angle = Angle(0, 0, 0), size = Vector(0.851, 0.851, 0.685)},
		["md_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint.mdl", bone = "Honey_Body", pos = Vector(0, 11.296, 46.847), angle = Angle(0, -89.998, 0), size = Vector(0.903, 0.903, 0.903)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Honey_Body", pos = Vector(-0.095, 16.586, 46.805), angle = Angle(0, 89.998, 0), size = Vector(0.519, 0.519, 0.519)},
		["md_mbus_rearsight"] = {model = "models/weapons/upgrades/z_carryhandle.mdl", bone = "Honey_Body", pos = Vector(2.355, 0.958, 48.097), angle = Angle(0, -89.998, 0), size = Vector(1, 1, 1)},
		["md_mbus_frontsight"] = {model = "models/weapons/upgrades/y_carryhandle.mdl", bone = "Honey_Body",pos = Vector(2.362, 0.18, 48.047), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},		
		["md_acogv2"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Honey_Body", pos = Vector(-0.285, 5.988, 42.113), angle = Angle(0, 0, 0), size = Vector(0.837, 0.837, 0.837)},
		--["md_acogv2"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Masada", pos = Vector(-0.313, -5.095, -3.146), angle = Angle(0, -0.017, -0.04), size = Vector(0.93, 0.93, 0.93)},
	}

	SWEP.ForeGripHoldPos = {
	["Bip01 L Finger3"] = { scale = Vector(1.003, 1.003, 1.003), pos = Vector(0, 0, 0), angle = Angle(-19.573, 34.021, 24.534) },
	["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.515, -21.798, 1.478) },
	["Bip01 L Finger2"] = { scale = Vector(0.996, 0.996, 0.996), pos = Vector(0, 0, -0.003), angle = Angle(-13.195, 51.571, 25.062) },
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-4.143, -0.525, -2.641), angle = Angle(0.651, 2.545, 0.374) },
	["Bip01 L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -21.951, 0) },
	["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.381, -10.226, 0) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(9.826, -0.949, -0.26) },
	["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6.369, 40.115, 13.479) },
	["Bip01 L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-31.942, 21.694, 4.426) },
	["Bip01 L Finger1"] = { scale = Vector(1.001, 1.001, 1.001), pos = Vector(0.002, 0.002, 0), angle = Angle(-5.207, 58.52, 28.386) },
	["Bip01 L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 1.139, 1.059) },
	["Bip01 L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 77.722, 0) },
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5.591, 14.732, 39.087) },
	["Bip01 L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 52.763, 6.721) },
	["Bip01 L Finger0"] = { scale = Vector(1.003, 1.003, 1.003), pos = Vector(0, 0, 0), angle = Angle(-16.063, -16.747, -34.154) },
	["Bip01 L Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.606, 25.819, 13.758) },
	["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0.217, 7.441, 11.361) },
	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0.002, -3.648, -2.478) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-2.702, 7.258, 6.697) },
	["Bip01 L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 51.498) }
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(-0.6, -1, 0)
	SWEP.LaserAngAdjust = Angle(-0.25, 180, 0) 
end

SWEP.BoltBone = "Honey_Bolt"
SWEP.BoltShootOffset = Vector(-3, 0, 0)
SWEP.HoldBoltWhileEmpty = true
SWEP.DontHoldWhenReloading = true

function SWEP:RenderTargetFunc()

if self.AttachmentModelsVM.md_rail then
	self.AttachmentModelsVM.md_rail.active = false
end
	
	if self.AimPos != self.IronsightPos then -- if we have a sight/scope equiped, hide the front and rar sights
	self.AttachmentModelsVM.md_mbus_frontsight.active = false
	self.AttachmentModelsVM.md_mbus_rearsight.active = false
	else
	self.AttachmentModelsVM.md_mbus_frontsight.active = true
	self.AttachmentModelsVM.md_mbus_rearsight.active = true
	end

end

SWEP.SightBGs = {main = 2, none = 1}

SWEP.LuaViewmodelRecoil = false

--[1] = {header = "Sight", offset = {600, -100},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acogv2"}}, --"md_acog"
--[2] = {header = "Barrel", offset = {-300, -200},  atts = {"md_saker"}},
--[3] = {header = "UnderBarrel", offset = {-100, 300},  atts = {"md_foregrip"}},

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, 100},  atts = {"md_microt1", "md_eotech", "md_acogv2"}},
[2] = {header = "Rail", offset = {-100, -200},  atts = {"md_anpeq15"}},
["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
	SWEP.Sounds = {draw = {{time = 0, sound = "CW_BER_HONEY_BADGER_DRAW"}},
	
	reload = {{time = 0.3, sound = "CW_BER_HONEY_BADGER_MAGOUT"},
	{time = 1.9, sound = "CW_BER_HONEY_BADGER_MAGIN"}},
	
	reload_empty = {{time = 0.3, sound = "CW_BER_HONEY_BADGER_MAGOUT"},
	{time = 1.9, sound = "CW_BER_HONEY_BADGER_MAGIN"},
	{time = 2.6, sound = "CW_BER_HONEY_BADGER_BOLTPULL"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "BER_CW 2.0"

--SWEP.IronSightsPos = Vector(-2.007, -0.987, 0.165)
--SWEP.IronSightsAng = Vector(-0.318, 0.079, 0)

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_dber_badg.mdl"
SWEP.WorldModel		= "models/weapons/w_dber_badg.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".300 AAC Blackout"

SWEP.FireDelay = 0.074
SWEP.FireSound = "CW_BER_HONEY_BADGER_FIRE"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.18
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 3.1
SWEP.ReloadHalt_Empty = 3.4

SWEP.SnapToIdlePostReload = false

end