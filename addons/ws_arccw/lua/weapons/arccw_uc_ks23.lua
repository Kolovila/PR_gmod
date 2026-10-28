AddCSLuaFile()
SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.UseHands = true
SWEP.PrintName = "KS-23"
SWEP.TrueName = "KS-23"
SWEP.Trivia_Class = "Special-Purpose Carbine"
SWEP.Trivia_Desc =
    [[Soviet special-purpose carbine developed by TsNIItochMash for the Ministry of Internal Affairs and manufactured at Tula. Conceived in the 1970s for riot-control and other internal-security duties, it entered service in the 1980s with a family of irritant, buckshot and solid-projectile loads. Its name abbreviates 'Karabin Spetsialniy'; the rifled 23 mm bore accounts for its carbine designation despite its shotgun-like operation.

Hits harder per shot than conventional 12-gauge pumps, but carries fewer shells and cycles more slowly. Heavy recoil and broad buckshot patterns favor deliberate close-range shots. Three rounds in the tube leave little reserve after a miss, while specialized ammunition gives it uses beyond a conventional combat shotgun.]]
SWEP.Trivia_Manufacturer = "Tula Arms Company"
SWEP.Trivia_Calibre = "23x75mmR"
SWEP.Trivia_Mechanism = "Pump Action, Rotating Bolt"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1985
SWEP.Author = "UC conversion; original assets credited in README.md"
SWEP.Slot = 3
SWEP.ViewModel = "models/weapons/arccw/uc_ks23/c_ks23.mdl"
SWEP.WorldModel = SWEP.ViewModel
SWEP.ViewModelFOV = 68
SWEP.MirrorVMWM = true
SWEP.DefaultBodygroups = "00000000000000"
SWEP.WorldModelOffset =
    { pos = Vector(-8, 5, -4), ang = Angle(-8, 0, 180), bone = "ValveBiped.Bip01_R_Hand", scale = 1 }
SWEP.Damage = 20
SWEP.DamageMin = 56 / 12
SWEP.Num = 12
SWEP.RangeMin = 10
SWEP.Range = 38
SWEP.Penetration = 12
SWEP.DamageType = DMG_BUCKSHOT
SWEP.IsShotgun = true
SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
SWEP.MuzzleVelocity = 270
SWEP.PhysBulletMuzzleVelocity = 270
SWEP.HullSize = 0
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 3
SWEP.ExtendedClipSize = 3
SWEP.ReducedClipSize = 3
SWEP.Primary.DefaultClip = 12
SWEP.Primary.Ammo = "buckshot"
SWEP.Recoil = 5.2
SWEP.RecoilSide = 1.15
SWEP.RecoilRise = 0.3
SWEP.VisualRecoilMult = 1.15
SWEP.MaxRecoilBlowback = 1.6
SWEP.MaxRecoilPunch = 1.5
SWEP.Sway = 1.15

SWEP.Delay = 0.25
SWEP.Firemodes = { { Mode = 1, PrintName = "fcg.pump" }, { Mode = 0 } }
SWEP.ManualAction = true
SWEP.NoLastCycle = false
SWEP.ShotgunReload = true
SWEP.ReloadInSights = false
SWEP.Malfunction = false
SWEP.AccuracyMOA = 36
SWEP.HipDispersion = 450
SWEP.MoveDispersion = 160
SWEP.JumpDispersion = 1200
SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.65
SWEP.SightTime = 0.48
SWEP.ShootSpeedMult = 0.6
SWEP.BarrelLength = 31
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 180
SWEP.IronSightStruct =
    { Pos = Vector(-2.339, 0, 0.916), Ang = Angle(0.888, 0.013, 0), Magnification = 1.1, SwitchToSound = "" }
SWEP.ActivePos = Vector(0.4, 2.439, -0.16)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.SprintPos = Vector(1, -3, -1)
SWEP.SprintAng = Angle(5, 20, -15)
SWEP.HolsterPos = Vector(1, -2, -1)
SWEP.HolsterAng = Angle(-5, 25, -15)
SWEP.CustomizePos = Vector(4.96, 2.439, -0.28)
SWEP.CustomizeAng = Angle(14.634, 26.341, 6.829)
SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(3, 0, -3)
SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 4
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arc9/darsu_eft/shells/patron_23x75_sh10.mdl"
SWEP.ShellScale = 1
SWEP.ShellSounds = { "arccw_uc/common/40mm_casing_1.ogg" }
SWEP.ShellPitch = 125
SWEP.ShootVol = 160
SWEP.ShootPitch = 100
SWEP.ShootSound = ")uc_ks23/fire.wav"
SWEP.ShootSoundSilenced = ")uc_ks23/fire_sup.wav"
SWEP.ShootDrySound = "weapons/shotgun/shotgun_empty.wav"
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
local pump = {
    { s = "uc_ks23/pump_back.ogg", t = 5 / 35 },
    { s = "uc_ks23/eject.ogg", t = 4 / 35, v = 0.88 },
    { s = "uc_ks23/pump_forward_new.ogg", t = 11 / 35 },
}

SWEP.Hook_AddShootSound = function(wep, data)
    local harpoon = wep:GetBuff_Override("Override_UCKS23Harpoon")
    local bullpup = wep:GetBuff_Override("Override_UCKS23Bullpup")
    wep:MyEmitSound(
        bullpup and "uc_ks23/mech_ks23k.wav" or harpoon and "uc_ks23/mech_harpoon.wav" or "uc_ks23/mech.wav",
        75,
        data.pitch,
        0.75,
        CHAN_AUTO
    )
end
SWEP.Hook_GetShootSound = function(wep, sound)
    local caliber = wep.Attachments[7] and wep.Attachments[7].Installed
    local suppressed = wep:GetBuff_Override("Silencer")
    if caliber == "uc_ks23_caliber_23115" then
        return suppressed and ")uc_ks23/fire_sup_cannon.wav" or ")uc_ks23/fire_cannon.wav"
    elseif caliber == "uc_ks23_ammo_zvezda" then
        return suppressed and ")uc_ks23/fire_sup_zvezda.wav" or ")uc_ks23/fire_zvezda.wav"
    elseif wep:GetBuff_Override("Override_UCKS23RPG7") then
        return ")uc_ks23/fire_rpg.wav"
    elseif
        wep:GetBuff_Override("Override_UCKS23Mortar")
        or wep:GetBuff_Override("Override_ShootEntity") == "uc_ks23_gas_round"
    then
        return ")uc_ks23/fire_teargas.wav"
    elseif wep:GetBuff_Override("Override_UCKS23Harpoon") then
        return ")uc_ks23/fire_harpoon.wav"
    end
    return sound
end
local kMagSounds = {
    { s = "uc_ks23/mag_out_ks23k.ogg", t = 0.4 },
    { s = "uc_ks23/mag_in_ks23k.ogg", t = 1.8 },
    { s = "uc_ks23/mag_hit_ks23k.ogg", t = 142 / 60 },
}
local kDrumSounds = {
    { s = "uc_ks23/drum_out_ks23k.ogg", t = 0.4 },
    { s = "uc_ks23/drum_in_ks23k.ogg", t = 1.8 },
    { s = "uc_ks23/drum_hit_ks23k.ogg", t = 142 / 60 },
}
SWEP.Animations = {
    ks23k_idle = { Source = "ks23k_idle" },
    ks23k_draw = { Source = "ks23k_draw", Time = 0.7, SoundTable = ArcCW.UC.DrawSounds },
    ks23k_holster = { Source = "ks23k_holster", Time = 0.6, SoundTable = ArcCW.UC.HolsterSounds },
    ks23k_fire = { Source = "ks23k_fire", Time = 0.22, MinProgress = 0.2 },
    ks23k_fire_iron = { Source = "ks23k_fire_iron", Time = 0.22, MinProgress = 0.2 },
    ks23k_cycle = {
        Source = "ks23k_cycle",
        Time = 0.833,
        MinProgress = 0.8,
        ShellEjectAt = 0.24,
        SoundTable = {
            { s = "uc_ks23/pump_back_ks23k.ogg", t = 0.12 },
            { s = "uc_ks23/eject.ogg", t = 0.24, v = 0.88 },
            { s = "uc_ks23/pump_forward_ks23k.ogg", t = 0.51 },
        },
    },
    ks23k_reload = {
        Source = "ks23k_reload",
        Time = 3.4,
        MinProgress = 2.96,
        SoundTable = kMagSounds,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
    ks23k_reload_empty = {
        Source = "ks23k_reload_empty",
        Time = 4.15,
        MinProgress = 3.80,
        SoundTable = {
            { s = "uc_ks23/mag_out_ks23k.ogg", t = 0.4 },
            { s = "uc_ks23/mag_in_ks23k.ogg", t = 1.8 },
            { s = "uc_ks23/mag_hit_ks23k.ogg", t = 142 / 60 },
            { s = "uc_ks23/pump_back_ks23k.ogg", t = 3.10 },
            { s = "uc_ks23/pump_forward_ks23k.ogg", t = 3.48 },
        },
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
    ks23k_drum_reload = {
        Source = "ks23k_drum_reload",
        Time = 3.4,
        MinProgress = 2.96,
        SoundTable = kDrumSounds,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
    ks23k_drum_reload_empty = {
        Source = "ks23k_drum_reload_empty",
        Time = 4.15,
        MinProgress = 3.80,
        SoundTable = {
            { s = "uc_ks23/drum_out_ks23k.ogg", t = 0.4 },
            { s = "uc_ks23/drum_in_ks23k.ogg", t = 1.8 },
            { s = "uc_ks23/drum_hit_ks23k.ogg", t = 142 / 60 },
            { s = "uc_ks23/pump_back_ks23k.ogg", t = 3.10 },
            { s = "uc_ks23/pump_forward_ks23k.ogg", t = 3.48 },
        },
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
    ks23k_bash = { Source = "ks23k_bash", Time = 1.1 },
    idle = { Source = "base_idle" },
    draw = { Source = "base_draw", Time = 0.7, SoundTable = ArcCW.UC.DrawSounds },
    ready = { Source = "base_draw", Time = 0.7, SoundTable = ArcCW.UC.DrawSounds },
    holster = { Source = "base_holster", Time = 0.6, SoundTable = ArcCW.UC.HolsterSounds },
    fire = { Source = { "base_fire_1", "base_fire_2" }, Time = 0.22, MinProgress = 0.2 },
    fire_iron = { Source = { "iron_fire_1", "iron_fire_2" }, Time = 0.22, MinProgress = 0.2 },
    cycle = {
        Source = { "base_fire_cock_1", "base_fire_cock_2" },
        Time = 0.82,
        MinProgress = 0.8,
        ShellEjectAt = 4 / 35,
        SoundTable = pump,
    },
    cycle_iron = {
        Source = { "iron_fire_cock_1", "iron_fire_cock_2" },
        Time = 0.82,
        MinProgress = 0.8,
        ShellEjectAt = 4 / 35,
        SoundTable = pump,
    },
    sgreload_start = { Source = "base_reload_start", Time = 0.6, RestoreAmmo = 0 },
    sgreload_insert = {
        Source = "base_reload_insert",
        Time = 0.9,
        MinProgress = 0.65,
        SoundTable = {
            { s = "uc_ks23/insert_port.ogg", t = 0.24 },
            {
                s = "uc_ks23/shell_insert.ogg",
                t = 0.3,
            },
        },
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
    sgreload_finish = { Source = "base_reload_end", Time = 0.65 },

    sgreload_finish_empty = { Source = "base_fire_cock_1", Time = 0.82, MinProgress = 0.8, SoundTable = pump },
    harpoon_reload = {
        Source = "harpoon_reload",
        Time = 3.2,
        MinProgress = 2.76,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        SoundTable = {
            { s = "uc_ks23/shell_insert.ogg", t = 0.32 },
            { s = "uc_ks23/pump_back.ogg", t = 0.72 },
            { s = "uc_ks23/harpoon_slide.ogg", t = 1.75, v = 0.65 },
            { s = "uc_ks23/harpoon_tug.ogg", t = 2.2, v = 0.6 },
            { s = "uc_ks23/harpoon_seat.ogg", t = 2.64, v = 0.8 },
            { s = "uc_ks23/pump_forward_new.ogg", t = 3.04 },
        },
    },
    bash = { Source = "base_melee_bash", Time = 1.1 },
}

local common = "arccw_uc/common/"
local cycleFoley = {
    { 0.02, "cloth_2.ogg", 0.28 },
    { 0.30, "cloth_4.ogg", 0.22 },
    { 0.53, "rattle.ogg", 0.13 },
    { 0.66, "grab.ogg", 0.20 },
}
local magFoley = {
    { 0.06, "cloth_3.ogg", 0.30 },
    { 0.14, "grab.ogg", 0.16 },
    { 0.62, "cloth_4.ogg", 0.25 },
    { 0.88, "magpouch.ogg", 0.30 },
    { 1.48, "cloth_2.ogg", 0.25 },
    { 2.62, "cloth_6.ogg", 0.26 },
    { 2.86, "rattle.ogg", 0.14 },
    { 3.04, "grab.ogg", 0.22 },
}
local emptyMagFoley = {
    { 0.06, "cloth_3.ogg", 0.30 },
    { 0.14, "grab.ogg", 0.16 },
    { 0.62, "cloth_4.ogg", 0.25 },
    { 0.88, "magpouch.ogg", 0.30 },
    { 1.48, "cloth_2.ogg", 0.25 },
    { 2.62, "cloth_6.ogg", 0.26 },
    { 2.96, "grab.ogg", 0.22 },
    { 3.27, "cloth_2.ogg", 0.23 },
    { 3.61, "rattle.ogg", 0.14 },
    { 3.76, "shoulder.ogg", 0.22 },
}
local animationFoley = {
    cycle = cycleFoley,
    cycle_iron = cycleFoley,
    sgreload_finish_empty = cycleFoley,
    ks23k_cycle = {
        { 0.02, "cloth_2.ogg", 0.28 },
        { 0.44, "cloth_4.ogg", 0.23 },
        { 0.59, "rattle.ogg", 0.13 },
        { 0.71, "grab.ogg", 0.20 },
    },
    sgreload_start = {
        { 0.03, "cloth_3.ogg", 0.30 },
        { 0.10, "grab.ogg", 0.16 },
        { 0.37, "rattle.ogg", 0.14 },
    },
    sgreload_insert = {
        { 0.02, "cloth_3.ogg", 0.23 },
        { 0.14, "cloth_2.ogg", 0.24 },
        {
            0.59,
            "cloth_4.ogg",
            0.22,
        },
    },
    sgreload_finish = {
        { 0.03, "cloth_6.ogg", 0.28 },
        { 0.24, "grab.ogg", 0.24 },
        { 0.39, "shoulder.ogg", 0.22 },
    },
    ks23k_reload = magFoley,
    ks23k_drum_reload = magFoley,
    ks23k_reload_empty = emptyMagFoley,
    ks23k_drum_reload_empty = emptyMagFoley,
    harpoon_reload = {
        { 0.06, "cloth_2.ogg", 0.25 },
        { 0.13, "grab.ogg", 0.16 },
        { 0.24, "uc_ks23/insert_port.ogg", 0.65 },
        { 0.82, "cloth_3.ogg", 0.28 },
        { 0.96, "magpouch_gear.ogg", 0.28 },
        { 1.40, "cloth_4.ogg", 0.24 },
        { 1.62, "grab.ogg", 0.20 },
        { 2.38, "cloth_2.ogg", 0.20 },
        { 2.78, "cloth_6.ogg", 0.25 },
        { 2.97, "grab.ogg", 0.22 },
        { 3.13, "shoulder.ogg", 0.20 },
    },
    bash = { { 0.05, "cloth_4.ogg", 0.32 }, { 0.60, "cloth_2.ogg", 0.25 }, { 0.88, "grab.ogg", 0.20 } },
    ks23k_bash = { { 0.05, "cloth_4.ogg", 0.32 }, { 0.60, "cloth_2.ogg", 0.25 }, { 0.88, "grab.ogg", 0.20 } },
}
for name, cues in pairs(animationFoley) do
    local animation = SWEP.Animations[name]
    local sounds = {}
    for _, event in ipairs(animation.SoundTable or {}) do
        local copy = {}
        for key, value in pairs(event) do
            copy[key] = value
        end
        sounds[#sounds + 1] = copy
    end
    for _, cue in ipairs(cues) do
        sounds[#sounds + 1] =
            { t = cue[1], s = string.find(cue[2], "/", 1, true) and cue[2] or common .. cue[2], v = cue[3] }
    end
    animation.SoundTable = sounds
end

local reloadLHIK = {
    sgreload_start = { 0.12, 0 },
    sgreload_insert = { 0, 0 },
    sgreload_finish = { 0, 0.22 },
    sgreload_finish_empty = { 0, 0.22 },
    harpoon_reload = { 0.12, 0.22 },
    ks23k_reload = { 0.12, 0.24 },
    ks23k_reload_empty = { 0.12, 0.24 },
    ks23k_drum_reload = { 0.12, 0.24 },
    ks23k_drum_reload_empty = { 0.12, 0.24 },
    draw = { 0.10, 0.16 },
    ready = { 0.10, 0.16 },
    holster = { 0.10, 0 },
    bash = { 0.10, 0.18 },
    ks23k_draw = { 0.10, 0.16 },
    ks23k_holster = { 0.10, 0 },
    ks23k_bash = { 0.10, 0.18 },
}
for name, blend in pairs(reloadLHIK) do
    local animation = SWEP.Animations[name]
    animation.LHIK = true
    animation.LHIKIn = blend[1]
    animation.LHIKOut = blend[2]
end
SWEP.CanBash = true
SWEP.MeleeDamage = 35
SWEP.MeleeRange = 40
SWEP.MeleeTime = 1.1
SWEP.MeleeAttackTime = 0.3
SWEP.AttachmentElements = {
    ks23k_barrel_long = { VMBodygroups = { { ind = 12, bg = 2 } } },
    ks23k_barrel_vented = { VMBodygroups = { { ind = 12, bg = 3 } } },
    ks23k_barrel_suppressed = { VMBodygroups = { { ind = 12, bg = 4 } } },
    ks23k_forend_grooved = { VMBodygroups = { { ind = 13, bg = 2 } } },
    ks23k_forend_alloy = { VMBodygroups = { { ind = 13, bg = 3 } } },
    ks23k_drum = { VMBodygroups = { { ind = 9, bg = 2 }, { ind = 11, bg = 1 } } },
    ks23_tube_extended = { VMBodygroups = { { ind = 10, bg = 1 } } },
    ks23_bullpup = {
        AttPosMods = {
            [1] = { vpos = Vector(-0.05089, -5.58, 2.44) },
            [5] = { vpos = Vector(-0.05089, 2.04, 0.10) },
            [14] = { vpos = Vector(-0.05089, 2.04, 1.05) },
        },
        VMBodygroups = {
            { ind = 0, bg = 1 },
            { ind = 1, bg = 8 },
            { ind = 2, bg = 5 },
            { ind = 3, bg = 4 },
            { ind = 4, bg = 12 },
            { ind = 5, bg = 2 },
            { ind = 9, bg = 1 },
            { ind = 10, bg = 2 },
        },
    },
    ks23_stock_toz123_polymer = { VMBodygroups = { { ind = 1, bg = 7 } } },
    ks23_forend_toz123_polymer = { VMBodygroups = { { ind = 3, bg = 3 } } },
    ks23_stock_toz123 = { VMBodygroups = { { ind = 1, bg = 6 } } },
    ks23_forend_toz123 = { VMBodygroups = { { ind = 3, bg = 2 } } },
    ks23_wire = { VMBodygroups = { { ind = 1, bg = 1 } } },
    ks23_pistol = { VMBodygroups = { { ind = 1, bg = 2 } } },
    ks23_folder = { VMBodygroups = { { ind = 1, bg = 3 } } },
    ks23_folded = { VMBodygroups = { { ind = 1, bg = 4 } } },
    ks23_410 = { VMBodygroups = { { ind = 2, bg = 1 } } },
    ks23_700 = { VMBodygroups = { { ind = 2, bg = 2 } } },
    ks23_shield = { VMBodygroups = { { ind = 2, bg = 3 } } },
    ks23_stock_polymer = { VMBodygroups = { { ind = 1, bg = 5 } } },
    ks23_suppressed = { VMBodygroups = { { ind = 2, bg = 4 }, { ind = 5, bg = 1 } } },
    ks23_shell_30mm = { VMBodygroups = { { ind = 4, bg = 11 } } },
    ks23_shell_sh25 = { VMBodygroups = { { ind = 4, bg = 1 } } },
    ks23_shell_bar = { VMBodygroups = { { ind = 4, bg = 2 } } },
    ks23_shell_waver = { VMBodygroups = { { ind = 4, bg = 3 } } },
    ks23_shell_strela = { VMBodygroups = { { ind = 4, bg = 6 } } },
    ks23_shell_cheremukha = { VMBodygroups = { { ind = 4, bg = 7 } } },
    ks23_shell_siren = { VMBodygroups = { { ind = 4, bg = 8 } } },
    ks23_shell_pv23 = { VMBodygroups = { { ind = 4, bg = 9 } } },
    ks23_mortar_6 = { VMBodygroups = { { ind = 6, bg = 1 } } },
    ks23_mortar_12 = { VMBodygroups = { { ind = 6, bg = 2 } } },
    ks23_shell_volna = { VMBodygroups = { { ind = 4, bg = 10 } } },
    ks23_shell_23115 = { VMBodygroups = { { ind = 4, bg = 5 } } },
    ks23_shell_zvezda = { VMBodygroups = { { ind = 4, bg = 4 } } },
    ks23_polymer = { VMBodygroups = { { ind = 3, bg = 1 } } },
}
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        CorrectiveAng = Angle(0, 180, 0),
        Slot = { "optic", "optic_lp", "optic_sniper" },
        Bone = "Weapon",
        Offset = { vpos = Vector(-0.05089, 0.51654, 2.0), vang = Angle(0, -90, 0) },
        InstalledEles = { "ks23_optic_mount" },
    },
    {
        PrintName = "Barrel",
        DefaultAttName = "20.1\" Rifled Barrel",
        DefaultAttIcon = Material("entities/uc_ks23/barrel_default.png", "mips smooth"),
        Slot = "uc_ks23_barrel",
    },
    { PrintName = "Muzzle Mortar", DefaultAttName = "None", Slot = "uc_ks23_mortar", Hidden = false },
    {
        PrintName = "Forend",
        DefaultAttName = "Wooden Forend",
        DefaultAttIcon = Material("entities/uc_ks23/forend_default.png", "mips smooth"),
        Slot = "uc_ks23_forend",
    },
    {
        PrintName = "Foregrip",
        Slot = "foregrip",
        Bone = "Pump",
        Offset = { vpos = Vector(-0.05089, 3.44, -1.40), vang = Angle(0, -90, 0) },
        InstalledEles = { "ks23_pump_mount" },
        MergeSlots = { 14 },
    },
    {
        PrintName = "Variant",
        DefaultAttName = "KS-23",
        DefaultAttIcon = Material("entities/uc_ks23/variant_default.png", "mips smooth"),
        Slot = "uc_ks23_variant",
        Bone = "Weapon",
        Offset = { vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0) },
    },
    {
        Bone = "UCKS23_Harpoon",
        Offset = { vpos = Vector(-0.05089, 21.61654, 0.61249), vang = Angle(0, -90, 0) },
        PrintName = "Caliber",
        DefaultAttName = "23 mm Shrapnel-10",
        DefaultAttIcon = Material("entities/uc_ks23/caliber_default.png", "mips smooth"),
        Slot = "uc_ks23_caliber",
    },
    {
        PrintName = "Tube Types",
        DefaultAttName = "Standard Tube",
        DefaultAttIcon = Material("entities/uc_ks23/tube_default.png", "mips smooth"),
        Slot = "uc_ks23_tube",
    },
    {
        PrintName = "Stock",
        Bone = "Weapon",
        Offset = { vpos = Vector(0, 0, 0), vang = Angle(0, 0, 0) },
        DefaultAttName = "Wooden Shoulder Stock",
        DefaultAttIcon = Material("entities/uc_ks23/stock_default.png", "mips smooth"),
        Slot = "uc_ks23_stock",
    },
    {
        PrintName = "Ammo",
        DefaultAttName = "Standard Loading",
        Slot = "ud_ammo_shotgun",
        ExcludeFlags = { "ks23_dedicated" },
    },
    { PrintName = "Training Package", DefaultAttName = "Basic Training", Slot = "uc_tp" },
    { PrintName = "Internals", DefaultAttName = "Standard Internals", Slot = "uc_fg" },
    { PrintName = "Powder Load", DefaultAttName = "Standard Load", Slot = "uc_powder" },
    {
        PrintName = "Underbarrel Weapon",
        Slot = "uc_ubgl",
        Bone = "Pump",
        Offset = { vpos = Vector(-0.05089, 3.44, -0.45), vang = Angle(0, -90, 0) },
        InstalledEles = { "ks23_pump_mount" },
        Hidden = true,
    },
}

local function updateKS23Slots(wep)
    if not wep.Attachments then
        return
    end
    if wep.UCKS23SlotTable ~= wep.Attachments then
        local own = {}
        for i, slot in pairs(wep.Attachments) do
            own[i] = {}
            for k, v in pairs(slot) do
                own[i][k] = v
            end
        end
        wep.Attachments = own
        wep.UCKS23SlotTable = own
        wep.UCKS23SlotMode = nil
    end
    local a = wep.Attachments
    local kit = (a[6] and a[6].Installed == "uc_ks23_barrel_ks23k") or false

    if a[3] then
        a[3].Hidden = kit
    end
    if wep.UCKS23SlotMode == kit then
        return
    end
    wep.UCKS23SlotMode = kit
    if a[2] then
        a[2].Slot = kit and "uc_ks23_ks23k_barrel" or "uc_ks23_barrel"
        a[2].DefaultAttName = kit and "18.1\" KS-23K Service Barrel" or "20.1\" Rifled Barrel"
        a[2].DefaultAttIcon = Material(
            kit and "entities/uc_ks23/ks23k_barrel_default.png" or "entities/uc_ks23/barrel_default.png",
            "mips smooth"
        )
    end
    if a[6] then
        a[6].DefaultAttName = "KS-23"
    end
    if a[9] then
        a[9].Slot = kit and "uc_ks23_ks23k_stock" or "uc_ks23_stock"
        a[9].DefaultAttName = kit and "Standard Buttplate" or "Wooden Shoulder Stock"
        a[9].DefaultAttIcon = Material(
            kit and "entities/uc_ks23/ks23k_support_pad.png" or "entities/uc_ks23/stock_default.png",
            "mips smooth"
        )
    end
    if a[4] then
        a[4].Slot = kit and "uc_ks23_ks23k_forend" or "uc_ks23_forend"
        a[4].DefaultAttName = kit and "Ribbed Barrel Sleeve" or "Wooden Forend"
        a[4].DefaultAttIcon = kit and Material("entities/uc_ks23/ks23k_forend_default.png", "mips smooth")
            or Material("entities/uc_ks23/forend_default.png", "mips smooth")
    end
    if a[8] then
        a[8].Slot = kit and "uc_ks23_ks23k_mag" or "uc_ks23_tube"
        a[8].PrintName = kit and "Magazine" or "Tube Types"
        a[8].DefaultAttName = kit and "7-Round Box Magazine" or "Standard Tube"
        a[8].DefaultAttIcon = Material(
            kit and "entities/uc_ks23/ks23k_mag_default.png" or "entities/uc_ks23/tube_default.png",
            "mips smooth"
        )
    end
end
SWEP.UCKS23UpdateSlots = updateKS23Slots

SWEP.Hook_ModDispersion = function(wep, dispersion)
    local owner = wep:GetOwner()
    if
        IsValid(owner)
        and owner:IsPlayer()
        and owner:Crouching()
        and owner:OnGround()
        and owner:GetVelocity():Length2D() < 15
        and wep:GetSightDelta() < 0.1
    then
        return dispersion * 0.65
    end
end
SWEP.Hook_ModifyRecoil = function(wep, recoil)
    local owner = wep:GetOwner()
    if
        IsValid(owner)
        and owner:IsPlayer()
        and owner:Crouching()
        and owner:OnGround()
        and owner:GetVelocity():Length2D() < 15
        and wep:GetSightDelta() < 0.1
    then
        recoil.Recoil = recoil.Recoil * 0.85
        recoil.RecoilSide = recoil.RecoilSide * 0.85
        return recoil
    end
end
SWEP.Hook_NameChange = function(wep, name)
    local a = wep.Attachments
    if a and a[6] and a[6].Installed == "uc_ks23_barrel_ks23k" then
        return "KS-23K"
    end
    local stock = a and a[9] and a[9].Installed
    local forend = a and a[4] and a[4].Installed
    local sportingStock = stock == "uc_ks23_stock_toz123" or stock == "uc_ks23_stock_toz123_polymer"
    local sportingForend = forend == "uc_ks23_forend_toz123" or forend == "uc_ks23_forend_toz123_polymer"
    if sportingStock and sportingForend then
        return "TOZ-123"
    end
    return "KS-23"
end

local function harpoonVisible(wep, world)
    if not wep:GetBuff_Override("Override_UCKS23Harpoon") then
        return 0
    end
    if wep:GetReloading() then
        if not world and wep.LastAnimKey == "harpoon_reload" then
            local elapsed = (CurTime() - (wep.LastAnimStartTime or CurTime()))
                / wep:GetBuff_Mult("Mult_ReloadTime")
            if elapsed >= 0.8 and elapsed <= 3.2 then
                return 1
            end
        end
        return 0
    end
    return wep:Clip1() > 0 and not wep:GetNeedCycle() and 1 or 0
end

SWEP.Hook_Think = function(wep)
    local a = wep.Attachments
    if SERVER and a and a[2] and a[2].Installed == "uc_ks23_barrel_ks23k" and wep.Detach and wep.Attach then
        wep:Detach(2, true)
        wep:Attach(6, "uc_ks23_barrel_ks23k", true)
    end
    if SERVER and a and a[9] and wep.Detach and wep.Attach then
        local kit = a[9].Installed
        if
            kit == "uc_ks23_barrel_ks23k"
            or kit == "uc_ks23_stock_kovrov"
            or kit == "uc_ks23_stock_vlasov"
        then
            wep:Detach(9, true)
            wep:Attach(6, kit, true)
        end
    end
    updateKS23Slots(wep)
    local mortar = wep:GetBuff_Override("Override_UCKS23Mortar")
    local payload = 0
    if mortar and wep:Clip1() > 0 and not wep:GetNeedCycle() and not wep:GetReloading() then
        payload = mortar == "6" and 1 or 2
    end

    if
        wep.LastAnimKey == "harpoon_reload"
        and (wep:GetBuff_Override("Override_UCKS23Harpoon") or wep:GetBuff_Override("Override_UCKS23RPG7"))
        and wep:Clip1() > 0
        and wep:GetNeedCycle()
        and CurTime() >= (wep.LastAnimStartTime or CurTime()) + 2.76 * wep:GetBuff_Mult("Mult_ReloadTime")
    then
        wep:SetNeedCycle(false)
    end
    if
        wep:GetBuff_Override("Override_UCKS23Bullpup")
        and (wep.LastAnimKey == "ks23k_reload_empty" or wep.LastAnimKey == "ks23k_drum_reload_empty")
        and wep:Clip1() > 0
        and wep:GetNeedCycle()
        and CurTime() >= (wep.LastAnimStartTime or CurTime()) + 3.80 * wep:GetBuff_Mult("Mult_ReloadTime")
    then
        wep:SetNeedCycle(false)
    end
    local harpoon = harpoonVisible(wep, false)
    wep:SetBodygroup(8, harpoon)
    wep:SetBodygroup(7, payload)
    if CLIENT then
        if IsValid(wep.WMModel) then
            wep.WMModel:SetBodygroup(8, harpoonVisible(wep, true))
            wep.WMModel:SetBodygroup(7, payload)
        end
        local owner = wep:GetOwner()
        if IsValid(owner) and owner:IsPlayer() then
            local vm = owner:GetViewModel()
            if IsValid(vm) then
                vm:SetBodygroup(8, harpoon)
                vm:SetBodygroup(7, payload)
            end
        end
    end
end

SWEP.Hook_ModifyBodygroups = function(wep, data)
    updateKS23Slots(wep)
    if not data or not IsValid(data.vm) then
        return
    end
    local loaded = wep:Clip1() > 0 and not wep:GetNeedCycle() and not wep:GetReloading()
    local harpoon = harpoonVisible(wep, data.wm)
    local mortar = wep:GetBuff_Override("Override_UCKS23Mortar")
    local payload = loaded and mortar and (mortar == "6" and 1 or 2) or 0
    data.vm:SetBodygroup(12, 0)
    data.vm:SetBodygroup(13, 0)
    data.vm:SetBodygroup(11, 0)
    data.vm:SetBodygroup(10, wep:GetBuff_Override("Override_UCKS23TubeExtended") and 1 or 0)
    data.vm:SetBodygroup(8, harpoon)
    data.vm:SetBodygroup(7, payload)

    if wep:GetBuff_Override("Override_UCKS23Bullpup") then
        for _, group in ipairs({
            { 0, 1 },
            { 1, 8 },
            { 2, 5 },
            { 3, 4 },
            { 4, 12 },
            { 5, 2 },
            { 6, 0 },
            {
                7,
                0,
            },
            {
                8,
                0,
            },
            {
                9,
                1,
            },
            {
                10,
                2,
            },
        }) do
            data.vm:SetBodygroup(group[1], group[2])
        end
        local optic = wep.Attachments and wep.Attachments[1] and wep.Attachments[1].Installed
        local barrel = wep:GetBuff_Override("Override_UCKS23KBarrel") or 1
        data.vm:SetBodygroup(12, barrel + (optic and 4 or 0))
        if optic then
            data.vm:SetBodygroup(9, 3)
        end
        data.vm:SetBodygroup(13, wep:GetBuff_Override("Override_UCKS23KForend") or 1)
        if wep:GetBuff_Override("Override_UCKS23KDrum") then
            data.vm:SetBodygroup(9, optic and 4 or 2)
            data.vm:SetBodygroup(11, 1)
        end
    end
end

SWEP.AttachmentElements.ks23_optic_mount = {
    VMElements = {
        {
            Model = "models/weapons/arccw/uc_ks23/optic_rail.mdl",
            Bone = "Weapon",
            Offset = { pos = Vector(-0.05089, 0.51654, 1.60), ang = Angle(0, -90, 0) },
            Scale = Vector(1, 1, 1),
            DrawFunc = function(wep, element)
                if not wep:GetBuff_Override("Override_UCKS23Bullpup") then
                    return
                end
                local model = element.Model
                local ang = model:GetAngles()
                local pos = model:GetPos() + ang:Forward() * -6.09654 + ang:Up() * 0.42
                model:SetPos(pos)
                model:SetRenderOrigin(pos)
            end,
        },
    },
}
SWEP.AttachmentElements.ks23_pump_mount = {
    VMElements = {
        {
            Model = "models/weapons/arccw/uc_ks23/pump_rail.mdl",
            Bone = "Pump",
            Offset = { pos = Vector(-0.05089, 3.44, -1.16), ang = Angle(0, -90, 0) },
            Scale = Vector(1, 1, 1),
            DrawFunc = function(wep, element)
                if wep:GetBuff_Override("Override_UCKS23Prototype") == 3 then
                    local model = element.Model
                    local pos = model:GetPos() + model:GetAngles():Up() * 1.34
                    model:SetPos(pos)
                    model:SetRenderOrigin(pos)
                    return
                end
                if not wep:GetBuff_Override("Override_UCKS23Bullpup") then
                    return
                end
                local model = element.Model
                local ang = model:GetAngles()
                local pos = model:GetPos() + ang:Forward() * -1.40 + ang:Up() * 1.50
                model:SetPos(pos)
                model:SetRenderOrigin(pos)
            end,
        },
    },
}

if SERVER then
    AddCSLuaFile("arccw/shared/uc_ks23/prototypes.lua")
end
include("arccw/shared/uc_ks23/prototypes.lua")
