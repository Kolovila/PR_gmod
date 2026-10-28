do
    local att = {}

    att.PrintName = "Active Radar Missile"
    att.AbbrevName = "RADAR-A"
    att.Icon = Material("entities/att/uc_igla/missile_active.png", "smooth mips")
    att.Description =
        [[An autonomous radar-guided interceptor. Launch toward a vehicle; its seeker searches a 6000 HU forward volume and acquires the nearest visible hostile vehicle. Lead the shot yourself. High speed and independent acquisition come at the cost of warhead power. Changing missiles unloads the tube.]]
    att.Slot = "uc_igla_round"
    att.AutoStats = true
    att.Desc_Pros =
        { "No pre-launch lock required", "15000 HU/s maximum speed", "Autonomous vehicle acquisition" }
    att.Desc_Cons = { "360 blast damage", "180 HU blast radius", "Can acquire an unintended hostile vehicle" }
    att.Desc_Neutrals = { "Changing rounds unloads the tube" }
    att.Override_UCIglaRound = "active"
    att.Override_Damage = 360
    att.Override_DamageMin = 360
    att.Override_BlastRadius = 180
    att.ActivateElements = { "uc_igla_active" }

    ArcCW.LoadAttachmentType(att, "uc_igla_active")
end

do
    local att = {}

    att.PrintName = "Heavy Laser-Guided Missile"
    att.AbbrevName = "LASER"
    att.Icon = Material("entities/att/uc_igla/missile_laser.png", "smooth mips")
    att.Description =
        [[A heavy laser-guided missile. Follow the target through the sight until impact. Increased damage trades away speed, blast coverage and autonomous guidance. Changing missiles unloads the tube.]]
    att.Slot = "uc_igla_round"
    att.AutoStats = true
    att.Desc_Pros = { "900 blast damage", "No target lock required", "Aim-guided flight" }
    att.Desc_Cons = {
        "7000 HU/s maximum speed",
        "155 HU blast radius",
        "Maintain sight throughout flight",
        "No proximity fuse",
    }
    att.Desc_Neutrals = { "Changing rounds unloads the tube" }
    att.Override_UCIglaRound = "laser"
    att.Override_Damage = 900
    att.Override_DamageMin = 900
    att.Override_BlastRadius = 155
    att.ActivateElements = { "uc_igla_laser" }

    ArcCW.LoadAttachmentType(att, "uc_igla_laser")
end

do
    local att = {}

    att.PrintName = "Semi-Active Radar Missile"
    att.AbbrevName = "RADAR-S"
    att.Icon = Material("entities/att/uc_igla/missile_passive.png", "smooth mips")
    att.Description =
        [[A semi-active radar seeker follows the launcher's illuminated vehicle. Acquire faster inside a smaller cone; keep aiming and retain lock after firing. You may acquire another vehicle to redirect the missile. Lost illumination leaves it flying straight until a new lock is acquired.]]
    att.Slot = "uc_igla_round"
    att.AutoStats = true
    att.Desc_Pros = { "1.1 s base acquisition", "13500 HU/s maximum speed", "Retarget during flight" }
    att.Desc_Cons =
        { "3.5 degree acquisition cone", "Maintain lock throughout flight", "210 HU blast radius" }
    att.Desc_Neutrals = { "Changing rounds unloads the tube" }
    att.Override_UCIglaRound = "passive"
    att.Override_BlastRadius = 210
    att.ActivateElements = { "uc_igla_passive" }

    ArcCW.LoadAttachmentType(att, "uc_igla_passive")
end

do
    local att = {}

    att.PrintName = "Igla Tube-Change Drill"
    att.AbbrevName = "QUICK CHANGE"
    att.Icon = Material("entities/att/uc_igla/training_reload.png", "smooth mips")
    att.Description =
        [[A practiced gripstock transfer and tube-change routine. Preparation and acquisition times remain unchanged.]]
    att.Slot = "uc_igla_training"
    att.AutoStats = true
    att.Mult_ReloadTime = 0.65

    ArcCW.LoadAttachmentType(att, "uc_igla_reload")
end

do
    local att = {}

    att.PrintName = "Igla Thermal Observation Sight"
    att.AbbrevName = "THERMAL"
    att.Icon = Material("entities/att/uc_igla/optic_thermal.png", "smooth mips")
    att.Description =
        [[A 3.5x thermal observation sight with white-hot imaging, range readout and seeker indications. Vehicle acquisition remains dependent on the installed missile seeker.]]
    att.Slot = "uc_igla_optic"
    att.AutoStats = true
    att.Desc_Pros = { "White-hot observation", "Visual acquisition / range / missile display" }
    att.Desc_Cons = { "Narrower view", "Tracking tones replaced by scope hum" }
    att.Mult_SightTime = 1.15
    att.Mult_SightedSpeedMult = 0.85
    att.Override_UCIglaThermal = true
    att.ActivateElements = { "uc_igla_scope" }
    att.Override_IronSightStruct = {
        Pos = Vector(-2.385, -4.878, 2.88),
        Ang = Angle(2.213, -0.87, -0.772),
        Magnification = 1,
        ScopeMagnification = 3.5,
        MagnifiedOptic = true,
        ViewModelFOV = 55,
        Thermal = false,
        ThermalScopeSimple = false,
        ThermalFullColor = false,
        ThermalScopeColor = Color(255, 255, 255),
        ThermalHighlightColor = Color(255, 255, 255),
        Contrast = 1.2,
        Brightness = 0,
        CrosshairInSights = false,
        SwitchToSound = "igla/iron_in.wav",
        SwitchFromSound = "igla/iron_out.wav",
    }

    ArcCW.LoadAttachmentType(att, "uc_igla_scope")
end
