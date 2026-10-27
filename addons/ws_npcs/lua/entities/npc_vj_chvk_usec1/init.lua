AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Usec/Pmc_Usec_Custom1.mdl","models/Usec/Pmc_Usec_Custom2.mdl","models/Usec/Pmc_Usec_Custom_Masked1.mdl","models/Usec/Pmc_Usec_Custom_Masked2.mdl","models/Usec/Pmc_Usec_Custom_Masked3.mdl","models/Usec/Pmc_Usec_Custom3.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_USEC"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = false, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_he_m67"
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
ENT.SoundTbl_Alert = {"usec/2/alert/usec2_enemy_contact_01_bl_n.wav","usec/2/alert/usec2_enemy_contact_04_bl_l.wav","usec/2/alert/usec2_enemy_contact_03_bl_l.wav","usec/2/alert/usec2_enemy_contact_02_bl_n.wav"}
ENT.SoundTbl_Suppressing = {"usec/2/supressing/usec2_supressingfire_02_bl_l.wav","usec/2/supressing/usec2_supressingfire_01_bl_l.wav"}
ENT.SoundTbl_LostEnemy = {"usec/2/lostvisual/usec2_lostvisual_05_bl.wav","usec/2/lostvisual/usec2_lostvisual_04_bl.wav","usec/2/lostvisual/usec2_lostvisual_03_bl.wav","usec/2/lostvisual/usec2_lostvisual_02_bl.wav","usec/2/lostvisual/usec2_lostvisual_01_bl.wav"}
ENT.SoundTbl_CombatIdle = {"usec/2/combatidle/usec2_fight9_l.wav","usec/2/combatidle/usec2_fight8_l.wav","usec/2/combatidle/usec2_fight7_l.wav","usec/2/combatidle/usec2_fight6_l.wav","usec/2/combatidle/usec2_fight69_bl_l.wav","usec/2/combatidle/usec2_fight68_bl_l.wav","usec/2/combatidle/usec2_fight67_bl_l.wav","usec/2/combatidle/usec2_fight66_bl_l.wav","usec/2/combatidle/usec2_fight65_bl_l.wav","usec/2/combatidle/usec2_fight64_bl_l.wav","usec/2/combatidle/usec2_fight63_bl_l.wav","usec/2/combatidle/usec2_fight62_bl_l.wav","usec/2/combatidle/usec2_fight61_bl_l.wav","usec/2/combatidle/usec2_fight60_bl_l.wav","usec/2/combatidle/usec2_fight5_l.wav","usec/2/combatidle/usec2_fight59_bl_l.wav","usec/2/combatidle/usec2_fight58_bl_l.wav","usec/2/combatidle/usec2_fight57_bl_l.wav","usec/2/combatidle/usec2_fight56_bl_l.wav","usec/2/combatidle/usec2_fight55_bl_l.wav","usec/2/combatidle/usec2_fight54_bl_l.wav","usec/2/combatidle/usec2_fight53_bl_l.wav","usec/2/combatidle/usec2_fight52_bl_l.wav","usec/2/combatidle/usec2_fight51_bl_l.wav","usec/2/combatidle/usec2_fight4_l.wav","usec/2/combatidle/usec2_fight49_bl_l.wav","usec/2/combatidle/usec2_fight48_bl_l.wav","usec/2/combatidle/usec2_fight47_bl_l.wav","usec/2/combatidle/usec2_fight46_bl_l.wav","usec/2/combatidle/usec2_fight45_bl_l.wav","usec/2/combatidle/usec2_fight44_bl_l.wav","usec/2/combatidle/usec2_fight43_bl_l.wav","usec/2/combatidle/usec2_fight42_bl_l.wav","usec/2/combatidle/usec2_fight41_l.wav","usec/2/combatidle/usec2_fight3_l.wav","usec/2/combatidle/usec2_fight38_l.wav","usec/2/combatidle/usec2_fight37_l.wav","usec/2/combatidle/usec2_fight36_l.wav","usec/2/combatidle/usec2_fight35_l.wav","usec/2/combatidle/usec2_fight34_l.wav","usec/2/combatidle/usec2_fight33_l.wav","usec/2/combatidle/usec2_fight32_l.wav","usec/2/combatidle/usec2_fight31_l.wav","usec/2/combatidle/usec2_fight30_l.wav","usec/2/combatidle/usec2_fight2_l.wav","usec/2/combatidle/usec2_fight29_l.wav","usec/2/combatidle/usec2_fight28_l.wav","usec/2/combatidle/usec2_fight27_l.wav","usec/2/combatidle/usec2_fight26_l.wav","usec/2/combatidle/usec2_fight25_l.wav","usec/2/combatidle/usec2_fight24_l.wav","usec/2/combatidle/usec2_fight23_l.wav","usec/2/combatidle/usec2_fight22_l.wav","usec/2/combatidle/usec2_fight21_l.wav","usec/2/combatidle/usec2_fight20_l.wav","usec/2/combatidle/usec2_fight1_l.wav","usec/2/combatidle/usec2_fight19_l.wav","usec/2/combatidle/usec2_fight18_l.wav","usec/2/combatidle/usec2_fight17_l.wav","usec/2/combatidle/usec2_fight16_l.wav","usec/2/combatidle/usec2_fight15_l.wav","usec/2/combatidle/usec2_fight14_l.wav","usec/2/combatidle/usec2_fight13_l.wav","usec/2/combatidle/usec2_fight12_l.wav","usec/2/combatidle/usec2_fight11_l.wav","usec/2/combatidle/usec2_fight10_l.wav"}
ENT.SoundTbl_WeaponReload = {"usec/2/reload/usec2_weap_reload_03_bl_l.wav","usec/2/reload/usec2_weap_reload_02_bl_l.wav","usec/2/reload/usec2_weap_reload_01_bl_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"usec/2/enemygrenade/usec2_enemy_grenade_02_bl_l.wav","usec/2/enemygrenade/usec2_enemy_grenade_01_bl_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"usec/2/enemydown/usec2_enemy_down_03_bl_n.wav","usec/2/enemydown/usec2_enemy_down_01_bl_n.wav","usec/2/enemydown/usec2_enemy_down_02_bl_n.wav"}
ENT.SoundTbl_Pain = {"usec/2/pain/usec2_hit6.wav","usec/2/pain/usec2_hit5.wav","usec/2/pain/usec2_hit4.wav","usec/2/pain/usec2_hit3.wav","usec/2/pain/usec2_hit2.wav","usec/2/pain/usec2_hit1.wav"}
ENT.SoundTbl_AllyDeath = {"usec/2/friendlydeath/usec2_friendly_down_01_bl_n.wav"}
ENT.SoundTbl_CallForHelp = {"usec/2/coverme/usec2_needhelp_02_bl_l.wav","usec/2/coverme/usec2_needhelp_01_bl_l.wav","usec/2/coverme/usec2_coverme_2_bl_l.wav","usec/2/coverme/usec2_coverme_1_bl_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"usec/2/grenade/usec2_grenade_01_bl_l.wav","usec/2/grenade/usec2_grenade_02_bl_l.wav"}
ENT.SoundTbl_Death = {"usec/2/death/usec2_death8.wav","usec/2/death/usec2_death7.wav","usec/2/death/usec2_death6.wav","usec/2/death/usec2_death5.wav","usec/2/death/usec2_death4.wav","usec/2/death/usec2_death3.wav","usec/2/death/usec2_death2.wav","usec/2/death/usec2_death1.wav","usec/2/death/usec2_agony4.wav","usec/2/death/usec2_agony3.wav","usec/2/death/usec2_agony2.wav","usec/2/death/usec2_agony1.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 1 ) else
	if randomarmour == 1 then self:SetBodygroup( 1,1 ) end		
	if randomarmour == 2 then self:SetBodygroup( 1,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 1,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 1,4 ) end		
    end	
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 2,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 2,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 2,4 ) end			
    end				
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 3,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 3,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 3,4 ) end	
	if randomarmour == 5 then self:SetBodygroup( 3,5 ) end		
    end		
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 4,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 4,3 ) end		
    end		
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 5,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 5,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 5,4 ) end
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 6,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 6,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 6,4 ) end		
    end		
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end		
	if randomarmour == 2 then self:SetBodygroup( 7,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 7,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 7,4 ) end	
	if randomarmour == 5 then self:SetBodygroup( 7,5 ) end	
	if randomarmour == 6 then self:SetBodygroup( 7,6 ) end		
    end			
 local randomarmour = math.random(9)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 8,2 ) end			
	if randomarmour == 3 then self:SetBodygroup( 8,3 ) end			
	if randomarmour == 4 then self:SetBodygroup( 8,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 8,5 ) end	
	if randomarmour == 6 then self:SetBodygroup( 8,6 ) end	
	if randomarmour == 7 then self:SetBodygroup( 8,7 ) end		
    end			
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 11 ) else
	if randomarmour == 1 then self:SetBodygroup( 11,1 ) end		
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 12 ) else
	if randomarmour == 1 then self:SetBodygroup( 12,1 ) end		
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 13 ) else
	if randomarmour == 1 then self:SetBodygroup( 13,1 ) end		
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