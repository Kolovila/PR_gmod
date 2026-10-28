-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_sks_barrel_short.lua
do
    local att = {}

att.PrintName = "Shortened Barrel"
att.AbbrevName = "Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Someone has taken a hacksaw to the barrel and moved the gas block and front sight back to meet it. The result is a rifle that clears a doorway instead of announcing itself through one, and which slaps a good deal harder than it used to for the privilege."
att.AutoStats = true

att.Slot = "uc_sks_barrel"
att.SortOrder = 15

att.Add_BarrelLength = -4
att.Mult_Sway = 0.90
att.Mult_SightTime = 0.90

att.Mult_Recoil = 1.25
att.Mult_AccuracyMOA = 1.35
att.Mult_Range = 0.885

att.Mult_HipDispersion = 1.15
att.Mult_ShootPitch = 1.15

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05
att.Mult_DrawTime = 0.95

att.Mult_PhysBulletMuzzleVelocity = 0.90

att.ActivateElements = {"barrel_short"}
att.GivesFlags = {"barrel_short"}

att.ExcludeFlags = {"sks_bayonet_deployed"}

    ArcCW.LoadAttachmentType(att, "uc_sks_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_sks_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_bayonet.lua
do
    local att = {}

att.PrintName = "SKS Bayonet"

att.Description = "Integrated Bayonet for the SKS rifle, folds underneath when not in use."
att.AutoStats = true
att.Slot = {"uc_sks_bayonet"}

att.SortOrder = 9999

att.Free = true

att.Add_MeleeRange = 17
att.Mult_MeleeDamage = 3
att.Mult_MeleeWaitTime = 2
att.Add_BarrelLength = 8
att.Mult_Sway = 1.1
att.Mult_SightTime = 1.05
att.Mult_MeleeTime = 0.8

att.Override_BashPreparePos = Vector(4, -5, -1.8)
att.Override_BashPrepareAng = Angle(-15, -5, -5)
att.Override_BashPos = Vector(-1, 12, 2.5)
att.Override_BashAng = Angle(3, 5, -2)

att.ActivateElements = {"bayonet_sks_deploy"}
att.GivesFlags = {"sks_bayonet_deployed"}

att.ExcludeFlags = {"barrel_short"}

    ArcCW.LoadAttachmentType(att, "uc_sks_bayonet")
end
-- END BUNDLED ATTACHMENT: uc_sks_bayonet.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_cal_545.lua
do
    local att = {}

att.PrintName = "SKS 5.45x39mm Conversion"
att.AbbrevName = "5.45x39mm Conversion"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 5.45x39mm Conversion"
end

att.Icon = Material("", "smooth mips")
att.Description = "Chambered for the round that replaced the one this rifle already lost to, feeding from AK-74 magazines. There is so little recoil that the sights barely leave the target between shots. There is also not a great deal of bullet."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_sks_cal"
att.SortOrder = 7

att.AutoStats = true

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_Damage = 0.72
att.Mult_DamageMin = 0.76
att.Mult_Penetration = 0.85

att.Mult_Range = 1.10
att.Mult_Recoil = 0.60
att.Mult_VisualRecoilMult = 0.65
att.Mult_RPM = 1.10

att.Mult_HipDispersion = 0.80
att.Mult_AccuracyMOA = 0.90
att.Mult_SightTime = 0.95
att.Mult_ReloadTime = 0.95

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.45x39mm"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
att.Override_ShellScale = 0.666
att.Override_PhysBulletMuzzleVelocity = 880

att.ActivateElements = {"conv_545"}
att.GivesFlags = {"conv_545"}

att.Hook_SelectReloadAnimation_Priority = 2
att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_30"
end

local path = ")weapons/arccw_ur/ak/545_39/"
local tail = ")/arccw_uc/common/556x45/"

local fire545 = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local fire545sup = {path .. "fire-sup-01.ogg", path .. "fire-sup-02.ogg", path .. "fire-sup-03.ogg", path .. "fire-sup-04.ogg", path .. "fire-sup-05.ogg", path .. "fire-sup-06.ogg"}
local fire545dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire545sup
    else
        return fire545
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire545dist
    end
end

local slotinfo = {
    [4] = {"30-Round 5.45 Mag", "30-Round 5.45 Mag", Material("", "smooth mips")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

local swap = {
    ["uc_sks/mag_out_30.wav"] = "uc_sks/mag_out_bakelite.wav",
    ["uc_sks/mag_in_30.wav"] = "uc_sks/mag_in_bakelite.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    if !isstring(fsound) then return end
    return swap[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_sks_cal_545")
end
-- END BUNDLED ATTACHMENT: uc_sks_cal_545.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_cal_556.lua
do
    local att = {}

att.PrintName = "SKS 5.56x45mm Conversion"
att.AbbrevName = "5.56x45mm Conversion"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 5.56x45mm Conversion"
end

att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "A new barrel, a new bolt, and a magwell reworked to swallow modified STANAG magazines. The round is lighter than anything the rifle was designed around, which shows up as a flatter trajectory, a gentler push into the shoulder, and rather less argument at the other end."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_sks_cal"
att.SortOrder = 7

att.AutoStats = true

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_Damage = 0.78
att.Mult_DamageMin = 0.80
att.Mult_Penetration = 0.90

att.Mult_Range = 1.15
att.Mult_Recoil = 0.70
att.Mult_VisualRecoilMult = 0.75
att.Mult_RPM = 1.10

att.Mult_HipDispersion = 0.85
att.Mult_AccuracyMOA = 0.90
att.Mult_SightTime = 0.95
att.Mult_ReloadTime = 0.95

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1
att.Override_PhysBulletMuzzleVelocity = 940

att.ActivateElements = {"conv_556"}
att.GivesFlags = {"conv_556"}

att.Hook_SelectReloadAnimation_Priority = 2
att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_30"
end

local path = ")weapons/arccw_ur/g3/"
local path1 = ")weapons/arccw_ur/ak/556/"
local tail = ")/arccw_uc/common/556x45/"

local fire556 = {path .. "fire-556-01.ogg", path .. "fire-556-02.ogg", path .. "fire-556-03.ogg", path .. "fire-556-04.ogg", path .. "fire-556-05.ogg", path .. "fire-556-06.ogg"}
local fire556sup = {path1 .. "fire-sup-01.ogg", path1 .. "fire-sup-02.ogg", path1 .. "fire-sup-03.ogg", path1 .. "fire-sup-04.ogg", path1 .. "fire-sup-05.ogg", path1 .. "fire-sup-06.ogg"}
local fire556dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire556sup
    else
        return fire556
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire556dist
    end
end

local slotinfo = {
    [4] = {"30-Round 5.56 Mag", "30-Round 5.56 Mag", Material("entities/att/uc_bullets/556x45.png", "smooth mips")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

local swap = {
    ["uc_sks/mag_out_30.wav"] = "uc_sks/mag_out_bakelite.wav",
    ["uc_sks/mag_in_30.wav"] = "uc_sks/mag_in_bakelite.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    if !isstring(fsound) then return end
    return swap[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_sks_cal_556")
end
-- END BUNDLED ATTACHMENT: uc_sks_cal_556.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_cal_9mm.lua
do
    local att = {}

att.PrintName = "SKS 9x19mm Conversion"
att.AbbrevName = "9x19mm Conversion"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 9x19mm Conversion"
end

att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "A blowback kit built around a Vityaz magwell, which turns a battle rifle into a very large carbine. The ammunition costs a fraction of what the rifle rounds do and the gun hardly moves when it fires. Past forty metres or so you will notice why it was cheap."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_sks_cal"
att.SortOrder = 7

att.AutoStats = true

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_Damage = 0.40
att.Mult_DamageMin = 0.46
att.Mult_Penetration = 0.40

att.Mult_Range = 0.60
att.Mult_Recoil = 0.35
att.Mult_VisualRecoilMult = 0.40
att.Mult_RPM = 1.40

att.Mult_HipDispersion = 0.60
att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 0.90
att.Mult_ShootSpeedMult = 1.20

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_Trivia_Class = "Carbine"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_PhysBulletMuzzleVelocity = 400

att.ActivateElements = {"conv_9mm"}
att.GivesFlags = {"conv_9mm"}

att.Hook_SelectReloadAnimation_Priority = 2
att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_30"
end

local path = ")weapons/arccw_ur/mp5/"
local tail = ")/arccw_uc/common/9x19/"
local common = ")/arccw_uc/common/"

local fire9mm = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg"}
local fire9mmsup = {path .. "fire-sup-01.ogg", path .. "fire-sup-02.ogg", path .. "fire-sup-03.ogg", path .. "fire-sup-04.ogg", path .. "fire-sup-05.ogg", path .. "fire-sup-06.ogg"}
local fire9mmdist = {tail .. "fire-dist-9x19-smg-ext-01.ogg", tail .. "fire-dist-9x19-smg-ext-02.ogg", tail .. "fire-dist-9x19-smg-ext-03.ogg", tail .. "fire-dist-9x19-smg-ext-04.ogg", tail .. "fire-dist-9x19-smg-ext-05.ogg", tail .. "fire-dist-9x19-smg-ext-06.ogg"}
local fire9mmdistint = {common .. "fire-dist-int-pistol-01.ogg", common .. "fire-dist-int-pistol-02.ogg", common .. "fire-dist-int-pistol-03.ogg", common .. "fire-dist-int-pistol-04.ogg", common .. "fire-dist-int-pistol-05.ogg", common .. "fire-dist-int-pistol-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire9mmsup
    else
        return fire9mm
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire9mmdist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire9mmdistint
    end
end

local slotinfo = {
    [4] = {"30-Round 9mm Mag", "30-Round 9mm Mag", Material("entities/att/uc_bullets/9x19.png", "smooth mips")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

local swap = {
    ["uc_sks/mag_out_30.wav"] = "uc_sks/mag_out_9mm.wav",
    ["uc_sks/mag_in_30.wav"] = "uc_sks/mag_in_9mm.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    if !isstring(fsound) then return end
    return swap[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_sks_cal_9mm")
end
-- END BUNDLED ATTACHMENT: uc_sks_cal_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_mag_30_poly.lua
do
    local att = {}

att.PrintName = "SKS 30 Round Polymer Magazine"
att.AbbrevName = "30 Round Polymer Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 30 Round Magazine"
end

att.Description = "30 Round SKS Magazine, Esentially identical to the one used by the AKM. Holds more rounds, but is heavier and longer than the standard 20 Round variant. This one is a Magpul model made out of polymer, reloads slightly faster and is lighter."
att.Slot = {"uc_sks_mag"}
att.AutoStats = true

att.SortOrder = 1
att.HideIfBlocked = true

att.Override_ClipSize = 30

att.ModelScale = Vector(0.854, 0.85, 0.85)

att.Mult_SightTime = 1.05
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05

att.Mult_HipDispersion = 1.05

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_poly"
end

att.ActivateElements = {"mag_30_poly"}

    ArcCW.LoadAttachmentType(att, "uc_sks_mag_30_poly")
end
-- END BUNDLED ATTACHMENT: uc_sks_mag_30_poly.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_mag_30.lua
do
    local att = {}

att.PrintName = "SKS 30 Round Magazine"
att.AbbrevName = "30 Round Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 30 Round Magazine"
end

att.Description = "30 Round SKS Magazine, Esentially identical to the one used by the AKM. Holds more rounds, but is heavier and longer than the standard 20 Round variant."
att.Slot = {"uc_sks_mag"}
att.AutoStats = true

att.SortOrder = 1
att.HideIfBlocked = true

att.Override_ClipSize = 30
att.Mult_ReloadTime = 1.05

att.ModelScale = Vector(0.854, 0.85, 0.85)

att.Mult_SightTime = 1.05
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1
att.Mult_SightedSpeedMult = 1

att.Mult_HipDispersion = 1.05

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_30"
end

att.ActivateElements = {"sksmag_extended"}

    ArcCW.LoadAttachmentType(att, "uc_sks_mag_30")
end
-- END BUNDLED ATTACHMENT: uc_sks_mag_30.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_mag_5.lua
do
    local att = {}

att.PrintName = "SKS 5 Round Magazine"
att.AbbrevName = "5 Round Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SKS 5 Round Magazine"
end

att.Description = "5 Round SKS Magazine, much lighter."
att.Slot = {"uc_sks_mag"}
att.AutoStats = true

att.SortOrder = 1
att.HideIfBlocked = true

att.Override_ClipSize = 5
att.Mult_ReloadTime = 0.85

att.ModelScale = Vector(0.854, 0.85, 0.85)

att.Mult_SightTime = 1.05
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1.10
att.Mult_SightedSpeedMult = 1.10

att.Mult_HipDispersion = 1.05

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_5"
end

att.ActivateElements = {"mag_5"}

    ArcCW.LoadAttachmentType(att, "uc_sks_mag_5")
end
-- END BUNDLED ATTACHMENT: uc_sks_mag_5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_sks_stock_poly.lua
do
    local att = {}

att.PrintName = "Polymer Stock"

att.Icon = Material("", "smooth mips")
att.Description = "Full stock with a lighter polymer furniture."
att.AutoStats = true

att.Slot = "uc_sks_stock"

att.SortOrder = 15

att.Mult_Sway = 1.05
att.Mult_SightTime = 0.90

att.Mult_Recoil = 1.15

att.Mult_HipDispersion = 1.05

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05
att.Mult_DrawTime = 0.95
att.Mult_HolsterTime = 0.95

att.ActivateElements = {"stock_poly"}

    ArcCW.LoadAttachmentType(att, "uc_sks_stock_poly")
end
-- END BUNDLED ATTACHMENT: uc_sks_stock_poly.lua
