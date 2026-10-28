SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "RAA-14"
SWEP.TrueName = "AA-12"
SWEP.Trivia_Class = "Shotgun"
SWEP.Trivia_Desc =
    "Open-bolt automatic combat shotgun built around a long-travel constant-recoil action. Its deliberately slow cyclic rate and heavy moving assembly spread the recoil impulse out, making a held burst markedly easier to control than the first shot suggests. The sealed stainless action was designed to tolerate fouling and harsh field conditions, while detachable magazines keep its considerable appetite for 12-gauge ammunition manageable."
SWEP.Trivia_Manufacturer = "Iscapelli Armaments"
SWEP.Trivia_Calibre = "12 Gauge"
SWEP.Trivia_Mechanism = "Gas-Operated, Open Bolt"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 1984

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Military Police Systems Inc."
end

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/c_uc_aa12_drums_r1.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uc_aa12_drums_r1.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = ArcCW.UC.StdDmg["12g_s"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["12g_s"].min
SWEP.Penetration = ArcCW.UC.StdDmg["12g_s"].pen
SWEP.Num = ArcCW.UC.StdDmg["12g_s"].num
SWEP.Range = 45
SWEP.RangeMin = 5
SWEP.DamageType = DMG_BULLET + DMG_BUCKSHOT
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 400
SWEP.PhysBulletMuzzleVelocity = 365

SWEP.HullSize = 0.25

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 8

SWEP.IsShotgun = true

SWEP.Recoil = 1.85
SWEP.RecoilSide = 0.75

SWEP.RecoilRise = 0.24
SWEP.VisualRecoilMult = 0.65
SWEP.MaxRecoilBlowback = 0.65
SWEP.MaxRecoilPunch = 0.8

SWEP.Sway = 0.8

SWEP.MalfunctionMean = 180
SWEP.MalfunctionTakeRound = false

SWEP.TriggerDelay = false
SWEP.Delay = 60 / 300

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0,
    },
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 15

SWEP.AccuracyMOA = 24
SWEP.HipDispersion = 275
SWEP.MoveDispersion = 175
SWEP.JumpDispersion = 350

SWEP.Primary.Ammo = "buckshot"
SWEP.MagID = "aa12"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_aa12/"
local common = ")/arccw_uc/common/"
local rottle = {
    common .. "cloth_2.ogg",
    common .. "cloth_3.ogg",
    common .. "cloth_4.ogg",
    common .. "cloth_6.ogg",
    common .. "rattle.ogg",
}
local rutle = {
    common .. "movement-pistol-01.ogg",
    common .. "movement-pistol-02.ogg",
    common .. "movement-pistol-03.ogg",
    common .. "movement-pistol-04.ogg",
}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = { path .. "mech.wav" }
SWEP.FiremodeSound = { path .. "mech.wav", path .. "mech.wav" }

SWEP.ShootSound = {
    path .. "fire1.wav",
    path .. "fire2.wav",
    path .. "fire3.wav",
}

local tail = ")/arccw_uc/common/12ga/"

SWEP.ShootSoundSilenced = {
    path .. "fire1_sup.wav",
    path .. "fire2_sup.wav",
    path .. "fire3_sup.wav",
}
SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-12ga-pasg-ext-01.ogg",
    tail .. "fire-dist-12ga-pasg-ext-02.ogg",
    tail .. "fire-dist-12ga-pasg-ext-03.ogg",
    tail .. "fire-dist-12ga-pasg-ext-04.ogg",
    tail .. "fire-dist-12ga-pasg-ext-05.ogg",
    tail .. "fire-dist-12ga-pasg-ext-06.ogg",
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
    common .. "sup-tail-05.ogg",
    common .. "sup-tail-06.ogg",
    common .. "sup-tail-07.ogg",
    common .. "sup-tail-08.ogg",
    common .. "sup-tail-09.ogg",
    common .. "sup-tail-10.ogg",
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg",
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 1
SWEP.UC_ShellColor = Color(0.7 * 255, 0.2 * 255, 0.2 * 255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.860
SWEP.SightTime = 0.48
SWEP.ShootSpeedMult = 1

SWEP.BulletBones = {}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.8, -2.439, 0.36),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.36, 0, 0.48)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(7.2, 0, -0.2)
SWEP.CustomizeAng = Angle(11.707, 32.195, 6.829)

SWEP.HolsterPos = Vector(0.72, 0, 0.96)
SWEP.HolsterAng = Angle(-12.683, 12.683, -7.805)

SWEP.BarrelLength = 18
SWEP.ExtraSightDist = 10

SWEP.WElements = {
    ["steyr_acr_w"] = {
        type = "Model",
        model = "models/weapons/v_coldwar_steyracr.mdl",
        bone = "ValveBiped.Bip01_R_Hand",
        rel = "",
        pos = Vector(-4, -6, 7),
        angle = Angle(35, -160, -35),
        size = Vector(1, 1, 1),
        color = Color(255, 255, 255, 255),
        surpresslightning = false,
        bonemerge = false,
        highrender = false,
        nocull = false,
        material = "",
        skin = 0,
        bodygroup = {},
    },
}

SWEP.AttachmentElements = {

    ["barrel_double"] = {
        VMBodygroups = {
            { ind = 1, bg = 1 },
        },
    },
    ["barrel_ported"] = {
        VMBodygroups = {
            { ind = 1, bg = 2 },
        },
    },
    ["barrel_doubleported"] = {
        VMBodygroups = {
            { ind = 1, bg = 3 },
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            { ind = 3, bg = 1 },
        },
    },
    ["rail"] = {
        VMBodygroups = {
            { ind = 4, bg = 1 },
            { ind = 5, bg = 1 },
        },
    },
    ["mag_5"] = {
        VMBodygroups = { { ind = 2, bg = 1 } },
    },
    ["mag_20"] = {
        VMBodygroups = { { ind = 2, bg = 2 } },
    },
    ["mag_100"] = {
        VMBodygroups = { { ind = 2, bg = 3 } },
    },

    ["skin_fde"] = { VMSkin = 1 },
    ["skin_dark"] = { VMSkin = 2 },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttIcon = Material("entities/att/uc_aa12_irons.png", "mips smooth"),
        DefaultAttName = "Iron Sights",
        Slot = { "optic", "optic_sniper", "optic_lp" },
        Bone = "tag_eotech",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 0),
        },
        VMScale = Vector(1, 1, 1),
        InstalledEles = { "rail" },
    },
    {
        PrintName = "Barrel",
        DefaultAttIcon = Material("entities/att/uc_aa12_barrel.png", "mips smooth"),
        Slot = { "uc_aa12_barrel" },
        DefaultAttName = "18\" Factory Barrel",
        ExcludeFlags = { "conv_gl", "conv_50bmg" },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = { "muzzle" },
        Bone = "tag_silencer",
        VMScale = Vector(1, 1, 1),
        WMScale = VMScale,
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 0),
        },
        ExcludeFlags = { "aa12_integral_ports", "aa12_twin_barrel" },
    },
    {
        PrintName = "Underbarrel",
        Slot = { "foregrip", "ubgl" },
        Bone = "tag_foregrip",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Tactical",
        Slot = { "tac" },
        Bone = "tag_heartbeat",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 180),
        },
    },
    {
        PrintName = "Magazine",
        DefaultAttIcon = Material("entities/att/uc_aa12_mag.png", "mips smooth"),
        Slot = { "uc_aa12_mag" },
        DefaultAttName = "8-Round Magazine",
        ExcludeFlags = { "conv_gl", "mag_762", "conv_50bmg", "mag_9mm" },
    },
    {
        PrintName = "Stock",
        DefaultAttIcon = Material("entities/att/uc_aa12_stock.png", "mips smooth"),
        Slot = { "uc_aa12_stock" },
        DefaultAttName = "Factory Stock",
        ExcludeFlags = { "conv_gl", "conv_50bmg" },
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training",
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals",
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"BUCK\" #00 Buckshot",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth"),
        Slot = { "ud_ammo_shotgun" },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "reg_idle",
        Time = 0,
    },
    ["ready"] = {
        Source = "reg_draw_first",
        Time = 0.75,
        SoundTable = {
            { s = rottle, t = 0.17 },
            { s = "uc_aa12/bolt_cycle.wav", t = 0.30 },
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["draw"] = {
        Source = "reg_draw",
        Time = 0.75,
        SoundTable = {
            { s = rottle, t = 0.17 },
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["holster"] = {
        Source = "reg_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
    },
    ["fire"] = {
        Source = { "reg_fire" },
        Time = 0.5,
        SoundTable = {
            { s = { "uc_aa12/mech.wav" }, t = 0.005 },
        },
    },
    ["fire_empty"] = {
        Source = { "reg_fire" },
        Time = 0.5,
        SoundTable = {
            { s = { "uc_aa12/mech.wav" }, t = 0.005 },
        },
    },
    ["dryfire"] = {
        Source = { "reg_fire" },
        Time = 0.5,
        SoundTable = {
            { s = { "uc_aa12/mech.wav" }, t = 0.005 },
        },
    },
    ["reload"] = {
        Source = "reg_reload",
        Time = 82 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 30,
        Checkpoints = { 17, 27, 54 },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            { s = "uc_aa12/mag_out.wav", t = 17 / 30 },
            { s = common .. "magpouch_gear.ogg", t = 27 / 30 },
            { s = common .. "magpouch_replace_small.ogg", t = 35 / 30 },
            { s = "uc_aa12/mag_in.wav", t = 54 / 30 },
        },
    },
    ["reload_empty"] = {
        Source = "reg_reload_empty",
        Time = 107 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 30,
        Checkpoints = { 18, 28, 56, 75 },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            { s = "uc_aa12/mag_out.wav", t = 18 / 30 },
            { s = common .. "magpouch_gear.ogg", t = 28 / 30 },
            { s = common .. "magpouch_replace_small.ogg", t = 36 / 30 },
            { s = "uc_aa12/mag_in.wav", t = 56 / 30 },
            { s = "uc_aa12/bolt_cycle.wav", t = 72 / 30 },
        },
    },
    ["reload_drum"] = {
        Source = "reg_reload_drum",
        Time = 82 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 30,
        Checkpoints = { 17, 27, 54 },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {

            {
                s = "uc_aa12/drum_out.wav",
                t = 14 / 30 - 0.28,
                AA12ActionTime = 14 / 30,
                AA12SoundLead = 0.28,
            },
            { s = common .. "magpouch_gear.ogg", t = 29 / 30 },
            { s = "uc_aa12/drum_in.wav", t = 47 / 30 - 0.32, AA12ActionTime = 47 / 30, AA12SoundLead = 0.32 },
            {
                s = "uc_aa12/drum_hit.wav",
                t = 52 / 30 - 0.08,
                AA12ActionTime = 52 / 30,
                AA12SoundLead = 0.08,
            },
        },
    },
    ["reload_empty_drum"] = {
        Source = "reg_reload_empty_drum",
        Time = 107 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 30,
        Checkpoints = { 18, 28, 56, 75 },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {
                s = "uc_aa12/drum_out.wav",
                t = 15 / 30 - 0.28,
                AA12ActionTime = 15 / 30,
                AA12SoundLead = 0.28,
            },
            { s = common .. "magpouch_gear.ogg", t = 29 / 30 },
            { s = "uc_aa12/drum_in.wav", t = 52 / 30 - 0.32, AA12ActionTime = 52 / 30, AA12SoundLead = 0.32 },
            {
                s = "uc_aa12/drum_hit.wav",
                t = 56 / 30 - 0.08,
                AA12ActionTime = 56 / 30,
                AA12SoundLead = 0.08,
            },
            {
                s = "uc_aa12/bolt_cycle.wav",
                t = 84 / 30 - 0.45,
                AA12ActionTime = 84 / 30,
                AA12SoundLead = 0.45,
            },
        },
    },
}

function SWEP:PlaySoundTable(events, rate, start, key)
    if key == "reload_drum" or key == "reload_empty_drum" then
        events = table.Copy(events)
        for _, event in ipairs(events) do
            if event.AA12ActionTime then
                event.t = math.max(0, event.AA12ActionTime - event.AA12SoundLead * (rate or 1))
            end
        end
    end
    return baseclass.Get("arccw_base").PlaySoundTable(self, events, rate, start, key)
end

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local now = CurTime()
    local delay = wep:GetBuff("Delay") or SWEP.Delay

    if not wep.AA12_LastRecoilShot or now - wep.AA12_LastRecoilShot > delay * 1.6 then
        wep.AA12_ConstantRecoilShots = 0
    end

    local shots = math.min((wep.AA12_ConstantRecoilShots or 0) + 1, 5)
    local settled = (shots - 1) / 4

    wep.AA12_ConstantRecoilShots = shots
    wep.AA12_LastRecoilShot = now

    rec.Recoil = rec.Recoil * Lerp(settled, 1.08, 0.72)
    rec.RecoilSide = rec.RecoilSide * Lerp(settled, 0.85, 0.62)
    rec.VisualRecoilMul = rec.VisualRecoilMul * Lerp(settled, 1.10, 0.68)

    return rec
end

if CLIENT then
    function SWEP:DrawWorldModel()
        local owner = self:GetOwner()
        local welem = self.WElements and self.WElements["steyr_acr_w"]

        if IsValid(owner) and welem then
            local bone = owner:LookupBone(welem.bone or "ValveBiped.Bip01_R_Hand")
            if not bone then
                self:DrawModel()
                return
            end

            local pos, ang = owner:GetBonePosition(bone)
            if not pos then
                self:DrawModel()
                return
            end

            ang:RotateAroundAxis(ang:Forward(), welem.angle.y)
            ang:RotateAroundAxis(ang:Right(), welem.angle.p)
            ang:RotateAroundAxis(ang:Up(), welem.angle.r)

            pos = pos + ang:Right() * welem.pos.x + ang:Forward() * welem.pos.y + ang:Up() * welem.pos.z

            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
            self:DrawModel()
        else
            self:DrawModel()
        end
    end
end
