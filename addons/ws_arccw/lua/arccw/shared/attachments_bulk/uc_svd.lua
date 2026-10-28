local function register(id, name, category, description, fields)
    local att = {
        PrintName = name,
        AbbrevName = name,
        Slot = category,
        Description = description,
        AutoStats = true,
        Icon = Material("entities/att/" .. id .. ".png", "mips smooth"),
    }
    for key, value in pairs(fields) do
        att[key] = value
    end
    if category ~= "uc_svd_caliber" then
        att.ExcludeFlags = { "svd_ndm86" }
    end
    ArcCW.LoadAttachmentType(att, id)
end
register(
    "uc_svd_barrel_compact",
    "19.2\" Compact Barrel",
    "uc_svd_barrel",
    "Shortened front assembly. Easier to present and carry, with lower velocity and less reach.",
    {
        ActivateElements = { "svd_barrel_compact" },
        Override_MuzzleEffectAttachment = 10,
        Mult_Range = 0.78,
        Mult_PhysBulletMuzzleVelocity = 0.86,
        Mult_AccuracyMOA = 1.2,
        Mult_SightTime = 0.87,
        Mult_Sway = 0.85,
        Mult_Recoil = 1.12,
        Mult_SpeedMult = 1.03,
        Add_BarrelLength = -5.206,
    }
)
register(
    "uc_svd_barrel_marksman",
    "27.4\" Fluted Match Barrel",
    "uc_svd_barrel",
    "Long front assembly with improved velocity and precision. Adds forward weight and slows presentation.",
    {
        ActivateElements = { "svd_barrel_marksman" },
        Override_MuzzleEffectAttachment = 11,
        Mult_Range = 1.16,
        Mult_PhysBulletMuzzleVelocity = 1.07,
        Mult_AccuracyMOA = 0.8,
        Mult_SightTime = 1.13,
        Mult_Sway = 1.14,
        Mult_Recoil = 0.92,
        Mult_SpeedMult = 0.98,
        Add_BarrelLength = 3.014,
    }
)
register(
    "uc_svd_mag_five",
    "5-Round Short Magazine",
    "uc_svd_magazine",
    "Short steel magazine. Less capacity, less bulk, and a quicker exchange.",
    {
        ActivateElements = { "svd_mag_five" },
        Override_ClipSize = 5,
        Mult_ReloadTime = 0.90,
        Mult_SightTime = 0.94,
        Mult_Sway = 0.93,
    }
)
register(
    "uc_svd_mag_twenty",
    "20-Round Reinforced Magazine",
    "uc_svd_magazine",
    "Extended steel magazine. More sustained fire at the cost of handling and reload speed.",
    {
        ActivateElements = { "svd_mag_twenty" },
        Override_ClipSize = 20,
        Mult_ReloadTime = 1.15,
        Mult_SightTime = 1.10,
        Mult_Sway = 1.12,
    }
)
register(
    "uc_svd_stock_compact",
    "Folding Tactical Stock",
    "uc_svd_stock",
    "A compact steel folding assembly with a low cheekpiece and rubber buttpad. The shortened support improves presentation at the expense of recoil control.",
    {
        ActivateElements = { "svd_stock_compact" },
        Mult_SightTime = 0.9,
        Mult_DrawTime = 0.9,
        Mult_SightedSpeedMult = 1.10,
        Mult_Recoil = 1.15,
        Mult_RecoilSide = 1.12,
    }
)
register(
    "uc_svd_stock_target",
    "Adjustable Precision Stock",
    "uc_svd_stock",
    "A rigid precision assembly with an adjustable cheek rest, guided recoil pad and lower hand hook. A steadier platform for deliberate fire, with considerably more bulk to shoulder.",
    {
        ActivateElements = { "svd_stock_target" },
        Mult_Sway = 0.72,
        Mult_Recoil = 0.85,
        Mult_RecoilSide = 0.9,
        Mult_SightTime = 1.14,
        Mult_SightedSpeedMult = 0.9,
    }
)
register(
    "uc_svd_furniture_polymer",
    "Black Polymer Furniture",
    "uc_svd_furniture",
    "Matte black polymer handguards, thumbhole body, and cheek rest. Cosmetic finish with the original hardware retained.",
    {
        ActivateElements = { "svd_polymer" },
        Override_SVDFurnitureSkin = 1,
        Free = true,
    }
)
for _, kit in ipairs({
    {
        id = "762nato",
        name = "7.62x51mm NATO",
        damage = 0.94,
        minimum = 0.95,
        recoil = 0.92,
        velocity = 0.98,
        penetration = 0.96,
        icon = "762x51",
    },
    {
        id = "762soviet",
        name = "7.62x39mm",
        damage = 0.74,
        minimum = 0.68,
        recoil = 0.63,
        velocity = 0.84,
        penetration = 0.72,
        icon = "762x39",
    },
}) do
    local ndm = kit.id == "762nato"
    register(
        "uc_svd_cal_" .. kit.id,
        ndm and "NDM-86 .308 Conversion" or kit.name .. " Conversion",
        "uc_svd_caliber",
        ndm
                and "Norinco's .308 export version of the Chinese Type 79 rifle. Replaces the barrel assembly, laminated furniture and magazine with NDM-86 components, including the straight ten-round magazine for rimless ammunition. Slightly softer recoil and reduced penetration compared with the original cartridge."
            or "Matched chamber, bolt, and magazine conversion for "
                .. kit.name
                .. ". Compatible with the SVD magazine capacities and common bullet/powder options.",
        {
            Mult_Damage = kit.damage,
            Mult_DamageMin = kit.minimum,
            Mult_Recoil = kit.recoil,
            Mult_RecoilSide = kit.recoil,
            Mult_PhysBulletMuzzleVelocity = kit.velocity,
            Mult_Penetration = kit.penetration,
            Mult_Range = kit.id == "762soviet" and 0.72 or 0.97,
            Mult_ShootPitch = kit.id == "762soviet" and 1.08 or 0.98,
            Override_ShellModel = kit.id == "762soviet" and "models/weapons/arccw/uc_shells/762x39.mdl"
                or "models/weapons/arccw/ud_shells/762.mdl",
            GivesFlags = ndm and { "svd_762nato", "svd_ndm86" } or {},
            ActivateElements = ndm and {
                "svd_ndm86_receiver",
                "svd_ndm86_barrel",
                "svd_ndm86_handguard",
                "svd_ndm86_stock",
                "svd_ndm86_magazine",
            } or {},
            Override_MuzzleEffectAttachment = ndm and 12 or nil,
            Override_ClipSize = ndm and 10 or nil,
            Override_Trivia_Manufacturer = ndm and "Norinco" or nil,
            Override_Trivia_Country = ndm and "China" or nil,
            Override_Trivia_Year = ndm and 1986 or nil,
            Hook_NameChange = ndm and function(wep, name)
                return "NDM-86"
            end or nil,
            Override_NDM86 = ndm or nil,
            Override_Trivia_Calibre = kit.name,
            Icon = Material("entities/att/uc_bullets/" .. kit.icon .. ".png", "mips smooth"),
        }
    )
end
