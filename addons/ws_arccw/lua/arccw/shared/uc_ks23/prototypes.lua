local function prototype(wep)
    return wep:GetBuff_Override("Override_UCKS23Prototype")
end
local function layout(wep)
    local mode = prototype(wep)
    if not wep.Attachments then
        return
    end
    local a = wep.Attachments
    a[7].DefaultAttName = mode == 2 and "20 Gauge Selected Feed" or "23 mm Shrapnel-10"
    local prefix = mode == 1 and "kovrov" or mode == 2 and "vlasov" or mode == 3 and "ots28" or nil
    local changed = wep.UCKS23PrototypeLayout ~= prefix
    if changed then
        if prefix then
            a[2].Slot = "uc_ks23_" .. prefix .. "_barrel"
            a[2].DefaultAttName = "16.1\" Service Barrel"
            a[4].Slot = "uc_ks23_" .. prefix .. "_forend"
            a[4].DefaultAttName = "Service Forend"
            a[9].Slot = "uc_ks23_" .. prefix .. "_stock"
            a[9].DefaultAttName = mode == 2 and "Pistol Grip"
                or mode == 3 and "Top-Folding Stock"
                or "Skeletal Stock"
            a[8].Slot = mode == 3 and "uc_ks23_ots28_mag" or "uc_ks23_tube"
            a[8].PrintName = mode == 3 and "Magazine" or "Tube Types"
            a[8].DefaultAttName = mode == 3 and "5-Round Box Magazine" or "Standard Tube"
            for i, part in pairs({ [2] = "barrel", [4] = "forend", [9] = "stock" }) do
                a[i].DefaultAttIcon =
                    Material("entities/uc_ks23/" .. prefix .. "_" .. part .. ".png", "mips smooth")
            end
            if mode == 3 then
                a[8].DefaultAttIcon = Material("entities/uc_ks23/ots28_mag.png", "mips smooth")
            end
        else
            wep.UCKS23SlotMode = nil
            wep:UCKS23UpdateSlots()
        end
        wep.UCKS23PrototypeLayout = prefix
    end
    for _, i in ipairs({ 1, 2, 3, 4, 5, 7, 8, 9, 10, 14 }) do
        local slot = a[i]
        if slot then
            local flags = {}
            for _, flag in ipairs(slot.ExcludeFlags or {}) do
                if flag ~= "ks23_prototype" then
                    flags[#flags + 1] = flag
                end
            end
            if i == 3 or i == 8 and mode ~= 3 or i == 7 and mode == 2 then
                flags[#flags + 1] = "ks23_prototype"
            end
            slot.ExcludeFlags = flags
            if i ~= 14 then
                slot.Hidden = false
            end
        end
    end
    if changed and SERVER and wep.AdjustAtts then
        wep:AdjustAtts()
    end
end
local oldThink = SWEP.Hook_Think
SWEP.Hook_Think = function(wep)
    if oldThink then
        oldThink(wep)
    end
    layout(wep)
    if
        prototype(wep) == 3
        and (wep.LastAnimKey == "ots28_reload_empty" or wep.LastAnimKey == "ots28_drum_reload_empty")
        and wep:Clip1() > 0
        and wep:GetNeedCycle()
        and CurTime()
            >= (wep.LastAnimStartTime or 0) + (wep.Animations[wep.LastAnimKey].Time - 0.1) * wep:GetBuff_Mult(
                "Mult_ReloadTime"
            )
    then
        wep:SetNeedCycle(false)
    end
    if not SERVER then
        return
    end
    local mode = prototype(wep)
    local bank = wep.UCKS23VlasovBank
    if mode ~= 2 then
        if bank then
            local owner = wep:GetOwner()
            if IsValid(owner) and bank.spare > 0 then
                owner:GiveAmmo(bank.spare, wep.Primary.Ammo, true)
            end
            wep.UCKS23VlasovBank = nil
            wep:SetNW2Int("UCKS23SpareTube", 0)
        end
        return
    end
    local selected = wep:GetBuff_Override("Override_UCKS23VlasovFeed") or 1
    if not bank then
        bank = {
            selected = selected,
            spare = 0,
            chamber = (wep:Clip1() > 0 and not wep:GetNeedCycle()) and selected or 0,
        }
        wep.UCKS23VlasovBank = bank
        wep:SetNW2Int("UCKS23ActiveTube", selected)
    end
    if wep:GetNeedCycle() or wep:Clip1() == 0 then
        bank.chamber = 0
    elseif bank.chamber == 0 then
        bank.chamber = bank.selected
    end
    wep:SetNW2Int("UCKS23ChamberLoad", bank.chamber)

    if
        selected ~= bank.selected
        and not wep:GetReloading()
        and CurTime() >= (wep.LastAnimFinishTime or 0)
    then
        local clip = wep:Clip1()
        local chamber = (clip > 0 and not wep:GetNeedCycle()) and 1 or 0
        local outgoing = math.Clamp(clip - chamber, 0, 3)
        if chamber == 0 and bank.spare > 0 then
            wep:SetNeedCycle(true)
        end
        wep:SetClip1(bank.spare + chamber)
        bank.spare = outgoing
        bank.selected = selected
        wep:SetNW2Int("UCKS23SpareTube", bank.spare)
        wep:SetNW2Int("UCKS23ActiveTube", selected)
    end
end
local oldBG = SWEP.Hook_ModifyBodygroups
SWEP.Hook_ModifyBodygroups = function(wep, data)
    if oldBG then
        oldBG(wep, data)
    end
    if not data or not IsValid(data.vm) then
        return
    end
    local mode = prototype(wep)
    data.vm:SetBodygroup(14, 0)
    if not mode then
        return
    end
    for _, v in ipairs({
        { 0, 1 },
        { 1, 8 },
        { 2, 5 },
        { 3, 4 },
        { 5, 2 },
        { 6, 0 },
        { 9, 0 },
        { 10, 2 },
        {
            11,
            0,
        },
        {
            12,
            0,
        },
        {
            13,
            0,
        },
    }) do
        data.vm:SetBodygroup(v[1], v[2])
    end
    if mode == 2 then
        data.vm:SetBodygroup(4, 13)
    end
    layout(wep)
end
local oldName = SWEP.Hook_NameChange
SWEP.Hook_NameChange = function(wep, name)
    local mode = prototype(wep)
    if mode == 1 then
        return "AEK-965"
    elseif mode == 2 then
        return "Vlasov"
    elseif mode == 3 then
        return "OTs-28"
    end
    return oldName and oldName(wep, name) or name
end

for _, key in ipairs({ "sgreload_start", "sgreload_insert", "sgreload_finish" }) do
    local anim = {}
    for k, v in pairs(SWEP.Animations[key]) do
        anim[k] = v
    end
    anim.Source = "vlasov_upper_" .. key
    SWEP.Animations["vlasov_upper_" .. key] = anim
end
local oldReload = SWEP.Hook_SelectReloadAnimation
SWEP.Hook_SelectReloadAnimation = function(wep, anim)
    if
        prototype(wep) == 2
        and (wep:GetNW2Int("UCKS23ActiveTube", 1)) == 1
        and type(anim) == "string"
        and wep.Animations["vlasov_upper_" .. anim]
    then
        return "vlasov_upper_" .. anim
    end
    if
        prototype(wep) == 3
        and not wep:GetBuff_Override("Override_UCKS23Harpoon")
        and not wep:GetBuff_Override("Override_UCKS23RPG7")
    then
        if anim == "reload" or anim == "reload_empty" then
            return "ots28_" .. (wep:GetBuff_Override("Override_UCKS23OTsDrum") and "drum_" or "") .. anim
        end
    end
    if oldReload then
        return oldReload(wep, anim)
    end
    return nil
end

local loadStats = {
    Num = { 8, 1 },
    Damage = { 18, 100 },
    DamageMin = { 5, 55 },
    Penetration = { 8, 12 },
    AccuracyMOA = { 12, 3 },
}
for stat, values in pairs(loadStats) do
    local buff = "O_Hook_Override_" .. stat
    local previous = SWEP[buff]
    SWEP[buff] = function(wep, data)
        local prior
        if previous then
            prior = previous(wep, data)
            data = prior or data
        end
        if prototype(wep) ~= 2 then
            return prior
        end
        local feed = wep:GetNW2Int("UCKS23ChamberLoad", 1)
        if feed == 0 then
            feed = wep:GetNW2Int("UCKS23ActiveTube", 1)
        end
        data.current = values[feed == 2 and 2 or 1]
        return data
    end
end

local commons = "arccw_uc/common/"
for _, drum in ipairs({ false, true }) do
    for _, empty in ipairs({ false, true }) do
        local name = "ots28_" .. (drum and "drum_" or "") .. "reload" .. (empty and "_empty" or "")
        local time = drum and (empty and 3.1 or 2.55) or (empty and 3.0 or 2.716667)
        local sounds = {
            { s = commons .. "cloth_1.ogg", t = 0.08, v = 0.4 },
            { s = "uc_ks23/" .. (drum and "drum_out_ks23k.ogg" or "mag_out_ks23k.ogg"), t = 0.35 },
            { s = commons .. "magpouch.ogg", t = 0.65, v = 0.35 },
            {
                s = "uc_ks23/" .. (drum and "drum_in_ks23k.ogg" or "mag_in_ks23k.ogg"),
                t = drum and 1.78 or 1.62,
            },
            { s = commons .. "rattle.ogg", t = drum and 1.95 or 1.78, v = 0.3 },
        }
        if empty then
            sounds[#sounds + 1] = { s = "uc_ks23/pump_back_ks23k.ogg", t = time - 0.66 }
            sounds[#sounds + 1] = { s = "uc_ks23/pump_forward_ks23k.ogg", t = time - 0.30 }
        end
        sounds[#sounds + 1] = { s = commons .. "grab.ogg", t = empty and time - 0.85 or time - 0.35, v = 0.4 }
        SWEP.Animations[name] = {
            Source = name,
            Time = time,
            MinProgress = time - 0.13,
            SoundTable = sounds,
            LHIK = true,
            LHIKIn = 0.12,
            LHIKOut = 0.20,
            TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        }
    end
end

local otsPoseSources = {
    ["base_idle"] = "ots28_pose_base_idle",
    ["base_draw"] = "ots28_pose_base_draw",
    ["base_holster"] = "ots28_pose_base_holster",
    ["base_fire_1"] = "ots28_pose_base_fire_1",
    ["base_fire_2"] = "ots28_pose_base_fire_2",
    ["base_fire_cock_1"] = "ots28_cycle_base_fire_cock_1",
    ["base_fire_cock_2"] = "ots28_cycle_base_fire_cock_2",
    ["iron_fire_1"] = "ots28_pose_iron_fire_1",
    ["iron_fire_2"] = "ots28_pose_iron_fire_2",
    ["iron_fire_cock_1"] = "ots28_cycle_iron_fire_cock_1",
    ["iron_fire_cock_2"] = "ots28_cycle_iron_fire_cock_2",
    ["base_melee_bash"] = "ots28_pose_base_melee_bash",
    ["base_dryfire"] = "ots28_pose_base_dryfire",
    ["iron_dryfire"] = "ots28_pose_iron_dryfire",
}
local oldSequence = SWEP.Hook_TranslateSequence
SWEP.Hook_TranslateSequence = function(wep, source)
    if prototype(wep) == 3 then
        if type(source) == "table" then
            local translated = {}
            local changed = false
            for key, value in pairs(source) do
                local replacement = otsPoseSources[value]
                translated[key] = replacement or value
                if replacement then
                    changed = true
                end
            end
            if changed then
                return translated
            end
        elseif otsPoseSources[source] then
            return otsPoseSources[source]
        end
    end
    if oldSequence then
        return oldSequence(wep, source)
    end
end

SWEP.AttachmentElements.ks23_ots28 = {
    AttPosMods = {
        [5] = { vpos = Vector(-0.05089, 3.44, -0.06) },
        [14] = { vpos = Vector(-0.05089, 3.44, 0.89) },
    },
}
