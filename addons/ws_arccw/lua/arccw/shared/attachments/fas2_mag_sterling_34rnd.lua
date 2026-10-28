att.PrintName = "Sterling 34Rnd Mag"
att.Icon = Material("vgui/fas2atts/mp5k30rnd")
att.Description = "A 34-round steel magazine for Sterling systems"

att.AutoStats = true
att.Slot = "fas2_sterling_34rnd"

att.MagExtender = true

att.Override_ClipSize = 34

att.ActivateElements = {"34rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end