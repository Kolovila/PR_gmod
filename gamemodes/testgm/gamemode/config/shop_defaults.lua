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
            {"arccw_firearms2_pmm", "ПММ"},
            {"arccw_firearms2_gsh18", "ГШ-18"},
            {"arccw_firearms2_ots33", "ОЦ-33 «Пернач»"}
        },
        smg = {
            {"arccw_firearms2_pp19", "ПП-19 «Бизон»"},
            {"arccw_uc_fort230", "Форт-230"}
        },
        shotgun = {
            {"arccw_ur_db", "ИЖ-58"},
            {"arccw_firearms2_toz34", "ТОЗ-34"},
            {"arccw_firearms2_mp153", "МР-153"},
            {"arccw_eft_mp155", "МР-155"},
            {"arccw_uc_ks23", "КС-23"},
            {"arccw_firearms2_saiga12k", "Сайга-12К"}
        },
        ar = {
            {"arccw_uc_sks", "СКС"},
            {"arccw_firearms2_ak47", "АК-47"},
            {"arccw_ur_ak", "АКМ (модульный)"},
            {"arccw_firearms2_aks74u", "АКС-74У"},
            {"arccw_firearms2_ak74", "АК-74"},
            {"arccw_firearms2_ak12", "АК-12"}
        },
        sniper = {
            {"arccw_uc_svd", "СВД"},
            {"arccw_firearms2_vss", "ВСС «Винторез»"},
            {"arccw_eft_t5000", "T-5000"},
            {"arccw_uc_6p62", "6П62 (12,7 мм)"}
        },
        machinegun = {
            {"arccw_firearms2_rpk47", "РПК"},
            {"arccw_uc_pkm", "ПКМ"}
        }
    },
    USA = {
        pistol = {
            {"arccw_ur_m1911", "M1911"},
            {"arccw_ud_glock", "Glock 17"},
            {"arccw_firearms2_glock20", "Glock 20"},
            {"arccw_ur_329", "S&W 329PD"},
            {"arccw_ur_deagle", "Desert Eagle"}
        },
        smg = {
            {"arccw_firearms2_mac11", "MAC-11"},
            {"arccw_uc_vector", "KRISS Vector"},
            {"arccw_uc_lynx", "AAC Honey Badger"}
        },
        shotgun = {
            {"arccw_uc_m37", "Ithaca 37"},
            {"arccw_ud_870", "Remington 870"},
            {"arccw_firearms2_mossbergm88c", "Mossberg 88 Cruiser"},
            {"arccw_firearms2_shorty", "Super-Shorty"},
            {"arccw_firearms2_rem870_tact", "Remington 870 Tactical"},
            {"arccw_uc_aa12", "AA-12"}
        },
        ar = {
            {"arccw_ud_mini14", "Mini-14"},
            {"arccw_ud_m16", "M16A2 (модульный: M4, CQBR)"},
            {"arccw_firearms2_m4a1", "M4A1"},
            {"arccw_firearms2_lr300", "LR-300"}
        },
        sniper = {
            {"arccw_uc_m14", "M14"},
            {"arccw_firearms2_m21", "M21"},
            {"arccw_firearms2_m24", "M24"},
            {"arccw_firearms2_m40a3", "M40A3"},
            {"arccw_firearms2_m110", "M110"},
            {"arccw_ua_m82", "Barrett M82A1"}
        },
        machinegun = {
            {"arccw_ua_m60", "M60"},
            {"arccw_ua_m249", "M249"},
            {"arccw_firearms2_m60e3", "M60E3"}
        }
    },
    GBC = {
        pistol = {
            {"arccw_firearms2_p226", "SIG P226"},
            {"arccw_uc_usp", "HK USP"},
            {"arccw_firearms2_sterling_mk7a4", "Sterling Mk7A4"}
        },
        smg = {
            {"arccw_firearms2_stenmk2", "Sten Mk II"},
            {"arccw_firearms2_sterling_l2a3", "Sterling L2A3"},
            {"arccw_ur_mp5", "HK MP5A4"},
            {"arccw_firearms2_mp5k", "HK MP5K"},
            {"arccw_firearms2_ump45", "HK UMP-45"},
            {"arccw_firearms2_p90", "FN P90"}
        },
        shotgun = {
            {"arccw_ur_spas12", "SPAS-12"},
            {"arccw_firearms2_m3s90", "Benelli M3"},
            {"arccw_ud_m1014", "Benelli M4"}
        },
        ar = {
            {"arccw_firearms2_fnfal", "FN FAL"},
            {"arccw_ur_g3", "HK G3A3"},
            {"arccw_firearms2_famas", "FAMAS F1"},
            {"arccw_firearms2_l85a2", "L85A2"},
            {"arccw_firearms2_g36k", "HK G36K"},
            {"arccw_myt_uc_scar", "FN SCAR-H"}
        },
        sniper = {
            {"arccw_firearms2_kar98k", "Kar98k"},
            {"arccw_uc_scout", "Steyr Scout"},
            {"arccw_ur_aw", "AI Arctic Warfare"}
        },
        machinegun = {
            {"arccw_firearms2_minimi", "FN Minimi"},
            {"arccw_uc_evolys", "FN Evolys"}
        }
    },
    WN = {
        pistol = {
            {"arccw_firearms2_ragingbull", "Taurus Raging Bull"},
            {"arccw_firearms2_deagle357", "Desert Eagle .357"},
            {"arccw_firearms2_mp9", "B&T MP9"}
        },
        smg = {
            {"arccw_ud_uzi", "Uzi"},
            {"arccw_firearms2_uzi", "Micro Uzi"}
        },
        shotgun = {
            {"arccw_firearms2_bm16_swn", "Обрез"},
            {"arccw_myt_uc_neostead", "NeoStead 2000"}
        },
        ar = {
            {"arccw_firearms2_galil", "IMI Galil"},
            {"arccw_firearms2_rk95", "Sako RK-95"},
            {"arccw_firearms2_sg552", "SIG SG 552"},
            {"arccw_firearms2_sg551", "SIG SG 551"},
            {"arccw_uc_cz805", "CZ 805 Bren"}
        },
        sniper = {
            {"arccw_uc_psl", "PSL-54C"},
            {"arccw_firearms2_sg550", "SIG SG 550"},
            {"arccw_myt_uc_gm6", "GM6 Lynx"}
        },
        machinegun = {
            {"arccw_uc_u100", "Ultimax-100"},
            {"arccw_firearms2_rpk47", "РПК"}
        }
    }
}

-- Снаряжение (общее для всех): категория -> {{класс, название, цена}, ...}
PR_SHOP_DEFAULTS.Equipment = {
    grenade_lethal = {
        {"arccw_uo_f1", "Ф-1", 900},
        {"arccw_uo_rgd5", "РГД-5", 800},
        {"arccw_uo_rgo", "РГО", 1000},
        {"arccw_uo_m67", "M67", 900},
        {"arccw_uo_m26", "M26", 900},
        {"arccw_uo_molotov", "Коктейль Молотова", 600}
    },
    grenade_unlethal = {
        {"arccw_uo_rdg1", "РДГ-1 (дым)", 300},
        {"arccw_uo_m18", "M18 (дым)", 300},
        {"arccw_uo_m84", "M84 (светошумовая)", 500},
        {"arccw_uo_zarya", "«Заря» (светошумовая)", 500}
    },
    explosion = {
        {"arccw_uo_ied", "СВУ", 3000},
        {"arccw_uo_c4", "Подрывной заряд", 4500},
        {"arccw_firearms2_nade_claymore", "M18A1 «Клеймор»", 3500},
        {"arccw_uo_tmrp6", "Противотанковая мина ТМРП-6", 5000},
        {"weapon_simmines", "Противотанковые мины", 6000}
    },
    melee_weapon = {
        {"arccw_firearms2_m9_bayonet", "Штык-нож M9", 200},
        {"arccw_firearms2_dv2", "Нож DV2", 300},
        {"arccw_firearms2_machete", "Мачете", 400}
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
        {"arccw_uc_rpg26", "РПГ-26", 5000},
        {"arccw_uc_rpg7", "РПГ-7", 7000},
        {"arccw_uc_at4", "AT4", 7000},
        {"arccw_uc_smaw", "Mk 153 SMAW", 9000},
        {"arccw_uc_igla", "9К38 «Игла»", 20000},
        {"arccw_uc_javelin", "FGM-148 Javelin", 30000}
    },
    signal_device = {
        {"arccw_uo_flare", "Сигнальный факел", 200}
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
