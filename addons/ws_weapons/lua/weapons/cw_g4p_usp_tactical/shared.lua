if CustomizableWeaponry and CustomizableWeaponry_G4P_UECW then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "USP Tactical"
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
	
	SWEP.DocterPos = Vector(-2.1, -2.401, 0.579)
	SWEP.DocterAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.09, -4.2, 0.86)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.247, -6.5, -0.602)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.2, -8.2, -5.2)
	SWEP.SprintAng = Vector(55, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.88, 1.325, -0.561)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -4.728, -1.568), [2] = Vector(0, 0, 0)}}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = false
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.BoltBonePositionRecoverySpeed = 15 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.AttachmentModelsVM = {
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.201, -6.901, 1.85), angle = Angle(180, 90, 0), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_docter"] = { type = "Model", model = "models/wystan/attachments/2octorrds.mdl", bone = "bolt", rel = "", pos = Vector(0.18, 4.719, 0.4), angle = Angle(0, 180, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_tundra9mm"] = { type = "Model", model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.201, -10.62, 1.75), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_silencer_pistol"] = { type = "Model", model = "models/kali/weapons/csgo/eq_suppressor_pistol.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.201, 1.679, -3), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_taclight"] = { type = "Model", model = "models/kali/weapons/csgo/eq_taclight_pistol.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.201, 0.2, -2.661), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(0, -1.5, 0)
	
	SWEP.LaserPosAdjust = Vector(-0.5, 0, 0)--{x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = Angle(0, 180, 0) --{p = 2, y = 180, r = 0}
	
function SWEP:RenderTargetFunc()
	
	if !self.SkinSilencerInstalled then -- if we dont have skin silencer, hide it
	self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone("wpn_silencer"), Vector(0.009, 0.009, 0.009))
	else
	self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone("wpn_silencer"), Vector(1, 1, 1))
	end
	
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
SWEP.DryFire = false
SWEP.CustomizationMenuScale = 0.1

SWEP.Attachments = {[1] = {header = "Sight", offset = {400, -350}, atts = {"md_docter"}},
[2] = {header = "Barrel extension", offset = {-600, -350}, atts = {"md_tundra9mm", "md_csgo_silencer_pistol", "uecw_skin_silencer"}},
[3] = {header = "Rail", offset = {-300, 200}, atts = {"md_anpeq15", "md_csgo_taclight"}},
["+reload"] = {header = "Ammo", offset = {-800, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	fire_dry = "shoot2",
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {reload = {{time = 0.3, sound = "CW_G4P_TACUSP_MAGOUT"},
	{time = 1.3, sound = "CW_G4P_TACUSP_MAGIN"},
	{time = 2.3, sound = "CW_G4P_TACUSP_SLIDERELEASE"}},
	draw = {{time = 0.1, sound = "CW_G4P_TACUSP_DRAW"}}}

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
SWEP.ViewModel		= "models/weapons/v_g4p_tcusp.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_glock18.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 17
SWEP.Primary.DefaultClip	= 17
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 60/352
SWEP.FireSound = "CW_G4P_TACUSP_FIRE"
SWEP.FireSoundSuppressed = "CW_G4P_TACUSP_FIRE_SUPPRESSED"
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

-- interaction menu, AKA weapon interaction menu
function SWEP:drawInteractionMenu()
	FT = FrameTime()
	
	if self.dt.State == CW_CUSTOMIZE then
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 1, FT * 5)
	else
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 0, FT * 15)
	end
	
	if self.CustomizeMenuAlpha > 0 then
		--local model = self.AttachmentModelsVM.md_bf3_knife_acb90.ent
		--local att = model:GetPos()
		local EA = self.Owner:EyeAngles() + self.Owner:GetPunchAngle()
		local pos = EyePos() + EA:Forward() * 140
		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Right(), 0)
		
		cam.Start3D2D(pos, ang, self.CustomizationMenuScale)
			-- disable depth checks
			
			cam.IgnoreZ(true)
				CustomizableWeaponry.interactionMenu.draw(self)
			cam.IgnoreZ(false)
		cam.End3D2D()
	end
end

end