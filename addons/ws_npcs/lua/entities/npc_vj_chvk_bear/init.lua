AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Bear/Pmc_Bear_Custom1.mdl","models/Bear/Pmc_Bear_Custom2.mdl","models/Bear/Pmc_Bear_Custom_Masked1.mdl","models/Bear/Pmc_Bear_Custom_Masked2.mdl","models/Bear/Pmc_Bear_Custom3.mdl","models/Bear/Pmc_Bear_Custom_Masked3.mdl"}
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

ENT.HasGrenadeAttack = true
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
ENT.SoundTbl_Alert = {"bear/1/alert/bear1_enemy_contact10_bl_l.wav","bear/1/alert/bear1_enemy_usec6_bl_l.wav","bear/1/alert/bear1_enemy_usec5_bl_l.wav","bear/1/alert/bear1_enemy_usec4_l.wav","bear/1/alert/bear1_enemy_usec3_l.wav","bear/1/alert/bear1_enemy_usec2_l.wav","bear/1/alert/bear1_enemy_usec1_l.wav","bear/1/alert/bear1_enemy_contact9_l.wav","bear/1/alert/bear1_enemy_contact8_l.wav","bear/1/alert/bear1_enemy_contact7_l.wav","bear/1/alert/bear1_enemy_contact6_l.wav","bear/1/alert/bear1_enemy_contact5_l.wav","bear/1/alert/bear1_enemy_contact4_l.wav","bear/1/alert/bear1_enemy_contact3_l.wav","bear/1/alert/bear1_enemy_contact2_l.wav","bear/1/alert/bear1_enemy_contact13_bl_l.wav","bear/1/alert/bear1_enemy_contact12_bl_l.wav","bear/1/alert/bear1_enemy_contact11_bl_l.wav"}
ENT.SoundTbl_Suppressing = {"bear/1/supressing/bear1_supressingfire_02_l.wav","bear/1/supressing/bear1_supressingfire_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"bear/1/lostvisual/bear1_lostvisual_11_bl.wav","bear/1/lostvisual/bear1_lostvisual_10_bl.wav","bear/1/lostvisual/bear1_lostvisual_09_bl.wav","bear/1/lostvisual/bear1_lostvisual_08_l.wav","bear/1/lostvisual/bear1_lostvisual_07_l.wav","bear/1/lostvisual/bear1_lostvisual_06_l.wav","bear/1/lostvisual/bear1_lostvisual_05_l.wav","bear/1/lostvisual/bear1_lostvisual_04_l.wav","bear/1/lostvisual/bear1_lostvisual_03_l.wav","bear/1/lostvisual/bear1_lostvisual_02_l.wav","bear/1/lostvisual/bear1_lostvisual_01_l.wav"}
ENT.SoundTbl_CombatIdle = {"bear/1/combatidle/bear1_fight9_l.wav","bear/1/combatidle/bear1_fight8_l.wav","bear/1/combatidle/bear1_fight7_l.wav","bear/1/combatidle/bear1_fight6_l.wav","bear/1/combatidle/bear1_fight5_l.wav","bear/1/combatidle/bear1_fight4_l.wav","bear/1/combatidle/bear1_fight47_bl_l.wav","bear/1/combatidle/bear1_fight46_bl_l.wav","bear/1/combatidle/bear1_fight45_bl_l.wav","bear/1/combatidle/bear1_fight44_bl_l.wav","bear/1/combatidle/bear1_fight43_bl_l.wav","bear/1/combatidle/bear1_fight42_bl_l.wav","bear/1/combatidle/bear1_fight41_bl_l.wav","bear/1/combatidle/bear1_fight40_bl_l.wav","bear/1/combatidle/bear1_fight3_l.wav","bear/1/combatidle/bear1_fight39_bl_l.wav","bear/1/combatidle/bear1_fight38_bl_l.wav","bear/1/combatidle/bear1_fight37_bl_l.wav","bear/1/combatidle/bear1_fight36_bl_l.wav","bear/1/combatidle/bear1_fight35_bl_l.wav","bear/1/combatidle/bear1_fight34_bl_l.wav","bear/1/combatidle/bear1_fight33_bl_l.wav","bear/1/combatidle/bear1_fight32_l.wav","bear/1/combatidle/bear1_fight31_l.wav","bear/1/combatidle/bear1_fight30_l.wav","bear/1/combatidle/bear1_fight2_l.wav","bear/1/combatidle/bear1_fight29_l.wav","bear/1/combatidle/bear1_fight28_l.wav","bear/1/combatidle/bear1_fight27_l.wav","bear/1/combatidle/bear1_fight26_l.wav","bear/1/combatidle/bear1_fight25_l.wav","bear/1/combatidle/bear1_fight24_l.wav","bear/1/combatidle/bear1_fight23_l.wav","bear/1/combatidle/bear1_fight22_l.wav","bear/1/combatidle/bear1_fight21_l.wav","bear/1/combatidle/bear1_fight20_l.wav","bear/1/combatidle/bear1_fight1_l.wav","bear/1/combatidle/bear1_fight19_l.wavs","bear/1/combatidle/bear1_fight18_l.wav","bear/1/combatidle/bear1_fight17_l.wav","bear/1/combatidle/bear1_fight16_l.wav","bear/1/combatidle/bear1_fight15_l.wav","bear/1/combatidle/bear1_fight14_l.wav","bear/1/combatidle/bear1_fight13_l.wav","bear/1/combatidle/bear1_fight12_l.wav","bear/1/combatidle/bear1_fight11_l.wav","bear/1/combatidle/bear1_fight11_bl_l.wav","bear/1/combatidle/bear1_fight10_l.wav"}
ENT.SoundTbl_WeaponReload = {"bear/1/reload/bear1_weap_reload8_bl_l.wav","bear/1/reload/bear1_weap_reload7_bl_l.wav","bear/1/reload/bear1_weap_reload6_bl_l.wav","bear/1/reload/bear1_weap_reload5_l.wav","bear/1/reload/bear1_weap_reload4_l.wav","bear/1/reload/bear1_weap_reload3_l.wav","bear/1/reload/bear1_weap_reload2_l.wav","bear/1/reload/bear1_weap_reload1_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"bear/1/enemygrenade/bear1_enemy_grenade5_bl_l.wav","bear/1/enemygrenade/bear1_enemy_grenade4_bl_l.wav","bear/1/enemygrenade/bear1_enemy_grenade3_l.wav","bear/1/enemygrenade/bear1_enemy_grenade2_l.wav","bear/1/enemygrenade/bear1_enemy_grenade1_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"bear/1/enemydown/bear1_enemy_down_usec2_l.wav","bear/1/enemydown/bear1_enemy_down_usec1_l.wav","bear/1/enemydown/bear1_enemy_down9_bl_n.wav","bear/1/enemydown/bear1_enemy_down8_bl_n.wav","bear/1/enemydown/bear1_enemy_down7_l.wav","bear/1/enemydown/bear1_enemy_down6_l.wav","bear/1/enemydown/bear1_enemy_down5_l.wav","bear/1/enemydown/bear1_enemy_down4_l.wav","bear/1/enemydown/bear1_enemy_down3_l.wav","bear/1/enemydown/bear1_enemy_down2_l.wav","bear/1/enemydown/bear1_enemy_down1_l.wav","bear/1/enemydown/bear1_enemy_down10_bl_n.wav"}
ENT.SoundTbl_Pain = {"bear/1/pain/bear1_hit9.wav","bear/1/pain/bear1_hit8.wav","bear/1/pain/bear1_hit7.wav","bear/1/pain/bear1_hit6.wav","bear/1/pain/bear1_hit5.wav","bear/1/pain/bear1_hit4.wav","bear/1/pain/bear1_hit3.wav","bear/1/pain/bear1_hit2.wav","bear/1/pain/bear1_hit13.wav","bear/1/pain/bear1_hit12.wav","bear/1/pain/bear1_hit11.wav","bear/1/pain/bear1_hit10.wav","bear/1/pain/bear1_hit1.wav"}
ENT.SoundTbl_AllyDeath = {"bear/1/friendlydeath/bear1_friendly_hit2_l.wav","bear/1/friendlydeath/bear1_friendly_hit1_l.wav","bear/1/friendlydeath/bear1_friendly_down3_bl_l.wav","bear/1/friendlydeath/bear1_friendly_down2_l.wav","bear/1/friendlydeath/bear1_friendly_down1_l.wav"}
ENT.SoundTbl_CallForHelp = {"bear/1/coverme/bear1_needhelp_06_bl_l.wav","bear/1/coverme/bear1_needhelp_05_bl_l.wav","bear/1/coverme/bear1_needhelp_04_l.wav","bear/1/coverme/bear1_needhelp_03_l.wav","bear/1/coverme/bear1_needhelp_02_l.wav","bear/1/coverme/bear1_coverme_06_bl_l.wav","bear/1/coverme/bear1_coverme_05_bl_l.wav","bear/1/coverme/bear1_coverme_04_l.wav","bear/1/coverme/bear1_coverme_03_n.wav","bear/1/coverme/bear1_coverme_02_n.wav","bear/1/coverme/bear1_coverme_01_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"bear/1/grenade/bear1_grenade9_bl_l.wav","bear/1/grenade/bear1_grenade8_bl_l.wav","bear/1/grenade/bear1_grenade7_bl_l.wav","bear/1/grenade/bear1_grenade6_l.wav","bear/1/grenade/bear1_grenade5_l.wav","bear/1/grenade/bear1_grenade4_l.wav","bear/1/grenade/bear1_grenade3_l.wav","bear/1/grenade/bear1_grenade2_l.wav","bear/1/grenade/bear1_grenade1_l.wav","bear/1/grenade/bear1_grenade10_bl_l.wav"}
ENT.SoundTbl_Death = {"bear/1/death/bear1_death7.wav","bear/1/death/bear1_death6.wav","bear/1/death/bear1_death5.wav","bear/1/death/bear1_death4.wav","bear/1/death/bear1_death3.wav","bear/1/death/bear1_death2.wav","bear/1/death/bear1_death1.wav","bear/1/death/bear1_agony4.wav","bear/1/death/bear1_agony3.wav","bear/1/death/bear1_agony2.wav","bear/1/death/bear1_agony1.wav"}
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