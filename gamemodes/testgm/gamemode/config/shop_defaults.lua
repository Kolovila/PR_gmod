-- Стартовые списки магазинов. Сервер один раз добавляет их в базу (sv_shop.lua, PR_SeedShopDefaults),
-- только то, что реально установлено, и не трогая уже существующие товары. Потом всё правится в игре.
--
-- Оружие разложено по происхождению:
--   SSNK — советское и русское, USA — американское, GBC — западноевропейское, WN — остальной мир.
-- Внутри каждого типа стволы идут по тирам: цену, опыт и «открывается после» сервер считает сам.

PR_SHOP_DEFAULTS = {}

-- Цена и опыт по тирам; тип оружия даёт множитель к цене
PR_SHOP_DEFAULTS.TierPrice = {500, 1500, 3500, 7000, 12000, 20000}
PR_SHOP_DEFAULTS.TierExp = {0, 30, 80, 160, 300, 500}
PR_SHOP_DEFAULTS.TypePriceMul = {pistol = 0.5, smg = 0.8, shotgun = 0.8, ar = 1, sniper = 1.3, machinegun = 1.5}

-- Оружие: фракция -> тип -> {{класс, название}, ...} от первого тира к последнему
PR_SHOP_DEFAULTS.Weapons = {
    SSNK = {
        pistol = {
            {"cw_kk_ins2_makarov", "ПМ"},
            {"cw_kk_ins2_tokarev", "ТТ-33"},
            {"cw_g4p_mp412_rex", "МР-412 «Рекс»"},
            {"cw_pl14", "ПЛ-14"}
        },
        smg = {
            {"cw_kk_ins2_nam_ppsh", "ППШ-41"},
            {"cw_kerd", "ПП-91 «Кедр»"},
            {"cw_ots_kiparis", "ОЦ-02 «Кипарис»"},
            {"cw_pp19", "ПП-19 «Бизон»"},
            {"cw_kk_ins2_vityaz", "ПП-19-01 «Витязь»"}
        },
        shotgun = {
            {"cw_kk_ins2_toz66", "ИЖ-43"},
            {"cw_kk_ins2_toz", "ТОЗ-194"},
            {"cw_ks23", "КС-23"},
            {"cw_saiga12k_official", "Сайга-12К"}
        },
        ar = {
            {"cw_kk_ins2_sks", "СКС"},
            {"cw_kk_ins2_akm", "АКМ"},
            {"cw_kk_ins2_aks74u", "АКС-74У"},
            {"cw_kk_ins2_ak74", "АК-74"},
            {"cw_khr_ins2_ak12", "АК-12"},
            {"cw_g4p_an94", "АН-94 «Абакан»"}
        },
        sniper = {
            {"cw_kk_ins2_mosin", "Мосинка"},
            {"cw_kk_ins2_nam_svt40", "СВТ-40"},
            {"cw_kk_ins2_svd", "СВД"},
            {"cw_vss", "ВСС «Винторез»"},
            {"cw_sv98", "СВ-98"}
        },
        machinegun = {
            {"cw_kk_ins2_rpk", "РПК"},
            {"cw_kk_ins2_rpk12", "РПК-16"},
            {"cw_pkm", "ПКМ"},
            {"cw_kk_ins2_pkp", "ПКП «Печенег»"}
        }
    },

    USA = {
        pistol = {
            {"cw_kk_ins2_m1911", "M1911"},
            {"cw_kk_ins2_m9", "Beretta M9"},
            {"cw_kk_ins2_m45", "M45 MEUSOC"},
            {"cw_kk_ins2_nam_python", "Colt Python"}
        },
        smg = {
            {"cw_kk_ins2_doi_m3a1", "M3A1 Grease Gun"},
            {"cw_kk_ins2_doi_thom_m1a1", "Thompson M1A1"},
            {"cw_khr_ins2_mac10", "MAC-10"},
            {"cw_kk_ins2_vector", "KRISS Vector"},
            {"cw_kac_pdw", "KAC PDW"}
        },
        shotgun = {
            {"cw_kk_ins2_doi_ithaca", "Ithaca M37"},
            {"cw_kk_ins2_cstm_m500", "Mossberg 500"},
            {"cw_kk_ins2_m590", "Mossberg 590"},
            {"cw_kk_ins2_cstm_ksg", "KSG"},
            {"cw_aa12", "AA-12"}
        },
        ar = {
            {"cw_ar15", "AR-15"},
            {"cw_kk_ins2_nam_m16a1", "M16A1"},
            {"cw_kk_ins2_m16a4", "M16A4"},
            {"cw_kk_ins2_m4a1", "M4A1"},
            {"cw_kk_ins2_mk18", "Mk18"},
            {"cw_acr", "ACR"}
        },
        sniper = {
            {"cw_kk_ins2_doi_spring", "M1903 Springfield"},
            {"cw_kk_ins2_m40a1", "M40A1"},
            {"cw_kk_ins2_m14", "M14 EBR"},
            {"cw_m24", "M24"},
            {"cw_mw3_50cal", "Barrett M82"}
        },
        machinegun = {
            {"cw_kk_ins2_doi_bar", "M1918 BAR"},
            {"cw_kk_ins2_m249", "M249"},
            {"cw_kk_ins2_nam_m60", "M60"},
            {"cw_kk_ins2_m240", "M240"}
        }
    },

    GBC = {
        pistol = {
            {"cw_kk_ins2_doi_p38", "Walther P38"},
            {"cw_kk_ins2_hkuspbestgun", "HK USP"},
            {"cw_kk_ins2_arse_g17", "Glock 17"},
            {"cw_mk23", "HK MK23"}
        },
        smg = {
            {"cw_kk_ins2_doi_mp40", "MP40"},
            {"cw_kk_ins2_sterling", "Sterling L2A3"},
            {"cw_kk_ins2_cstm_mp5a4", "HK MP5A4"},
            {"cw_kk_ins2_ump45", "HK UMP .45"},
            {"cw_kk_ins2_cstm_mp7", "HK MP7"}
        },
        shotgun = {
            {"cw_browning5", "Browning Auto-5"},
            {"cw_kk_ins2_arse_m1014", "Benelli M4"},
            {"cw_kk_ins2_cstm_spas12", "SPAS-12"},
            {"cw_m3super90", "Benelli M3"}
        },
        ar = {
            {"cw_kk_ins2_doi_stg44", "StG 44"},
            {"cw_kk_ins2_fnfal", "FN FAL"},
            {"cw_kk_ins2_cstm_famas", "FAMAS"},
            {"cw_kk_ins2_cstm_g36c", "HK G36C"},
            {"cw_kk_ins2_arse_l85", "L85"},
            {"cw_kk_hk416", "HK416"}
        },
        sniper = {
            {"cw_kk_ins2_doi_k98k", "Kar98k"},
            {"cw_kk_ins2_doi_g43", "Gewehr 43"},
            {"cw_l115", "L115A3"},
            {"cw_blops_psg1", "PSG-1"},
            {"cw_wa2000", "Walther WA 2000"}
        },
        machinegun = {
            {"cw_kk_ins2_doi_bren", "Bren"},
            {"cw_kk_ins2_doi_mg34", "MG 34"},
            {"cw_kk_ins2_doi_mg42", "MG 42"},
            {"cw_hk_21", "HK21"}
        }
    },

    WN = {
        pistol = {
            {"cw_kk_ins2_nam_nambu", "Nambu"},
            {"cw_qsz92", "QSZ-92"},
            {"cw_khr_ins2_cz75", "CZ 75"},
            {"cw_deagle", "Desert Eagle"}
        },
        smg = {
            {"cw_kk_ins2_doi_owen_mk1", "Owen Mk1"},
            {"cw_kk_ins2_nam_vz61", "Vz. 61 Skorpion"},
            {"cw_kk_ins2_pm9", "Minebea PM-9"},
            {"cw_kk_ins2_cstm_uzi", "Uzi"},
            {"cw_scorpin_evo3", "CZ Scorpion Evo 3"}
        },
        shotgun = {
            {"cw_weapon_bf4_qbs09", "QBS-09"},
            {"cw_kk_ins2_br99", "BR-99"},
            {"cw_uts15", "UTS-15"},
            {"cw_dao12", "Striker-12"}
        },
        ar = {
            {"cw_kk_ins2_nam_vz58", "Vz. 58"},
            {"cw_kk_ins2_galil", "Galil"},
            {"cw_qbz95", "QBZ-95"},
            {"cw_kk_ins2_k2", "Daewoo K2"},
            {"cw_tr09_tar21", "Tavor TAR-21"},
            {"cw_kk_ins2_cz805", "CZ 805 BREN"}
        },
        sniper = {
            {"khr_simsks", "Type 56"},
            {"cw_khr_ins2_svd", "NDM-86"},
            {"cw_jng90", "MKEK JNG-90"},
            {"cw_trg42", "Sako TRG-42"}
        },
        machinegun = {
            {"cw_rpd", "РПД"},
            {"cw_kk_ins2_rpk", "РПК"},
            {"cw_pkm", "ПКМ"}
        }
    }
}

-- Снаряжение (общее для всех): категория -> {{класс, название, цена}, ...}
PR_SHOP_DEFAULTS.Equipment = {
    grenade_lethal = {
        {"cw_kk_ins2_nam_nade_rgd5", "РГД-5", 800},
        {"cw_kk_ins2_nade_f1", "Ф-1", 900},
        {"cw_kk_ins2_nade_m67", "M67", 900},
        {"cw_kk_ins2_nade_molotov", "Коктейль Молотова", 600}
    },
    grenade_unlethal = {
        {"cw_kk_ins2_nam_nade_rdg1", "РДГ-1 (дым)", 300},
        {"cw_kk_ins2_nade_m18", "M18 (дым)", 300},
        {"cw_kk_ins2_nade_m84", "M84 (светошумовая)", 500}
    },
    explosion = {
        {"cw_kk_ins2_nade_ied", "СВУ на радиоуправлении", 3000},
        {"cw_kk_ins2_nade_c4", "C4 на радиоуправлении", 4500},
        {"weapon_simmines", "Противотанковые мины", 6000}
    },
    melee_weapon = {
        {"cw_kk_ins2_nam_mel_ak", "Штык-нож АК", 200},
        {"cw_kk_ins2_mel_bayonet", "Штык морпеха", 200},
        {"cw_kk_ins2_mel_gurkha", "Кукри", 400},
        {"cw_kk_ins2_ao5_mel_mach", "Мачете", 400},
        {"cw_kk_ins2_doi_mel_shovel_us", "Сапёрная лопата", 300}
    },
    stims = {
        {"weapon_ibuprofen", "Ибупрофен", 400},
        {"weapon_morphine", "Морфин", 900},
        {"weapon_vaselin", "Вазелин", 300}
    },
    first_aid = {
        {"weapon_bandage", "Бинт", 150},
        {"weapon_ai2", "Аптечка АИ-2", 400},
        {"weapon_salewa", "Аптечка Salewa", 900},
        {"weapon_grizzly", "Аптечка «Гризли»", 1800},
        {"weapon_splint", "Шина", 300},
        {"weapon_cms", "Хирургический набор", 1500},
        {"weapon_medkit", "Медпакет", 1200}
    },
    stations_device = {
        {"gred_emp_pm41", "82-мм миномёт ПМ-41", 15000},
        {"gred_emp_m1mortar", "81-мм миномёт M1", 15000},
        {"gred_emp_dshk", "ДШК", 9000},
        {"gred_emp_kord", "Корд", 10000},
        {"gred_emp_m2", "M2 Browning", 10000},
        {"gred_emp_mg3", "MG3", 8000},
        {"gred_emp_zsu23", "ЗУ-23-2", 25000},
        {"gred_emp_kornet", "ПТРК «Корнет»", 30000},
        {"gred_emp_m777", "155-мм гаубица M777", 50000}
    },
    binoculars = {
        {"cw_kk_ins2_doi_bino_us", "Бинокль", 300},
        {"gred_emp_binoculars", "Бинокль корректировщика", 800}
    },
    rocket_launchers = {
        {"cw_kk_ins2_nam_m72", "M72 LAW", 4000},
        {"cw_kk_ins2_rpg", "РПГ-7", 7000},
        {"cw_kk_ins2_at4", "AT4", 7000}
    },
    signal_device = {
        {"cw_kk_ins2_nade_kk2", "Сигнальный факел", 200},
        {"cw_kk_ins2_p2a1", "Сигнальный пистолет HK P2A1", 600}
    },
    armor_and_else = {
        {"item_battery", "Бронепластина (+15 брони)", 800},
        {"cw_ammo_kit_small", "Подсумок с патронами", 300},
        {"cw_ammo_kit_regular", "Сумка с патронами", 700},
        {"cw_ammo_crate_small", "Малый ящик патронов", 1500},
        {"cw_ammo_crate_regular", "Ящик патронов", 3000},
        {"weapon_simrepair", "Ремкомплект техники", 1500}
    }
}

-- Техника: фракция -> {{класс, название, тип, цена, мод}, ...}
-- мод: "simfphys" — машина simfphys, "no_simfphys" — обычная сущность (LFS, WAC, LVS)
PR_SHOP_DEFAULTS.Vehicles = {
    SSNK = {
        {"sim_fphys_pwvolga", "ГАЗ-24 «Волга»", "light_armor", 3000, "simfphys"},
        {"sim_fphys_pwgaz52", "ГАЗ-52", "support_vehicle", 5000, "simfphys"},
        {"sim_fphys_conscriptapc_armed", "БТР", "bmp_and_btr", 30000, "simfphys"},
        {"sim_fphys_tank4", "Т-90МС", "tanks", 90000, "simfphys"},
        {"gred_lfs_mi24a", "Ми-24А", "helicopters", 110000, "no_simfphys"},
        {"wac_hc_mi28_havoc", "Ми-28 «Ночной охотник»", "helicopters", 130000, "no_simfphys"}
    },
    USA = {
        {"sim_fphys_jeep_armed2", "Джип с пулемётом", "light_armor", 9000, "simfphys"},
        {"sim_fphys_van", "Фургон", "support_vehicle", 4000, "simfphys"},
        {"sim_fphys_combineapc_armed", "БТР", "bmp_and_btr", 30000, "simfphys"},
        {"sim_fphys_tank2", "M4 Sherman", "tanks", 60000, "simfphys"},
        {"wac_hc_blackhawk_uh60", "UH-60 Black Hawk", "helicopters", 80000, "no_simfphys"},
        {"wac_hc_ah1z_viper", "AH-1Z Viper", "helicopters", 130000, "no_simfphys"},
        {"gred_lfs_a10", "A-10 Thunderbolt II", "jets", 200000, "no_simfphys"}
    },
    GBC = {
        {"sim_fphys_v8elite_armed2", "Внедорожник с пулемётом", "light_armor", 9000, "simfphys"},
        {"sim_fphys_pwvan", "Фургон", "support_vehicle", 4000, "simfphys"},
        {"sim_fphys_conscriptapc_armed", "БТР", "bmp_and_btr", 30000, "simfphys"},
        {"sim_fphys_tank", "Tiger I", "tanks", 70000, "simfphys"},
        {"sim_fphys_tank3", "Leopard 2A7", "tanks", 100000, "simfphys"},
        {"wac_hc_littlebird_mh6", "MH-6 Little Bird", "helicopters", 60000, "no_simfphys"}
    },
    WN = {
        {"sim_fphys_jeep_armed", "Джип с тау-пушкой", "light_armor", 9000, "simfphys"},
        {"sim_fphys_pwavia", "Avia", "support_vehicle", 4000, "simfphys"},
        {"sim_fphys_combineapc_armed", "БТР", "bmp_and_btr", 30000, "simfphys"},
        {"sim_fphys_tank4", "Т-90МС", "tanks", 90000, "simfphys"},
        {"gred_lfs_oh6", "OH-6 Cayuse", "helicopters", 60000, "no_simfphys"},
        {"wac_hc_littlebird_ah6", "AH-6 Little Bird", "helicopters", 90000, "no_simfphys"}
    }
}

-- Одежда: фракция -> {{модель, цена, уровень}, ...}. Стандартные модели GMod; свои паки добавляются в игре.
PR_SHOP_DEFAULTS.Cloth = {
    SSNK = {
        {"models/player/phoenix.mdl", 0, 1},
        {"models/player/guerilla.mdl", 2000, 3},
        {"models/player/leet.mdl", 5000, 5}
    },
    USA = {
        {"models/player/swat.mdl", 0, 1},
        {"models/player/urban.mdl", 2000, 3},
        {"models/player/riot.mdl", 5000, 5}
    },
    GBC = {
        {"models/player/arctic.mdl", 0, 1},
        {"models/player/gasmask.mdl", 2000, 3},
        {"models/player/combine_soldier.mdl", 6000, 6}
    },
    WN = {
        {"models/player/group03/male_07.mdl", 0, 1},
        {"models/player/group03/male_02.mdl", 1000, 2},
        {"models/player/combine_soldier_prisonguard.mdl", 6000, 6}
    }
}
