AddCSLuaFile()

CustomizableWeaponry:addFireSound(		"CW_TOZ34.Fire", 			"^weapons/cw_toz34/toz34_shoot.wav", 1.5, 115, CHAN_WEAPON, nil, nil, true)
CustomizableWeaponry:addRegularSound(	"CW_TOZ34.Empty", 			"weapons/cw_toz34/toz34_empty.wav")
CustomizableWeaponry:addRegularSound(	"CW_TOZ34.Draw", 			"weapons/cw_toz34/toz34_draw.wav")
CustomizableWeaponry:addReloadSound(	"CW_TOZ34.Reload", 			"weapons/cw_toz34/toz34_reload_one.wav")
CustomizableWeaponry:addReloadSound(	"CW_TOZ34.ReloadFull", 		"weapons/cw_toz34/toz34_reload.wav")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "TOZ-34"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.Add("cw_toz34", "vgui/kills/cw_toz34_kill", Color(255, 80, 0, 200))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_toz34_select")
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.MuzzleAttachmentNameOrig = "muzzle"
	SWEP.MuzzleAttachmentAlt = "muzzle_sawn"
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0
	SWEP.ShellOffsetMul = 0
	SWEP.Shell = false
	SWEP.NoStockShells = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/cw2/shotguns/w_toz34.mdl"
	SWEP.WMPos = Vector(-1.2, 10, -6.2)
	SWEP.WMAng = Vector(-15, 3, 180)

	--SWEP.ShellPosOffset = {x = 2, y = 0, z = 2}
	--SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true

	--SWEP.IronsightPos = Vector(-5.1, -11.787, 2.369)
	--SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.AC10632Pos = Vector(-5.1, -9.789, 1.133)
	SWEP.AC10632Ang = Vector(0.127, 0, 0)

	SWEP.L96Pos = Vector(-5.041, -9.84, -0.422)
	SWEP.L96Ang = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-5.1, -9.784, 2.51)
	SWEP.IronsightAng = Vector(-0.225, 0, 0)

	SWEP.SprintPos = Vector(7.059, -6.528, -0.04)
	SWEP.SprintAng = Vector(-11.126, 36.003, 0)

	SWEP.CustomizePos = Vector(5.039, -5.832, -1.76)
	SWEP.CustomizeAng = Vector(11.216, 37.533, 0)

	--SWEP.CustomizePos = Vector(9.099, -7.733, -2.187)
	--SWEP.CustomizeAng = Vector(13.308, 40.394, 0)

	SWEP.FOVPerShot = 5
	
	SWEP.CustomizationMenuScale = 0.02
	SWEP.ReticleInactivityPostFire = 0.9

	SWEP.LuaVMRecoilAxisMod = {vert = 6, hor = 1, roll = 3, forward = 0, pitch = 0}

	SWEP.MuzzleAttachmentAltA = 2

	SWEP.AttachmentModelsVM = {
		["md_ac10632"] = {
			model = "models/weapons/cw2/attachments/ac10632.mdl", 
			bone = "bend_reload", 
			pos = Vector(-0.009, -3.007, -3.294), 
			angle = Angle(90, -90, 0), 
			size = Vector(1, 1, 1)
		},
		["md_scope_l96"] = {
			model = "models/weapons/cw2/attachments/an_scope_l96.mdl", 
			bone = "bend_reload", 
			pos = Vector(0.159, -4.559, -4.271), 
			angle = Angle(90, -90, 0), 
			size = Vector(1, 1, 1)
		}
	}
end

SWEP.MuzzleVelocity = 381

--SWEP.ADSFireAnim = false

SWEP.Attachments = {
	[1] = {
		header = "Sight", 
		offset = {0, -300},  
		atts = {
			"md_ac10632",
			"md_scope_l96"
		}
	},
	[2] = {
		header = "Barrel", 
		offset = {200, 300},  
		atts = {
			"bg_toz34_sawoff"
		}
	},
	[6] = {
		header = "Skin", 
		offset = {900, 600},
		atts = {
			"toz34_skin1",
			"toz34_skin2", 
			"toz34_skin3", 
			"toz34_skin4", 
			"toz34_skin5", 
			"toz34_skin6"
		}
	},
	["+reload"] = {
		header = "Ammo",
		offset = {800, 300}, 
		atts = {
			"am_slugrounds",
			"am_flechetterounds"
		}
	}
}

SWEP.Animations = {
	fire = "shoot",
	holster = "holster",
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"
}

SWEP.Sounds = {
	draw = {{time = 0, sound = "CW_TOZ34.Draw"}},
	reload = {{time = 0, sound = "CW_TOZ34.Reload"}},
	reload_empty = {{time = 0, sound = "CW_TOZ34.ReloadFull"}},
}

SWEP.SpeedDec = 10

SWEP.Slot = 3
SWEP.SlotPos = 6
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"break"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Isemenuk27"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw2/shotguns/v_toz34.mdl"
SWEP.WorldModel		= "models/weapons/cw2/shotguns/w_toz34.mdl"

SWEP.Spawnable			= true
SWEP.AdminOnly			= false

SWEP.Primary.ClipSize		= 2
SWEP.Primary.DefaultClip	= 4
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.15
SWEP.FireSound = "CW_TOZ34.Fire"
SWEP.Recoil = 3.5

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.ClumpSpread = 0.008
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.4
SWEP.Shots = 12
SWEP.Damage = 12
SWEP.DeployTime = 1
SWEP.DeployAnimSpeed = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2
SWEP.ReloadTime_Empty = 3.8
SWEP.ReloadHalt = 2.85
SWEP.ReloadHalt_Empty = 4

SWEP.Chamberable = false

SWEP.NearWallDistance = 40

function SWEP:beginReload()
	mag = self:Clip1()
	local CT = CurTime()
	do
		local reloadTime = nil
		local reloadHalt = nil
		if mag < 2 && self:Ammo1() == 1 then
			reloadTime = self.ReloadTime
			reloadHalt = self.ReloadHalt
		elseif mag == 0 then
			reloadTime = self.ReloadTime_Empty
			reloadHalt = self.ReloadHalt_Empty
		else
			reloadTime = self.ReloadTime
			reloadHalt = self.ReloadHalt
		end
		
		reloadTime = reloadTime / self.ReloadSpeed
		reloadHalt = reloadHalt / self.ReloadSpeed

		self.ReloadDelay = CT + reloadTime
		self:SetNextPrimaryFire(CT + reloadHalt)
		self:SetNextSecondaryFire(CT + reloadHalt)
		self.GlobalDelay = CT + reloadHalt
		
		if (mag < 2 && self:Ammo1() == 1) || mag > 0 then
			self:sendWeaponAnim("reload", self.ReloadSpeed)
		else
			self:sendWeaponAnim("reload_empty", self.ReloadSpeed)
		end

	end
	CustomizableWeaponry.callbacks.processCategory(self, "beginReload", mag == 0)
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
end

function SWEP:canFireWeapon(checkType)
	if checkType == 1 then
		if self.ShotgunReloadState != 0 then
			return
		end
		
		if self.ReloadDelay then
			return
		end
		
		local preFireResult = CustomizableWeaponry.callbacks.processCategory(self, "preFire")
		
		if preFireResult then
			return
		end
	elseif checkType == 2 then
		if CurTime() < self.GlobalDelay then
			return false
		end
	elseif checkType == 3 then
		mag = self:Clip1()
		CT = CurTime()
		
		if mag == 0 then
			self:EmitSound("CW_TOZ34.Empty", 100, 100)
			self:SetNextPrimaryFire(CT + 0.25)
			return
		end

		if self:isNearWall() then
			return
		end
		
		if self.InactiveWeaponStates[self.dt.State] then
			return
		end
	
	end
	
	return true
end