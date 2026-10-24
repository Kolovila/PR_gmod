-- Патрули NPC: общие настройки и стартовые варианты.
-- Логика в gamemode/sv_patrols.lua. Споты на карте и сами варианты админ правит в игре
-- «Редактором патрулей» (Shift+R — окно вариантов). Варианты живут в базе (pr_patrol_types):
-- этот список попадает туда один раз, при первом запуске, дальше правки только через редактор.
--
-- Поля варианта:
--   leader    — главный (может не быть), followers — группы свиты: класс(ы), сколько, оружие.
--   class     — список классов NPC, каждому берётся случайный.
--   weapons   — NPC-оружие (weapon_vj_*), каждому случайное из списка.
--   reward    — сколько платим убийце: деньги и опыт.
--   drop      — что падает с трупа игрокам (первое установленное из списка).
--   formation — строй свиты: "around" (вокруг главного), "wedge" (клин), "column" (колонна).

PR_PATROL_SETTINGS = {
    firstDelay = {120, 300},  -- первая попытка спавна после старта карты, секунды (от и до)
    interval = {600, 1200},   -- пауза между попытками спавна
    maxActive = 2,            -- сколько патрулей ходит одновременно
    lifetime = {1200, 1800},  -- сколько патруль гуляет, потом уходит (исчезает, когда рядом нет игроков)
    safeDistance = 2500,      -- не появляться и не исчезать ближе этого к игрокам
    linkDistance = 1600,      -- споты дальше друг от друга не соединяются в маршрут
    linger = {20, 45}         -- сколько стоять, придя на новую территорию
}

PR_PATROL_DEFAULTS = {
    -- Таможня, Escape from Tarkov: Решала держится позади, четверо охранников идут впереди и
    -- первыми лезут в бой. С Решалы падает его ТТ (в Таркове — золотой).
    reshala = {
        name = "Решала со свитой",
        weight = 1,        -- вес при выборе варианта, когда вариантов несколько
        chance = 0.6,      -- шанс, что попытка спавна вообще что-то выпустит
        maxAlive = 1,      -- сколько таких патрулей может быть на карте одновременно
        npcClass = "CLASS_PR_BANDITS", -- VJ-класс: враги всем игрокам и защитникам точек

        announce = "Ходят слухи, что Решала со свитой вышел на район",
        leaderKilled = "Решала убит! Отличился %s",

        leader = {
            name = "Решала",
            class = {"npc_vj_mishawild_reshala1"},
            weapons = {"weapon_vj_meft_reshala_ak101"},
            health = 600,
            reward = {money = 3000, exp = 15},
            drop = {"cw_kk_ins2_nam_tt33"},
            dropGold = true
        },

        followers = {
            {
                name = "Охрана Решалы",
                class = {
                    "npc_vj_mishawild_bully_security1",
                    "npc_vj_mishawild_bully_security2",
                    "npc_vj_mishawild_bully_security3",
                    "npc_vj_mishawild_bully_security4"
                },
                count = 4,
                weapons = {"weapon_vj_meft_ak74m", "weapon_vj_meft_aks74u", "weapon_vj_meft_mp153", "weapon_vj_meft_sks", "weapon_vj_meft_kedr"},
                health = 300,
                reward = {money = 500, exp = 4}
            }
        },

        -- Двое впереди, двое по бокам — Решала в середине
        formation = "around"
    }
}
