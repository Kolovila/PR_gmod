-- Переход с CW 2.0 на ArcCW (2026-10-28): какой ствол ArcCW встаёт на место ствола CW.
-- Разово при запуске (sv_shop.lua, sv_patrols.lua): товары магазина CW убираются и заново садятся
-- из стартовых списков (config/shop_defaults.lua — они уже на ArcCW), а в вариантах патрулей
-- оружие бойцов (NPC-копии weapon_vj_cw_*) и добыча (cw_*) меняются по этой таблице.
-- Нет в таблице — ствол просто убирается: боец без заданного оружия получает ствол под свою роль.

PR_ARCCW_FROM_CW = {
	-- пистолеты
	cw_kk_ins2_makarov = "arccw_ur_pm", cw_kk_ins2_tokarev = "arccw_waw_tt33", cw_kk_ins2_nam_tt33 = "arccw_waw_tt33",
	cw_g4p_mp412_rex = "arccw_mw3e_mp412", cw_pl14 = "arccw_ur_pm", cw_kk_ins2_m1911 = "arccw_ur_m1911",
	cw_kk_ins2_m9 = "arccw_cod4e_m9", cw_kk_ins2_m45 = "arccw_ur_m1911", cw_kk_ins2_nam_python = "arccw_bo1_python",
	cw_kk_ins2_doi_p38 = "arccw_waw_p38", cw_kk_ins2_hkuspbestgun = "arccw_uc_usp", cw_kk_ins2_arse_g17 = "arccw_ud_glock",
	cw_mk23 = "arccw_uc_usp", cw_kk_ins2_nam_nambu = "arccw_waw_nambu", cw_qsz92 = "arccw_bo1_cz75",
	cw_khr_ins2_cz75 = "arccw_bo1_cz75", cw_deagle = "arccw_ur_deagle",
	-- пистолеты-пулемёты
	cw_kk_ins2_nam_ppsh = "arccw_bo3_ppsh41", cw_kerd = "arccw_bo1_kiparis", cw_ots_kiparis = "arccw_bo1_kiparis",
	cw_pp19 = "arccw_bizon", cw_kk_ins2_vityaz = "arccw_mw3e_pp90m1", cw_kk_ins2_doi_m3a1 = "arccw_waw_thompson",
	cw_kk_ins2_doi_thom_m1a1 = "arccw_waw_thompson", cw_khr_ins2_mac10 = "arccw_bo1_mac11", cw_kk_ins2_vector = "arccw_bo2_vector",
	cw_kac_pdw = "arccw_bo2_pdw57", cw_kk_ins2_doi_mp40 = "arccw_bo3_mp40", cw_kk_ins2_sterling = "arccw_bo1_sten",
	cw_kk_ins2_cstm_mp5a4 = "arccw_ur_mp5", cw_kk_ins2_ump45 = "arccw_mw3e_ump45", cw_kk_ins2_cstm_mp7 = "arccw_bo2_mp7",
	cw_kk_ins2_doi_owen_mk1 = "arccw_bo1_sten", cw_kk_ins2_nam_vz61 = "arccw_bo1_skorpion", cw_kk_ins2_pm9 = "arccw_mw3e_pm9",
	cw_kk_ins2_cstm_uzi = "arccw_ud_uzi", cw_scorpin_evo3 = "arccw_bo2_scorpion", cw_kk_ins2_mp5k = "arccw_ur_mp5",
	-- дробовики
	cw_kk_ins2_toz66 = "arccw_ur_db", cw_kk_ins2_toz = "arccw_ur_db", cw_ks23 = "arccw_bo1_ks23",
	cw_saiga12k_official = "arccw_bo2_s12", cw_kk_ins2_doi_ithaca = "arccw_bo1_ithaca", cw_kk_ins2_cstm_m500 = "arccw_ud_870",
	cw_kk_ins2_m590 = "arccw_ud_870", cw_kk_ins2_cstm_ksg = "arccw_bo2_ksg", cw_aa12 = "arccw_mw3e_aa12",
	cw_browning5 = "arccw_bo1_olympia", cw_kk_ins2_arse_m1014 = "arccw_ud_m1014", cw_kk_ins2_cstm_spas12 = "arccw_ur_spas12",
	cw_m3super90 = "arccw_shorty", cw_weapon_bf4_qbs09 = "arccw_mw3e_striker", cw_kk_ins2_br99 = "arccw_myt_uc_neostead",
	cw_uts15 = "arccw_mw3e_usas12", cw_dao12 = "arccw_mw3e_striker",
	-- автоматы и винтовки
	cw_kk_ins2_sks = "arccw_uc_sks", cw_kk_ins2_akm = "arccw_ur_ak", cw_kk_ins2_aks74u = "arccw_mw3e_ak74u",
	cw_kk_ins2_ak74 = "arccw_ur_ak", cw_khr_ins2_ak12 = "arccw_ur_ak", cw_g4p_an94 = "arccw_bo2_an94",
	cw_ar15 = "arccw_kali_ar15", cw_kk_ins2_nam_m16a1 = "arccw_bo1_m16", cw_kk_ins2_m16a4 = "arccw_cod4e_m4m16",
	cw_kk_ins2_m4a1 = "arccw_mw3e_m4a1", cw_kk_ins2_mk18 = "arccw_ud_m16", cw_acr = "arccw_mw3e_acr",
	cw_kk_ins2_doi_stg44 = "arccw_bo3_stg44", cw_kk_ins2_fnfal = "arccw_bo1_fal", cw_kk_ins2_cstm_famas = "arccw_mw2e_famas",
	cw_kk_ins2_cstm_g36c = "arccw_cod4e_g36c", cw_kk_ins2_arse_l85 = "arccw_bo1_xl60", cw_kk_hk416 = "arccw_bo2_m27",
	cw_kk_ins2_nam_vz58 = "arccw_cod4e_ak47", cw_kk_ins2_galil = "arccw_bo1_galil", cw_qbz95 = "arccw_bo2_type95",
	cw_kk_ins2_k2 = "arccw_cde_ak5", cw_tr09_tar21 = "arccw_bo2_mtar", cw_kk_ins2_cz805 = "arccw_bo2_sig556",
	cw_scar_h = "arccw_myt_uc_scar", cw_scar_l = "arccw_mw3e_scarl",
	-- снайперские
	cw_kk_ins2_mosin = "arccw_waw_mosin", cw_kk_ins2_nam_svt40 = "arccw_waw_svt40", cw_kk_ins2_svd = "arccw_uc_svd",
	cw_vss = "arccw_bo2_svu", cw_sv98 = "arccw_bo2_svu", cw_kk_ins2_doi_spring = "arccw_waw_springfield",
	cw_kk_ins2_m40a1 = "arccw_cod4e_m40a3", cw_kk_ins2_m14 = "arccw_uc_m14", cw_m24 = "arccw_cod4e_r700",
	cw_mw3_50cal = "arccw_ua_m82", cw_kk_ins2_doi_k98k = "arccw_waw_k98k", cw_kk_ins2_doi_g43 = "arccw_waw_g43",
	cw_l115 = "arccw_awm", cw_blops_psg1 = "arccw_bo1_wa2000", cw_wa2000 = "arccw_bo1_wa2000", khr_simsks = "arccw_uc_sks",
	cw_khr_ins2_svd = "arccw_uc_svd", cw_jng90 = "arccw_myt_uc_gm6", cw_trg42 = "arccw_sg550", cw_scar_ssr = "arccw_mw3e_rsass",
	-- пулемёты
	cw_kk_ins2_rpk = "arccw_bo1_rpk", cw_kk_ins2_rpk12 = "arccw_bo1_rpk", cw_pkm = "arccw_uc_pkm", cw_kk_ins2_pkp = "arccw_uc_pkm",
	cw_kk_ins2_doi_bar = "arccw_waw_bar", cw_kk_ins2_m249 = "arccw_ua_m249", cw_kk_ins2_nam_m60 = "arccw_ua_m60",
	cw_kk_ins2_m240 = "arccw_bo2_mk48", cw_kk_ins2_doi_bren = "arccw_waw_fg42", cw_kk_ins2_doi_mg34 = "arccw_waw_mg42",
	cw_kk_ins2_doi_mg42 = "arccw_waw_mg42", cw_hk_21 = "arccw_bo1_hk21", cw_rpd = "arccw_bo2_rpd",
	-- гранатомёты
	cw_kk_ins2_rpg = "arccw_uc_rpg7", cw_kk_ins2_at4 = "arccw_uc_at4", cw_kk_ins2_nam_m72 = "arccw_bo1_law",
	cw_kk_ins2_gp25 = "arccw_ud_m79", cw_m79 = "arccw_ud_m79",
}
