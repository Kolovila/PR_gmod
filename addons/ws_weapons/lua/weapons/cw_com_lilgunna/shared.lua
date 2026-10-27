AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
//SCK name: glock / glock_90

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Lil Gunna"
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_com_lilgunna", "vgui/kill_icon/cw_com_lilgunna", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kill_icon/cw_com_lilgunna")

	SWEP.ForeGripOffsetCycle_Draw = 1
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8

	SWEP.MuzzleEffect = "muzzleflash_pistol"
	//SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.SnapToGrip = true
	SWEP.PosBasedMuz = true

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -2}
		
	SWEP.GangPos = Vector(-0.201, 0, 4.139)
	SWEP.GangAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(2.2, 0, 1.75)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(1.279, 0, -2.12)
	SWEP.SprintAng = Vector(0, 25.326, -11.256)
	
	//SWEP.CustomizePos = Vector(-3.681, -3.82, 11.8)
	//SWEP.CustomizeAng = Vector(14.069, -48.543, -70)

	SWEP.CustomizePos = Vector(-6.401, -3.82, 2.17)
	SWEP.CustomizeAng = Vector(7.738, -42.916, -3.518)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = false
	SWEP.DisableSprintViewSimulation = false

	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true

	SWEP.BoltBone = "slide2"
	SWEP.BoltShootOffset = Vector(-2, 0, 0)
	//SWEP.OffsetBoltOnBipodShoot = true

	SWEP.ACOGAxisAlign = {right = -0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "frame", rel = "", pos = Vector(4.15, -6.801, 10), angle = Angle(90, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "frame", rel = "", pos = Vector(4.15, -6.801, 10), angle = Angle(90, 90, 0), size = Vector(0.699, 0.699, 0.699)},		
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "frame", rel = "", pos = Vector(4.099, -3.5, 15.5), angle = Angle(90, 90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "frame", rel = "", pos = Vector(4.15, -5.25, 9.55), angle = Angle(-90, -90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "frame", rel = "", pos = Vector(4.4, -7.75, 8), angle = Angle(-180, 0, 90), size = Vector(0.85, 0.85, 0.85)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "frame", rel = "", pos = Vector(4.15, -3.3, 15.5), angle = Angle(90, 90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "frame", rel = "", pos = Vector(4.199, -5.6, 9.8), angle = Angle(-90, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "frame", rel = "", pos = Vector(4, -10.95, 4.599), angle = Angle(90, 90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "frame", rel = "", pos = Vector(4.159, -5.74, 9.199), angle = Angle(-90, -90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "frame", rel = "", pos = Vector(4.17, -2.75, 13), angle = Angle(0, 0, 90), size = Vector(0.4, 0.4, 0.4)}
	}

	SWEP.CustomizationMenuScale = 0.008

	SWEP.CompM4SBoneMod = {
		["ard"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(31.445, 0, 0) }
	}

	SWEP.ForegripOverridePos = {
	
	["gangsta"] = {
	["L_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(0, -7.223, -2.779), angle = Angle(-90, 0, 0) },
	},
	["default"] = {},
	}

end

SWEP.LuaVMRecoilAxisMod = {vert = 5, hor = 3, roll = 3, forward = 3, pitch = 3}
SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = false
SWEP.ADSFireAnim  = false

//lua_run Entity(1):GetViewModel():SetBodygroup(0,1) lua_run Entity(1):GetViewModel():SetBodygroup(3,2)   
//lua_run Entity(1):GetViewModel():SetBodygroup(3,1) lua_run Entity(1):GetViewModel():SetBodygroup(0,0)  

//SWEP.SightBGs = {main = 3, regular = 0, none = 1}
SWEP.BarrelBGs = {main = 1, long = 1, regular = 0}
SWEP.MagBGs = {main = 2, regular = 0, mag25 = 1, cmag = 2}

if CustomizableWeaponry_KK_HK416 then
SWEP.Attachments = {
	[1] = {header = "Sight", offset = {100, -400}, atts = {"md_microt1", "md_cod4_reflex", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_fas2_holo"}},
	[2] = {header = "Muzzle", offset = {-500, -400}, atts = {"md_lilgunna_sup"}},
	[3] = {header = "Barrel", offset = {-500, 0}, atts = {"bg_lilgunna_long"}},
	[4] = {header = "Magazine", offset = {-500, 500}, atts = {"bg_lilgunna_25mag", "bg_lilgunna_cmag"}},
	[5] = {header = "Style", offset = {200, 500}, atts = {"atts_gansta"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}
	}
else
SWEP.Attachments = {
	[1] = {header = "Sight", offset = {-100, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Muzzle", offset = {-700, -600}, atts = {"md_lilgunna_sup"}},
	[3] = {header = "Barrel", offset = {-700, -200}, atts = {"bg_lilgunna_long"}},
	[4] = {header = "Magazine", offset = {-700, 300}, atts = {"bg_lilgunna_25mag", "bg_lilgunna_cmag"}},
	[5] = {header = "Style", offset = {0, 300}, atts = {"atts_gansta"}},
	["+reload"] = {header = "Ammo", offset = {800, -50}, atts = {"am_magnum", "am_matchgrade"}}
	}
end

SWEP.AttachmentDependencies = {}	

SWEP.AttachmentExclusions = {}

SWEP.AttachmentPosDependency = {["md_microt1"] = {["atts_gansta"] = Vector(1.399, -5.52, 13)},
["md_cod4_reflex"] = {["atts_gansta"] = Vector(4.4, -5.551, 9.199)},
["md_eotech"] = {["atts_gansta"] = Vector(9.6, -5.75, 4.599)},
["md_cod4_eotech_v2"] = {["atts_gansta"] = Vector(4.199, -5.5, 9.8)},
["md_fas2_eotech"] = {["atts_gansta"] = Vector(2, -5.5, 15.5)},
["md_aimpoint"] = {["atts_gansta"] = Vector(6.4, -5.301, 8)},
["md_cod4_aimpoint_v2"] = {["atts_gansta"] = Vector(3.91, -5.5, 9.55)},
["md_fas2_aimpoint"] = {["atts_gansta"] = Vector(2.15, -5.5, 15.5)},
["md_fas2_holo"] = {["atts_gansta"] = Vector(5.5, -5.551, 10)}
}
SWEP.AttachmentAngDependency = {["md_microt1"] = {["atts_gansta"] = Angle(0, -90, 90)},
["md_cod4_reflex"] = {["atts_gansta"] = Angle(-90, -180, 0)},
["md_eotech"] = {["atts_gansta"] = Angle(90, 0, 0)},
["md_cod4_eotech_v2"] = {["atts_gansta"] = Angle(-90, -180, 0)},
["md_fas2_eotech"] = {["atts_gansta"] = Angle(90, 0, 0)},
["md_aimpoint"] = {["atts_gansta"] = Angle(-180, -90, 90)},
["md_cod4_aimpoint_v2"] = {["atts_gansta"] = Angle(-90, -180.000, 0)},
["md_fas2_aimpoint"] = {["atts_gansta"] = Angle(90, 0, 0)},
["md_fas2_holo"] = {["atts_gansta"] = Angle(90, 0, 0)}
}


SWEP.Animations = {
	reload = "mac10_reload_norm",
	fire = {"mac10_fire", "mac10_fire2", "mac10_fire3"},
	idle = "mac10_idle",
	draw = "mac10_draw"
}
	
SWEP.Sounds = {
	
	mac10_draw = {{time = 0.1, sound = "CW_LIL_GUNNA_SLIDEFORWARD"}},

	mac10_reload_drop = {{time = 0.7, sound = "CW_FOLEY_LIGHT"}},

	mac10_reload = {{time = 0.3, sound = "CW_LIL_GUNNA_MAGOUT"},
	{time = 1.6, sound = "CW_LIL_GUNNA_MAGIN"},
	{time = 2.4, sound = "CW_LIL_GUNNA_SLIDEFORWARD"}},

	mac10_reload_cmag = {{time = 0.3, sound = "CW_LIL_GUNNA_MAGOUT"},
	{time = 1.6, sound = "CW_LIL_GUNNA_MAGIN"},
	{time = 2.4, sound = "CW_LIL_GUNNA_SLIDEFORWARD"}},

	mac10_reload_norm = {{time = 0.3, sound = "CW_LIL_GUNNA_MAGOUT"},
	{time = 1.6, sound = "CW_LIL_GUNNA_MAGIN"},
	{time = 2.4, sound = "CW_LIL_GUNNA_SLIDEFORWARD"}}
	
}

SWEP.SpeedDec = 3

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Commissions"

SWEP.ForegripOverride = true

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw2/v_pist_lilgunna.mdl"
SWEP.WorldModel		= "models/weapons/cw2/w_pist_lilgunna.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/cw2/w_pist_lilgunna.mdl"
//SWEP.WMPos = Vector(-1, 0, -0.5)
//SWEP.WMAng = Vector(0, 0, 180)

SWEP.ViewModelFlip = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"
SWEP.magType = "pistolMag"
SWEP.FireDelay = 0.05
SWEP.FireSound = "CW_LIL_GUNNA_FIRE"
SWEP.FireSoundSuppressed = "CW_LIL_GUNNA_FIRE_SUPPRESSED"
SWEP.Recoil = 0.77

SWEP.HipSpread = 0.034
SWEP.AimSpread = 0.011
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 41
SWEP.DeployTime = 1
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.5
SWEP.ReloadTime = 3
SWEP.ReloadHalt = 2.5

SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt_Empty = 2.5

SWEP.SnapToIdlePostReload = false


function SWEP:IndividualThink()

	CT = CurTime()

	if self:isAttachmentActive("sights") then
		if self.ActiveAttachments.atts_gansta then
			self:setBodygroup(3,2)
		else
			self:setBodygroup(3,1)
		end
		if self.WMEnt then
			self.WMEnt:SetBodygroup(3,1) 
		end
	else
		self:setBodygroup(3,0)
		if self.WMEnt then
			self.WMEnt:SetBodygroup(3,0) 
		end
	end

	if self.ActiveAttachments.atts_gansta then

self.ReloadTime = 1.7
self.ReloadHalt = 1

self.ReloadTime_Empty = 1.7
self.ReloadHalt_Empty = 1

		self.Animations.reload = "mac10_reload_drop"
		if self.dt.State == CW_CUSTOMIZE then
			self:sendWeaponAnim("idle", 1)
		end

		if not self:isReloading() then
		self:setBodygroup(0,1)
			if self.ActiveAttachments.bg_lilgunna_long then
				self:setBodygroup(1,3)
				else
				self:setBodygroup(1,2)
			end
		
		if self.ActiveAttachments.bg_lilgunna_25mag then
			self:setBodygroup(2,4)
		elseif self.ActiveAttachments.bg_lilgunna_cmag then
			self:setBodygroup(2,5)
		else
			self:setBodygroup(2,3)
		end

		if self.ActiveAttachments.md_lilgunna_sup and self.ActiveAttachments.bg_lilgunna_long then
			self:setBodygroup(4,4)
		elseif self.ActiveAttachments.md_lilgunna_sup then
			self:setBodygroup(4,3)
		else
			self:setBodygroup(4,0)
		end

		end
		if not self:isAttachmentActive("sights") then
			self:updateIronsights("Gang")
		end
		self.WMPos = Vector(5, -5, 0)
		self.WMAng = Vector(0, 180, -180)

		self.MicroT1Pos = Vector(-1.321, 0, 4.079)
		self.MicroT1Ang = Vector(0, 0, 0)
		self.CoD4ReflexPos = Vector(-1.321, 0, 4.159)
		self.CoD4ReflexAng = Vector(0, 0, 0)
		self.EoTechPos = Vector(-1.28, 0, 4.159)
		self.EoTechAng = Vector(0, 0, 0)
		self.AimpointPos = Vector(-1.29, 0, 4.139)
		self.AimpointAng = Vector(0, 0, 0)
		self.EoTech552Pos = Vector(-1.491, 0, 4.139)
		self.EoTech552Ang = Vector(0, 0, 0)
		self.EoTech553Pos = Vector(-1.29, 0, 4.099)
		self.EoTech553Ang = Vector(0, 0, 0)
		self.CoD4TascoPos = Vector(-0.89, 0, 4.119)
		self.CoD4TascoAng = Vector(0, 0, 0)
		self.FAS2AimpointPos = Vector(-1.091, 0, 4.119)
		self.FAS2AimpointAng = Vector(0, 0, 0)
		self.HoloPos = Vector(-1.461, 0, 4.179)
		self.HoloAng = Vector(0, 0, 0)


		self:RemovePootis()
		run2 = true
	else
		
		self.ReloadTime = 3
self.ReloadHalt = 2.5

self.ReloadTime_Empty = 3
self.ReloadHalt_Empty = 2.5

		if self.dt.State == CW_CUSTOMIZE then
			self:sendWeaponAnim("idle", 1)
		end
		self:setBodygroup(0,0)
			if not self.ActiveAttachments.bg_lilgunna_long then
			self:setBodygroup(1,0)
			else
			self:setBodygroup(1,1)
			end
		
		if not self.ActiveAttachments.bg_lilgunna_25mag and not self.ActiveAttachments.bg_lilgunna_cmag then
		self:setBodygroup(2,0)
		self.Animations.reload = "mac10_reload_norm"
		elseif not self.ActiveAttachments.bg_lilgunna_cmag then
			self:setBodygroup(2,1)
			self.Animations.reload = "mac10_reload"
		else
		self:setBodygroup(2,2)
		self.Animations.reload = "mac10_reload_cmag"
		end

		if self.ActiveAttachments.md_lilgunna_sup and self.ActiveAttachments.bg_lilgunna_long then
			self:setBodygroup(4,2)
		elseif self.ActiveAttachments.md_lilgunna_sup then
			self:setBodygroup(4,1)
		else
			self:setBodygroup(4,0)
		end

		self:revertToOriginalIronsights()
		self.WMPos = Vector(5, -5, -1)
		self.WMAng = Vector(0, 180, 90)

		self.MicroT1Pos = Vector(2.2, 0, 0.6)
		self.MicroT1Ang = Vector(0, 0, 0)
		self.CoD4ReflexPos = Vector(2.16, 0, 0.639)
		self.CoD4ReflexAng = Vector(0, 0, 0)
		self.EoTechPos = Vector(2.22, 0, 0.68)
		self.EoTechAng = Vector(0, 0, 0)
		self.AimpointPos = Vector(2.2, 0, 0.66)
		self.AimpointAng = Vector(0, 0, 0)
		self.EoTech552Pos = Vector(2.23, 0, 0.54)
		self.EoTech552Ang = Vector(0, 0, 0)
		self.EoTech553Pos = Vector(2.17, 0, 0.62)
		self.EoTech553Ang = Vector(0, 0, 0)
		self.CoD4TascoPos = Vector(2.19, 0, 1.059)
		self.CoD4TascoAng = Vector(0, 0, 0)
		self.FAS2AimpointPos = Vector(2.15, 0, 0.879)
		self.FAS2AimpointAng = Vector(0, 0, 0)
		self.HoloPos = Vector(2.154, 0, 0.455)
		self.HoloAng = Vector(0, 0, 0)

		self:RemovePootis2()
		run = true
	end

	if self.ActiveAttachments.bg_lilgunna_long then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(1,1) 
		end
	else
		if self.WMEnt then
			self.WMEnt:SetBodygroup(1,0) 
		end
	end

	if self.ActiveAttachments.md_lilgunna_sup and self.ActiveAttachments.bg_lilgunna_long then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(4,2) 
		end
	elseif self.ActiveAttachments.md_lilgunna_sup then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(4,1) 
		end
	else
		if self.WMEnt then
			self.WMEnt:SetBodygroup(4,0) 
		end
	end

	if self.ActiveAttachments.bg_lilgunna_cmag then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(2,2) 
		end
	elseif self.ActiveAttachments.bg_lilgunna_25mag then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(2,1) 
		end
	else
		if self.WMEnt then
			self.WMEnt:SetBodygroup(2,0) 
		end
	end

	if self.ActiveAttachments.md_microt1 then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,1) 
		end
	elseif self.ActiveAttachments.md_cod4_reflex then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,3) 
		end
	elseif self.ActiveAttachments.md_eotech or self.ActiveAttachments.md_cod4_eotech_v2 or self.ActiveAttachments.md_fas2_eotech then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,2) 
		end
	elseif self.ActiveAttachments.md_aimpoint or self.ActiveAttachments.md_cod4_aimpoint_v2 or self.ActiveAttachments.md_fas2_aimpoint then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,4) 
		end
	elseif self.ActiveAttachments.md_fas2_holo then
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,5) 
		end
	else
		if self.WMEnt then
			self.WMEnt:SetBodygroup(5,0) 
		end
	end

end

function SWEP:RemovePootis()
	if run then
	self:detach(1)
	end

	run = false
end

function SWEP:RemovePootis2()
	if run2 then
	self:detach(1)
	end

	run2 = false
end

function SWEP:detach(category)
	self.LastPreset = nil
	
	if not category then
		return
	end
	
	local att = self.Attachments[category]
	
	if not att or not att.last then
		return
	end
	
	local last = att.last
	
	self:_detach(category, last)
	
	umsg.Start("CW20_DETACH", self.Owner)
		umsg.Entity(self)
		umsg.String(category)
		umsg.Short(last)
	umsg.End()
	
	-- call the default reset function (to reset shit like FOV, etc.) 
	--self:resetPostDetach(foundAtt, att)
end


function SWEP:finishReload()
	mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)

	if mag > 0 then
		if self.SnapToIdlePostReload then
			self:sendWeaponAnim("idle", 1, 1)
		end
	end
	
	local suppressReloadLogic = CustomizableWeaponry.callbacks.processCategory(self, "defaultReloadLogic", mag == 0)
	
	if not suppressReloadLogic then
		if self.ReloadAmount then
			if SERVER then
				self:SetClip1(math.Clamp(mag + self.ReloadAmount, 0, self.Primary.ClipSize))
				self.Owner:RemoveAmmo(self.ReloadAmount, self.Primary.Ammo)
			end
		else
			if mag > 0 then
				if ammo >= self.Primary.ClipSize - mag then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize - mag, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(mag + ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			else
				if ammo >= self.Primary.ClipSize then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			end
		end
	end
	
	CustomizableWeaponry.callbacks.processCategory(self, "finishReload")
	
	self.ReloadDelay = nil
	self:sendWeaponAnim("idle", 1, 1)
end