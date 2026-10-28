if SERVER then AddCSLuaFile() end
local specs = include("uc_extras/ak12_specs.lua")
return function(SWEP)
    local familyModel = "models/weapons/arccw/c_ur_ak_family.mdl"
    local stocks = {ux_ak_stock_evo = 2, ux_ak_stock_evo_riser = 3}
    local handguards = {ux_ak_hg_ak12_k = 1, ux_ak_hg_ak12_sk = 2}
    local barrels = {ux_ak_barrel_ak12_k = {group = 1, muzzle_y = 18.186152357, bare = 9, brake = 10},
        ux_ak_barrel_ak12_sk = {group = 2, muzzle_y = 15.745207476, bare = 12, brake = 13}}
    SWEP.AttachmentElements.ux_ak12_family_model = {VMElements = {{Model = familyModel, BoneMerge = true,
        Bone = "tag_weapon", Offset = {pos = Vector(), ang = Angle()}}}}
    table.insert(SWEP.DefaultElements, "ux_ak12_family_model")
    for id in pairs(specs) do
        SWEP.AttachmentElements["ux_ak12_family_" .. id] = {VMBodygroups = {{ind = 0, bg = 2}}}
    end
    SWEP.AttachmentElements.ur_ak_cal_545_ak12 = SWEP.AttachmentElements.ux_ak12_family_ur_ak_cal_545_ak12
    for id in pairs(stocks) do SWEP.AttachmentElements[id] = {VMBodygroups = {{ind = 6, bg = 9}}} end
    for id, b in pairs(barrels) do
        SWEP.AttachmentElements[id] = {VMBodygroups = {{ind = 7, bg = 5}, {ind = 5, bg = 1}, {ind = 8, bg = 2}},
            AttPosMods = {[4] = {vpos = Vector(0, b.muzzle_y, 2.80770471), vang = Angle(0, 270, 0)}},
            Override_IronSightStruct = SWEP.AttachmentElements.barrel_ak12.Override_IronSightStruct}
    end
    for id, group in pairs(handguards) do
        local y = group == 1 and 10.65 or 9.20
        SWEP.AttachmentElements[id] = {VMBodygroups = {{ind = 1, bg = 4}},
            AttPosMods = {[3] = {vpos = Vector(0, y, 1.9), vang = Angle(90, -90, -90)},
                [7] = {vpos = Vector(0, y, 2.2), vang = Angle(90, -90, -90)},
                [8] = {vpos = Vector(-0.7, y, 3.8), vang = Angle(-90, 270, 0)}}}
    end
    local previousName, previousGroups = SWEP.Hook_NameChange, SWEP.Hook_ModifyBodygroups
    SWEP.Hook_NameChange = function(wep, name)
        local spec = specs[wep.Attachments[5].Installed]
        if spec then return spec.name end
        if previousName then return previousName(wep, name) end
    end
    SWEP.Hook_ModifyBodygroups = function(wep, data)
        if previousGroups then previousGroups(wep, data) end
        if not IsValid(data.vm) then return end
        local spec = specs[wep.Attachments[5].Installed]
        local stock = stocks[wep.Attachments[10].Installed]
        local magazine = spec and not wep.Attachments[6].Installed
        local barrel = barrels[wep.Attachments[2].Installed]
        local handguard = handguards[wep.Attachments[3].Installed]
        if handguard then data.vm:SetBodygroup(1, 4) end
        local brake = barrel and not wep.Attachments[4].Installed
        if spec then data.vm:SetBodygroup(0, 2) end
        if stock then data.vm:SetBodygroup(6, 9) end
        if magazine then data.vm:SetBodygroup(2, 5) end
        if barrel then
            data.vm:SetBodygroup(7, 5); data.vm:SetBodygroup(5, 1); data.vm:SetBodygroup(8, 2)
            local muzzle = ArcCW.AttachmentTable[wep.Attachments[4].Installed]
             
            wep.MuzzleEffectAttachment = muzzle and muzzle.IsMuzzleDevice and 1 or brake and barrel.brake or barrel.bare
        end
        for _, element in pairs((data.wm and wep.WM or wep.VM) or {}) do
            if IsValid(element.Model) and element.Model:GetModel() == familyModel then
                element.Model:SetBodygroup(0, stock or 0)
                element.Model:SetBodygroup(1, magazine and spec.groups.magazine or 0)
                element.Model:SetBodygroup(2, barrel and barrel.group or 0)
                element.Model:SetBodygroup(3, brake and barrel.group or 0)
                element.Model:SetBodygroup(4, handguard or 0)
            end
        end
    end
end
