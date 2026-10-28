AddCSLuaFile()
SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "Bastion 230"
SWEP.TrueName = "FORT-230"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc =
    [[Compact Ukrainian submachine gun developed by RPC Fort in Vinnytsia for police and military use. First shown at the Arms and Security exhibition in Kyiv in 2021, it was intended for close-quarters fighting and personal defense. Designed and manufactured locally, it has since been issued to Ukrainian police, National Guard units and armored vehicle crews as a compact alternative to older Kalashnikov carbines.

Quick to aim and easy to control in short bursts, but less suited to sustained fire than larger submachine guns. Lateral recoil builds through a long burst, and the small standard magazine needs frequent changes. Pistol-caliber performance falls off quickly at longer ranges.]]
SWEP.Trivia_Manufacturer = "Bastion"
SWEP.Trivia_Calibre = "9x19mm Parabellum"
SWEP.Trivia_Mechanism = "Straight Blowback, Closed Bolt"
SWEP.Trivia_Country = "Ukraine"
SWEP.Trivia_Year = 2021
SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults
local names = GetConVar("arccw_truenames")
if names and names:GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "RPC Fort"
end
SWEP.Slot = 2
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/arccw/c_uc_fort230_v11.mdl"
SWEP.WorldModel = SWEP.ViewModel
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = { pos = Vector(-9, 3, -5), ang = Angle(-5, 0, 180), bone = "ValveBiped.Bip01_R_Hand" }
SWEP.ViewModelFOV = 70
SWEP.DefaultBodygroups = "0000000000"
SWEP.Damage = 32
SWEP.DamageMin = 14
SWEP.RangeMin = 8
SWEP.Range = 60
SWEP.Penetration = 5
SWEP.DamageType = DMG_BULLET
SWEP.PhysBulletMuzzleVelocity = 390
SWEP.CanFireUnderwater = false
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 20
SWEP.ExtendedClipSize = 60
SWEP.ReducedClipSize = 10
SWEP.Primary.Ammo = "pistol"
SWEP.MagID = "fort230"
SWEP.Delay = 60 / 800
SWEP.Num = 1
SWEP.Firemodes = { { Mode = 2 }, { Mode = 1 }, { Mode = 0 } }
SWEP.Recoil = 0.58
SWEP.RecoilSide = 0.32
SWEP.RecoilRise = 0.18
SWEP.VisualRecoilMult = 0.7
SWEP.MaxRecoilBlowback = 0.6
SWEP.MaxRecoilPunch = 0.5
SWEP.Sway = 0.45
SWEP.AccuracyMOA = 5.5
SWEP.HipDispersion = 220
SWEP.MoveDispersion = 95
SWEP.JumpDispersion = 650
SWEP.SpeedMult = 0.97
SWEP.SightedSpeedMult = 0.8
SWEP.ShootSpeedMult = 0.94
SWEP.SightTime = 0.23
SWEP.BarrelLength = 19
SWEP.ShootVol = 100
SWEP.ShootPitch = 100
SWEP.ShootSound = { "uc_fort230/updated/fire.wav" }
SWEP.ShootSoundSilenced = { "uc_fort230/updated/fire_sup.wav" }
SWEP.ShootDrySound = "weapons/pistol/pistol_empty.wav"
SWEP.FiremodeSound = "weapons/smg1/switch_single.wav"
SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 100
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "smg"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 60
SWEP.ActivePos = Vector(0.56, 0, 0.36)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.IronSightStruct =
    { Pos = Vector(-3.5625, 0, 1.37), Ang = Angle(0, 0, 0), Magnification = 1.1, CrosshairInSights = false }
SWEP.SprintPos = Vector(1.1, -1.0, -2.0)
SWEP.SprintAng = Angle(-12, 24, -14)
SWEP.CrouchPos = Vector(-0.3, -0.5, -0.3)
SWEP.CrouchAng = Angle(0, 0, -3)
SWEP.HolsterPos = Vector(1, -5, -2)
SWEP.HolsterAng = Angle(15, 20, -10)
SWEP.CustomizePos = Vector(6.4, -1.463, 1.84)
SWEP.CustomizeAng = Angle(11.707, 36.098, 9.756)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)
SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.AttachmentElements = {
    optic = { VMBodygroups = { { ind = 5, bg = 1 }, { ind = 6, bg = 1 } } },
    mag60 = { VMBodygroups = { { ind = 1, bg = 1 } } },
    mag10 = { VMBodygroups = { { ind = 1, bg = 2 } } },
    mag30 = { VMBodygroups = { { ind = 1, bg = 3 } } },
    stock_mid = { VMBodygroups = { { ind = 2, bg = 1 } } },
    stock_collapsed = { VMBodygroups = { { ind = 2, bg = 2 } } },
    stock_none = { VMBodygroups = { { ind = 2, bg = 3 } } },
    stock_ump = { VMBodygroups = { { ind = 2, bg = 4 } }, WMBodygroups = { { ind = 2, bg = 4 } } },
    stock_ump_folded = { VMBodygroups = { { ind = 2, bg = 5 } }, WMBodygroups = { { ind = 2, bg = 5 } } },
    barrel_short = {
        VMBodygroups = { { ind = 7, bg = 1 } },
        AttPosMods = { [3] = { vpos = Vector(0, 4.31115, 0.82761) } },
    },
    barrel_long = {
        VMBodygroups = { { ind = 7, bg = 2 } },
        AttPosMods = { [3] = { vpos = Vector(0, 8.15115, 0.82761) } },
    },
    furniture_fde = { VMSkin = 1 },
    furniture_camo = { VMSkin = 2 },
    grip_folded = { VMBodygroups = { { ind = 3, bg = 1 } } },
}
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttIcon = Material("entities/att/uc_fort230_irons.png", "mips smooth"),
        Slot = { "optic_lp", "optic" },
        DefaultAttName = "Folding Iron Sights",
        InstalledEles = { "optic" },
        CorrectiveAng = Angle(0, 180, 0),
        Bone = "Handle",
        Offset = { vpos = Vector(0, -0.7, 2.37), vang = Angle(0, -90, 0) },
    },
    {
        PrintName = "Barrel",
        DefaultAttIcon = Material("entities/att/uc_fort230_barrel.png", "mips smooth"),
        Slot = "uc_fort230_barrel",
        DefaultAttName = "7.5\" Service Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttIcon = Material("entities/att/uc_fort230_muzzle.png", "mips smooth"),
        Slot = { "muzzle" },
        DefaultAttName = "Factory Flash Hider",
        Bone = "Handle",
        Offset = { vpos = Vector(0, 4.95115, 0.82761), vang = Angle(0, -90, 0) },
    },
    {
        PrintName = "Underbarrel",
        DefaultAttIcon = Material("entities/att/uc_fort230_grip.png", "mips smooth"),
        Slot = { "uc_fort230_grip", "foregrip" },
        DefaultAttName = "Deployed Factory Foregrip",
        Bone = "Handle",
        Offset = { vpos = Vector(0, 2.8, -0.22), vang = Angle(0, -90, 0) },
        MergeSlots = { 14 },
    },
    {
        PrintName = "Tactical",
        Slot = { "tac" },
        Bone = "Handle",
        Offset = { vpos = Vector(0.912, 0.28058, 0.902138), vang = Angle(0, -90, 90) },
    },
    {
        PrintName = "Magazine",
        DefaultAttIcon = Material("entities/att/uc_fort230_mag20.png", "mips smooth"),
        Slot = "uc_fort230_mag",
        DefaultAttName = "20-Round Magazine",
    },
    {
        PrintName = "Stock",
        DefaultAttIcon = Material("entities/att/uc_fort230_stock.png", "mips smooth"),
        Slot = "uc_fort230_stock",
        DefaultAttName = "Extended Factory Stock",
    },
    {
        PrintName = "Caliber",
        DefaultAttIcon = Material("entities/att/uc_bullets/9x19.png", "mips smooth"),
        Slot = "uc_fort230_caliber",
        DefaultAttName = "9x19mm Parabellum",
    },
    { PrintName = "Ammo Type", Slot = "uc_ammo", DefaultAttName = "Full Metal Jacket" },
    { PrintName = "Powder Load", Slot = "uc_powder", DefaultAttName = "Standard Load" },
    { PrintName = "Training Package", Slot = "uc_tp", DefaultAttName = "Basic Training" },
    { PrintName = "Internals", Slot = "uc_fg", DefaultAttName = "Standard Internals" },
    {
        PrintName = "Furniture",
        DefaultAttIcon = Material("entities/att/uc_fort230_furniture.png", "mips smooth"),
        Slot = "uc_fort230_furniture",
        DefaultAttName = "Factory Black",
    },
    {
        PrintName = "Underbarrel Weapon",
        Slot = { "ubgl", "uc_ubgl" },
        Bone = "Handle",
        Offset = { vpos = Vector(0, 0.8, 0.55), vang = Angle(0, -90, 0) },
        Hidden = true,
    },
}
local snd = "uc_fort230/"
local common = ")^/arccw_uc/common/"

SWEP.Animations = {
    idle = { Source = "idle", Time = 1 },
    idle_empty = { Source = "idle_empty", Time = 1 },
    draw = {
        Source = "draw",
        Time = 0.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.15,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    draw_empty = {
        Source = "draw_empty",
        Time = 0.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.15,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    holster = { Source = "holster", Time = 0.4, SoundTable = ArcCW.UC.HolsterSounds },
    holster_empty = { Source = "holster_empty", Time = 0.4, SoundTable = ArcCW.UC.HolsterSounds },
    fire = {
        Source = { "fire", "fire2", "fire3" },
        Time = 0.2,
        ShellEjectAt = 0,
        SoundTable = { { s = snd .. "updated/mech.wav", t = 0 } },
    },
    fire_empty = {
        Source = "fire_empty",
        Time = 0.2,
        ShellEjectAt = 0,
        SoundTable = { { s = snd .. "updated/mech.wav", t = 0 } },
    },
    reload = {
        Source = "reload",
        Time = 2.65,
        MinProgress = 2.3,
        LHIK = true,
        LHIKIn = 0.15,
        LHIKOut = 0.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        SoundTable = {
            { s = snd .. "lift.wav", t = 0 },
            { s = snd .. "updated/mag_release.wav", t = 0.235 },
            { s = snd .. "updated/mag_out.wav", t = 0.285 },
            { s = snd .. "updated/mag_in.wav", t = 1.789 },
        },
    },
    reload_empty = {
        Source = "reload_empty",
        Time = 3.267,
        MinProgress = 2.9,
        LHIK = true,
        LHIKIn = 0.15,
        LHIKOut = 0.3,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        SoundTable = {
            { s = snd .. "lift.wav", t = 0 },
            { s = snd .. "updated/mag_release.wav", t = 0.230 },
            { s = snd .. "updated/mag_out.wav", t = 0.283 },
            { s = snd .. "updated/mag_in.wav", t = 1.470 },
            { s = snd .. "updated/bolt_cycle.wav", t = 1.962 },
        },
    },
    fix = {
        Source = "charge",
        Time = 1.2,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0.2,
        SoundTable = { { s = snd .. "updated/bolt_cycle.wav", t = 0.295 } },
    },
    ready = {
        Source = "charge",
        Time = 1.2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.2,
        SoundTable = { { s = snd .. "lift.wav", t = 0 }, { s = snd .. "updated/bolt_cycle.wav", t = 0.295 } },
    },
}
SWEP.Malfunction = true
SWEP.MalfunctionMean = 300
SWEP.MalfunctionTakeRound = false

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local sustained = math.Clamp(((wep:GetBurstCount() or 0) - 1) / 7, 0, 1)
    rec.RecoilSide = rec.RecoilSide * Lerp(sustained, 1, 1.65)
    rec.Recoil = rec.Recoil * Lerp(sustained, 0.85, 1.1)
    return rec
end
SWEP.Hook_TranslateAnimation = function(wep, anim)
    local key = anim
    local mag = wep.Attachments and wep.Attachments[6] and wep.Attachments[6].Installed
    if anim == "reload" or anim == "reload_empty" then
        local capacity = mag == "uc_fort230_mag10" and "10" or (mag == "uc_fort230_mag30" and "30" or "20")
        if mag ~= "uc_fort230_mag60" and wep.Animations[anim .. "_" .. capacity] then
            key = anim .. "_" .. capacity
        end
    end
    if wep:GetBuff_Override("Override_FortFoldedGrip") and wep.Animations[key .. "_folded"] then
        key = key .. "_folded"
    end
    if mag == "uc_fort230_mag60" and wep.Animations[key .. "_drum"] then
        key = key .. "_drum"
    end
    if key ~= anim then
        return key
    end
end

local foley = {
    ready = {
        { s = common .. "cloth_4.ogg", t = 0.13, v = 0.35 },
        { s = common .. "grab-polymer.ogg", t = 0.74, v = 0.35 },
        { s = common .. "shoulder.ogg", t = 0.98, v = 0.5 },
    },
    fix = {
        { s = common .. "cloth_4.ogg", t = 0.12, v = 0.35 },
        { s = common .. "grab-polymer.ogg", t = 0.78, v = 0.3 },
    },
    reload = {
        { s = common .. "cloth_2.ogg", t = 0.10, v = 0.3 },
        { s = common .. "magpouch_gear.ogg", t = 0.85, v = 0.4 },
        { s = common .. "grab-polymer.ogg", t = 1.52, v = 0.3 },
        { s = common .. "rattle_b2i_rifle.ogg", t = 2.23, v = 0.3 },
        { s = common .. "shoulder.ogg", t = 2.43, v = 0.45 },
    },
    reload_empty = {
        { s = common .. "cloth_3.ogg", t = 0.10, v = 0.3 },
        { s = common .. "magpouch_gear.ogg", t = 0.78, v = 0.4 },
        { s = common .. "grab-polymer.ogg", t = 1.20, v = 0.3 },
        { s = common .. "cloth_4.ogg", t = 1.84, v = 0.3 },
        { s = common .. "rattle_b2i_rifle.ogg", t = 2.62, v = 0.3 },
        { s = common .. "shoulder.ogg", t = 3.02, v = 0.45 },
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

local function ReloadCues(a, duration, withdrawal, seating, bolt)
    a.Time = duration
    a.MinProgress = duration - 0.25
    a.LHIKIn = 0.10
    a.LHIKOut = 0.15
    a.SoundTable = {
        { s = snd .. "lift.wav", t = 0, v = 0.5 },
        { s = common .. "cloth_2.ogg", t = 0.08, v = 0.3 },
        { s = snd .. "updated/mag_release.wav", t = math.max(0, withdrawal - 0.10) },
        { s = snd .. "updated/mag_out.wav", t = math.max(0, withdrawal - 0.05) },
        { s = common .. "magpouch_gear.ogg", t = withdrawal + 0.25, v = 0.35 },
        { s = common .. "grab-polymer.ogg", t = seating - 0.28, v = 0.25 },
        { s = snd .. "updated/mag_in.wav", t = seating - 0.13 },
        { s = common .. "shoulder.ogg", t = duration - 0.17, v = 0.35 },
    }
    if bolt then
        a.SoundTable[#a.SoundTable + 1] =
            { s = snd .. "updated/bolt_pull.wav", t = 64 / 98 * duration - 0.08 }
        a.SoundTable[#a.SoundTable + 1] =
            { s = snd .. "updated/bolt_release.wav", t = 71 / 98 * duration - 0.07 }
        a.SoundTable[#a.SoundTable + 1] = { s = common .. "cloth_4.ogg", t = 54 / 98 * duration, v = 0.25 }
    end
    table.sort(a.SoundTable, function(x, y)
        return x.t < y.t
    end)
end
for _, base in ipairs({ "reload", "reload_empty" }) do
    local empty = base == "reload_empty"
    local a = SWEP.Animations[base]
    ReloadCues(
        a,
        a.Time,
        (empty and 10 / 98 or 11 / 87) * a.Time,
        (empty and 48 / 98 or 63 / 87) * a.Time,
        empty
    )
    for _, capacity in ipairs({ 10, 20, 30 }) do
        local variant = table.Copy(a)
        variant.Source = base .. "_" .. capacity
        local duration = capacity == 30 and (empty and 3.0 or 2.4) or (empty and 2.75 or 2.0)
        local count = empty and 98 or 87
        local outframe = capacity == 30 and (empty and 12 or 18) or (empty and 17 or 16)
        local seatframe = capacity == 30 and (empty and 45 or 62) or (empty and 48 or 42)
        ReloadCues(variant, duration, outframe / count * duration, seatframe / count * duration, empty)
        if capacity ~= 30 and not empty then
            for _, event in ipairs(variant.SoundTable) do
                if event.s == common .. "magpouch_gear.ogg" then
                    event.t = 0.08
                end
            end
            variant.SoundTable[#variant.SoundTable + 1] =
                { s = common .. "magpouch_replace_small.ogg", t = duration - 0.38, v = 0.3 }
            table.sort(variant.SoundTable, function(x, y)
                return x.t < y.t
            end)
        end
        SWEP.Animations[base .. "_" .. capacity] = variant
    end
end
for _, key in ipairs({ "ready", "fix" }) do
    local a = SWEP.Animations[key]
    a.Time = 1.6
    a.LHIKOut = 0.15
    a.SoundTable = {
        { s = common .. "cloth_4.ogg", t = 0.08, v = 0.3 },
        { s = snd .. "updated/bolt_pull.wav", t = 14 / 30 - 0.08 },
        { s = snd .. "updated/bolt_release.wav", t = 21 / 30 - 0.07 },
        { s = common .. "grab-polymer.ogg", t = 1.30, v = 0.3 },
        { s = common .. "shoulder.ogg", t = 1.45, v = 0.35 },
    }
end

for _, name in ipairs({
    "idle",
    "idle_empty",
    "draw",
    "draw_empty",
    "holster",
    "holster_empty",
    "fire",
    "fire_empty",
    "reload",
    "reload_empty",
    "ready",
    "fix",
    "reload_10",
    "reload_empty_10",
    "reload_20",
    "reload_empty_20",
    "reload_30",
    "reload_empty_30",
}) do
    local a = table.Copy(SWEP.Animations[name])
    if istable(a.Source) then
        for i, source in ipairs(a.Source) do
            a.Source[i] = source .. "_folded"
        end
    else
        a.Source = a.Source .. "_folded"
    end
    SWEP.Animations[name .. "_folded"] = a
end

for _, name in ipairs({ "reload", "reload_empty", "reload_folded", "reload_empty_folded" }) do
    local a = table.Copy(SWEP.Animations[name])
    for _, event in ipairs(a.SoundTable) do
        if event.s == snd .. "updated/mag_out.wav" then
            event.s = snd .. "updated/mag_out_drum.wav"
        end
        if event.s == snd .. "updated/mag_in.wav" then
            event.s = snd .. "updated/mag_in_drum.wav"
        end
    end
    SWEP.Animations[name .. "_drum"] = a
end

SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty
SWEP.DistantShootSoundOutdoors = {}
SWEP.DistantShootSoundIndoors = {}
SWEP.DistantShootSoundOutdoorsSilenced = {}
SWEP.DistantShootSoundIndoorsSilenced = {}
for i = 1, 6 do
    local n = string.format("%02d", i)
    SWEP.DistantShootSoundOutdoors[i] = ")arccw_uc/common/9x19/fire-dist-9x19-pistol-ext-" .. n .. ".ogg"
    SWEP.DistantShootSoundIndoors[i] = ")arccw_uc/common/9x19/fire-dist-9x19-pistol-int-" .. n .. ".ogg"
    SWEP.DistantShootSoundOutdoorsSilenced[i] = ")arccw_uc/common/sup-tail-" .. n .. ".ogg"
    SWEP.DistantShootSoundIndoorsSilenced[i] = ")arccw_uc/common/fire-dist-int-pistol-light-" .. n .. ".ogg"
end
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1

SWEP.Hook_ModifyBodygroups = function(wep, data)
    if not IsValid(data.vm) then
        return
    end
    data.vm:SetSkin(wep:GetBuff_Override("Override_FortFurnitureSkin") or 0)
    local sequence = data.vm:GetSequenceName(data.vm:GetSequence()) or ""
    local spare = sequence:match("^reload_empty_(%d+)") or sequence:match("^reload_(%d+)")
    data.vm:SetBodygroup(9, spare == "10" and 1 or (spare == "20" and 2 or 0))
    local bone = data.vm:LookupBone("fort_muzzle")
    if bone then
        local barrel = wep.Attachments[2].Installed
        data.vm:ManipulateBonePosition(
            bone,
            Vector(
                0,
                barrel == "uc_fort230_barrel_short" and 0.64
                    or (barrel == "uc_fort230_barrel_long" and -3.2 or 0),
                0
            )
        )
    end
    data.vm:SetBodygroup(8, wep.Attachments[5].Installed and 1 or 0)
    data.vm:SetBodygroup(4, wep.Attachments[3].Installed and 1 or 0)
    local underbarrel = wep.Attachments[4].Installed
    if
        wep.Attachments[14].Installed
        or (underbarrel and underbarrel ~= "uc_fort230_grip" and underbarrel ~= "uc_fort230_grip_folded")
    then
        data.vm:SetBodygroup(3, 2)
    end
end

if CLIENT then
    function SWEP:DoLHIK()
        if self:GetState() == ArcCW.STATE_CUSTOMIZE then
            local owner = self:GetOwner()
            if not IsValid(owner) then
                return
            end
            local bones = table.Copy(ArcCW.LHIKBones)
            bones[#bones + 1] = "ValveBiped.Bip01_L_Clavicle"
            for _, model in ipairs({ owner:GetViewModel(), owner:GetHands() }) do
                if IsValid(model) then
                    for _, name in ipairs(bones) do
                        local bone = model:LookupBone(name)
                        if bone then
                            local matrix = model:GetBoneMatrix(bone)
                            if matrix then
                                local hidden = Matrix(matrix)
                                hidden:SetTranslation(owner:EyePos() - Vector(0, 0, 256))
                                hidden:SetScale(Vector(0, 0, 0))
                                model:SetBoneMatrix(bone, hidden)
                            end
                        end
                    end
                end
            end
            return
        end
        self.Customize_Hide = 0
        return self.BaseClass.DoLHIK(self)
    end
end
