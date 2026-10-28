if SERVER then AddCSLuaFile() end
return function(SWEP)
    local model = "models/weapons/arccw/c_ur_rpk12_parts.mdl"
    SWEP.AttachmentElements.ux_rpk12_parts = {VMElements = {{Model = model, BoneMerge = true,
        Bone = "tag_weapon", Offset = {pos = Vector(), ang = Angle()}}}}
    table.insert(SWEP.DefaultElements, "ux_rpk12_parts")
    SWEP.AttachmentElements.ux_ak_stock_rpk12 = {VMBodygroups = {{ind = 6, bg = 9}}}
    SWEP.AttachmentElements.ux_ak_hg_rpk12 = {VMBodygroups = {{ind = 1, bg = 4}},
        AttPosMods = {[3] = {vpos = Vector(0, 12.3, 1.9), vang = Angle(90, -90, -90)},
            [7] = {vpos = Vector(0, 13.0, 2.0), vang = Angle(90, -90, -90)},
            [8] = {vpos = Vector(-.8, 14.0, 3.65), vang = Angle(-90, 270, 0)}}}
    SWEP.AttachmentElements.ux_ak_barrel_rpk12 = {VMBodygroups = {{ind = 7, bg = 5}, {ind = 8, bg = 2}},
        AttPosMods = {[4] = {vpos = Vector(.012097, 32.188774, 2.6036815), vang = Angle(0, 270, 0)}}}
    local previous = SWEP.Hook_ModifyBodygroups
    SWEP.Hook_ModifyBodygroups = function(wep, data)
        if previous then previous(wep, data) end
        if not IsValid(data.vm) then return end
        local stock = wep.Attachments[10].Installed == "ux_ak_stock_rpk12"
        local hg = wep.Attachments[3].Installed == "ux_ak_hg_rpk12"
        local barrel = wep.Attachments[2].Installed == "ux_ak_barrel_rpk12"
        if stock then data.vm:SetBodygroup(6, 9) end
        if hg then data.vm:SetBodygroup(1, 4) end
        if barrel then
            data.vm:SetBodygroup(7, 5); data.vm:SetBodygroup(8, 2)
            local device = ArcCW.AttachmentTable[wep.Attachments[4].Installed]
            wep.MuzzleEffectAttachment = device and device.IsMuzzleDevice and 1 or 18
        end
        local deployed = barrel and wep:GetInBipod()
            and (wep.LastAnimKey ~= "enter_bipod" or (wep.LastAnimFinishTime or 0) <= CurTime())
        for _, element in pairs((data.wm and wep.WM or wep.VM) or {}) do
            if IsValid(element.Model) and element.Model:GetModel() == model then
                element.Model:SetBodygroup(0, stock and 1 or 0)
                element.Model:SetBodygroup(1, hg and 1 or 0)
                element.Model:SetBodygroup(2, barrel and (deployed and 2 or 1) or 0)
            end
        end
    end
end
