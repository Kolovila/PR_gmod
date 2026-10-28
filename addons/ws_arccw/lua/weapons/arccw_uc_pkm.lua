AddCSLuaFile()
SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "PKM"
SWEP.Trivia_Class = "General-Purpose Machine Gun"
SWEP.Trivia_Desc =
    [[A stamped-steel workhorse that puts a full-power rifle cartridge into a surprisingly light package. The PKM feeds rimmed ammunition from a reusable metal belt, pulling each round out of its link before sending it into the chamber. Its plain furniture and exposed mechanism favor easy service over comfort.

Lighter on the march than its Western counterparts, but less forgiving when fired on the move. Plant the bipod and use measured bursts to keep the long barrel working for you. An adjustable gas regulator trades a gentler cycle for extra drive; a Pecheneg barrel, tactical furniture, and a compact bullpup kit give the same action very different jobs.]]
SWEP.Trivia_Manufacturer = "V. A. Degtyaryov Plant"
SWEP.Trivia_Calibre = "7.62x54mmR"
SWEP.Trivia_Mechanism = "Gas-Operated, Long-Stroke Piston, Open Bolt"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1969
SWEP.Slot = 2
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/arccw/uc_pkm_user/c_uc_pkm_user.mdl"
SWEP.WorldModel = "models/weapons/arccw/uc_pkm_user/w_uc_pkm_user.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = { pos = Vector(-11, 3, -2), ang = Angle(-12, 0, 180) }
SWEP.ViewModelFOV = 70
SWEP.DefaultBodygroups = "000000000010010"
SWEP.DefaultWMBodygroups = "000000000010010"
SWEP.DefaultPoseParams = { sights = 0 }
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.Damage = 68
SWEP.DamageMin = 38
SWEP.Penetration = 19
SWEP.Range = 135
SWEP.DamageType = DMG_BULLET
SWEP.PhysBulletMuzzleVelocity = 825
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 200
SWEP.Primary.DefaultClip = 200
SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "pkm"
SWEP.Delay = 60 / 650
SWEP.Num = 1
SWEP.Firemodes = { { Mode = 2 }, { Mode = 0 } }
SWEP.TriggerDelay = true
SWEP.TriggerDelayTime = 0.065
SWEP.Recoil = 0.48
SWEP.RecoilSide = 0.29
SWEP.RecoilRise = 0.12
SWEP.RecoilPunch = 3.5
SWEP.AccuracyMOA = 5.2
SWEP.HipDispersion = 540
SWEP.MoveDispersion = 295
SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.47
SWEP.ShootSpeedMult = 0.47
SWEP.SightTime = 0.48
SWEP.Sway = 1.35
SWEP.BarrelLength = 35
SWEP.ReloadInSights = false
SWEP.Bipod_Integral = true
SWEP.BipodRecoil = 0.16
SWEP.BipodDispersion = 0.15
SWEP.Jamming = true
SWEP.HeatCapacity = 165
SWEP.HeatDissipation = 8
SWEP.HeatDelayTime = 1.4
SWEP.HeatGain = 1
SWEP.HeatLockout = false
SWEP.HeatFix = false
SWEP.Malfunction = false
SWEP.Hook_Overheat = function()
    return true
end
SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 25
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeSights = "rpg"
SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.HolsterPos = Vector(3, 2, -1)
SWEP.HolsterAng = Angle(-10, 35, 0)
SWEP.CustomizePos = Vector(6.76, 2.927, -2.32)
SWEP.CustomizeAng = Angle(10.732, 26.341, 0)
SWEP.IronSightStruct =
    { Pos = Vector(-3.008399, -3.5, 1.052735), Ang = Angle(0.079090, 0.013530, 3.469), Magnification = 1.15 }
SWEP.MuzzleEffect = "muzzleflash_3"
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.ShellModel = "models/weapons/arc9/uplp/shells/shell_762.mdl"
SWEP.ShellScale = 1.3
SWEP.ShellPitch = 95
SWEP.ShootVol = 115
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0
local path = ")^/arccw_uc/pkm/"
SWEP.ShootSound = {
    "uc_pkm_new/fire1.wav",
    "uc_pkm_new/fire2.wav",
    "uc_pkm_new/fire3.wav",
    "uc_pkm_new/fire4.wav",
    "uc_pkm_new/fire5.wav",
}
SWEP.ShootSoundSilenced = "uc_pkm_new/fire_sup.wav"
SWEP.ShootDrySound = path .. "prefire.wav"
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = path .. "sup-tail-01.wav"
SWEP.DistantShootSoundOutdoors = {
    path .. "fire-dist-762x54r-mg-ext-01.wav",
    path .. "fire-dist-762x54r-mg-ext-02.wav",
    path .. "fire-dist-762x54r-mg-ext-03.wav",
    path .. "fire-dist-762x54r-mg-ext-04.wav",
}
SWEP.DistantShootSoundIndoors = {
    path .. "fire-dist-762x39-rif-int-01.wav",
    path .. "fire-dist-762x39-rif-int-02.wav",
    path .. "fire-dist-762x39-rif-int-03.wav",
}
SWEP.DistantShootSoundOutdoorsSilenced = { path .. "sup-tail-01.wav", path .. "sup-tail-02.wav" }
SWEP.DistantShootSoundIndoorsSilenced =
    { path .. "fire-dist-int-pistol-light-01.wav", path .. "fire-dist-int-pistol-light-02.wav" }
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty
SWEP.BulletBones = {}
for i = 1, 13 do
    SWEP.BulletBones[i] = { "bullet" .. (i - 1) }
end

SWEP.AttachmentElements = {
    pkm_mg1ms = {
        VMBodygroups = { { ind = 1, bg = 6 } },
        AttPosMods = {
            [2] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_ultra = {
        VMBodygroups = {
            { ind = 1, bg = 5 },
            { ind = 2, bg = 0 },
            { ind = 12, bg = 1 },
            { ind = 14, bg = 1 },
        },
        AttPosMods = {
            [2] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_d7ln = {
        VMBodygroups = { { ind = 4, bg = 9 }, { ind = 11, bg = 1 } },
        AttPosMods = {
            [9] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_topfold = {
        AttPosMods = {
            [9] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_topfold_extended = { VMBodygroups = { { ind = 4, bg = 11 }, { ind = 11, bg = 1 } } },
    pkm_topfold_folded = { VMBodygroups = { { ind = 4, bg = 12 }, { ind = 11, bg = 1 } } },
    pkm_pkt = {
        VMBodygroups = { { ind = 1, bg = 4 } },
        AttPosMods = {
            [2] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_sidegrip = {
        VMBodygroups = { { ind = 4, bg = 9 } },
        AttPosMods = {
            [9] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_tel = {
        AttPosMods = {
            [9] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_tel_extended = { VMBodygroups = { { ind = 4, bg = 9 }, { ind = 11, bg = 1 } } },
    pkm_tel_retracted = { VMBodygroups = { { ind = 4, bg = 10 }, { ind = 11, bg = 1 } } },
    pkm_short = { VMBodygroups = { { ind = 1, bg = 3 } } },
    pkm_stockless = { VMBodygroups = { { ind = 4, bg = 8 }, { ind = 11, bg = 1 } } },
    pkm_pkp = { VMBodygroups = { { ind = 1, bg = 1 } } },
    pkm_aek = { VMBodygroups = { { ind = 1, bg = 2 } } },
    pkm_m84 = { VMBodygroups = { { ind = 4, bg = 6 } } },
    pkm_topfeed = {
        VMBodygroups = { { ind = 6, bg = 9 }, { ind = 9, bg = 5 } },
        AttPosMods = {
            [8] = { bone = "body", vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0), wang = Angle(0, 0, 0) },
        },
    },
    pkm_type73 = { VMBodygroups = { { ind = 4, bg = 7 } } },
    pkm_poly = { VMBodygroups = { { ind = 4, bg = 1 } } },
    pkm_zenit = { VMBodygroups = { { ind = 4, bg = 2 } } },
    pkm_ro = { VMBodygroups = { { ind = 4, bg = 4 } } },
    pkm_ro_extended = { VMBodygroups = { { ind = 4, bg = 4 } } },
    pkm_ro_folded = { VMBodygroups = { { ind = 4, bg = 5 } } },
    pkm_bp = {
        VMBodygroups = { { ind = 2, bg = 0 }, { ind = 3, bg = 2 }, { ind = 4, bg = 3 }, { ind = 5, bg = 3 } },
        AttPosMods = {
            [1] = {
                bone = "body",
                vpos = Vector(-0.0672, -3.448, 7.2756),
                vang = Angle(90, 0, -90),
                wang = Angle(90, 0, -90),
            },
            [5] = {
                bone = "body",
                vpos = Vector(-0.0672, 1.728993, 12.225623),
                vang = Angle(90, 0, -90),
                wang = Angle(90, 0, -90),
            },
            [16] = {
                bone = "body",
                vpos = Vector(-0.147017, 0.817092, 8.583752),
                vang = Angle(89.957027, -0.011608, -89.867998),
                wang = Angle(89.957027, -0.011608, -89.867998),
            },
            [6] = { vpos = Vector(0, 0, 1), vang = Angle(90, 0, 0) },
        },
    },
    pkm_rail = {
        VMBodygroups = { { ind = 3, bg = 1 } },
        AttPosMods = {
            [1] = {
                bone = "topcover",
                vpos = Vector(0, -1.804412, -5.3917),
                vang = Angle(90, 0, -90),
                wang = Angle(90, 0, -90),
            },
        },
    },
    pkm_hg = { VMBodygroups = { { ind = 5, bg = 1 } } },
}
SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = { "optic", "optic_lp" },
        Bone = "topcover",
        DefaultAttName = "Iron Sights",
        Offset = { vpos = Vector(0, -1.804412, -5.3917), vang = Angle(90, 0, -90) },
        GivesFlags = { "pkm_optic" },
        InstalledEles = { "pkm_optic" },
        CorrectiveAng = Angle(0, 0, 0),
    },
    {
        PrintName = "Barrel",
        Slot = "uc_pkm_barrel",
        ExcludeFlags = { "pkm_bp" },
        Bone = "body",
        DefaultAttName = "25.9\" PKM Barrel",
        DefaultAttIcon = Material("entities/barrel_default.png", "mips smooth"),
        Offset = { vpos = Vector(0, -1.1, 10), vang = Angle(90, 90, 180) },
    },
    {
        PrintName = "Top Cover",
        Slot = "uc_pkm_cover",
        Bone = "topcover",
        DefaultAttName = "Standard Top Cover",
        DefaultAttIcon = Material("entities/cover_default.png", "mips smooth"),
        ExcludeFlags = { "pkm_bp" },
        Offset = { vpos = Vector(0, -1, -5), vang = Angle(90, 90, 180) },
    },
    {
        PrintName = "Bipod",
        Slot = "uc_pkm_bipod",
        Bone = "body",
        DefaultAttName = "Folding Bipod",
        DefaultAttIcon = Material("entities/bipod_default.png", "mips smooth"),
        ExcludeFlags = { "pkm_bp", "pkm_ultra" },
        Offset = { vpos = Vector(0, 1.5, 13), vang = Angle(90, 90, 180) },
    },
    {
        PrintName = "Underbarrel",
        Slot = { "foregrip", "uc_pkm_handguard" },
        Bone = "body",
        DefaultAttName = "Bare Gas Tube",
        MergeSlots = { 16 },
        ExcludeFlags = { "pkm_aek" },
        GivesFlags = { "pkm_grip" },
        InstalledEles = { "pkm_grip" },
        Offset = { vpos = Vector(-0.0672, 1.9758, 9.2756), vang = Angle(90, 0, -90) },
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "tac",
        ExcludeFlags = { "pkm_aek" },
        InstalledEles = { "pkm_tac" },
        Offset = { vpos = Vector(0, 0, 0), vang = Angle(90, 0, 0) },
    },
    {
        PrintName = "Caliber",
        Slot = "uc_pkm_caliber",
        DefaultAttName = "7.62x54mmR",
        DefaultAttIcon = Material("entities/att/uc_bullets/762x54.png", "mips smooth"),
    },
    {
        PrintName = "Magazine / Belt Box",
        Slot = "uc_pkm_box",
        Bone = "body",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 0),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        DefaultAttName = "200-Round Steel Box",
        DefaultAttIcon = Material("entities/box_default.png", "mips smooth"),
    },
    {
        PrintName = "Furniture / Conversion",
        Slot = "uc_pkm_furniture",
        Bone = "body",
        DefaultAttName = "Laminated Wood Furniture",
        DefaultAttIcon = Material("entities/furniture_default.png", "mips smooth"),
        Offset = { vpos = Vector(0, 0, -4), vang = Angle(90, 90, 180) },
    },
    {
        PrintName = "Gas Regulator",
        Slot = "uc_pkm_gas",
        Bone = "body",
        DefaultAttName = "Position 2: Normal",
        DefaultAttIcon = Material("entities/gas_default.png", "mips smooth"),
        Offset = { vpos = Vector(0, -0.6, 12), vang = Angle(90, 90, 180) },
    },
    { PrintName = "Ammo Type", Slot = "uc_ammo", DefaultAttName = "Full Metal Jacket" },
    { PrintName = "Powder Load", Slot = "uc_powder" },
    { PrintName = "Training", Slot = "uc_tp" },
    { PrintName = "Internals", Slot = "uc_fg" },
    {
        PrintName = "Charm",
        Slot = "charm",
        Bone = "charm",
        Offset = { vpos = Vector(0.018, 0, 0), vang = Angle(90, 0, -90) },
    },
    {
        PrintName = "UC Underbarrel Weapon",
        Slot = "uc_ubgl",
        Hidden = true,
        Bone = "body",
        ExcludeFlags = { "pkm_aek" },
        InstalledEles = { "pkm_grip" },
        Offset = {
            vpos = Vector(-0.147017, 1.064222, 5.633752),
            vang = Angle(89.957027, -0.011608, -89.867998),
        },
    },
}

local function has(wep, slot, id)
    return wep.Attachments[slot].Installed == id
end
function SWEP:PKMIsBullpup()
    return has(self, 9, "uc_pkm_furniture_bullpup")
end
function SWEP:PKMCaliberBodygroup()
    local states =
        { uc_pkm_caliber_556 = 1, uc_pkm_caliber_9mm = 2, uc_pkm_caliber_366tkm = 3, uc_pkm_caliber_12g = 4 }
    return states[self.Attachments[7].Installed] or 0
end
function SWEP:PKMHeatRatio()
    return math.Clamp(self:GetHeat() / math.max(self:GetMaxHeat(), 1), 0, 1)
end
function SWEP:PKMLinks()
    local loaded = self.PKM_LoadedClip
        or self:GetNW2Int("uc_pkm_loaded", math.max(self:GetLastLoad() or 0, self:Clip1()))
    return math.max(loaded - self:Clip1(), 0) % 12
end
function SWEP:PKMTopFeedBodygroup()
    return has(self, 7, "uc_pkm_caliber_9mm") and 1 or 0
end
SWEP.Hook_NameChange = function(wep)
    if has(wep, 8, "uc_pkm_mag_type73") then
        return has(wep, 7, "uc_pkm_caliber_9mm") and "PKM Type 73 (9mm)" or "PKM Type 73 (Magazine-fed)"
    end
    if has(wep, 2, "uc_pkm_barrel_mg1ms") then
        return "Arsenal MG-1MS"
    end
    if has(wep, 9, "uc_pkm_furniture_d7ln") then
        return "D7LN"
    end
    if has(wep, 9, "uc_pkm_furniture_romanian") then
        return "Romanian Paratrooper PKMSF"
    end
    if wep:PKMIsBullpup() then
        return "PKP BP"
    end
    if has(wep, 9, "uc_pkm_furniture_m84") then
        return "Zastava M84"
    end
    if has(wep, 9, "uc_pkm_furniture_type73") then
        return "PKM Type 73"
    end
    if has(wep, 2, "uc_pkm_barrel_pkt") then
        return "PKM-T Field Conversion"
    end
    if has(wep, 2, "uc_pkm_barrel_aek") then
        return "PKM (BMS)"
    end
    if has(wep, 2, "uc_pkm_barrel_pkp") then
        return "PKP Pecheneg"
    end
end

function SWEP:SelectAnimation(anim, ...)
    local selected = weapons.GetStored("arccw_base").SelectAnimation(self, anim, ...)
    if anim == "idle" and has(self, 8, "uc_pkm_mag_type73") then
        return "idle"
    end
    return selected
end

function SWEP:PlayAnimation(key, ...)
    if has(self, 8, "uc_pkm_mag_type73") and type(key) == "string" and key:find("inspect") then
        return false
    end
    return weapons.GetStored("arccw_base").PlayAnimation(self, key, ...)
end
SWEP.Hook_TranslateAnimation = function(wep, key)
    if has(wep, 8, "uc_pkm_mag_type73") then
        if key:find("inspect") then
            return nil
        end
        local reloadKey = key:find("^reload_empty") and "reload_empty_type73"
            or (key:find("^reload") and "reload_type73" or nil)
        if reloadKey then
            if has(wep, 7, "uc_pkm_caliber_9mm") then
                reloadKey = reloadKey .. "_9mm"
            end
            if has(wep, 9, "uc_pkm_furniture_sidegrip") then
                reloadKey = reloadKey .. "_sidegrip"
            end
            return reloadKey
        end
    end
    local base =
        key:gsub("_sidegrip$", ""):gsub("_9mm$", ""):gsub("_type73$", ""):gsub("_bp$", ""):gsub("_zl$", "")
    local fresh = wep:PKMLinks() == 0
    if fresh and base ~= "ready" and base ~= "reload_empty" and wep.Animations[base .. "_zl"] then
        base = base .. "_zl"
    end
    if wep:PKMIsBullpup() then
        base = base .. "_bp"
    end
    if has(wep, 9, "uc_pkm_furniture_sidegrip") and wep.Animations[base .. "_sidegrip"] then
        base = base .. "_sidegrip"
    end
    if wep.Animations[base] then
        return base
    end
end

SWEP.Hook_PrePlayEvent = function(wep, event)
    local prefix = ")^/uc_pkm_new/"
    local snd = event.s
    if type(snd) ~= "string" then
        return event
    end
    local compact = has(wep, 8, "uc_pkm_box_small") or has(wep, 8, "uc_pkm_box_medium")
    local extended = has(wep, 8, "uc_pkm_box_250")
    local variant = compact and "100" or (extended and "250" or nil)
    if snd == prefix .. "boxinsert.wav" and variant then
        event.s = prefix .. "boxinsert_" .. variant .. ".wav"
    elseif (snd == prefix .. "boxremove_full.wav" or snd == prefix .. "boxremove_empty.wav") and variant then
        event.s = prefix .. "boxremove_" .. variant .. ".wav"
    elseif snd == prefix .. "box_struggle.wav" and variant then
        event.s = nil
    end
    return event
end
SWEP.Hook_SelectReloadAnimation = function(wep, key)
    return wep:PKMIsBullpup() and key .. "_bp" or key
end
SWEP.Hook_ModifyRecoil = function(wep, rec)
    local settled = wep:GetBurstCount() >= 4
    rec.Recoil = rec.Recoil * (settled and 0.87 or 1.12)
    if not wep:InBipod() then
        rec.RecoilSide = rec.RecoilSide * 1.18
    end
    return rec
end
SWEP.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = wep:PKMHeatRatio()
    local start = has(wep, 2, "uc_pkm_barrel_aek") and 0.4 or 0.65
    local penalty = has(wep, 2, "uc_pkm_barrel_pkp") and 0.35 or 0.95
    data.mult = data.mult * (1 + math.max(heat - start, 0) / (1 - start) * penalty)
end
SWEP.Hook_ModifyRPM = function(wep, delay)
    if has(wep, 2, "uc_pkm_barrel_aek") then
        local heat = wep:PKMHeatRatio()
        return delay * (1 + math.max(heat - 0.5, 0) * 0.4)
    end
end

local function setupModel(wep, mdl)
    if not IsValid(mdl) then
        return
    end
    local bp = wep:PKMIsBullpup()
    local aek, pkp = has(wep, 2, "uc_pkm_barrel_aek"), has(wep, 2, "uc_pkm_barrel_pkp")
    local romanian = has(wep, 9, "uc_pkm_furniture_romanian")
    local folded = romanian and wep.Attachments[9].ToggleNum == 2
    local grip = wep.Attachments[5].Installed ~= nil or wep.Attachments[16].Installed ~= nil
    local tac = wep.Attachments[6].Installed ~= nil
    local ultra = has(wep, 2, "uc_pkm_barrel_ultra")
    local noBipod = ultra or has(wep, 4, "uc_pkm_bipod_none") or grip or bp
    mdl:SetBodygroup(
        1,
        has(wep, 2, "uc_pkm_barrel_mg1ms") and 6
            or ultra and 5
            or has(wep, 2, "uc_pkm_barrel_pkt") and 4
            or (has(wep, 2, "uc_pkm_barrel_short") and 3 or (aek and 2 or (pkp and 1 or 0)))
    )
    mdl:SetBodygroup(13, (bp and not grip) and 0 or 1)
    mdl:SetBodygroup(14, ultra and 1 or 0)
    mdl:SetBodygroup(12, ultra and 1 or has(wep, 2, "uc_pkm_barrel_pkt") and 1 or 0)
    mdl:SetBodygroup(2, noBipod and 0 or (wep:GetInBipod() and 2 or 1))
    mdl:SetBodygroup(
        3,
        bp and 2 or ((wep.Attachments[1].Installed or wep.Attachments[3].Installed) and 1 or 0)
    )
    local furniture = has(wep, 9, "uc_pkm_furniture_stockless") and 8
        or (
            has(wep, 9, "uc_pkm_furniture_m84") and 6
            or (has(wep, 9, "uc_pkm_furniture_type73") and 7 or nil)
        )
    mdl:SetBodygroup(
        4,
        furniture
            or (
                romanian and (folded and 5 or 4)
                or (
                    bp and 3
                    or (
                        has(wep, 9, "uc_pkm_furniture_zenit") and 2
                        or (has(wep, 9, "uc_pkm_furniture_polymer") and 1 or 0)
                    )
                )
            )
    )
    if has(wep, 9, "uc_pkm_furniture_telescopic") then
        mdl:SetBodygroup(4, wep.Attachments[9].ToggleNum == 2 and 10 or 9)
    end
    if has(wep, 9, "uc_pkm_furniture_sidegrip") then
        mdl:SetBodygroup(4, 9)
    end
    if has(wep, 9, "uc_pkm_furniture_topfold") then
        mdl:SetBodygroup(4, wep.Attachments[9].ToggleNum == 2 and 12 or 11)
    end
    if has(wep, 9, "uc_pkm_furniture_d7ln") then
        mdl:SetBodygroup(4, 9)
    end
    local hg = bp and 3 or (pkp and 2 or ((grip or tac) and 1 or 0))
    mdl:SetBodygroup(5, hg)
    if mdl.SetSkin then
        mdl:SetSkin(has(wep, 8, "uc_pkm_box_fde") and 1 or (has(wep, 8, "uc_pkm_box_charcoal") and 2 or 0))
    end
    local smallBox = has(wep, 8, "uc_pkm_box_small")
    local mediumBox = has(wep, 8, "uc_pkm_box_medium")
    local bigBox = has(wep, 8, "uc_pkm_box_250")
    mdl:SetBodygroup(
        6,
        bp and (mediumBox and 7 or (bigBox and 8 or (smallBox and 4 or 3)))
            or (mediumBox and 5 or (bigBox and 6 or (smallBox and 2 or 0)))
    )
    mdl:SetBodygroup(7, (bp or has(wep, 9, "uc_pkm_furniture_sidegrip")) and 1 or 0)
    mdl:SetBodygroup(8, (bp or aek or pkp) and 1 or (has(wep, 9, "uc_pkm_furniture_polymer") and 2 or 0))
    mdl:SetBodygroup(9, wep:PKMCaliberBodygroup())
    if has(wep, 8, "uc_pkm_mag_type73") then
        mdl:SetBodygroup(6, 9)
        mdl:SetBodygroup(9, 5)
    end
    mdl:SetBodygroup(10, bp and not wep.Attachments[1].Installed and 0 or 1)
    mdl:SetBodygroup(
        11,
        (
            has(wep, 9, "uc_pkm_furniture_stockless")
            or has(wep, 9, "uc_pkm_furniture_telescopic")
            or has(wep, 9, "uc_pkm_furniture_topfold")
            or has(wep, 9, "uc_pkm_furniture_d7ln")
        )
                and 1
            or 0
    )

    local magazineBone = mdl:LookupBone("mag")
    if magazineBone then
        mdl:ManipulateBonePosition(magazineBone, Vector(0, 0, 0))
    end

    for i = -3, 8 do
        local b = mdl:LookupBone("link" .. i)
        if b then
            mdl:ManipulateBonePosition(b, Vector(0, 0, 0))
        end
    end
    mdl:SetPoseParameter("sights", 1 - wep:GetSightDelta())
    local elapsed = (CurTime() - (wep.LastAnimStartTime or 0)) / wep:GetBuff_Mult("Mult_ReloadTime")
    local beltStowed = bp
        and wep:GetReloading()
        and (wep.LastAnimKey or ""):find("^reload")
        and elapsed >= 1.25
        and elapsed < 2.80
    local links = wep:PKMLinks()
    for i = 9, 20 do
        local b = mdl:LookupBone("link" .. i)
        if b then
            mdl:ManipulateBoneScale(
                b,
                (not beltStowed and i - 8 <= links) and Vector(1, 1, 1) or Vector(0, 0, 0)
            )
        end
    end
    local hidden = not has(wep, 8, "uc_pkm_mag_type73")
        and wep:GetReloading()
        and (wep.LastAnimKey or ""):find("^reload")
        and elapsed >= 1.25
        and elapsed < 1.7
    for _, name in ipairs({ "mag", "magrelease", "bulletdoor" }) do
        local b = mdl:LookupBone(name)
        if b then
            mdl:ManipulateBoneScale(b, hidden and Vector(0, 0, 0) or Vector(1, 1, 1))
        end
    end
    if hidden then
        for i = -3, 20 do
            local b = mdl:LookupBone("link" .. i)
            if b then
                mdl:ManipulateBoneScale(b, Vector(0, 0, 0))
            end
        end
        for i = 1, 12 do
            local b = mdl:LookupBone("bullet" .. i)
            if b then
                mdl:ManipulateBoneScale(b, Vector(0, 0, 0))
            end
        end
    else
        for i = -3, 8 do
            local b = mdl:LookupBone("link" .. i)
            if b then
                mdl:ManipulateBoneScale(
                    b,
                    (beltStowed or (smallBox and i <= 2)) and Vector(0, 0, 0) or Vector(1, 1, 1)
                )
            end
        end

        local visualRounds = wep.GetVisualBullets and wep:GetVisualBullets() or wep:Clip1()
        for i = 0, 12 do
            local b = mdl:LookupBone("bullet" .. i)
            local visible = visualRounds > i and not (smallBox and i >= 7) and not (beltStowed and i >= 1)
            if b then
                mdl:ManipulateBoneScale(b, visible and Vector(1, 1, 1) or Vector(0, 0, 0))
            end
        end
    end
end
SWEP.Hook_ModifyBodygroups = function(wep, data)
    setupModel(wep, data.vm)
end
SWEP.Hook_Think = function(wep)
    local clip = wep:Clip1()
    if wep.PKM_LoadedClip == nil or clip > (wep.PKM_PreviousClip or clip) then
        wep.PKM_LoadedClip = clip
        if SERVER then
            wep:SetNW2Int("uc_pkm_loaded", clip)
        end
    end
    wep.PKM_PreviousClip = clip
    wep.Bipod_Integral = not has(wep, 2, "uc_pkm_barrel_ultra")
        and not wep:PKMIsBullpup()
        and not wep.Attachments[5].Installed
        and not wep.Attachments[16].Installed
        and not has(wep, 4, "uc_pkm_bipod_none")
    if not wep.Bipod_Integral and wep:GetInBipod() then
        wep:ExitBipod()
    end
    if CLIENT then
        local side = has(wep, 9, "uc_pkm_furniture_sidegrip")
        if wep.PKM_LastSideGrip ~= side then
            local previous = wep.PKM_LastSideGrip
            wep.PKM_LastSideGrip = side
            if previous ~= nil and not wep:GetReloading() then
                wep:PlayIdleAnimation(true)
            end
        end
        local bp = wep:PKMIsBullpup()
        if wep.PKM_LastBullpup ~= bp then
            local previous = wep.PKM_LastBullpup
            wep.PKM_LastBullpup = bp
            wep.Attachments[1].Bone = bp and "body" or "topcover"
            wep.ReferencePosCache = {}

            wep:GetActiveElements(true)
            wep:SetupModel(false)
            wep:SetupModel(true)
            if previous ~= nil and not wep:GetReloading() then
                wep:PlayIdleAnimation(true)
            end
        end
        wep.PKM_LastBullpup = bp
        local owner = wep:GetOwner()
        if IsValid(owner) and owner:IsPlayer() then
            setupModel(wep, owner:GetViewModel())
        end
        setupModel(wep, wep.WMModel)
    end
    if ArcCW.UC.ADSReload then
        ArcCW.UC.ADSReload(wep)
    end
end
SWEP.Hook_PostFireBullets = function(wep)
    if
        has(wep, 8, "uc_pkm_mag_type73")
        or not CLIENT
        or not IsFirstTimePredicted()
        or wep:PKMLinks() ~= 0
    then
        return
    end
    local owner = wep:GetOwner()
    if not IsValid(owner) or owner ~= LocalPlayer() then
        return
    end
    local vm = owner:GetViewModel()
    local at = IsValid(vm) and vm:GetAttachment(2)
    if not at then
        return
    end
    local fx = EffectData()
    fx:SetOrigin(at.Pos)
    fx:SetAngles(at.Ang)
    fx:SetScale(wep:PKMIsBullpup() and 1 or 0)
    fx:SetFlags(wep:PKMCaliberBodygroup())
    util.Effect("uc_pkm_belt", fx)
end
SWEP.Hook_PostReload = function(wep)
    if has(wep, 8, "uc_pkm_mag_type73") then
        return
    end
    if not CLIENT or not IsFirstTimePredicted() then
        return
    end
    local owner = wep:GetOwner()
    if not IsValid(owner) or owner ~= LocalPlayer() then
        return
    end
    wep.PKM_ReloadSerial = (wep.PKM_ReloadSerial or 0) + 1
    local serial = wep.PKM_ReloadSerial
    wep:SetTimer(1.25 * wep:GetBuff_Mult("Mult_ReloadTime"), function()
        if not IsValid(wep) or not wep:GetReloading() or serial ~= wep.PKM_ReloadSerial then
            return
        end
        local vm = owner:GetViewModel()
        local at = IsValid(vm) and vm:GetAttachment(4)
        if not at then
            return
        end
        local fx = EffectData()
        fx:SetOrigin(at.Pos)
        fx:SetAngles(at.Ang)
        fx:SetScale(
            has(wep, 8, "uc_pkm_box_medium") and 5
                or (
                    has(wep, 8, "uc_pkm_box_250") and 6
                    or (has(wep, 8, "uc_pkm_box_small") and 4 or (wep:PKMIsBullpup() and 3 or 2))
                )
        )
        util.Effect("uc_pkm_belt", fx)
    end, "pkm_box_drop")
end
local originalDesc = SWEP.Trivia_Desc
SWEP.Hook_DescChange = function(wep)
    local heat = wep:PKMHeatRatio()
    return originalDesc
        .. "\n\nBarrel: "
        .. (heat > 0.65 and "heat-soaked" or (heat > 0.25 and "warm" or "cool"))
        .. ". Gas setting: "
        .. (has(wep, 10, "uc_pkm_gas_low") and "1 (reduced)" or (has(wep, 10, "uc_pkm_gas_adverse") and "3 (adverse)" or (has(
            wep,
            10,
            "uc_pkm_gas_overclocked"
        ) and "4 (overclocked)" or "2 (normal)")))
        .. "."
end
AddCSLuaFile("arccw/shared/uc_pkm/animations.lua")
SWEP.Animations = include("arccw/shared/uc_pkm/animations.lua")
