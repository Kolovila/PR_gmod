-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_m200_barrel_long.lua
do
    local att = {}

att.PrintName = "Extended Barrel"
att.AbbrevName = "Long Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "A heavy match barrel considerably longer than the one the rifle left the factory with. It gives the powder somewhere to finish burning and the bullet somewhere to settle, and it makes the whole thing a chore to bring onto anything that moves. The profile is too thick at the muzzle for anything to thread onto."
att.AutoStats = true

att.Slot = "uc_m200_barrel"
att.SortOrder = 5

att.Add_BarrelLength = 12

att.Mult_Range = 1.18
att.Mult_PhysBulletMuzzleVelocity = 1.12
att.Mult_MuzzleVelocity = 1.12

att.Mult_AccuracyMOA = 0.75
att.Mult_Recoil = 0.9
att.Mult_HipDispersion = 1.2

att.Mult_SpeedMult = 0.92
att.Mult_SightedSpeedMult = 0.9
att.Mult_DrawTime = 1.15
att.Mult_SightTime = 1.14
att.Mult_Sway = 1.22

att.Mult_ShootPitch = 0.94

att.ActivateElements = {"barrel_long"}
att.GivesFlags = {"m200_barrel_long"}

    ArcCW.LoadAttachmentType(att, "uc_m200_barrel_long")
end
-- END BUNDLED ATTACHMENT: uc_m200_barrel_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_barrel_obrez.lua
do
    local att = {}

att.PrintName = "Obrez Conversion"
att.AbbrevName = "Obrez"

att.Icon = Material("", "smooth mips")
att.Description = "Somebody took a saw to a two thousand metre rifle and stopped just past the chamber. What is left is a bolt action handgun in a cartridge that needs thirty inches of barrel to do anything useful, and it does none of it, very loudly."
att.AutoStats = true

att.Slot = "uc_m200_barrel"
att.SortOrder = 20

att.Add_BarrelLength = -20

att.Mult_Range = 0.44
att.Mult_PhysBulletMuzzleVelocity = 0.6
att.Mult_MuzzleVelocity = 0.6

att.Mult_Recoil = 1.75
att.Mult_RecoilSide = 2
att.Mult_AccuracyMOA = 7
att.Mult_HipDispersion = 1.5

att.Mult_SpeedMult = 1.16
att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.2
att.Mult_DrawTime = 0.72
att.Mult_SightTime = 0.7
att.Mult_Sway = 1.35

att.Mult_ShootPitch = 1.12
att.Mult_ShootVol = 1.1

att.ActivateElements = {"barrel_obrez"}
att.GivesFlags = {"m200_barrel_obrez"}

    ArcCW.LoadAttachmentType(att, "uc_m200_barrel_obrez")
end
-- END BUNDLED ATTACHMENT: uc_m200_barrel_obrez.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_barrel_sd.lua
do
    local att = {}

att.PrintName = "Integrally Suppressed Barrel"
att.AbbrevName = "SD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "A barrel with the expansion chamber built around it rather than threaded onto the end. Nothing to fit and nothing to work loose, at the cost of never being able to take it off. Subsonic loads leave it with nothing for anyone to hear at distance; full power ones still crack downrange no matter what the muzzle does."
att.AutoStats = true

att.Slot = "uc_m200_barrel"
att.SortOrder = 6

att.Silencer = true
att.SDBarrel = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"

att.Mult_ShootVol = 0.45

att.Mult_Range = 0.94
att.Mult_PhysBulletMuzzleVelocity = 0.95
att.Mult_MuzzleVelocity = 0.95

att.Mult_Recoil = 0.88
att.Mult_AccuracyMOA = 0.95
att.Mult_RPM = 0.95

att.Mult_SpeedMult = 0.96
att.Mult_SightedSpeedMult = 0.95
att.Mult_SightTime = 1.12
att.Mult_Sway = 1.08

att.ActivateElements = {"barrel_sd"}
att.GivesFlags = {"m200_barrel_sd"}

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_m200_barrel_sd")
end
-- END BUNDLED ATTACHMENT: uc_m200_barrel_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_barrel_short.lua
do
    local att = {}

att.PrintName = "Shortened Barrel"
att.AbbrevName = "Short Barrel"

att.Icon = Material("entities/warface_cheytac_m200_short_barrel.png", "smooth mips")
att.Description = "The barrel cut back to the length the action can still be carried at. It gives up the reach the cartridge was designed around, which on this rifle is most of the reason to own it, in exchange for something that fits through a doorway."
att.AutoStats = true

att.Slot = "uc_m200_barrel"
att.SortOrder = 10

att.Add_BarrelLength = -6

att.Mult_Range = 0.82
att.Mult_PhysBulletMuzzleVelocity = 0.88
att.Mult_MuzzleVelocity = 0.88

att.Mult_Recoil = 1.22
att.Mult_AccuracyMOA = 1.6
att.Mult_HipDispersion = 0.9

att.Mult_SpeedMult = 1.07
att.Mult_SightedSpeedMult = 1.08
att.Mult_ShootSpeedMult = 1.08
att.Mult_DrawTime = 0.9
att.Mult_SightTime = 0.88
att.Mult_Sway = 0.86

att.Mult_ShootPitch = 1.08

att.ActivateElements = {"barrel_short"}
att.GivesFlags = {"m200_barrel_short"}

    ArcCW.LoadAttachmentType(att, "uc_m200_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_m200_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_cal_12g.lua
do
    local att = {}

att.PrintName = "Elongated 12 Gauge Conversion"
att.AbbrevName = "12 Gauge"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Elongated 12 Gauge Conversion"
end

att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "The chamber opened out to take a shotshell as long as the case it replaces. Everything the rifle was built for stops applying immediately: no range, no precision, and a pattern that arrives all at once at the end of a corridor."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_m200_cal"
att.SortOrder = 5

att.AutoStats = true

att.Override_Num = 8

att.Override_Damage = 22
att.Override_DamageMin = 12
att.Override_Penetration = 3

att.Override_Range = 90
att.Override_RangeMin = 12

att.Mult_Recoil = 1.3
att.Mult_VisualRecoilMult = 1.2
att.Mult_AccuracyMOA = 6
att.Mult_HipDispersion = 0.55

att.Override_Ammo = "buckshot"
att.Override_Trivia_Calibre = "12 Gauge"
att.Override_PhysBulletMuzzleVelocity = 400

att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1
att.Override_ShootPitch = 92

att.ActivateElements = {"conv_12g"}
att.GivesFlags = {"m200_conv_12g"}

local sg = ")weapons/arccw_ud/870/"
local t12 = ")/arccw_uc/common/12ga/"

local fire = {sg .. "fire-01.ogg", sg .. "fire-02.ogg", sg .. "fire-03.ogg", sg .. "fire-04.ogg", sg .. "fire-05.ogg", sg .. "fire-06.ogg"}
local firesup = {t12 .. "fire-sup-01.ogg", t12 .. "fire-sup-02.ogg", t12 .. "fire-sup-03.ogg", t12 .. "fire-sup-04.ogg", t12 .. "fire-sup-05.ogg", t12 .. "fire-sup-06.ogg"}
local distext = {t12 .. "fire-dist-12ga-pasg-ext-01.ogg", t12 .. "fire-dist-12ga-pasg-ext-02.ogg", t12 .. "fire-dist-12ga-pasg-ext-03.ogg", t12 .. "fire-dist-12ga-pasg-ext-04.ogg", t12 .. "fire-dist-12ga-pasg-ext-05.ogg", t12 .. "fire-dist-12ga-pasg-ext-06.ogg"}
local distint = {t12 .. "fire-dist-12ga-pasg-int-01.ogg", t12 .. "fire-dist-12ga-pasg-int-02.ogg", t12 .. "fire-dist-12ga-pasg-int-03.ogg", t12 .. "fire-dist-12ga-pasg-int-04.ogg", t12 .. "fire-dist-12ga-pasg-int-05.ogg", t12 .. "fire-dist-12ga-pasg-int-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return firesup
    else
        return fire
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distext
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distint
end

    ArcCW.LoadAttachmentType(att, "uc_m200_cal_12g")
end
-- END BUNDLED ATTACHMENT: uc_m200_cal_12g.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_cal_338.lua
do
    local att = {}

att.PrintName = "M200 .338 Lapua Conversion"
att.AbbrevName = ".338 Lapua Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M200 .338 Lapua Conversion"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "A barrel and bolt face for the round everybody else already owns. It gives up reach against the cartridge the rifle was designed around, and in exchange you can resupply from anyone with a long gun instead of from one company in Idaho."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_m200_cal"
att.SortOrder = 6

att.AutoStats = true

att.Override_ClipSize = 8
att.Override_ClipSize_Priority = 3

att.Override_Damage = ArcCW.UC.StdDmg["338"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["338"].min
att.Override_Penetration = ArcCW.UC.StdDmg["338"].pen

att.Mult_Range = 0.94
att.Mult_Recoil = 0.82
att.Mult_RecoilSide = 0.8
att.Mult_VisualRecoilMult = 0.85
att.Mult_AccuracyMOA = 0.95
att.Mult_ReloadTime = 0.96

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".338 Lapua Magnum"
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["338"].vel

att.Mult_ShootPitch = 1.02
att.Mult_ShootVol = 0.93

att.ActivateElements = {"conv_338"}
att.GivesFlags = {"m200_conv_338"}

local aw = ")weapons/arccw_ur/aw_placeholders/338/"
local t338 = ")/arccw_uc/common/338lm/"

local fire = {aw .. "fire-01.ogg", aw .. "fire-02.ogg", aw .. "fire-03.ogg", aw .. "fire-04.ogg", aw .. "fire-05.ogg", aw .. "fire-06.ogg"}
local firesup = {aw .. "fire-sup-01.ogg", aw .. "fire-sup-02.ogg", aw .. "fire-sup-03.ogg", aw .. "fire-sup-04.ogg", aw .. "fire-sup-05.ogg", aw .. "fire-sup-06.ogg"}

local distext = {t338 .. "fire-dist-338lm-rif-ext-01.ogg", t338 .. "fire-dist-338lm-rif-ext-02.ogg", t338 .. "fire-dist-338lm-rif-ext-03.ogg", t338 .. "fire-dist-338lm-rif-ext-04.ogg", t338 .. "fire-dist-338lm-rif-ext-05.ogg", t338 .. "fire-dist-338lm-rif-ext-06.ogg"}
local distint = {t338 .. "fire-dist-338lm-rif-int-01.ogg", t338 .. "fire-dist-338lm-rif-int-02.ogg", t338 .. "fire-dist-338lm-rif-int-03.ogg", t338 .. "fire-dist-338lm-rif-int-04.ogg", t338 .. "fire-dist-338lm-rif-int-05.ogg", t338 .. "fire-dist-338lm-rif-int-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return firesup
    else
        return fire
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distext
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distint
end

    ArcCW.LoadAttachmentType(att, "uc_m200_cal_338")
end
-- END BUNDLED ATTACHMENT: uc_m200_cal_338.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_cal_375.lua
do
    local att = {}

att.PrintName = "M200 .375 CheyTac Conversion"
att.AbbrevName = ".375 CheyTac"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M200 .375 CheyTac Conversion"
end

att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips")
att.Description = "The cartridge the rifle was necked down to when somebody worked out that a lighter bullet leaving faster fights the wind better than a heavy one leaving slowly. Flatter, quicker and easier to hold, and it arrives with noticeably less to say."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_m200_cal"
att.SortOrder = 5

att.AutoStats = true

att.Override_Damage = 82
att.Override_DamageMin = 150
att.Override_Penetration = 34

att.Mult_Range = 1.1
att.Mult_Recoil = 0.88
att.Mult_RecoilSide = 0.85
att.Mult_VisualRecoilMult = 0.9
att.Mult_AccuracyMOA = 0.9
att.Mult_SightTime = 0.96

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".375 CheyTac"
att.Override_PhysBulletMuzzleVelocity = 985

att.Mult_ShootPitch = 1.06
att.Mult_ShootVol = 0.96

att.ActivateElements = {"conv_375"}
att.GivesFlags = {"m200_conv_375"}

local aw = ")weapons/arccw_ur/aw_placeholders/338/"
local t338 = ")/arccw_uc/common/338lm/"
local t50 = ")/arccw_uc/common/50bmg/"

local fire = {aw .. "fire-300-01.ogg", aw .. "fire-300-02.ogg", aw .. "fire-300-03.ogg", aw .. "fire-300-04.ogg", aw .. "fire-300-05.ogg", aw .. "fire-300-06.ogg"}
local firesup = {aw .. "fire-300-sup-01.ogg", aw .. "fire-300-sup-02.ogg", aw .. "fire-300-sup-03.ogg", aw .. "fire-300-sup-04.ogg", aw .. "fire-300-sup-05.ogg", aw .. "fire-300-sup-06.ogg"}

local distext = {t338 .. "fire-dist-338lm-rif-ext-01.ogg", t338 .. "fire-dist-338lm-rif-ext-02.ogg", t338 .. "fire-dist-338lm-rif-ext-03.ogg", t338 .. "fire-dist-338lm-rif-ext-04.ogg", t50 .. "fire-dist-50bmg-rif-ext-01.ogg", t50 .. "fire-dist-50bmg-rif-ext-02.ogg"}
local distint = {t338 .. "fire-dist-338lm-rif-int-01.ogg", t338 .. "fire-dist-338lm-rif-int-02.ogg", t338 .. "fire-dist-338lm-rif-int-03.ogg", t338 .. "fire-dist-338lm-rif-int-04.ogg", t338 .. "fire-dist-338lm-rif-int-05.ogg", t338 .. "fire-dist-338lm-rif-int-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return firesup
    else
        return fire
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distext
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return distint
end

    ArcCW.LoadAttachmentType(att, "uc_m200_cal_375")
end
-- END BUNDLED ATTACHMENT: uc_m200_cal_375.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_handle_light.lua
do
    local att = {}

att.PrintName = "Lightweight Handle"
att.AbbrevName = "Light Handle"

att.Icon = Material("", "smooth mips")
att.Description = "An oversized carbine carry handle turned upside down and bolted under the barrel. It was never meant to take the weight of this rifle and it is noticeably easier to carry than the one it replaced."
att.AutoStats = true

att.Slot = "uc_m200_handle"
att.SortOrder = 5

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.04
att.Mult_DrawTime = 0.93
att.Mult_SightTime = 0.94
att.Mult_Sway = 0.94

att.Mult_Recoil = 1.08
att.Mult_RecoilSide = 1.1

att.ActivateElements = {"handle_light"}
att.GivesFlags = {"m200_handle_light"}

    ArcCW.LoadAttachmentType(att, "uc_m200_handle_light")
end
-- END BUNDLED ATTACHMENT: uc_m200_handle_light.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_handle_tac.lua
do
    local att = {}

att.PrintName = "Tactical Handle"
att.AbbrevName = "Tac Handle"

att.Icon = Material("", "smooth mips")
att.Description = "A shotgun carry handle repurposed as an underside grip. Heavier than the issued one and far easier to actually hold on to, which matters more than it should on a rifle that recoils like this one."
att.AutoStats = true

att.Slot = "uc_m200_handle"
att.SortOrder = 6

att.Mult_Recoil = 0.9
att.Mult_RecoilSide = 0.88
att.Mult_AccuracyMOA = 0.95
att.Mult_HipDispersion = 0.9

att.Mult_SpeedMult = 0.97
att.Mult_SightedSpeedMult = 0.97
att.Mult_DrawTime = 1.05
att.Mult_Sway = 1.04

att.ActivateElements = {"handle_tac"}
att.GivesFlags = {"m200_handle_tac"}

    ArcCW.LoadAttachmentType(att, "uc_m200_handle_tac")
end
-- END BUNDLED ATTACHMENT: uc_m200_handle_tac.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_mag_10.lua
do
    local att = {}

att.PrintName = "Ten-Round Magazine"
att.AbbrevName = "10-Round Mag"

att.Icon = Material("", "smooth mips")
att.Description = "A deep box holding ten of a cartridge that was never meant to be carried ten at a time. It hangs well below the rifle and weighs what you would expect it to."
att.AutoStats = true

att.Slot = "uc_m200_mag"
att.SortOrder = 6

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 2

att.Mult_ReloadTime = 1.16
att.Mult_SpeedMult = 0.97
att.Mult_Sway = 1.08

att.ActivateElements = {"mag_10"}
att.GivesFlags = {"m200_mag_10"}

    ArcCW.LoadAttachmentType(att, "uc_m200_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_m200_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_mag_5.lua
do
    local att = {}

att.PrintName = "Five-Round Magazine"
att.AbbrevName = "5-Round Mag"

att.Icon = Material("", "smooth mips")
att.Description = "A shorter box that sits closer to the belly of the rifle. Two rounds fewer, and nothing hanging down to foul a prone position or catch on the lip of cover."
att.AutoStats = true

att.Slot = "uc_m200_mag"
att.SortOrder = 5

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 2

att.Mult_ReloadTime = 0.92
att.Mult_SpeedMult = 1.02
att.Mult_Sway = 0.96
att.Mult_HipDispersion = 0.96

att.ActivateElements = {"mag_5"}
att.GivesFlags = {"m200_mag_5"}

    ArcCW.LoadAttachmentType(att, "uc_m200_mag_5")
end
-- END BUNDLED ATTACHMENT: uc_m200_mag_5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_rail.lua
do
    local att = {}

att.PrintName = "Accessory Rail"
att.AbbrevName = "Rail"

att.Icon = Material("entities/warface_cheytac_m200_railed.png", "smooth mips")
att.Description = "The integral bipod comes off and a length of rail goes on in its place. Whatever you bolt to it has to earn back the bipod you gave up for it, which on a rifle this heavy is a great deal to ask."
att.AutoStats = true

att.Slot = "uc_m200_mount"
att.SortOrder = 10

att.Mult_Sway = 0.94
att.Mult_SightTime = 0.96
att.Mult_SpeedMult = 1.02

att.ActivateElements = {"m200_rail"}
att.GivesFlags = {"m200_rail"}

att.ExcludeFlags = {"m200_barrel_obrez"}

    ArcCW.LoadAttachmentType(att, "uc_m200_rail")
end
-- END BUNDLED ATTACHMENT: uc_m200_rail.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_skin_black.lua
do
    local att = {}

att.PrintName = "Tactical Black Finish"
att.AbbrevName = "Tactical Black"

att.Icon = Material("entities/warface_cheytac_m200_tactical_black_skin.png", "smooth mips")
att.Description = "Flat black over every surface that came anodised. Marginally less reflective than the factory finish and considerably more serious looking."

att.Slot = "uc_m200_skin"
att.SortOrder = 3

att.AutoStats = true
att.HideIfBlocked = true

att.ActivateElements = {"m200_skin_black"}
att.GivesFlags = {"m200_skin_black"}

    ArcCW.LoadAttachmentType(att, "uc_m200_skin_black")
end
-- END BUNDLED ATTACHMENT: uc_m200_skin_black.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_stock_collapsed.lua
do
    local att = {}

att.PrintName = "Collapsed Stock"
att.AbbrevName = "Collapsed"

att.Icon = Material("", "smooth mips")
att.Description = "The stock run all the way in. Shorter to carry and quicker into the shoulder, with rather less of it actually against the shoulder once it gets there."
att.AutoStats = true

att.Slot = "uc_m200_stock"
att.SortOrder = 5

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.06
att.Mult_DrawTime = 0.92
att.Mult_SightTime = 0.92
att.Mult_Sway = 0.96

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.25

att.ActivateElements = {"stock_collapsed"}
att.GivesFlags = {"m200_stock_collapsed"}

    ArcCW.LoadAttachmentType(att, "uc_m200_stock_collapsed")
end
-- END BUNDLED ATTACHMENT: uc_m200_stock_collapsed.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_stock_m16.lua
do
    local att = {}

att.PrintName = "Carbine Stock"
att.AbbrevName = "Carbine"

att.Icon = Material("", "smooth mips")
att.Description = "A carbine buffer stock adapted onto the back of the action by somebody who had one spare. It is lighter than anything else that fits and it puts the shooter's cheek nowhere near where the optic expects it."
att.AutoStats = true

att.Slot = "uc_m200_stock"
att.SortOrder = 8

att.Mult_SpeedMult = 1.08
att.Mult_SightedSpeedMult = 1.07
att.Mult_DrawTime = 0.88
att.Mult_SightTime = 0.86
att.Mult_Sway = 1.05

att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.2
att.Mult_AccuracyMOA = 1.15

att.ActivateElements = {"stock_m16"}
att.GivesFlags = {"m200_stock_m16"}

    ArcCW.LoadAttachmentType(att, "uc_m200_stock_m16")
end
-- END BUNDLED ATTACHMENT: uc_m200_stock_m16.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_stock_none.lua
do
    local att = {}

att.PrintName = "Stock Removed"
att.AbbrevName = "No Stock"

att.Icon = Material("", "smooth mips")
att.Description = "The stock taken off at the buffer and not replaced. There is nothing behind the action now but the shooter, which is a poor arrangement for a cartridge this size and an excellent one for fitting the rifle into a bag."
att.AutoStats = true

att.Slot = "uc_m200_stock"
att.SortOrder = 7

att.Mult_SpeedMult = 1.12
att.Mult_SightedSpeedMult = 1.14
att.Mult_DrawTime = 0.8
att.Mult_SightTime = 0.78
att.Mult_Sway = 1.3

att.Mult_Recoil = 1.7
att.Mult_RecoilSide = 1.9
att.Mult_AccuracyMOA = 1.5

att.ActivateElements = {"stock_none"}
att.GivesFlags = {"m200_stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_m200_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_m200_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m200_stock_wood.lua
do
    local att = {}

att.PrintName = "Timber Stock"
att.AbbrevName = "Timber"

att.Icon = Material("", "smooth mips")
att.Description = "A one piece wooden stock cut for this action by somebody who did not care for the folding one. Heavier and entirely rigid, which the rifle appreciates and the person carrying it does not."
att.AutoStats = true

att.Slot = "uc_m200_stock"
att.SortOrder = 6

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.82
att.Mult_AccuracyMOA = 0.9
att.Mult_Sway = 0.88

att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.94
att.Mult_DrawTime = 1.1
att.Mult_SightTime = 1.08

att.ActivateElements = {"stock_wood"}
att.GivesFlags = {"m200_stock_wood"}

    ArcCW.LoadAttachmentType(att, "uc_m200_stock_wood")
end
-- END BUNDLED ATTACHMENT: uc_m200_stock_wood.lua
