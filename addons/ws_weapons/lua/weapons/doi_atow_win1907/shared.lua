if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")
		
		SWEP.magType = "arMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1907 Carbine"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/1907")
	killicon.Add( "doi_atow_win1907", "vgui/inventory/killicons/1907kill", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_ak47"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 105 * 39.37
	SWEP.DamageFallOff_Orig = .46
	
	SWEP.Shell = "khr30carbine"
	SWEP.ShellScale = .65
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3, y = -3, z = .5}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.IronsightPos = Vector(-2.887, -3, 1.2955)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AltIronPos = Vector(-2.4768, -3, 1.1628)
	SWEP.AltIronAng = Vector(0.2625, 0.0213, 0)
	
	SWEP.LymanPos = Vector(-1.4022, -3.5, 1.1298)
	SWEP.LymanAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, -1)
	SWEP.SprintAng = Vector(-15.478, 20.96, -15)

	SWEP.AlternativePos = Vector(-0.7, 1, -0.5)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.47, -7.5, -.025)
	SWEP.KobraAng = Vector(0, 0, 0)

	SWEP.AimpointPos = Vector(-2.4643, -8, -0.08)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.Aimpoint2xPos = Vector(-2.4643, -8, -0.08)
	SWEP.Aimpoint2xAng = Vector(0, 0, 0)

	SWEP.M40Pos = Vector(-2.4804, -7, -0.138)
	SWEP.M40Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.4643, -7.5, -.23)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-2.471, -7, -0.35)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.PO424Pos = Vector(-2.415, -8, 0.112)
	SWEP.PO424Ang = Vector(0, 0, 0)

	SWEP.ElcanPos = Vector(-2.47, -7, -0.35)
	SWEP.ElcanAng = Vector(0, 0, 0)

	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-50.8947, 35.0455, -25.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.CustomizePos = Vector(8, -2, .5)
	SWEP.CustomizeAng = Vector(10, 40, 18)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.CustomizationMenuScale = 0.02 --  0.024
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_lymanm82"] = {model = "models/khrcw2/doipack/attachments/garandscope.mdl", pos = Vector(-0.5, 0.18, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/m3a1suppressor.mdl", pos = Vector(2.02, 2.45, 4.25), angle = Angle(0, -90, 0), size = Vector(0.9, 0.9, 0.9), bone = "Weapon"},
	["md_ins2wsacog"] = {model = "models/khrcw2/ins2pack/attachments/ins2wsacog.mdl", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(0.835, 0.835, 0.835), bone = "A_Optic", adjustment = {axis = "x", min = 6.4, max = 10, inverse = true, inverseOffsetCalc = false}, material = ""},
	["md_ins2aimpoint"] = {model = "models/khrcw2/ins2pack/attachments/ins2aimpoint.mdl", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(0.85, 0.85, 0.85), bone = "A_Optic", adjustment = {axis = "x", min = 5.85, max = 11, inverse = true, inverseOffsetCalc = false}, material = ""},
	["md_ins2aimpoint2x"] = {model = "models/khrcw2/ins2pack/attachments/ins2aimpoint2x.mdl", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(0.85, 0.85, 0.85), bone = "A_Optic", adjustment = {axis = "x", min = 6.45, max = 10.25, inverse = true, inverseOffsetCalc = false}, material = ""},
	["md_rail"] = {model = "models/khrcw2/ins2pack/attachments/rails/rail2.mdl", pos = Vector(12.75, 1.025, 0), angle = Angle(0, 0, -90), size = Vector(1.575, 1.25, 1.25), bone = "A_Optic", material = ""},
	["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", pos = Vector(-0.4, -9.55, -1.7628), angle = Angle(0, 0, 0), size = Vector(0.7, 0.7, 0.7), bone = "Weapon", material = ""},
	["md_ins2eotech552"] = {model = "models/khrcw2/ins2pack/attachments/ins2eotech552.mdl", bone = "A_Optic", rel = "", pos = Vector(7.75, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), adjustment = {axis = "x", min = 6.85, max = 9.5, inverse = true, inverseOffsetCalc = false}, surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_ins2kobra"] = {model = "models/khrcw2/ins2pack/attachments/ins2kobra.mdl", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic", adjustment = {axis = "x", min = 6, max = 10.5, inverse = true, inverseOffsetCalc = false}, material = ""},
	["md_ins2elcan"] = {model = "models/khrcw2/ins2pack/attachments/ins2elcan.mdl", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(0.835, 0.835, 0.835), bone = "A_Optic", adjustment = {axis = "x", min = 6.8, max = 9.9, inverse = true, inverseOffsetCalc = false}, material = ""},
	["md_ins2po424p"] = {model = "models/khrcw2/ins2pack/attachments/ins2po424p.mdl", bone = "A_Optic", rel = "", pos = Vector(8, -0.45, 0), angle = Angle(0, 0, -90), size = Vector(0.78, 0.78, 0.78), color = Color(255, 255, 255, 255), adjustment = {axis = "x", min = 6.45, max = 10.8, inverse = true, inverseOffsetCalc = false}, surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_ins2m40tac"] = {model = "models/khrcw2/ins2pack/attachments/ins2m40tac.mdl", bone = "A_Optic", rel = "", pos = Vector(8, -0.4, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), adjustment = {axis = "x", min = 6.75, max = 10, inverse = true, inverseOffsetCalc = false}, surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
		SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, .3), angle = Angle(0, 0, 15) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(5, 2, -5) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -3, -5) },
	["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 6, 0) }}
}
	
	SWEP.M82AxisAlign = {right = 0, up = -.02, forward = 0}
	SWEP.INS2AxisAlign = {right = 0, up = -.04, forward = 0}
	SWEP.PO42PAxisAlign = {right = .075, up = -.03, forward = 0}
	SWEP.AP2XAxisAlign = {right = .075, up = -.055, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = .15, roll = .25, forward = 0, pitch = .1}
end
end

SWEP.MuzzleVelocity = 570

SWEP.LuaViewmodelRecoil = true
SWEP.FullAimViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = true
SWEP.ADSFireAnim = false

SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true

SWEP.MagBGs = {main = 1, five = 0, fifteen = 1}

	SWEP.Attachments = {--[2] = {header = "Optic", offset = {550, -350}, atts = {"doi_atow_lymanm82"}},
	[1] = {header = "Magazine", offset = {975, -100}, atts = {"doi_atow_win190715"}},
	--["+walk"] = {header = "quit peeping", offset = {0, 2000}, atts = {"doi_atow_unisuppressor"}},
	["+reload"] = {header = "Ammo", offset = {-250, 150}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire","base_fire2"},
	fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}

SWEP.SpeedDec = 35
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = .75
}

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Carbines"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 75
SWEP.AimViewModelFOV = 63
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/win1907.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_m1carbine.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_m1carbine.mdl"
SWEP.WMPos = Vector(-1.25, 4.5, .25)
SWEP.WMAng = Vector(-8, 3, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= ".351 WSL"
end


SWEP.FireDelay = 60/550
SWEP.FireSound = "DOI1907_FIRE"
SWEP.FireSoundSuppressed = "DOIM1A1CAR_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1
SWEP.HorizontalRecoilMod = .65
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .9,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2,
[HITGROUP_RIGHTARM] = 2,
[HITGROUP_RIGHTLEG] = 2,
[HITGROUP_LEFTLEG] = 2}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.0055
SWEP.VelocitySensitivity = .5
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.012
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = .525
SWEP.HolsterTime = .5

SWEP.ADSFireAnim = false
SWEP.RecoilToSpread = 0
SWEP.RecoilToSpreadAuto = .25
SWEP.RecoilToSpreadSemi = 0

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.8
SWEP.ReloadHalt = 2.5
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt_Empty = 3.9

function SWEP:IndividualThink()
	
	self.EffectiveRange = 105 * 39.37
	self.DamageFallOff = .46
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .12))
end
	if self.ActiveAttachments.am_atow_riot then
	self.EffectiveRange = ((self.EffectiveRange - 60 * 39.37))
end
	
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange - 12 * 39.37))
	self.DamageFallOff = ((self.DamageFallOff + .15))
end
end



local simpleTextColor = Color(255, 210, 0, 255)
local mod = 25

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	if self.SelectIcon then
		surface.SetTexture(self.SelectIcon)
		
		wide = wide - mod
		
		x = x + (mod / 2)
		y = y + (mod / 4) + (wide / 8)
		
		surface.SetDrawColor(255, 255, 255, alpha)
		
		surface.DrawTexturedRect(x, y, wide, (wide / 2))
	else
		simpleTextColor.a = alpha
		draw.SimpleText(self.IconLetter, self.SelectFont, x + wide / 2, y + tall * 0.2, simpleTextColor, TEXT_ALIGN_CENTER)
	end
end

