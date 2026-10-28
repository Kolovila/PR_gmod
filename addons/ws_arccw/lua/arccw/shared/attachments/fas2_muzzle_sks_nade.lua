att.PrintName = "M60 Rifle Grenade"
att.Icon = Material("vgui/fas2atts/incendiary")
att.Description = "The M60 Grenade is an old HE grenade designed for SKS and compatible system"

att.AutoStats = true
att.Slot = "fas2_sks_nade"

att.Override_ClipSize = 1
att.Override_Damage = 0
att.Override_DamageMin = 0

att.Override_Ammo = "60mmp1ap"

att.Override_ShellModel = "models/shells/9x18mm.mdl"

att.GivesFlags = {"nade"}
att.ExcludeFlags = {"ammo"}

att.Override_ShootEntity = "arccw_firearms2_m60p1ap_fly"

att.Override_ShootSound = "Firearms2_M60P1AP"

att.Override_MuzzleEffect = "muzzleflash_suppressed"

att.Hook_GetShootSound = function(wep, sound)
    return "Firearms2_M60P1AP"
end

att.ActivateElements = {"nade"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end