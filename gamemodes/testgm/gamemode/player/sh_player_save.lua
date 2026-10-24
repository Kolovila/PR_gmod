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
    end)

    -- Сервер шлёт купленное только когда клиент загрузился, иначе сообщение теряется
    hook.Add("InitPostEntity", "PR_ClientReady", function()
        net.Start("PR_ClientReady")
        net.SendToServer()
    end)
end

if SERVER then
    local SAVE_DIR = "pr_gamemode"
    local SAVE_FILE = SAVE_DIR .. "/players.txt"

    -- Поля сейва: ключ в players.txt, NW-переменная, тип, значение по умолчанию.
    -- Формат файла не менялся, старые сейвы читаются как есть.
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

    for _, frac in ipairs({"SSNK", "USA", "GBC", "WN"}) do
        table.insert(SAVE_FIELDS, {"Money_" .. frac, "PR_money_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Exp_" .. frac, "PR_exp_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Level_" .. frac, "PR_level_" .. frac, "Int", 1})
        table.insert(SAVE_FIELDS, {"Weapon_exp_" .. frac, "PR_weapon_exp_" .. frac, "Int", 0})
        table.insert(SAVE_FIELDS, {"Leader_" .. frac, "PR_leader_" .. frac, "Bool", false})
    end

    local function ReadSaves()
        return util.JSONToTable(file.Read(SAVE_FILE, "DATA") or "") or {}
    end

    local function WriteSaves(list)
        if not file.Exists(SAVE_DIR, "DATA") then
            file.CreateDir(SAVE_DIR)
        end

        file.Write(SAVE_FILE, util.TableToJSON(list, true))
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

        data["PurchasedModels"] = ply.PurchasedModels or {}
        data["PurchasedWeapons"] = ply.PurchasedWeapons or {}
        data["Preset"] = ply.Preset or {}

        return data
    end

    function PR_Save_Player(ply)
        -- Не затираем сейв, если игрок вышел до загрузки
        if not IsValid(ply) or not ply.PR_Loaded then return end

        local list = ReadSaves()
        list[ply:Nick()] = CollectPlayer(ply)
        WriteSaves(list)
    end

    function PR_Save_All()
        local list = ReadSaves()

        for _, ply in ipairs(player.GetAll()) do
            if ply.PR_Loaded then
                list[ply:Nick()] = CollectPlayer(ply)
            end
        end

        WriteSaves(list)
    end

    function PR_Load_Player(ply)
        local saved = ReadSaves()[ply:Nick()]
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

        ply.PurchasedModels = istable(data["PurchasedModels"]) and data["PurchasedModels"] or {}
        ply.PurchasedWeapons = istable(data["PurchasedWeapons"]) and data["PurchasedWeapons"] or {}
        ply.Preset = istable(data["Preset"]) and data["Preset"] or {}

        ply.PR_Loaded = true

        if not saved then
            PR_Save_Player(ply)
        end
    end

    local function SendPurchased(ply)
        net.Start("PurchasedTable")
            net.WriteTable(ply.PurchasedModels or {})
            net.WriteTable(ply.PurchasedWeapons or {})
            net.WriteTable(ply.Preset or {})
        net.Send(ply)
    end

    net.Receive("PR_ClientReady", function(len, ply)
        if ply.PR_SentPurchased then return end
        ply.PR_SentPurchased = true

        SendPurchased(ply)
    end)

    hook.Add("PlayerInitialSpawn", "PR_LoadPlayerData", PR_Load_Player)
    hook.Add("PlayerDisconnected", "PR_SavePlayerData", PR_Save_Player)

    -- Автосейв раз в 5 минут, чтобы краш сервера не съедал прогресс
    timer.Create("PR_AutoSave", 300, 0, PR_Save_All)
end
