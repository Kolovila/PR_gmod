att.PrintName = "Minimi/M249 200rnd Box"
att.Icon = Material("vgui/fas2atts/200rnd")
att.Description = "A 200-round box magazine for Minimi/M249 machine guns and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_m249_200rnd"

att.MagExtender = true

att.Override_ClipSize = 200

att.ActivateElements = {"200mag"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end