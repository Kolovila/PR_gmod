att.PrintName = "12.7 20rnd Mag"
att.Icon = Material("vgui/fas2atts/sg55xmag")
att.Description = "The 20-round magazine for ASh-12 and compatible systems"

att.AutoStats = true
att.Slot = "fas2_127_20rnd"

att.MagExtender = true

att.Override_ClipSize = 20

att.ActivateElements = {"20rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end