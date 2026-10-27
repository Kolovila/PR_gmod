AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")


if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Chinalake"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add( "cw_aron_bo_chinalake", "aron_icons/chinalake", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("aron_icons/chinalake")
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 1.4
	SWEP.ReloadViewBobEnabled = true
	SWEP.ZoomAmount = 0
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/chinalake/w_aron_chinalake.mdl"
	SWEP.WMPos = Vector(-8, -1, 2.2)
	SWEP.WMAng = Vector(-13, 90, 180)
	
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
		

	SWEP.IronsightPos = Vector(-3.58, -5, 0.521)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(3.25, -3.033, -3.06)
    SWEP.SprintAng = Vector(-14.363, 49.747, -26.667)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)
	
SWEP.AttachmentModelsVM = 	{
}

SWEP.Attachments = {}

	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.017
	
	SWEP.AttachmentModelsVM = {
}

end

SWEP.ADSFireAnim = true

function SWEP:FireBullet()
	if SERVER then
		
		CustomizableWeaponry.actionSequence.new(self, 0, nil, function()
			local pos = self.Owner:GetShootPos()
			local eyeAng = self.Owner:EyeAngles()
			
			local fwdAng = eyeAng
			fwdAng:RotateAroundAxis(fwdAng:Right(), 0)
			local forward = fwdAng:Forward()
			
			local offset = eyeAng:Right() * 0 - eyeAng:Up() * 0
			
			local nade = ents.Create("cw_aron_40mm_explosive")
			nade:SetPos(pos + offset)
			nade:SetAngles(fwdAng)
			nade:Spawn()
			nade:Activate()
			nade:SetOwner(self.Owner)
			
			local phys = nade:GetPhysicsObject()
			
			if IsValid(phys) then
				phys:SetVelocity(forward * 7500)
			end
		end)
	end
end

	SWEP.Animations = {fire = {"fire"},
	reload_start = "reload_start",
	insert = "reload_loop",
	reload_end = "reload_end",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {

	reload_loop = {{time = 0.3, sound = "my_weapons/bo_chinalake/insert2.wav"}},
	
	reload_start = {{time = 0.15, sound = "my_weapons/bo_chinalake/back.wav"}},
	
	reload_end = {{time = 0.2, sound = "my_weapons/bo_chinalake/forward.wav"},
	{time = 0.4, sound = "my_weapons/bo_generic_2.wav"}},
	
	fire = {{time = 1.45, sound = "my_weapons/bo_chinalake/back.wav"},
	{time = 2, sound = "my_weapons/bo_chinalake/forward.wav"}},
	
	draw = {{time = 0.1, sound = "my_weapons/bo_chinalake/sights.wav"},
	{time = 0.6, sound = "my_weapons/bo_chinalake/back.wav"},
	{time = 0.8, sound = "my_weapons/bo_chinalake/forward.wav"},
	{time = 1, sound = "my_weapons/bo_generic2.wav"}}}
	
SWEP.SpeedDec = 20

SWEP.InvertShellEjectAngle = true

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= "Blow up those damn Commies"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/chinalake/v_aron_chinalake.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/chinalake/w_aron_chinalake.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ViewbobEnabled = true
SWEP.ViewbobIntensity = 1

SWEP.Primary.ClipSize		= 4
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "40mm"

SWEP.FireDelay = 3
SWEP.FireSound = "BO_ARON_CHINALAKE_FIRE"
SWEP.FireSoundSuppressed = "BO_ARON_CHINALAKE_SILENCER"
SWEP.Recoil = 8

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.0
SWEP.VelocitySensitivity = 1.
SWEP.MaxSpreadInc = 0.15
SWEP.ClumpSpread = 0.0
SWEP.SpreadPerShot = 0.0
SWEP.SpreadCooldown = 1
SWEP.Shots = 1
SWEP.Damage = 160
SWEP.DeployTime = 1.5

SWEP.ReloadStartTime = 1
SWEP.InsertShellTime = 0.84
SWEP.ReloadFinishWait = 1
SWEP.ShotgunReload = true
SWEP.SnapToIdlePostReload = true
SWEP.ViewModelMovementScale = 1

SWEP.Chamberable = false