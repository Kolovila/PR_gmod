AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "S&W M29"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/mr96")
	killicon.Add("cw_mr96", "weaponicons/mr96", Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.NoShells = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_m29.mdl"
	SWEP.WMPos = Vector(0, 0.1, -0.5)
	SWEP.WMAng = Vector(-3, 0, 180)
		
	SWEP.IronsightPos = Vector(2.599, 8.01, 0.159)
	SWEP.IronsightAng = Vector(-0.727, -0.064, 0)

	SWEP.DocterPos = Vector(2.45, 0.912, 0.319)
	SWEP.DocterAng = Vector(-0.362, -0.19, 0)

	SWEP.CSGOACOGPos = Vector(2.453, -6.132, -0.366)
	SWEP.CSGOACOGAng = Vector(-0.362, -0.19, 0)
	
	SWEP.CustomizePos = Vector(-2.971, -1.915, -1.15)
    SWEP.CustomizeAng = Vector(6.765, -19.035, -4.837)

	SWEP.SprintPos = Vector(0, 0, 0.409)
	SWEP.SprintAng = Vector(-20.538, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.281, 1.325, -0.52)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}

	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = true
	SWEP.HUD_MagText = "CYLINDER: "

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.DisableSprintViewSimulation = true
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_docter"] = {model = "models/wystan/attachments/2octorrds.mdl", bone = "gun", rel = "", pos = Vector(3.476, -12.745, -1.423), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "gun", rel = "", pos = Vector(3.206, -9.884, -3.323), angle = Angle(0, 179.089, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "gun", rel = "", pos = Vector(3.224, -9.566, -4.969), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)}
	}
end

SWEP.BarrelBGs = {main = 1, regular = 0, m29_medium = 1, m29_short = 2}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Barrel Types", offset = {-400, -75}, atts = {"bg_m29_medium", "bg_m29_short"}},
	["+attack2"] = {header = "Perks", offset = {400, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {500, -75}, atts = {"am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.57, sound = "CW_AZURZAS_M29_CYLINDERCLOSE"}},

	reload = {[1] = {time = 0.2, sound = "CW_AZURZAS_M29_CYLINDEROPEN"},
	[2] = {time = 0.4, sound = "CW_AZURZAS_M29_ROUNDSOUT"},
	[3] = {time = 1.23, sound = "CW_AZURZAS_M29_ROUNDSIN"},
	[4] = {time = 1.58, sound = "CW_AZURZAS_M29_CYLINDERCLOSE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_m29.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_m29.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".44 Magnum"

SWEP.FireDelay = 60/520
SWEP.FireSound = "CW_AZURZAS_M29_FIRE"
SWEP.Recoil = 1.2

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 70
SWEP.DeployTime = 0.6
SWEP.Chamberable = false

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.81
SWEP.ReloadHalt = 2

SWEP.ReloadTime_Empty = 1.81
SWEP.ReloadHalt_Empty = 2