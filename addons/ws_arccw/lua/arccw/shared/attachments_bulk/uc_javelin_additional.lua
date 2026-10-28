do
    local att = {}

    att.PrintName = "Proximity Fragmentation"
    att.Icon = Material("entities/att/uc_javelin/airburst.png", "smooth mips")
    att.Description =
        [[A proximity fuze bursts within 110 units of the captured target after arming, provided the missile has a clear line to it. Useful with Personnel Recognition; cover prevents premature proximity bursts.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "Armed proximity detonation", "250-unit fragment radius" }
    att.Desc_Cons = { "Very weak armour impact", "Only 170 blast damage" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "airburst"

    ArcCW.LoadAttachmentType(att, "ucj_airburst")
end

do
    local att = {}

    att.PrintName = "Reinforced Tube Frame"
    att.Icon = Material("entities/att/uc_javelin/brace.png", "smooth mips")
    att.Description =
        [[A pair of steel longitudinal rails and cross-yokes protects the launch tube and steadies the CLU. Added bulk slows handling and tube replacement.]]
    att.Slot = "ucj_body"
    att.AutoStats = true
    att.Desc_Pros = { "Steadier hold", "15% faster lock" }
    att.Desc_Cons = { "Heavier frame", "10% longer reload" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJBody = "brace"
    att.Mult_Sway = 0.55
    att.Mult_Recoil = 0.7
    att.Mult_SightTime = 1.15
    att.Mult_SpeedMult = 0.9
    att.Mult_ReloadTime = 1.1
    att.Override_UCJLockMult = 0.85
    att.ActivateElements = { "ucj_brace" }

    ArcCW.LoadAttachmentType(att, "ucj_brace")
end

do
    local att = {}

    att.PrintName = "Breaching Payload"
    att.Icon = Material("entities/att/uc_javelin/breach.png", "smooth mips")
    att.Description =
        [[A heavy demolition round with strong impact splash and reduced reach. Slow, less agile flight favours fixed objectives and light vehicles.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "380 blast damage", "320-unit radius" }
    att.Desc_Cons = { "30% reduced reach", "22% slower flight", "10% slower replacement" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "breach"
    att.Mult_Range = 0.7
    att.Mult_ReloadTime = 1.1

    ArcCW.LoadAttachmentType(att, "ucj_breach")
end

do
    local att = {}

    att.PrintName = "Fragmentation Payload"
    att.Icon = Material("entities/att/uc_javelin/frag.png", "smooth mips")
    att.Description =
        [[A thin-walled fragmentation warhead trades the tandem jet for a wider blast. Best against exposed crews and light vehicles.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "Wider 420-unit blast", "300 blast damage" }
    att.Desc_Cons = { "Greatly reduced armour penetration" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "frag"

    ArcCW.LoadAttachmentType(att, "ucj_frag")
end

do
    local att = {}

    att.PrintName = "Guidance Gyro Upgrade"
    att.Icon = Material("entities/att/uc_javelin/gyro.png", "smooth mips")
    att.Description =
        [[Improved seeker stabilisation reduces acquisition time and lets airborne missiles turn more rapidly. Requires a slightly longer sensor preparation cycle.]]
    att.Slot = "ucj_internal"
    att.AutoStats = true
    att.Desc_Pros = { "20% faster missile steering", "15% faster lock" }
    att.Desc_Cons = { "20% longer seeker preparation" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJSeeker = "gyro"
    att.Override_UCJLockMult = 0.85
    att.Override_UCJCoolingMult = 1.2

    ArcCW.LoadAttachmentType(att, "ucj_gyro")
end

do
    local att = {}

    att.PrintName = "Insulated Motor Igniter"
    att.Icon = Material("entities/att/uc_javelin/insulated.png", "smooth mips")
    att.Description =
        [[An insulated ignition pack delays the main motor briefly, extending the soft-launch coast. A larger power connector makes servicing slower.]]
    att.Slot = "ucj_internal"
    att.AutoStats = true
    att.Desc_Pros = { "20% faster seeker preparation", "Longer soft-launch coast" }
    att.Desc_Cons = { "12% longer reload" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJSeeker = "insulated"
    att.Override_UCJCoolingMult = 0.8
    att.Mult_ReloadTime = 1.12

    ArcCW.LoadAttachmentType(att, "ucj_insulated")
end

do
    local att = {}

    att.PrintName = "Short-Range CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_close.png", "smooth mips")
    att.Description =
        [[A wide-angle sensor and shortened arming routine permit DIRECT shots down to 180 units. Reduced motor output and a softer payload limit the close-range blast. TOP still needs its normal clearance.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "180-unit minimum DIRECT range", "Wide search cone" }
    att.Desc_Cons = { "60% less maximum range", "30% reduced payload damage", "25% slower flight" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Short-Range CLU"
    att.Override_UCJMinDirect = 180
    att.Override_UCJArmingDistance = 110
    att.Override_UCJOpticRange = 0.4
    att.Override_UCJOpticSpeed = 0.75
    att.Override_UCJOpticDamage = 0.7
    att.Override_UCJAcquireCone = 9
    att.Override_UCJRetainCone = 12
    att.Override_UCJOpticLockMult = 0.85
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 1.6,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_close")
end

do
    local att = {}

    att.PrintName = "Cooled Black-Hot CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_cooled.png", "smooth mips")
    att.Description =
        [[Improved thermal conditioning shortens seeker preparation and acquisition. A black-hot view emphasizes warm targets as dark silhouettes; Use + Reload still switches to daylight.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "40% shorter seeker preparation", "20% quicker lock", "Black-hot thermal mode" }
    att.Desc_Cons = { "12% slower reload" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Cooled Black-Hot CLU"
    att.Override_UCJOpticCoolingMult = 0.6
    att.Override_UCJOpticLockMult = 0.8
    att.Override_UCJBlackHot = true
    att.Mult_ReloadTime = 1.12
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 4,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_cooled")
end

do
    local att = {}

    att.PrintName = "Daylight Observation CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_day.png", "smooth mips")
    att.Description =
        [[A daylight-only observation head dispenses with thermal conditioning for a lighter, quicker setup. The original CLU housing is retained; thermal view is unavailable.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "30% shorter preparation", "10% quicker aim" }
    att.Desc_Cons = { "No thermal mode" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Daylight Observation CLU"
    att.Override_UCJNoThermal = true
    att.Override_UCJOpticCoolingMult = 0.7
    att.Override_UCJOpticLockMult = 0.95
    att.Mult_SightTime = 0.9
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 3,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_day")
end

do
    local att = {}

    att.PrintName = "Mechanical Sight / CLU Delete"
    att.Icon = Material("entities/att/uc_javelin/optic_irons.png", "smooth mips")
    att.Description =
        [[The CLU housing is removed. Its original grips remain on a curved, bolted support mount beneath the tube; a hooded post and rear aperture replace the display. All payloads become unguided, with mild motor wander and ballistic sag. No target lock is required.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "No acquisition delay", "20% quicker aim", "8% faster movement" }
    att.Desc_Cons = { "No guidance or thermal display", "Mild trajectory drift" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Mechanical Sight / CLU Delete"
    att.Override_UCJUnguided = true
    att.Mult_SightTime = 0.8
    att.Mult_SpeedMult = 1.08
    att.ActivateElements = { "ucj_irons" }
    att.Override_IronSightStruct = {
        Pos = Vector(-4.8, -1.951, -6.2),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 1.1,
        CrosshairInSights = false,
    }
    att.Override_Firemodes = { { Mode = 1, PrintName = "UNGUIDED" }, { Mode = 0 } }
    att.Ignore = true
    att.Hidden = true

    ArcCW.LoadAttachmentType(att, "ucj_optic_irons")
end

do
    local att = {}

    att.PrintName = "Personnel Recognition CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_personnel.png", "smooth mips")
    att.Description =
        [[A recognition package adds living players and infantry NPCs to the seeker list. Vehicle compatibility is retained, but reduced warhead output, slower preparation and a shorter engagement envelope limit this conversion.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "Tracks living personnel and vehicles" }
    att.Desc_Cons = { "40% reduced payload damage", "55% less maximum range", "30% longer lock" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Personnel Recognition CLU"
    att.Override_UCJPersonnel = true
    att.Override_UCJOpticRange = 0.45
    att.Override_UCJOpticDamage = 0.6
    att.Override_UCJOpticSpeed = 0.85
    att.Override_UCJOpticLockMult = 1.3
    att.Override_UCJOpticCoolingMult = 1.1
    att.Override_UCJAcquireCone = 4.5
    att.Override_UCJRetainCone = 7
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 3,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_personnel")
end

do
    local att = {}

    att.PrintName = "Narrow-Field CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_precision.png", "smooth mips")
    att.Description =
        [[Narrow-field optics provide 6x observation and longer engagement reach. The target must stay closer to the centre and acquisition takes longer.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "25% longer engagement reach", "6x observation" }
    att.Desc_Cons = { "Narrow acquisition cone", "20% slower lock" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Narrow-Field CLU"
    att.Override_UCJAcquireCone = 3.5
    att.Override_UCJRetainCone = 6
    att.Override_UCJOpticLockMult = 1.2
    att.Override_UCJOpticRange = 1.25
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 6,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_precision")
end

do
    local att = {}

    att.PrintName = "Wide-Field CLU"
    att.Icon = Material("entities/att/uc_javelin/optic_wide.png", "smooth mips")
    att.Description =
        [[Wide-field acquisition optics cover a larger search cone, with quicker lock and lower magnification. Maximum engagement range is reduced.]]
    att.Slot = "uc_javelin_optic"
    att.AutoStats = true
    att.Desc_Pros = { "Wider acquisition cone", "15% quicker lock" }
    att.Desc_Cons = { "15% less engagement range" }
    att.Desc_Neutrals = { "Javelin-specific gameplay conversion" }
    att.Override_UCJOpticName = "Wide-Field CLU"
    att.Override_UCJAcquireCone = 8
    att.Override_UCJRetainCone = 12
    att.Override_UCJOpticLockMult = 0.85
    att.Override_UCJOpticRange = 0.85
    att.Override_IronSightStruct = {
        Pos = Vector(0, -1.951, -0.68),
        Ang = Angle(14.634, -2.927, 3.902),
        Magnification = 2,
        CrosshairInSights = false,
    }

    ArcCW.LoadAttachmentType(att, "ucj_optic_wide")
end

do
    local att = {}

    att.PrintName = "Low-Collateral Penetrator"
    att.Icon = Material("entities/att/uc_javelin/penetrator.png", "smooth mips")
    att.Description =
        [[A concentrated impact charge sacrifices fragmentation for a stronger direct hit. Small splash makes near-misses much less forgiving.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "3000 impact damage", "Small collateral radius" }
    att.Desc_Cons = { "Only 70 blast damage", "Less agile guidance" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "penetrator"

    ArcCW.LoadAttachmentType(att, "ucj_penetrator")
end

do
    local att = {}

    att.PrintName = "Quad Launch Bank"
    att.Icon = Material("entities/att/uc_javelin/quad.png", "smooth mips")
    att.Description =
        [[Field-built four-tube bank with rigid cross-bracing. Each tube retains the original diameter. One trigger launches all four loaded rounds; payload selection applies to every tube. Reload requires four RPG rounds.]]
    att.Slot = "ucj_body"
    att.AutoStats = true
    att.Desc_Pros = { "Four-tube volley", "Up to 32 tracking darts with Swarm" }
    att.Desc_Cons = { "Four rounds per shot", "55% longer reload", "Heavy handling" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJBody = "quad"
    att.Mult_ClipSize = 4
    att.Override_AmmoPerShot = 4
    att.Mult_ReloadTime = 1.55
    att.Mult_SpeedMult = 0.72
    att.Mult_SightTime = 1.4
    att.Mult_Recoil = 2.2
    att.ActivateElements = { "ucj_quad" }

    ArcCW.LoadAttachmentType(att, "ucj_quad")
end

do
    local att = {}

    att.PrintName = "Folding Field Rest"
    att.Icon = Material("entities/att/uc_javelin/rest.png", "smooth mips")
    att.Description =
        [[A reinforced cradle with hinged, telescoping legs, pivot collars and broad round feet. Crouching on the ground while nearly stationary deploys the leg bodygroup and speeds acquisition. Moving folds the legs again.]]
    att.Slot = "ucj_body"
    att.AutoStats = true
    att.Desc_Pros = { "30% quicker lock when braced", "Reduced sway", "Folding/deployed bodygroups" }
    att.Desc_Cons = { "15% slower replacement", "Added bulk", "Must crouch and remain still" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJBody = "rest"
    att.Mult_Sway = 0.7
    att.Mult_SpeedMult = 0.92
    att.Mult_ReloadTime = 1.15
    att.Mult_SightTime = 1.15
    att.ActivateElements = { "ucj_rest" }

    ArcCW.LoadAttachmentType(att, "ucj_rest")
end

do
    local att = {}

    att.PrintName = "Guided Canister / Swarm"
    att.Icon = Material("entities/att/uc_javelin/swarm.png", "smooth mips")
    att.Description =
        [[Experimental guided-shot conversion: eight miniature tracking darts fan out like a giant shotgun load before converging on the captured vehicle. Each retains its own seeker and can be diverted by flares.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "Eight guided darts per tube", "Faster steering" }
    att.Desc_Cons = { "Weaker individual impacts", "Small splash radius" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "swarm"

    ArcCW.LoadAttachmentType(att, "ucj_swarm")
end

do
    local att = {}

    att.PrintName = "Thermobaric Payload"
    att.Icon = Material("entities/att/uc_javelin/thermo.png", "smooth mips")
    att.Description =
        [[A heavy fuel-air payload for area denial. The heavier round has a slower flight and less agile terminal approach. It cannot replace the tandem charge against heavy armour.]]
    att.Slot = "ucj_payload"
    att.AutoStats = true
    att.Desc_Pros = { "Broad 520-unit blast" }
    att.Desc_Cons = { "15% slower missile", "Low direct-impact damage" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJPayload = "thermo"

    ArcCW.LoadAttachmentType(att, "ucj_thermo")
end

do
    local att = {}

    att.PrintName = "Twin Launch Cradle"
    att.Icon = Material("entities/att/uc_javelin/twin.png", "smooth mips")
    att.Description =
        [[Two original-diameter tubes share a rounded steel cradle and a two-cap retaining carrier. A balanced middle ground between a single tube and the four-tube bank. The carrier bodygroup disappears when empty and returns for replacement.]]
    att.Slot = "ucj_body"
    att.AutoStats = true
    att.Desc_Pros = { "Two-round volley", "Sixteen darts with Swarm" }
    att.Desc_Cons = { "Two rounds per shot", "30% longer replacement", "Heavier handling" }
    att.Desc_Neutrals = { "Experimental UC gameplay conversion" }
    att.Override_UCJBody = "twin"
    att.Mult_ClipSize = 2
    att.Override_AmmoPerShot = 2
    att.Mult_ReloadTime = 1.3
    att.Mult_SpeedMult = 0.85
    att.Mult_SightTime = 1.2
    att.Mult_Recoil = 1.5
    att.ActivateElements = { "ucj_twin" }

    ArcCW.LoadAttachmentType(att, "ucj_twin")
end
