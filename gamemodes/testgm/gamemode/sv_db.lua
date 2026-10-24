-- Хранилище режима: SQLite (garrysmod/sv.db, встроенная в GMod библиотека sql).
-- Все таблицы с префиксом pr_. Старые JSON из data/pr_gamemode импортируются один раз
-- и переезжают в data/pr_gamemode/json_backup.

PR_DB = PR_DB or {}

----------------------------------------------------------------------------------------------------
-- Запросы
----------------------------------------------------------------------------------------------------

local function Escape(value)
    if value == nil then return "NULL" end
    if isbool(value) then return value and "1" or "0" end
    if isnumber(value) then return tostring(value) end

    return sql.SQLStr(tostring(value))
end

-- Глубина вложенных транзакций (см. PR_DB.Transaction)
local depth = 0

-- PR_DB.Query("SELECT * FROM t WHERE a = ? AND b = ?", a, b) -> список строк (может быть пустым) или nil при ошибке.
-- Все значения из sqlite приходят строками, NULL приходит строкой "NULL".
-- Внутри транзакции ошибка запроса откатывает всю транзакцию.
function PR_DB.Query(query, ...)
    local count = select("#", ...)
    local args = {...}
    local i = 0

    query = string.gsub(query, "%?", function()
        i = i + 1
        return Escape(args[i])
    end)

    if i ~= count then
        ErrorNoHalt("[PR] SQL: ожидалось " .. i .. " параметров, передано " .. count .. "\n  " .. query .. "\n")
        return nil
    end

    local result = sql.Query(query)
    if result == false then
        local message = "[PR] SQL ошибка: " .. tostring(sql.LastError()) .. "\n  " .. query
        if depth > 0 then error(message, 0) end

        ErrorNoHalt(message .. "\n")
        return nil
    end

    return result or {}
end

local function Str(value)
    if value == nil or value == "NULL" then return nil end
    return value
end

local function Num(value, default)
    return tonumber(Str(value)) or default
end

local function Json(value)
    local s = Str(value)
    if not s or s == "" then return nil end
    return util.JSONToTable(s)
end

-- Транзакция. Вложенные вызовы идут внутри внешней.
function PR_DB.Transaction(fn)
    if depth == 0 then sql.Query("BEGIN") end
    depth = depth + 1

    local ok, err = pcall(fn)

    depth = depth - 1
    if depth == 0 then
        if ok then
            sql.Query("COMMIT")
        else
            sql.Query("ROLLBACK")
        end
    end

    if not ok then
        ErrorNoHalt("[PR] SQL транзакция откатилась: " .. tostring(err) .. "\n")
        if depth > 0 then error(err, 0) end
    end

    return ok
end

----------------------------------------------------------------------------------------------------
-- Схема
----------------------------------------------------------------------------------------------------

local SCHEMA = {
    [[CREATE TABLE IF NOT EXISTS pr_meta (
        key TEXT PRIMARY KEY,
        value TEXT
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_players (
        steamid TEXT PRIMARY KEY,
        nick TEXT NOT NULL DEFAULT '',
        money INTEGER NOT NULL DEFAULT 0,
        exp INTEGER NOT NULL DEFAULT 0,
        coin INTEGER NOT NULL DEFAULT 0,
        level INTEGER NOT NULL DEFAULT 1,
        fraction TEXT NOT NULL DEFAULT '',
        admin INTEGER NOT NULL DEFAULT 0,
        kills INTEGER NOT NULL DEFAULT 0,
        kills_npc INTEGER NOT NULL DEFAULT 0,
        deaths INTEGER NOT NULL DEFAULT 0,
        outfit_model TEXT NOT NULL DEFAULT '',
        outfit_bodygroups TEXT NOT NULL DEFAULT '',
        updated_at INTEGER NOT NULL DEFAULT 0
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_player_fractions (
        steamid TEXT NOT NULL,
        fraction TEXT NOT NULL,
        money INTEGER NOT NULL DEFAULT 0,
        exp INTEGER NOT NULL DEFAULT 0,
        level INTEGER NOT NULL DEFAULT 1,
        weapon_exp INTEGER NOT NULL DEFAULT 0,
        leader INTEGER NOT NULL DEFAULT 0,
        PRIMARY KEY (steamid, fraction)
    )]],

    -- kind: weapon | model
    [[CREATE TABLE IF NOT EXISTS pr_player_items (
        steamid TEXT NOT NULL,
        kind TEXT NOT NULL,
        item TEXT NOT NULL,
        PRIMARY KEY (steamid, kind, item)
    )]],

    -- slot: Primary | Secondary
    [[CREATE TABLE IF NOT EXISTS pr_player_presets (
        steamid TEXT NOT NULL,
        slot TEXT NOT NULL,
        item TEXT NOT NULL,
        name TEXT NOT NULL DEFAULT '',
        PRIMARY KEY (steamid, slot)
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_points (
        name TEXT PRIMARY KEY,
        team TEXT NOT NULL DEFAULT 'Ничья',
        monitor INTEGER NOT NULL DEFAULT 0,
        computer INTEGER NOT NULL DEFAULT 1
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_point_layout (
        map TEXT NOT NULL,
        name TEXT NOT NULL,
        x REAL NOT NULL, y REAL NOT NULL, z REAL NOT NULL,
        pitch REAL NOT NULL DEFAULT 0, yaw REAL NOT NULL DEFAULT 0, roll REAL NOT NULL DEFAULT 0,
        PRIMARY KEY (map, name)
    )]],

    -- Магазины. id задаёт порядок товаров. extra — JSON с полями, которых нет в колонках.
    [[CREATE TABLE IF NOT EXISTS pr_shop_weapons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fraction TEXT NOT NULL,
        class TEXT NOT NULL,
        name TEXT,
        price INTEGER,
        exp INTEGER,
        tier INTEGER,
        type TEXT,
        unlock TEXT,
        extra TEXT
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_shop_equipment (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        class TEXT NOT NULL,
        name TEXT,
        price INTEGER,
        tier TEXT,
        type TEXT,
        extra TEXT
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_shop_vehicles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fraction TEXT NOT NULL,
        class TEXT NOT NULL,
        name TEXT,
        price INTEGER,
        type TEXT,
        mod TEXT,
        extra TEXT
    )]],

    [[CREATE TABLE IF NOT EXISTS pr_shop_cloth (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fraction TEXT NOT NULL,
        model TEXT NOT NULL,
        price INTEGER,
        level INTEGER,
        extra TEXT
    )]],

    -- Споты патрулей NPC (sv_patrols.lua): точки, где патруль появляется и между которыми ходит.
    -- zone — название территории, патруль старается ходить между разными территориями.
    [[CREATE TABLE IF NOT EXISTS pr_patrol_spots (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        map TEXT NOT NULL,
        x REAL NOT NULL, y REAL NOT NULL, z REAL NOT NULL,
        zone TEXT NOT NULL DEFAULT ''
    )]]
}

for _, statement in ipairs(SCHEMA) do
    PR_DB.Query(statement)
end

function PR_DB.GetMeta(key)
    local rows = PR_DB.Query("SELECT value FROM pr_meta WHERE key = ?", key)
    return rows and rows[1] and Str(rows[1].value)
end

function PR_DB.SetMeta(key, value)
    PR_DB.Query("INSERT OR REPLACE INTO pr_meta (key, value) VALUES (?, ?)", key, value)
end

----------------------------------------------------------------------------------------------------
-- Игроки. Данные снаружи в том же виде, что был в JSON: {Money, Exp, ..., Money_SSNK, ..., PurchasedWeapons, Preset, Outfit}
----------------------------------------------------------------------------------------------------

local PLAYER_COLUMNS = {
    {"money", "Money", "int"},
    {"exp", "Exp", "int"},
    {"coin", "Coin", "int"},
    {"level", "Level", "int"},
    {"fraction", "Fraction", "text"},
    {"admin", "Admin", "bool"},
    {"kills", "Kills", "int"},
    {"kills_npc", "Kills_Npc", "int"},
    {"deaths", "Deaths", "int"}
}

local FRACTION_COLUMNS = {
    {"money", "Money_"},
    {"exp", "Exp_"},
    {"level", "Level_"},
    {"weapon_exp", "Weapon_exp_"},
    {"leader", "Leader_", "bool"}
}

function PR_DB.LoadPlayer(steamid)
    local rows = PR_DB.Query("SELECT * FROM pr_players WHERE steamid = ?", steamid)
    local row = rows and rows[1]
    if not row then return nil end

    local data = {Nick = Str(row.nick)}

    for _, c in ipairs(PLAYER_COLUMNS) do
        local value = row[c[1]]
        if c[3] == "int" then
            data[c[2]] = Num(value, 0)
        elseif c[3] == "bool" then
            data[c[2]] = Num(value, 0) == 1
        else
            data[c[2]] = Str(value) or ""
        end
    end

    for _, f in ipairs(PR_DB.Query("SELECT * FROM pr_player_fractions WHERE steamid = ?", steamid) or {}) do
        for _, c in ipairs(FRACTION_COLUMNS) do
            local value = Num(f[c[1]], 0)

            if c[3] == "bool" then
                data[c[2] .. f.fraction] = value == 1
            else
                data[c[2] .. f.fraction] = value
            end
        end
    end

    data.PurchasedWeapons, data.PurchasedModels = {}, {}
    for _, it in ipairs(PR_DB.Query("SELECT kind, item FROM pr_player_items WHERE steamid = ? ORDER BY rowid", steamid) or {}) do
        table.insert(it.kind == "model" and data.PurchasedModels or data.PurchasedWeapons, it.item)
    end

    data.Preset = {}
    for _, p in ipairs(PR_DB.Query("SELECT slot, item, name FROM pr_player_presets WHERE steamid = ?", steamid) or {}) do
        data.Preset[p.slot] = {Item = p.item, Name = Str(p.name) or ""}
    end

    local model = Str(row.outfit_model)
    if model and model ~= "" then
        data.Outfit = {Model = model, Bodygroups = Json(row.outfit_bodygroups) or {}}
    end

    return data
end

function PR_DB.SavePlayer(steamid, data)
    return PR_DB.Transaction(function()
        local outfit = istable(data.Outfit) and isstring(data.Outfit.Model) and data.Outfit or nil

        local cols = {"steamid", "nick", "outfit_model", "outfit_bodygroups", "updated_at"}
        local values = {
            steamid,
            isstring(data.Nick) and data.Nick or "",
            outfit and outfit.Model or "",
            outfit and util.TableToJSON(istable(outfit.Bodygroups) and outfit.Bodygroups or {}) or "",
            os.time()
        }

        for _, c in ipairs(PLAYER_COLUMNS) do
            local value = data[c[2]]
            cols[#cols + 1] = c[1]

            if c[3] == "int" then
                values[#values + 1] = math.floor(tonumber(value) or 0)
            elseif c[3] == "bool" then
                values[#values + 1] = value == true
            else
                values[#values + 1] = isstring(value) and value or ""
            end
        end

        local marks = string.rep("?, ", #cols - 1) .. "?"
        PR_DB.Query("INSERT OR REPLACE INTO pr_players (" .. table.concat(cols, ", ") .. ") VALUES (" .. marks .. ")", unpack(values, 1, #cols))

        for _, frac in ipairs(PR_FRACTIONS) do
            PR_DB.Query("INSERT OR REPLACE INTO pr_player_fractions (steamid, fraction, money, exp, level, weapon_exp, leader) VALUES (?, ?, ?, ?, ?, ?, ?)",
                steamid, frac,
                math.floor(tonumber(data["Money_" .. frac]) or 0),
                math.floor(tonumber(data["Exp_" .. frac]) or 0),
                math.floor(tonumber(data["Level_" .. frac]) or 1),
                math.floor(tonumber(data["Weapon_exp_" .. frac]) or 0),
                data["Leader_" .. frac] == true)
        end

        PR_DB.Query("DELETE FROM pr_player_items WHERE steamid = ?", steamid)
        for kind, list in pairs({weapon = data.PurchasedWeapons, model = data.PurchasedModels}) do
            for _, item in ipairs(istable(list) and list or {}) do
                if isstring(item) then
                    PR_DB.Query("INSERT OR IGNORE INTO pr_player_items (steamid, kind, item) VALUES (?, ?, ?)", steamid, kind, item)
                end
            end
        end

        PR_DB.Query("DELETE FROM pr_player_presets WHERE steamid = ?", steamid)
        for slot, preset in pairs(istable(data.Preset) and data.Preset or {}) do
            if istable(preset) and isstring(preset.Item) then
                PR_DB.Query("INSERT OR REPLACE INTO pr_player_presets (steamid, slot, item, name) VALUES (?, ?, ?, ?)", steamid, slot, preset.Item, preset.Name or "")
            end
        end
    end)
end

----------------------------------------------------------------------------------------------------
-- Магазины. Снаружи те же таблицы, что ждёт интерфейс: PR_WS_List[фракция] = {товар, ...} и т.д.
----------------------------------------------------------------------------------------------------

-- col — колонка, key — поле товара, kind — int | text | json
local SHOPS = {
    weapon = {
        tbl = "pr_shop_weapons", byFraction = true,
        fields = {
            {"class", "ClassName", "text"}, {"name", "Name", "text"}, {"price", "Price", "int"},
            {"exp", "Exp", "int"}, {"tier", "Tier", "int"}, {"type", "Type", "text"}, {"unlock", "NeedToUnlock", "json"}
        }
    },
    equip = {
        tbl = "pr_shop_equipment", byFraction = false,
        fields = {
            {"class", "ClassName", "text"}, {"name", "Name", "text"}, {"price", "Price", "int"},
            {"tier", "Tier", "text"}, {"type", "Type", "text"}
        }
    },
    vehicle = {
        tbl = "pr_shop_vehicles", byFraction = true,
        fields = {
            {"class", "ClassName", "text"}, {"name", "Name", "text"}, {"price", "Price", "int"},
            {"type", "Type", "text"}, {"mod", "Mod", "text"}
        }
    },
    cloth = {
        tbl = "pr_shop_cloth", byFraction = true,
        fields = {
            {"model", "Model", "text"}, {"price", "Price", "int"}, {"level", "Level", "int"}
        }
    }
}

local function RowToEntry(shop, row)
    local entry = Json(row.extra) or {}

    for _, f in ipairs(shop.fields) do
        local value = row[f[1]]
        if f[3] == "int" then
            entry[f[2]] = Num(value)
        elseif f[3] == "json" then
            entry[f[2]] = Json(value)
        else
            entry[f[2]] = Str(value)
        end
    end

    return entry
end

local function InsertEntry(shop, fraction, entry)
    -- Без класса/модели товар бессмысленен
    local key = entry[shop.fields[1][2]]
    if not isstring(key) or key == "" then return end

    -- values может содержать nil (NULL), поэтому считаем колонки сами, а не через #values
    local cols, values, n = {}, {}, 0
    local extra = table.Copy(entry)

    local function Add(col, value)
        n = n + 1
        cols[n] = col
        values[n] = value
    end

    if shop.byFraction then
        Add("fraction", fraction)
    end

    for _, f in ipairs(shop.fields) do
        local value = entry[f[2]]
        extra[f[2]] = nil

        if f[3] == "int" then
            value = tonumber(value) and math.floor(tonumber(value)) or nil
        elseif f[3] == "json" then
            value = value ~= nil and util.TableToJSON(istable(value) and value or {value}) or nil
        elseif value ~= nil then
            value = tostring(value)
        end

        Add(f[1], value)
    end

    Add("extra", not table.IsEmpty(extra) and util.TableToJSON(extra) or nil)

    local marks = string.rep("?, ", n - 1) .. "?"
    PR_DB.Query("INSERT INTO " .. shop.tbl .. " (" .. table.concat(cols, ", ") .. ") VALUES (" .. marks .. ")", unpack(values, 1, n))
end

function PR_DB.LoadShopList(kind)
    local shop = SHOPS[kind]
    local list = {}

    for _, row in ipairs(PR_DB.Query("SELECT * FROM " .. shop.tbl .. " ORDER BY id") or {}) do
        local entry = RowToEntry(shop, row)

        if shop.byFraction then
            list[row.fraction] = list[row.fraction] or {}
            table.insert(list[row.fraction], entry)
        else
            table.insert(list, entry)
        end
    end

    return list
end

-- Перезаписать весь список (редактор магазина в меню шлёт его целиком)
function PR_DB.SaveShopList(kind, list)
    local shop = SHOPS[kind]

    return PR_DB.Transaction(function()
        PR_DB.Query("DELETE FROM " .. shop.tbl)

        if shop.byFraction then
            for fraction, entries in SortedPairs(istable(list) and list or {}) do
                if isstring(fraction) and istable(entries) then
                    for _, entry in ipairs(entries) do
                        if istable(entry) then InsertEntry(shop, fraction, entry) end
                    end
                end
            end
        else
            for _, entry in ipairs(istable(list) and list or {}) do
                if istable(entry) then InsertEntry(shop, nil, entry) end
            end
        end
    end)
end

----------------------------------------------------------------------------------------------------
-- Точки захвата
----------------------------------------------------------------------------------------------------

-- {["имя"] = {Team, Monitor, System}} — в том же виде, что раньше был в capture_points_list.txt
function PR_DB.GetPoints()
    local points = {}

    for _, row in ipairs(PR_DB.Query("SELECT * FROM pr_points ORDER BY name") or {}) do
        points[row.name] = {
            Team = Str(row.team) or "Ничья",
            Monitor = Num(row.monitor, 0),
            System = Num(row.computer, 1)
        }
    end

    return points
end

function PR_DB.GetPoint(name)
    return PR_DB.GetPoints()[name]
end

function PR_DB.SetPoint(name, team, monitor, computer)
    PR_DB.Query("INSERT OR REPLACE INTO pr_points (name, team, monitor, computer) VALUES (?, ?, ?, ?)", name, team, monitor, computer)
end

-- {["имя"] = {Pos = Vector, Ang = Angle}} для карты
function PR_DB.GetLayout(map)
    local layout = {}

    for _, row in ipairs(PR_DB.Query("SELECT * FROM pr_point_layout WHERE map = ?", map) or {}) do
        layout[row.name] = {
            Pos = Vector(Num(row.x, 0), Num(row.y, 0), Num(row.z, 0)),
            Ang = Angle(Num(row.pitch, 0), Num(row.yaw, 0), Num(row.roll, 0))
        }
    end

    return layout
end

function PR_DB.SetLayout(map, name, pos, ang)
    PR_DB.Query("INSERT OR REPLACE INTO pr_point_layout (map, name, x, y, z, pitch, yaw, roll) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        map, name, pos.x, pos.y, pos.z, ang.p, ang.y, ang.r)
end

function PR_DB.RemoveLayout(map, name)
    PR_DB.Query("DELETE FROM pr_point_layout WHERE map = ? AND name = ?", map, name)
end

----------------------------------------------------------------------------------------------------
-- Споты патрулей
----------------------------------------------------------------------------------------------------

-- {{Id = 1, Pos = Vector, Zone = "Город"}, ...} для карты, в порядке создания
function PR_DB.GetPatrolSpots(map)
    local spots = {}

    for _, row in ipairs(PR_DB.Query("SELECT * FROM pr_patrol_spots WHERE map = ? ORDER BY id", map) or {}) do
        table.insert(spots, {
            Id = Num(row.id, 0),
            Pos = Vector(Num(row.x, 0), Num(row.y, 0), Num(row.z, 0)),
            Zone = Str(row.zone) or ""
        })
    end

    return spots
end

-- Новый спот, возвращает его id
function PR_DB.AddPatrolSpot(map, pos, zone)
    PR_DB.Query("INSERT INTO pr_patrol_spots (map, x, y, z, zone) VALUES (?, ?, ?, ?, ?)", map, pos.x, pos.y, pos.z, zone or "")
    local rows = PR_DB.Query("SELECT last_insert_rowid() AS id")
    return rows and rows[1] and Num(rows[1].id)
end

function PR_DB.RemovePatrolSpot(id)
    PR_DB.Query("DELETE FROM pr_patrol_spots WHERE id = ?", id)
end

function PR_DB.SetPatrolSpotZone(id, zone)
    PR_DB.Query("UPDATE pr_patrol_spots SET zone = ? WHERE id = ?", zone or "", id)
end

----------------------------------------------------------------------------------------------------
-- Одноразовый импорт старых JSON из data/pr_gamemode
----------------------------------------------------------------------------------------------------

local DATA_DIR = "pr_gamemode"
local BACKUP_DIR = DATA_DIR .. "/json_backup"

local function ReadJson(path)
    if not file.Exists(path, "DATA") then return nil end
    return util.JSONToTable(file.Read(path, "DATA") or "")
end


-- Файлы, которые переедут в json_backup после успешного импорта
local imported = {}

-- Переложить импортированный файл в json_backup, сохраняя путь внутри pr_gamemode
local function MoveToBackup(path)
    local target = BACKUP_DIR .. "/" .. string.sub(path, #DATA_DIR + 2)
    local dir = string.GetPathFromFilename(target)

    file.CreateDir(string.sub(dir, 1, -2))
    if file.Exists(target, "DATA") then file.Delete(target) end

    if file.Rename and file.Rename(path, target) then return end

    -- Запасной путь: скопировать и удалить
    file.Write(target, file.Read(path, "DATA") or "")
    if file.Exists(target, "DATA") then
        file.Delete(path)
    else
        MsgN("[PR] не удалось перенести " .. path .. " в " .. target)
    end
end

local SHOP_FILES = {
    weapon = "weapon_shop_list.txt",
    equip = "equip_shop_list.txt",
    vehicle = "vehicle_shop_list.txt",
    cloth = "cloth_shop_list.txt"
}

local function MigrateShops()
    for kind, name in pairs(SHOP_FILES) do
        local path = DATA_DIR .. "/" .. name
        local list = ReadJson(path)

        if istable(list) then
            PR_DB.SaveShopList(kind, list)
            table.insert(imported, path)
        end
    end
end

local function MigratePoints()
    local path = DATA_DIR .. "/capture_points_list.txt"
    local points = ReadJson(path)

    if istable(points) then
        for name, p in pairs(points) do
            if istable(p) then
                local team = isstring(p.Team) and p.Team ~= "" and p.Team or "Ничья"
                PR_DB.SetPoint(name, team, tonumber(p.Monitor) or 0, tonumber(p.System) or 1)
            end
        end
        table.insert(imported, path)
    end

    for _, name in ipairs(file.Find(DATA_DIR .. "/points_*.txt", "DATA")) do
        local map = string.match(name, "^points_(.+)%.txt$")
        local layout = ReadJson(DATA_DIR .. "/" .. name)

        if map and istable(layout) then
            for pointName, place in pairs(layout) do
                if istable(place) and isvector(place.Pos) then
                    PR_DB.SetLayout(map, pointName, place.Pos, isangle(place.Ang) and place.Ang or Angle(0, 0, 0))
                end
            end
            table.insert(imported, DATA_DIR .. "/" .. name)
        end
    end
end

-- Сейвы по SteamID из прошлой версии (data/pr_gamemode/players/<ключ>.txt).
-- Общий players.txt по нику переносится, когда игрок заходит (sh_player_save.lua).
local function MigratePlayers()
    for _, name in ipairs(file.Find(DATA_DIR .. "/players/*.txt", "DATA")) do
        local path = DATA_DIR .. "/players/" .. name
        local data = ReadJson(path)

        if istable(data) then
            PR_DB.SavePlayer(string.StripExtension(name), data)
            table.insert(imported, path)
        end
    end
end

-- Всё пишется одной транзакцией; файлы уезжают в бэкап, только если она прошла
function PR_DB.MigrateJson()
    imported = {}

    local ok = PR_DB.Transaction(function()
        MigrateShops()
        MigratePoints()
        MigratePlayers()
    end)

    if not ok then
        MsgN("[PR] импорт JSON в sqlite не удался, файлы оставлены на месте")
        return
    end

    for _, path in ipairs(imported) do
        MoveToBackup(path)
        MsgN("[PR] импортирован в sqlite: " .. path)
    end
end

PR_DB.MigrateJson()
