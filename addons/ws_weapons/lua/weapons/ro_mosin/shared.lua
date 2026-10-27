AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1891/30 Mosin Nagant"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.Add( "ro_mosin", "icons/killicons/khr_mosin", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("icons/killicons/khr_mosin")
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_ro2_mosin.mdl"
	SWEP.WMPos = Vector(-1, 5, 0)
	SWEP.WMAng = Vector(-13, 0, 180)
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = false
	SWEP.NoDistance = true
	SWEP.SnapToIdlePostReload = false
	SWEP.CrosshairEnabled = true
	SWEP.FOVPerShot = 0.25
	SWEP.ShellScale = 0.28
	SWEP.ShellDelay = .75
	SWEP.NoShells = false
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 6, y = -.25, z = .5}
	SWEP.FireMoveMod = 0.6
	SWEP.CustomizationMenuScale = 0.03
	
	SWEP.IronsightPos = Vector(-3.661, 0, 2.299)
	SWEP.IronsightAng = Vector(0, -0.101, 0)

	SWEP.SprintPos = Vector(3.2, 0, 1.799)
	SWEP.SprintAng = Vector(-17.701, 28.1, 0)
	
	SWEP.AlternativePos = Vector(-0.5, 0, -0.25)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.AttachmentModelsVM = {
	["md_rail"] = { type = "Model", model = "models/khrcw2/attachments/a_modkit_mosin.mdl", bone = "Weapon", rel = "", pos = Vector(0, 4.199, 0.518), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_khr_ins2ws_acog"] = { type = "Model", model = "models/khrcw2/attachments/khr_ins2_cstm_acog.mdl", bone = "Weapon", rel = "", pos = Vector(0, 0.555, 2.198), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_ins2_suppressor_ins"] = { type = "Model", model = "models/weapons/upgrades/a_suppressor_ins.mdl", bone = "Weapon", rel = "", pos = Vector(0, 26.899, 0.8), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1, roll = 1, forward = 0, pitch = 1}
end

SWEP.MuzzleVelocity = 865 -- in meter/s

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {-150, 425}, atts = {"am_magnum","am_matchgrade"}}}

SWEP.Animations = {fire = "awm_fire",
	reload = "awm_reload",
	idle = "awm_idle",
	draw = "awm_draw"}
	
SWEP.Sounds = {	awm_fire = {
		{time = 15/30, sound = "MOSIN_BOLT1"},
		{time = 19/30, sound = "MOSIN_BOLT2"},
		{time = 28/30, sound = "MOSIN_BOLT3"},
		{time = 35/30, sound = "MOSIN_BOLT4"}},

		awm_draw = {{time = 10/30, sound = "MOSIN_DRAW"}},
	
		awm_reload = {
		{time = 15/30, sound = "MOSIN_BOLT1"},
		{time = 19/30, sound = "MOSIN_BOLT2"},
		{time = 1.7, sound = "MOSIN_CLIPIN"},
		{time = 2.8, sound = "MOSIN_BULLETIN"},
		{time = 3.4, sound = "MOSIN_CLIPOUT"},
		{time = 28/30, sound = "MOSIN_BOLT3"},
		{time = 35/30, sound = "MOSIN_BOLT4"}}}

SWEP.SpeedDec = 50

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW2"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= "Defend the Motherland to the death"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel			= "models/weapons/v_snip_mwp.mdl"
SWEP.WorldModel			= "models/weapons/w_ro2_mosin.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ADSFireAnim = true
SWEP.Chamberable = false
SWEP.LuaViewmodelRecoil = false

SWEP.OverallMouseSens = .8
SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x54MMR"
SWEP.FireDelay = 60/35
SWEP.FireSound = "MOSIN_FIRE"
SWEP.Recoil = 2.5

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.0022
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.5
SWEP.SpreadPerShot = 0.025
SWEP.SpreadCooldown = 1.75
SWEP.Shots = 1
SWEP.Damage = 90
SWEP.DeployTime = .6

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.6
SWEP.ReloadHalt = 4.3
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadHalt_Empty = 4.3

SWEP.ShotgunReload = false