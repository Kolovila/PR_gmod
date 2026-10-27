AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "RPG-7"
SWEP.Author = "KostDRS"
SWEP.Category = "VJ Base"

SWEP.WorldModel = "models/Weapons/w_rpg-7_tr.mdl"
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-8,2,-183)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.5,-16.5,1.3)
SWEP.HoldType = "ar2"

SWEP.MadeForNPCsOnly = true
SWEP.NPC_NextPrimaryFire = 3
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_BulletSpawnAttachment = "missile"
SWEP.NPC_FiringDistanceScale = 2.5
SWEP.NPC_StandingOnly = true

SWEP.Primary.Damage = 100
SWEP.Primary.Force = 5
SWEP.Primary.ClipSize = 1
SWEP.Primary.Recoil = 0.6
SWEP.Primary.Delay = 0.3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "RPG_Round"
SWEP.Primary.Sound = "weapons/rpg/rpg7_shot.ogg"
SWEP.Primary.DistantSound = "weapons/rpg26/rpg26_shot_distant.wav"
SWEP.Primary.DisableBulletCode = true
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_SpawnShells = false

SWEP.Reload_TimeUntilAmmoIsSet	= 2.5
SWEP.Reload_TimeUntilFinished	= 2.5
SWEP.NPC_ReloadSound			= {"vj_base/weapons/reload_rpg.wav"} 
SWEP.NPC_ReloadSoundLevel		= 65
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
	if status == "Init" then
		if CLIENT then return end
		local owner = self:GetOwner()
		local projectile = ents.Create("obj_vj_rpg7_rocket")
		local spawnPos = self:GetBulletPos()
		if owner:IsPlayer() then
			local plyAng = owner:GetAimVector():Angle()
			projectile:SetPos(owner:GetShootPos() + plyAng:Forward()*-20 + plyAng:Up()*-9 + plyAng:Right()*10)
			owner:GetViewModel():SetBodygroup(1, 1)
		else
			projectile:SetPos(spawnPos)
		end
		projectile:SetOwner(owner)
		projectile:Activate()
		projectile:Spawn()
		
		local phys = projectile:GetPhysicsObject()
		if IsValid(phys) then
			if owner.IsVJBaseSNPC then
				phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Line", spawnPos, 1, 2500))
			elseif owner:IsPlayer() then
				phys:SetVelocity(owner:GetAimVector() * 2500)
			else
				phys:SetVelocity(VJ.CalculateTrajectory(owner, owner:GetEnemy(), "Line", spawnPos, owner:GetEnemy():GetPos() + owner:GetEnemy():OBBCenter(), 2500))
			end
			projectile:SetAngles(projectile:GetVelocity():GetNormal():Angle())
		end
		
		self:SetBodygroup(1, 1)
	end
end
function SWEP:OnReload(status)
	if status == "Finish" then
		self:SetBodygroup(1, 0)
		
		local owner = self:GetOwner()
		if IsValid(owner) && owner:IsPlayer() then
			owner:GetViewModel():SetBodygroup(1, 0)
		end
	end
end