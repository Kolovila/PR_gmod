att.PrintName = "AK-101 60rnd Mag"
att.Icon = Material("vgui/fas2atts/545_60rnd")
att.Description = "The 60-round polymer magazine for AK-101 and compatible systems"

att.AutoStats = true
att.Slot = "fas2_ak101_60rnd"

att.MagExtender = true

att.Override_ClipSize = 60

att.ActivateElements = {"60rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end