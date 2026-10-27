if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAG Terrorist Shotgun"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1 -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"sendbarrel/reload.wav"}
--SWEP.NPC_CustomSpread	 		= 2
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= false -- Is tihs weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_double_barrel_shotgun.mdl"
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_doublebarrl.mdl"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.HoldType 					= "ar2"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 4 -- Damage
SWEP.Primary.Force				= 1 -- Force applied on the object the bullet hits
SWEP.Primary.NumberOfShots		= 12 -- How many shots per attack?
SWEP.Primary.ClipSize			= 2 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "Buckshot" -- Ammo type
SWEP.Primary.Sound				= {"sendbarrel/shot.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"sendbarrel/shot.wav"}
SWEP.Primary.DistantSoundVolume	= 0.25 -- Distant sound volume
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_ShotgunShell1"
SWEP.Primary.Delay				= 1

SWEP.Reload_TimeUntilAmmoIsSet	= 0.5 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 0.5 -- How much time until the player can play idle animation, shoot, etc.

function SWEP:CustomOnInitialize()
if self.Owner:IsPlayer() then
end
self.Owner.AnimTbl_Walk = {ACT_WALK_RIFLE}
self.Owner.AnimTbl_Run = {ACT_RUN_RIFLE}
self.Owner.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
self.Owner.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
self.Owner.AnimTbl_ShootWhileMovingRun = {ACT_RUN_AIM_RIFLE} 
self.Owner.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_AIM_RIFLE}
self.Owner.AnimTbl_WeaponReload = {ACT_RELOAD_SHOTGUN}
self.Owner.AnimTbl_WeaponReloadBehindCover = {ACT_RELOAD_SHOTGUN_LOW}
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 1

	if GetConVarNumber("vj_senwepaccuracy_custom") == 0 then
	self.NPC_CustomSpread = 0.1
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 1 then
	self.NPC_CustomSpread = 1
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 2 then
	self.NPC_CustomSpread = 2
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 3 then
	self.NPC_CustomSpread = 3
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 4 then
	self.NPC_CustomSpread = 4
	end

 end