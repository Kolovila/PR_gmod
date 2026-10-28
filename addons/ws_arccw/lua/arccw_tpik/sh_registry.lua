ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.Weapons = TPIK.Weapons or {}
TPIK.UserWeapons = TPIK.UserWeapons or {}

TPIK.UserDataFile = "arccw_tpik/weapons.json"

TPIK.OffsetKeys = {
    "Pos", "Ang",
    "SightPos", "SightAng",
    "ReloadPos", "ReloadAng",
    "SprintPos", "SprintAng"
}

TPIK.BoneKeys = {"HideBones", "KeepBones"}

function TPIK.IsAngleKey(key)
    return string.sub(key, -3) == "Ang"
end

local cache = {}

function TPIK.ClearConfigCache(class)
    if class then
        cache[string.lower(class)] = nil
    else
        cache = {}
    end
end

function TPIK.Register(class, config)
    class = string.lower(class)
    TPIK.Weapons[class] = config
    TPIK.ClearConfigCache(class)
end

local function swepLayer(wep)
    return {
        NoTPIK = wep.NoTPIK,
        NoLeftHand = wep.TPIKNoLeftHand,
        ForceLeftHand = wep.TPIKForceLeftHand,
        PropDist = wep.TPIKPropDist,
        Offsets = wep.TPIKOffsets,
        HideBones = wep.TPIKHideBones,
        KeepBones = wep.TPIKKeepBones
    }
end

local function boneSet(list, out)
    if not istable(list) then return out end

    for _, name in ipairs(list) do
        if isstring(name) then out[string.lower(name)] = true end
    end

    return out
end

local function buildConfig(wep, class)
    local layers = {
        TPIK.DefaultConfig,
        swepLayer(wep),
        TPIK.Weapons[class],
        TPIK.UserWeapons[class]
    }

    local config = {
        NoTPIK = false,
        NoLeftHand = false,
        ForceLeftHand = false,
        PropDist = TPIK.PropBoneMaxDist,
        Offsets = {},
        HideBones = {},
        KeepBones = {}
    }

    for i = 1, 4 do
        local layer = layers[i]

        if istable(layer) then
            if layer.NoTPIK ~= nil then config.NoTPIK = layer.NoTPIK == true end
            if layer.NoLeftHand ~= nil then config.NoLeftHand = layer.NoLeftHand == true end
            if layer.ForceLeftHand ~= nil then config.ForceLeftHand = layer.ForceLeftHand == true end
            if tonumber(layer.PropDist) then config.PropDist = tonumber(layer.PropDist) end

            if istable(layer.Offsets) then
                for _, key in ipairs(TPIK.OffsetKeys) do
                    local value = layer.Offsets[key]
                    if value ~= nil then config.Offsets[key] = value end
                end
            end

            boneSet(layer.HideBones, config.HideBones)
            boneSet(layer.KeepBones, config.KeepBones)
        end
    end

    return config
end

TPIK.EmptyConfig = {
    NoTPIK = false,
    NoLeftHand = false,
    ForceLeftHand = false,
    PropDist = 20,
    Offsets = {},
    HideBones = {},
    KeepBones = {}
}

function TPIK.GetConfig(wep)
    if not IsValid(wep) then return TPIK.EmptyConfig end

    local class = string.lower(wep:GetClass() or "")
    local cached = cache[class]

    if cached then return cached end

    cached = buildConfig(wep, class)
    cache[class] = cached

    return cached
end

local function userEntry(class)
    local entry = TPIK.UserWeapons[class]

    if not entry then
        entry = {Offsets = {}, HideBones = {}, KeepBones = {}}
        TPIK.UserWeapons[class] = entry
    end

    entry.Offsets = entry.Offsets or {}
    entry.HideBones = entry.HideBones or {}
    entry.KeepBones = entry.KeepBones or {}

    return entry
end

function TPIK.SetUserValue(class, key, value)
    class = string.lower(class)

    local entry = userEntry(class)

    if table.HasValue(TPIK.OffsetKeys, key) then
        entry.Offsets[key] = value
    else
        entry[key] = value
    end

    TPIK.ClearConfigCache(class)
end

local function dropBone(list, bone)
    for index = #list, 1, -1 do
        if string.lower(list[index]) == bone then table.remove(list, index) end
    end
end

function TPIK.SetUserBone(class, bone, state)
    class = string.lower(class)
    bone = string.lower(bone)

    local entry = userEntry(class)

    dropBone(entry.HideBones, bone)
    dropBone(entry.KeepBones, bone)

    if state == "hide" then
        entry.HideBones[#entry.HideBones + 1] = bone
    elseif state == "keep" then
        entry.KeepBones[#entry.KeepBones + 1] = bone
    end

    TPIK.ClearConfigCache(class)
end

function TPIK.GetUserBone(class, bone)
    local entry = TPIK.UserWeapons[string.lower(class)]
    if not entry then return nil end

    bone = string.lower(bone)

    for _, name in ipairs(entry.HideBones or {}) do
        if string.lower(name) == bone then return "hide" end
    end

    for _, name in ipairs(entry.KeepBones or {}) do
        if string.lower(name) == bone then return "keep" end
    end

    return nil
end

function TPIK.IsAutoPropBone(bone)
    bone = string.lower(bone or "")
    if bone == "" then return false end

    for _, token in ipairs(TPIK.PropBoneExclude) do
        if string.find(bone, token, 1, true) then return false end
    end

    for _, token in ipairs(TPIK.PropBoneTokens) do
        if string.find(bone, token, 1, true) then return true end
    end

    return false
end

function TPIK.IsSpareMagBone(bone)
    bone = string.lower(bone or "")
    if bone == "" then return false end

    return string.find(bone, "mag_?[2-9]$") ~= nil
        or string.find(bone, "mag_?b$") ~= nil
        or string.find(bone, "spare") ~= nil
        or string.find(bone, "backup") ~= nil
end

function TPIK.IsReloadOnlyBone(bone)
    bone = string.lower(bone or "")
    if bone == "" then return false end

    for _, token in ipairs(TPIK.PropReloadOnlyTokens) do
        if string.find(bone, token, 1, true) then return true end
    end

    return false
end

function TPIK.IsLoadedRoundBone(bone)
    bone = string.lower(bone or "")

    for _, token in ipairs(TPIK.PropLoadedTokens) do
        if string.find(bone, token, 1, true) then return true end
    end

    return false
end

function TPIK.IsMagBone(bone)
    bone = string.lower(bone or "")
    if not string.find(bone, "mag", 1, true) then return false end

    for _, token in ipairs(TPIK.NotMagTokens) do
        if string.find(bone, token, 1, true) then return false end
    end

    return true
end

function TPIK.IsProjectileBone(bone)
    bone = string.lower(bone or "")

    for _, token in ipairs(TPIK.ProjectileTokens) do
        if string.find(bone, token, 1, true) then return true end
    end

    return false
end

function TPIK.IsCharacterBone(bone)
    bone = string.lower(bone or "")

    for _, token in ipairs(TPIK.CharacterBoneTokens) do
        if string.find(bone, token, 1, true) then return true end
    end

    return false
end

function TPIK.ClearUserConfig(class)
    class = string.lower(class)
    TPIK.UserWeapons[class] = nil
    TPIK.ClearConfigCache(class)
end

local function encode()
    local out = {}

    for class, entry in pairs(TPIK.UserWeapons) do
        local row = {
            NoTPIK = entry.NoTPIK,
            NoLeftHand = entry.NoLeftHand,
            ForceLeftHand = entry.ForceLeftHand,
            PropDist = entry.PropDist,
            Offsets = {},
            HideBones = (entry.HideBones and #entry.HideBones > 0) and entry.HideBones or nil,
            KeepBones = (entry.KeepBones and #entry.KeepBones > 0) and entry.KeepBones or nil
        }

        for key, value in pairs(entry.Offsets or {}) do
            if isvector(value) then
                row.Offsets[key] = {value.x, value.y, value.z}
            elseif isangle(value) then
                row.Offsets[key] = {value.p, value.y, value.r}
            end
        end

        out[class] = row
    end

    return out
end

local function decode(raw)
    local out = {}

    for class, row in pairs(raw or {}) do
        if istable(row) then
            local entry = {
                NoTPIK = row.NoTPIK,
                NoLeftHand = row.NoLeftHand,
                ForceLeftHand = row.ForceLeftHand,
                PropDist = tonumber(row.PropDist),
                Offsets = {},
                HideBones = istable(row.HideBones) and row.HideBones or {},
                KeepBones = istable(row.KeepBones) and row.KeepBones or {}
            }

            for key, value in pairs(row.Offsets or {}) do
                if istable(value) and #value == 3 then
                    if TPIK.IsAngleKey(key) then
                        entry.Offsets[key] = Angle(value[1], value[2], value[3])
                    else
                        entry.Offsets[key] = Vector(value[1], value[2], value[3])
                    end
                end
            end

            out[string.lower(class)] = entry
        end
    end

    return out
end

function TPIK.SaveUserConfigs()
    if not file.IsDir("arccw_tpik", "DATA") then
        file.CreateDir("arccw_tpik")
    end

    file.Write(TPIK.UserDataFile, util.TableToJSON(encode(), true))
end

function TPIK.LoadUserConfigs()
    local raw = file.Read(TPIK.UserDataFile, "DATA")
    if not raw then return false end

    local parsed = util.JSONToTable(raw)
    if not istable(parsed) then return false end

    TPIK.UserWeapons = decode(parsed)
    TPIK.ClearConfigCache()

    return true
end

function TPIK.ExportUserConfig(class)
    class = string.lower(class)

    local entry = TPIK.UserWeapons[class]
    if not entry then return nil end

    local lines = {string.format("ArcCW_TPIK.Register(%q, {", class)}

    for _, key in ipairs({"NoTPIK", "NoLeftHand", "ForceLeftHand"}) do
        if entry[key] ~= nil then
            lines[#lines + 1] = string.format("    %s = %s,", key, tostring(entry[key] == true))
        end
    end

    if tonumber(entry.PropDist) then
        lines[#lines + 1] = string.format("    PropDist = %g,", entry.PropDist)
    end

    local rows = {}

    for _, key in ipairs(TPIK.OffsetKeys) do
        local value = entry.Offsets and entry.Offsets[key]

        if isvector(value) then
            rows[#rows + 1] = string.format("        %-13s = Vector(%g, %g, %g),", key, value.x, value.y, value.z)
        elseif isangle(value) then
            rows[#rows + 1] = string.format("        %-13s = Angle(%g, %g, %g),", key, value.p, value.y, value.r)
        end
    end

    if #rows > 0 then
        lines[#lines + 1] = "    Offsets = {"
        table.Add(lines, rows)
        lines[#lines + 1] = "    },"
    end

    for _, key in ipairs(TPIK.BoneKeys) do
        local list = entry[key]

        if istable(list) and #list > 0 then
            local quoted = {}

            for _, name in ipairs(list) do
                quoted[#quoted + 1] = string.format("%q", name)
            end

            lines[#lines + 1] = string.format("    %s = {%s},", key, table.concat(quoted, ", "))
        end
    end

    lines[#lines + 1] = "})"

    return table.concat(lines, "\n")
end

local BONE_STATES = {{"HideBones", "hide"}, {"KeepBones", "keep"}}

local function applyImported(class, config)
    TPIK.ClearUserConfig(class)

    for _, key in ipairs({"NoTPIK", "NoLeftHand", "ForceLeftHand"}) do
        if config[key] ~= nil then
            TPIK.SetUserValue(class, key, config[key] == true)
        end
    end

    if tonumber(config.PropDist) then
        TPIK.SetUserValue(class, "PropDist", tonumber(config.PropDist))
    end

    if istable(config.Offsets) then
        for _, key in ipairs(TPIK.OffsetKeys) do
            local value = config.Offsets[key]

            if TPIK.IsAngleKey(key) then
                if isangle(value) then TPIK.SetUserValue(class, key, Angle(value)) end
            elseif isvector(value) then
                TPIK.SetUserValue(class, key, Vector(value))
            end
        end
    end

    for _, pair in ipairs(BONE_STATES) do
        local list = config[pair[1]]

        if istable(list) then
            for _, bone in ipairs(list) do
                if isstring(bone) then TPIK.SetUserBone(class, bone, pair[2]) end
            end
        end
    end
end

function TPIK.ImportUserConfig(text)
    if not isstring(text) or string.Trim(text) == "" then
        return false, "nothing to paste"
    end

    local captured = {}

    local env = {
        Vector = Vector,
        Angle = Angle,
        math = math,
        ArcCW_TPIK = {
            Register = function(class, config)
                if isstring(class) and class ~= "" and istable(config) then
                    captured[#captured + 1] = {class = string.lower(class), config = config}
                end
            end
        }
    }

    local chunk = CompileString(text, "arccw_tpik_paste", false)

    if isstring(chunk) then return false, chunk end
    if not isfunction(chunk) then return false, "could not compile that" end

    setfenv(chunk, env)

    local ok, err = pcall(chunk)
    if not ok then return false, tostring(err) end

    if #captured == 0 then
        return false, "no ArcCW_TPIK.Register call in there"
    end

    local names = {}

    for _, entry in ipairs(captured) do
        applyImported(entry.class, entry.config)
        names[#names + 1] = entry.class
    end

    return true, names
end

if CLIENT then
    TPIK.LoadUserConfigs()
end
