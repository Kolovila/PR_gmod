-- Call ArcCW.LoadAttachmentType(att, "attachment_name") to define attachments in bulk
-- This reduces loading times by reducing the amount of lua files needed.



-- Magazines/Caliber Conversions ---------------------------------------------------------
local att = {}

att.PrintName = "IMBEL-A2 30-Round STANAG Mag"
att.AbbrevName = "30-Round 5.56 Mag"

att.Icon = Material("entities/att/ue_fal/r_556.png", "smooth mips")
att.Description = "The South Division did not need such stopping power of a full blown cartridge, instead opted for a more conventional magazine in an intermediate calibre."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_fal_mag"
att.SortOrder = 30 + 56

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Trivia_Class = "Assault Rifle"

att.Mult_RPM = 700/650
att.Mult_SightedSpeedMult = 1.05
att.Mult_Recoil = 0.45
att.Mult_HipDispersion = .75

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 20 / 35
att.Mult_Damage = 34 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.GivesFlags = {"cal_556"}
att.Override_ShotgunReload = false
att.Override_HybridReload = false

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 30

att.ActivateElements = {"conv_556"}
local tail556 = ")/arccw_uc/common/556x45/"
local fire556dist = {tail556 .. "fire-dist-556x45-rif-ext-01.ogg", tail556 .. "fire-dist-556x45-rif-ext-02.ogg", tail556 .. "fire-dist-556x45-rif-ext-03.ogg", tail556 .. "fire-dist-556x45-rif-ext-04.ogg", tail556 .. "fire-dist-556x45-rif-ext-05.ogg", tail556 .. "fire-dist-556x45-rif-ext-06.ogg"}
local fire556distint = {tail556 .. "fire-dist-556x45-rif-int-01.ogg", tail556 .. "fire-dist-556x45-rif-int-02.ogg", tail556 .. "fire-dist-556x45-rif-int-03.ogg", tail556 .. "fire-dist-556x45-rif-int-04.ogg", tail556 .. "fire-dist-556x45-rif-int-05.ogg", tail556 .. "fire-dist-556x45-rif-int-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then
        return fire556supp
    else
        return fire556
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
        -- fallback to script
    else
        return fire556dist
    end
end
att.Hook_GetShootSound = function(wep, fsound)
	if wep:GetBuff_Override("Silencer") then
		return "myt_c1a1/shot_556_sd.ogg"
	else
		return "myt_c1a1/556-1.ogg" || "myt_c1a1/556-2.ogg" || "myt_c1a1/556-3.ogg" || "myt_c1a1/556-4.ogg" 
	end
end


att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_556"
end

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_556"
end

ArcCW.LoadAttachmentType(att, "uc_myt_fal_cal_556")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "AS FAL 30-Round 9x39mm Mag"
att.AbbrevName = "30-Round 9x39 Mag"

att.Icon = Material("entities/att/ue_fal/r_sd.png", "smooth mips")
att.Description = [[Alternative timeline when Northwest Territories is right dead in the middle of Siberia.
Unusual calibre prone to jamming, maybe.]]
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_fal_mag"
att.SortOrder = 30 - 939

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "9x39mm Soviet"
att.Override_Trivia_Class = "Carbine"

att.Mult_RPM = 800/650
att.Mult_SightedSpeedMult = 1.075
att.Mult_Recoil = 0.4
att.Mult_HipDispersion = .7

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.5
att.Mult_MalfunctionVariance = 1.5

att.Mult_Penetration = 7 / 20
att.Mult_DamageMin = 17 / 35
att.Mult_Damage = 29 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.GivesFlags = {"cal_val"}
att.Override_ShotgunReload = false
att.Override_HybridReload = false

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 30

att.ActivateElements = {"conv_val"}

local tail762 = ")/arccw_uc/common/762x39/"
local fire762dist = {tail762 .. "fire-dist-762x39-rif-ext-01.ogg", tail762 .. "fire-dist-762x39-rif-ext-02.ogg", tail762 .. "fire-dist-762x39-rif-ext-03.ogg", tail762 .. "fire-dist-762x39-rif-ext-04.ogg", tail762 .. "fire-dist-762x39-rif-ext-05.ogg", tail762 .. "fire-dist-762x39-rif-ext-06.ogg"}
local fire762distint = {tail762 .. "fire-dist-762x39-rif-int-01.ogg", tail762 .. "fire-dist-762x39-rif-int-02.ogg", tail762 .. "fire-dist-762x39-rif-int-03.ogg", tail762 .. "fire-dist-762x39-rif-int-04.ogg", tail762 .. "fire-dist-762x39-rif-int-05.ogg", tail762 .. "fire-dist-762x39-rif-int-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
        -- fallback to script
    else
        return fire762dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
        -- fallback to script
    else
        return fire762distint
    end
end

att.Hook_GetShootSound = function(wep, fsound)
	if wep:GetBuff_Override("Silencer") then
		return "myt_c1a1/shot_939_sd.ogg"
	else
		return "myt_c1a1/939-1.ogg" || "myt_c1a1/939-2.ogg" || "myt_c1a1/939-3.ogg"
	end
end


att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_sd"
end

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_sd"
end

ArcCW.LoadAttachmentType(att, "uc_myt_fal_cal_val")

---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "C2A1 10-Round Mag"
att.AbbrevName = "10-Round .308 Mag"

att.Icon = Material("entities/att/ue_fal/r_10.png", "smooth mips")
att.Description = [[Flush magazine makes use of that 10-round strip nicely.]]
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_fal_mag"
att.SortOrder = 10 + 308

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 10

att.ActivateElements = {"x_10"}

att.Hook_TranslateAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_empty_10"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_empty_10"
    end
end

ArcCW.LoadAttachmentType(att, "uc_myt_fal_cringe_30")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "C2A1 40-Round Mag"
att.AbbrevName = "40-Round .308 Mag"

att.Icon = Material("entities/att/ue_fal/r_40.png", "smooth mips")
att.Description = "Extended magazine for machine gunners."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_fal_mag"
att.SortOrder = 40 + 308

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 40

att.ActivateElements = {"x_40"}

att.Hook_TranslateAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_empty_40"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_empty_40"
    end
end


ArcCW.LoadAttachmentType(att, "uc_myt_fal_x_40")
---------------------------------------------------------------------------------------------------------------------
-- Stocks -----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "Folding Stock"
att.Icon = Material("entities/att/ue_fal/s_ske.png", "smooth mips")
att.Description = "Skeleton stock minimised the gun length."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Ignore = false
att.Slot = "uc_myt_fal_stock"

att.AutoStats = true
att.SortOrder = 4

att.Add_BarrelLength = -2
att.ActivateElements = {"stock_fold"}
att.Mult_HipDispersion = 0.75
att.Mult_MoveDispersion = 0.85
att.Mult_SightTime = 1.15
att.Mult_Recoil = 1.25
att.Mult_Sway = 1.5

ArcCW.LoadAttachmentType(att, "uc_myt_fal_stock_fold")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "Wooden Stock"
att.Icon = Material("entities/att/ue_fal/s_wood.png", "smooth mips")
att.Description = "A sturdy stock made from wood. Heavier than polymer even if it looks the same."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_stock"

att.AutoStats = true
att.SortOrder = 9

att.Mult_Recoil = 0.85
att.Mult_SightedSpeedMult = 0.9
att.Mult_SpeedMult = 0.975
att.Mult_Sway = 0.75

att.ActivateElements = {"stock_wood"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_stock_wood")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "PRS Stock"
att.Icon = Material("entities/att/ue_fal/s_pad.png", "smooth mips")
att.Description = "Heavy-duty cumbersome marksman stock made for marksman."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_stock"

att.AutoStats = true
att.SortOrder = 11

att.Mult_Recoil = 0.85
att.Mult_Sway = .6

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = 0.8

att.ActivateElements = {"stock_prs"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_stock_prs")

local att = {}
---------------------------------------------------------------------------------------------------------------------
-- Barrels ----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
att.PrintName = "Wood Handguard"
att.Icon = Material("entities/att/ue_fal/hg_wood1.png", "smooth mips")
att.Description = "Exactly the same thing but coated with a wooden furniture."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_hg"
//att.GivesFlags = {"fal_nomuz"}
att.AutoStats = true
att.SortOrder = 4.5

att.Mult_Sway = 0.8
att.Mult_RecoilSide = 0.85
att.Mult_Recoil = 0.9

att.Mult_SightedSpeedMult = 0.8
att.Mult_ShootSpeedMult = 0.9

att.Hook_SelectBashAnim = function(wep, anim)
    return anim .. "_bayo"
end

att.ActivateElements = {"hg_wood"}
ArcCW.LoadAttachmentType(att, "uc_myt_fal_hg_l")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "LMG Handguard"
att.Icon = Material("entities/att/ue_fal/hg_aus1.png", "smooth mips")
att.Description = "Extended barrel with removed handguard. Non fuctional bipod functions as handguard instead."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_hg"

att.AutoStats = true
att.SortOrder = 5

att.LHIK = true
att.LHIK_Priority = -20
att.Model = "models/weapons/arccw/c_uc_myt_fal.mdl"
att.ModelBodygroups = "17512324036000"
att.DroppedModel = "models/items/boxsrounds.mdl"
att.ModelOffset = (Vector(0.41, 0, -1.63) - Vector(9, -0.4, 1.5))
att.GivesFlags = {"fal_noub", "fal_lmg"}

att.Mult_SightedSpeedMult = 1.1
att.Mult_HipDispersion = 1.1

att.Mult_Sway = 0.7
att.Mult_Recoil = 0.8

att.ActivateElements = {"hg_aus"}
ArcCW.LoadAttachmentType(att, "uc_myt_fal_hg_aus")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "PARA Handguard"
att.Icon = Material("entities/att/ue_fal/hg_para1.png", "smooth mips")
att.Description = [[Full/Half Length optimised handguard for CQC.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_hg"

att.AutoStats = true
att.SortOrder = 4


att.LHIK = true
att.LHIK_Priority = -20
att.Model = "models/weapons/arccw/c_uc_myt_fal.mdl"
att.ModelBodygroups = "17512324036000"
att.DroppedModel = "models/items/boxsrounds.mdl"
att.ModelOffset = (Vector(0.41, 0, -1.63) - Vector(11, -0.2, 0.5))

att.Mult_Recoil = 1.05
att.Mult_SightedSpeedMult = 1.08
att.Mult_SightTime = 0.9

att.ActivateElements = {"hg_para"}
ArcCW.LoadAttachmentType(att, "uc_myt_fal_hg_para")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "Stalker Handguard"
att.Icon = Material("entities/att/ue_fal/hg_sd1.png", "smooth mips")
att.Description = [[AS FAL
As Fal.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_hg"
att.GivesFlags = {"fal_nomuz", "sd"}

att.AutoStats = true
att.SortOrder = 0

att.Mult_SightTime = 1.05

att.Mult_Range = 0.65
att.Mult_Recoil = 1.15
att.Mult_AccuracyMOA = 1.5
att.Mult_RPM = 0.95
att.Mult_HipDispersion = 0.75

att.Add_BarrelLength = -4
att.Mult_PhysBulletMuzzleVelocity = 0.78

att.Mult_ShootVol = 0.65
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5


att.ActivateElements = {"hg_sd"}
ArcCW.LoadAttachmentType(att, "uc_myt_fal_hg_sd")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "DSA Handguard"
att.Icon = Material("entities/att/ue_fal/hg_dsa1.png", "smooth mips")
att.Description = "Mordenised handguard with railling galore."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_hg"

att.AutoStats = true
att.SortOrder = 3

att.Mult_Sway = .8
att.Mult_SightTime = 1.1
att.Mult_Recoil = 0.9

att.ActivateElements = {"hg_dsa", "hg_short"}
ArcCW.LoadAttachmentType(att, "uc_myt_fal_hg_xs")


---------------------------------------------------------------------------------------------------------------------
-- Barrel -----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "C4 12\" Paratrooper Barrel"
att.Icon = Material("entities/att/ue_fal/b_s.png", "smooth mips")
att.Description = [[Reduced barrel length for corps-a-corps environment.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_b"

att.AutoStats = true
att.SortOrder = 12

att.Mult_Sway = .85
att.Mult_SightTime = .8
att.Add_BarrelLength = -3
att.Mult_SightedSpeedMult = 1.05

att.Mult_Recoil = 1.3
att.Mult_AccuracyMOA = 1.5
att.Mult_Range = .75
att.Mult_RPM = 625/600
att.Mult_ShootPitch = 105/100
att.ActivateElements = {"l_s"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_l_s")
---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = "C4 24\" Gunner Barrel"
att.Icon = Material("entities/att/ue_fal/b_l.png", "smooth mips")
att.Description = [[Light Machine Gun barrel for long range and suppressive usage.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_b"

att.AutoStats = true
att.SortOrder = 24

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.2
att.Mult_SpeedMult = .95
att.Mult_SightedSpeedMult = 0.8
att.Mult_Sway = 1.5

att.Mult_Recoil = .8
att.Mult_AccuracyMOA = .7
att.Mult_Range = 1.5
att.Mult_MalfunctionMean = 2
att.Mult_HipDispersion = 1.5

att.ActivateElements = {"l_l"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_l_l")





---------------------------------------------------------------------------------------------------------------------
local att = {}

att.PrintName = [[Alt Ironsights]]
att.Icon = Material("entities/att/ue_fal/iron_alt.png", "smooth mips")
att.Description = [[Extra shroud obstructs vision and nothing else.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_iron"

att.AutoStats = true
att.SortOrder = 54^54

att.ActivateElements = {"ironsalt"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_guh")


local att = {}

att.PrintName = [[Alt Reload]]
att.Icon = Material("entities/att/ue_fal/bullet.png", "smooth mips")
att.Description = [[Segmented dry reload. Reloads slower but be able to cancel mid reload]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_c"

att.AutoStats = true
att.SortOrder = 54^54
att.Override_HybridReload = false
att.ActivateElements = {"altr"}

ArcCW.LoadAttachmentType(att, "uc_myt_fal_guh2")