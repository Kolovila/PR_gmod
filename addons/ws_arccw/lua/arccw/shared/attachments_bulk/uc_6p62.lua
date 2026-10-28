do
    local att = {}
    att.PrintName = "6P62 B-32 Armor-Piercing Load"
    att.AbbrevName = "B-32 AP"
    att.Description =
        "Soviet B-32 ammunition with a hardened steel penetrator, developed for heavy machine guns and anti-materiel use. Improves penetration through cover at the expense of damage against exposed targets."
    att.Slot = "uc_6p62_ammo"
    att.AutoStats = true
    att.Mult_Penetration = 1.35
    att.Mult_Damage = 0.88
    att.Mult_DamageMin = 0.94

    att.Icon = Material("entities/att/" .. "uc_6p62_ammo_ap" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_ammo_ap")
end

do
    local att = {}
    att.PrintName = "6P62 .50 BMG Conversion"
    att.AbbrevName = ".50 BMG"
    att.Description =
        "Custom conversion for the American 12.7x99mm cartridge used by the Browning M2. Slightly reduces recoil and increases velocity, with a small loss of penetration."
    att.Slot = "uc_6p62_caliber"
    att.AutoStats = true
    att.Override_Trivia_Calibre = ".50 Browning Machine Gun"
    att.Override_PhysBulletMuzzleVelocity = 680
    att.Mult_Penetration = 0.94
    att.Mult_Recoil = 0.95

    att.Icon = Material("entities/att/uc_bullets/338lapua.png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_cal_50bmg")
end

for _, spec in ipairs({
    {
        "short",
        "19.8\" Compact Barrel",
        "A shortened barrel assembly for carrying the rifle through confined spaces. Improves handling, but reduces velocity and leaves no room for the factory bipod.",
        0.83,
        0.88,
        1.18,
        0.9,
        3,
        -4.2,
    },
    {
        "long",
        "28.7\" Extended Barrel",
        "A longer barrel intended for supported fire against distant targets. Improves velocity and recoil control, with additional weight slowing presentation.",
        1.22,
        1.14,
        0.91,
        1.12,
        4,
        4.725,
    },
}) do
    local att = {}
    att.PrintName = "6P62 " .. spec[2]
    att.AbbrevName = spec[2]
    att.Description = spec[3]
    att.Slot = "uc_6p62_barrel"
    att.AutoStats = true
    att.ActivateElements = { "barrel_" .. spec[1] }
    att.Mult_Range = spec[4]
    att.Mult_PhysBulletMuzzleVelocity = spec[5]
    att.Mult_Recoil = spec[6]
    att.Mult_SightTime = spec[7]
    att.Override_MuzzleEffectAttachment = spec[8]
    att.Add_BarrelLength = spec[9]
    if spec[1] == "short" then
        att.Override_6P62NoBipod = true
        att.Desc_Cons = { "No integral bipod" }
    end

    att.Icon = Material("entities/att/" .. "uc_6p62_barrel_" .. spec[1] .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_barrel_" .. spec[1])
end

do
    local att = {}
    att.PrintName = "6P62 Shortened Stock"
    att.AbbrevName = "Short Stock"
    att.Description =
        "A short shoulder stock for use with body armor or in confined positions. Improves handling and aimed mobility at the cost of recoil control."
    att.Slot = "uc_6p62_stock"
    att.AutoStats = true
    att.ActivateElements = { "stock_short" }
    att.Mult_SightTime = 0.9
    att.Mult_SightedSpeedMult = 1.1
    att.Mult_Recoil = 1.14
    att.Mult_RecoilSide = 1.1

    att.Icon = Material("entities/att/" .. "uc_6p62_stock_short" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_stock_short")
end
do
    local att = {}
    att.PrintName = "6P62 Padded Support Stock"
    att.AbbrevName = "Support Stock"
    att.Description =
        "A reinforced stock with an adjustable cheek rest and thick recoil pad, intended for firing from a prepared position. Improves stability and recoil control but makes the rifle slower to shoulder."
    att.Slot = "uc_6p62_stock"
    att.AutoStats = true
    att.ActivateElements = { "stock_support" }
    att.Mult_Recoil = 0.85
    att.Mult_RecoilSide = 0.88
    att.Mult_Sway = 0.8
    att.Mult_SightTime = 1.1

    att.Icon = Material("entities/att/" .. "uc_6p62_stock_support" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_stock_support")
end
do
    local att = {}
    att.PrintName = "6P62 Buttstock Removed"
    att.AbbrevName = "No Buttstock"
    att.Description =
        "The buttstock is removed and the receiver extension capped. Reduces bulk for transport, but offers no shoulder support for the heavy cartridge."
    att.Slot = "uc_6p62_stock"
    att.AutoStats = true
    att.ActivateElements = { "stock_none" }
    att.Mult_SightTime = 0.78
    att.Mult_SpeedMult = 1.04
    att.Mult_Recoil = 1.6
    att.Mult_RecoilSide = 1.5
    att.Mult_Sway = 1.3

    att.Icon = Material("entities/att/" .. "uc_6p62_stock_none" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_stock_none")
end
do
    local att = {}
    att.PrintName = "6P62 42-Round Drum"
    att.AbbrevName = "42-Round Drum"
    att.Description =
        "A large steel drum intended to keep the rifle firing between magazine changes. Holds 42 rounds, with substantial penalties to handling and reload speed."
    att.Slot = "uc_6p62_mag"
    att.AutoStats = true
    att.ActivateElements = { "mag_drum" }
    att.Override_ClipSize = 42
    att.Override_6P62Drum = true
    att.Mult_ReloadTime = 1.32
    att.Mult_SightTime = 1.15
    att.Mult_SpeedMult = 0.91
    att.Mult_SightedSpeedMult = 0.88
    att.Mult_Sway = 1.12

    att.Icon = Material("entities/att/" .. "uc_6p62_mag_drum" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_mag_drum")
end
do
    local att = {}
    att.PrintName = "6P62 BZT Tracer Load"
    att.AbbrevName = "BZT Tracer"
    att.Description =
        "Tracer ammunition for observing and correcting machine gun fire. Makes bursts easier to follow, but reveals the shooter and sacrifices some penetration."
    att.Slot = "uc_6p62_ammo"
    att.AutoStats = true
    att.Override_TracerNum = 1
    att.Mult_Penetration = 0.9

    att.Icon = Material("entities/att/" .. "uc_6p62_ammo_tracer" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_ammo_tracer")
end
do
    local att = {}
    att.PrintName = "6P62 Selected Ball"
    att.AbbrevName = "Selected Ball"
    att.Description =
        "Selected cartridges with closely matched charges and projectiles, intended for deliberate fire. Improves precision at a reduced firing cadence."
    att.Slot = "uc_6p62_ammo"
    att.AutoStats = true
    att.Mult_AccuracyMOA = 0.7
    att.Mult_RPM = 0.85

    att.Icon = Material("entities/att/" .. "uc_6p62_ammo_selected" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_ammo_selected")
end
do
    local att = {}
    att.PrintName = "6P62 Assault Handling"
    att.AbbrevName = "Assault Hold"
    att.Description =
        "A mobile firing stance for bringing the heavy rifle into action quickly. Improves handling, but provides less control during sustained fire."
    att.Slot = "uc_6p62_handling"
    att.AutoStats = true
    att.Mult_SightTime = 0.85
    att.Mult_DrawTime = 0.85
    att.Mult_SightedSpeedMult = 1.12
    att.Mult_Recoil = 1.15
    att.Mult_RecoilSide = 1.15
    att.Override_6P62Fatigue = 1.4

    att.Icon = Material("entities/att/" .. "uc_6p62_handling_assault" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_handling_assault")
end
do
    local att = {}
    att.PrintName = "6P62 Supported-Fire Drill"
    att.AbbrevName = "Support Hold"
    att.Description =
        "A supported firing stance emphasizing a firm shoulder and steady pressure into the fore-end. Improves burst control at the cost of presentation speed."
    att.Slot = "uc_6p62_handling"
    att.AutoStats = true
    att.Mult_SightTime = 1.12
    att.Mult_RecoilSide = 0.85
    att.Mult_ShootSpeedMult = 0.9
    att.Override_6P62Fatigue = 0.6

    att.Icon = Material("entities/att/" .. "uc_6p62_handling_support" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_6p62_handling_support")
end
