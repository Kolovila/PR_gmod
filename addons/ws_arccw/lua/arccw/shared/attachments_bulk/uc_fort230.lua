do
    local att = {}
    att.PrintName = "FORT-230 Intermediate Stock"
    att.AbbrevName = "Intermediate Stock"
    att.Description =
        "The middle position of the factory telescoping stock. Shortens the weapon for confined spaces while retaining some shoulder support."
    att.Slot = "uc_fort230_stock"
    att.Free = true
    att.AutoStats = true
    att.ActivateElements = { "stock_mid" }
    att.Mult_Recoil = 1.12
    att.Mult_RecoilSide = 1.1
    att.Mult_SightTime = 0.92
    att.Mult_SightedSpeedMult = 1.08
    att.Mult_DrawTime = 0.92

    att.Icon = Material("entities/att/" .. "uc_fort230_stock_mid" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_stock_mid")
end
do
    local att = {}
    att.PrintName = "FORT-230 Collapsed Stock"
    att.AbbrevName = "Collapsed Stock"
    att.Description =
        "The factory stock fully retracted for transport and close quarters. Improves handling and aimed mobility at the cost of recoil control."
    att.Slot = "uc_fort230_stock"
    att.Free = true
    att.AutoStats = true
    att.ActivateElements = { "stock_collapsed" }
    att.Mult_Recoil = 1.35
    att.Mult_RecoilSide = 1.3
    att.Mult_Sway = 1.3
    att.Mult_SightTime = 0.8
    att.Mult_SightedSpeedMult = 1.18
    att.Mult_DrawTime = 0.82
    att.Mult_HolsterTime = 0.82

    att.Icon = Material("entities/att/" .. "uc_fort230_stock_collapsed" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_stock_collapsed")
end
do
    local att = {}
    att.PrintName = "FORT-230 Folded Foregrip"
    att.AbbrevName = "Folded Foregrip"
    att.Override_FortFoldedGrip = true
    att.SortOrder = 10000
    att.Description =
        "The factory foregrip folded against the receiver for a smaller carrying profile. Improves handling, but the shallow hold provides less control over lateral recoil."
    att.Slot = "uc_fort230_grip"
    att.Free = true
    att.AutoStats = true
    att.ActivateElements = { "grip_folded" }
    att.Mult_RecoilSide = 1.2
    att.Mult_MoveDispersion = 1.2
    att.Mult_SightTime = 0.93
    att.Mult_DrawTime = 0.94

    att.LHIK = true
    att.Model = "models/weapons/arccw/atts/uc_magpul_afg2.mdl"
    att.ModelOffset = Vector(0, 0, -0.75)
    att.NoDraw = true

    att.Icon = Material("entities/att/" .. "uc_fort230_grip_folded" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_grip_folded")
end

for _, mag in ipairs({
    {
        10,
        "10-Round Flush",
        "A short steel magazine intended to minimize protrusion below the pistol grip. Holds ten rounds and is slightly quicker to exchange.",
        0.97,
        0.98,
        0.95,
    },
    {
        30,
        "30-Round Extended",
        "An extended steel magazine for sustained automatic fire. Holds thirty rounds, with a small penalty to handling.",
        1.03,
        1.02,
        1.04,
    },
    {
        60,
        "60-Round Box Drum",
        "A sixty-round drum with a squared housing and a narrow feed tower that fits the pistol grip. Its boxy body keeps the ammunition close beneath the weapon, but adds weight and takes longer to exchange.",
        1.07,
        1.06,
        1.12,
    },
}) do
    local att = {}
    att.PrintName = "FORT-230 " .. mag[2] .. " Magazine"
    att.AbbrevName = mag[2]
    att.Description = mag[3]
    att.Slot = "uc_fort230_mag"
    att.AutoStats = true
    att.Override_ClipSize = mag[1]
    att.Mult_ReloadTime = mag[4]
    att.Mult_SightTime = mag[5]
    att.Mult_Sway = mag[6]
    att.ActivateElements = { "mag" .. mag[1] }

    att.Icon = Material("entities/att/" .. "uc_fort230_mag" .. mag[1] .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_mag" .. mag[1])
end

do
    local att = {}
    att.PrintName = "DLSLS-230 Universal Suppressor"
    att.AbbrevName = "DLSLS-230"
    att.SortOrder = 10000
    att.Description =
        "A suppressor patterned after the unit supplied with the FORT-230, fitted with an adapter collar. Reduces muzzle report and recoil at the cost of handling."

    att.Slot = "muzzle"
    att.AutoStats = true
    att.Model = "models/weapons/arccw/atts/uc_fort230_dlsls230.mdl"
    att.ModelOffset = Vector(0, 0, 0)
    att.ModelScale = Vector(1, 1, 1)
    att.IsMuzzleDevice = true
    att.Silencer = true
    att.Override_MuzzleEffect = "muzzleflash_suppressed"
    att.Mult_ShootVol = 0.72
    att.Mult_ShootPitch = 1.04
    att.Mult_Recoil = 0.93
    att.Mult_SightTime = 1.12
    att.Mult_Sway = 1.1
    att.Add_BarrelLength = 7.24
    att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    att.Icon = Material("entities/att/" .. "uc_fort230_suppressor" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_suppressor")
end

local conversions = {
    {
        id = "380",
        icon = "380acp",
        name = ".380 ACP",
        damage = 26,
        minimum = 11,
        velocity = 315,
        penetration = 3,
        range = 0.8,
        recoil = 0.77,
        rpm = 1.08,
        capacity = 1,
        shell = "9x19",
        scale = 0.9,
        desc = "A custom barrel and bolt conversion for the .380 ACP pistol cartridge. Light recoil allows quick follow-up shots, but the lower-powered round is less effective against cover.",
    },
    {
        id = "9x18",
        icon = "9x18",
        name = "9x18mm Makarov",
        damage = 29,
        minimum = 12,
        velocity = 305,
        penetration = 3.5,
        range = 0.86,
        recoil = 0.88,
        rpm = 0.94,
        capacity = 1,
        shell = "9x19",
        scale = 0.94,
        desc = "A custom conversion for the Soviet 9x18mm Makarov cartridge. Offers a slower, more controllable action at the expense of effective range.",
    },
    {
        id = "762x25",
        icon = "357sig",
        name = "7.62x25mm Tokarev",
        damage = 30,
        minimum = 16,
        velocity = 485,
        penetration = 10,
        range = 1.3,
        recoil = 1.22,
        rpm = 0.9,
        capacity = 0.9,
        shell = "9x19",
        scale = 1,
        desc = "A reinforced conversion for the bottlenecked 7.62x25mm Tokarev cartridge. Improves velocity and penetration, with stronger recoil and reduced magazine capacity.",
    },
}
for _, kit in ipairs(conversions) do
    local att = {}
    att.PrintName = "FORT-230 " .. kit.name .. " Conversion"
    att.AbbrevName = kit.name
    att.Description = kit.desc
    att.Desc_Neutrals = { "Matched chamber and bolt assembly" }
    att.Slot = "uc_fort230_caliber"
    att.AutoStats = true

    att.Override_Trivia_Calibre = kit.name
    att.Override_Damage = kit.damage
    att.Override_DamageMin = kit.minimum
    att.Override_PhysBulletMuzzleVelocity = kit.velocity
    att.Override_Penetration = kit.penetration
    att.Mult_Range = kit.range
    att.Mult_Recoil = kit.recoil
    att.Mult_RPM = kit.rpm
    att.Mult_ClipSize = kit.capacity
    att.Override_ShellScale = kit.scale
    local normal, suppressed = {}, {}
    for i = 1, 3 do
        normal[i] = ")uc_fort230/" .. kit.id .. "_fire" .. i .. ".wav"
        suppressed[i] = ")uc_fort230/" .. kit.id .. "_sup" .. i .. ".wav"
    end
    att.Hook_GetShootSound = function(wep)
        return wep:GetBuff_Override("Silencer") and suppressed or normal
    end
    att.Hook_GetDistantShootSoundOutdoors = function(wep)
        if not wep:GetBuff_Override("Silencer") then
            return { ")uc_fort230/" .. kit.id .. "_distant.wav" }
        end
    end
    att.Hook_GetDistantShootSoundIndoors = att.Hook_GetDistantShootSoundOutdoors

    att.Icon = Material("entities/att/uc_bullets/" .. kit.icon .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_cal_" .. kit.id)
end

do
    local att = {
        PrintName = "FORT-230 Stock Removed",
        AbbrevName = "Stock Removed",
        Description = "The telescoping stock assembly has been removed to reduce bulk. Improves handling considerably, but automatic fire becomes difficult to control without shoulder support.",
        Slot = "uc_fort230_stock",
        Free = true,
        AutoStats = true,
        ActivateElements = { "stock_none" },
        Mult_Recoil = 1.6,
        Mult_RecoilSide = 1.5,
        Mult_Sway = 1.5,
        Mult_SightTime = 0.72,
        Mult_DrawTime = 0.75,
        Mult_SightedSpeedMult = 1.25,
    }

    att.Icon = Material("entities/att/" .. "uc_fort230_stock_none" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_stock_none")
end
for _, config in ipairs({
    {
        "short",
        "6.9\" Compact Barrel",
        "A shortened barrel for a more compact personal-defense weapon. Improves handling at the expense of velocity and effective range.",
        0.85,
        0.85,
        0.94,
        1.08,
    },
    {
        "long",
        "10.7\" Long Barrel",
        "An extended barrel for making better use of the pistol cartridge at distance. Improves velocity and range, but adds weight ahead of the support hand.",
        1.18,
        1.15,
        1.1,
        0.94,
    },
}) do
    local att = {
        PrintName = "FORT-230 " .. config[2],
        AbbrevName = config[2],
        Description = config[3],
        Slot = "uc_fort230_barrel",
        AutoStats = true,
        ActivateElements = { "barrel_" .. config[1] },
        Mult_PhysBulletMuzzleVelocity = config[4],
        Mult_Range = config[5],
        Mult_SightTime = config[6],
        Mult_Recoil = config[7],
    }

    att.Icon = Material("entities/att/" .. "uc_fort230_barrel_" .. config[1] .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_barrel_" .. config[1])
end
for _, finish in ipairs({ { "fde", "Flat Dark Earth", 1 }, { "camo", "Camo Paint", 2 } }) do
    local att = {
        PrintName = "FORT-230 " .. finish[2],
        AbbrevName = finish[2],
        Description = finish[1] == "fde"
                and "A tan protective finish for use in dry, open terrain. Retains the original control markings."
            or "A disruptive field finish intended to break up the outline of the weapon. Wear exposes the original finish along contact edges.",
        Slot = "uc_fort230_furniture",
        Free = true,
        ActivateElements = { "furniture_" .. finish[1] },
        Override_FortFurnitureSkin = finish[3],
    }

    att.Icon = Material("entities/att/" .. "uc_fort230_furniture_" .. finish[1] .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_fort230_furniture_" .. finish[1])
end

do
    local att = {}
    att.PrintName = "FORT-230 B&T UMP-Style Folding Stock"
    att.AbbrevName = "B&T Folding Stock"
    att.Description =
        "A polymer side-folding stock adapted from the B&T MP5 pattern. The broad buttpad improves lateral control, with a small handling penalty. Folding it reduces bulk and shoulder support."
    att.Icon = Material("entities/att/uc_fort230_stock_ump.png", "mips smooth")
    att.Slot = "uc_fort230_stock"
    att.AutoStats = true
    att.ToggleLockDefault = true
    att.ToggleSound = "arccw_uc/common/stockslide.ogg"
    att.ToggleStats = {
        {
            PrintName = "Extended",
            ActivateElements = { "stock_ump" },
            Mult_RecoilSide = 0.75,
            Mult_Sway = 0.92,
            Mult_SightTime = 1.08,
            Mult_SightedSpeedMult = 0.90,
        },
        {
            PrintName = "Folded",
            ActivateElements = { "stock_ump_folded" },
            Mult_Recoil = 1.4,
            Mult_RecoilSide = 1.35,
            Mult_Sway = 1.35,
            Mult_SightTime = 0.82,
            Mult_DrawTime = 0.85,
            Mult_SightedSpeedMult = 1.16,
        },
    }
    ArcCW.LoadAttachmentType(att, "uc_fort230_stock_ump")
end
