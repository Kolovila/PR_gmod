att.PrintName = "SR-25 20Rnd Mag"
att.Icon = Material("vgui/fas2atts/m2120rndmag")
att.Description = "A 20-round double stack steel magazine for SR-25 and compatible systems"

att.AutoStats = true
att.Slot = "fas2_sr25_20rnd"

att.MagExtender = true

att.Override_ClipSize = 20

att.ActivateElements = {"20rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end