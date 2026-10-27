if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		--SWEP.magType = "NONE"
		
		CustomizableWeaponry.firemodes:registerFiremode("singleaction", "DOUBLE-ACTION/SINGLE-ACTION", false, 0, 3)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M29"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.HUD_MagText = "CYLINDER: "
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_sw29")
	killicon.Add( "doi_atow_sw29", "vgui/inventory/killicons/weapon_sw29", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 95 * 39.37
	SWEP.DamageFallOff_Orig = .45
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	SWEP.ForeGripOffsetCycle_ReloadStart = 0
	SWEP.ForeGripOffsetCycle_ReloadInsert = 0
	SWEP.ForeGripOffsetCycle_ReloadEnd = 0
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = .425
	SWEP.NoShells = true
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["A_Muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(180, 0, 0) }},
}

	SWEP.IronsightPos = Vector(-2.74, -1, .86)
	SWEP.IronsightAng = Vector(-1, 0.02, 4.4)
	
	SWEP.AltIronPos = Vector(-2.74, -1, .84)
	SWEP.AltIronAng = Vector(-.88, 0.02, 4.4)
	
	SWEP.Alt2IronPos = Vector(-2.75, -1, 1.01)
	SWEP.Alt2IronAng = Vector(-1.65, 0.02, 4.4)
	
	SWEP.SprintPos = Vector(2.8409, -10.9318, -8.5227)
	SWEP.SprintAng = Vector(59.3182, 2.0455, 2.0455)
	
	SWEP.CustomizePos = Vector(10, -5, .5)
	SWEP.CustomizeAng = Vector(15, 45, 20)

	SWEP.AlternativePos = Vector(-.8, 0, -0.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = .8
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = .2, hor = 1.25, roll = 2, forward = .5, pitch = 2}
	SWEP.CustomizationMenuScale = 0.016 --  0.017
	
	SWEP.AttachmentModelsVM = {}
	
		SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, -.4), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["R Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.25, 0), angle = Angle(0, -10, 0) }}
}

end
end

SWEP.ShellsBGs = {main = 1, zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5, six = 6}
SWEP.BulletsBGs = {main = 2,  zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5, six = 6}
SWEP.BarrelBGs = {main = 3, default = 0, ext = 1, snub = 2}
SWEP.SlotBGs = {main = 4, regular = 0, cut = 1}

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = false
SWEP.FullAimViewmodelRecoil = false

SWEP.MuzzleVelocity = 350

SWEP.Attachments = {[2] = {header = "Reload", offset = {-150, 150}, atts = {"doi_atow_revsbandoler"}},
[1] = {header = "Barrel", offset = {-400, -250}, atts = {"doi_atow_29ext","doi_atow_29short"}},
["+reload"] = {header = "Ammo", offset = {350, -150}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy", "am_atow_ap", "am_atow_riot"}}}

SWEP.Animations = {fire = {"base_fire","base_fire2"},
	fire_aim = {"iron_fire_1"},
	fire_last = {"base_fire_last"},
	fire_last_aim = {"iron_fire_last"},
	reload_start = "base_reload_start",
	insert = "base_reload_insert",
	reload_end = "base_reload_end",
	reload = "base_reload_clip",
	reload_empty = "base_reload_clip_empty",
	idle = "base_reload_end",
	draw = "base_draw"}
	
SWEP.ReloadViewBobEnabled = false //

SWEP.SpeedDec = 15
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = .97
}

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"singleaction"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Pistols"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 0
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/sw29.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_sw1917.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_sw1917.mdl"
SWEP.WMPos = Vector(-1.4, 4, 2.95)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
--SWEP.RVBPitchMod = .9
--SWEP.RVBYawMod = .7
--SWEP.RVBRollMod = 1

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= false

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "357"
else
SWEP.Primary.Ammo			= ".44 Magnum"
end

SWEP.FireDelay = 60/111
SWEP.FireSound = "DOIWEBLEY2_FIRE"
SWEP.Recoil = 2
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .9,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2.1,
[HITGROUP_RIGHTARM] = 2.1,
[HITGROUP_RIGHTLEG] = 2.1,
[HITGROUP_LEFTLEG] = 2.1}

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.055
SWEP.ClumpSpread_Orig = nil
SWEP.ClumpSpread = nil
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.7
SWEP.Shots = 1
SWEP.Damage = 60
SWEP.DeployTime = .375
SWEP.HolsterTime = .35

SWEP.ADSFireAnim = true
SWEP.ShootWhileProne = true
SWEP.ShotgunReload = true
SWEP.HolsterOnLadder = false
SWEP.SprintingEnabled = false

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.ReloadStartTime = 2.15
SWEP.InsertShellTime = .95
SWEP.ReloadFinishWait = 1.5

SWEP.ReloadSpeed = 1.75
SWEP.ReloadTime = 4.575
SWEP.ReloadHalt = 5.2
SWEP.ReloadTime_Empty = 5.15
SWEP.ReloadHalt_Empty = 5.3

function SWEP:IndividualThink()
self.Owner.ViewAff = 0
	self.EffectiveRange = 95 * 39.37
	self.DamageFallOff = .45
	
	if self.ActiveAttachments.doi_atow_29ext then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
end
	if self.ActiveAttachments.doi_atow_29short then
	self.EffectiveRange = ((self.EffectiveRange * .9))
end
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .195))
end
	if self.ActiveAttachments.am_atow_riot then
	self.EffectiveRange = ((self.EffectiveRange * .4))
end
		
		clip = self:Clip1()	
		
if self.ActiveAttachments.doi_atow_revspeedstrip then
			if self:Clip1() == 0 or self:Clip1() == 2 or self:Clip1() == 4 then
				self.InsertShellTime = 0.3
			elseif self:Clip1() == 3 or self:Clip1() == 5 then
				self.InsertShellTime = 1.1
			else
				self.InsertShellTime = 0.95
			end
	end
		
		if clip == 0 and self.ShotgunReload == true then 
		self.Animations = {fire = {"base_fire","base_fire2"},
		fire_aim = {"iron_fire_1"},
		fire_last = {"base_fire_last"},
		fire_last_aim = {"iron_fire_last"},
		reload_start = "base_reload_start_empty",
		insert = "base_reload_insert",
		reload_end = "base_reload_end",
		reload = "base_reload_clip",
		reload_empty = "base_reload_clip_empty",
		idle = "base_reload_end",
		draw = "base_draw"}
		self.ReloadStartTime = 2.85
		else
		self.Animations = {fire = {"base_fire","base_fire2"},
		fire_aim = {"iron_fire_1"},
		fire_last = {"base_fire_last"},
		fire_last_aim = {"iron_fire_last"},
		reload_start = "base_reload_start",
		insert = "base_reload_insert",
		reload_end = "base_reload_end",
		reload = "base_reload_clip",
		reload_empty = "base_reload_clip_empty",
		idle = "base_reload_end",
		draw = "base_draw"}
		self.ReloadStartTime = 2.15
		end
			
		if self.Sequence == self.Animations.insert and clip == 0 then
		self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.zero)
		end	
			if self.Sequence == self.Animations.insert and clip == 1 then
			self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.one)
			end
				if self.Sequence == self.Animations.insert and clip == 2 then
				self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.two)
				end
					if self.Sequence == self.Animations.insert and clip == 3 then
					self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.three)
					end
						if self.Sequence == self.Animations.insert and clip == 4 then
						self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.four)
						end
							if self.Sequence == self.Animations.insert and clip == 5 then
							self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.five)
							end
								if self.Sequence == self.Animations.insert and clip == 6 then
								self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.six)
								end
									if not self.IsReloading and clip == 6 then
									self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.six)
									end
										if self.Sequence == self.Animations.reload and self.ActiveAttachments.doi_atow_revspeedloader or
											self.Sequence == self.Animations.reload_empty and self.ActiveAttachments.doi_atow_revspeedloader then
											self:setBodygroup(self.ShellsBGs.main, self.ShellsBGs.six)
											end
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1.3
	anim = "safe"
	prefix = ""
	suffix = ""
	
	if clip == 1 then
		suffix = suffix .. "_last"
	end
	
	if self:isAiming() then
		suffix = suffix .. "_aim"
		cycle = self.ironFireAnimStartCycle
	end
	
	self:sendWeaponAnim(prefix .. "fire" .. suffix, rate, cycle)
end //*/

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