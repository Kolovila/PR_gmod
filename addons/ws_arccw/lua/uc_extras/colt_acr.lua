if SERVER then AddCSLuaFile() end
return function(SWEP)
    local model = "models/weapons/arccw/c_ud_m16_colt_acr.mdl"
    SWEP.AttachmentElements.ux_colt_acr_parts = {VMElements = {{Model = model, BoneMerge = true,
        Bone = "m16_parent", Offset = {pos = Vector(), ang = Angle()}}}}
    SWEP.DefaultElements = SWEP.DefaultElements or {}
    table.insert(SWEP.DefaultElements, "ux_colt_acr_parts")
    local upperSlot = 5  
    SWEP.Attachments[1].ExcludeFlags = SWEP.Attachments[1].ExcludeFlags or {}
    table.insert(SWEP.Attachments[1].ExcludeFlags, "ux_colt_acr_upper")
    SWEP.Attachments[1].GivesFlags = SWEP.Attachments[1].GivesFlags or {}
    table.insert(SWEP.Attachments[1].GivesFlags, "ux_colt_acr_optic")
    for _, slot in ipairs({3, 16}) do
        SWEP.Attachments[slot].ExcludeFlags = SWEP.Attachments[slot].ExcludeFlags or {}
        table.insert(SWEP.Attachments[slot].ExcludeFlags, "ux_colt_acr_barrel")
    end
    for _, kind in ipairs({"long", "short"}) do
        local tip = kind == "long" and 24.256155180 or 18.866155180
         
         
        local height = kind == "long" and -.549991695 or -.549993576
        SWEP.AttachmentElements["ux_colt_acr_" .. kind] = {
            VMBodygroups = {{ind = 4, bg = 5}, {ind = 5, bg = 9}, {ind = 6, bg = 5}, {ind = 11, bg = 0}, {ind = 12, bg = 1}},
            AttPosMods = {[4] = {vpos = Vector(0, height, tip), vang = Angle(90, 0, -90)}}}
    end
    SWEP.AttachmentElements.ux_colt_acr_stock = {VMBodygroups = {{ind = 7, bg = 12}}}
    SWEP.AttachmentElements.ux_colt_acr_upper = {VMBodygroups = {{ind = 1, bg = 2}, {ind = 3, bg = 0}}}
    local previous = SWEP.Hook_ModifyBodygroups
    SWEP.Hook_ModifyBodygroups = function(wep, data)
        if previous then previous(wep, data) end
        if not IsValid(data.vm) then return end
        local a = wep.Attachments
        local barrel = a[2].Installed == "ux_ud_m16_barrel_colt_acr_long" and 1
            or a[2].Installed == "ux_ud_m16_barrel_colt_acr_short" and 2 or 0
        local stock = a[10].Installed == "ux_ud_m16_stock_colt_acr"
        local upper = a[upperSlot].Installed == "ux_ud_m16_upper_colt_acr"
        local external = a[4].Installed ~= nil
        if barrel == 0 then wep.MuzzleEffectAttachment = wep:GetBuff_Override("MuzzleEffectAttachment") or 1 end
        if barrel > 0 then
            for _, pair in ipairs({{4,5},{5,9},{6,5},{10,0},{11,0},{12,1}}) do data.vm:SetBodygroup(pair[1],pair[2]) end
             
            local device = ArcCW.AttachmentTable[a[4].Installed]
            wep.MuzzleEffectAttachment = device and device.IsMuzzleDevice and 1
                or (barrel == 1 and (external and 13 or 14) or (external and 15 or 16))
        end
        if stock then data.vm:SetBodygroup(7,12) end
        if upper then data.vm:SetBodygroup(1,2); data.vm:SetBodygroup(3,0) end
        for _, element in pairs((data.wm and wep.WM or wep.VM) or {}) do
            if IsValid(element.Model) and element.Model:GetModel() == model then
                element.Model:SetBodygroup(0,barrel)
                element.Model:SetBodygroup(1,stock and 1 or 0)
                element.Model:SetBodygroup(2,upper and 1 or 0)
                element.Model:SetBodygroup(3,external and 0 or barrel)
            end
        end
    end
end
