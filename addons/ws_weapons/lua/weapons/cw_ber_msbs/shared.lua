if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MSBS"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_ber_msbs", "weaponicons/msbs-k", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/select/msbs-h")
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_dber_msbs.mdl"
	SWEP.WMPos = Vector(0, -0.5, 0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.4
	SWEP.ShellOffsetMul = 6
	SWEP.ShellPosOffset = {x = 1, y = -6, z = -1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = .8
	SWEP.FireMoveMod = 0.5
	
    SWEP.IronsightPos = Vector(-1.783, 0, 0.162)
	SWEP.IronsightAng = Vector(0.067, 0.03, -0.726)

	SWEP.MicroT1Pos = Vector(-1.778, -2.513, 0.136)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-1.76, -3.639, -0.019)
	SWEP.EoTechAng = Vector(-0.156, 0, 0)

	--SWEP.AimpointPos = Vector(-2.02, -0.385, -0.03)
	--SWEP.AimpointAng = Vector(0, 0, -0.124)
	
	--SWEP.LeupoldPos = Vector(-2.014, 0, -0.083)
	--SWEP.LeupoldAng = Vector(0, 0, 0.133)
	
    SWEP.FAS2AimpointPos = Vector(-1.662, 0, 0.134)
	SWEP.FAS2AimpointAng = Vector(0, -0.076, -1.129)
	
	SWEP.ACOGV2Pos = Vector(-1.77, -3.077, -0.09)
	SWEP.ACOGV2Ang = Vector(-1.3, 0, 0)

	SWEP.SprintPos = Vector(1.442, 0.453, -1.3)
	SWEP.SprintAng = Vector(-5.974, 22.746, -14.455)

	SWEP.CustomizePos = Vector(2.859, -0.755, -2.102)
	SWEP.CustomizeAng = Vector(10.189, 30.711, 0)
	
	SWEP.BackupSights = {["md_acogv2"] = {[1] = Vector(-1.774, -3.392, -1.28), [2] = Vector(0.8, 0, -0.746)}}

	SWEP.SightWithRail = false
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ACOGV2AxisAlign = {right = 0, up = -0.1, forward = 0}

	SWEP.AlternativePos = Vector(0.039, 0, -0.16)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.M203OffsetCycle_Reload = 0.7
	SWEP.M203OffsetCycle_Reload_Empty = 0.7
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}	

	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203Pos = Vector(-0.01, -1.558, -0.26)
	SWEP.M203Ang = Vector(5.224, 0, 3.176)
	
	SWEP.M203HoldPos = {
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.015, 0.112, -1.931), angle = Angle(0, 0, 0) }
	}

	SWEP.CustomizationMenuScale = 0.017
	
	SWEP.AttachmentModelsVM = {	
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "MSBS_Body", pos = Vector(1.87, 10.246, 1.006), angle = Angle(0, 0, 180), size = Vector(0.391, 0.391, 0.391)},
		["md_foregrip"] = {model = "models/weapons/upgrades/f_foregrip_sec.mdl", bone = "MSBS_Body", pos = Vector(1.906, 15.67, 3.719), angle = Angle(0, 90, 180), size = Vector(0.421, 0.421, 0.421)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "CZ805_Body", pos = Vector(-4.824, 0.218, -3.8), angle = Angle(0.108, 90.115, 0), size = Vector(0.902, 0.902, 0.902)},
		["md_acogv2"] = {model = "models/wystan/attachments/2cog.mdl", bone = "MSBS_Body", pos = Vector(2.209, 5.8, 6.3), angle = Angle(0, 180, 180), size = Vector(0.9, 0.9, 0.9)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "MSBS_Body", pos = Vector(1.63, 0.716, 11.307), angle = Angle(-3, -90, 180), size = Vector(0.901, 0.901, 0.901)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "MSBS_Body", pos = Vector(2.055, 16.134, 1.3), angle = Angle(0, 90, 180), size = Vector(0.55, 0.55, 0.55)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "M4_Body", pos = Vector(0.141, 6.7, -1.902), angle = Angle(0, -180, 0), size = Vector(0.665, 0.665, 0.665)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "MSBS_Body", pos = Vector(1.888, 11.17, 0.287), angle = Angle(0, 0, 0), size = Vector(0.802, 0.802, 0.802)},
}		
		
		SWEP.ForeGripHoldPos = {
	["Bip01 L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(18.898, 20.285, 48.143) },
	["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 48.73, 0) },
	["Bip01 L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20.093, 38.222, 36.31) },
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-0.073, 2.256, -1.632), angle = Angle(0, 0.507, 0) },
	["Bip01 L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.247, 51.68, 17.024) },
	["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 31.576, 0) },
	["Bip01 L ForeTwist1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 9.175) },
	["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0.837, 72.816, 18.42) },
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(2.572, 16.181, 40.699) },
	["Bip01 L Finger4"] = { scale = Vector(1.001, 1.001, 1.001), pos = Vector(0, 0, 0), angle = Angle(35.999, -3.01, 54.143) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 37.317, 0) },
	["Bip01 L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(22.441, 30.207, 18.363) },
	["Bip01 L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 53.685, -3.8) },
	["Bip01 L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 48.754, 0) },
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.55, 4.995, -7.224) },
	["Bip01 L Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0.736, -16.782, -7.481) },
	["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0.904, 24.072, 0) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5.073, 17.52, 27.415) },
	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(-2.31, 0, 0), angle = Angle(0, 0, 0) }
	}	
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector( -0.5, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 

    SWEP.SightBGs = {main = 2, none = 1}
    SWEP.LuaViewmodelRecoil = false
end

--    {header = "Sight", offset = {600, -200},  atts = {"md_microt1", "md_eotech", "md_fas2_aimpoint", "md_acog"}}, --"md_fas2_leupold"
	        --{header = "Barrel", offset = {-200, -300},  atts = {"md_saker"}},
	        --{header = "Rail", offset = {800, 150},  atts = {"md_anpeq15"}},
	        --{header = "Handguard", offset = {0, 350}, atts = {"md_m203", "md_foregrip"}},

	    SWEP.Attachments = {{header = "Sight", offset = {600, -200},  atts = {"md_microt1", "md_eotech", "md_acogv2"}}, --"md_fas2_leupold"
		{header = "Barrel", offset = {-200, -200},  atts = {"md_saker"}},
		{header = "Rail", offset = {300, 200},  atts = {"md_anpeq15"}},
		{header = "Handguard", offset = {-300, 250}, atts = {"md_foregrip"}},
	    ["+reload"] = {header = "Ammo", offset = {1100, 300}, atts = {"am_magnum", "am_matchgrade"}},
	    }
	
SWEP.BoltBone = "MSBS_Bolt"
SWEP.BoltShootOffset = Vector(-3.6, 0, 0)
SWEP.HoldBoltWhileEmpty = false
SWEP.DontHoldWhenReloading = true	
	
SWEP.Animations = {fire = {"Shoot1", "Shoot2", "Shoot3"},
	reload = "Reload_Full",
	reload_empty = "Reload",
	idle = "Idle",
	draw = "Draw"}

SWEP.Sounds = {Draw = {{time = 0, sound = "CW_BER_MSBS_DRAW"}},

	Reload_Full = {{time = 0, sound = "CW_BER_MSBS_MAGOUT"},
	{time = 1.4, sound = "CW_BER_MSBS_MAGIN"},
	{time = 1.8, sound = "CW_BER_MSBS_SLAP"}},	
	
	Reload = {{time = 0, sound = "CW_BER_MSBS_MAGOUT"},
	{time = 1.4, sound = "CW_BER_MSBS_MAGIN"},
	{time = 1.8, sound = "CW_BER_MSBS_SLAP"},
	{time = 2.2, sound = "CW_BER_MSBS_BOLTPULL"}}}

	
SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "BER_CW 2.0"

SWEP.Author			= "BER_"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.085
SWEP.FireSound = "CW_BER_MSBS_FIRE"
SWEP.FireSoundSuppressed = "CW_BER_MSBS_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.03
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.009
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.9

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.7
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadHalt = 2.7
SWEP.ReloadHalt_Empty = 3.3

SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_dber_msbs.mdl"
SWEP.WorldModel = "models/weapons/w_dber_msbs.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.SnapToIdlePostReload = true


end