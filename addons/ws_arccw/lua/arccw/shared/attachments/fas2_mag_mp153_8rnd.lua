att.PrintName = "MP-153 8rnd Tube"
att.Icon = Material("vgui/fas2atts/tube")
att.Description = "A 8-shell capacity tube magazine for MP-153"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_mp153_tube"

att.MagExtender = true

att.Override_ClipSize = 8

att.ActivateElements = {"8rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end