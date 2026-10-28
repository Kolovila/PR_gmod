local att = {}
att.PrintName = "LPC Model 16 Laser Assembly"
att.AbbrevName = "LPC-16"
att.Icon = Material("entities/att/uc_lpc16/lpc16.png", "smooth mips")
att.Description = "An early helium-neon laser with a rechargeable power housing, folding carry handle and a tube passing through the modified front sight. Its visible red beam helps aim in low light, but the bulky assembly adds weight and slows handling."
att.Slot = "ux_ud_m16_lpc16"
att.Model = "models/weapons/arccw/atts/uc_lpc16.mdl"
att.ModelScale = Vector(1,1,1)
 
 
att.DrawFunc = function(wep, element, world)
    if not IsValid(element.Model) then return end
    local ang = element.Model:GetAngles()
    ang:RotateAroundAxis(ang:Up(), -90)
    element.Model:SetAngles(ang)
    element.Model:SetRenderAngles(ang)
end
att.ActivateElements = {"upper_flat", "ux_lpc16"}
att.GivesFlags = {"ux_lpc16"}
att.ExcludeFlags = {"upper_50bmg", "m16_usas", "ud_m16_retro", "ux_colt_acr_upper"}
att.AutoStats = true
att.SortOrder = 900
att.Mult_SightTime = 1.18
att.Mult_Sway = 1.12
att.Mult_SpeedMult = .97
att.Desc_Cons = {"con.beam"}
att.LaserStrength = 1
att.LaserBone = "laser"
att.LaserColor = Color(255,35,20)
 
att.IronSight = true
att.Override_IronSightStruct = {Pos=Vector(-2.806967,0,-1.459313),Ang=Angle(0,0,0),Magnification=1.05,SwitchToSound=""}
att.Override_IronSightStruct_Priority = 2
att.ToggleStats = {
    {PrintName = "Laser On", Laser = true, LaserBone = "laser", LaserColor = Color(255,35,20), Mult_HipDispersion = .65, Mult_MoveDispersion = .8},
    {PrintName = "Laser Off", Laser = false},
}
att.Hook_Compatible = function(wep)
    if not wep.UXLPC16M16 then return false end
    local barrel = wep.Attachments[2].Installed
    if barrel and barrel ~= "ud_m16_barrel_20in" then return false end
    local handguard = wep.Attachments[3].Installed
    if handguard == "ud_m16_hg_adar" or handguard == "ud_m16_hg_fpw" or handguard == "ud_m16_hg_lmg" then return false end
end
ArcCW.LoadAttachmentType(att, "ux_ud_m16_optic_lpc16")
