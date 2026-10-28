ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.CVars = {
    Enabled = CreateClientConVar("arccw_tpik", "1", true, false,
        "Draw ArcCW weapons on player models using the real viewmodel animations", 0, 1),

    Others = CreateClientConVar("arccw_tpik_others", "1", true, false,
        "Apply TPIK to other players", 0, 1),

    Filter = CreateClientConVar("arccw_tpik_filter", "0", true, false,
        "Per weapon filtering. 0 every ArcCW weapon, 1 blacklist the listed ones, " ..
        "2 whitelist only the listed ones", 0, 2),

    DistanceOthers = CreateClientConVar("arccw_tpik_distance_others", "2048", true, false,
        "Stop drawing TPIK on other players past this distance, 0 for no limit", 0, 16384),

    AimAnim = CreateClientConVar("arccw_tpik_aim_animation", "1", true, false,
        "Enable aim animation: the head turns towards the sights and the off eye closes", 0, 1),

    AimAlign = CreateClientConVar("arccw_tpik_aim_align", "1", true, false,
        "Bring the sights onto the eye line when aiming instead of leaving the gun in the hand", 0, 1),

    CustomPos = CreateClientConVar("arccw_tpik_individual_positions", "1", true, false,
        "Use the per-weapon offsets from the editor", 0, 1),

    HeadMotion = CreateClientConVar("arccw_tpik_head_motion", "1", true, false,
        "Let the weapon's camera attachment move the player's head in third person", 0, 1),

    Gestures = CreateClientConVar("arccw_tpik_suppress_gestures", "1", true, false,
        "Suppress ArcCW's third person reload gestures, which fight the mirrored animation", 0, 1),

    Sprint = CreateClientConVar("arccw_tpik_sprint", "1", true, false,
        "Keep TPIK running while sprinting", 0, 1),

    MagDrop = CreateClientConVar("arccw_tpik_magdrop", "1", true, false,
        "Drop the magazine on the floor during reloads, on weapons whose animation " ..
        "carries a magdrop sound to trigger from", 0, 1),

    Sway = CreateClientConVar("arccw_tpik_sway", "1", true, false,
        "How much the weapon lags behind the view and bobs while walking, 0 to hold it rigid", 0, 3),

    ADSAlign = CreateClientConVar("arccw_tpik_ads_align", "0.7", true, false,
        "How far the weapon comes up to the eye line when aiming. 1 puts the sights exactly on " ..
        "the eye like first person, lower keeps it nearer the shoulder", 0, 1),

    ADSShoulder = CreateClientConVar("arccw_tpik_ads_shoulder", "1", true, false,
        "How far the weapon slides across to the firing shoulder while aiming, instead of lining up " ..
        "with the middle of the face. 1 puts the stock on the shoulder", 0, 2),

    ADSForward = CreateClientConVar("arccw_tpik_ads_forward", "0.15", true, false,
        "How much of the sight's rearward pull is given back while aiming. 0 is the literal first " ..
        "person position with the stock behind the eye, 1 cancels the pull entirely, above 1 pushes " ..
        "the weapon further forward still", 0, 2),

    Drop = CreateClientConVar("arccw_tpik_drop", "1", true, false,
        "How far the weapon drops from eye level toward the shoulders when not aiming. " ..
        "0 sits it at the eye like first person, 1 puts it on the shoulder line", 0, 2),

    ViewModelIK = CreateClientConVar("arccw_tpik_viewmodel_ik", "1", true, false,
        "Run the viewmodel's own IK rules on the mirrored model", 0, 1),

    RateLocal = CreateClientConVar("arccw_tpik_framerate_local", "30", true, false,
        "Arm IK solve rate for your own player model", 5, 120),

    RateOthers = CreateClientConVar("arccw_tpik_framerate_others", "30", true, false,
        "Arm IK solve rate for other players", 5, 120),

    OffX = CreateClientConVar("arccw_tpik_offset_x", "0", true, false, "TPIK gun offset: right/left"),
    OffY = CreateClientConVar("arccw_tpik_offset_y", "0", true, false, "TPIK gun offset: forward/back"),
    OffZ = CreateClientConVar("arccw_tpik_offset_z", "0", true, false, "TPIK gun offset: up/down"),
    AngP = CreateClientConVar("arccw_tpik_angle_p", "0", true, false, "TPIK gun angle: pitch"),
    AngY = CreateClientConVar("arccw_tpik_angle_y", "0", true, false, "TPIK gun angle: yaw"),
    AngR = CreateClientConVar("arccw_tpik_angle_r", "0", true, false, "TPIK gun angle: roll")
}
