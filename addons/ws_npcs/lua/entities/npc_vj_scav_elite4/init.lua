AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Raiders/Elite_Raider_Masked_Custom5.mdl","models/Raiders/Elite_Raider_Masked_Custom6.mdl","models/Raiders/Elite_Raider_Custom1.mdl","models/Raiders/Elite_Raider_Custom2.mdl","models/Raiders/Elite_Raider_Custom3.mdl","models/Raiders/Elite_Raider_Custom4.mdl","models/Raiders/Elite_Raider_Masked_Custom1.mdl","models/Raiders/Elite_Raider_Masked_Custom2.mdl","models/Raiders/Elite_Raider_Masked_Custom3.mdl","models/Raiders/Elite_Raider_Masked_Custom4.mdl"}
ENT.StartHealth = 130
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_RAIDER"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = true, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_he_f1"
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
ENT.SoundTbl_Alert = {"scav/2/alert/scav2_enemy_contact_27_bl.wav","scav/2/alert/scav2_enemy_contact_26_bl.wav","scav/2/alert/scav2_enemy_contact_25_bl.wav","scav/2/alert/scav2_enemy_contact_24_bl.wav","scav/2/alert/scav2_enemy_contact_22_bl.wav","scav/2/alert/scav2_enemy_contact_19_l.wav","scav/2/alert/scav2_enemy_contact_18_l.wav","scav/2/alert/scav2_enemy_contact_16_l.wav","scav/2/alert/scav2_enemy_contact_15_l.wav","scav/2/alert/scav2_enemy_contact_14_l.wav","scav/2/alert/scav2_enemy_contact_13_l.wav","scav/2/alert/scav2_enemy_contact_12_l.wav","scav/2/alert/scav2_enemy_contact_11_l.wav","scav/2/alert/scav2_enemy_contact_09_l.wav","scav/2/alert/scav2_enemy_contact_08_l.wav","scav/2/alert/scav2_enemy_contact_07_l.wav","scav/2/alert/scav2_enemy_contact_05_l.wav","scav/2/alert/scav2_enemy_contact_04_l.wav","scav/2/alert/scav2_enemy_contact_03_l.wav","scav/2/alert/scav2_enemy_contact_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"scav/2/lostvisual/scav2_lostvisual_05_bl.wav","scav/2/lostvisual/scav2_lostvisual_04_bl.wav","scav/2/lostvisual/scav2_lostvisual_03_bl.wav","scav/2/lostvisual/scav2_lostvisual_03.wav","scav/2/lostvisual/scav2_lostvisual_02.wav","scav/2/lostvisual/scav2_lostvisual_01.wav"}
ENT.SoundTbl_CombatIdle = {"scav/2/combatidle/scav2_fight_12_bl.wav","scav/2/combatidle/scav2_fight_11_bl.wav","scav/2/combatidle/scav2_fight_10_bl.wav","scav/2/combatidle/scav2_fight_09_bl.wav","scav/2/combatidle/scav2_fight_08_bl.wav","scav/2/combatidle/scav2_fight_07_bl.wav","scav/2/combatidle/scav2_fight_06_l.wav","scav/2/combatidle/scav2_fight_05_l.wav","scav/2/combatidle/scav2_fight_04_l.wav","scav/2/combatidle/scav2_fight_03_l.wav","scav/2/combatidle/scav2_fight_02.wav","scav/2/combatidle/scav2_fight_01.wav"}
ENT.SoundTbl_WeaponReload = {"scav/2/reload/scav2_weap_reload_04_bl.wav","scav/2/reload/scav2_weap_reload_03_l.wav","scav/2/reload/scav2_weap_reload_02_l.wav","scav/2/reload/scav2_weap_reload_01_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"scav/2/enemygrenade/scav2_spreadout_05_bl.wav","scav/2/enemygrenade/scav2_spreadout_04_bl.wav","scav/2/enemygrenade/scav2_spreadout_03.wav","scav/2/enemygrenade/scav2_spreadout_02.wav","scav/2/enemygrenade/scav2_spreadout_01.wav","scav/2/enemygrenade/scav2_enemy_grenade_03_bl.wav","scav/2/enemygrenade/scav2_enemy_grenade_02.wav","scav/2/enemygrenade/scav2_enemy_grenade_01.wav"}
ENT.SoundTbl_OnKilledEnemy = {"scav/2/enemydown/scav2_enemy_down_18_bl.wav","scav/2/enemydown/scav2_enemy_down_17_bl.wav","scav/2/enemydown/scav2_enemy_down_16_bl.wav","scav/2/enemydown/scav2_enemy_down_15_bl.wav","scav/2/enemydown/scav2_enemy_down_14_bl.wav","scav/2/enemydown/scav2_enemy_down_13_bl.wav","scav/2/enemydown/scav2_enemy_down_12_bl.wav","scav/2/enemydown/scav2_enemy_down_11_bl.wav","scav/2/enemydown/scav2_enemy_down_10_bl.wav","scav/2/enemydown/scav2_enemy_down_09.wav","scav/2/enemydown/scav2_enemy_down_08.wav","scav/2/enemydown/scav2_enemy_down_07.wav","scav/2/enemydown/scav2_enemy_down_06.wav","scav/2/enemydown/scav2_enemy_down_05.wav","scav/2/enemydown/scav2_enemy_down_04.wav","scav/2/enemydown/scav2_enemy_down_03.wav","scav/2/enemydown/scav2_enemy_down_02.wav","scav/2/enemydown/scav2_enemy_down_01.wav"}
ENT.SoundTbl_Pain = {"scav/2/pain/scav2_hit_11.wav","scav/2/pain/scav2_hit_10.wav","scav/2/pain/scav2_hit_09.wav","scav/2/pain/scav2_hit_08.wav","scav/2/pain/scav2_hit_07.wav","scav/2/pain/scav2_hit_06.wav","scav/2/pain/scav2_hit_05.wav","scav/2/pain/scav2_hit_04.wav","scav/2/pain/scav2_hit_03.wav","scav/2/pain/scav2_hit_02.wav","scav/2/pain/scav2_hit_01.wav"}
ENT.SoundTbl_AllyDeath = {"scav/2/friendlydeath/scav2_friendly_down_04_bl.wav","scav/2/friendlydeath/scav2_friendly_down_03_bl.wav","scav/2/friendlydeath/scav2_friendly_down_02.wav","scav/2/friendlydeath/scav2_friendly_down_01.wav"}
ENT.SoundTbl_CallForHelp = {"scav/2/coverme/scav2_coverme_03_bl.wav","scav/2/coverme/scav2_coverme_02.wav","scav/2/coverme/scav2_coverme_01.wav"}
ENT.SoundTbl_GrenadeAttack = {"scav/2/grenade/scav2_grenade_02.wav","scav/2/grenade/scav2_grenade_01.wav"}
ENT.SoundTbl_Death = {"scav/2/death/scav2_death_10.wav","scav/2/death/scav2_death_09.wav","scav/2/death/scav2_death_08.wav","scav/2/death/scav2_death_07.wav","scav/2/death/scav2_death_06.wav","scav/2/death/scav2_death_05.wav","scav/2/death/scav2_death_04.wav","scav/2/death/scav2_death_03.wav","scav/2/death/scav2_death_02.wav","scav/2/death/scav2_death_01.wav","scav/2/death/scav2_agony_07_bl.wav","scav/2/death/scav2_agony_06_bl.wav","scav/2/death/scav2_agony_05_bl.wav","scav/2/death/scav2_agony_04_bl.wav","scav/2/death/scav2_agony_03.wav","scav/2/death/scav2_agony_02.wav","scav/2/death/scav2_agony_01.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 2,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 2,3 ) end		
    end	
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 3,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 3,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 3,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 3,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 3,6 ) end		
    end	
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 4,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 4,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 4,4 ) end			
	if randomarmour == 5 then self:SetBodygroup( 4,5 ) end			
    end
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end
	if randomarmour == 2 then self:SetBodygroup( 5,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 5,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 5,4 ) end		
    end		
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 6,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 6,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 6,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 6,5 ) end		
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
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 8,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 8,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 8,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 8,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 8,6 ) end		
    end		
 local randomarmour = math.random(10)
	if randomarmour == 0 then self:SetBodygroup( 9 ) else
	if randomarmour == 1 then self:SetBodygroup( 9,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 9,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 9,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 9,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 9,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 9,6 ) end		
	if randomarmour == 7 then self:SetBodygroup( 9,7 ) end		
    end			
 local randomarmour = math.random(8)
	if randomarmour == 0 then self:SetSkin ( 3 ) else
	if randomarmour == 1 then self:SetSkin ( 1 ) end		
	if randomarmour == 2 then self:SetSkin ( 2 ) end		
	if randomarmour == 3 then self:SetSkin ( 3 ) end	
	if randomarmour == 4 then self:SetSkin ( 4 ) end		
	if randomarmour == 5 then self:SetSkin ( 5 ) end		
	if randomarmour == 6 then self:SetSkin ( 6 ) end		
	if randomarmour == 7 then self:SetSkin ( 7 ) end		
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