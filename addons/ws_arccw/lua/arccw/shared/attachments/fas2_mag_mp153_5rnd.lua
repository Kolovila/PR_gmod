att.PrintName = "MP-153 5rnd Tube"
att.Icon = Material("vgui/fas2atts/tube")
att.Description = "A 5-shell capacity tube magazine for MP-153"

att.SortOrder = 4

att.AutoStats = true
att.Slot = "fas2_mp153_tube"

att.MagExtender = true

att.Override_ClipSize = 5

att.ActivateElements = {"5rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end