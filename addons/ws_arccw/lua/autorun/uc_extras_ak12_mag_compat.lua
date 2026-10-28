if SERVER then AddCSLuaFile() end
local function update(att)
    if not att then return end
    local slots = type(att.Slot) == "table" and att.Slot or {att.Slot}
    for _, slot in pairs(slots) do
        if slot == "ur_ak_mag" then
            att.ExcludeFlags = att.ExcludeFlags or {}
            if type(att.ExcludeFlags) == "string" then att.ExcludeFlags = {att.ExcludeFlags} end
            for _, flag in ipairs({"cal_308", "cal_602"}) do
                if not table.HasValue(att.ExcludeFlags, flag) then table.insert(att.ExcludeFlags, flag) end
            end
            return
        end
    end
end
hook.Add("ArcCW_OnAttLoad", "UCExtras.AK12MagazineCalibres", update)
local function updateAll()
    for _, att in pairs(ArcCW and ArcCW.AttachmentTable or {}) do update(att) end
end
hook.Add("ArcCW_PostLoadAtts", "UCExtras.AK12MagazineCalibres", updateAll)
hook.Add("InitPostEntity", "UCExtras.AK12MagazineCalibres", updateAll)
hook.Add("OnReloaded", "UCExtras.AK12MagazineCalibres", updateAll)
updateAll()
