local icons = {
    ["barrel_drozd"] = "barrel_drozd",
    ["barrel_long"] = "barrel_long",
    ["barrel_shield"] = "barrel_shield",
    ["barrel_suppressed"] = "barrel_suppressed",
    ["stock_wire"] = "stock_wire",
    ["stock_pistol"] = "stock_pistol",
    ["stock_folder"] = "stock_folder",
    ["stock_polymer"] = "stock_polymer",
    ["stock_toz123"] = "stock_toz123",
    ["stock_toz123_polymer"] = "stock_toz123_polymer",
    ["forend_polymer"] = "forend_polymer",
    ["forend_toz123"] = "forend_toz123",
    ["forend_toz123_polymer"] = "forend_toz123_polymer",
    ["tube_extended"] = "tube_extended",
    ["tube_drum"] = "tube_drum",
    ["ks23k_barrel_long"] = "ks23k_barrel_long",
    ["ks23k_barrel_vented"] = "ks23k_barrel_vented",
    ["ks23k_barrel_suppressed"] = "ks23k_barrel_suppressed",
    ["ks23k_forend_grooved"] = "ks23k_forend_grooved",
    ["ks23k_forend_alloy"] = "ks23k_forend_alloy",
    ["ammo_sh25"] = "ammo_sh25",
    ["ammo_barrikada"] = "ammo_barrikada",
    ["ammo_volna"] = "ammo_volna",
    ["ammo_zvezda"] = "ammo_zvezda",
    ["caliber_23115"] = "caliber_23115",
    ["caliber_30mm"] = "caliber_30mm",
    ["caliber_strela"] = "caliber_strela",
    ["caliber_pv23"] = "caliber_pv23",
    ["caliber_volna"] = "caliber_volna",
    ["caliber_siren"] = "caliber_siren",
    ["caliber_cheremukha"] = "caliber_cheremukha",
    ["caliber_harpoon"] = "caliber_harpoon",
    ["caliber_rpg7"] = "caliber_rpg7",
    ["mortar_6"] = "mortar_6",
    ["mortar_12"] = "mortar_12",
    ["barrel_ks23k"] = "barrel_ks23k",
}
local function ks23k(wep)
    local a = wep.Attachments or {}
    return a[6] and a[6].Installed == "uc_ks23_barrel_ks23k"
end

local function variantModel(wep, element, world)
    if not CLIENT then
        return
    end
    local owner = wep:GetOwner()
    local parent = world and wep.WMModel
    if not world and IsValid(owner) and owner:IsPlayer() then
        parent = owner:GetViewModel()
    end
    local model = element.Model
    if not IsValid(parent) or not IsValid(model) then
        return
    end
    model:RemoveEffects(EF_BONEMERGE)
    if model:GetParent() ~= wep then
        model:SetParent(wep)
    end
    if model.UCKS23Driver ~= parent or model.UCKS23DriverModel ~= parent:GetModel() then
        model.UCKS23Driver = parent
        model.UCKS23DriverModel = parent:GetModel()
        model.UCKS23BoneMap = {}
        for i = 0, model:GetBoneCount() - 1 do
            local source = parent:LookupBone(model:GetBoneName(i))
            if source then
                model.UCKS23BoneMap[i] = source
            end
        end
    end
    model.UCKS23Matrices = {}
    for i, source in pairs(model.UCKS23BoneMap) do
        local m = parent:GetBoneMatrix(source)
        if m then
            model.UCKS23Matrices[i] = Matrix(m)
        end
    end
    if not model.UCKS23Callback then
        model.UCKS23Callback = model:AddCallback("BuildBonePositions", function(detail)
            for i, m in pairs(detail.UCKS23Matrices or {}) do
                detail:SetBoneMatrix(i, m)
            end
        end)
    end
    model:SetBodygroup(1, wep:GetBuff_Override("Override_UCKS23BarrelChoice") or 0)
    model:SetBodygroup(2, wep:GetBuff_Override("Override_UCKS23ForendChoice") or 0)
    model:SetBodygroup(3, wep:GetBuff_Override("Override_UCKS23StockChoice") or 0)
    model:SetBodygroup(4, wep:GetBuff_Override("Override_UCKS23OTsDrum") and 1 or 0)
    model:SetBodygroup(5, (wep:GetBuff_Override("Override_UCKS23VlasovFeed") or 1) - 1)
    model:InvalidateBoneCache()
    model:SetupBones()
end
local function register(id, name, slot, description, stats)
    if slot == "ammo" then
        slot = "caliber"
    end
    local att = {
        HideIfBlocked = false,
        PrintName = name,
        AbbrevName = name,
        Slot = "uc_ks23_" .. slot,
        Description = description,
        AutoStats = true,
    }
    if icons[id] then
        att.Icon = Material("entities/uc_ks23/" .. icons[id] .. ".png", "mips smooth")
    end
    for k, v in pairs(stats) do
        att[k] = v
    end
    if
        id ~= "barrel_ks23k"
        and (
            slot == "stock"
            or slot == "forend"
            or slot == "barrel"
            or id == "caliber_23115"
            or id == "caliber_harpoon"
            or id == "caliber_30mm"
            or slot == "mortar"
            or slot == "tube"
        )
    then
        att.ExcludeFlags = att.ExcludeFlags or {}
        table.insert(att.ExcludeFlags, "ks23_bullpup")
    end
    if
        id ~= "stock_kovrov"
        and id ~= "stock_vlasov"
        and (slot == "barrel" or slot == "forend" or slot == "tube" or slot == "mortar")
    then
        att.ExcludeFlags = att.ExcludeFlags or {}
        table.insert(att.ExcludeFlags, "ks23_prototype")
    end
    if id == "caliber_23115" or id == "caliber_rpg7" then
        att.ExcludeFlags = att.ExcludeFlags or {}
        table.insert(att.ExcludeFlags, "ks23_ots28")
    end
    local modelKind = id == "stock_kovrov" and "kovrov"
        or id == "stock_vlasov" and "vlasov"
        or id == "variant_ots28" and "ots28"
    if modelKind then
        att.Model = "models/weapons/arccw/uc_ks23/variant_" .. modelKind .. ".mdl"
        att.ModelScale = 1
        att.DrawFunc = variantModel
    end
    for _, kind in ipairs({ "kovrov", "vlasov", "ots28" }) do
        if
            slot == kind .. "_barrel"
            or slot == kind .. "_forend"
            or slot == kind .. "_stock"
            or slot == kind .. "_mag"
        then
            att.RequireFlags = { "ks23_" .. kind }
        end
    end
    if slot == "ks23k_stock" then
        att.RequireFlags = { "ks23_bullpup" }
    end
    ArcCW.LoadAttachmentType(att, "uc_ks23_" .. id)
end
register(
    "barrel_drozd",
    "16.1\" Drozd Barrel",
    "barrel",
    "Short rifled barrel for the KS-23M. Easier to maneuver in confined spaces, but produces a wider buckshot pattern and a sharper recoil impulse.",
    {
        ActivateElements = { "ks23_410" },
        GivesFlags = { "ks23_muzzle_incompatible" },
        Override_MuzzleEffectAttachment = 3,
        Mult_Range = 0.8,
        Mult_AccuracyMOA = 1.18,
        Mult_Recoil = 1.12,
        Mult_SightTime = 0.85,
        Mult_Sway = 0.9,
        Mult_HipDispersion = 0.85,
        Add_BarrelLength = -3.94,
    }
)
register(
    "barrel_long",
    "27.6\" Extended Barrel",
    "barrel",
    "Extended rifled barrel with the standard profile and front sight. Improves reach and tightens buckshot patterns, but the additional forward weight makes the weapon slower to shoulder.",
    {
        ActivateElements = { "ks23_700" },
        GivesFlags = { "ks23_muzzle_incompatible" },
        Override_MuzzleEffectAttachment = 5,
        Mult_Range = 1.25,
        Mult_AccuracyMOA = 0.78,
        Mult_Recoil = 0.94,
        Mult_SightTime = 1.2,
        Mult_Sway = 1.15,
        Mult_SpeedMult = 0.97,
        Add_BarrelLength = 7.48,
    }
)
register(
    "barrel_shield",
    "20.1\" Ventilated Shroud",
    "barrel",
    "Ventilated steel shroud fitted over the standard barrel. Shields the support hand from the hot barrel and adds enough forward weight to steady the muzzle, at the expense of handling speed.",
    {
        ActivateElements = { "ks23_shield" },
        Mult_RecoilSide = 0.82,
        Mult_VisualRecoilMult = 0.92,
        Mult_SightTime = 1.12,
        Mult_SpeedMult = 0.985,
    }
)
register(
    "stock_wire",
    "Drozd Detachable Wire Stock",
    "stock",
    "Detachable steel shoulder stock and polymer pistol grip for the KS-23M. Lighter and quicker to shoulder than the wooden stock, but its narrow buttplate offers little comfort under recoil.",
    {
        ActivateElements = { "ks23_wire" },
        Mult_SightTime = 0.88,
        Mult_SpeedMult = 1.02,
        Mult_Recoil = 1.16,
        Mult_Sway = 1.12,
    }
)
register(
    "stock_pistol",
    "KS-23M Pistol Grip",
    "stock",
    "Polymer pistol grip with the shoulder stock removed. Compact and quick to bring to bear, but provides little support against the powerful 23 mm cartridge.",
    {
        ActivateElements = { "ks23_pistol" },
        Mult_SightTime = 0.72,
        Mult_SpeedMult = 1.045,
        Mult_HipDispersion = 0.82,
        Mult_Recoil = 1.65,
        Mult_RecoilSide = 1.5,
        Mult_Sway = 1.6,
        Mult_MoveDispersion = 1.3,
    }
)
register(
    "stock_folder",
    "Top-Folding Stock",
    "stock",
    "Perforated steel shoulder stock that folds forward over the receiver. Provides a firm shoulder contact when extended; folding it reduces bulk at the cost of recoil control and sight stability.",
    {
        ToggleStats = {
            {
                PrintName = "Extended",
                ActivateElements = { "ks23_folder" },
                Mult_SightTime = 1.05,
                Mult_Recoil = 1.08,
                Mult_Sway = 1.08,
            },
            {
                PrintName = "Folded",
                ActivateElements = { "ks23_folded" },
                Mult_SightTime = 0.78,
                Mult_Recoil = 1.55,
                Mult_RecoilSide = 1.4,
                Mult_Sway = 1.6,
                Mult_HipDispersion = 0.85,
            },
        },
    }
)
register(
    "forend_polymer",
    "KS-23M Polymer Forend",
    "forend",
    "Ribbed polymer forend for the KS-23M. Deep grooves provide a secure hold for working the action briskly, though the lighter furniture is less steady than wood.",
    {
        ActivateElements = { "ks23_polymer" },
        Mult_CycleTime = 0.92,
        Mult_RPM = 1.04,
        Mult_Sway = 1.08,
    }
)

local shellpath = "models/weapons/arc9/darsu_eft/shells/patron_23x75_"
register(
    "ammo_sh25",
    "23 mm Shrapnel-25",
    "ammo",
    "Longer-range buckshot cartridge with a tighter twelve-pellet pattern. Trades some close-range stopping power for improved reach, with a stronger recoil impulse.",
    {
        ActivateElements = { "ks23_shell_sh25" },
        Override_Damage = 16,
        Override_DamageMin = 64 / 12,
        Override_RangeMin = 15,
        Override_Range = 55,
        Mult_AccuracyMOA = 0.72,
        Mult_Recoil = 1.1,
        Override_MuzzleVelocity = 375,
        Override_PhysBulletMuzzleVelocity = 375,
        Override_ShellModel = shellpath .. "sh25.mdl",
    }
)
register(
    "ammo_barrikada",
    "23 mm Barrikada",
    "ammo",
    "Heavy steel slug intended to defeat hard cover. The rifled barrel provides useful precision, but recoil is severe and a single projectile demands careful placement.",
    {
        ActivateElements = { "ks23_shell_bar" },
        GivesFlags = { "ks23_dedicated" },
        Override_Num = 1,
        Override_Damage = 130 / 12,
        Override_DamageMin = 65 / 12,
        Override_RangeMin = 20,
        Override_Range = 110,
        Override_AccuracyMOA = 7,
        Override_Penetration = 18,
        Override_DamageType = DMG_BULLET,
        Override_IsShotgun = false,
        Override_BodyDamageMults = ArcCW.UC.BodyDamageMults,
        Mult_Recoil = 1.35,
        Override_MuzzleVelocity = 420,
        Override_PhysBulletMuzzleVelocity = 420,
        Override_ShellModel = shellpath .. "bar.mdl",
    }
)
register(
    "ammo_volna",
    "23 mm Volna-R",
    "ammo",
    "Low-energy cartridge loaded with a rubber projectile for riot control. Delivers a blunt impact with modest recoil, but loses effectiveness rapidly with distance. Less-lethal ammunition can still inflict fatal injuries.",
    {
        ActivateElements = { "ks23_shell_waver" },
        GivesFlags = { "ks23_dedicated" },
        Override_Num = 1,
        Override_Damage = 18 / 12,
        Override_DamageMin = 3 / 12,
        Override_RangeMin = 3,
        Override_Range = 18,
        Override_Penetration = 0,
        Override_AccuracyMOA = 18,
        Override_DamageType = DMG_CLUB,
        Override_IsShotgun = false,
        Mult_Recoil = 0.45,
        Override_MuzzleVelocity = 160,
        Override_PhysBulletMuzzleVelocity = 160,
        Override_ShellModel = shellpath .. "waver.mdl",
        Hook_BulletHit = function(wep, data)
            if CLIENT then
                return
            end
            local tr = data.tr
            if not tr or not IsValid(tr.Entity) then
                return
            end
            local ent = tr.Entity
            local owner = wep:GetOwner()
            if not IsValid(owner) or owner:GetShootPos():DistToSqr(tr.HitPos) > (18 / 0.0254) ^ 2 then
                return
            end
            local direction = (tr.HitPos - owner:GetShootPos()):GetNormalized()
            if ent:IsPlayer() and ent:Alive() then
                ent:SetVelocity(direction * 110)
            elseif ent:IsNPC() then
                ent:SetSchedule(SCHED_FLINCH_PHYSICS)
            else
                local phys = ent:GetPhysicsObject()
                if IsValid(phys) then
                    phys:ApplyForceOffset(direction * math.min(phys:GetMass(), 80) * 160, tr.HitPos)
                end
            end
        end,
    }
)
register(
    "ammo_zvezda",
    "23 mm Zvezda",
    "ammo",
    "Flash cartridge intended to disorient exposed opponents directly ahead of the muzzle. Its intense flash is most effective at close range and against those facing it; solid cover blocks the effect.",
    {
        ActivateElements = { "ks23_shell_zvezda" },
        GivesFlags = { "ks23_dedicated", "ks23_flash" },
        Override_Num = 1,
        Override_Damage = 0,
        Override_DamageMin = 0,
        Override_Penetration = 0,
        Override_DamageType = DMG_GENERIC,
        Override_MuzzleVelocity = 80,
        Override_PhysBulletMuzzleVelocity = 80,
        Mult_Recoil = 0.65,
        Override_ShellModel = shellpath .. "zvezda.mdl",
        Hook_PostFireBullets = function(wep)
            if SERVER and UC_KS23 and UC_KS23.Flash then
                UC_KS23.Flash(wep)
            end
        end,
    }
)
register(
    "stock_polymer",
    "Polymer Shoulder Stock",
    "stock",
    "Full-length molded polymer stock with a rubber buttpad. Retains the familiar shoulder fit of the wooden stock with less weight, though the lighter furniture transmits more of the recoil impulse.",
    {
        ActivateElements = { "ks23_stock_polymer" },
        Mult_SpeedMult = 1.015,
        Mult_SightTime = 0.96,
        Mult_Recoil = 1.05,
    }
)
register(
    "barrel_suppressed",
    "20.1\" Suppressed Barrel",
    "barrel",
    "Rifled barrel enclosed in an integral expansion shroud. Reduces muzzle blast and flash, but adds forward weight and slows presentation. Raised iron sights clear the larger barrel assembly. Uses caliber-specific reports for flash and cannon cartridges.",
    {
        ActivateElements = { "ks23_suppressed" },
        GivesFlags = { "ks23_suppressed", "ks23_muzzle_incompatible" },
        ExcludeFlags = { "ks23_gas" },
        Silencer = true,
        Override_MuzzleEffect = "muzzleflash_suppressed",
        Override_MuzzleEffectAttachment = 6,
        Override_TracerNum = 0,
        Mult_ShootVol = 0.62,
        Mult_Recoil = 0.88,
        Mult_SightTime = 1.2,
        Mult_Sway = 1.15,
        Mult_SpeedMult = 0.97,
        Add_BarrelLength = 3.425,
        Override_IronSightStruct = {
            Pos = Vector(-2.339, 0, 0.716),
            Ang = Angle(0.888, 0.013, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
    }
)

register(
    "caliber_23115",
    "23x115 mm Cannon Cartridge",
    "caliber",
    "Single-shot conversion for a long, brass-cased cannon cartridge with a hardened steel projectile and copper driving band. Delivers exceptional penetration and retained energy, but its severe recoil and deliberate loading stroke demand a steady firing position. The tubular magazine is bypassed.",
    {
        ActivateElements = { "ks23_shell_23115" },
        GivesFlags = { "ks23_dedicated", "ks23_cannon" },
        ExcludeFlags = { "ks23_extended_tube" },
        Override_Num = 1,
        Override_Damage = 240 / 12,
        Override_DamageMin = 155 / 12,
        Override_RangeMin = 35,
        Override_Range = 220,
        Override_AccuracyMOA = 5,
        Override_Penetration = 35,
        Override_DamageType = DMG_BULLET,
        Override_IsShotgun = false,
        Override_BodyDamageMults = ArcCW.UC.BodyDamageMults,
        Override_MuzzleVelocity = 690,
        Override_PhysBulletMuzzleVelocity = 690,
        Override_ClipSize = 1,
        Override_ClipSize_Priority = 40,
        Override_ChamberSize = 0,
        Mult_Recoil = 2.4,
        Mult_RecoilSide = 1.65,
        Mult_VisualRecoilMult = 1.5,
        Mult_ReloadTime = 1.45,
        Mult_CycleTime = 1.3,
        Mult_SightTime = 1.15,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_23115.mdl",
        Override_ShellScale = 1,
    }
)

register(
    "caliber_strela",
    "23 mm Strela-3",
    "caliber",
    "Less-lethal cartridge with a rigid plastic projectile. Holds its trajectory better than a rubber load and delivers a sharp blunt impact, but carries no useful penetration. Close-range hits remain dangerous.",
    {
        ActivateElements = { "ks23_shell_strela" },
        GivesFlags = { "ks23_dedicated" },
        Override_Num = 1,
        Override_Damage = 32 / 12,
        Override_DamageMin = 7 / 12,
        Override_RangeMin = 7,
        Override_Range = 35,
        Override_Penetration = 0,
        Override_DamageType = DMG_CLUB,
        Override_IsShotgun = false,
        Override_AccuracyMOA = 12,
        Mult_Recoil = 0.65,
        Override_MuzzleVelocity = 230,
        Override_PhysBulletMuzzleVelocity = 230,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_strela.mdl",
    }
)
local function gasload(id, name, description, kind)
    register("caliber_" .. id, name, "caliber", description, {
        ActivateElements = { "ks23_shell_" .. id },
        GivesFlags = { "ks23_dedicated", "ks23_gas" },
        ExcludeFlags = { "ks23_suppressed" },
        Override_Num = 1,
        Override_Damage = 0,
        Override_DamageMin = 0,
        Override_Penetration = 0,
        Override_IsShotgun = false,
        Override_AccuracyMOA = 16,
        Mult_Recoil = 0.72,
        Override_Damage_Priority = 3,
        Override_DamageMin_Priority = 3,
        Override_Num_Priority = 3,
        Override_ShellModel_Priority = 3,
        Override_ShootEntity = "uc_ks23_gas_round",
        Override_MuzzleVelocity = 2800,
        Override_MuzzleVelocity_Priority = 3,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_" .. id .. ".mdl",
        Hook_PostFireRocket = function(wep, projectile)
            UC_KS23.ConfigureProjectile(
                wep,
                projectile,
                kind,
                "models/weapons/arccw/uc_ks23/canister_" .. id .. ".mdl",
                2800,
                0.48,
                18
            )
        end,
    })
end
gasload(
    "cheremukha",
    "23 mm Cheremukha-7",
    "Self-contained CN canister cartridge launched through the rifled bore; no external cup or PV-23 blank is used. The canister opens after impact and releases a concentrated, short-lived irritant cloud. Exposure disrupts vision and movement; solid cover blocks the cloud's effects.",
    "cn"
)
gasload(
    "siren",
    "23 mm Siren-7",
    "CS tear-gas grenade cartridge. Releases a spreading cloud that persists longer than the Cheremukha load. Sustained exposure impairs vision and movement, while leaving the affected area allows recovery.",
    "cs"
)
register(
    "caliber_pv23",
    "23 mm PV-23 Blank",
    "caliber",
    "Propellant cartridge for launching cup-mounted muzzle grenades. Produces muzzle flash and report but carries no bullet. Fit a Nasadka cup to launch its matching gas grenade.",
    {
        ActivateElements = { "ks23_shell_pv23" },
        GivesFlags = { "ks23_dedicated", "ks23_blank" },
        Override_Num = 1,
        Override_Damage = 0,
        Override_DamageMin = 0,
        Override_Penetration = 0,
        Override_IsShotgun = false,
        Override_NeverPhysBullet = true,
        Override_MuzzleVelocity = 0,
        Override_PhysBulletMuzzleVelocity = 0,
        Mult_Recoil = 0.35,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_pv23.mdl",
    }
)

register(
    "caliber_volna",
    "23 mm Volna Practice",
    "caliber",
    "Practice cartridge with an inert container in place of the irritant payload. Reproduces the loading cycle and lobbed trajectory of a gas cartridge without releasing an irritant cloud. The inert container can still injure on direct impact.",
    {
        ActivateElements = { "ks23_shell_volna" },
        GivesFlags = { "ks23_dedicated" },
        Override_Num = 1,
        Override_Damage = 35 / 12,
        Override_DamageMin = 35 / 12,
        Override_Penetration = 0,
        Override_IsShotgun = false,
        Override_ShootEntity = "uc_ks23_practice_round",
        Override_MuzzleVelocity = 2800,
        Override_AccuracyMOA = 16,
        Mult_Recoil = 0.72,
        Hook_PostFireRocket = function(wep, projectile)
            UC_KS23.ConfigureProjectile(
                wep,
                projectile,
                "inert",
                "models/weapons/arccw/uc_ks23/canister_volna.mdl",
                2800,
                0.48,
                35
            )
        end,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_volna.mdl",
    }
)
local function mortarSight(id, velocity)
    local pitch = 0.5 * math.asin(600 * (25 / 0.0254) / (velocity * velocity))
    local front = (id == "6" and 4.8 or 4.4) - 0.2
    local rearHeight = 2.55 + (front - 1.62) * math.tan(pitch)
    local eyeHeight = rearHeight + 31.32 * math.tan(pitch)
    return {
        Pos = Vector(-2.339, 0, 0.916 - (eyeHeight - 1.05)),
        Ang = Angle(0.888 + math.deg(pitch), 0.013, 0),
        Magnification = 1.0,
        SwitchToSound = "",
    }
end
local function mortar(id, name, description, kind, velocity, reload, sway)
    register("mortar_" .. id, name, "mortar", description, {
        ActivateElements = { "ks23_mortar_" .. id },
        RequireFlags = { "ks23_blank" },
        ExcludeFlags = { "ks23_muzzle_incompatible", "ks23_extended_tube" },
        Override_ShootEntity = "uc_ks23_gas_round",
        Override_MuzzleVelocity = velocity,
        Override_MuzzleVelocity_Priority = 10,
        Override_ClipSize = 1,
        Override_ClipSize_Priority = 40,
        Override_ChamberSize = 0,
        Override_UCKS23Mortar = id,
        Override_Damage = (id == "6" and 25 or 40) / 12,
        Override_DamageMin = (id == "6" and 25 or 40) / 12,
        Override_Damage_Priority = 10,
        Override_DamageMin_Priority = 10,
        Mult_ReloadTime = reload,
        Mult_SightTime = 1.25,
        Mult_Sway = sway,
        Mult_SpeedMult = 0.96,
        Mult_Recoil = 1.8,
        Override_AccuracyMOA = 22,
        Override_IronSightStruct = mortarSight(id, velocity),
        Hook_ShouldNotFire = function(wep)
            if
                not wep.Attachments
                or not wep.Attachments[7]
                or wep.Attachments[7].Installed ~= "uc_ks23_caliber_pv23"
            then
                return true
            end
        end,
        Hook_PostFireRocket = function(wep, projectile)
            UC_KS23.ConfigureProjectile(
                wep,
                projectile,
                kind,
                "models/weapons/arccw/uc_ks23/grenade_" .. id .. ".mdl",
                velocity,
                id == "6" and 0.75 or 1.7,
                id == "6" and 25 or 40
            )
        end,
    })
end
mortar(
    "6",
    "36 mm Nasadka-6 / Cheremukha-6",
    "Muzzle-mounted launching cup for the 36 mm Cheremukha-6 gas grenade. A PV-23 blank propels the grenade from the cup. Loaded one grenade at a time; the added muzzle weight slows presentation.",
    "ch6",
    2200,
    1.9,
    1.2
)
mortar(
    "12",
    "82 mm Nasadka-12 / Cheremukha-12",
    "Large launching cup for the 82 mm Cheremukha-12 gas grenade, intended to establish a broad irritant cloud in open ground. Uses a PV-23 blank and single-grenade loading. Its bulk and steep trajectory demand deliberate aiming.",
    "ch12",
    1500,
    2.4,
    1.45
)

register(
    "caliber_harpoon",
    "23 mm Line-Throwing Harpoon",
    "caliber",
    "Barrel-loaded steel harpoon with swept retaining flukes and a trailing retrieval line. A reduced launching cartridge propels the head into surfaces or exposed targets. Hold secondary fire to tension the line: lighter targets are hauled inward, while heavier anchors draw the shooter forward; press Use to release the line. The tubular magazine is bypassed.",
    {
        Icon = Material("entities/uc_ks23/caliber_harpoon.png", "mips smooth"),
        GivesFlags = { "ks23_dedicated", "ks23_harpoon" },
        ExcludeFlags = { "ks23_muzzle_incompatible", "ks23_gas", "ks23_blank", "ks23_extended_tube" },
        ActivateElements = { "ks23_shell_pv23" },
        Override_UCKS23Harpoon = true,
        Override_ClipSize = 1,
        Override_ClipSize_Priority = 40,
        Override_ChamberSize = 0,
        Override_Num = 1,
        Override_Damage = 0,
        Override_DamageMin = 0,
        Override_Penetration = 0,
        Override_IsShotgun = false,
        Override_ShootEntity = "uc_ks23_harpoon",
        Override_MuzzleVelocity = 3500,
        Override_MuzzleVelocity_Priority = 10,
        Override_PhysBulletMuzzleVelocity = 0,
        Mult_Recoil = 0.55,
        Override_ShotgunReload = false,
        Hook_SelectReloadAnimation = function(wep, anim)
            if anim == "reload" or anim == "reload_empty" then
                return "harpoon_reload"
            end
        end,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_pv23.mdl",
        Hook_Compatible = function(wep)
            if wep.Attachments[3] and wep.Attachments[3].Installed then
                return false
            end
        end,
        Hook_PostFireRocket = function(wep, projectile)
            if SERVER and IsValid(projectile) then
                projectile:Launch(wep)
            end
        end,
    }
)

register(
    "caliber_30mm",
    "30 mm Magnum Buckshot",
    "caliber",
    "Enlarged chamber and feed assembly for a heavy 30 mm shotshell. Eighteen pellets deliver a dense close-range pattern, but the heavier charge produces severe recoil and slower cycling. The larger cartridges reduce capacity to two rounds.",
    {
        Icon = Material("entities/uc_ks23/caliber_30mm.png", "mips smooth"),
        ActivateElements = { "ks23_shell_30mm" },
        Override_Num = 18,
        Override_Damage = 330 / 12,
        Override_DamageMin = 84 / 12,
        Override_RangeMin = 7,
        Override_Range = 38,
        Mult_AccuracyMOA = 1.15,
        Override_Penetration = 12,
        Override_DamageType = DMG_BUCKSHOT,
        Override_IsShotgun = true,
        Override_ClipSize = 2,
        Override_ClipSize_Priority = 40,
        Override_ChamberSize = 0,
        Override_MuzzleVelocity = 330,
        Override_PhysBulletMuzzleVelocity = 330,
        Mult_Recoil = 1.55,
        Mult_RecoilSide = 1.25,
        Mult_CycleTime = 1.18,
        Mult_ReloadTime = 1.12,
        Mult_SightTime = 1.08,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_30mm.mdl",
        Override_ShellScale = 1,
    }
)

register(
    "stock_toz123",
    "TOZ-123 Sporting Stock",
    "stock",
    "Varnished wooden shoulder stock with a checkered wrist and rubber recoil pad. A broad comb provides a steady cheek weld, with additional weight slowing presentation.",
    {
        ActivateElements = { "ks23_stock_toz123" },
        Mult_Sway = 0.92,
        Mult_SightTime = 1.04,
    }
)
register(
    "forend_toz123",
    "TOZ-123 Sporting Forend",
    "forend",
    "Matching varnished wooden forend with fine checkering for a secure support-hand grip. The sporting furniture favors a steady hold over rapid handling.",
    {
        ActivateElements = { "ks23_forend_toz123" },
        Mult_RecoilSide = 0.94,
        Mult_CycleTime = 1.03,
    }
)

register(
    "stock_toz123_polymer",
    "TOZ-123 Polymer Stock",
    "stock",
    "Molded synthetic sporting stock with a checkered wrist and rubber recoil pad. Lighter than the wooden furniture and resistant to moisture, though it provides less weight to settle the weapon.",
    {
        ActivateElements = { "ks23_stock_toz123_polymer" },
        Mult_SightTime = 0.96,
        Mult_SpeedMult = 1.01,
        Mult_Recoil = 1.03,
    }
)
register(
    "forend_toz123_polymer",
    "TOZ-123 Polymer Forend",
    "forend",
    "Smooth-sided synthetic forend with molded checkering. Its light construction and broad gripping panels make the pump easy to work with wet or gloved hands.",
    {
        ActivateElements = { "ks23_forend_toz123_polymer" },
        Mult_CycleTime = 0.96,
        Mult_HipDispersion = 0.97,
    }
)

register(
    "barrel_ks23k",
    "KS-23K Bullpup Conversion Kit",
    "variant",
    "Complete bullpup receiver with a seven-round detachable box magazine, barrel-mounted sliding forend and carry-handle sights. Retains manual operation while reducing overall length. Magazine changes are faster than replenishing the tubular feed, but the rearward magazine well takes practice to reach.",
    {
        Icon = Material("entities/uc_ks23/barrel_ks23k.png", "mips smooth"),
        ActivateElements = { "ks23_bullpup" },
        GivesFlags = { "ks23_bullpup", "ks23_muzzle_incompatible" },
        Override_ActivePos = Vector(0.4, 3, -0.3),
        Override_UCKS23Bullpup = true,
        Override_ClipSize = 7,
        Override_ChamberSize = 1,
        Override_CustomizePos = Vector(7.12, 11.22, 2.16),
        Override_CustomizeAng = Angle(7.805, 26.341, 10.732),
        Override_ShotgunReload = false,
        Override_MuzzleEffectAttachment = 7,
        Override_CaseEffectAttachment = 8,
        Add_BarrelLength = -11.83,
        Mult_SightTime = 0.92,
        Mult_Sway = 1.08,
        Mult_RecoilSide = 1.12,
        Override_IronSightStruct = {
            Pos = Vector(-2.3375425, 2, -2.2581499),
            Ang = Angle(0.7360937, 0.0024, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },

        Hook_SelectReloadAnimation = function(wep)
            local drum = wep.Attachments[8] and wep.Attachments[8].Installed == "uc_ks23_tube_drum"
            if drum then
                return (wep:Clip1() == 0 or wep:GetNeedCycle()) and "ks23k_drum_reload_empty"
                    or "ks23k_drum_reload"
            end
            return (wep:Clip1() == 0 or wep:GetNeedCycle()) and "ks23k_reload_empty" or "ks23k_reload"
        end,
        Hook_TranslateAnimation = function(wep, anim)
            local map = {
                idle = "ks23k_idle",
                draw = "ks23k_draw",
                ready = "ks23k_draw",
                holster = "ks23k_holster",
                fire = "ks23k_fire",
                fire_iron = "ks23k_fire_iron",
                cycle = "ks23k_cycle",
                cycle_iron = "ks23k_cycle",
                bash = "ks23k_bash",
            }
            return map[anim]
        end,
    }
)

register(
    "tube_extended",
    "4-Round Extended Tube",
    "tube",
    "Longer steel magazine tube with a matching end cap. Holds one additional 23 mm cartridge and fits beneath the short barrel. The extra forward weight slows shouldering and makes the muzzle less responsive.",
    {
        ActivateElements = { "ks23_tube_extended" },
        GivesFlags = { "ks23_extended_tube" },
        ExcludeFlags = { "ks23_bullpup", "ks23_cannon", "ks23_harpoon", "ks23_rpg7" },
        Override_UCKS23TubeExtended = true,
        Add_ClipSize = 1,
        Mult_SightTime = 1.06,
        Mult_Sway = 1.04,
        Mult_SpeedMult = 0.99,
        Hook_Compatible = function(wep)
            local a = wep.Attachments or {}
            if ks23k(wep) then
                return false
            end
            if a[3] and a[3].Installed then
                return false
            end
            local caliber = a[7] and a[7].Installed
            if
                caliber == "uc_ks23_caliber_23115"
                or caliber == "uc_ks23_caliber_harpoon"
                or caliber == "uc_ks23_caliber_rpg7"
            then
                return false
            end
        end,
    }
)

register(
    "tube_drum",
    "14-Round Drum Magazine",
    "ks23k_mag",
    "Steel drum magazine with a reinforced feed tower and a spring-driven rotary follower. Doubles the KS-23K's magazine capacity. Its broad housing and loaded weight make the weapon slower to shoulder and less steady when carried.",
    {
        ActivateElements = { "ks23k_drum" },
        RequireFlags = { "ks23_bullpup" },
        GivesFlags = { "ks23k_drum" },
        Override_UCKS23KDrum = true,
        Override_ClipSize = 14,
        Override_ClipSize_Priority = 3,
        Mult_SightTime = 1.15,
        Mult_Sway = 1.10,
        Mult_SpeedMult = 0.98,
        Hook_Compatible = function(wep)
            if not ks23k(wep) then
                return false
            end
        end,
    }
)

local function kpart(id, name, slot, description, stats)
    stats.RequireFlags = { "ks23_bullpup" }
    stats.Hook_Compatible = function(wep)
        if not ks23k(wep) then
            return false
        end
    end
    register(id, name, slot, description, stats)
end
kpart(
    "ks23k_barrel_long",
    "22.1\" KS-23K Extended Barrel",
    "ks23k_barrel",
    "Longer rifled barrel with the standard ramp sight and muzzle collar. Extends the useful reach of the cartridge and steadies the muzzle, with more weight and length forward of the receiver.",
    {
        ActivateElements = { "ks23k_barrel_long" },
        Override_UCKS23KBarrel = 2,
        Override_MuzzleEffectAttachment = 9,
        Override_MuzzleEffectAttachment_Priority = 3,
        Override_IronSightStruct_Priority = 3,
        Override_IronSightStruct = {
            Pos = Vector(-2.3375425, 2, -2.2439896),
            Ang = Angle(0.5931321, 0.0024, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
        Add_BarrelLength = 3.94,
        Mult_Range = 1.18,
        Mult_AccuracyMOA = 0.88,
        Mult_SightTime = 1.12,
        Mult_Sway = 0.94,
    }
)
kpart(
    "ks23k_barrel_vented",
    "22.1\" KS-23K Vented Barrel",
    "ks23k_barrel",
    "Extended barrel enclosed by a perforated steel jacket ahead of the sliding sleeve. The jacket protects the exposed barrel and adds muzzle weight without obstructing the action.",
    {
        ActivateElements = { "ks23k_barrel_vented" },
        Override_UCKS23KBarrel = 3,
        Override_MuzzleEffectAttachment = 9,
        Override_MuzzleEffectAttachment_Priority = 3,
        Override_IronSightStruct_Priority = 3,
        Override_IronSightStruct = {
            Pos = Vector(-2.3375425, 2, -2.2439896),
            Ang = Angle(0.5931321, 0.0024, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
        Add_BarrelLength = 3.94,
        Mult_Range = 1.15,
        Mult_AccuracyMOA = 0.90,
        Mult_SightTime = 1.16,
        Mult_RecoilSide = 0.88,
        Mult_SpeedMult = 0.985,
    }
)
kpart(
    "ks23k_barrel_suppressed",
    "18.1\" KS-23K Suppressed Barrel",
    "ks23k_barrel",
    "Coaxial expansion sleeve surrounding the muzzle, with a recessed end cap and the standard ramp sight. Reduces the report and muzzle flash while adding weight ahead of the pump.",
    {
        ActivateElements = { "ks23k_barrel_suppressed" },
        Override_UCKS23KBarrel = 4,
        GivesFlags = { "ks23_suppressed" },
        Silencer = true,
        Override_MuzzleEffectAttachment = 10,
        Override_MuzzleEffectAttachment_Priority = 3,
        Override_MuzzleEffect = "muzzleflash_suppressed",
        Add_BarrelLength = 2.60,
        Mult_ShootVol = 0.65,
        Mult_Range = 0.92,
        Mult_SightTime = 1.18,
        Mult_Sway = 1.06,
    }
)
kpart(
    "ks23k_forend_grooved",
    "KS-23K Contoured Polymer Sleeve",
    "ks23k_forend",
    "Molded polymer action sleeve with broad longitudinal channels and rounded end shoulders. Offers a firm grip without the sharp ridges of the service sleeve.",
    {
        ActivateElements = { "ks23k_forend_grooved" },
        Override_UCKS23KForend = 2,
        Mult_CycleTime = 0.94,
        Mult_RPM = 1.03,
        Mult_Sway = 1.025,
    }
)
kpart(
    "ks23k_forend_alloy",
    "KS-23K Vented Alloy Sleeve",
    "ks23k_forend",
    "Anodized alloy action sleeve with profiled gripping rails and open cooling slots. Rigid under hard cycling, though the metal sleeve carries more weight than its polymer counterpart.",
    {
        ActivateElements = { "ks23k_forend_alloy" },
        Override_UCKS23KForend = 3,
        Mult_CycleTime = 0.96,
        Mult_Sway = 0.95,
        Mult_SightTime = 1.04,
    }
)

local rpgModel = "models/johnsheppard44/caliber/weapons/launchers/clbr_wpn_rl_pg-7l heat rocket (bg).mdl"
local function rpgAvailable()
    return file
        and file.Exists(rpgModel, "GAME")
        and scripted_ents
        and scripted_ents.GetStored("arccw_ucex_rocket") ~= nil
end
register(
    "caliber_rpg7",
    "PG-7L Warhead Conversion",
    "caliber",
    "Muzzle-loaded conversion carrying a single PG-7L shaped-charge warhead on a slender launch shaft. Bypasses the tubular magazine and requires each projectile to be seated by hand. Heavy forward weight and a slow loading cycle demand deliberate handling.",
    {
        Icon = Material("entities/uc_ks23/caliber_rpg7.png", "mips smooth"),
        Model = "models/weapons/arccw/uc_ks23/pg7l_warhead.mdl",
        ModelBodygroups = "0",
        ModelScale = 1,
        GivesFlags = { "ks23_dedicated", "ks23_rpg7" },
        ExcludeFlags = { "ks23_bullpup", "ks23_extended_tube", "ks23_gas", "ks23_blank", "ks23_suppressed" },
        ActivateElements = { "ks23_shell_pv23" },
        Override_UCKS23RPG7 = true,
        Override_ShootSound = ")uc_ks23/fire_rpg.wav",
        Override_ClipSize = 1,
        Override_ClipSize_Priority = 40,
        Override_ChamberSize = 0,
        Override_Num = 1,
        Override_Damage = 170,
        Override_DamageMin = 170,
        Override_Penetration = 15,
        Override_IsShotgun = false,
        Override_ShootEntity = "arccw_ucex_rocket",
        Override_MuzzleVelocity = 5000,
        Override_MuzzleVelocity_Priority = 10,
        Override_PhysBulletMuzzleVelocity = 0,
        Override_ShotgunReload = false,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_pv23.mdl",
        Mult_Recoil = 1.4,
        Mult_SightTime = 1.25,
        Mult_SpeedMult = 0.9,
        Hook_Compatible = function(wep)
            if not rpgAvailable() then
                return false
            end
            local a = wep.Attachments or {}
            if a[3] and a[3].Installed then
                return false
            end
        end,
        Hook_ShouldNotFire = function()
            if not rpgAvailable() then
                return true
            end
        end,
        Hook_SelectReloadAnimation = function(_, anim)
            if anim == "reload" or anim == "reload_empty" then
                return "harpoon_reload"
            end
        end,
        DrawFunc = function(wep, element, world)
            local visible = wep:Clip1() > 0 and not wep:GetNeedCycle()
            if wep:GetReloading() then
                local t = (CurTime() - (wep.LastAnimStartTime or CurTime()))
                    / wep:GetBuff_Mult("Mult_ReloadTime")
                visible = not world and wep.LastAnimKey == "harpoon_reload" and t >= 0.8 and t <= 3.2
            end
            element.NoDraw = not visible or not rpgAvailable()
        end,
    }
)

register(
    "stock_kovrov",
    "Kovrov AEK-965 Conversion",
    "variant",
    "Complete Kovrov special-carbine receiver, detachable skeletal shoulder stock, ribbed pump and four-round tubular feed. Uses 23x75 mm R ammunition and a manually cycled action.",
    {
        Icon = Material("entities/uc_ks23/stock_kovrov.png", "mips smooth"),
        GivesFlags = { "ks23_prototype", "ks23_kovrov", "ks23_muzzle_incompatible" },
        Override_UCKS23Prototype = 1,
        Override_IronSightStruct = {
            Pos = Vector(-2.3389459, 0, 0.6947540),
            Ang = Angle(-0.0000000, 0.0024064, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
        Override_Trivia_Manufacturer = "Kovrov Mechanical Plant",
        Override_ClipSize = 4,
        Override_ClipSize_Priority = 20,
        Override_ChamberSize = 1,
        Override_MuzzleEffectAttachment = 11,
        Add_BarrelLength = -3.94,
        Mult_SightTime = 0.92,
        Mult_Sway = 0.97,
        Mult_CycleTime = 0.96,
    }
)
register(
    "stock_vlasov",
    "Vlasov Selective-Feed Conversion",
    "variant",
    "Complete 20-gauge experimental receiver with two independent three-round tubes, separate side and underside loading ports, and a feed selector. The upper tube carries buckshot and the lower tube carries slugs. Select the feed through the attachment toggle menu. Each tube is loaded independently; changing feeds preserves the chambered round.",
    {
        Icon = Material("entities/uc_ks23/stock_vlasov.png", "mips smooth"),
        GivesFlags = { "ks23_prototype", "ks23_vlasov", "ks23_muzzle_incompatible" },
        Override_UCKS23Prototype = 2,
        Override_IronSightStruct = {
            Pos = Vector(-2.3389459, 0, 0.6947540),
            Ang = Angle(-0.0000000, 0.0024064, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
        Override_Trivia_Manufacturer = "Tula State University",
        Override_ClipSize = 3,
        Override_ClipSize_Priority = 20,
        Override_ChamberSize = 1,
        Override_Num = 8,
        Override_Num_Priority = 20,
        Override_Damage = 18,
        Override_DamageMin = 5,
        Override_Penetration = 8,
        Override_ShellModel = "models/weapons/arccw/uc_ks23/case_20g.mdl",
        Override_Trivia_Calibre = "20/70",
        Override_Trivia_Class = "Selective-Feed Pump-Action Shotgun",
        Override_MuzzleEffectAttachment = 11,
        Mult_Recoil = 0.65,
        Mult_SightTime = 0.80,
        Mult_Sway = 1.12,
        Mult_HipDispersion = 0.85,
        Add_BarrelLength = -3.94,
        ToggleStats = {
            { PrintName = "Upper Tube (Buckshot)", Override_UCKS23VlasovFeed = 1 },
            { PrintName = "Lower Tube (Slugs)", Override_UCKS23VlasovFeed = 2 },
        },
        ToggleSound = "arccw_uc/common/rattle.ogg",
    }
)

register(
    "variant_ots28",
    "OTs-28 Conversion Kit",
    "variant",
    "Tula pump-action 23 mm carbine with a detachable five-round box magazine, a ribbed sliding forend and a steel shoulder stock that folds above the receiver.",
    {
        Icon = Material("entities/uc_ks23/variant_ots28.png", "mips smooth"),
        ExcludeFlags = { "ks23_cannon", "ks23_rpg7" },
        ActivateElements = { "ks23_ots28" },
        GivesFlags = { "ks23_prototype", "ks23_ots28", "ks23_muzzle_incompatible" },
        Override_UCKS23Prototype = 3,
        Override_ClipSize = 5,
        Override_ChamberSize = 1,
        Override_ClipSize_Priority = 20,
        Override_ShotgunReload = false,
        Override_ManualAction = true,
        Override_IronSightStruct = {
            Pos = Vector(-2.3389459, 0, 0.694754),
            Ang = Angle(0, 0.0024064, 0),
            Magnification = 1.1,
            SwitchToSound = "",
        },
        Override_Trivia_Manufacturer = "TsKIB SOO",
        Override_Trivia_Class = "Magazine-Fed Pump-Action Shotgun",
        Override_MuzzleEffectAttachment = 13,
        Add_BarrelLength = -3.94,
        Mult_SightTime = 0.92,
        Mult_Sway = 1.08,
    }
)
for _, kind in ipairs({ "kovrov", "vlasov", "ots28" }) do
    local label = kind == "kovrov" and "AEK-965" or kind == "vlasov" and "Vlasov" or "OTs-28"
    register(
        kind .. "_barrel_long",
        label .. " 19.2\" Extended Barrel",
        kind .. "_barrel",
        "Longer barrel with a fitted front-sight band. Extends useful reach at the cost of forward weight.",
        {
            Override_UCKS23BarrelChoice = 1,
            Override_MuzzleEffectAttachment = kind == "ots28" and 14 or 12,
            Mult_Range = 1.16,
            Mult_AccuracyMOA = 0.87,
            Mult_SightTime = 1.12,
            Add_BarrelLength = 3.13,
            Icon = Material("entities/uc_ks23/" .. kind .. "_barrel_long.png", "mips smooth"),
        }
    )
    register(
        kind .. "_barrel_shroud",
        label .. " 16.1\" Ventilated Barrel",
        kind .. "_barrel",
        "A vented steel heat shield around the service barrel. Its weight steadies lateral recoil.",
        {
            Override_UCKS23BarrelChoice = 2,
            Mult_RecoilSide = 0.88,
            Mult_SightTime = 1.08,
            Mult_SpeedMult = 0.99,
            Icon = Material("entities/uc_ks23/" .. kind .. "_barrel_shroud.png", "mips smooth"),
        }
    )
    register(
        kind .. "_forend_rail",
        label .. " Railed Forend",
        kind .. "_forend",
        "Reinforced sliding forend with a short mounting rail and a positive hand stop.",
        {
            Override_UCKS23ForendChoice = 1,
            Mult_CycleTime = 0.95,
            Mult_SightTime = 1.03,
            Icon = Material("entities/uc_ks23/" .. kind .. "_forend_rail.png", "mips smooth"),
        }
    )
    register(
        kind .. "_forend_alloy",
        label .. " Alloy Forend",
        kind .. "_forend",
        "Machined alloy sliding forend with recessed grip panels. Extra rigidity and mass improve control, with slightly slower cycling.",
        {
            Override_UCKS23ForendChoice = 2,
            Mult_RecoilSide = 0.93,
            Mult_CycleTime = 1.04,
            Icon = Material("entities/uc_ks23/" .. kind .. "_forend_alloy.png", "mips smooth"),
        }
    )
end
local stocks = {
    { "kovrov", "stock_pad", "Padded Skeletal Stock", 1, { Mult_Recoil = 0.9, Mult_SightTime = 1.05 } },
    {
        "kovrov",
        "stock_compact",
        "Pistol Grip",
        2,
        { Mult_Recoil = 1.55, Mult_Sway = 1.4, Mult_SightTime = 0.8 },
    },
    {
        "vlasov",
        "stock_brace",
        "Open Shoulder Stock",
        1,
        { Mult_Recoil = 0.83, Mult_Sway = 0.86, Mult_SightTime = 1.15 },
    },
    { "vlasov", "stock_target", "Palm-Shelf Grip", 2, { Mult_HipDispersion = 0.9, Mult_SightTime = 1.04 } },
    {
        "ots28",
        "stock_extended",
        "Extended Shoulder Stock",
        1,
        { Mult_Recoil = 0.85, Mult_Sway = 0.88, Mult_SightTime = 1.12 },
    },
    {
        "ots28",
        "stock_compact",
        "Stock Removed",
        2,
        { Mult_Recoil = 1.5, Mult_Sway = 1.4, Mult_SightTime = 0.82 },
    },
}
for _, v in ipairs(stocks) do
    local stats = v[5]
    stats.Override_UCKS23StockChoice = v[4]
    stats.Icon = Material("entities/uc_ks23/" .. v[1] .. "_" .. v[2] .. ".png", "mips smooth")
    register(
        v[1] .. "_" .. v[2],
        v[3],
        v[1] .. "_stock",
        "Alternative rear furniture fitted to this receiver.",
        stats
    )
end
for i, name in ipairs({ "pad", "hook" }) do
    register(
        "ks23k_support_" .. name,
        i == 1 and "KS-23K Recoil Pad" or "KS-23K Hooked Shoulder Support",
        "ks23k_stock",
        "A fitted rear support for the bullpup receiver, with a textured elastomer shoulder pad.",
        {
            Model = "models/weapons/arccw/uc_ks23/ks23k_support_" .. name .. ".mdl",
            DrawFunc = variantModel,
            ModelScale = 1,
            Mult_Recoil = i == 1 and 0.94 or 0.90,
            Mult_Sway = i == 1 and 0.98 or 0.92,
            Mult_SightTime = i == 1 and 1.02 or 1.06,
            Icon = Material("entities/uc_ks23/ks23k_support_" .. name .. ".png", "mips smooth"),
        }
    )
end
register(
    "ots28_mag_drum",
    "12-Round Drum Magazine",
    "ots28_mag",
    "Fictional large-capacity drum for the OTs-28. Adds bulk and weight, and takes longer to replace than the standard five-round box.",
    {
        Override_ClipSize = 12,
        Override_ClipSize_Priority = 30,
        Override_UCKS23OTsDrum = true,
        Mult_SightTime = 1.18,
        Mult_Sway = 1.12,
        Mult_SpeedMult = 0.96,
        Icon = Material("entities/uc_ks23/ots28_mag_drum.png", "mips smooth"),
    }
)
