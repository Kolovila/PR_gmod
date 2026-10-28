if SERVER then AddCSLuaFile() end
return function(SWEP, weapon)
    local root = "models/weapons/arccw/"
    SWEP.ViewModel = root .. "c_ur_" .. weapon .. "_restored.mdl"
    SWEP.WorldModel = SWEP.ViewModel
    local original = SWEP.Hook_ModifyBodygroups
    if weapon == "ak" then
        local el = SWEP.AttachmentElements
        el.reciever_ak12.VMBodygroups = {{ind = 0, bg = 2}}
        el.grip_ak12 = {VMBodygroups = {{ind = 9, bg = 5}}}
        el.cover_ak12.VMBodygroups = {{ind = 10, bg = 5}}
        el.sight_ak12.RequireFlags = {"ux_ak12_cover"}
        el.barrel_ak12.AttPosMods[4].vpos = Vector(0, 23.1074122, 2.80770471)
        el.barrel_ak12.VMBodygroups = {{ind = 7, bg = 6}, {ind = 5, bg = 1}, {ind = 8, bg = 2}}
        el.ux_ak_aux = {VMElements = {{Model = root .. "c_ur_ak_aux_restored.mdl",
            BoneMerge = true, Bone = "tag_weapon", Offset = {pos = Vector(), ang = Angle()}}}}
        SWEP.DefaultElements = SWEP.DefaultElements or {}
        table.insert(SWEP.DefaultElements, "ux_ak_aux")
        SWEP.Hook_ModifyBodygroups = function(wep, data)
            if original then original(wep, data) end
            if not IsValid(data.vm) then return end
            local a = wep.Attachments
            local bayonet, adapter = 0, 0
            for _, name in pairs(data.eles or wep:GetActiveElements()) do
                local e = wep.AttachmentElements[name]
                for _, group in pairs(e and e.VMBodygroups or {}) do
                    if group.ind == 11 then bayonet = group.bg end
                    if group.ind == 13 then adapter = group.bg end
                end
            end
            local optic, upper = a[1].Installed, a[15].Installed
            if upper == "ur_ak_cover_ak12" then
                data.vm:SetBodygroup(4, 3)
            elseif data.vm:GetBodygroup(4) == 3 then
                data.vm:SetBodygroup(4, 0)
            end
            local special = optic == "uc_optic_pso1" or optic == "uc_optic_kobra"
            local rail = upper == "ur_ak_cover_alpha" or upper == "ur_ak_cover_ak12" or upper == "ur_ak_cover_truniun_rail"
            local mount = 0
            if a[16].Installed == "ur_ak_charm_tl" and not special then mount = 2
            elseif optic and not rail and not special then mount = 1 end
            for _, e in pairs((data.wm and wep.WM or wep.VM) or {}) do
                if IsValid(e.Model) and e.Model:GetModel() == root .. "c_ur_ak_aux_restored.mdl" then
                    e.Model:SetBodygroup(0, bayonet)
                    e.Model:SetBodygroup(1, mount)
                    e.Model:SetBodygroup(2, adapter)
                end
            end
            if a[2].Installed == "ur_ak_barrel_ak12" then
                local standard = not a[4].Installed or a[4].Installed == "ur_ak_muzzle_bayonet"
                data.vm:SetBodygroup(8, standard and 5 or 2)
                wep.MuzzleEffectAttachment = standard and 5 or 4
            else wep.MuzzleEffectAttachment = 1 end
        end
    else
        SWEP.AttachmentElements.ux_spas_vintage_kit = {
            VMBodygroups = {{ind = 0, bg = 4}, {ind = 1, bg = 5}},
            AttPosMods = {[3] = {vpos = Vector(0, 26.266416, -0.699458)}},
        }
        SWEP.AttachmentElements.ux_spas_vintage_stock = {VMBodygroups = {{ind = 3, bg = 6}}}
        SWEP.AttachmentElements.ux_spas_vintage_stock_extended = {VMBodygroups = {{ind = 3, bg = 7}}}
        SWEP.AttachmentElements.ur_spas12_stock_hook = {VMBodygroups = {{ind = 3, bg = 8}}}
        local oldTranslate = SWEP.Hook_TranslateAnimation
        SWEP.Hook_TranslateAnimation = function(wep, anim)
            if oldTranslate then anim = oldTranslate(wep, anim) or anim end
            if wep.Attachments[7].Installed == "ux_ur_spas12_stock_vintage_comp" then
                local folded = anim .. "_fold"
                if wep.Animations[folded] then return folded end
            end
            return anim
        end
        SWEP.Hook_ModifyBodygroups = function(wep, data)
            if original then original(wep, data) end
            if not IsValid(data.vm) then return end
            if wep.Attachments[2].Installed == "ux_ur_spas12_barrel_vintage_comp" then
                if not wep.Attachments[7].Installed then data.vm:SetBodygroup(3, 7) end
                data.vm:SetBodygroup(0, wep.Attachments[6].Installed == "ux_ur_spas12_grip_vintage_comp" and 5 or 4)
                wep.MuzzleEffectAttachment = 4
            else wep.MuzzleEffectAttachment = 1 end
        end
    end
end
