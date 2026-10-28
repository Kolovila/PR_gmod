-- Смена оружейных паков: CW 2.0 -> ArcCW (2026-10-28, утро) -> ArcCW только реалистичный (UC, FA:S2,
-- Тарков; без CoD/CS-паков, 2026-10-28, день). Какой ствол встаёт на место ушедшего.
-- Разово при запуске (sv_shop.lua, sv_patrols.lua): товары магазина без стволов в игре убираются и
-- заново садятся стартовые списки (config/shop_defaults.lua), правки цены переносятся на замену; в
-- вариантах патрулей оружие бойцов (NPC-копии weapon_vj_<класс>) и добыча меняются по этим таблицам.
-- Нет в таблице — ствол CW убирается, ствол ArcCW остаётся (SpawnMember пропустит, если его нет).

-- CW 2.0 -> ArcCW
PR_ARCCW_FROM_CW = {
	-- пистолеты
	cw_kk_ins2_makarov = "arccw_ur_pm", cw_kk_ins2_tokarev = "arccw_ur_pm", cw_kk_ins2_nam_tt33 = "arccw_ur_pm",
	cw_g4p_mp412_rex = "arccw_firearms2_ragingbull", cw_pl14 = "arccw_firearms2_gsh18", cw_kk_ins2_m1911 = "arccw_ur_m1911",
	cw_kk_ins2_m9 = "arccw_ud_glock", cw_kk_ins2_m45 = "arccw_ur_m1911", cw_kk_ins2_nam_python = "arccw_ur_329",
	cw_kk_ins2_doi_p38 = "arccw_firearms2_p226", cw_kk_ins2_hkuspbestgun = "arccw_uc_usp", cw_kk_ins2_arse_g17 = "arccw_ud_glock",
	cw_mk23 = "arccw_uc_usp", cw_kk_ins2_nam_nambu = "arccw_firearms2_ragingbull", cw_qsz92 = "arccw_firearms2_p226",
	cw_khr_ins2_cz75 = "arccw_firearms2_p226", cw_deagle = "arccw_ur_deagle",
	-- пистолеты-пулемёты
	cw_kk_ins2_nam_ppsh = "arccw_firearms2_pp19", cw_kerd = "arccw_firearms2_pp19", cw_ots_kiparis = "arccw_firearms2_pp19",
	cw_pp19 = "arccw_firearms2_pp19", cw_kk_ins2_vityaz = "arccw_uc_fort230", cw_kk_ins2_doi_m3a1 = "arccw_firearms2_mac11",
	cw_kk_ins2_doi_thom_m1a1 = "arccw_firearms2_mac11", cw_khr_ins2_mac10 = "arccw_firearms2_mac11", cw_kk_ins2_vector = "arccw_uc_vector",
	cw_kac_pdw = "arccw_uc_lynx", cw_kk_ins2_doi_mp40 = "arccw_firearms2_stenmk2", cw_kk_ins2_sterling = "arccw_firearms2_sterling_l2a3",
	cw_kk_ins2_cstm_mp5a4 = "arccw_ur_mp5", cw_kk_ins2_ump45 = "arccw_firearms2_ump45", cw_kk_ins2_cstm_mp7 = "arccw_firearms2_p90",
	cw_kk_ins2_doi_owen_mk1 = "arccw_firearms2_stenmk2", cw_kk_ins2_nam_vz61 = "arccw_ud_uzi", cw_kk_ins2_pm9 = "arccw_firearms2_uzi",
	cw_kk_ins2_cstm_uzi = "arccw_ud_uzi", cw_scorpin_evo3 = "arccw_ud_uzi", cw_kk_ins2_mp5k = "arccw_firearms2_mp5k",
	-- дробовики
	cw_kk_ins2_toz66 = "arccw_ur_db", cw_kk_ins2_toz = "arccw_firearms2_toz34", cw_ks23 = "arccw_uc_ks23",
	cw_saiga12k_official = "arccw_firearms2_saiga12k", cw_kk_ins2_doi_ithaca = "arccw_uc_m37", cw_kk_ins2_cstm_m500 = "arccw_firearms2_mossbergm88c",
	cw_kk_ins2_m590 = "arccw_ud_870", cw_kk_ins2_cstm_ksg = "arccw_firearms2_rem870_tact", cw_aa12 = "arccw_uc_aa12",
	cw_browning5 = "arccw_firearms2_m3s90", cw_kk_ins2_arse_m1014 = "arccw_ud_m1014", cw_kk_ins2_cstm_spas12 = "arccw_ur_spas12",
	cw_m3super90 = "arccw_firearms2_m3s90", cw_weapon_bf4_qbs09 = "arccw_myt_uc_neostead", cw_kk_ins2_br99 = "arccw_myt_uc_neostead",
	cw_uts15 = "arccw_myt_uc_neostead", cw_dao12 = "arccw_myt_uc_neostead",
	-- автоматы и винтовки
	cw_kk_ins2_sks = "arccw_uc_sks", cw_kk_ins2_akm = "arccw_ur_ak", cw_kk_ins2_aks74u = "arccw_firearms2_aks74u",
	cw_kk_ins2_ak74 = "arccw_firearms2_ak74", cw_khr_ins2_ak12 = "arccw_firearms2_ak12", cw_g4p_an94 = "arccw_firearms2_an94",
	cw_ar15 = "arccw_ud_m16", cw_kk_ins2_nam_m16a1 = "arccw_ud_m16", cw_kk_ins2_m16a4 = "arccw_ud_m16",
	cw_kk_ins2_m4a1 = "arccw_firearms2_m4a1", cw_kk_ins2_mk18 = "arccw_firearms2_m4a1", cw_acr = "arccw_firearms2_lr300",
	cw_kk_ins2_doi_stg44 = "arccw_firearms2_ak47", cw_kk_ins2_fnfal = "arccw_firearms2_fnfal", cw_kk_ins2_cstm_famas = "arccw_firearms2_famas",
	cw_kk_ins2_cstm_g36c = "arccw_firearms2_g36c", cw_kk_ins2_arse_l85 = "arccw_firearms2_l85a2", cw_kk_hk416 = "arccw_firearms2_m4a1",
	cw_kk_ins2_nam_vz58 = "arccw_firearms2_ak47", cw_kk_ins2_galil = "arccw_firearms2_galil", cw_qbz95 = "arccw_firearms2_auga3",
	cw_kk_ins2_k2 = "arccw_firearms2_rk95", cw_tr09_tar21 = "arccw_firearms2_f2000", cw_kk_ins2_cz805 = "arccw_uc_cz805",
	cw_scar_h = "arccw_myt_uc_scar", cw_scar_l = "arccw_myt_uc_scar",
	-- снайперские
	cw_kk_ins2_mosin = "arccw_firearms2_kar98k", cw_kk_ins2_nam_svt40 = "arccw_uc_svd", cw_kk_ins2_svd = "arccw_uc_svd",
	cw_vss = "arccw_firearms2_vss", cw_sv98 = "arccw_eft_t5000", cw_kk_ins2_doi_spring = "arccw_firearms2_m24",
	cw_kk_ins2_m40a1 = "arccw_firearms2_m40a3", cw_kk_ins2_m14 = "arccw_uc_m14", cw_m24 = "arccw_firearms2_m24",
	cw_mw3_50cal = "arccw_ua_m82", cw_kk_ins2_doi_k98k = "arccw_firearms2_kar98k", cw_kk_ins2_doi_g43 = "arccw_firearms2_m21",
	cw_l115 = "arccw_ur_aw", cw_blops_psg1 = "arccw_firearms2_sr25", cw_wa2000 = "arccw_firearms2_m110", khr_simsks = "arccw_uc_sks",
	cw_khr_ins2_svd = "arccw_uc_svd", cw_jng90 = "arccw_eft_t5000", cw_trg42 = "arccw_ur_aw", cw_scar_ssr = "arccw_firearms2_sr25",
	-- пулемёты
	cw_kk_ins2_rpk = "arccw_firearms2_rpk47", cw_kk_ins2_rpk12 = "arccw_firearms2_rpk47", cw_pkm = "arccw_uc_pkm", cw_kk_ins2_pkp = "arccw_uc_pkm",
	cw_kk_ins2_doi_bar = "arccw_ua_m60", cw_kk_ins2_m249 = "arccw_ua_m249", cw_kk_ins2_nam_m60 = "arccw_ua_m60",
	cw_kk_ins2_m240 = "arccw_firearms2_m60e3", cw_kk_ins2_doi_bren = "arccw_firearms2_minimi", cw_kk_ins2_doi_mg34 = "arccw_firearms2_minimi",
	cw_kk_ins2_doi_mg42 = "arccw_firearms2_minimi", cw_hk_21 = "arccw_uc_evolys", cw_rpd = "arccw_firearms2_rpk47",
	-- гранатомёты
	cw_kk_ins2_rpg = "arccw_uc_rpg7", cw_kk_ins2_at4 = "arccw_uc_at4", cw_kk_ins2_nam_m72 = "arccw_uc_rpg26",
	cw_kk_ins2_gp25 = "arccw_ud_m79", cw_m79 = "arccw_ud_m79",
}

-- ArcCW первого набора (CoD/CS-паки ушли) -> реалистичный ArcCW
PR_ARCCW_V2 = {
	-- пистолеты
	arccw_waw_tt33 = "arccw_ur_pm", arccw_mw3e_mp412 = "arccw_firearms2_ragingbull", arccw_cod4e_m9 = "arccw_ud_glock",
	arccw_bo1_python = "arccw_ur_329", arccw_waw_p38 = "arccw_firearms2_p226", arccw_bo3_c96 = "arccw_firearms2_p226",
	arccw_mw3e_p99 = "arccw_firearms2_p226", arccw_bo2_fiveseven = "arccw_uc_usp", arccw_waw_nambu = "arccw_firearms2_ragingbull",
	arccw_bo1_cz75 = "arccw_firearms2_p226", arccw_ragingbull = "arccw_firearms2_ragingbull", arccw_bo1_m1911 = "arccw_ur_m1911",
	arccw_cod4e_m1911 = "arccw_ur_m1911", arccw_deagle357 = "arccw_firearms2_deagle357", arccw_usp = "arccw_uc_usp",
	arccw_p228 = "arccw_firearms2_p226", arccw_m9 = "arccw_ud_glock", arccw_mw3e_glock = "arccw_firearms2_glock20",
	-- пистолеты-пулемёты
	arccw_bo3_ppsh41 = "arccw_firearms2_pp19", arccw_bo1_kiparis = "arccw_firearms2_pp19", arccw_mw2e_pp2000 = "arccw_firearms2_pp19",
	arccw_bizon = "arccw_firearms2_pp19", arccw_mw3e_pp90m1 = "arccw_uc_fort230", arccw_waw_thompson = "arccw_firearms2_mac11",
	arccw_bo2_thompson = "arccw_firearms2_mac11", arccw_bo1_mac11 = "arccw_firearms2_mac11", arccw_bo2_vector = "arccw_uc_vector",
	arccw_bo3_mp40 = "arccw_firearms2_stenmk2", arccw_bo1_sten = "arccw_firearms2_stenmk2", arccw_mw3e_ump45 = "arccw_firearms2_ump45",
	arccw_bo2_mp7 = "arccw_firearms2_mp5k", arccw_mw3e_p90 = "arccw_firearms2_p90", arccw_bo1_skorpion = "arccw_ud_uzi",
	arccw_bo1_pm63 = "arccw_firearms2_uzi", arccw_mw3e_pm9 = "arccw_firearms2_uzi", arccw_bo2_scorpion = "arccw_ud_uzi",
	arccw_cod4e_mp5 = "arccw_ur_mp5", arccw_bo2_pdw57 = "arccw_firearms2_p90", arccw_ump9 = "arccw_firearms2_ump45",
	-- дробовики
	arccw_bo1_ks23 = "arccw_uc_ks23", arccw_bo2_s12 = "arccw_firearms2_saiga12k", arccw_bo1_ithaca = "arccw_uc_m37",
	arccw_waw_trenchgun = "arccw_uc_m37", arccw_bo2_ksg = "arccw_firearms2_rem870_tact", arccw_mw3e_aa12 = "arccw_uc_aa12",
	arccw_bo1_olympia = "arccw_firearms2_m3s90", arccw_shorty = "arccw_firearms2_m3s90", arccw_mw3e_striker = "arccw_myt_uc_neostead",
	arccw_mw3e_usas12 = "arccw_myt_uc_neostead", arccw_cod4e_m1014 = "arccw_ud_m1014", arccw_bo2_r870 = "arccw_firearms2_rem870_tact",
	-- автоматы и винтовки
	arccw_cod4e_ak47 = "arccw_firearms2_ak47", arccw_mw3e_ak74u = "arccw_firearms2_aks74u", arccw_bo2_an94 = "arccw_firearms2_an94",
	arccw_kali_ar15 = "arccw_ud_m16", arccw_bo1_m16 = "arccw_ud_m16", arccw_cod4e_m4m16 = "arccw_ud_m16",
	arccw_mw3e_m4a1 = "arccw_firearms2_m4a1", arccw_mw3e_acr = "arccw_firearms2_lr300", arccw_bo3_stg44 = "arccw_firearms2_fnfal",
	arccw_bo1_fal = "arccw_firearms2_fnfal", arccw_mw2e_famas = "arccw_firearms2_famas", arccw_cod4e_g36c = "arccw_firearms2_g36c",
	arccw_bo1_galil = "arccw_firearms2_galil", arccw_cde_ak5 = "arccw_firearms2_rk95", arccw_sg552 = "arccw_firearms2_sg552",
	arccw_bo2_type95 = "arccw_firearms2_auga3", arccw_bo2_mtar = "arccw_firearms2_f2000", arccw_bo2_sig556 = "arccw_firearms2_sg551",
	arccw_bo2_m27 = "arccw_firearms2_m4a1", arccw_bo1_xl60 = "arccw_firearms2_l85a2", arccw_mw3e_scarl = "arccw_myt_uc_scar",
	arccw_mw3e_g36 = "arccw_firearms2_g36k", arccw_aug = "arccw_firearms2_auga3", arccw_cod4e_g3 = "arccw_ur_g3",
	-- снайперские
	arccw_waw_mosin = "arccw_firearms2_kar98k", arccw_waw_svt40 = "arccw_uc_svd", arccw_bo2_svu = "arccw_firearms2_vss",
	arccw_waw_ptrs41 = "arccw_uc_6p62", arccw_waw_springfield = "arccw_firearms2_m24", arccw_waw_garand = "arccw_uc_m14",
	arccw_cod4e_r700 = "arccw_firearms2_m24", arccw_cod4e_m40a3 = "arccw_firearms2_m40a3", arccw_waw_k98k = "arccw_firearms2_kar98k",
	arccw_waw_g43 = "arccw_firearms2_kar98k", arccw_bo1_l96 = "arccw_ur_aw", arccw_bo1_wa2000 = "arccw_ur_aw", arccw_awm = "arccw_ur_aw",
	arccw_waw_arisaka = "arccw_firearms2_kar98k", arccw_sg550 = "arccw_firearms2_sg550", arccw_mw3e_rsass = "arccw_firearms2_sr25",
	arccw_mw3e_mk14 = "arccw_firearms2_m14sop", arccw_cod4e_dragunov = "arccw_uc_svd", arccw_scout = "arccw_uc_scout",
	-- пулемёты
	arccw_waw_dp28 = "arccw_firearms2_rpk47", arccw_bo2_rpd = "arccw_firearms2_rpk47", arccw_bo1_rpk = "arccw_firearms2_rpk47",
	arccw_waw_bar = "arccw_ua_m60", arccw_waw_m1919 = "arccw_ua_m60", arccw_bo2_mk48 = "arccw_firearms2_m60e3",
	arccw_bo2_mg08 = "arccw_firearms2_minimi", arccw_waw_fg42 = "arccw_firearms2_minimi", arccw_waw_mg42 = "arccw_firearms2_minimi",
	arccw_bo1_hk21 = "arccw_uc_evolys", arccw_mw3e_l86 = "arccw_firearms2_minimi", arccw_waw_type99 = "arccw_uc_u100",
	arccw_bo2_qbb = "arccw_uc_u100", arccw_cod4e_m60 = "arccw_firearms2_m60e3", arccw_bo2_lsat = "arccw_firearms2_minimi",
	-- гранатомёты, гранаты, ножи
	arccw_bo1_law = "arccw_uc_rpg26", arccw_bo1_chinalake = "arccw_ud_m79", arccw_bo2_m32 = "arccw_ud_m79", arccw_mw2e_thumper = "arccw_ud_m79",
	arccw_mw3e_xm25 = "arccw_ud_m79", arccw_bo1_m202 = "arccw_uc_rpg7", arccw_waw_bazooka = "arccw_uc_rpg7",
	arccw_nade_frag = "arccw_uo_m67", arccw_nade_impact = "arccw_uo_rgo", arccw_nade_semtex = "arccw_uo_c4",
	arccw_nade_incendiary = "arccw_uo_molotov", arccw_nade_smoke = "arccw_uo_m18", arccw_nade_flash = "arccw_uo_m84",
	arccw_nade_gas = "arccw_uo_m18", arccw_nade_claymore = "arccw_firearms2_nade_claymore", arccw_nade_flare = "arccw_uo_flare",
	arccw_melee_knife = "arccw_firearms2_dv2", arccw_bo1_shiv = "arccw_firearms2_m9_bayonet", arccw_bo1_sog_knife = "arccw_firearms2_dv2",
}

-- Замена ушедшего ствола (CW или ArcCW первого набора) или nil
function PR_ArcCWReplacement(class)
	local to = PR_ARCCW_FROM_CW[class] or class
	to = PR_ARCCW_V2[to] or to
	return to ~= class and to or nil
end
