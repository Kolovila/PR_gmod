if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		--SWEP.magType = "NONE"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1917"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.HUD_MagText = "CYLINDER: "
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_sw1917")
	killicon.Add( "doi_atow_sw1917", "vgui/inventory/killicons/weapon_sw1917", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 54 * 39.37
	SWEP.DamageFallOff_Orig = .5
	
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

	SWEP.IronsightPos = Vector(-2.7682, 3, 1.37)
	SWEP.IronsightAng = Vector(-1.53, 0.05, 4.4)
	
	SWEP.AltIronPos = Vector(-2.769, 3, 1.30)
	SWEP.AltIronAng = Vector(-1.3, 0.035, 4.4)
	
	SWEP.SprintPos = Vector(2.8409, -10.9318, -8.5227)
	SWEP.SprintAng = Vector(59.3182, 2.0455, 2.0455)
	
	SWEP.CustomizePos = Vector(10, -5, .5)
	SWEP.CustomizeAng = Vector(15, 45, 20)

	SWEP.AlternativePos = Vector(-.8, 0, -0.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = .25, roll = 2, forward = 0, pitch = .4}
	SWEP.CustomizationMenuScale = 0.016 --  0.017
	
	SWEP.AttachmentModelsVM = {
	}
	SWEP.Trivia = {text = "Fire quickly for double-action or slower for single-action.", x = -350, y = -400}

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
SWEP.BarrelBGs = {main = 5, default = 0, ext = 1, snub = 2}

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true

SWEP.MuzzleVelocity = 250

SWEP.Attachments = {[2] = {header = "Reload", offset = {-150, 150}, atts = {"doi_atow_revsbandoler","doi_atow_revspeedloader"}},
[1] = {header = "Barrel", offset = {-400, -250}, atts = {"doi_atow_1917ext"}},
["+reload"] = {header = "Ammo", offset = {350, -150}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy", "am_atow_riot"}}}

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
standing = 2
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
SWEP.AimViewModelFOV = 55
SWEP.ZoomAmount = 0
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/sw1917.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_sw1917.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_sw1917.mdl"
SWEP.WMPos = Vector(-1.4, 4, 2.95)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = .5
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= false

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Pistol"
else
SWEP.Primary.Ammo			= ".45 ACP"
end

SWEP.FireDelay = 60/399
SWEP.FireSound = "DOIM1917_FIRE"
SWEP.Recoil = 1.3
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .9,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2.3,
[HITGROUP_RIGHTARM] = 2.3,
[HITGROUP_RIGHTLEG] = 2.3,
[HITGROUP_LEFTLEG] = 2.3}

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread_Orig = nil
SWEP.ClumpSpread = nil
SWEP.SpreadPerShot = 0.012
SWEP.SpreadCooldown = 0.58
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = .375
SWEP.HolsterTime = .35

SWEP.ADSFireAnim = true
SWEP.ShootWhileProne = true
SWEP.ShotgunReload = true
SWEP.HolsterOnLadder = false
SWEP.SprintingEnabled = false

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.ReloadStartTime = 2.25
SWEP.InsertShellTime = .95
SWEP.ReloadFinishWait = 1.5

SWEP.ReloadSpeed = 1.75
SWEP.ReloadTime = 4.575
SWEP.ReloadHalt = 5.2
SWEP.ReloadTime_Empty = 5.15
SWEP.ReloadHalt_Empty = 5.3

function SWEP:IndividualThink()

if self.ActiveAttachments.doi_atow_revspeedstrip then
			if self:Clip1() == 0 or self:Clip1() == 2 or self:Clip1() == 4 then
				self.InsertShellTime = 0.3
			elseif self:Clip1() == 1 or self:Clip1() == 3 or self:Clip1() == 5 then
				self.InsertShellTime = 1.1
			else
				self.InsertShellTime = 0.95
			end
	end

self.Owner.ViewAff = 0
	self.EffectiveRange = 54 * 39.37
	self.DamageFallOff = .5
	
	if self.ActiveAttachments.doi_atow_1917ext then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
end
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .186))
end
	if self.ActiveAttachments.am_atow_riot then
	self.EffectiveRange = ((self.EffectiveRange * .55))
end
	
		clip = self:Clip1()	
		
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
		self.ReloadStartTime = 2.95
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
		self.ReloadStartTime = 2.25
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
	rate = 1.4
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