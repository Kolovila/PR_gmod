AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/RUAF/RUAF_Soldier_Sniper_Custom_Masked.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_RUAF"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = false, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = false
ENT.GrenadeAttackEntity = "obj_vj_he_rgd5"
ENT.GrenadeAttackThrowTime = 0.85
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
ENT.SoundTbl_Death = {"ruaf/1/death/vsrf_01_on_death_04_l.wav","ruaf/1/death/vsrf_01_on_death_03_l.wav","ruaf/1/death/vsrf_01_on_death_02_l.wav","ruaf/1/death/vsrf_01_on_death_01_l.wav","ruaf/1/death/vsrf_01_on_agony_12_l.wav","ruaf/1/death/vsrf_01_on_agony_11_l.wav","ruaf/1/death/vsrf_01_on_agony_10_l.wav","ruaf/1/death/vsrf_01_on_agony_09_l.wav","ruaf/1/death/vsrf_01_on_agony_08_l.wav","ruaf/1/death/vsrf_01_on_agony_07_l.wav","ruaf/1/death/vsrf_01_on_agony_06_l.wav","ruaf/1/death/vsrf_01_on_agony_05_l.wav","ruaf/1/death/vsrf_01_on_agony_04_l.wav","ruaf/1/death/vsrf_01_on_agony_03_l.wav","ruaf/1/death/vsrf_01_on_agony_02_l.wav","ruaf/1/death/vsrf_01_on_agony_01_l.wav","ruaf/2/death/vsrf_02_on_death_06_l.wav","ruaf/2/death/vsrf_02_on_death_05_l.wav","ruaf/2/death/vsrf_02_on_death_04_l.wav","ruaf/2/death/vsrf_02_on_death_03_l.wav","ruaf/2/death/vsrf_02_on_death_02_l.wav","ruaf/2/death/vsrf_02_on_death_01_l.wav","ruaf/2/death/vsrf_02_on_agony_07_l.wav","ruaf/2/death/vsrf_02_on_agony_06_l.wav","ruaf/2/death/vsrf_02_on_agony_05_l.wav","ruaf/2/death/vsrf_02_on_agony_04_l.wav","ruaf/2/death/vsrf_02_on_agony_03_l.wav","ruaf/2/death/vsrf_02_on_agony_02_l.wav","ruaf/2/death/vsrf_02_on_agony_01_l.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 1 ) else
	if randomarmour == 1 then self:SetBodygroup( 1,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end			
    end		
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
    end	
 local randomarmour = math.random(4)
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
 local randomarmour = math.random(3)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end		
	if randomarmour == 2 then self:SetBodygroup( 7,2 ) end		
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end				
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