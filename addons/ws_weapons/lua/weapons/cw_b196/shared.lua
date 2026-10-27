if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x51MM", "7.62x51MM", 8.58, 69.20)

local USE_OLD_WELEMENTS = true

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "L96"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "r"

	SWEP.SimpleTelescopicsFOV = 75
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.4
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.7
	SWEP.ShellPosOffset = {x = 2, y = -2, z = 0}
	SWEP.FireMoveMod = 0.6
	--SWEP.OverrideAimMouseSens = 0.2
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_cstm_l96.mdl"
	SWEP.WMPos = Vector(-1, 0, 1.75)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.932, 0, 0.735)
	SWEP.IronsightAng = Vector(1.05, 0.015, 0)
	
	SWEP.BallisticPos = Vector(-2.9755, -1.5, 0.649)
	SWEP.BallisticAng = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(-2.95, -1.2, 0.912)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
	SWEP.CSGO556Pos = Vector(-2.979, -2.5, 1.095)
	SWEP.CSGO556Ang = Vector(0, 0, 0)
	
--	SWEP.LeupoldPos = Vector(-2.9755, 0.0, 0.649)
--	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.965, -2.65, 0.718)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(-2.948, -2.65, 0.768)
	SWEP.ELCANAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.97, 0.0, 0.8)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.935, -0.5, 1.075)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CmorePos = Vector(-2.925, -0.5, 0.948)
	SWEP.CmoreAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
	
	SWEP.AlternativePos = Vector(-1, -1, 0.6)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = false
	SWEP.AimViewModelFOV = 40
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.RTAlign = {right = 1.2, up = 0.25, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CSGO556AxisAlign = {right = 0, up = 0, forward = 0}
	--SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	--SWEP.OverallMouseSens = 0.7
end

SWEP.MuzzleVelocity = 850 -- in meter/s
SWEP.CustomizationMenuScale = 0.015
SWEP.SightBGs = {main = 1, none = 2}
SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = false
SWEP.QuickScopeSpreadIncrease = 0.2
SWEP.ForceBackToHipAfterAimedShot = true
SWEP.GlobalDelayOnShoot = 1.5
SWEP.BipodFireAnim = true

SWEP.AttachmentModelsVM = {
		["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "receiver", rel = "", pos = Vector(-1.571, -3.05, -8.6), angle = Angle(90, -90, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_acog_fixed"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "receiver", rel = "", pos = Vector(-0.32, 2.109, -4.676), angle = Angle(0, 0, -90), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
--		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "receiver", rel = "", pos = Vector(-0.04, -3.475, -0.8), angle = Angle(90, -90, 0), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
--		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "receiver", rel = "", pos = Vector(-0.03, -3.5, -0.75), angle = Angle(90, -90, 0), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "receiver", rel = "", pos = Vector(-0.26, 2.599, -5.401), angle = Angle(0, 0, -90), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "receiver", rel = "", pos = Vector(-2.776, -1.749, 5.137), angle = Angle(0, -90, -90), size = Vector(0.935, 0.935, 0.935), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "receiver", rel = "", pos = Vector(0.005, -2.563, 0.518), angle = Angle(180, 0, -90), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_bipod"] = { type = "Model", model = "models/wystan/attachments/bipod.mdl", bone = "receiver", rel = "", pos = Vector(0.083, 0.209, 9.418), angle = Angle(0, 0, -90), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "receiver", rel = "", pos = Vector(-0.102, -2.37, 4.0), angle = Angle(-90, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "receiver", rel = "", pos = Vector(0.005, -2.416, 0.395), angle = Angle(0, 0, -90), size = Vector(0.652, 0.652, 0.652), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "receiver", rel = "", pos = Vector(0.028, -2.25, 0.535), angle = Angle(90, -90, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "receiver", rel = "", pos = Vector(0.004, -2.234, 0.356), angle = Angle(90, -90, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_sight_front"] = { type = "Model", model = "models/bunneh/frontsight.mdl", bone = "receiver", rel = "", pos = Vector(-2.658, -3.179, 10.612), angle = Angle(90, -90, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_sight_rear"] = { type = "Model", model = "models/bunneh/rearsight.mdl", bone = "receiver", rel = "", pos = Vector(-2.245, -3.602, -6.601), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_silencer_ballistic"] = { type = "Model", model = "models/kali/weapons/csgo/eq_dsr50_suppressor.mdl", bone = "receiver", rel = "", pos = Vector(0.075, -1.667, 4.925), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_silencer_rifle"] = { type = "Model", model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "receiver", rel = "", pos = Vector(-0.003, -0.825, 23.649), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "receiver", rel = "", pos = Vector(-0.28, 1.845, -3.967), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0)

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {1500, 300}, atts = {"am_magnum", "am_matchgrade"}},
	[1] = {header = "Sight", offset = {600, -500},  atts = { "md_cmore" , "md_microt1" , "md_aimpoint" , "md_elcan" , "md_acog_fixed" , "md_csgo_556" , "md_uecw_csgo_scope_ssg" , "md_ballistic"}},
	[2] = {header = "Barrel Extension", offset = {-500, -550}, atts = { "md_saker" , "md_csgo_silencer_ballistic" , "md_csgo_silencer_rifle" }},
	[3] = {header = "Handguard", offset = {-650, 0}, atts = {"md_bipod"}},
	[4] = {header = "Rail", offset = {-650, 500}, atts = {"md_anpeq15"}},
	[5] = {header = "Paint", offset = {075, 800}, atts = {"bg_bl96_paint1" , "bg_bl96_paint2" , "bg_bl96_paint3" , "bg_bl96_paint4" , "bg_bl96_paint5" , "bg_bl96_paint6" , "bg_bl96_paint7" , "bg_bl96_paint8" , "bg_bl96_paint9" , "bg_bl96_paint10" , "bg_bl96_paint11" , "bg_bl96_paint12" }}}

function SWEP:RenderTargetFunc()	

	if self.AimPos != self.IronsightPos then
		self.AttachmentModelsVM.md_sight_front.active = false
		self.AttachmentModelsVM.md_sight_rear.active = false
	else
		self.AttachmentModelsVM.md_sight_front.active = true
		self.AttachmentModelsVM.md_sight_rear.active = true
	end

end

function SWEP:WElementThink()
	if self.ActiveAttachments.bg_bl96_paint1 then
		self.WElements["wm"].skin = 1
	elseif self.ActiveAttachments.bg_bl96_paint2 then
		self.WElements["wm"].skin = 2
	elseif self.ActiveAttachments.bg_bl96_paint3 then
		self.WElements["wm"].skin = 3
	elseif self.ActiveAttachments.bg_bl96_paint4 then
		self.WElements["wm"].skin = 4
	elseif self.ActiveAttachments.bg_bl96_paint5 then
		self.WElements["wm"].skin = 5
	elseif self.ActiveAttachments.bg_bl96_paint6 then
		self.WElements["wm"].skin = 6
	elseif self.ActiveAttachments.bg_bl96_paint7 then
		self.WElements["wm"].skin = 7
	elseif self.ActiveAttachments.bg_bl96_paint8 then
		self.WElements["wm"].skin = 8
	elseif self.ActiveAttachments.bg_bl96_paint9 then
		self.WElements["wm"].skin = 9
	elseif self.ActiveAttachments.bg_bl96_paint10 then
		self.WElements["wm"].skin = 10
	elseif self.ActiveAttachments.bg_bl96_paint11 then
		self.WElements["wm"].skin = 11
	elseif self.ActiveAttachments.bg_bl96_paint12 then
		self.WElements["wm"].skin = 12
	else
		self.WElements["wm"].skin = 0
	end
end
	
SWEP.Animations = {fire = {"shoot1","shoot2","shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {shoot1 = {{time = 0.4, sound = "bl96_boltup"},
		{time = 0.6, sound = "bl96_boltpull"},
		{time = 0.8, sound = "bl96_boltpush"},
		{time = 1.1, sound = "bl96_boltdown"}},
	
	shoot2 = {{time = 0.4, sound = "bl96_boltup"},
		{time = 0.6, sound = "bl96_boltpull"},
		{time = 0.8, sound = "bl96_boltpush"},
		{time = 1.1, sound = "bl96_boltdown"}},
	shoot3 = {{time = 0.4, sound = "bl96_boltup"},
		{time = 0.6, sound = "bl96_boltpull"},
		{time = 0.8, sound = "bl96_boltpush"},
		{time = 1.1, sound = "bl96_boltdown"}},

	draw = {{time = 0, sound = "bl96_cloth1"},
		{time = 0.1, sound = "bl96_boltpush"},
		{time = 0.45, sound = "bl96_boltdown"}},

	reload = {{time = 0.0, sound = "CW_FOLEY_MEDIUM"},
		{time = 0.75, sound = "bl96_magout1"},
		{time = 1.25, sound = "CW_FOLEY_LIGHT"},
		{time = 1.8, sound = "bl96_magtap"},
		{time = 2.25, sound = "bl96_magin1"},
		{time = 2.45, sound = "bl96_magin2"},
		{time = 2.55, sound = "CW_FOLEY_MEDIUM"},
		{time = 3.2, sound = "bl96_boltup"},
		{time = 3.5, sound = "bl96_boltpull"},
		{time = 3.8, sound = "bl96_boltpush"},
		{time = 4.15, sound = "bl96_boltdown"},
		{time = 4.5, sound = "bl96_cloth2"}}
}

SWEP.SpeedDec = 50

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Boler"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 80
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_snip_bl96.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_bl96.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 1.5
SWEP.FireSound = "bl96_shoot"
SWEP.FireSoundSuppressed = "bl96_shoot_sil"
SWEP.Recoil = 2.5

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 1.55
SWEP.Shots = 1
SWEP.Damage = 95
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.9
SWEP.ReloadTime_Empty = 4.3
SWEP.ReloadHalt = 2.9
SWEP.ReloadHalt_Empty = 4.3
SWEP.SnapToIdlePostReload = true

end