-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_fg_m60_hmg.lua
do
    local att = {}

att.PrintName = "Prototype #3462 HMG Mk.2"
att.AbbrevName = "Prototype #3462 HMG Mk.2"
att.Description = "A strange set of internal mechanisms that was purposely designed to double the fire rate of the M60."
att.Icon = Material("", "smooth mips")
att.Slot = {"uc_m60_fg"}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}

att.AutoStats = true

att.Mult_RPM = 2

    ArcCW.LoadAttachmentType(att, "uc_fg_m60_hmg")
end
-- END BUNDLED ATTACHMENT: uc_fg_m60_hmg.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_barrel_short.lua
do
    local att = {}

att.PrintName = "15\" Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Short barrel for the m60."
att.AutoStats = true

att.Slot = "uc_m60_barrel"

att.SortOrder = 3

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/vergi_arccw/foregrip_lhik.mdl"

att.Add_BarrelLength = -7
att.Mult_Sway = .80
att.Mult_SightTime = .80
att.Mult_RPM = 1.2
att.Mult_SpeedMult = 1.10
att.Mult_SightedSpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.10
att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.Mult_Recoil = 1.20
att.Mult_AccuracyMOA = 1.15
att.Mult_Range = 0.650

att.Mult_HipDispersion = 1.20
att.Mult_ShootPitch = 1.15

att.ActivateElements = {"barrel_short"}

att.Mult_PhysBulletMuzzleVelocity = 0.65

    ArcCW.LoadAttachmentType(att, "uc_m60_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_m60_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_barrel_tac.lua
do
    local att = {}

att.PrintName = "18\" Barrel + Tactical Conversion Kit"

att.Icon = Material("", "smooth mips")
att.Description = "This is a short barrel for the M60 that comes with other replacement parts for the weapon, such as picatinny rails. Allows optics, tactical lights and foregrips to be mounted."
att.AutoStats = true

att.Slot = "uc_m60_barrel"

att.SortOrder = 3

att.Add_BarrelLength = -7
att.Mult_Sway = .80
att.Mult_SightTime = .80
att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05
att.Mult_DrawTime = 0.80
att.Mult_HolsterTime = 0.80

att.Mult_Recoil = 1.30
att.Mult_AccuracyMOA = 1.15
att.Mult_Range = 0.650

att.Mult_HipDispersion = 1.20
att.Mult_ShootPitch = 1.15

att.ActivateElements = {"barrel_tac"}

att.Mult_PhysBulletMuzzleVelocity = 0.65

    ArcCW.LoadAttachmentType(att, "uc_m60_barrel_tac")
end
-- END BUNDLED ATTACHMENT: uc_m60_barrel_tac.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_box_150.lua
do
    local att = {}

att.PrintName = "150-Round Box"
att.AbbrevName = "150-Round Ammobox"

att.SortOrder = 15
att.Icon = Material("", "smooth mips")
att.Description = "High capacity ammobox."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m60_mag"

att.AutoStats = true

att.Override_ClipSize = 150

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.05
att.Mult_Sway = 0.95

att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.95

att.Mult_DrawTime = 1.10
att.Mult_HolsterTime = 1.10

att.ActivateElements = {"box_150"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_150"
end

    ArcCW.LoadAttachmentType(att, "uc_m60_box_150")
end
-- END BUNDLED ATTACHMENT: uc_m60_box_150.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_box_200.lua
do
    local att = {}

att.PrintName = "200-Round Box"
att.AbbrevName = "200-Round Ammobox"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "Higher capacity ammobox."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m60_mag"

att.AutoStats = true

att.Override_ClipSize = 200

att.Mult_SightTime = 1.10
att.Mult_ReloadTime = 1.10
att.Mult_Sway = 0.90

att.Mult_SpeedMult = 0.90
att.Mult_SightedSpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.90

att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15

att.ActivateElements = {"box_200"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_200"
end

    ArcCW.LoadAttachmentType(att, "uc_m60_box_200")
end
-- END BUNDLED ATTACHMENT: uc_m60_box_200.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_box_50.lua
do
    local att = {}

att.PrintName = "50-Round Box"
att.AbbrevName = "50-Round Ammobox"

att.SortOrder = 10
att.Icon = Material("", "smooth mips")
att.Description = "Lower capacity ammobox."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m60_mag"

att.AutoStats = true

att.Override_ClipSize = 50

att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 1.10

att.Mult_SpeedMult = 1.20
att.Mult_SightedSpeedMult = 1.20
att.Mult_ShootSpeedMult = 1.20

att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.ActivateElements = {"box_50"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50"
end

    ArcCW.LoadAttachmentType(att, "uc_m60_box_50")
end
-- END BUNDLED ATTACHMENT: uc_m60_box_50.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_cal_410.lua
do
    local att = {}

att.PrintName = "M60 .410 Bore Receiver"
att.AbbrevName = ".410 Bore"

att.Icon = Material("entities/att/uc_bullets/20g.png", "mips smooth")
att.Description = "Unwise conversion that allows the M60 to feed and fire .410 bore rounds, turning it into a shotgun."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M60 5.56x45mm Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_m60_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = ".410 Bore"
att.Override_Trivia_Class = "Shotgun"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.Mult_ReloadTime = 1.05
att.Mult_Recoil = 1.15
att.Mult_HipDispersion = 1.10
att.Override_Num = 4
att.Mult_AccuracyMOA = 25

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 1.30
att.Mult_Damage = 1.38
att.ShootPitchVariation = 1

att.ActivateElements = {"cal_410"}

att.Mult_RPM = 0.80

local path = "weapons/misc/"

local fire22 = {path .. "scar_410_fire.wav"}
local fire22sup = {path .. "scar_410_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "uc_m60_cal_410")
end
-- END BUNDLED ATTACHMENT: uc_m60_cal_410.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_cal_556.lua
do
    local att = {}

att.PrintName = "M60 5.56x45mm Receiver"
att.AbbrevName = "5.56x45mm"

att.Icon = Material("entities/att/uc_bullets/556x45.png", "mips smooth")
att.Description = "Civilian version of the M60 chambered in 5.56x45mm NATO."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M60 5.56x45mm Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_m60_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = "5.56x45mm NATO"

att.Mult_RPM = 650 / 520
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .95
att.Mult_Recoil = 0.45
att.Mult_HipDispersion = .75
att.Mult_ClipSize = 1.20

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 20 / 35
att.Mult_Damage = 34 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1
att.ActivateElements = {"cal_556"}

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "uzi_556_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "uzi_556_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_m60_cal_556")
end
-- END BUNDLED ATTACHMENT: uc_m60_cal_556.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_cal_9mm.lua
do
    local att = {}

att.PrintName = "M60 9x19mm Parabellum Receiver"
att.AbbrevName = "9x19mm Parabellum"

att.Icon = Material("entities/att/uc_bullets/9x19.png", "mips smooth")
att.Description = "SMG version of the M60 chambered in 9x19mm Parabellum."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M60 9x19mm Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_m60_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_Trivia_Class = "Submachine Gun"

att.Mult_ClipSize = 2
att.ActivateElements = {"cal_9mm"}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Mult_RPM = 1.675
att.Mult_ReloadTime = 0.85
att.Mult_Recoil = 0.60
att.Mult_HipDispersion = 0.75

att.Mult_Penetration = 0.30
att.Mult_DamageMin = 0.30
att.Mult_Damage = 0.20
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/m16_380acp_sup.wav"
    else
        return "weapons/misc/m16_380acp_fire.wav"
    end
end

    ArcCW.LoadAttachmentType(att, "uc_m60_cal_9mm")
end
-- END BUNDLED ATTACHMENT: uc_m60_cal_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m60_stock_none.lua
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = Material("")
att.Description = "Removes the stock completely, making the weapon's rear as compact as it can get."

att.SortOrder = 996

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_m60_stock"
att.ActivateElements = {"stock_none"}

att.Mult_SightTime = 0.80
att.Mult_Sway = 1.45

att.Mult_SightedSpeedMult = 1.5
att.Mult_ShootSpeedMult = 1.5
att.Mult_RecoilSide = 2.2
att.Mult_Recoil = 2.2
att.Add_BarrelLength = -5

    ArcCW.LoadAttachmentType(att, "uc_m60_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_m60_stock_none.lua
