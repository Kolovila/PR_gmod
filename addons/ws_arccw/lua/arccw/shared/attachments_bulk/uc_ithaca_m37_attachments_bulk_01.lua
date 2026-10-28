local ucPartIcons = {
    ["uc_m37_barrel_short"] = true,
    ["uc_m37_barrel_trench"] = true,
    ["uc_m37_carryhandle"] = true,
    ["uc_m37_pump_heavy"] = true,
    ["uc_m37_pump_light"] = true,
    ["uc_m37_pump_wood"] = true,
    ["uc_m37_stock_rifle"] = true,
    ["uc_m37_stock_woodgrip"] = true,
    ["uc_m37_tube_medium"] = true,
    ["uc_m37_tube_short"] = true,
}
local function loadUCPartIcon(att, id)
    if ucPartIcons[id] then
        att.Icon = Material("entities/att/uc_profiles/arccw_uc_m37/" .. id .. ".png", "mips smooth")
    end
    ArcCW.LoadAttachmentType(att, id)
end

do
    local att = {}

    att.PrintName = "18.5\" Stakeout Barrel"
    att.AbbrevName = "Stakeout Barrel"
    att.Description =
        "A compact defensive barrel. Fast through doors and from the hip, at the cost of a wider pattern, sharper recoil, and much shorter useful range."
    att.Slot = "uc_m37_barrel"
    att.RequireFlags = { "m37_compact_tube" }
    att.SortOrder = 20
    att.AutoStats = true

    att.Mult_Range = 0.72
    att.Mult_AccuracyMOA = 1.35
    att.Mult_HipDispersion = 0.78
    att.Mult_Recoil = 1.12
    att.Mult_Sway = 0.82
    att.Mult_SightTime = 0.82
    att.Mult_SpeedMult = 1.035
    att.Add_BarrelLength = -6.1

    att.ActivateElements = { "m37_barrel_short" }
    att.Override_MuzzleEffectAttachment = 6

    loadUCPartIcon(att, "uc_m37_barrel_short")
end

do
    local att = {}

    att.PrintName = "20\" Trench Barrel"
    att.AbbrevName = "Trench Barrel"
    att.Description =
        "A thick riot-length barrel with a ventilated heat shield and bayonet hardware. The forward weight reins in the featherweight action, but is slower to present."
    att.Slot = "uc_m37_barrel"
    att.SortOrder = 10
    att.AutoStats = true

    att.Mult_AccuracyMOA = 0.82
    att.Mult_HipDispersion = 0.9
    att.Mult_Recoil = 0.92
    att.Mult_Sway = 0.9
    att.Mult_SightTime = 1.1
    att.Mult_SpeedMult = 0.97
    att.Add_BarrelLength = 1.5

    att.ActivateElements = { "m37_barrel_trench" }
    att.Override_MuzzleEffectAttachment = 5

    loadUCPartIcon(att, "uc_m37_barrel_trench")
end

do
    local att = {}

    att.PrintName = "20 Gauge Conversion"
    att.AbbrevName = "20 Gauge"
    att.Description =
        "A factory-pattern smallbore barrel and action set. Twenty gauge throws fewer, lighter pellets with substantially softer recoil and a tighter useful pattern."
    att.Icon = Material("entities/att/uc_bullets/20g.png", "mips smooth")
    att.Slot = "uc_m37_caliber"
    att.SortOrder = 10
    att.AutoStats = true

    att.Override_Trivia_Calibre = "20 Gauge"
    att.Override_Damage = 17
    att.Override_DamageMin = 9
    att.Override_Num = 7
    att.Override_Penetration = 2
    att.Override_Range = 48
    att.Override_RangeMin = 4
    att.Override_DamageType = DMG_BUCKSHOT
    att.Override_AccuracyMOA = 23
    att.Override_AccuracyMOA_Priority = 0
    att.Override_HullSize = 0.35
    att.Override_IsShotgun = true
    att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

    att.Mult_Recoil = 0.72
    att.Mult_RecoilSide = 0.8
    att.Mult_VisualRecoilMult = 0.78
    att.Mult_RPM = 1.06
    att.Mult_ShootPitch = 1.12
    att.Mult_ShootVol = 0.93
    att.Mult_MuzzleVelocity = 0.92

    att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
    att.Override_ShellScale = 0.86
    att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

    local fire = {
        ")weapons/arccw_ud/870/fire-01.ogg",
        ")weapons/arccw_ud/870/fire-02.ogg",
        ")weapons/arccw_ud/870/fire-03.ogg",
        ")weapons/arccw_ud/870/fire-04.ogg",
        ")weapons/arccw_ud/870/fire-05.ogg",
        ")weapons/arccw_ud/870/fire-06.ogg",
    }
    local fireSup = {
        ")weapons/arccw_ud/870/fire-sup-01.ogg",
        ")weapons/arccw_ud/870/fire-sup-02.ogg",
        ")weapons/arccw_ud/870/fire-sup-03.ogg",
        ")weapons/arccw_ud/870/fire-sup-04.ogg",
        ")weapons/arccw_ud/870/fire-sup-05.ogg",
        ")weapons/arccw_ud/870/fire-sup-06.ogg",
    }
    local distant = {
        ")arccw_uc/common/ub12ga/fire-dist-01.ogg",
        ")arccw_uc/common/ub12ga/fire-dist-02.ogg",
        ")arccw_uc/common/ub12ga/fire-dist-03.ogg",
        ")arccw_uc/common/ub12ga/fire-dist-04.ogg",
        ")arccw_uc/common/ub12ga/fire-dist-05.ogg",
        ")arccw_uc/common/ub12ga/fire-dist-06.ogg",
    }

    att.Hook_GetShootSound = function(wep, sound)
        return wep:GetBuff_Override("Silencer") and fireSup or fire
    end

    att.Hook_GetDistantShootSoundOutdoors = function(wep, sound)
        if not wep:GetBuff_Override("Silencer") then
            return distant
        end
    end

    loadUCPartIcon(att, "uc_m37_cal_20g")
end

do
    local att = {}

    att.PrintName = ".410 Bore Conversion"
    att.AbbrevName = ".410 Bore"
    att.Description =
        "A slim .410 barrel, chamber and shell stops fitted to the Model 37 action. The tiny shotshell is exceptionally controllable and fast to work, but its sparse payload loses authority quickly."
    att.Icon = Material("entities/att/uc_bullets/20g.png", "mips smooth")
    att.Slot = "uc_m37_caliber"
    att.SortOrder = 20
    att.AutoStats = true

    att.Override_Trivia_Calibre = ".410 Bore"
    att.Override_Damage = 14
    att.Override_DamageMin = 7
    att.Override_Num = 5
    att.Override_Penetration = 1
    att.Override_Range = 32
    att.Override_RangeMin = 3
    att.Override_DamageType = DMG_BUCKSHOT
    att.Override_AccuracyMOA = 19
    att.Override_AccuracyMOA_Priority = 0
    att.Override_HullSize = 0.15
    att.Override_IsShotgun = true
    att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

    att.Mult_Recoil = 0.42
    att.Mult_RecoilSide = 0.55
    att.Mult_VisualRecoilMult = 0.5
    att.Mult_RPM = 1.12
    att.Mult_ShootPitch = 1.08
    att.Mult_ShootVol = 0.82
    att.Mult_MuzzleVelocity = 0.86
    att.Mult_SightTime = 0.94

    att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
    att.Override_ShellScale = 1
    att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

    local fire = { ")uc_m37/cal_410_fire.wav" }
    local fireSup = { ")uc_m37/cal_410_fire_sup.wav" }
    local distant = { ")uc_m37/cal_410_fire_dist.wav" }
    local distantIndoor = { ")uc_m37/cal_410_fire_dist_int.wav" }

    att.Hook_GetShootSound = function(wep, sound)
        return wep:GetBuff_Override("Silencer") and fireSup or fire
    end

    att.Hook_GetDistantShootSoundOutdoors = function(wep, sound)
        if not wep:GetBuff_Override("Silencer") then
            return distant
        end
    end

    att.Hook_GetDistantShootSoundIndoors = function(wep, sound)
        if not wep:GetBuff_Override("Silencer") then
            return distantIndoor
        end
    end

    loadUCPartIcon(att, "uc_m37_cal_410")
end

do
    local att = {}

    att.PrintName = "BAR Carry Handle"
    att.AbbrevName = "Carry Handle"
    att.Description =
        "A folding carry handle fitted ahead of the receiver. The extra hardware slightly steadies sustained fire, but adds weight high on the gun."
    att.Slot = "uc_m37_carryhandle"
    att.SortOrder = 10
    att.AutoStats = true

    att.Mult_Sway = 0.95
    att.Mult_RecoilRise = 0.96
    att.Mult_SightTime = 1.07
    att.Mult_SpeedMult = 0.99

    att.ActivateElements = { "m37_carryhandle" }

    loadUCPartIcon(att, "uc_m37_carryhandle")
end

do
    local att = {}

    att.PrintName = "Heavy Fore-end"
    att.AbbrevName = "Heavy Pump"
    att.Description =
        "A reinforced fore-end that calms the light shotgun, but takes longer to bring onto target."
    att.Slot = "uc_m37_pump"
    att.SortOrder = 30
    att.AutoStats = true

    att.Mult_Recoil = 0.93
    att.Mult_RecoilSide = 0.9
    att.Mult_Sway = 0.9
    att.Mult_SightTime = 1.1
    att.Mult_SpeedMult = 0.98
    att.Mult_CycleTime = 1.18
    att.Mult_RPM = 1 / 1.18
    att.Mult_FireAnimTime = 1.18

    att.ActivateElements = { "m37_pump_heavy" }

    att.Hook_SelectReloadAnimation = function(wep, anim)
        if anim == "sgreload_finish_empty" then
            return anim .. "_pump_heavy"
        end
    end

    loadUCPartIcon(att, "uc_m37_pump_heavy")
end

do
    local att = {}

    att.PrintName = "Lightweight Fore-end"
    att.AbbrevName = "Light Pump"
    att.Description =
        "A stripped-down fore-end that makes the action quicker to present, at the cost of a less settled firing grip."
    att.Slot = "uc_m37_pump"
    att.SortOrder = 20
    att.AutoStats = true

    att.Mult_SightTime = 0.92
    att.Mult_SpeedMult = 1.02
    att.Mult_Sway = 1.12
    att.Mult_RecoilSide = 1.08
    att.Mult_CycleTime = 0.82
    att.Mult_RPM = 1 / 0.82
    att.Mult_FireAnimTime = 0.82

    att.ActivateElements = { "m37_pump_light" }

    att.Hook_SelectReloadAnimation = function(wep, anim)
        if anim == "sgreload_finish_empty" then
            return anim .. "_pump_light"
        end
    end

    loadUCPartIcon(att, "uc_m37_pump_light")
end

do
    local att = {}

    att.PrintName = "Walnut Fore-end"
    att.AbbrevName = "Wooden Pump"
    att.Description =
        "A traditional walnut fore-end. Its broad profile steadies the hand without adding much weight."
    att.Slot = "uc_m37_pump"
    att.SortOrder = 10
    att.AutoStats = true

    att.Mult_RecoilSide = 0.96
    att.Mult_Sway = 0.96
    att.Mult_SightTime = 1.02
    att.Mult_CycleTime = 0.96
    att.Mult_RPM = 1 / 0.96
    att.Mult_FireAnimTime = 0.96

    att.ActivateElements = { "m37_pump_wood" }

    att.Hook_SelectReloadAnimation = function(wep, anim)
        if anim == "sgreload_finish_empty" then
            return anim .. "_pump_wood"
        end
    end

    loadUCPartIcon(att, "uc_m37_pump_wood")
end

do
    local att = {}

    att.PrintName = "Walnut Rifle Stock"
    att.AbbrevName = "Rifle Stock"
    att.Description =
        "The traditional full walnut stock. A firm shoulder weld makes the light shotgun far easier to control and aim, but gives up the Stakeout configuration's compact handling."
    att.Slot = "uc_m37_stock"
    att.SortOrder = 10
    att.AutoStats = true

    att.Mult_Recoil = 0.72
    att.Mult_RecoilSide = 0.75
    att.Mult_VisualRecoilMult = 0.78
    att.Mult_HipDispersion = 0.86
    att.Mult_Sway = 0.72
    att.Mult_SightTime = 1.08
    att.Mult_SpeedMult = 0.975
    att.Add_BarrelLength = 8

    att.ActivateElements = { "m37_stock_rifle" }

    att.Hook_TranslateAnimation = function(wep, anim)
        local stocked = anim .. "_stock"
        if wep.Animations[stocked] then
            return stocked
        end
    end

    loadUCPartIcon(att, "uc_m37_stock_rifle")
end

do
    local att = {}

    att.PrintName = "Walnut Stakeout Grip"
    att.AbbrevName = "Wooden Grip"
    att.Description =
        "A sawn-off walnut rifle stock with a broad handhold. It handles faster than a shoulder stock while giving the rear hand a firmer grip."
    att.Slot = "uc_m37_stock"
    att.SortOrder = 20
    att.AutoStats = true

    att.Mult_Recoil = 0.9
    att.Mult_RecoilSide = 0.92
    att.Mult_VisualRecoilMult = 0.9
    att.Mult_HipDispersion = 0.94
    att.Mult_SightTime = 0.96
    att.Mult_SpeedMult = 1.01
    att.Add_BarrelLength = 1.5

    att.ActivateElements = { "m37_stock_woodgrip" }

    att.Hook_TranslateAnimation = function(wep, anim)
        local stocked = anim .. "_stock"
        if wep.Animations[stocked] then
            return stocked
        end
    end

    loadUCPartIcon(att, "uc_m37_stock_woodgrip")
end

do
    local att = {}

    att.PrintName = "6-Round Magazine Tube"
    att.AbbrevName = "6-Round Tube"
    att.Description =
        "A shortened magazine tube that trades one shell for less forward weight and a quicker reload from empty."
    att.Slot = "uc_m37_tube"
    att.GivesFlags = { "m37_compact_tube" }
    att.SortOrder = 10
    att.AutoStats = true

    att.Override_ClipSize = 6
    att.Override_ClipSize_Priority = 2
    att.Mult_SightTime = 0.96
    att.Mult_Sway = 0.95
    att.Mult_ReloadTime = 0.96
    att.Mult_SpeedMult = 1.012

    att.ActivateElements = { "m37_tube_medium" }

    loadUCPartIcon(att, "uc_m37_tube_medium")
end

do
    local att = {}

    att.PrintName = "5-Round Magazine Tube"
    att.AbbrevName = "5-Round Tube"
    att.Description =
        "The flush sporting tube. Two fewer shells make the shotgun notably livelier and easier to top off."
    att.Slot = "uc_m37_tube"
    att.GivesFlags = { "m37_compact_tube" }
    att.SortOrder = 20
    att.AutoStats = true

    att.Override_ClipSize = 5
    att.Override_ClipSize_Priority = 2
    att.Mult_SightTime = 0.91
    att.Mult_Sway = 0.9
    att.Mult_ReloadTime = 0.91
    att.Mult_SpeedMult = 1.025

    att.ActivateElements = { "m37_tube_short" }

    loadUCPartIcon(att, "uc_m37_tube_short")
end
