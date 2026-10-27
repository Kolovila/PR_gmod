AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

	SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HCAR"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.1
	
	SWEP.IconLetter = "w"
	killicon.Add( "khr_hcar", "icons/killicons/khr_hcar", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("icons/killicons/khr_hcar")
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.35
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .9
	SWEP.ForeGripOffsetCycle_Reload_Empty = .9
	SWEP.FireMoveMod = 2
	SWEP.CustomizationMenuScale = 0.017
	
	SWEP.EffectiveRange_Orig = 284.25 * 39.37
	SWEP.DamageFallOff_Orig = .25
	
	SWEP.IronsightPos = Vector(-2.040, -2.927, 0.240)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
    SWEP.EoTech553Pos = Vector(-2.070, -2.927, 0.32)
	SWEP.EoTech553Ang = Vector(0, 0, 0)	
	
	SWEP.CSGOACOGPos = Vector(-2.0412, -1.25, 0.29)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.KR_CMOREPos =  Vector(-2.02, -2.927, 0.32)
	SWEP.KR_CMOREAng =  Vector(0, 0, 0)	
	
	SWEP.ShortDotPos = Vector(-2.7076, -4, 0.512)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-2.00, -2.927, 0.530)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.119, -5, -2.081)
	SWEP.CustomizeAng = Vector(20.402, 26.03, 15.477)
	
	SWEP.SprintPos = Vector(1.786, -5, -1)
	SWEP.SprintAng = Vector(-20.778, 27.573, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)

	SWEP.SightWithRail = false
	SWEP.ADSFireAnim = false
	
	SWEP.AlternativePos = Vector(-.619, -2, -.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.AttachmentModelsVM = {
	
			["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.01, -7.15, -2.05), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.03, 0.43, 0.55), angle = Angle(0, -90, 0), size = Vector(0.82, 0.82, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["md_bipod"] = { type = "Model", model = "models/wystan/attachments/bipod.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0.3, 9.5, -1.39), angle = Angle(0, 0, 0), size = Vector(0.65, 0.65, 0.65), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["odec3d_cmore_kry"] = { type = "Model", model = "models/weapons/krycek/sights/odec3d_cmore_reddot.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(-0.07, -1.17, 1.21), angle = Angle(0, -90, 0), size = Vector(0.22, 0.22, 0.22), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(-0.04, 0.99, 0.69), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["md_saker222"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "DSAFAL_Body", rel = "", pos = Vector(0, 3.6, -1.73), angle = Angle(0, 0, 0), size = Vector(0.65, 0.65, 0.65), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.ForeGripHoldPos = {
["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.719, -3.593, -3.952), angle = Angle(-25.868, 21.557, -10.778) },
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15.09, 17.246, 28.024) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 28.024, -12.934) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 97.006, 0) },
	["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 64.671, 0) },
	["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 34.491, 0) },
	["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 60.359, 0) },
	["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 56.048, 0) },
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 12.934, 12.934) }
	}

	
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 1, up = 90, forward = 0}
 
	SWEP.LuaVMRecoilAxisMod = {vert = .25, hor = 1, roll = .25, forward = 0, pitch = .5}
end

SWEP.BodyBGs = {main = 1, off = 0, on = 1}
SWEP.MagBGs = {main = 2, off = 0, on = 1}



SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
SWEP.LaserPosAdjust = Vector(0.1, 0, 0)--{x = 1, y = 0, z = 0}
SWEP.LaserAngAdjust = Angle(0, 180, 0) --{p = 2, y = 180, r = 0}

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {900, -250},  atts = {"odec3d_cmore_kry", "md_fas2_eotech", "md_fas2_aimpoint", "md_uecw_csgo_acog"}},
	[2] = {header = "Barrel", offset = {400, -600}, atts = {"md_muzl", "md_saker222"}},
	[5] = {header = "Bolt", offset = {350, -100}, atts = {"md_lightbolt"}},
	[3] = {header = "Handguard", offset = {-700, -150}, atts = {"md_bipod"}},
	[4] = {header = "Magazine", offset = {-650, 250}, atts = {"bg_3006extmag"}},
	["+reload"] = {header = "Ammo", offset = {1000, 150}, atts = {"am_magnum_khr", "am_matchgrade_khr"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload_nonempty",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "HCar.Rattle1"}},

	
	reload = {[1] = {time = 0, sound = "HCar.Rattle1"},
	[2] = {time = 0.4, sound = "KHRFAL.Magout"},
	[3] = {time = 1.35, sound = "KHRFAL.Magin"},
	[4] = {time = 2, sound = "KHRFAL.Boltback"},
	[5] = {time = 2.2, sound = "KHRFAL.Boltrelease"}},
	
	reload_nonempty = {[1] = {time = 0, sound = "HCar.Rattle1"},
	[2] = {time = 0.4, sound = "KHRFAL.Magout"},
	[3] = {time = 1.35, sound = "KHRFAL.Magin"}}}
	
SWEP.SpeedDec = 43

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.FireMoveMod = 0.5
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - Khris"
SWEP.SubCategory = "Assault rifles"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.OverallMouseSens = .95
SWEP.ViewModelFOV	= 80
SWEP.AimViewModelFOV = 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/v_khr_hcar.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_g3sg1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true


SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".30-06"

SWEP.FireDelay = 60/500
SWEP.FireSound = "CW_HCAR_FIRE"
SWEP.FireSoundSuppressed = "CW_HCAR_FIRE_SUPPRESSED"
SWEP.Recoil = 1.8
SWEP.FOVPerShot = .8



SWEP.HipSpread = 0.092
SWEP.AimSpread = 0.0028
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 55
SWEP.DeployTime = .8
SWEP.RecoilToSpread = .3

SWEP.ReloadSpeed = .9
SWEP.ReloadTime = 2.2
SWEP.ReloadHalt = 1.6
SWEP.ReloadTime_Empty = 1.6
SWEP.ReloadHalt_Empty = 3.2
SWEP.SnapToIdlePostReload = false
SWEP.NearWallEnabled = false
SWEP.ReloadViewBobEnabled = false
SWEP.LoseAimVelocity = 10


function SWEP:IndividualThink()
	self.EffectiveRange = 284.25 * 39.37
	self.DamageFallOff = .25
	self.RecoilToSpread = .3
	
	if self.ActiveAttachments.odec3d_cmore_kry or self.ActiveAttachments.md_fas2_eotech or self.ActiveAttachments.md_fas2_aimpoint or self.ActiveAttachments.md_uecw_csgo_acog then
	self:setBodygroup(self.BodyBGs.main, self.BodyBGs.on)
	else
	self:setBodygroup(self.BodyBGs.main, self.BodyBGs.off)
	end
	
	if self.ActiveAttachments.bg_3006extmag then
	self:setBodygroup(self.MagBGs.main, self.MagBGs.on)
	else
	self:setBodygroup(self.MagBGs.main, self.MagBGs.off)
	end
	
	if self.ActiveAttachments.md_saker222 then
	self.EffectiveRange = ((self.EffectiveRange - 85.27 * 39.37))
	end
	if self.ActiveAttachments.md_lightbolt then
	self.RecoilToSpread = ((self.RecoilToSpread + .15))
	end
	if self.ActiveAttachments.am_matchgrade_khr then
	self.EffectiveRange = ((self.EffectiveRange + 42.69 * 39.37))
	self.DamageFallOff = ((self.DamageFallOff - .0375))
	end
end

