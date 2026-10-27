AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Bear/Pmc_Bear_Sniper.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_BEAR"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = false, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = false
ENT.GrenadeAttackThrowTime = 0.85
ENT.GrenadeAttackModel = "models/Weapons/w_hand_grenade_f1.mdl"	
ENT.AnimTbl_GrenadeAttack = "vjges_gesture_item_throw"

ENT.AnimTbl_Medic_GiveHealth = "vjges_gesture_item_drop"
ENT.AnimTbl_CallForHelp = {"vjges_gesture_signal_group", "vjges_gesture_signal_forward"}
ENT.AnimTbl_DamageAllyResponse = "vjges_gesture_signal_halt"
ENT.Weapon_OcclusionDelay = false

ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.5

ENT.CanFlinch = true
ENT.FlinchCooldown = 1
ENT.AnimTbl_Flinch = {"vjges_flinch_01", "vjges_flinch_02"}
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = {"vjges_flinch_head_01", "vjges_flinch_head_02"}},
	{HitGroup = HITGROUP_CHEST, Animation = {"vjges_flinch_phys_01", "vjges_flinch_phys_02", "vjges_flinch_back_01"}},
	{HitGroup = HITGROUP_STOMACH, Animation = {"vjges_flinch_stomach_01", "vjges_flinch_stomach_02"}},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_flinch_shoulder_l"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_flinch_shoulder_r"}
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Death = {"bear/1/death/bear1_death7.wav","bear/1/death/bear1_death6.wav","bear/1/death/bear1_death5.wav","bear/1/death/bear1_death4.wav","bear/1/death/bear1_death3.wav","bear/1/death/bear1_death2.wav","bear/1/death/bear1_death1.wav","bear/1/death/bear1_agony4.wav","bear/1/death/bear1_agony3.wav","bear/1/death/bear1_agony2.wav","bear/1/death/bear1_agony1.wav","bear/3/death/bear3_death7.wav","bear/3/death/bear3_death6.wav","bear/3/death/bear3_death5.wav","bear/3/death/bear3_death4.wav","bear/3/death/bear3_death3.wav","bear/3/death/bear3_death2.wav","bear/3/death/bear3_death1.wav","bear/3/death/bear3_agony4.wav","bear/3/death/bear3_agony3.wav","bear/3/death/bear3_agony2.wav","bear/3/death/bear3_agony1.wav","bear/2/death/bear2_death8.wav","bear/2/death/bear2_death7.wav","bear/2/death/bear2_death6.wav","bear/2/death/bear2_death5.wav","bear/2/death/bear2_death4.wav","bear/2/death/bear2_death3.wav","bear/2/death/bear2_death2.wav","bear/2/death/bear2_death1.wav","bear/2/death/bear2_agony4.wav","bear/2/death/bear2_agony3.wav","bear/2/death/bear2_agony2.wav","bear/2/death/bear2_agony1.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end			
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end			
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end			
    end	
 local randomarmour = math.random(3)
	if randomarmour == 0 then self:SetBodygroup( 9 ) else
	if randomarmour == 1 then self:SetBodygroup( 9,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 9,2 ) end		
    end		
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetSkin ( 3 ) else
	if randomarmour == 1 then self:SetSkin ( 1 ) end		
	if randomarmour == 2 then self:SetSkin ( 2 ) end		
	if randomarmour == 3 then self:SetSkin ( 3 ) end	
    end				
end
----------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup) 
	if dmginfo:IsBulletDamage() then 
		if hitgroup == HITGROUP_HEAD then 
			dmginfo:SetDamage(dmginfo:GetDamage() * 2)
		end
	end
end
----------------------------------------------------------------------------------------------------