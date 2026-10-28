att.PrintName = "Mossberg M88C 9rnd Tube"
att.Icon = Material("vgui/fas2atts/tube")
att.Description = "A 9-shell capacity tube magazine for Mossberg Maverick 88 Cruiser"

att.AutoStats = true
att.Slot = "fas2_m88c_9rnd"

att.MagExtender = true

att.Override_ClipSize = 9

att.ActivateElements = {"9rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end