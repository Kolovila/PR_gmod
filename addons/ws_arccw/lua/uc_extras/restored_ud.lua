if SERVER then AddCSLuaFile() end

 
return function(SWEP, weapon)
    local modelRoot = "models/weapons/arccw/"
    if weapon == "m16" then
        SWEP.ViewModel = modelRoot .. "c_ud_m16_restored.mdl"
        SWEP.WorldModel = SWEP.ViewModel
        local originalShootSrc = SWEP.GetShootSrc
        SWEP.GetShootSrc = function(wep, ...)
            local src = (originalShootSrc or wep.BaseClass.GetShootSrc)(wep, ...)
            if wep.Attachments[2].Installed ~= "ux_ud_m16_barrel_cursed" then return src end
            local owner = wep:GetOwner()
            if not IsValid(owner) then return src end
            local lowered = src - owner:EyeAngles():Up() * 14
             
            local trace = util.TraceLine({start = src, endpos = lowered,
                mask = MASK_SHOT, filter = {wep, owner}})
            if trace.Hit then return trace.HitPos + trace.HitNormal * 0.05 end
            return lowered
        end
        local barrels = {
            smg = 11, exposed = 12, cursed = 13, m4 = 14,
            tactical_A4 = 15, wood = 16, wood_short = 17,
        }
        local muzzleMounts = {
            smg = Vector(0.000657000, -0.284744367, 14.176660093),
            exposed = Vector(0.003687000, -0.331564865, 29.482715608),
            cursed = Vector(-0.001314000, 3.925113167, 31.112453717),
            m4 = Vector(-0.001316000, -0.321334534, 25.906297105),
            tactical_A4 = Vector(-0.016025500, -0.321332824, 31.137687105),
            wood = Vector(0.001854500, -0.321332882, 30.962518105),
            wood_short = Vector(-0.001316000, -0.321334850, 24.938119105),
        }
        for kind, pos in pairs(muzzleMounts) do
            SWEP.AttachmentElements['ux_m16_muzzle_' .. kind] = {
                AttPosMods = {[4] = {vpos = pos, vang = Angle(90, 0, -90)}},
            }
        end
        local originalBodygroups = SWEP.Hook_ModifyBodygroups
        SWEP.Hook_ModifyBodygroups = function(wep, data)
            local vm = data.vm
            if not IsValid(vm) then return end
            originalBodygroups(wep, data)
             
             
            if vm:GetBodygroup(5) > 10 then vm:SetBodygroup(5, 10) end
            local barrel = wep.Attachments[2].Installed or ""
            local variant = barrels[string.Replace(barrel, "ux_ud_m16_barrel_", "")]
            if variant then
                vm:SetBodygroup(4, 5)
                vm:SetBodygroup(5, variant)
                vm:SetBodygroup(6, 5)
                vm:SetBodygroup(9, 0)
                vm:SetBodygroup(10, 0)
                vm:SetBodygroup(11, 0)
                vm:SetBodygroup(12, 1)
            end
        end
         
        for _, slot in ipairs({3, 16}) do
            SWEP.Attachments[slot].ExcludeFlags = SWEP.Attachments[slot].ExcludeFlags or {}
            table.insert(SWEP.Attachments[slot].ExcludeFlags, "ux_m16_integral_barrel")
        end
    elseif weapon == "m79" then
        SWEP.ViewModel = modelRoot .. "c_ud_m79_restored.mdl"
        SWEP.WorldModel = SWEP.ViewModel
        SWEP.AttachmentElements.ux_m79_double = {
            VMBodygroups = {{ind = 0, bg = 5}},
             
             
            AttPosMods = {[1] = {vpos = Vector(0, -5.691158, 1)}},
        }
        SWEP.Hook_ModifyBodygroups = function(wep, data)
            local vm = data.vm
            if not IsValid(vm) or wep.Attachments[3].Installed ~= "ux_ud_m79_barrel_double" then return end
            vm:SetBodygroup(0, 5)
            local ammunition = vm:GetBodygroup(1)
            local single = wep:GetVisualClip() == 1
            vm:SetBodygroup(1, ammunition % 8 + (single and 16 or 8))
            if vm:GetBodygroup(3) ~= 0 then vm:SetBodygroup(3, 2) end
            local stock = vm:GetBodygroup(2)
            if stock == 0 then vm:SetBodygroup(2, 3)
            elseif stock == 2 then vm:SetBodygroup(2, 4) end
             
            vm:SetBodygroup(4, 2)
        end
        local originalThink = SWEP.Hook_Think
        SWEP.Hook_Think = function(wep, ...)
            if originalThink then originalThink(wep, ...) end
            wep.MuzzleEffectAttachment = wep.Attachments[3].Installed == "ux_ud_m79_barrel_double"
                and wep:Clip1() == 1 and 3 or 1
        end
        SWEP.Attachments[2].ExcludeFlags = {"m79_pirategun", "ux_m79_double"}
    end
end
