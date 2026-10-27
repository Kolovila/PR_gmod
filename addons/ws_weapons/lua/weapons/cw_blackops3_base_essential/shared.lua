CW_INSPECTING = 10

AddCSLuaFile()

AddCSLuaFile("sh_animations.lua")
AddCSLuaFile("sh_registers.lua")
AddCSLuaFile("sh_logic.lua")

AddCSLuaFile("cl_graphics.lua")
AddCSLuaFile("cl_fx.lua")
AddCSLuaFile("cl_hud_fix.lua")

include("sh_animations.lua")
include("sh_registers.lua")
include("sh_logic.lua")

if CLIENT then
	include("cl_graphics.lua")
	include("cl_fx.lua")
	include("cl_hud_fix.lua")
	
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "CW 2.0 Black Ops III"
	SWEP.CSMuzzleFlashes = true
	SWEP.M203CameraRotation = {p = 0, y = 0, r = 0}
	SWEP.ReloadViewBobEnabled = true
	SWEP.SightWithRail = false
	SWEP.DrawBlackBarsOnAim = false
	SWEP.DrawWeaponInfoBox = true
	SWEP.SnapToIdlePostReload = false
	SWEP.HUD_3D2DScale = 0.045
	SWEP.CalcViewCamera = "Camera"
	SWEP.CalcViewCameraIntensity = 2
	SWEP.AimSwayIntensity = 0.2
	SWEP.ViewbobIntensity = 0.25
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0, 0, 0)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.elementRenderWM = {}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0)
	
	SWEP.WMLaserPosAdjust = Vector(0, 0, 0)
	SWEP.WMLaserAngAdjust = Angle(0, 0, 0)
end

SWEP.FireModes = {"auto"}

SWEP.SpeedDec = 0

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.Base = "cw_base"

SWEP.Author			= "Loyalists"
SWEP.Contact		= "http://steamcommunity.com/profiles/76561198095855095"
SWEP.Purpose		= ""
SWEP.Instructions   = "CONTEXT MENU KEY - Open customization menu\nUSE KEY + RELOAD KEY - Change firemode\nUSE KEY + PRIMARY ATTACK KEY - Quick melee attack"

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.DrawTraditionalWorldModel = false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryHitAABB = {
	Vector(-10, -5, -5),
	Vector(-10, 5, 5)
}

SWEP.SecondaryHitAABB = {
	Vector(-10, -5, -5),
	Vector(-10, 5, 5)
}

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= ""

SWEP.HipSpread = 0
SWEP.AimSpread = 0
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0

SWEP.ADSFireAnim			= true
SWEP.FirstDeploy			= true
SWEP.HipFireFOVIncrease		= false
SWEP.LuaViewmodelRecoil		= true
SWEP.DisableSprintViewSimulation = true

SWEP.DamageForce = 10000
SWEP.PushVelocity = 100
SWEP.VelocityToDamageDivider = 20
SWEP.HolsterSpeed = 1
SWEP.SprintSpeed = 0.75

SWEP.MeleeAttackRange = 50
SWEP.MeleeAttackDamage = 75
SWEP.MeleeInTime = 0.15
SWEP.MeleeOutTime = 0.7

SWEP.ReloadHalt = 0
SWEP.ReloadHalt_Empty = 0

SWEP.BipodAngleLimitYaw = 40
SWEP.BlackOps3Weapon = true
SWEP.ReloadTime_GL = 2.6

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local SP = game.SinglePlayer()
local MP = !SP
local noNormal = Vector(1, 1, 1)
local mag, ammo
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis
local prefix, CT

function SWEP:IndividualInitialize()
	prefix = self:GetPrefix()
	
	if self.BoltActionLogic then
		self.isRechambered = true
	end
	
	if self.FirstDeploy and self.Animations[prefix .. "draw_first"] then
		self:playAnim(prefix .. "draw_first", self.DrawSpeed)
	else
		self:playAnim(prefix .. "draw", self.DrawSpeed)
	end
	
	if CLIENT then
		self:setupAttachmentModelsWM()
	end
end

function SWEP:IndividualThink()
	if self.QuickMeleeLogic or self.MeleeLogic then
		self:MeleeLogicThink()
	end
	
	if self.ChargedLogic then
		self:ChargedLogicThink()
	end
	
	if self.BoltActionLogic then
		if self:Clip1() <= 0 then
			self.isRechambered = true
		end
		
		if not self.isRechambered then
			self:Rechamber()
		end
	end
	
	if self.ShotgunReload and self.ShotgunReloadThink then
		self:ShotgunReloadThink()
	end
	
	if self.IndividualWeaponThink then
		self:IndividualWeaponThink()
	end
	
	if self.dt.M203Active then
		if not self.isGLAttached then
			self.dt.M203Active = false
		end
	end
	if CLIENT then
		if MP and not IsFirstTimePredicted() then 
			return 
		end
		
		self:RestAnimationsThink()
	end
end

function SWEP:PrimaryAttack()
	if not self:canFireWeapon(1) then
		return
	end

	if self.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	end
	
	if self.MeleeLogic and IsFirstTimePredicted() and self.dt.State != CW_CUSTOMIZE then
		self:MeleeAttack(self.PrimaryMeleeInTime, self.PrimaryMeleeOutTime, self.PrimaryMeleeAttackDamage, self.PrimaryMeleeAttackRange, self.PrimaryHitAABB, "_primary")
		return
	end
	
	if self.Owner:KeyDown(IN_USE) then
		if self.dt.State != CW_AIMING then
			if self.QuickMeleeLogic and not self.DualWieldLogic then
				self:MeleeAttack()
				return
			end
			
			if self.Inspectable and not (self.InactiveWeaponStates[self.dt.State] or self.dt.M203Active) then
				self.dt.State = CW_INSPECTING
				return
			end
		end
	end
	
	if self.dt.M203Active then
		if self.M203Chamber then
			self:fireM203(IsFirstTimePredicted())
			return
		end
	return
	end
	
	if not self:canFireWeapon(2) then
		return
	end
	
	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end
	
	if not self:canFireWeapon(3) then
		return
	end

	mag = self:Clip1()
	CT = CurTime()
	
	if mag == 0 or (self.BoltActionLogic and not self.isRechambered) then
		self:EmitSound("Weapon_BLACKOPS3_UTIL.Empty", 100, 100)
		self:SetNextPrimaryFire(CT + 0.25)
		return
	end
	
	if self.ChargedLogic then
		if not self.allowsChargedShot then
			if (self.BurstAmount and self.dt.Shots >= self.BurstAmount) or self.isCharging then
				return
			else
				self.isCharging = true
				self:delayEverything(self.ChargeUpTime)
				self.upTime = CurTime() + self.ChargeUpTime
				self:EmitSound("Weapon_BLACKOPS3_P08.Charge_Up", 100, 100)
				return
			end
		end
	end
	
	if self.BurstAmount and self.BurstAmount > 0 then
		if self.dt.Shots >= self.BurstAmount then
			if self.ChargedLogic then
				self.allowsChargedShot = false
				self.isCharging = false
				self:delayEverything(self.FireDelay * self.BurstCooldownMul)
				self:EmitSound("Weapon_BLACKOPS3_P08.Charge_Down", 100, 100)
			end
			return
		end
		
		self.dt.Shots = self.dt.Shots + 1
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if IsFirstTimePredicted() then
		local muzzleData = EffectData()
		muzzleData:SetEntity(self)
		util.Effect("cw_muzzleflash", muzzleData)
		
		if self.dt.Suppressed then
			self:EmitSound(self.FireSoundSuppressed, 105, 100)
		else
			self:EmitSound(self.FireSound, 105, 100)
		end
		
		if self.fireAnimFunc then
			self:fireAnimFunc()
		else
			if self.dt.State == CW_AIMING then
				if self.ADSFireAnim then
					self:playFireAnim()
				end
			else
				self:playFireAnim()
			end
		end
		
		self:FireBullet(self.Damage, self.CurCone, self.ClumpSpread, self.Shots)
		self:makeFireEffects()
		
		if CLIENT then
			self:simulateRecoil()
		end
		
		self:addFireSpread(CT)
		
		if SP and SERVER then
			SendUserMessage("CW_Recoil", self.Owner)
		end
		
		-- apply a global delay after shooting, if there is one
		if self.GlobalDelayOnShoot then
			self.GlobalDelay = CT + self.GlobalDelayOnShoot
		end
	end
	
	self:MakeRecoil()
	
	CustomizableWeaponry.callbacks.processCategory(self, "postFire")
	
	local suppressAmmoUsage = CustomizableWeaponry.callbacks.processCategory(self, "shouldSuppressAmmoUsage")
	
	if not suppressAmmoUsage then
		self:TakePrimaryAmmo(self.AmmoPerShot)
	end
	
	self:SetNextPrimaryFire(CT + self.FireDelay)
	
	if self.BoltActionLogic then
		self.isRechambered = false
	end
	
	-- either force the weapon back to hip after firing, or don't
	if self.ForceBackToHipAfterAimedShot then
		self.dt.State = CW_IDLE
		self:SetNextSecondaryFire(CT + self.ForcedHipWaitTime)
	else
		self:SetNextSecondaryFire(CT + self.FireDelay)
	end
	
	self.ReloadWait = CT + (self.WaitForReloadAfterFiring and self.WaitForReloadAfterFiring or self.FireDelay)
	
	self:postPrimaryAttack()
	CustomizableWeaponry.callbacks.processCategory(self, "postConsumeAmmo")
	
	if SP and SERVER then
		SendUserMessage("CW_PostFire", self.Owner)
	end
end

function SWEP:SecondaryAttack()
	prefix = self:GetPrefix()
	local IFTP = IsFirstTimePredicted()
	
	if self.MeleeLogic and IsFirstTimePredicted() and self.dt.State != CW_CUSTOMIZE then
		self:MeleeAttack(self.SecondaryMeleeInTime, self.SecondaryMeleeOutTime, self.SecondaryMeleeAttackDamage, self.SecondaryMeleeAttackRange, self.SecondaryHitAABB, "_secondary")
		return
	end
	
	if self.DualWieldLogic then
		-- self:PrimaryAttack()
		return
	end
	
	if self.ShotgunReloadState != 0 then
		return
	end
	
	if self.ReloadDelay then
		return
	end
	
	if CurTime() < self.GlobalDelay then
		return false
	end
	
	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end
	
	if self.InactiveWeaponStates[self.dt.State] or (self.dt.State == CW_AIMING and self.HoldToAim) then
		return
	end
	
	if self:isNearWall() then
		return
	end
	
	local IFTP = IsFirstTimePredicted()
	
	if self.Owner:KeyDown(IN_USE) then
		if self.isGLAttached then
			if self.ToggleM203States[self.dt.State] then
				if self.dt.M203Active then
					self.dt.M203Active = false
				
					if CLIENT and IFTP then
						self:disableM203(IFTP)
					end
					
					if SERVER and SP then
						SendUserMessage("CW20_M203OFF", self.Owner)
					end
				else
					self.dt.M203Active = true
				
					if IFTP then
						if CLIENT then
							self:enableM203()
						end
					end
					
					if SERVER and SP then
						SendUserMessage("CW20_M203ON", self.Owner)
					end
				end
				
				self:delayEverything(0.6)
				
				return
			end
		end
	end
	
	if self.dt.M203Active then
		-- self:PrimaryAttack()
		return
	end
	
	if not self.Owner:OnGround() or Length(GetVelocity(self.Owner)) >= self.Owner:GetWalkSpeed() * self.RunStateVelocity then
		return
	end
	
	CT = CurTime()
	
	if self.dt.State ~= CW_AIMING then
		-- if self.dt.State == CW_IDLE then
			-- self:idleAnimFunc()
		-- end
		
		self.dt.State = CW_AIMING
		
		if self:filterPrediction() then
			self:EmitSound("CW_TAKEAIM")
		end
	else
		self.dt.State = CW_IDLE
		
		if self:filterPrediction() then
			self:EmitSound("CW_LOWERAIM")
		end
	end
	
	if IFTP then
		self.AimTime = UnPredictedCurTime() + 0.25
		
		if self.PreventQuickScoping then
			self.AddSpread = math.Clamp(self.AddSpread + self.QuickScopeSpreadIncrease, 0, self.MaxSpreadInc)
			self.SpreadWait = CT + 0.3
		end
	end
	
	if SP and SERVER then
		SendUserMessage("CW_AimTime", self.Owner)
	end
	
	self:SetNextSecondaryFire(CT + 0.1)
end

function SWEP:reloadM203()
	if SERVER and SP then
		SendUserMessage("CW20_RELOADM203", self.Owner)
	end
	
	if CLIENT then
		self:setM203Anim(self.M203Anims.reload)
	end
	
	self.isReloadingGL = true
	self:setGlobalDelay(self.ReloadTime_GL)
	
	CustomizableWeaponry.actionSequence.new(self, self.ReloadTime_GL, nil, function()
		if SERVER then
			self.Owner:RemoveAmmo(1, "40MM")
		end
		
		self.isReloadingGL = false
		self.M203Chamber = true
	end)
end

function SWEP:fireM203(firstTimePrediction)
	if SERVER and SP then
		SendUserMessage("CW20_FIREM203", self.Owner)
	end
	
	if firstTimePrediction then
		local target = CustomizableWeaponry.grenadeTypes.registered[self.Grenade40MM]
		
		if not target then
			if SERVER then
				local pos = self.Owner:GetShootPos()
				local eyeAng = self.Owner:EyeAngles()
				local forward = eyeAng:Forward()
				local offset = forward * 30 + eyeAng:Right() * 4 - eyeAng:Up() * 3
				
				local nade = ents.Create("cw_blackops3_40mm_explosive")
				nade:SetPos(pos + offset)
				nade:SetAngles(eyeAng)
				nade:Spawn()
				nade:Activate()
				nade:SetOwner(self.Owner)
				local phys = nade:GetPhysicsObject()
				
				if IsValid(phys) then
					phys:SetVelocity(forward * 2996)
				end
			end
		else
			target.fireFunc(self)
		end
		
		CustomizableWeaponry.grenadeTypes.selectFireSound(self, target)
	end
	
	self.dt.State = CW_IDLE
	
	self.Owner:ViewPunch(Angle(math.Rand(-5, -4), math.Rand(-2, 2), math.Rand(-1, 1)))
	
	self.M203Chamber = false
	
	if CLIENT then
		prefix = self:GetPrefix()
		
		self:makeVMRecoil(5)
		self:sendWeaponAnim(prefix .. "fire")
		
		local VM = self.AttachmentModelsVM.h1_att_gl.ent
		local WM = self.AttachmentModelsWM.h1_att_gl.ent
		local attVM = VM:LookupAttachment("muzzle_gl")
		local attWM = WM:LookupAttachment("muzzle_gl")
		if VM and attVM then
			ParticleEffectAttach("muzzleflash_m79", PATTACH_POINT_FOLLOW, VM, attVM)
		end
		
		if WM and attWM then
			ParticleEffectAttach("muzzleflash_m79", PATTACH_POINT_FOLLOW, WM, attWM)
		end
	end
	
	self:delayEverything(0.4)
	self:setGlobalDelay(0.4)
end

function SWEP:enableM203()
	prefix = "gl_"

	self:sendWeaponAnim(prefix .. "change")
end

function SWEP:disableM203(firstTimePrediction)
	prefix = "glsetup_"

	self:sendWeaponAnim(prefix .. "change")
	
	if firstTimePrediction then
		self.M203Time = UnPredictedCurTime() + 0.25
	end
end

function SWEP:OnDrop()
	self.FirstDeploy = true
	self.isFirstMagUsed = true
	self.dt.State = CW_IDLE
	self.dt.HolsterDelay = 0
end

function SWEP:GetDeployTime()
	prefix = self:GetPrefix()

	if self.FirstDeploy and self.Animations[prefix .. "draw_first"] then
		return self.FirstDeployTime
	else
		return self.DeployTime
	end
end

function SWEP:Deploy()
	self.holsterSound = true
	self.dt.State = CW_IDLE
	self.dt.HolsterDelay = 0
	CT = CurTime()
	
	local cwaa = self.ActiveAttachments
	prefix = self:GetPrefix()
	local deployTime = CT + self:GetDeployTime() / self.DrawSpeed

	self:SetNextSecondaryFire(deployTime)
	self:SetNextPrimaryFire(deployTime)
	self.ReloadWait = deployTime
	self.HolsterWait = deployTime
	
	if IsFirstTimePredicted() then
		if CLIENT then
			self.CurSoundTable = nil
			self.CurSoundEntry = nil
			self.SoundTime = nil
			self.SoundSpeed = 1
		end		
		-- first draw
		self:drawAnimFunc()
	end
	
	self.FirstDeploy = false
	
	if (SP and SERVER) then
		SendUserMessage("CW20_DEPLOY", self.Owner)
	end
	
	-- if self.dt.M203Active then
		-- if SERVER and SP then
			-- SendUserMessage("CW20_M203OFF", self.Owner)
		-- end
		
		-- if CLIENT then
			-- self:resetM203Anim()
		-- end
	-- end
	
	if CLIENT then
		self.lastEyeAngle = self.Owner:EyeAngles()
	end
	
	CustomizableWeaponry.callbacks.processCategory(self, "deployWeapon")
	
	self.SwitchWep = nil
	-- self.dt.M203Active = false
	
	return true
end

function SWEP:Holster(wep)
	-- can't switch if neither the weapon we want to switch to or the wep we're trying to switch to are not valid
	if not IsValid(wep) and not IsValid(self.SwitchWep) then
		self.SwitchWep = nil
		return false
	end
	
	CT = CurTime()
	
	-- can't holster if we have a global delay on the weapon
	if CT < self.GlobalDelay or CT < self.HolsterWait then
		return false
	end
	
	if self.dt.HolsterDelay ~= 0 and CT < self.dt.HolsterDelay then
		return false
	end
	
	-- can't holster if there are sequenced actions
	if #self._activeSequences > 0 then
		return false
	end
	
	if self.ReloadDelay then
		return false
	end
	
	if self.dt.State ~= CW_HOLSTER_START then
		self.dt.HolsterDelay = CurTime() + self.HolsterTime
	end
	
	self.dt.State = CW_HOLSTER_START
	
	-- if holster sequence is over, let us select the desired weapon
	if self.SwitchWep and self.dt.State == CW_HOLSTER_START and CurTime() > self.dt.HolsterDelay then
		self.dt.State = CW_IDLE
		self.dt.HolsterDelay = 0
		
		return true
	end
	
	-- if it isn't, make preparations for it
	self.ShotgunReloadState = 0
	self.ReloadDelay = nil
	
	if self:filterPrediction() then
		if self.holsterSound then -- quick'n'dirty prediction fix
			self:EmitSound("CW_HOLSTER", 70, 100)
			self.holsterSound = false
			
			if IsFirstTimePredicted() then
				if self.holsterAnimFunc then
					self:holsterAnimFunc()
				else
					if self.Animations.holster then
						self:sendWeaponAnim("holster")
					end
				end
			end
		end
	end
	
	self.SwitchWep = wep
	self.SuppressTime = nil
	
	-- if self.dt.M203Active then
		-- if SERVER and SP then
			-- SendUserMessage("CW20_M203OFF", self.Owner)
		-- end
		
		-- if CLIENT then
			-- self:resetM203Anim()
		-- end
	-- end

	-- self.dt.M203Active = false
end

function SWEP:Reload()
	prefix = self:GetPrefix()
	CT = CurTime()
	
	if self.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	end
	
	if self.ReloadDelay or CT < self.ReloadWait or self.dt.State == CW_ACTION or self.ShotgunReloadState != 0 then
		return
	end
	
	if CT < self.GlobalDelay then
		return
	end
	
	if self.FiremodesEnabled and self.Owner:KeyDown(IN_USE) and self.dt.State != CW_RUNNING then
		self:CycleFiremodes()
		return
	end	
	
	if self.dt.M203Active then
		if not self.M203Chamber and self.Owner:GetAmmoCount("40MM") > 0 then
			if IsFirstTimePredicted() then
				self:reloadM203()
			end
			
			self.dt.State = CW_IDLE
			return
		end
	end
	
	mag = self:Clip1()
	
	local cantReload, overrideMagCheck, overrideAmmoCheck = CustomizableWeaponry.callbacks.processCategory(self, "canReload", mag == 0)
	
	if cantReload then
		return
	end
	
	if not overrideMagCheck then
		if (self.Chamberable and mag >= self.Primary.ClipSize_Orig + 1) then
			return
		end
	end
	
	if not overrideAmmoCheck then
		if self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
			return
		end
	end
	
	if not self.Chamberable and mag >= self.Primary.ClipSize then
		return
	end
	
	if self.dt.M203Active then
		if SERVER and SP then
			SendUserMessage("CW20_M203OFF_RELOAD", self.Owner)
		end
		
		if CLIENT then
			self:resetM203Anim()
		end
	end
	
	self.dt.State = CW_IDLE
	self.dt.M203Active = false
	
	self:beginReload()
end

function SWEP:beginReload()
	local cwaa = self.ActiveAttachments
	prefix = self:GetPrefix()
	local speed = self.FastMagReloadSpeed or self.ReloadSpeed
	-- local cycle = self.FirstInsertBulletDuration
	
	CT = CurTime()	
	mag = self:Clip1()
	
	if self.ShotgunReload then
		local time, reloadtime
		if cwaa.bg_blackops3_fast_mag then
			if self.ReloadStartTime_Fast then
				time = CT + self.ReloadStartTime_Fast / self.ReloadSpeed
			else
				time = CT + self.ReloadStartTime / self.ReloadSpeed
			end
			self:sendWeaponAnim(prefix .. "reload_in_dm", self.ReloadSpeed)
		else
			time = CT + self.ReloadStartTime / self.ReloadSpeed
			self:sendWeaponAnim(prefix .. "reload_in", self.ReloadSpeed)
		end
		
		self.WasEmpty = mag == 0
		self.ReloadDelay = time
		self:SetNextPrimaryFire(time)
		self:SetNextSecondaryFire(time)
		self.GlobalDelay = time
		self.ShotgunReloadState = 1
		self.ForcedReloadStop = false
		-- self.IsBulletInserted = false
		-- self.firstInsertBulletTime = CT + (self.ReloadStartTime_Fast or self.ReloadStartTime) * cycle / speed
	else
		if cwaa.bg_blackops3_fast_mag then
			if self.DualMagLogic then
				if self.isFirstMagUsed then
					self.isFirstMagUsed = false
				else
					self.isFirstMagUsed = true
				end
			else
				self.isFirstMagUsed = true
			end
		end
	
		local reloadTime = nil
		local reloadHalt = nil
		
		if cwaa.bg_blackops3_fast_mag then
			if mag == 0 then
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig
				end
				
				reloadTime = self.ReloadTime_Empty_Fast
				reloadHalt = self.ReloadTime_Empty_Fast
			else
				reloadTime = self.ReloadTime_Fast
				reloadHalt = self.ReloadTime_Fast
				
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig + 1
				end
			end
		elseif cwaa.bg_blackops3_ext_mag then
			if mag == 0 then
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig
				end
				
				reloadTime = self.ReloadTime_Empty_Ext or self.ReloadTime_Empty
				reloadHalt = self.ReloadTime_Empty_Ext or self.ReloadTime_Empty
			else
				reloadTime = self.ReloadTime_Ext or self.ReloadTime
				reloadHalt = self.ReloadTime_Ext or self.ReloadTime
				
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig + 1
				end
			end
		else
			if mag == 0 then
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig
				end
				
				reloadTime = self.ReloadTime_Empty
				reloadHalt = self.ReloadTime_Empty
			else
				reloadTime = self.ReloadTime
				reloadHalt = self.ReloadTime
				
				if self.Chamberable then
					self.Primary.ClipSize = self.Primary.ClipSize_Orig + 1
				end
			end
		end
		
		-- reloadHalt has been deprecated
		
		reloadTime = reloadTime / self.ReloadSpeed
		reloadHalt = reloadHalt / self.ReloadSpeed
	
		self.ReloadDelay = CT + reloadTime
		self:SetNextPrimaryFire(CT + reloadHalt)
		self:SetNextSecondaryFire(CT + reloadHalt)
		self.GlobalDelay = CT + reloadHalt
		
		if self.reloadAnimFunc then
			self:reloadAnimFunc(mag)
		else
			if self.Animations.reload_empty and mag == 0 then
				self:sendWeaponAnim("reload_empty", self.ReloadSpeed)
			else
				self:sendWeaponAnim("reload", self.ReloadSpeed)
			end
		end
	end
	
	CustomizableWeaponry.callbacks.processCategory(self, "beginReload", mag == 0)
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
end