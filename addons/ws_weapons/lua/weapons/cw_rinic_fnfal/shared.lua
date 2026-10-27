AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "L1A1 (FAL-NeeChan)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 2, z = 2}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_fal_l1a1.mdl"
	SWEP.WMPos = Vector(-0.5, -0.5, 0.5)
	SWEP.WMAng = Vector(-1, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.974, -2.631, 0.584)
	SWEP.IronsightAng = Vector(0.246, 0.064, 0)
	
	SWEP.EoTechPos = Vector(-1.991, -3.919, -0.076)
	SWEP.EoTechAng = Vector(1.468, 0, 0)

	SWEP.LeupoldPos = Vector(-2.26, -2.769, -0.094)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.010, -4.188, 0.264)

	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.013, -2.876, 0.224)

	SWEP.MicroT1Ang = Vector(-0.08, 0.003, 0)

	SWEP.M203Pos = Vector(1.368, -1.481, 0)
	SWEP.M203Ang = Vector(11.897, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-1.992, -2.876, 0.308)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-1.989, -3.135, 0.119)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.929, 0, 0.833)
	SWEP.SprintAng = Vector(-20.518, 24.666, -9.66)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.221, -4.617, -1.234), [2] = Vector(0, -0.008, 0)}}

	SWEP.SightWithRail = false
	SWEP.CSGOACOGAxisAlign = {right = -0.1, up = -0.1, forward = -40}
	SWEP.M98BAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.LeupoldAxisAlign = {right = 1, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Arm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203HoldPos = {
		["Bip01 L Arm"] = { scale = Vector(1, 1, 1), pos = Vector(4.034, 0.331, -2.458), angle = Angle(0, 0, 0)}
	}
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/atts/m14railmount.mdl", bone = "M14_Body", rel = "", pos = Vector(-0.138, 0.05, 0.579), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(-0.208, -6.729, -3.677), angle = Angle(0, 0, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.305, -12.327, -9.584), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.032, -5.054, -1.512), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "M14_Body", rel = "", pos = Vector(-0.033, -1.782, 2.628), angle = Angle(0, -90, 0), size = Vector(1.7, 1.7, 1.7)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "M14_Body", rel = "", pos = Vector(-0.033, -1.782, 2.628), angle = Angle(0, -90, 0), size = Vector(1.7, 1.7, 1.7)},
		["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "M14_Body", rel = "", pos = Vector(0, 10.876, -0.82), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.026, -1.729, 1.332), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.061, 25.545, -1.145), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "M14_Body", pos = Vector(-0.173, 6.684, 1.22), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.076, -7.407, -2.458), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(2.377, -7.051, 2.167), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {-450, -300},  atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "NubTubz", offset = {100, 100},  atts = {"md_m203"}},
	["+attack2"] = {header = "Perks", offset = {100, -300}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {-450, 100}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.4, sound = "CW_FAL_CHAN_BUTTON"}},

	reload = {[1] = {time = 0.35, sound = "CW_FAL_CHAN_MAGOUT"},
	[2] = {time = 1.58, sound = "CW_FAL_CHAN_MAGIN"},
	[3] = {time = 2.17, sound = "CW_FAL_CHAN_BOLTBACK"},
	[4] = {time = 2.35, sound = "CW_FAL_CHAN_BOLTFORWARD"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi", "auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_fal_l1a1.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_fal_l1a1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.096
SWEP.FireSound = "CW_FAL_CHAN_FIRE"
SWEP.FireSoundSuppressed = "CW_FAL_CHAN_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1

SWEP.HipSpread = 0.175
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.9
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt = 2.1
SWEP.ReloadHalt_Empty = 2.7

SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
	if self.FireMode == "auto" then
		self.FireDelay = 0.15
	else 
		self.FireDelay = 0.096
	end
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end

function SWEP:CycleFiremodes()
	t = self.FireModes
	
	if not t.last then
		t.last = 2
	else
		if not t[t.last + 1] then
			t.last = 1
		else
			t.last = t.last + 1
		end
	end
	
	if self.dt.State == CW_AIMING or self:isBipodDeployed() then
		if self.FireModes[t.last] == "safe" then
			t.last = 1
		end
	end
	
	if self.FireMode != self.FireModes[t.last] and self.FireModes[t.last] then
		CT = CurTime()
		self:SelectFiremode(self.FireModes[t.last])
		self:SetNextPrimaryFire(CT + 0.25)
		self:SetNextSecondaryFire(CT + 0.25)
		self.ReloadWait = CT + 0.25
	end
	
	if self.FireMode == "auto" then
		self.FireDelay = 0.15
	else 
		self.FireDelay = 0.096
	end
end