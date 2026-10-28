do
 local att = {}
att.PrintName = "AK-12 16\" Ratnik Barrel"
att.AbbrevName = "16\" Ratnik Barrel"
att.Icon = Material("entities/att/uc_ak12/barrel_415.png", "smooth mips")
att.Description = "The most recent barrel design for the AK platform. Also equips a new rear sight aperture."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {
    "uc.cosmetic",
    "ur.ak.userail"
}
att.Slot = "ur_ak_barrel"

att.SortOrder = 16

att.ActivateElements = {"barrel_ak12","sight_ak12"}
att.GivesFlags = {"ak_barrelchange"}
 
 ArcCW.LoadAttachmentType(att, "ur_ak_barrel_ak12")
end

do
 local att = {}
att.PrintName = "AK-12 5.45x39mm Receiver"
att.AbbrevName = "5.45x39mm AK-12 Receiver"
att.Icon = Material("entities/att/uc_ak12/ur_ak_cal_545_ak12.png", "mips smooth")
att.Description = [[The 2018 Ratnik rifle in 5.45x39mm, with a 415 mm barrel, a 30-round magazine and a two-round burst group.
Its 700 RPM action favours controllable intermediate-cartridge fire.]]
att.Desc_Pros = {
    "ur.ak.burst"
}
att.Slot = {"ur_ak_cal"}
att.AutoStats = true

att.SortOrder = 10

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.45x39mm"

att.Mult_Range = 440 / 300
att.Override_Trivia_Country = "Russia"
att.Override_Trivia_Manufacturer = "Kalashnikov Concern"
att.Override_Trivia_Year = 2018
att.Override_Trivia_Desc = att.Description
att.Mult_RPM = 700 / 600
att.Mult_PhysBulletMuzzleVelocity = 900 / 715
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .95
att.Mult_Recoil = .85
att.Mult_AccuracyMOA = .85
att.Mult_HipDispersion = .75

att.Mult_Penetration = .65
att.Mult_DamageMin = .8
att.Mult_Damage = .8
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
att.Override_ShellScale = 1
att.GivesFlags = {"cal_545"}

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -2
    },
    {
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

att.ActivateElements = {"ux_ak12_family_ur_ak_cal_545_ak12"}
att.GivesFlags = {"receiver_ak12","cal_545","ux_ak12_family"}
local path = ")^weapons/arccw_ur/ak/545_39/"
local path1 = ")^weapons/arccw_ur/ak/"

att.Hook_GetShootSound = function(wep, fsound)
    


    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"} end
    if fsound == wep.ShootSoundSilenced then return path1 .. "fire_545_sup.ogg" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then return {path .. "fire-dist-01.ogg", path .. "fire-dist-02.ogg", path .. "fire-dist-03.ogg", path .. "fire-dist-04.ogg", path .. "fire-dist-05.ogg", path .. "fire-dist-06.ogg"} end
end

local slotinfo = {
    [6] = {"30-Round Bakelite Mag", "30-Round Bakelite Mag", Material("entities/att/ur_restored/ur_ak/magazines/545_30_b.png", "mips smooth")},
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
 ArcCW.LoadAttachmentType(att, "ur_ak_cal_545_ak12")
end

do
 local att = {}
att.PrintName = "AK-12 Dust Cover"
att.Icon = Material("entities/att/ur_restored/ur_ak/dustcover_ak12.png", "mips smooth")
att.Description = "Russian military issue dust cover with an upper picattiny rail."
att.Slot = {"ur_ak_cover"}
att.AutoStats = true

att.Desc_Neutrals = {
    "uc.cosmetic",
    "ur.ak.alpha"
}

att.ActivateElements = {"cover_ak12", "sight_ak12"}
att.GivesFlags = {"cover_rail", "ux_ak12_cover"}
att.ExcludeFlags = {"ak_barrelkrinkov","ak_norail"}
 ArcCW.LoadAttachmentType(att, "ur_ak_cover_ak12")
end

do
 local att = {}
att.PrintName = "Grooved Polymer Grip"
att.Icon = Material("entities/att/ur_restored/ur_ak/grip_ak12.png", "mips smooth")
att.Description = "Black polymer grip with an emphasis on ergonomics. Helps mitigate vertical kick, but can slide around more."
att.AutoStats = true
att.Slot = {"ur_ak_grip"}


att.Mult_Recoil = .9
att.Mult_RecoilSide = 1.15

att.ActivateElements = {"grip_ak12"}
 
 ArcCW.LoadAttachmentType(att, "ur_ak_grip_ak12")
end

do
 local att = {}
att.PrintName = "Ratnik Handguard"
att.Icon = Material("entities/att/ur_restored/ur_ak/handguards/ak12.png", "mips smooth")
att.Description = "The most recent handguard module for the AK platform, with polymerized construction and an upper rail interface. Practical, yet comfortable."
att.Slot = {"ur_ak_hg"}
att.AutoStats = true

att.SortOrder = 16

att.Mult_Sway = .9
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 1.1

att.GivesFlags = {"ak_railedguard","nodong"}
att.ActivateElements = {"handguard_ak12", "sight_ak12"}
 ArcCW.LoadAttachmentType(att, "ur_ak_hg_ak12")
end

do
 local att = {}
att.PrintName = "AK-12 30-Round Polymer Mag"
att.AbbrevName = "30-Round Polymer Mag"
att.Icon = Material("entities/att/ur_restored/ur_ak/magazines/545_30_ak12.png", "mips smooth")
att.Description = "Contemporary polymer magazine. The grooves give it a slightly better grip surface, but the difference in practice is negligible."
att.Slot = {"ur_ak_mag"}
att.AutoStats = true
att.Desc_Neutrals = {
    "uc.cosmetic",
}

att.SortOrder = 98

att.HideIfBlocked = true




att.ActivateElements = {"mag_545_ak12"}
att.RequireFlags = {"cal_545"}
 ArcCW.LoadAttachmentType(att, "ur_ak_mag_545_ak12")
end

do
 local att = {}
att.PrintName = "AK-12 Stock"
att.Icon = Material("entities/att/uc_ak12/stock_original.png", "mips smooth")
att.Description = "Retractable folding stock. Its ergonomic design is comfortable to use on the move."
att.Slot = {"ur_ak_stock"}
att.AutoStats = true

att.SortOrder = 2

att.Mult_SightedSpeedMult = 1.1
att.Mult_MoveDispersion = .8
att.Mult_RecoilSide = 1.35
att.Mult_Sway = 1.25
att.Add_BarrelLength = -4

att.ActivateElements = {"stock_ak12"}
 ArcCW.LoadAttachmentType(att, "ur_ak_stock_ak12")
end

do
 local att = {}
 att.PrintName = '22.5" SPAS-12 Vintage Competition Kit'
 att.AbbrevName = '22.5" Vintage Competition Kit'
 att.Icon = Material("entities/att/ur_restored/ur_spas/barrel_comp.png", "smooth mips")
 att.Description = "A heavy sporting forend, extended barrel and tuned trigger group. The ported muzzle keeps follow-up shots flat and the long barrel tightens the pattern. Its deliberate pump stroke is slower than a lighter competition kit, and the extra steel takes longer to bring on target."
 att.Slot = "ur_spas12_barrel"
 att.SortOrder = 22.6
 att.AutoStats = true
 att.Override_Firemodes = {{Mode = 1, PrintName = "fcg.pump", Override_ManualAction = true}}
 att.Override_Firemodes_Priority = 20
 att.Override_IronSightStruct = {Pos = Vector(-3.75, -4, 1.2), Ang = Angle(0.345, 0.03, 1.5), Magnification = 1.05, SwitchToSound = ""}
 att.Hook_GetDefaultAttName = function(wep, slot)
  if slot == 7 then return "Vintage Competition Stock" end
 end
 att.Hook_GetDefaultAttIcon = function(wep, slot)
  if slot == 7 then return Material("entities/att/ur_restored/ur_spas/stock_std.png", "smooth mips") end
 end
 att.Mult_Recoil = 0.62
 att.Mult_RecoilSide = 0.7
 att.Mult_AccuracyMOA = 0.7
 att.Mult_RangeMin = 1.65
 att.Mult_CycleTime = 1.18
 att.Mult_SightTime = 1.15
 att.Mult_Sway = 1.25
 att.Mult_SpeedMult = 0.97
 att.Add_BarrelLength = 1
 att.ActivateElements = {"ux_spas_vintage_kit"}
 att.GivesFlags = {"nomuzzle", "ux_spas_vintage_comp"}
 att.Desc_Cons = {"uc.nomuzzle", "ur.spas12.pump"}
 ArcCW.LoadAttachmentType(att, "ux_ur_spas12_barrel_vintage_comp")
end

do
 local att = {}
 att.PrintName = "SPAS-12 Vintage Competition Grip"
 att.AbbrevName = "Vintage Competition Grip"
 att.Icon = Material("entities/att/ur_restored/ur_spas/grip_sport.png", "smooth mips")
 att.Description = "A sculpted target grip for the vintage sporting frame. It steadies the weapon during a deliberate pump stroke, but its pronounced palm shelf is cumbersome when changing aim."
 att.Slot = "ur_spas12_grip"
 att.AutoStats = true
 att.RequireFlags = {"ux_spas_vintage_comp"}
 att.HideIfBlocked = true
 att.Mult_CycleTime = 0.94
 att.Mult_RecoilSide = 0.8
 att.Mult_Sway = 0.85
 att.Mult_SightTime = 1.1
 ArcCW.LoadAttachmentType(att, "ux_ur_spas12_grip_vintage_comp")
end

do
 local att = {}
 att.PrintName = "SPAS-12 Folded Vintage Competition Stock"
 att.AbbrevName = "Folded Vintage Stock"
 att.Icon = Material("entities/att/ur_restored/ur_spas/stock_comp_fold.png", "smooth mips")
 att.Description = "A steel sporting stock folded forward for quicker handling in confined spaces. It sacrifices shoulder support and recoil control, while the cheek support retains the kit's aimed sight picture."
 att.Slot = "ur_spas12_stock"
 att.AutoStats = true
 att.Free = true
 att.IgnorePickX = true
 att.RequireFlags = {"ux_spas_vintage_comp"}
 att.HideIfBlocked = true
 att.ActivateElements = {"ux_spas_vintage_stock"}
 att.Mult_SightTime = 0.7
 att.Mult_SightedSpeedMult = 1.15
 att.Mult_Recoil = 1.15
 att.Mult_RecoilSide = 1.25
 att.Mult_Sway = 1.5
 att.Add_BarrelLength = -10
 att.GivesFlags = {"spas12_foldstock"}
 ArcCW.LoadAttachmentType(att, "ux_ur_spas12_stock_vintage_comp")
end
