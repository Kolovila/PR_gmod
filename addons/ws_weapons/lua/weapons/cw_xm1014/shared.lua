AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "XM1014"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.Add("cw_xm1014", "vgui/kills/cw_xm1014", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_xm1014")
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = 45, z = -1}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.3
	
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true
		
	SWEP.IronsightPos = Vector(1.567, 0, 0.899)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.MicroT1Pos = Vector(1.575, 0, 0.639)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(1.559, 0, 0.54)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(1.565, 0, 0.6)
	SWEP.AimpointAng = Vector(0, 0, 0)
			
	SWEP.ACOGPos = Vector(1.58, 0, 0.519)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.CoD4ACOGPos = Vector(1.58, 0, 0.519)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(1.57, 0, 0.579)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(1.57, 0, 0.8)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.EoTech552Pos = Vector(1.56, 0, 0.56)
	SWEP.EoTech552Ang = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(1.565, 0, 0.68)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.HoloPos = Vector(1.57, 0, 0.314)
	SWEP.HoloAng = Vector(0, 0, 0)
	
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 180, forward = 0}
	
	SWEP.SprintPos = Vector(-0.281, -1, -2.08)
	SWEP.SprintAng = Vector(4.925, -36.584, 13.366)

	SWEP.CustomizePos = Vector(-2.04, -0.805, -1.28)
	SWEP.CustomizeAng = Vector(11.96, -26.734, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(1.585, 0, 0.019), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "frame", rel = "", pos = Vector(-1.9, -1.88, -0.25), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "frame", rel = "", pos = Vector(-1.9, -1.88, -0.25), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "frame", rel = "", pos = Vector(-1.8, -0.53, -0.25), angle = Angle(-180, 0, 90), size = Vector(0.46, 0.46, 0.46)},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "frame", rel = "", pos = Vector(1.7, 0.4, -0.24), angle = Angle(0, 0, 90), size = Vector(0.6, 0.6, 0.6)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "frame", rel = "", pos = Vector(-1.8, -0.45, -0.24), angle = Angle(0, 180, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "frame", rel = "", pos = Vector(-1.701, -0.45, -0.25), angle = Angle(-180, 0, 90), size = Vector(0.4, 0.4, 0.4)},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "frame", rel = "", pos = Vector(-2.401, -0.801, -0.25), angle = Angle(0, 180, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "frame", rel = "", pos = Vector(0, 0.949, -0.24), angle = Angle(-90, -90, 0), size = Vector(0.2, 0.2, 0.2)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "frame", rel = "", pos = Vector(2, 0.699, -0.271), angle = Angle(-180, 0, 90), size = Vector(0.25, 0.25, 0.25)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "frame", rel = "", pos = Vector(-3, -1.961, -0.37), angle = Angle(90, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "frame", rel = "", pos = Vector(-5.5, -4.5, -0.101), angle = Angle(0, 0, 90), size = Vector(0.5, 0.5, 0.5)},
		//["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "frame", rel = "", pos = Vector(-2.5, -1.4, -0.41), angle = Angle(90, 90, 0), size = Vector(0.4, 0.4, 0.4)},
	}
	
	SWEP.CompM4SBoneMod = {}
	
	SWEP.LuaViewmodelRecoil = true
	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 

end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = false

if CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {
	[1] = {header = "Sight", offset = {200, -300}, atts = {"md_cod4_reflex","md_microt1","md_eotech","md_cod4_eotech_v2", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_cod4_acog_v2","md_fas2_holo"}},
	[2] = {header = "Rail", offset = {-350, 300}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {-350, -100}, atts = {"am_slugrounds", "am_flechetterounds"}},
	}
else
	SWEP.Attachments = {
	[1] = {header = "Sight", offset = {200, -300}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Rail", offset = {-350, 300}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {-350, -100}, atts = {"am_slugrounds", "am_flechetterounds"}},
	}
end


SWEP.Animations = {
	//fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_WSXM1014_INSERT"}},
	
	after_reload = {{time = 0.1, sound = "CW_WSXM1014_PUMP"},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"}},
	
	}//draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
	//{time = 0.55, sound = "CW_WSXM1014_PUMP"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.AimViewModelFOV = 50
SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/sexm1014/v_porn_xm1014.mdl"
SWEP.WorldModel		= "models/weapons/sexm1014/w_porn_xm1014.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/sexm1014/w_porn_xm1014.mdl"
SWEP.WMPos = Vector(-1, 5, 0)
SWEP.WMAng = Vector(0, 0, 180)
SWEP.CustomizationMenuScale = 0.01

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.25
SWEP.FireSound = "CW_WSXM1014_FIRE"
SWEP.Recoil = 3

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.013
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 10
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.5
SWEP.ReloadFinishWait = 1
SWEP.ShotgunReload = true

SWEP.Chamberable = false