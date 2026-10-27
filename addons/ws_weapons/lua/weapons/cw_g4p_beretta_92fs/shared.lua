if CustomizableWeaponry and CustomizableWeaponry_G4P_UECW then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Beretta 92-FS"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = 1}
	
	SWEP.CustomizePos = Vector(8, -8, -5)
	SWEP.CustomizeAng = Vector(46, 41, 25)

	SWEP.MicroT1Pos = Vector(-2.115, -2.8, 0.04)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.08, -2.8, 0.13)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.DocterPos = Vector(-3.971, -4.2, 0.319)
	SWEP.DocterAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-3.981, -4.2, 0.579)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-0.801, -12.5, -8.5)
	SWEP.SprintAng = Vector(70, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = false
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 15 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "Gun", rel = "", pos = Vector(2.46, 0.079, 0), angle = Angle(180, 0, 90), size = Vector(0.25, 0.25, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_docter"] = { type = "Model", model = "models/wystan/attachments/2octorrds.mdl", bone = "Slide", rel = "", pos = Vector(-0.861, -0.341, 0.159), angle = Angle(-90, 0, -90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_tundra9mm"] = { type = "Model", model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "Gun", rel = "", pos = Vector(7, -1.78, 0), angle = Angle(-90, -90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_silencer_pistol"] = { type = "Model", model = "models/kali/weapons/csgo/eq_suppressor_pistol.mdl", bone = "Gun", rel = "", pos = Vector(-5.5, 4.75, -0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_taclight"] = { type = "Model", model = "models/kali/weapons/csgo/eq_taclight_pistol.mdl", bone = "Gun", rel = "", pos = Vector(-4.801, 4.46, -0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = false
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(-1.35, 0, 0)
	
	SWEP.LaserPosAdjust = Vector(-0.5, 0, 0)--{x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = Angle(0, 180, 0) --{p = 2, y = 180, r = 0}
	
function SWEP:RenderTargetFunc()

--	if self.dt.State == CW_CUSTOMIZE then
--	self.CW_VM:ManipulateBonePosition(self.CW_VM:LookupBone("l-upperarm"), Vector(1, 1, 1), Vector(30,0,0))
--	else
--	self.CW_VM:ManipulateBonePosition(self.CW_VM:LookupBone("l-upperarm"), Vector(1, 1, 1), Vector(0,0,0))
--	end

end

end

SWEP.BarrelBGs = {main = 1, regular = 0, compensator = 1, extended = 2}
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = false
SWEP.DryFire = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {400, -350}, atts = {"md_docter"}},
[2] = {header = "Barrel extension", offset = {-600, -350}, atts = {"md_tundra9mm", "md_csgo_silencer_pistol"}},
[3] = {header = "Rail", offset = {-200, 200}, atts = {"md_anpeq15", "md_csgo_taclight"}},
["+reload"] = {header = "Ammo", offset = {-800, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	fire_dry = "shoot_empty",
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {reload = {{time = 0.05, sound = "CW_G4P_B92FS_FOLEY"},
	{time = 0.35, sound = "CW_G4P_B92FS_MAGOUT"},
	{time = 1.45, sound = "CW_G4P_B92FS_MAGIN"},
	{time = 1.6, sound = "CW_G4P_B92FS_MAGLOCK"},
	{time = 2.1, sound = "CW_G4P_B92FS_SLIDEBACK"},
	{time = 2.4, sound = "CW_G4P_B92FS_SLIDERELEASE"}},
	draw = {{time = 0.35, sound = "CW_G4P_B92FS_SLIDEBACK"},
	{time = 0.65, sound = "CW_G4P_B92FS_SLIDERELEASE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 - UECW EP2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_g4p_92_fs.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_glock18.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 17
SWEP.Primary.DefaultClip	= 17
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 60/352
SWEP.FireSound = "CW_G4P_B92FS_FIRE"
SWEP.FireSoundSuppressed = "CW_G4P_B92FS_FIRE_SUPPRESSED"
SWEP.Recoil = 0.75

SWEP.HipSpread = 0.020
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.32
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3.2
SWEP.ReloadHalt = 3.5
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt_Empty = 3.5
SWEP.SnapToIdlePostReload = true

end