if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAG Terrorist Glock"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
if (CLIENT) then
SWEP.Slot						= 1 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 1 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.SwayScale 					= 4 -- Default is 1, The scale of the viewmodel sway
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= true -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 0.3 -- Next time it can use primary fire
SWEP.NPC_UsePistolBehavior 		= true
--SWEP.NPC_CustomSpread	 		= 2
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------

SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_glock.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "pistol" -- List of holdtypes are in the GMod wiki
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_dmg_glock.mdl"
SWEP.ViewModelFlip				= true -- Flip the model? Usally used for CS:S models
SWEP.MadeForNPCsOnly 			= true
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.Primary.Damage				= 11 -- Damage
SWEP.Primary.NumberOfShots		= 1 -- How many shots per attack?
SWEP.Primary.ClipSize			= 17 -- Max amount of bullets per clip
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Ammo				= "Pistol" -- Ammo type
SWEP.Primary.Sound				= "senglock/shot.wav"
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= "senglock/distant.mp3"
SWEP.Primary.DistantSoundVolume	= 0.75 -- Distant sound volume

SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_PistolShell1"
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_ReloadSound				= "senglock/reload.mp3"
SWEP.Reload_TimeUntilAmmoIsSet	= 2.25 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 3 -- How much time until the player can play idle animation, shoot, etc.

function SWEP:CustomOnInitialize()
if self.Owner:IsPlayer() then
end
self.Owner.AnimTbl_Walk = {ACT_WALK_PISTOL}
self.Owner.AnimTbl_Run = {ACT_RUN_PISTOL}
self.Owner.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_PISTOL}
self.Owner.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_PISTOL_LOW}
self.Owner.AnimTbl_ShootWhileMovingRun = {ACT_RUN_AIM_PISTOL} 
self.Owner.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_AIM_PISTOL}
self.Owner.AnimTbl_WeaponReload = {ACT_RELOAD_PISTOL}
self.Owner.AnimTbl_WeaponReloadBehindCover = {ACT_RELOAD_PISTOL_LOW}
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