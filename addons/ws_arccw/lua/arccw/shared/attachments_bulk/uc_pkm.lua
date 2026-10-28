local function nativeDetail(wep, element, wm)
    if not CLIENT then
        return
    end
    local owner = wep:GetOwner()
    local parent = wm and wep.WMModel or (IsValid(owner) and owner:GetViewModel())
    local model = element.Model
    if not IsValid(parent) or not IsValid(model) then
        return
    end
    local sourceBone = parent:LookupBone("body")
    local bodyMatrix = sourceBone and parent:GetBoneMatrix(sourceBone)
    if not bodyMatrix then
        return
    end
    model:RemoveEffects(EF_BONEMERGE)
    if model:GetParent() ~= wep then
        model:SetParent(wep)
    end
    if not model.PKMDetailBodyCallback then
        model.PKMDetailBodyCallback = model:AddCallback("BuildBonePositions", function(detail)
            local bone = detail:LookupBone("body")
            if bone and detail.PKMDetailBodyMatrix then
                detail:SetBoneMatrix(bone, Matrix(detail.PKMDetailBodyMatrix))
            end
        end)
    end
    model.PKMDetailBodyMatrix = Matrix(bodyMatrix)
    model.PKMDetailDriver = parent
    model:InvalidateBoneCache()
    model:SetupBones()
end
local function topFeedDetail(wep, element, wm)
    nativeDetail(wep, element, wm)
    local model = element.Model
    if not IsValid(model) or not model.PKMDetailBodyMatrix then
        return
    end
    model:SetBodygroup(0, wep:PKMTopFeedBodygroup())
    local parent = model.PKMDetailDriver
    local reloading = wep:GetReloading() and (wep.LastAnimKey or ""):find("type73")
    local bone = parent:LookupBone("mag")
    if reloading and bone then
        model.PKMTopMagazineMatrix = parent:GetBoneMatrix(bone)
    else
        local offset = Matrix()
        offset:SetTranslation(Vector(0.498068, -2.032072, 0.079070))
        model.PKMTopMagazineMatrix = model.PKMDetailBodyMatrix * offset
    end
    if not model.PKMTopMagazineCallback then
        model.PKMTopMagazineCallback = model:AddCallback("BuildBonePositions", function(detail)
            local mag = detail:LookupBone("mag")
            if mag and detail.PKMTopMagazineMatrix then
                detail:SetBoneMatrix(mag, Matrix(detail.PKMTopMagazineMatrix))
            end
        end)
    end
    model:InvalidateBoneCache()
    model:SetupBones()
end
local function hingeTransform(pivot, degrees)
    local r = math.rad(degrees)
    local c, sn = math.cos(r), math.sin(r)
    local result = Matrix()
    result:SetAngles(Angle(0, 0, degrees))
    result:SetTranslation(Vector(0, pivot.y * (1 - c) + pivot.z * sn, pivot.z * (1 - c) - pivot.y * sn))
    return result
end
local stockPivot = Vector(-0.063214000, 1.368010113, -9.524376744)
local platePivot = Vector(-0.063214000, 3.654407675, -1.365008435)
local function topFoldDetail(wep, element, wm)
    nativeDetail(wep, element, wm)
    local model = element.Model
    if not IsValid(model) or not model.PKMDetailBodyMatrix then
        return
    end
    local parent = model.PKMDetailDriver
    local coverBone = IsValid(parent) and parent:LookupBone("topcover")
    local cover = coverBone and parent:GetBoneMatrix(coverBone)
    local coverOpen = cover and model.PKMDetailBodyMatrix:GetUp():Dot(cover:GetUp()) < 0.995
    local folded = wep.Attachments[9].ToggleNum == 2
    local target = folded and not wep:GetReloading() and not coverOpen and 1 or 0
    if model.PKMStockFraction == nil then
        model.PKMStockFraction = target
    end
    if model.PKMStockFrame ~= FrameNumber() then
        model.PKMStockFraction =
            math.Approach(model.PKMStockFraction, target, math.min(FrameTime(), 0.05) / 0.32)
        model.PKMStockFrame = FrameNumber()
    end
    local f = model.PKMStockFraction
    model.PKMStockEase = f * f * (3 - 2 * f)
    model.PKMStockExtendedMesh = model:GetBodygroup(1) == 0
    if not model.PKMStockCallback then
        model.PKMStockCallback = model:AddCallback("BuildBonePositions", function(detail)
            if not detail.PKMDetailBodyMatrix or detail.PKMStockEase == nil then
                return
            end
            local amount = 1 - detail.PKMStockEase
            local arm = hingeTransform(stockPivot, -160 * amount)
            local plate = arm * hingeTransform(platePivot, -110 * amount)
            if detail.PKMStockExtendedMesh then
                arm = arm * hingeTransform(stockPivot, 160)
                plate = plate * hingeTransform(platePivot, 110) * hingeTransform(stockPivot, 160)
            end
            local armBone = detail:LookupBone("pkm_tf_arm")
            local plateBone = detail:LookupBone("pkm_tf_plate")
            if armBone then
                detail:SetBoneMatrix(armBone, detail.PKMDetailBodyMatrix * arm)
            end
            if plateBone then
                detail:SetBoneMatrix(plateBone, detail.PKMDetailBodyMatrix * plate)
            end
        end)
    end
    model:InvalidateBoneCache()
    model:SetupBones()
end
local function load(id, att)
    att.AutoStats = true
    local caliberIcons = {
        ["uc_pkm_caliber_762nato"] = "entities/att/uc_bullets/762x51.png",
        ["uc_pkm_caliber_556"] = "entities/att/uc_bullets/556x45.png",
        ["uc_pkm_caliber_9mm"] = "entities/att/uc_bullets/9x19.png",
        ["uc_pkm_caliber_366tkm"] = "entities/att/uc_bullets/762x39.png",
        ["uc_pkm_caliber_12g"] = "entities/att/uc_bullets/12g.png",
    }
    att.Icon = Material(caliberIcons[id] or ("entities/" .. id .. ".png"), "mips smooth")
    ArcCW.LoadAttachmentType(att, id)
end
load("uc_pkm_barrel_pkp", {
    PrintName = "25.9\" Pecheneg Barrel",
    Slot = "uc_pkm_barrel",
    Description = "Heavy shrouded barrel with forced-air cooling. Holds its grouping through long bursts, but adds weight at the front.\n\nDeveloped by TsNIItochmash as a modernization of the PKM, the Pecheneg was designed for more sustained fire. Its barrel jacket and muzzle ejector draw cooling air along the barrel, while much of the original PKM mechanism is retained.",
    ActivateElements = { "pkm_pkp" },
    GivesFlags = { "pkm_pkp" },
    Mult_AccuracyMOA = 0.75,
    Mult_Recoil = 0.92,
    Mult_Sway = 1.18,
    Mult_HeatCapacity = 1.45,
    Mult_HeatDissipation = 1.35,
    Override_MuzzleEffectAttachment = 1,
    Mult_SightTime = 1.15,
    Mult_SpeedMult = 0.96,
    Mult_HipDispersion = 1.12,
})
load("uc_pkm_barrel_aek", {
    PrintName = "25.9\" BMS Suppressed Barrel",
    Slot = "uc_pkm_barrel",
    Description = "An AEK-999-pattern low-noise barrel and suppressor assembly. Reduces the report and steadies the muzzle; trapped heat causes progressively wider groups and a slower cycle during prolonged fire.",
    ActivateElements = { "pkm_aek" },
    GivesFlags = { "pkm_aek" },
    ExcludeFlags = { "pkm_grip" },
    Silencer = true,
    SDBarrel = true,
    Override_MuzzleEffect = "muzzleflash_suppressed",
    Override_MuzzleEffectAttachment = 6,
    Mult_ShootVol = 0.55,
    Mult_Recoil = 0.86,
    Mult_RPM = 0.92,
    Mult_HeatCapacity = 0.65,
    Mult_HeatDissipation = 0.8,
    Mult_SightTime = 1.14,
    Mult_SpeedMult = 0.96,
    Add_BarrelLength = 6,
})
load("uc_pkm_furniture_polymer", {
    PrintName = "Black Polymer Furniture",
    Slot = "uc_pkm_furniture",
    Description = "Molded stock, grip and carry handle with a durable matte finish. Saves a little weight without changing the action.",
    ActivateElements = { "pkm_poly" },
    Mult_SpeedMult = 1.02,
    Mult_SightTime = 0.96,
    Mult_Recoil = 1.03,
})
load("uc_pkm_furniture_zenit", {
    PrintName = "Zenitco Tactical Furniture",
    Slot = "uc_pkm_furniture",
    Description = "Adjustable skeletal stock and modern grip. Better cheek support and balance while tracking a target, at the cost of additional hardware.",
    ActivateElements = { "pkm_zenit" },
    Mult_Sway = 0.8,
    Mult_SightedSpeedMult = 1.15,
    Mult_SightTime = 0.95,
    Mult_SpeedMult = 0.98,
})
load("uc_pkm_furniture_bullpup", {
    PrintName = "PKP BP Bullpup Conversion",
    Slot = "uc_pkm_furniture",
    Description = "A forward trigger linkage and shoulder pad shorten the weapon without shortening its barrel. Includes a PKP carry handle, forward optics rail, folding sights and integrated foregrip; the rearward feed cover and box make reloads less accessible.\n\nThe compact Pecheneg bullpup concept rearranges the familiar Kalashnikov machine-gun layout around a forward grip. Its unusual side-mounted ammunition box helps accommodate the action beside the shooter's shoulder.",
    ActivateElements = { "pkm_bp" },
    GivesFlags = { "pkm_bp" },
    ExcludeFlags = {
        "pkm_topfeed",
        "pkm_cover",
        "pkm_bipod_removed",
        "pkm_pkp",
        "pkm_aek",
        "pkm_short",
        "pkm_pkt",
        "pkm_ultra",
        "pkm_mg1ms",
    },
    Add_BarrelLength = -8,
    Mult_SpeedMult = 1.06,
    Mult_HipDispersion = 0.78,
    Mult_Recoil = 0.9,
    Mult_RecoilSide = 1.15,
    Mult_ReloadTime = 1.16,
    Mult_SightTime = 1.08,
    Override_AutosolveSourceSeq = "optic_reference_bp",
    Override_IronSightStruct = {
        Pos = Vector(-3.525283, -3.500000, 0.250838),
        Ang = Angle(0.148568, 0.000567, 0.000000),
        Magnification = 1.1,
    },
})
load("uc_pkm_box_small", {
    PrintName = "50-Round Soft Belt Box",
    Slot = "uc_pkm_box",
    Description = "A shorter fabric belt container reduces bulk beneath the receiver. Carries a 50-round belt and conceals the enclosed lower links.",
    Override_ClipSize = 50,
    Mult_SpeedMult = 1.025,
    Mult_SightTime = 0.97,
})
load("uc_pkm_cover_rail", {
    PrintName = "B-51 Railed Top Cover",
    Slot = "uc_pkm_cover",
    Description = "A B-51 rail fitted to the hinged feed cover provides a mounting surface for optics above the receiver. Adds a small amount of weight high on the weapon; the cover must still be opened for loading and clearing the feed tray.",
    ActivateElements = { "pkm_rail" },
    GivesFlags = { "pkm_cover" },
    ExcludeFlags = { "pkm_bp" },
    Mult_SightTime = 1.025,
})
load("uc_pkm_bipod_none", {
    PrintName = "Remove Bipod",
    Slot = "uc_pkm_bipod",
    Description = "Remove the folding legs for a lighter weapon. Sacrifices the PKM's most effective firing support.",
    GivesFlags = { "pkm_bipod_removed" },
    ExcludeFlags = { "pkm_bp" },
    Mult_SpeedMult = 1.02,
    Mult_SightTime = 0.96,
})
load("uc_pkm_handguard", {
    PrintName = "Insulated Handguard",
    Slot = "uc_pkm_handguard",
    Description = "Protective fore-end around the gas tube. Improves handling off the bipod; occupies the support-hand position.",
    ActivateElements = { "pkm_hg" },
    GivesFlags = { "pkm_grip" },
    ExcludeFlags = { "pkm_bp", "pkm_aek" },
    Mult_HipDispersion = 0.9,
    Mult_Sway = 0.92,
    Mult_SightTime = 0.98,
})
load("uc_pkm_gas_low", {
    PrintName = "Gas Position 1: Reduced",
    Slot = "uc_pkm_gas",
    Description = "Reduce piston drive for a gentler cycle. Slows the belt's advance and reduces the heat generated per second.",
    Mult_RPM = 0.85,
    Mult_Recoil = 0.87,
    Mult_RecoilSide = 0.9,
})
load("uc_pkm_gas_adverse", {
    PrintName = "Gas Position 3: Adverse",
    Slot = "uc_pkm_gas",
    Description = "More gas to the piston for a forceful cycle in adverse conditions. Higher cyclic rate comes with sharper recoil and faster heating.",
    Mult_RPM = 1.12,
    Mult_Recoil = 1.16,
    Mult_RecoilSide = 1.13,
    Mult_HeatGain = 1.12,
})

load("uc_pkm_caliber_762nato", {
    Override_ShootSound = "uc_pkm_new/fire_308.wav",
    Override_ShootSoundSilenced = "uc_pkm_new/fire_308_sup.wav",
    PrintName = "7.62x51mm NATO Conversion",
    Slot = "uc_pkm_caliber",
    Description = "Prototype replacement barrel, bolt face and purpose-built belt-feed parts for rimless NATO ammunition. Retains the PKM's pull-out feed cycle. A less forceful load reduces recoil and cyclic heating, at the cost of long-range damage and penetration.",
    Override_Trivia_Calibre = "7.62x51mm NATO",
    Mult_Damage = 0.94,
    Mult_DamageMin = 0.9,
    Mult_Penetration = 0.9,
    Mult_Recoil = 0.92,
    Mult_RecoilSide = 0.94,
    Mult_HeatGain = 0.92,
    Override_PhysBulletMuzzleVelocity = 800,
    Override_ShellModel = "models/weapons/arc9/uplp/shells/shell_762.mdl",
})

load("uc_pkm_caliber_556", {
    Override_ShootSound = "uc_pkm_new/fire_556.wav",
    Override_ShootSoundSilenced = "uc_pkm_new/fire_sup_556.wav",
    PrintName = "5.56x45mm Feed Conversion",
    Slot = "uc_pkm_caliber",
    Description = "Experimental replacement bolt, barrel and linked feed assembly for an intermediate cartridge. A lighter impulse makes long bursts easier to steer, but gives up the original load's reach and authority. Compatible with the standard and forward-trigger bodies.",
    Override_Trivia_Calibre = "5.56x45mm NATO",
    Override_Ammo = "smg1",
    Mult_Damage = 36 / 68,
    Mult_DamageMin = 20 / 38,
    Mult_Penetration = 11 / 19,
    Mult_Recoil = 0.58,
    Mult_RecoilSide = 0.65,
    Mult_HeatGain = 0.7,
    Mult_RPM = 1.12,
    Override_PhysBulletMuzzleVelocity = 900,
    Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl",
    Override_ShellScale = 1,
})
load("uc_pkm_caliber_9mm", {
    Override_ShootSound = "uc_pkm_new/fire_9mm.wav",
    Override_ShootSoundSilenced = "uc_pkm_new/fire_9mm_sup.wav",
    PrintName = "9x19mm Feed Conversion",
    Slot = "uc_pkm_caliber",
    Description = "Experimental pistol-cartridge barrel, bolt and short-round feed parts. The mild impulse is easy to keep on target, while reduced cyclic speed helps the feed mechanism handle the shorter round. Limited reach and poor barrier performance make it a close-range conversion.",
    Override_Trivia_Calibre = "9x19mm Parabellum",
    Override_Ammo = "pistol",
    Mult_Damage = 30 / 68,
    Mult_DamageMin = 12 / 38,
    Mult_Penetration = 5 / 19,
    Mult_Range = 0.42,
    Mult_Recoil = 0.35,
    Mult_RecoilSide = 0.42,
    Mult_HeatGain = 0.5,
    Mult_RPM = 0.85,
    Override_PhysBulletMuzzleVelocity = 400,
    Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl",
    Override_ShellScale = 1,
})
load("uc_pkm_caliber_366tkm", {
    Override_ShootSound = "uc_pkm_new/fire_366tkm.wav",
    Override_ShootSoundSilenced = "uc_pkm_new/fire_366tkm_sup.wav",
    PrintName = ".366 TKM Feed Conversion",
    Slot = "uc_pkm_caliber",
    Description = "Experimental heavy-projectile conversion with its own barrel, bolt face and belt parts. A harder close-range hit comes with a slower cycle, more recoil and less useful reach. The large projectile does not replace the original rifle cartridge's penetration.",
    Override_Trivia_Calibre = ".366 TKM",
    Override_Ammo = "ar2",
    Mult_Damage = 78 / 68,
    Mult_DamageMin = 25 / 38,
    Mult_Penetration = 10 / 19,
    Mult_Range = 0.65,
    Mult_Recoil = 1.15,
    Mult_RecoilSide = 1.1,
    Mult_HeatGain = 1.08,
    Mult_RPM = 0.8,
    Override_PhysBulletMuzzleVelocity = 600,
    Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl",
    Override_ShellScale = 1,
})
load("uc_pkm_caliber_12g", {
    Override_ShootSound = "uc_pkm_new/fire_12g.wav",
    Override_ShootSoundSilenced = "uc_pkm_new/fire_sup_12g.wav",
    PrintName = "12-Gauge Feed Conversion",
    Slot = "uc_pkm_caliber",
    Description = "Experimental shotgun barrel, bolt and shell-length feed assembly. Eight-pellet buckshot rewards close-range bursts; wide dispersion, heavy recoil and a deliberately slower cycle sharply limit its use farther out. Retains the same belt boxes and both body configurations.",
    Override_Trivia_Calibre = "12 Gauge",
    Override_Ammo = "buckshot",
    Override_IsShotgun = true,
    Override_Num = 8,
    Mult_Damage = 120 / 68,
    Mult_DamageMin = 24 / 38,
    Override_Penetration = 1,
    Mult_Range = 0.3,
    Override_AccuracyMOA = 28,
    Mult_Recoil = 1.5,
    Mult_RecoilSide = 1.25,
    Mult_HeatGain = 1.3,
    Mult_RPM = 0.65,
    Override_PhysBulletMuzzleVelocity = 400,
    Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun,
    Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl",
    Override_ShellScale = 1,
    Override_ShellSounds = ArcCW.ShotgunShellSoundsTable,
    Hook_GetDefaultAttName = function(wep, slot)
        if slot == 9 then
            return "00 Buckshot"
        end
    end,
})

load("uc_pkm_box_medium", {
    PrintName = "100-Round Compact Belt Box",
    Slot = "uc_pkm_box",
    Description = "A compact steel belt container for mobile fire. Halves the standard load and keeps the weapon easier to shoulder.",
    Override_ClipSize = 100,
    Mult_SpeedMult = 1.015,
    Mult_SightTime = 0.98,
    Mult_ReloadTime = 0.96,
})
load("uc_pkm_box_250", {
    PrintName = "250-Round Extended Belt Box",
    Slot = "uc_pkm_box",
    Description = "An extended belt container for sustained fire from a fixed position. Fifty extra rounds add bulk and slow handling and box changes.",
    Override_ClipSize = 250,
    Mult_SpeedMult = 0.975,
    Mult_SightTime = 1.06,
    Mult_ReloadTime = 1.08,
})

load("uc_pkm_furniture_romanian", {
    PrintName = "Romanian Paratrooper Furniture",
    AbbrevName = "Romanian Folding Kit",
    Slot = "uc_pkm_furniture",
    Description = "Experimental Romanian tubular side-folding stock with a laminated wooden butt and steel shoulder plate. Folds forward along the receiver's right side for transport.\n\nCugir developed the paratrooper variant in the 1990s, pairing this distinctive stock with a shorter barrel. Romanian airborne and special-operations units tested it but placed no orders. Only 400 were reportedly made, all sold for export.",
    ActivateElements = { "pkm_ro" },
    GivesFlags = { "pkm_ro" },
    ExcludeFlags = { "pkm_aek" },
    ToggleStats = {
        { PrintName = "Extended", ActivateElements = { "pkm_ro_extended" }, AutoStats = true },
        {
            PrintName = "Folded",
            ActivateElements = { "pkm_ro_folded" },
            AutoStats = true,
            Add_BarrelLength = -10,
            Mult_Recoil = 1.22,
            Mult_RecoilSide = 1.16,
            Mult_Sway = 1.2,
            Mult_SightTime = 0.93,
        },
    },
})

load("uc_pkm_box_fde", {
    PrintName = "200-Round FDE Steel Box",
    Slot = "uc_pkm_box",
    Description = "A 200-round steel belt box with a fde painted finish.",
    AutoStats = true,
    Override_ClipSize = 200,
})

load("uc_pkm_box_charcoal", {
    PrintName = "200-Round Charcoal Steel Box",
    Slot = "uc_pkm_box",
    Description = "A 200-round steel belt box with a charcoal painted finish.",
    AutoStats = true,
    Override_ClipSize = 200,
})

load("uc_pkm_furniture_m84", {
    PrintName = "Zastava M84 Wooden Furniture",
    Slot = "uc_pkm_furniture",
    Description = "A solid wooden buttstock patterned after the Zastava M84, with a steel shoulder plate and dark polymer pistol grip.\n\nZastava's Yugoslav-produced M84 belongs to the PKM family. Its solid wooden stock is a recognizable departure from the Soviet gun's open stock profile. The full-size M84 retains the 7.62x54mmR cartridge and can serve on its bipod or a tripod mount.",
    ActivateElements = { "pkm_m84" },
    Mult_Sway = 0.96,
})
load("uc_pkm_furniture_type73", {
    PrintName = "Type 73 Wooden Furniture",
    Slot = "uc_pkm_furniture",
    Description = "Broad wooden buttstock and pistol grip patterned after the Type 73, with a steel mounting socket and shoulder plate.\n\nNorth Korea adopted the PK-derived Type 73 in 1973. Its unusual Czech-influenced feed system accepts either a belt or a proprietary top-mounted 30-round magazine. The magazine feeds cartridges rearward to suit the PK's pull-out extraction system; the broad stock provides a substantial shoulder contact surface.",
    ActivateElements = { "pkm_type73" },
    Mult_Sway = 0.95,
})

load("uc_pkm_barrel_short", {
    PrintName = "21.9\" Short PKM Barrel",
    Slot = "uc_pkm_barrel",
    Description = "A shortened version of the standard PKM barrel, retaining its original muzzle device and front sight. Four inches removed from the forward barrel improve handling at the cost of muzzle velocity and heat capacity.",
    ActivateElements = { "pkm_short" },
    GivesFlags = { "pkm_short" },
    ExcludeFlags = { "pkm_bp" },
    Override_MuzzleEffectAttachment = 7,
    Add_BarrelLength = -4,
    Mult_PhysBulletMuzzleVelocity = 0.92,
    Mult_Range = 0.9,
    Mult_HeatCapacity = 0.85,
    Mult_SightTime = 0.92,
    Mult_Sway = 0.92,
    Mult_HipDispersion = 0.9,
    Mult_Recoil = 1.07,
})
load("uc_pkm_furniture_stockless", {
    PrintName = "Stockless Receiver End Plate",
    AbbrevName = "Stockless",
    Slot = "uc_pkm_furniture",
    Description = "Removes the buttstock while retaining the standard pistol grip. A fitted, chamfered steel plate closes the rear receiver opening. Easier to maneuver, but losing shoulder support makes recoil and sighted fire harder to control.",
    ActivateElements = { "pkm_stockless" },
    GivesFlags = { "pkm_stockless" },
    Mult_SpeedMult = 1.025,
    Mult_SightTime = 0.87,
    Mult_Sway = 1.4,
    Mult_Recoil = 1.35,
    Mult_RecoilSide = 1.2,
    Mult_HipDispersion = 1.15,
})

load("uc_pkm_gas_overclocked", {
    PrintName = "Gas Position 4: Overclocked",
    AbbrevName = "Overclocked Gas Regulator",
    Slot = "uc_pkm_gas",
    Description = "A non-standard high-flow regulator drives the action well beyond the normal adverse setting. Greatly increases cyclic rate, but the harsher cycle brings stronger recoil, wider shot dispersion and faster heating.",
    Mult_RPM = 1.4,
    Mult_Recoil = 1.45,
    Mult_RecoilSide = 1.35,
    Mult_AccuracyMOA = 1.25,
    Mult_HipDispersion = 1.3,
    Mult_HeatGain = 1.4,
})

load("uc_pkm_barrel_pkt", {
    PrintName = "28.4\" PKT Heavy Barrel",
    AbbrevName = "28.4\" PKT Barrel",
    Slot = "uc_pkm_barrel",
    Description = "A PKT-pattern long, heavy barrel with longitudinal cooling flutes, reinforced gas-block fittings and a slotted flash hider. This handheld adaptation retains the PKM's manual trigger, stock and carry handle. Greater heat capacity and sustained-fire stability come with slower handling and more forward weight.\n\nThe original PKT is a coaxial tank machine gun with an electric trigger and no shoulder stock; a manual trigger and shoulder stock make the infantry configuration suitable for dismounted use.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_pkt.mdl",
    DrawFunc = nativeDetail,
    ModelScale = 1,
    ActivateElements = { "pkm_pkt" },
    GivesFlags = { "pkm_pkt" },
    ExcludeFlags = { "pkm_bp" },
    Override_MuzzleEffectAttachment = 8,
    Add_BarrelLength = 2.5,
    Mult_HeatCapacity = 1.65,
    Mult_HeatDissipation = 1.12,
    Mult_Recoil = 0.90,
    Mult_AccuracyMOA = 0.85,
    Mult_PhysBulletMuzzleVelocity = 1.025,
    Mult_SightTime = 1.18,
    Mult_Sway = 1.15,
    Mult_SpeedMult = 0.97,
})
load("uc_pkm_furniture_telescopic", {
    PrintName = "Telescopic Polymer Furniture",
    AbbrevName = "Telescopic Stock",
    Slot = "uc_pkm_furniture",
    Description = "A contoured polymer shoulder stock on a steel telescoping slide. A drilled detent track and pivoting release lever lock the length; the shaped cheek surface and textured rubber buttpad provide shoulder support. Retracting the stock shortens the weapon while reducing stability. Includes the standard polymer pistol grip.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_telescopic.mdl",
    DrawFunc = nativeDetail,
    ModelScale = 1,
    ModelBodygroups = "00",
    ActivateElements = { "pkm_tel" },
    ExcludeFlags = { "pkm_bp" },
    ToggleStats = {
        {
            PrintName = "Extended",
            ModelBodygroups = "00",
            ActivateElements = { "pkm_tel_extended" },
            Mult_Sway = 0.88,
            Mult_Recoil = 0.96,
            AutoStats = true,
        },
        {
            PrintName = "Retracted",
            ModelBodygroups = "01",
            ActivateElements = { "pkm_tel_retracted" },
            Mult_SightTime = 0.92,
            Mult_Recoil = 1.12,
            Mult_Sway = 1.15,
            Add_BarrelLength = -2.6,
            AutoStats = true,
        },
    },
})

load("uc_pkm_furniture_sidegrip", {
    PrintName = "Sideways Grip Furniture",
    Slot = "uc_pkm_furniture",
    Description = "An experimental sideways pistol grip and trigger guard with the standard polymer stock. The lateral grip changes wrist alignment while retaining the standard firing mechanism.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_sidegrip.mdl",
    ModelScale = 1,
    DrawFunc = nativeDetail,
    ActivateElements = { "pkm_sidegrip" },
    GivesFlags = { "pkm_sidegrip" },
    ExcludeFlags = { "pkm_bp" },
})

load("uc_pkm_barrel_ultra", {
    PrintName = "12.9\" Ultra-Short PKM Barrel",
    Slot = "uc_pkm_barrel",
    Description = "A radically shortened standard PKM barrel and gas assembly with its original sight and a plain bored muzzle crown. Removes the bipod and its mounting shoe. Much easier to handle in close quarters, with lower velocity, greater muzzle disturbance and less thermal mass.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_ultra.mdl",
    ModelScale = 1,
    DrawFunc = nativeDetail,
    ActivateElements = { "pkm_ultra" },
    GivesFlags = { "pkm_ultra" },
    ExcludeFlags = { "pkm_bp" },
    Override_MuzzleEffectAttachment = 9,
    Add_BarrelLength = -14.75,
    Mult_SightTime = 0.80,
    Mult_Sway = 0.80,
    Mult_SpeedMult = 1.03,
    Mult_ShootSpeedMult = 1.06,
    Mult_PhysBulletMuzzleVelocity = 0.72,
    Mult_Recoil = 1.15,
    Mult_AccuracyMOA = 1.20,
    Mult_HeatCapacity = 0.62,
})
load("uc_pkm_furniture_topfold", {
    PrintName = "Top-Folding Steel Stock",
    Slot = "uc_pkm_furniture",
    Description = "A steel folding stock with curved pressed arms, a rear locking hinge and an independently hinged buttplate. Extended, the buttplate stands upright for shoulder support. Folded, the arms lie above the receiver and the buttplate folds flat. The hinged arms can be raised to allow access to the feed cover. Includes the standard polymer pistol grip; the folding path requires a clear receiver top.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_topfold.mdl",
    ModelScale = 1,
    DrawFunc = topFoldDetail,
    ModelBodygroups = "00",
    ActivateElements = { "pkm_topfold" },
    ExcludeFlags = { "pkm_bp", "pkm_cover", "pkm_optic" },
    ToggleStats = {
        {
            PrintName = "Extended",
            ModelBodygroups = "00",
            ActivateElements = { "pkm_topfold_extended" },
            Mult_Recoil = 0.92,
            Mult_Sway = 0.90,
            AutoStats = true,
        },
        {
            PrintName = "Folded",
            ModelBodygroups = "01",
            ActivateElements = { "pkm_topfold_folded" },
            Mult_Recoil = 1.20,
            Mult_Sway = 1.20,
            Mult_SightTime = 0.90,
            Add_BarrelLength = -7.5,
            AutoStats = true,
        },
    },
})

load("uc_pkm_barrel_mg1ms", {
    PrintName = "25.9\" MG-1MS Fluted Barrel",
    Slot = "uc_pkm_barrel",
    Description = "Heavy barrel with deep longitudinal flutes and repeated scalloped cuts along their lips. Retains the standard PKM muzzle brake, front sight and barrel interfaces. The heavier profile improves sustained-fire stability at the cost of handling speed.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_mg1ms.mdl",
    ModelScale = 1,
    DrawFunc = nativeDetail,
    ActivateElements = { "pkm_mg1ms" },
    GivesFlags = { "pkm_mg1ms" },
    ExcludeFlags = { "pkm_bp" },
    Override_MuzzleEffectAttachment = 1,
    Mult_HeatCapacity = 1.20,
    Mult_HeatDissipation = 1.12,
    Mult_AccuracyMOA = 0.90,
    Mult_SightTime = 1.08,
    Mult_Sway = 1.08,
    Mult_SpeedMult = 0.98,
})

load("uc_pkm_mag_type73", {
    PrintName = "30-Round Type 73 Magazine",
    Slot = "uc_pkm_box",
    Description = "A curved 30-round top-mounted magazine with a dedicated feed housing and release paddle. Reduces carried ammunition and speeds magazine changes. Requires a clear receiver top and is incompatible with the bullpup conversion.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_type73_feed.mdl",
    ModelScale = 1,
    DrawFunc = topFeedDetail,
    ActivateElements = { "pkm_topfeed" },
    GivesFlags = { "pkm_topfeed" },
    ExcludeFlags = { "pkm_bp", "pkm_cover", "pkm_optic" },
    Override_ClipSize = 30,
    Override_ClipSize_Priority = 100,
    Override_ChamberSize = 0,
    Mult_SightTime = 0.93,
    Mult_ReloadTime = 1,
})

load("uc_pkm_furniture_d7ln", {
    PrintName = "D7LN Polymer Furniture",
    AbbrevName = "D7LN Polymer Stock",
    Slot = "uc_pkm_furniture",
    Description = "Vietnamese D7LN-style polymer furniture with a raised, bent upper stock frame and an open central aperture. Retains the PKM mounting interface, steel buttplate, sling fitting and standard pistol-grip placement. The molded surface provides a durable, lightly textured finish.",
    Model = "models/weapons/arccw/uc_pkm_user/detail_d7ln.mdl",
    ModelScale = 1,
    DrawFunc = nativeDetail,
    ActivateElements = { "pkm_d7ln" },
    ExcludeFlags = { "pkm_bp" },
    Mult_SightTime = 0.98,
    Mult_Sway = 0.96,
})
