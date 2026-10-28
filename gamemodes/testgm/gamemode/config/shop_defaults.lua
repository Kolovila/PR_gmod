-- Стартовые списки магазинов. Сервер один раз добавляет их в базу (sv_shop.lua, PR_SeedShopDefaults),
-- только то, что реально установлено, и не трогая уже существующие товары. Потом всё правится в игре.
--
-- Оружие разложено по происхождению:
--   SSNK — советское и русское, USA — американское, GBC — западноевропейское, WN — остальной мир.
--   Мародёры (SCAV) своего списка оружия не имеют: им доступны стволы всех группировок (shared.lua).
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
            {"arccw_ur_pm", "ПМ"},
            {"arccw_waw_tt33", "ТТ-33"},
            {"arccw_mw3e_mp412", "МР-412 «Рекс»"}
        },
        smg = {
            {"arccw_bo3_ppsh41", "ППШ-41"},
            {"arccw_bo1_kiparis", "ОЦ-02 «Кипарис»"},
            {"arccw_mw2e_pp2000", "ПП-2000"},
            {"arccw_bizon", "ПП-19 «Бизон»"},
            {"arccw_mw3e_pp90m1", "ПП-90М1"}
        },
        shotgun = {
            {"arccw_ur_db", "ИЖ-58"},
            {"arccw_bo1_ks23", "КС-23"},
            {"arccw_bo2_s12", "Сайга-12К"}
        },
        ar = {
            {"arccw_uc_sks", "СКС"},
            {"arccw_cod4e_ak47", "АК-47"},
            {"arccw_mw3e_ak74u", "АКС-74У"},
            {"arccw_ur_ak", "АКМ (модульный: АК-74, РПК, «Витязь»)"},
            {"arccw_bo2_an94", "АН-94 «Абакан»"}
        },
        sniper = {
            {"arccw_waw_mosin", "Мосинка"},
            {"arccw_waw_svt40", "СВТ-40"},
            {"arccw_uc_svd", "СВД"},
            {"arccw_bo2_svu", "СВУ-АС"},
            {"arccw_waw_ptrs41", "ПТРС-41"}
        },
        machinegun = {
            {"arccw_waw_dp28", "ДП-27"},
            {"arccw_bo2_rpd", "РПД"},
            {"arccw_bo1_rpk", "РПК-74"},
            {"arccw_uc_pkm", "ПКМ"}
        }
    },
    USA = {
        pistol = {
            {"arccw_ur_m1911", "M1911"},
            {"arccw_cod4e_m9", "Beretta M9"},
            {"arccw_bo1_python", "Colt Python"},
            {"arccw_ur_329", "S&W 329PD"}
        },
        smg = {
            {"arccw_waw_thompson", "Thompson M1A1"},
            {"arccw_bo2_thompson", "Thompson M1927"},
            {"arccw_bo1_mac11", "MAC-11"},
            {"arccw_bo2_vector", "KRISS Vector"}
        },
        shotgun = {
            {"arccw_bo1_ithaca", "Ithaca 37"},
            {"arccw_waw_trenchgun", "M1897 Trench Gun"},
            {"arccw_ud_870", "Remington 870"},
            {"arccw_bo2_ksg", "Kel-Tec KSG"},
            {"arccw_mw3e_aa12", "AA-12"}
        },
        ar = {
            {"arccw_kali_ar15", "AR-15"},
            {"arccw_bo1_m16", "M16A1"},
            {"arccw_ud_m16", "M16A2 (модульный: M4, CQBR)"},
            {"arccw_cod4e_m4m16", "M16A4"},
            {"arccw_mw3e_m4a1", "M4A1"},
            {"arccw_mw3e_acr", "Remington ACR"}
        },
        sniper = {
            {"arccw_waw_springfield", "M1903 Springfield"},
            {"arccw_waw_garand", "M1 Garand"},
            {"arccw_uc_m14", "M14"},
            {"arccw_cod4e_r700", "Remington 700"},
            {"arccw_cod4e_m40a3", "M40A3"},
            {"arccw_ua_m82", "Barrett M82"}
        },
        machinegun = {
            {"arccw_waw_bar", "M1918 BAR"},
            {"arccw_waw_m1919", "M1919A4"},
            {"arccw_ua_m60", "M60"},
            {"arccw_ua_m249", "M249"},
            {"arccw_bo2_mk48", "Mk 48"}
        }
    },
    GBC = {
        pistol = {
            {"arccw_waw_p38", "Walther P38"},
            {"arccw_bo3_c96", "Mauser C96"},
            {"arccw_ud_glock", "Glock 17"},
            {"arccw_mw3e_p99", "Walther P99"},
            {"arccw_uc_usp", "HK USP"},
            {"arccw_bo2_fiveseven", "FN Five-seveN"}
        },
        smg = {
            {"arccw_bo3_mp40", "MP40"},
            {"arccw_bo1_sten", "Sten Mk II"},
            {"arccw_ur_mp5", "HK MP5"},
            {"arccw_mw3e_ump45", "HK UMP-45"},
            {"arccw_bo2_mp7", "HK MP7"},
            {"arccw_mw3e_p90", "FN P90"}
        },
        shotgun = {
            {"arccw_bo1_olympia", "Beretta 682"},
            {"arccw_ur_spas12", "SPAS-12"},
            {"arccw_shorty", "Benelli M3"},
            {"arccw_ud_m1014", "Benelli M4"}
        },
        ar = {
            {"arccw_bo3_stg44", "StG 44"},
            {"arccw_bo1_fal", "FN FAL"},
            {"arccw_ur_g3", "HK G3"},
            {"arccw_mw2e_famas", "FAMAS"},
            {"arccw_cod4e_g36c", "HK G36C"},
            {"arccw_myt_uc_scar", "FN SCAR-H"}
        },
        sniper = {
            {"arccw_waw_k98k", "Kar98k"},
            {"arccw_waw_g43", "Gewehr 43"},
            {"arccw_bo1_l96", "L96A1"},
            {"arccw_bo1_wa2000", "Walther WA 2000"},
            {"arccw_awm", "AWM"}
        },
        machinegun = {
            {"arccw_bo2_mg08", "MG 08/15"},
            {"arccw_waw_fg42", "FG 42"},
            {"arccw_waw_mg42", "MG 42"},
            {"arccw_bo1_hk21", "HK21"},
            {"arccw_mw3e_l86", "L86A2 LSW"}
        }
    },
    WN = {
        pistol = {
            {"arccw_waw_nambu", "Nambu Type 14"},
            {"arccw_bo1_cz75", "CZ 75"},
            {"arccw_ragingbull", "Taurus Raging Bull"},
            {"arccw_ur_deagle", "Desert Eagle"}
        },
        smg = {
            {"arccw_bo1_skorpion", "Vz. 61 Skorpion"},
            {"arccw_bo1_pm63", "PM-63 RAK"},
            {"arccw_ud_uzi", "Uzi"},
            {"arccw_mw3e_pm9", "Minebea PM-9"},
            {"arccw_bo2_scorpion", "CZ Scorpion Evo 3"}
        },
        shotgun = {
            {"arccw_mw3e_striker", "Striker-12"},
            {"arccw_myt_uc_neostead", "NeoStead 2000"},
            {"arccw_mw3e_usas12", "USAS-12"}
        },
        ar = {
            {"arccw_bo1_galil", "Galil"},
            {"arccw_cde_ak5", "Ak 5"},
            {"arccw_sg552", "SIG SG 552"},
            {"arccw_bo2_type95", "QBZ-95"},
            {"arccw_bo2_mtar", "Tavor X95"},
            {"arccw_bo2_sig556", "SIG 556"}
        },
        sniper = {
            {"arccw_waw_arisaka", "Arisaka Type 99"},
            {"arccw_sg550", "SIG SG 550"},
            {"arccw_myt_uc_gm6", "GM6 Lynx"}
        },
        machinegun = {
            {"arccw_waw_type99", "Type 99"},
            {"arccw_bo2_qbb", "QJB-95"},
            {"arccw_bo2_rpd", "РПД"}
        }
    }
}

-- Снаряжение (общее для всех): категория -> {{класс, название, цена}, ...}
PR_SHOP_DEFAULTS.Equipment = {
    grenade_lethal = {
        {"arccw_nade_frag", "Осколочная граната", 900},
        {"arccw_nade_impact", "Ударная граната", 900},
        {"arccw_nade_semtex", "Семтекс (липкая)", 1100},
        {"arccw_nade_incendiary", "Термитная граната", 800}
    },
    grenade_unlethal = {
        {"arccw_nade_smoke", "Дымовая граната", 300},
        {"arccw_nade_flash", "Светошумовая граната", 500},
        {"arccw_nade_gas", "Газовая граната", 600}
    },
    explosion = {
        {"arccw_nade_claymore", "Мина «Клеймор»", 3500},
        {"weapon_simmines", "Противотанковые мины", 6000}
    },
    melee_weapon = {
        {"arccw_melee_knife", "Нож", 200},
        {"arccw_bo1_shiv", "Заточка", 200},
        {"arccw_bo1_sog_knife", "Нож S.O.G.", 400}
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
        {"gred_emp_binoculars", "Бинокль корректировщика", 800}
    },
    rocket_launchers = {
        {"arccw_ud_m79", "M79 (40 мм)", 3500},
        {"arccw_bo1_law", "M72 LAW", 4000},
        {"arccw_uc_rpg26", "РПГ-26", 5000},
        {"arccw_bo1_chinalake", "China Lake (40 мм)", 6000},
        {"arccw_uc_rpg7", "РПГ-7", 7000},
        {"arccw_uc_at4", "AT4", 7000},
        {"arccw_bo2_m32", "Milkor M32 (40 мм)", 9000}
    },
    signal_device = {
        {"arccw_nade_flare", "Сигнальный факел", 200}
    },
    armor_and_else = {
        {"item_battery", "Бронепластина (+15 брони)", 800},
        {"pr_ammo_kit_small", "Подсумок с патронами", 300},
        {"pr_ammo_kit", "Сумка с патронами", 700},
        {"pr_ammo_crate_small", "Малый ящик патронов", 1500},
        {"pr_ammo_crate", "Ящик патронов", 3000},
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
    -- Мародёры: только старьё — Вторая мировая и холодная война, ничего современного
    SCAV = {
        {"sim_fphys_pwtrabant", "Трабант", "light_armor", 1500, "simfphys"},
        {"sim_fphys_pwzaz", "ЗАЗ «Запорожец»", "light_armor", 1500, "simfphys"},
        {"sim_fphys_jeep", "Багги", "light_armor", 3000, "simfphys"},
        {"sim_fphys_jeep_armed2", "Багги с пулемётом", "light_armor", 8000, "simfphys"},
        {"sim_fphys_pwgaz52", "ГАЗ-52", "support_vehicle", 4000, "simfphys"},
        {"sim_fphys_pwliaz", "ЛиАЗ", "support_vehicle", 5000, "simfphys"},
        {"sim_fphys_conscriptapc_armed", "Старый БТР", "bmp_and_btr", 25000, "simfphys"},
        {"sim_fphys_tank2", "M4 Sherman", "tanks", 55000, "simfphys"},
        {"sim_fphys_tank", "Tiger I", "tanks", 65000, "simfphys"},
        {"gred_lfs_oh6", "OH-6 Cayuse", "helicopters", 55000, "no_simfphys"},
        {"gred_lfs_ah1g", "AH-1G Cobra", "helicopters", 85000, "no_simfphys"},
        {"gred_lfs_mi24a", "Ми-24А", "helicopters", 100000, "no_simfphys"}
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
    SCAV = {
        {"models/player/guerilla.mdl", 0, 1},
        {"models/player/group03/male_04.mdl", 0, 1},
        {"models/player/leet.mdl", 1500, 3},
        {"models/player/group03m/male_06.mdl", 3000, 5}
    },
    WN = {
        {"models/player/group03/male_07.mdl", 0, 1},
        {"models/player/group03/male_02.mdl", 1000, 2},
        {"models/player/combine_soldier_prisonguard.mdl", 6000, 6}
    }
}
