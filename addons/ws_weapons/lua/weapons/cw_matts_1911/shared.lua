AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
		SWEP.DrawCrosshair = false
		SWEP.PrintName = "Matts 1911"
		SWEP.CSMuzzleFlashes = false
		SWEP.ViewModelMovementScale = 1
		
		SWEP.CrosshairParts = {left = true, right = true, upper = true, lower = true}
		SWEP.IconLetter = "f"
		killicon.AddFont( "cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color( 255, 0, 0, 255 ) )
		
		SWEP.MuzzleEffect = "muzzleflash_6"
		SWEP.PosBasedMuz = false
		
		SWEP.IronsightPos = Vector(-2, 0, 0.268)
		SWEP.IronsightAng = Vector(0.91, 0, 0)
		
		SWEP.SprintPos = Vector(2.813, -9.046, -6.031)
		SWEP.SprintAng = Vector(70, 0, 0)
		
		SWEP.CustomizePos = Vector(8.241, -4.422, -1.81)
		SWEP.CustomizeAng = Vector(24.622, 40.101, 7.738)
		
		SWEP.DocterPos = Vector(-2, 0, 0.16)
		SWEP.DocterAng = Vector(0, 0, 0)
		
		SWEP.LaserPosAdjust = Vector(0, 0, 0)
		SWEP.LaserAngAdjust = Angle(0, 0, 0)
		
		SWEP.AttachmentModelsVM = {
				["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(3, -0.7, 0), angle = Angle(180, 180, 270), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0},
				["md_docter"] = { type = "Model", model = "models/wystan/attachments/2octorrds.mdl", bone = "slide", rel = "", pos = Vector(-3, 0.02, 0.17), angle = Angle(270, 0, 270), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0},
				["uecw_skin_silencer"] = { type = "Model", model = "models/cw2/attachments/cobra_m2.mdl", bone = "muzzle", rel = "", pos = Vector(2.1, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0}
		}
		
		SWEP.HoldBoltWhileEmpty = true
		SWEP.BoltBone = "slide"
		SWEP.BoltBonePositionRecoverySpeed = 20
		SWEP.BoltShootOffset = Vector(0, 0, 0)
		
end


SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true


SWEP.Attachments = {[1] = {header = "Sight", offset = {450, -350}, atts = {"md_docter"}},
[2] = {header = "Barrel", offset = {-600, -350}, atts = {"uecw_skin_silencer"}},
[3] = {header = "Under-barrel", offset = {-500, 250}, atts = {"md_anpeq15"}},
["+reload"] = {header = "Ammo", offset = {250, 400}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = { fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {reload = {[1] = {time = 0.4, sound = "CW_MATTS1911_MAGOUT"},
	[2] = {time = 0.9, sound = "CW_MATTS1911_MAGIN"},
	[2] = {time = 1.2, sound = "CW_MATTS1911_MAGHIT"},
	[3] = {time = 1.6, sound = "CW_MATTS1911_SLIDEBACK"},
	[4] = {time = 1.8, sound = "CW_MATTS1911_SLIDEPULL"}},
	draw = {{time = 0.01, sound = "CW_MATTS1911_CLOTH"}}}

-- all these ^^ sounds are just re-named versions of Dzembi's M1911 sounds, i am not trying to claim ownership of these sounds, however, the coding is all mine

SWEP.SpeedDec = 0

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.AddSafeMode = true
SWEP.Category = "CW 2.0"
SWEP.Base = "cw_base"
SWEP.Author	= "MATT"
SWEP.Contact = "matthewmarshall130@gmail.com"
SWEP.Purpose = ""
SWEP.Instructions = "C to customise, M1 to shoot, M2 to aim, and R to Reload"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.DrawTraditionalWorldModel = true
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

--WEAPON SETTINGS--
SWEP.Primary.ClipSize = 7
SWEP.Primary.DefaultClip = 49
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ".45 ACP"
SWEP.FireDelay = 0.1
SWEP.magType = "pistolMag"
SWEP.FireSound = "CW_MATTS1911_FIRE"
SWEP.FireSoundSuppressed = "CW_MATTS1911_SUPPRESSED"
SWEP.Recoil = 0.82
SWEP.HipSpread = 0.018
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.3
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.32
SWEP.Shots = 1
SWEP.Damage = 44
SWEP.DeployTime = 1
SWEP.Chamberable = true
SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.4
SWEP.ReloadHalt = 1.5
SWEP.ReloadTime_Empty = 2.1
SWEP.ReloadHalt_Empty = 2.2
SWEP.SnapToIdlePostReload = true