if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAGTERROR Military Rifle"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true
SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_dmg_m16ag.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_m16_acog.mdl"
SWEP.HoldType 					= "ar2"
SWEP.ViewModelFlip				= true -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 0.4 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.1 -- How much time until the bullet/projectile is fired?
SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2} -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"senm4/reload.mp3"} -- Sounds it plays when the base detects the SNPC playing a reload animation
--SWEP.NPC_CustomSpread	 		= 2
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 11 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"senm4/shot2.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"senm4/shot3.wav"}
SWEP.Primary.DistantSoundVolume	= 0.25 -- Distant sound volume
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_RifleShell1"
SWEP.Primary.Automatic			= false -- Is it automatic?

function SWEP:CustomOnInitialize()
if self.Owner:IsPlayer() then
end
self.Owner.AnimTbl_Walk = {ACT_WALK_RIFLE}
self.Owner.AnimTbl_Run = {ACT_RUN_RIFLE}
self.Owner.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
self.Owner.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
self.Owner.AnimTbl_ShootWhileMovingRun = {ACT_RUN_AIM_RIFLE} 
self.Owner.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_AIM_RIFLE}
self.Owner.AnimTbl_WeaponReload = {ACT_RELOAD_SMG1}
self.Owner.AnimTbl_WeaponReloadBehindCover = {ACT_RELOAD_SMG1_LOW}
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