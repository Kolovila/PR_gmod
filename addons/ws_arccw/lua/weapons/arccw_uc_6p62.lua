SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "6P62"
SWEP.TrueName = "6P62"
SWEP.Trivia_Class = "Heavy Automatic Rifle"
SWEP.Trivia_Desc =
    [[Experimental Russian heavy automatic rifle developed at the Degtyaryov plant in Kovrov. Nikolai Obidin's design group built it for security forces, putting the 12.7x108mm heavy machine gun cartridge into a magazine-fed weapon that could be carried and fired by one man. Intended for light vehicles and targets behind cover, it remained an obscure project rather than a standard infantry weapon.

Hits much harder and penetrates more cover than conventional light machine guns, but handles slowly and carries very little ammunition. Heavy recoil limits unsupported automatic fire to short bursts. The bipod greatly improves control, though the small magazine still prevents prolonged suppression.]]
SWEP.Trivia_Manufacturer = "Degtyaryov Plant"
SWEP.Trivia_Calibre = "12.7x108mm"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "Russia"
SWEP.Trivia_Year = 2010
SWEP.Slot = 3
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/arccw/c_uc_6p62.mdl"
SWEP.WorldModel = SWEP.ViewModel
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 65
SWEP.WorldModelOffset = {
    pos = Vector(-8, 4, -6),
    ang = Angle(-6, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}
SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 35
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.Damage = 110
SWEP.DamageMin = 72
SWEP.Range = 450
SWEP.Penetration = 42
SWEP.DamageType = DMG_BULLET
SWEP.PhysBulletMuzzleVelocity = 635
SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 14
SWEP.Primary.Ammo = "SniperPenetratedRound"
SWEP.MagID = "6p62"
SWEP.Delay = 60 / 450
SWEP.Num = 1
SWEP.Firemodes = { { Mode = 2 }, { Mode = 1 }, { Mode = 0 } }
SWEP.Recoil = 3.15
SWEP.RecoilSide = 1.5
SWEP.RecoilRise = 1.25
SWEP.RecoilPunch = 4
SWEP.RecoilVMShake = 1.3
SWEP.AccuracyMOA = 4.5
SWEP.HipDispersion = 1150
SWEP.MoveDispersion = 600
SWEP.JumpDispersion = 1500
SWEP.Sway = 1.6
SWEP.SpeedMult = 0.72
SWEP.SightedSpeedMult = 0.42
SWEP.ShootSpeedMult = 0.4
SWEP.SightTime = 0.68
SWEP.BarrelLength = 43
SWEP.Bipod_Integral = true
SWEP.BipodRecoil = 0.18
SWEP.BipodDispersion = 0.16

SWEP.ShootVol = 125
SWEP.ShootPitch = 95
local path = ")^uc_6p62/"
SWEP.ShootSound = { path .. "fire1.wav", path .. "fire2.wav", path .. "fire3.wav" }
SWEP.ShootSoundSilenced = path .. "fire_suppressed.wav"
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty
SWEP.DistantShootSoundOutdoors = {}
SWEP.DistantShootSoundIndoors = {}
SWEP.DistantShootSoundOutdoorsSilenced = {}
SWEP.DistantShootSoundIndoorsSilenced = {}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1

local tail = ")/arccw_uc/common/"
for i = 1, 6 do
    local number = string.format("%02d", i)
    SWEP.DistantShootSoundOutdoors[i] = tail .. "50bmg/fire-dist-50bmg-rif-ext-" .. number .. ".ogg"
    SWEP.DistantShootSoundIndoors[i] = tail .. "50bmg/fire-dist-50bmg-rif-int-" .. number .. ".ogg"
    SWEP.DistantShootSoundIndoorsSilenced[i] = tail .. "fire-dist-int-pistol-light-" .. number .. ".ogg"
end
for i = 1, 10 do
    SWEP.DistantShootSoundOutdoorsSilenced[i] = tail .. "sup-tail-" .. string.format("%02d", i) .. ".ogg"
end

SWEP.ShootDrySound = path .. "empty.wav"
SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.ShellModel = "models/shells/shell_556.mdl"
SWEP.ShellScale = 2.1
SWEP.ShellPitch = 65
SWEP.TracerNum = 0
SWEP.TracerCol = Color(255, 170, 75)
SWEP.TracerWidth = 2

SWEP.ActivePos = Vector(6.24, -2.439, -2.2)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.IronSightStruct = {
    Pos = Vector(-0.148, -2, 0.41),
    Ang = Angle(0, 0, 0),
    Magnification = 1.12,
    SwitchToSound = "",
    CrosshairInSights = false,
}
SWEP.SprintPos = Vector(3, -3, -2)
SWEP.SprintAng = Angle(-12, 32, -14)
SWEP.HolsterPos = SWEP.SprintPos
SWEP.HolsterAng = SWEP.SprintAng
SWEP.CustomizePos = Vector(13.56, 0, 1.44)
SWEP.CustomizeAng = Angle(7.805, 32.195, 10.732)
SWEP.Customize_Hide = 0

SWEP.DefaultBodygroups = "000000"
SWEP.AttachmentElements = {
    mag_drum = { VMBodygroups = { { ind = 1, bg = 1 } }, WMBodygroups = { { ind = 1, bg = 1 } } },
    stock_short = { VMBodygroups = { { ind = 2, bg = 1 } }, WMBodygroups = { { ind = 2, bg = 1 } } },
    stock_support = {
        VMBodygroups = { { ind = 2, bg = 2 }, { ind = 5, bg = 1 } },
        WMBodygroups = { { ind = 2, bg = 2 }, { ind = 5, bg = 1 } },
    },
    stock_none = { VMBodygroups = { { ind = 2, bg = 3 } }, WMBodygroups = { { ind = 2, bg = 3 } } },
    barrel_short = { VMBodygroups = { { ind = 4, bg = 1 } }, WMBodygroups = { { ind = 4, bg = 1 } } },
    barrel_long = { VMBodygroups = { { ind = 4, bg = 2 } }, WMBodygroups = { { ind = 4, bg = 2 } } },
}
SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = { "optic", "optic_lp", "optic_sniper" },
        Bone = "Weapon",
        Offset = { vpos = Vector(0, -5.36, -1.35), vang = Angle(90, 0, -90) },
        CorrectiveAng = Angle(0, 0, 0),
    },
    {
        PrintName = "Barrel",
        DefaultAttIcon = Material("entities/att/uc_6p62_barrel.png", "mips smooth"),
        Slot = "uc_6p62_barrel",
        DefaultAttName = "24\" Factory Barrel",
    },
    {
        PrintName = "Caliber",
        DefaultAttIcon = Material("entities/att/uc_bullets/338lapua.png", "mips smooth"),
        Slot = "uc_6p62_caliber",
        DefaultAttName = "12.7x108mm",
    },
    {
        PrintName = "Magazine",
        DefaultAttIcon = Material("entities/att/uc_6p62_magazine.png", "mips smooth"),
        Slot = "uc_6p62_mag",
        DefaultAttName = "14-Round Box",
    },
    {
        PrintName = "Stock",
        DefaultAttIcon = Material("entities/att/uc_6p62_stock.png", "mips smooth"),
        Slot = "uc_6p62_stock",
        DefaultAttName = "Factory Stock",
    },
    {
        PrintName = "Handling",
        DefaultAttIcon = Material("entities/att/uc_6p62_handling_support.png", "mips smooth"),
        Slot = "uc_6p62_handling",
        DefaultAttName = "General-Purpose Hold",
    },
    { PrintName = "Training Package", Slot = "uc_tp", DefaultAttName = "Basic Training" },
    { PrintName = "Internals", Slot = "uc_fg", DefaultAttName = "Standard Internals" },
    { PrintName = "Ammo Type", Slot = { "uc_ammo", "uc_6p62_ammo" }, DefaultAttName = "Full Metal Jacket" },
    { PrintName = "Powder Load", Slot = "uc_powder", DefaultAttName = "Standard Load" },
}

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local burst = math.Clamp(((wep:GetBurstCount() or 0) - 2) / 8, 0, 1)
    local supported = wep:InBipod()
    local owner = wep:GetOwner()
    local crouched = IsValid(owner) and owner:OnGround() and owner:Crouching()
    if not supported then
        local brace = crouched and 0.8 or 1
        local fatigue = wep:GetBuff_Override("Override_6P62Fatigue") or 1
        rec.Recoil = rec.Recoil * brace * (1 + burst * 0.42 * fatigue)
        rec.RecoilSide = rec.RecoilSide * brace * (1 + burst * 0.75 * fatigue)
    end
    return rec
end

local function setBipod(wep, mdl)
    if IsValid(mdl) then
        mdl:SetBodygroup(
            3,
            wep:GetBuff_Override("Override_6P62NoBipod") and 2 or (wep:GetInBipod() and 1 or 0)
        )
    end
end
SWEP.Hook_ModifyBodygroups = function(wep, data)
    setBipod(wep, data.vm)
end
SWEP.Hook_Think = function(wep)
    wep.Bipod_Integral = not wep:GetBuff_Override("Override_6P62NoBipod")
    if not wep.Bipod_Integral and wep:GetInBipod() then
        wep:ExitBipod()
    end
    if CLIENT then
        setBipod(wep, wep.WMModel)
    end
    if ArcCW.UC.ADSReload then
        ArcCW.UC.ADSReload(wep)
    end
end

SWEP.Hook_TranslateAnimation = function(wep, anim)
    if wep:GetBuff_Override("Override_6P62Drum") and wep.Animations[anim .. "_drum"] then
        return anim .. "_drum"
    end
end

SWEP.Animations = {
    idle = { Source = "idle", Time = 34 / 30 },
    draw = { Source = "draw", Time = 1, SoundTable = ArcCW.UC.DrawSounds },
    ready = {
        Source = "ready",
        Time = 85 / 30,
        SoundTable = {
            { s = path .. "rattle.wav", t = 0.25, v = 0.5 },
            { s = path .. "magin.wav", t = 1.3, v = 0.6 },
        },
    },
    holster = { Source = "holster", Time = 20 / 30, SoundTable = ArcCW.UC.HolsterSounds },
    fire = { Source = "fire_1", Time = 15 / 30, ShellEjectAt = 0.015 },
    fire_iron = { Source = "iron_fire", Time = 15 / 30, ShellEjectAt = 0.015 },
    fire_empty = { Source = "fire_last", Time = 15 / 30, ShellEjectAt = 0.015 },
    fire_iron_empty = { Source = "iron_fire_last", Time = 15 / 30, ShellEjectAt = 0.015 },
    reload = {
        Source = "reload",
        Time = 110 / 30,
        MinProgress = 76 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            { s = path .. "magout.wav", t = 24 / 30 },
            { s = path .. "rattle.wav", t = 35 / 30, v = 0.45 },
            { s = path .. "magin.wav", t = 67 / 30 },
        },
    },
    reload_empty = {
        Source = "reload_empty",
        Time = 141 / 30,
        MinProgress = 122 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            { s = path .. "magout.wav", t = 18 / 30 },
            { s = path .. "rattle.wav", t = 32 / 30, v = 0.45 },
            { s = path .. "magin.wav", t = 70 / 30 },
            { s = path .. "boltback.wav", t = 94 / 30 },
            { s = path .. "boltrelease.wav", t = 103 / 30 },
        },
    },
    unjam = {
        Source = "charge",
        Time = 40 / 30,
        SoundTable = {
            { s = path .. "boltback.wav", t = 12 / 30 },
            { s = path .. "boltrelease.wav", t = 21 / 30 },
        },
    },
    fix = { Source = "charge", Time = 40 / 30 },
}

local common = ")^/arccw_uc/common/"
local foley = {
    ready = {
        { s = common .. "raise.ogg", t = 0, v = 0.55 },
        { s = common .. "cloth_4.ogg", t = 0.65, v = 0.35 },
        { s = common .. "grab.ogg", t = 1.12, v = 0.35 },
        { s = common .. "shoulder.ogg", t = 2.48, v = 0.55 },
    },
    reload = {
        { s = common .. "cloth_2.ogg", t = 0.22, v = 0.35 },
        { s = common .. "magpouch_gear.ogg", t = 1.35, v = 0.45 },
        { s = common .. "grab.ogg", t = 1.90, v = 0.3 },
        { s = common .. "rattle_b2i_rifle.ogg", t = 2.92, v = 0.35 },
        { s = common .. "shoulder.ogg", t = 3.30, v = 0.5 },
    },
    reload_empty = {
        { s = common .. "cloth_3.ogg", t = 0.16, v = 0.35 },
        { s = common .. "magpouch_gear.ogg", t = 1.25, v = 0.45 },
        { s = common .. "grab.ogg", t = 2.02, v = 0.3 },
        { s = common .. "cloth_4.ogg", t = 2.90, v = 0.35 },
        { s = common .. "rattle_b2i_rifle.ogg", t = 3.90, v = 0.35 },
        { s = common .. "shoulder.ogg", t = 4.40, v = 0.5 },
    },
    unjam = {
        { s = common .. "cloth_4.ogg", t = 0.12, v = 0.35 },
        { s = common .. "grab.ogg", t = 1.02, v = 0.3 },
    },
    fix = {
        { s = common .. "cloth_4.ogg", t = 0.12, v = 0.35 },
        { s = path .. "boltback.wav", t = 12 / 30 },
        { s = path .. "boltrelease.wav", t = 21 / 30 },
        { s = common .. "grab.ogg", t = 1.02, v = 0.3 },
    },
}
for name, events in pairs(foley) do
    local sounds = SWEP.Animations[name].SoundTable or {}
    for _, event in ipairs(events) do
        sounds[#sounds + 1] = event
    end
    table.sort(sounds, function(a, b)
        return a.t < b.t
    end)
    SWEP.Animations[name].SoundTable = sounds
end

for _, key in ipairs({ "reload", "reload_empty", "ready" }) do
    SWEP.Animations[key .. "_drum"] = table.Copy(SWEP.Animations[key])
    SWEP.Animations[key .. "_drum"].Source = key .. "_drum"
end
