if SERVER then
    util.AddNetworkString("PurchasedTable")
    util.AddNetworkString("PR_ClientReady")
end

if CLIENT then
    PR_PurchasedModels = PR_PurchasedModels or {}
    PR_PurchasedWeapons = PR_PurchasedWeapons or {}
    PR_Preset = PR_Preset or {}

    net.Receive("PurchasedTable", function()
        PR_PurchasedModels = net.ReadTable()
        PR_PurchasedWeapons = net.ReadTable()
        PR_Preset = net.ReadTable()
        hook.Run("PR_PurchasedUpdated")
    end)

    -- Сервер шлёт купленное только когда клиент загрузился, иначе сообщение теряется
    hook.Add("InitPostEntity", "PR_ClientReady", function()
        net.Start("PR_ClientReady")
        net.SendToServer()
    end)
end

if SERVER then
    -- Сейвы лежат в sqlite (sv_db.lua, таблицы pr_players*), ключ — SteamID64.
    -- Старый общий players.txt (по нику) переносится при первом заходе игрока.
    local LEGACY_FILE = "pr_gamemode/players.txt"
    local LEGACY_BACKUP = "pr_gamemode/json_backup/players.txt"

    -- Поля сейва: ключ в данных игрока, NW-переменная, тип, значение по умолчанию
    local SAVE_FIELDS = {
        {"Money", "PR_money", "Int", 0},
        {"Exp", "PR_exp", "Int", 0},
        {"Coin", "PR_coin", "Int", 0},
        {"Level", "PR_level", "Int", 1},
        {"Fraction", "PR_fraction", "String", ""},
        {"Admin", "PR_admin", "Bool", false},

        {"Kills", "PR_kills", "Int", 0},
        {"Kills_Npc", "PR_kills_npc", "Int", 0},
        {"Deaths", "PR_deaths", "Int", 0}
    }

    for _, frac in ipairs(PR_FRACTIONS) do
        table.insert(SAVE_FIELDS, {"Money_" .. frac, "PR_money_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Exp_" .. frac, "PR_exp_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Level_" .. frac, "PR_level_" .. frac, "Int", 1})
        table.insert(SAVE_FIELDS, {"Weapon_exp_" .. frac, "PR_weapon_exp_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Leader_" .. frac, "PR_leader_" .. frac, "Bool", false})
    end

    -- Ключ сейва: SteamID64. У ботов и в LAN-режиме (sv_lan 1) SteamID нет, тогда по хэшу ника.
    function PR_SaveKey(ply)
        if ply:IsBot() then
            return "bot_" .. util.CRC(ply:Nick())
        end

        local id = ply:SteamID64()
        if not id or id == "" or id == "0" then
            return "nick_" .. util.CRC(ply:Nick())
        end

        return id
    end

    local function CollectPlayer(ply)
        local data = {}

        for _, f in ipairs(SAVE_FIELDS) do
            local key, nw, kind = f[1], f[2], f[3]

            if kind == "Int" then
                data[key] = ply:GetNWInt(nw)
            elseif kind == "Bool" then
                data[key] = ply:GetNWBool(nw)
            else
                data[key] = ply:GetNWString(nw)
            end
        end

        data["Nick"] = ply:Nick() -- чтобы в базе было видно, чей это сейв
        data["PurchasedModels"] = ply.PurchasedModels or {}
        data["PurchasedWeapons"] = ply.PurchasedWeapons or {}
        data["Preset"] = ply.Preset or {}
        data["Outfit"] = ply.PR_Outfit

        return data
    end

    function PR_Save_Player(ply)
        -- Не затираем сейв, если игрок вышел до загрузки. Бот-экипаж техники патруля не сохраняем
        if not IsValid(ply) or not ply.PR_Loaded or ply:GetNWBool("PR_PatrolCrew") then return end

        PR_DB.SavePlayer(PR_SaveKey(ply), CollectPlayer(ply))
    end

    function PR_Save_All()
        PR_DB.Transaction(function()
            for _, ply in ipairs(player.GetAll()) do
                PR_Save_Player(ply)
            end
        end)
    end

    -- Перенос из старого players.txt по нику. Запись оттуда удаляется, чтобы
    -- её не забрал другой игрок с таким же ником. PR-админку при переносе не даём.
    local function MigrateLegacy(ply)
        if ply:IsBot() then return end

        local legacy = util.JSONToTable(file.Read(LEGACY_FILE, "DATA") or "")
        if not istable(legacy) then return end

        local data = legacy[ply:Nick()]
        if not istable(data) then return end

        -- Копия исходного файла один раз, до первых изменений
        if not file.Exists(LEGACY_BACKUP, "DATA") then
            file.CreateDir("pr_gamemode/json_backup")
            file.Write(LEGACY_BACKUP, file.Read(LEGACY_FILE, "DATA"))
        end

        legacy[ply:Nick()] = nil
        if table.IsEmpty(legacy) then
            file.Delete(LEGACY_FILE)
        else
            file.Write(LEGACY_FILE, util.TableToJSON(legacy, true))
        end

        data["Admin"] = false
        MsgN("[PR] перенёс сейв " .. ply:Nick() .. " из players.txt в sqlite (" .. PR_SaveKey(ply) .. ")")

        return data
    end

    function PR_Load_Player(ply)
        local saved = PR_DB.LoadPlayer(PR_SaveKey(ply))
        local fresh = not istable(saved)

        if fresh then
            saved = MigrateLegacy(ply)
        end

        local data = istable(saved) and saved or {}

        for _, f in ipairs(SAVE_FIELDS) do
            local key, nw, kind, default = f[1], f[2], f[3], f[4]
            local value = data[key]

            if kind == "Int" then
                ply:SetNWInt(nw, math.floor(tonumber(value) or default))
            elseif kind == "Bool" then
                if value == nil then value = default end
                ply:SetNWBool(nw, value == true)
            else
                ply:SetNWString(nw, isstring(value) and value or default)
            end
        end

        -- В старой версии мародёры назывались "admin"
        if ply:GetNWString("PR_fraction") == "admin" then
            ply:SetNWString("PR_fraction", "SCAV")
        end

        ply.PurchasedModels = istable(data["PurchasedModels"]) and data["PurchasedModels"] or {}
        ply.PurchasedWeapons = istable(data["PurchasedWeapons"]) and data["PurchasedWeapons"] or {}
        ply.Preset = istable(data["Preset"]) and data["Preset"] or {}
        ply.PR_Outfit = istable(data["Outfit"]) and data["Outfit"] or nil

        ply.PR_Loaded = true

        if fresh then
            PR_Save_Player(ply)
        end
    end

    function PR_SendPurchased(ply)
        net.Start("PurchasedTable")
            net.WriteTable(ply.PurchasedModels or {})
            net.WriteTable(ply.PurchasedWeapons or {})
            net.WriteTable(ply.Preset or {})
        net.Send(ply)
    end

    net.Receive("PR_ClientReady", function(len, ply)
        if ply.PR_SentPurchased then return end
        ply.PR_SentPurchased = true

        PR_SendPurchased(ply)
    end)

    hook.Add("PlayerInitialSpawn", "PR_LoadPlayerData", PR_Load_Player)
    hook.Add("PlayerDisconnected", "PR_SavePlayerData", PR_Save_Player)

    -- Автосейв раз в 5 минут, чтобы краш сервера не съедал прогресс
    timer.Create("PR_AutoSave", 300, 0, PR_Save_All)
end
