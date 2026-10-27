AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "S&W M500"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.55
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw_sw_m500_kry")	
	local icol = Color( 255, 255, 255, 255 ) 
	killicon.Add(  "cw_sw_m500_kry",	"vgui/hud/kryceks_sw_m500_kill", icol  )
	SWEP.MuzzleEffect = "muzzleflash_pistol_rbull"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.Shell = "mainshell"
	SWEP.ShellScale = 0.0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -1}
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.NoDistance = true
	
	SWEP.IronsightPos = Vector(-2.645, 2, 1)
	SWEP.IronsightAng = Vector(0, 0, 0)	

	SWEP.EFTMICROT1Pos = Vector(-2.645, 0, 0.3)
	SWEP.EFTMICROT1Ang = Vector(0, 0, 0)	
	
	
	SWEP.SprintPos = Vector(-2, 1.01, 1)  --跑步晃动角度
	SWEP.SprintAng = Vector(-24, 5, -20)

	SWEP.CustomizePos = Vector(3, -5, -1)
	SWEP.CustomizeAng = Vector(15, 25, 3)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, -5)	
	
	SWEP.ShortDotPos =  Vector(-2.65, -4, -0.31)
	SWEP.ShortDotAng = Vector(0, 0, 0)	

		
	SWEP.ForegripOverridePos = {
		["kry_sw_m500_likeaboss"] = {["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-90.037, -4.261, 0) }}
	}
	SWEP.AttachmentModelsVM = {
		["md_eft_si_t1"] = { type = "Model", model = "models/weapons/cw_eft/upgrades/scopes/compact/t1/v_t1.mdl", bone = "sw500-gun", rel = "", pos = Vector(0, 0.8, 1.57), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},

	
	
		["md_schmidt"] = { type = "Model", model = "models/cw2/attachments/schmidt.mdl", bone = "sw500-gun", rel = "", pos = Vector(0.4, 7, -4.55), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_eft_sil_osprey9"] = { type = "Model", model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", bone = "sw500-gun", rel = "", pos = Vector(0, -6.3, 1.02), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1)},

	}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0,  0, 0) 
	
	SWEP.SightWithRail = true
	SWEP.CustomizationMenuScale = 0.01
end

SWEP.SchmidtShortDotAxisAlign = {right = 5, up = 0.3, forward = -4}
SWEP.MuzzleVelocity = 400 -- in meter/s

    SWEP.LuaVMRecoilAxisMod = {vert =  0.1, hor = 1, roll = 5, forward = 0.5,  pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = true 



SWEP.BarrelBGs = {main = 1, m500 = 1, regular = 0, none = 1}


SWEP.Attachments = {
[1] = {header = "Top rail", offset = {1000, -200}, atts = {"md_eft_si_t1", "md_schmidt" }}, 
[2] = {header = "s", offset = {-300, -300}, atts = { "md_eft_sil_osprey9" }}, 
--[3] = {header = "Laser", offset = {-300, -100}, atts = { "kry_pistol_small_laser" }, dependencies = {kry_45deg_rail = true}}, 
--["+use"] = {header = "Side mount", offset = {650, -300}, atts = { "kry_45deg_rail" }}, 
["+reload"] = {header = "Ammo", offset = {1000, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
    fire = {"shoot1"},
    fire_dry = "shoot_empty",
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle1",
	draw = "draw"
	}
	
SWEP.Sounds = {draw = {{time = 0, sound = "KRY_SW500_DEPLOY"}},

	reload = { [1] = {time = 0, sound = "KRY_SW500_RELOAD"}},
	
	reload_empty = { [1] = {time = 0, sound = "KRY_SW500_RELOAD_E"}}

}

SWEP.SpeedDec = 15

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW-Goodgun"

SWEP.Author			= "Krycek, Soldier11"
SWEP.Contact		= "thekrych@gmail.com"
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.PreventQuickScoping = true
SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/krycek/v_sw_m500_cw.mdl"
SWEP.WorldModel		= "models/weapons/krycek/w_sw_m500.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 55
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.AimBreathingEnabled = true
SWEP.AimBreathingIntensity = 2
SWEP.ViewbobIntensity = 2

SWEP.FireDelay = 0.25
SWEP.FireSound = "KRY_SW500_FIRE"
SWEP.FireSoundSuppressed = "KRY_SW500_SFIRE"
SWEP.Recoil = 3

SWEP.HipSpread = 0.08
SWEP.AimSpread = -0.1
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.3
SWEP.SpreadPerShot = 0.4
SWEP.SpreadCooldown = 0.07
SWEP.Shots = 1
SWEP.Damage = 100
SWEP.DeployTime = 1
SWEP.Chamberable = false

SWEP.ReloadSpeed = 1.05
SWEP.ReloadTime = 3.5
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 3.5
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true