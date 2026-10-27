AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("12-GAUGE", "	12-GAUGE", 12, 5)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1897 Trench Gun"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	 killicon.Add("zz_shg31", "vgui/hud/zz_shg31", Color(255, 0, 255, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -25, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/zz_shg31")
	
	SWEP.EffectiveRange_Orig = 65 * 42
	SWEP.DamageFallOff_Orig = .45
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_zz_shg31_tp.mdl"
	SWEP.WMPos = Vector(-0.5, 9.5, -4.15)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
    SWEP.IronsightPos = Vector(-2.899, -1.162, 1.24)
    SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.21, -4.686, 0.239)
	SWEP.EoTechAng = Vector(0, 0, -0.217)
	
	SWEP.AimpointPos = Vector(-2.194, -4.686, 0.338)
	SWEP.AimpointAng = Vector(-1.951, 0, -0.217)
	
	SWEP.MicroT1Pos = Vector(-2.208, 1, 0.83)
	SWEP.MicroT1Ang = Vector(-1.938, 0, -0.217)
	
	SWEP.ACOGPos = Vector(-2.211, -4, 0.146)
	SWEP.ACOGAng = Vector(-1.4, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2.049, 0.564, 0.268)
    SWEP.SprintAng = Vector(-24.623, 31.658, -18.996)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
    SWEP.CustomizePos = Vector(2.44, -1.005, -1.331)
	SWEP.CustomizeAng = Vector(21.106, 19.672, 7.738)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
		SWEP.AttachmentModelsVM = {
		["ma85_wf_shared_red_dot"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_red_dot.mdl", bone = "main", pos = Vector(-2.214, -1.596, 0.101), angle = Angle(90, -88.709, 0), size = Vector(0.25, 0.25, 0.25)},
		["zz_shg31_bn"] = {model = "models/zz_atts/v_zz_shg31_bn.mdl", bone = "main", pos = Vector(-9.185, 0.214, 2.473), angle = Angle(-2.192, 1.845, -40.027), size = Vector(1.026, 1.026, 1.026)},
		["ma85_wf_shared_holo"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_reflex.mdl", bone = "main", pos = Vector(-2.559, -1.596, 0.017), angle = Angle(90, -88.947, 0), size = Vector(0.17, 0.17, 0.17)}
	}
	
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.MuzzleBGs = {main = 2, sil = 1, normal = 0, off = 0}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.DisableSprintViewSimulation = true
SWEP.AimViewModelFOV = 72


SWEP.Attachments = {[1] = {header = "Muzzle", offset = {-550, -50}, atts = {"zz_shg31_bn"}},
["+reload"] = {header = "Ammo", offset = {250, 200}, atts = {"am_slugrounds", "am_flechetterounds"}}}
--[2] = {header = "Camo", offset = {180, 500}, atts = {"zz_mg24_gold"}}}

	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	shoot1 = {{time = 0.37, sound = "ZZ_SHG31_PUMPACTION"}},
	shoot2 = {{time = 0.37, sound = "ZZ_SHG31_PUMPACTION"}},
	shoot3 = {{time = 0.37, sound = "ZZ_SHG31_PUMPACTION"}},
	insert = {{time = 0.18, sound = "ZZ_SHG31_INSERT"}},
    after_reload = {{time = 0, sound = "CW_FOLEY_LIGHT"}},
	idle = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	
}	

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW1"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= "Clear the trenches of those dirty Huns"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_zz_shg31.mdl"
SWEP.WorldModel		= "models/weapons/w_zz_shg31_tp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 32
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12-GAUGE"
SWEP.ShotgunReload          = true

SWEP.ReloadStartTime        = 0.5
SWEP.InsertShellTime        = 0.75
SWEP.ReloadFinishWait       = 1.1

SWEP.Chamberable = false

SWEP.FireDelay = .76
SWEP.FireSound = "DOIM37_FIRE"
SWEP.Recoil = 3

SWEP.HipSpread = 0.120
SWEP.AimSpread = 0.080
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.10
SWEP.ClumpSpread = 0.060
SWEP.SpreadPerShot = 0.010
SWEP.SpreadCooldown = 0.95
SWEP.Shots = 12
SWEP.Damage = 17
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.65
SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = false	

-- PR: у автора было «function» без имени — ошибка Lua, ствол не грузился. По смыслу это расчёт
-- дальности CW (cw_base: SWEP:CalculateEffectiveRange); базовый расчёт вызываем первым
function SWEP:CalculateEffectiveRange()
	weapons.GetStored("cw_base").CalculateEffectiveRange(self)
	local atts = self.ActiveAttachments or {}

	self.EffectiveRange = 65 * 42
	self.DamageFallOff = .45

	if (atts.am_slugrounds) then
	self.EffectiveRange = ((self.EffectiveRange + 65 * 42))
	self.DamageFallOff = ((self.DamageFallOff - .05))
end
	if (atts.am_flechetterounds) then
	self.EffectiveRange = ((self.EffectiveRange + 60 * 42))
	self.DamageFallOff = ((self.DamageFallOff - .1))
	self.ClumpSpread = 0.015
end

end

