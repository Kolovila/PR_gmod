if SERVER then AddCSLuaFile() end
return function(SWEP)
    SWEP.UXLPC16M16 = true
    table.insert(SWEP.Attachments[1].Slot, "ux_ud_m16_lpc16")
    SWEP.AttachmentElements.ux_lpc16 = {
        VMBodygroups = {{ind=1,bg=1},{ind=3,bg=0},{ind=6,bg=5}},
        AttPosMods = {[1] = {vpos=Vector(0,-1.85,0), vang=Angle(0,0,-90),
            SlideAmount={vmin=Vector(0,-1.85,0),vmax=Vector(0,-1.85,0)}}}
    }
    local previous = SWEP.Hook_ModifyBodygroups
    SWEP.Hook_ModifyBodygroups = function(wep,data)
        if previous then previous(wep,data) end
        if wep.Attachments[1].Installed ~= "ux_ud_m16_optic_lpc16" or not IsValid(data.vm) then return end
         
         
        data.vm:SetBodygroup(1,1)
        data.vm:SetBodygroup(3,0)
        data.vm:SetBodygroup(6,5)
    end
end
