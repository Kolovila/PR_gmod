-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_body_pistol.lua
do
    local att = {}

att.PrintName = "Pistol Body"
att.AbbrevName = "Pistol Bodykit"

att.Icon = Material("", "smooth mips")
att.Description = "Compact body kit for the RPG-7, improving handling at the cost of recoil and accuracy. Cannot aim down sights."
att.AutoStats = true

att.Slot = "uc_rpg7_body"

att.SortOrder = 1

att.LHIK = true
att.LHIKHide = true

att.Add_BarrelLength = -6
att.Mult_Sway = 1.25
att.Mult_SightTime = 0.60

att.Mult_Recoil = 2.45
att.Mult_AccuracyMOA = 1.35

att.Mult_HipDispersion = 1.25

att.ActivateElements = {"body_pistol"}

att.Hook_ShouldNotSight = function(wep)
    return true
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_body_pistol")
end
-- END BUNDLED ATTACHMENT: uc_rpg_body_pistol.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_body_sawnoff.lua
do
    local att = {}

att.PrintName = "Sawn-Off Body"
att.AbbrevName = "Sawn-Off Bodykit"

att.Icon = Material("", "smooth mips")
att.Description = "Shortened body kit. Improves handling at the cost of accuracy and recoil."
att.AutoStats = true

att.Slot = "uc_rpg7_body"

att.SortOrder = 1

att.LHIK = true
att.LHIKHide = true

att.Add_BarrelLength = -4
att.Mult_Sway = 1.15
att.Mult_SightTime = 0.80

att.Mult_Recoil = 1.85
att.Mult_AccuracyMOA = 1.15

att.Mult_HipDispersion = 1.15

att.ActivateElements = {"body_sawnoff"}

    ArcCW.LoadAttachmentType(att, "uc_rpg_body_sawnoff")
end
-- END BUNDLED ATTACHMENT: uc_rpg_body_sawnoff.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_body_soldier.lua
do
    local att = {}

att.PrintName = "\"Mercenary Special\" Body"
att.AbbrevName = "\"Mercenary Special\" Bodykit"

att.Icon = Material("", "smooth mips")
att.Description = "Bodykit that offers special upgrades that mercenaries require for their rocket launcher setup. \n\n Aiming down sights is disabled so that you can be a real Mann!"
att.AutoStats = true

att.Slot = "uc_rpg7_body"

att.SortOrder = 1

att.ActivateElements = {"body_merc"}

att.Override_ClipSize = 4

att.Mult_ReloadTime = 1.10

att.Mult_PhysBulletMuzzleVelocity = 110

att.Mult_HipDispersion = 0.5
att.Mult_JumpDispersion = 0
att.Mult_MoveDispersion = 0

att.Override_ShootSpeedMult = 5
att.Override_ShootWhileSprint = true

att.NotForNPCs = true

att.Hook_ShouldNotSight = function(wep)
    return true
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_body_soldier")
end
-- END BUNDLED ATTACHMENT: uc_rpg_body_soldier.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_fg_front.lua
do
    local att = {}

att.PrintName = "Front"

att.Icon = Material("", "smooth mips")
att.Description = "Move the rear grip to the front. Not effective at all."
att.AutoStats = true

att.Slot = "uc_rpg_fg"

att.SortOrder = 15

att.LHIK = true

att.Model = "models/vergi_arccw/foregrip_lhik.mdl"

att.Mult_Sway = 0.90
att.Mult_SightTime = 0.90

att.Mult_Recoil = 1.30
att.Mult_AccuracyMOA = 1.10

att.Mult_HipDispersion = 1.10

att.ActivateElements = {"fg"}

    ArcCW.LoadAttachmentType(att, "uc_rpg_fg_front")
end
-- END BUNDLED ATTACHMENT: uc_rpg_fg_front.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_gas.lua
do
    local att = {}

att.PrintName = "Nerve Gas Warhead"
att.AbbrevName = "Gas Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "Warhead fitted with a bag containing noxious gas. Blast damage is little to none but leaves a lingering cloud of damage."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_gas"

att.ActivateElements = {"cal_gas", "cal_none"}

att.Mult_VisualRecoil = 0.75
att.Mult_Recoil = 0.75
att.Mult_ReloadTime = 0.70

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_gas.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_gas")
end
-- END BUNDLED ATTACHMENT: uc_rpg_gas.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_mortar.lua
do
    local att = {}

att.PrintName = "Mortar Warhead"
att.AbbrevName = "Mortar Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "Mortar warhead that is highly affected by gravity and air drag."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_mortar"

att.ActivateElements = {"cal_ukraine", "cal_none"}

att.Mult_VisualRecoil = 1.10
att.Mult_Recoil = 1.10
att.Mult_ReloadTime = 1.05

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_mortar.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_mortar")
end
-- END BUNDLED ATTACHMENT: uc_rpg_mortar.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_nuke.lua
do
    local att = {}

att.PrintName = "Fat Man Warhead"
att.AbbrevName = "Fat Man Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "\"Now I am become Death, the destroyer of worlds.\""
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_rpg7_nuke"

att.ActivateElements = {"cal_nuke", "cal_none"}

att.Mult_VisualRecoil = 1.550
att.Mult_Recoil = 2
att.Mult_ReloadTime = 1.15

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_thermo.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_nuke")
end
-- END BUNDLED ATTACHMENT: uc_rpg_nuke.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_og7.lua
do
    local att = {}

att.PrintName = "OG-7V Airburst Warhead"
att.AbbrevName = "Airburst Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "Airburst warhead that launches bits of shrapnel around it's surrounding area when detonated."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {

}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_og7"

att.ActivateElements = {"cal_og7", "cal_none"}

att.Mult_VisualRecoil = 0.90
att.Mult_Recoil = 0.90
att.Mult_ReloadTime = 0.875

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_frag.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_og7")
end
-- END BUNDLED ATTACHMENT: uc_rpg_og7.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_pg7l.lua
do
    local att = {}

att.PrintName = "PG-7L Light Warhead"
att.AbbrevName = "Light Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "Lighter variant of the standard HEAT warhead. Travels much faster and can be loaded faster as well, but the blast is not as powerful."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_pg7l"

att.ActivateElements = {"cal_pg7l", "cal_none"}

att.Mult_VisualRecoil = 0.80
att.Mult_Recoil = 0.80
att.Mult_ReloadTime = 0.90

    ArcCW.LoadAttachmentType(att, "uc_rpg_pg7l")
end
-- END BUNDLED ATTACHMENT: uc_rpg_pg7l.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_scope.lua
do
    local att = {}

att.PrintName = "PGO-7 Scope"
att.Icon = Material("", "mips smooth")
att.Description = "Originally designed for the infamous RPG-7 rocket launcher, the PGO-7 is a 2.8x optic with PSO style illuminated reticule for low light shooting. Unlike most PSO's which have a red bulb, it seems that the PGO bulb is commonly amber or pale yellow."

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {

}

att.SortOrder = 1000

att.AutoStats = true
att.Slot = "uc_rpg_optic"

att.Model = "models/uc_extras/rpg7_hsp.mdl"

att.ActivateElements = {"scope"}

att.AdditionalSights = {
    {
        Pos = Vector(-1.40, 8, -1),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 2,
        IgnoreExtra = true,
        HolosightData = {
        Holosight = true,
        HolosightReticle = Material("shit/pgo7_small.png", "mips smooth"),
        HolosightNoFlare = true,
        HolosightSize = 15,
        HolosightBone = "holosight",
        Colorable = true,
        HolosightBlackbox = true,
        HolosightMagnification = 2,
        HolosightMagnificationMin = 1.5,
        HolosightMagnificationMax = 2,
        HolosightPiece = true,
        }
    },
}

att.HolosightPiece = "models/uc_extras/rpg7_hsp.mdl"

att.Mult_SightTime = 1.1

    ArcCW.LoadAttachmentType(att, "uc_rpg_scope")
end
-- END BUNDLED ATTACHMENT: uc_rpg_scope.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_shotshell.lua
do
    local att = {}

att.PrintName = "Shotshell"
att.AbbrevName = "Shotshell"
att.Icon = Material("materials/entities/att/uc_bullets/12g.png.png", "mips smooth")
att.Description = "Turn this rocket launcher into a shotgun, there's no one stopping you."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {

}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.ActivateElements = {"cal_shotshell"}

att.LHIK = true
att.LHIKHide = true

att.Override_Ammo = "Buckshot"

att.Override_Num = 20

att.Override_Damage = 18 * 20
att.Override_DamageMin = 6 * 20

att.Override_Range = 50
att.Override_RangeMin = 5
att.Override_HullSize = 0.5

att.Override_AccuracyMOA = 50

att.Mult_VisualRecoil = 1.15
att.Mult_Recoil = 0.95
att.Mult_ReloadTime = 0.90
att.Override_ShootEntity = false

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_shotshell"
end

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_shotshell.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/arccw_uc/common/gl_fire_buck_dist.ogg" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_shotshell")
end
-- END BUNDLED ATTACHMENT: uc_rpg_shotshell.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_shovel.lua
do
    local att = {}

att.PrintName = "Shovel"
att.AbbrevName = "Shovel"
att.Icon = Material("shit/uc_rpg7_shovel.png", "mips smooth")
att.Description = "Insert Far Cry reference here."
att.Desc_Pros = {
    "uc.infiniteammo"
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_shovel"

att.ActivateElements = {"cal_shovel"}

att.Mult_VisualRecoil = 0.5
att.Mult_Recoil = 0.5
att.Mult_ReloadTime = 0.8
att.Override_InfiniteAmmo = true

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_shovel.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_shovel")
end
-- END BUNDLED ATTACHMENT: uc_rpg_shovel.lua

-- BEGIN BUNDLED ATTACHMENT: uc_rpg_tbg7.lua
do
    local att = {}

att.PrintName = "TBG-7V Thermobaric Warhead"
att.AbbrevName = "Thermobaric Warhead"
att.Icon = Material("shit/uc_rpg7_rocket.png", "mips smooth")
att.Description = "Thermobaric warhead that uses a fuel-air explosive to create a high-temperature blast, making it effective against fortified positions and enemy personnel."
att.Desc_Pros = {
    "250% Higher blast radius"
}
att.Desc_Cons = {
    "Slower projectile travel"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_rpg7_cal"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_ucex_tbg7"

att.ActivateElements = {"cal_tbg7", "cal_none"}

att.Mult_VisualRecoil = 1.225
att.Mult_Recoil = 1.525
att.Mult_ReloadTime = 1.10

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/uc_rpg7/fire1_thermo.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_rpg_tbg7")
end
-- END BUNDLED ATTACHMENT: uc_rpg_tbg7.lua
