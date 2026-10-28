local animations = {
    ["idle"] = { Source = "idle", Time = 4.033333 },
    ["idle_bp"] = { Source = "idle_bp", Time = 4.033333 },
    ["idle_zl"] = { Source = "idle_zl", Time = 4.033333 },
    ["idle_zl_bp"] = { Source = "idle_zl_bp", Time = 4.033333 },
    ["ready"] = {
        Source = "ready",
        Time = 2.666667,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/chback.wav", t = 0.500000, v = 0.8 },
            { s = ")^/uc_pkm_new/chforward.wav", t = 0.866667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 1.050000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.566667, v = 1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 1.100000, v = 0.5 },
        },
    },
    ["ready_bp"] = {
        Source = "ready_bp",
        Time = 2.666667,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/uc_pkm_new/bullpup_raise.ogg", t = 0.000000, v = 0.65 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 1.050000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/chback.wav", t = 0.500000, v = 0.8 },
            { s = ")^/uc_pkm_new/chforward.wav", t = 0.866667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 1.050000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.566667, v = 1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 1.100000, v = 0.5 },
        },
    },
    ["draw"] = {
        Source = "draw",
        Time = 1.500000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["draw_bp"] = {
        Source = "draw_bp",
        Time = 1.533333,
        SoundTable = {
            { s = ")^/uc_pkm_new/bullpup_raise.ogg", t = 0.000000, v = 0.65 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 0.400000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["draw_zl"] = {
        Source = "draw_zl",
        Time = 1.500000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["draw_zl_bp"] = {
        Source = "draw_zl_bp",
        Time = 1.533333,
        SoundTable = {
            { s = ")^/uc_pkm_new/bullpup_raise.ogg", t = 0.000000, v = 0.65 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 0.400000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["holster"] = {
        Source = "holster",
        Time = 0.700000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/rattle2.ogg", t = 0.000000, v = 0.8 },
        },
    },
    ["holster_bp"] = {
        Source = "holster_bp",
        Time = 0.700000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/rattle2.ogg", t = 0.000000, v = 0.8 },
        },
    },
    ["holster_zl"] = {
        Source = "holster_zl",
        Time = 0.700000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/rattle2.ogg", t = 0.000000, v = 0.8 },
        },
    },
    ["holster_zl_bp"] = {
        Source = "holster_zl_bp",
        Time = 0.700000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/rattle2.ogg", t = 0.000000, v = 0.8 },
        },
    },
    ["fire"] = {
        Source = "fire",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_bp"] = {
        Source = "fire_bp",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_zl"] = {
        Source = "fire_zl",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_zl_bp"] = {
        Source = "fire_zl_bp",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_iron"] = {
        Source = "fire_sights",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_iron_bp"] = {
        Source = "fire_sights_bp",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_iron_zl"] = {
        Source = "fire_sights_zl",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["fire_iron_zl_bp"] = {
        Source = "fire_sights_zl_bp",
        Time = 0.600000,
        ShellEjectAt = 0.01,
        SoundTable = {
            {
                s = {
                    ")^/uc_pkm_new/mech1.wav",
                    ")^/uc_pkm_new/mech2.wav",
                    ")^/uc_pkm_new/mech3.wav",
                    ")^/uc_pkm_new/mech4.wav",
                    ")^/uc_pkm_new/mech5.wav",
                },
                t = 0.000000,
                v = 1,
            },
        },
    },
    ["trigger"] = {
        Source = "modeswitch",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_bp"] = {
        Source = "modeswitch_bp",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_zl"] = {
        Source = "modeswitch_zl",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_zl_bp"] = {
        Source = "modeswitch_zl_bp",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_iron"] = {
        Source = "modeswitch",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_iron_bp"] = {
        Source = "modeswitch_bp",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_iron_zl"] = {
        Source = "modeswitch_zl",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["trigger_iron_zl_bp"] = {
        Source = "modeswitch_zl_bp",
        Time = 0.466667,
        SoundTable = { { s = ")^/arccw_uc/pkm/m60/prefire.wav", t = 0, v = 0.6 } },
    },
    ["fire_dry"] = { Source = "modeswitch", Time = 0.466667 },
    ["fire_dry_bp"] = { Source = "modeswitch_bp", Time = 0.466667 },
    ["fire_dry_zl"] = { Source = "modeswitch_zl", Time = 0.466667 },
    ["fire_dry_zl_bp"] = { Source = "modeswitch_zl_bp", Time = 0.466667 },
    ["reload"] = {
        Source = "reload",
        Time = 5.633333,
        MinProgress = 4.100000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_full.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 4.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.366667, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 4.663333, v = 0.3 },
        },
    },
    ["reload_bp"] = {
        Source = "reload_bp",
        Time = 5.633333,
        MinProgress = 4.100000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/box_remove_bullpup.wav", t = 0.600000, v = 0.55 },
            { s = ")^/uc_pkm_new/boxinsert_bullpup.wav", t = 2.200000, v = 0.55 },
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 4.500000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open_bullpup.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_full.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close_bullpup.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 4.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.366667, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 4.663333, v = 0.3 },
        },
    },
    ["reload_zl"] = {
        Source = "reload_zl",
        Time = 5.633333,
        MinProgress = 4.100000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_full.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 4.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.366667, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 4.663333, v = 0.3 },
        },
    },
    ["reload_zl_bp"] = {
        Source = "reload_zl_bp",
        Time = 5.633333,
        MinProgress = 4.100000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/box_remove_bullpup.wav", t = 0.600000, v = 0.55 },
            { s = ")^/uc_pkm_new/boxinsert_bullpup.wav", t = 2.200000, v = 0.55 },
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 4.500000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open_bullpup.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_full.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close_bullpup.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 4.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.366667, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 4.663333, v = 0.3 },
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = 6.533333,
        MinProgress = 4.900000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_empty.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 4.100000, v = 0.25 },
            { s = ")^/uc_pkm_new/chback.wav", t = 4.416667, v = 0.8 },
            { s = ")^/uc_pkm_new/chforward.wav", t = 4.750000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 5.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 5.200000, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 5.163333, v = 0.3 },
        },
    },
    ["reload_empty_bp"] = {
        Source = "reload_empty_bp",
        Time = 6.533333,
        MinProgress = 4.900000,
        LastClip1OutTime = 1.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
        SoundTable = {
            { s = ")^/uc_pkm_new/box_remove_bullpup.wav", t = 0.600000, v = 0.55 },
            { s = ")^/uc_pkm_new/boxinsert_bullpup.wav", t = 2.200000, v = 0.55 },
            { s = ")^/uc_pkm_new/mag_release.wav", t = 0.400000, v = 0.65 },
            { s = ")^/uc_pkm_new/box_struggle.wav", t = 1.700000, v = 0.55 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 5.163333, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/magpouch.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_open_bullpup.wav", t = 0.133333, v = 0.8 },
            { s = ")^/uc_pkm_new/boxremove_empty.wav", t = 0.600000, v = 1 },
            { s = ")^/arccw_uc/pkm/m249/belt1.ogg", t = 1.000000, v = 0.8 },
            { s = ")^/uc_pkm_new/belt_manipulate2.wav", t = 1.100000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 1.566667, v = 0.3 },
            { s = ")^/uc_pkm_new/boxinsert.wav", t = 2.200000, v = 1 },
            { s = ")^/uc_pkm_new/belt_manipulate.wav", t = 2.833333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltadjust.ogg", t = 2.866667, v = 0.8 },
            { s = ")^/uc_pkm_new/cover_close_bullpup.wav", t = 4.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 4.100000, v = 0.25 },
            { s = ")^/uc_pkm_new/chback.wav", t = 4.416667, v = 0.8 },
            { s = ")^/uc_pkm_new/chforward.wav", t = 4.750000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/cloth_4.ogg", t = 5.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 5.200000, v = 0.25 },
            { s = ")^/arccw_uc/pkm/common/shoulder_heavy.ogg", t = 5.163333, v = 0.3 },
        },
    },
    ["enter_inspect"] = {
        Source = "inspect",
        Time = 6.733333,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/cloth_1.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-02.ogg", t = 0.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/cloth_2.ogg", t = 2.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 2.600000, v = 0.4 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 2.733333, v = 0.2 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 2.500000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.833333, v = 0.5 },
            { s = ")^/arccw_uc/pkm/common/cloth_3.ogg", t = 5.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-03.ogg", t = 4.916667, v = 0.8 },
        },
    },
    ["enter_inspect_bp"] = {
        Source = "inspect_bp",
        Time = 6.733333,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/cloth_1.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-02.ogg", t = 0.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/cloth_2.ogg", t = 2.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 2.600000, v = 0.4 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 2.733333, v = 0.2 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 2.500000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.833333, v = 0.5 },
            { s = ")^/arccw_uc/pkm/common/cloth_3.ogg", t = 5.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-03.ogg", t = 4.916667, v = 0.8 },
        },
    },
    ["enter_inspect_zl"] = {
        Source = "inspect_zl",
        Time = 6.733333,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/cloth_1.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-02.ogg", t = 0.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/cloth_2.ogg", t = 2.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 2.600000, v = 0.4 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 2.733333, v = 0.2 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 2.500000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.833333, v = 0.5 },
            { s = ")^/arccw_uc/pkm/common/cloth_3.ogg", t = 5.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-03.ogg", t = 4.916667, v = 0.8 },
        },
    },
    ["enter_inspect_zl_bp"] = {
        Source = "inspect_zl_bp",
        Time = 6.733333,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/cloth_1.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-02.ogg", t = 0.166667, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m249/beltshake1.ogg", t = 0.133333, v = 0.4 },
            { s = ")^/arccw_uc/pkm/common/cloth_2.ogg", t = 2.333333, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 2.600000, v = 0.4 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 2.733333, v = 0.2 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-04.ogg", t = 2.500000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 4.833333, v = 0.5 },
            { s = ")^/arccw_uc/pkm/common/cloth_3.ogg", t = 5.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/common/movement-rifle-03.ogg", t = 4.916667, v = 0.8 },
        },
    },
    ["idle_inspect"] = { Source = "idle", Time = 4.033333 },
    ["idle_inspect_bp"] = { Source = "idle_bp", Time = 4.033333 },
    ["idle_inspect_zl"] = { Source = "idle_zl", Time = 4.033333 },
    ["idle_inspect_zl_bp"] = { Source = "idle_zl_bp", Time = 4.033333 },
    ["exit_inspect"] = {
        Source = "draw",
        Time = 1.500000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["exit_inspect_bp"] = {
        Source = "draw_bp",
        Time = 1.533333,
        SoundTable = {
            { s = ")^/uc_pkm_new/bullpup_raise.ogg", t = 0.000000, v = 0.65 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 0.400000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["exit_inspect_zl"] = {
        Source = "draw_zl",
        Time = 1.500000,
        SoundTable = {
            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["exit_inspect_zl_bp"] = {
        Source = "draw_zl_bp",
        Time = 1.533333,
        SoundTable = {
            { s = ")^/uc_pkm_new/bullpup_raise.ogg", t = 0.000000, v = 0.65 },
            { s = ")^/uc_pkm_new/shoulder_bullpup.ogg", t = 0.400000, v = 0.55 },

            { s = ")^/arccw_uc/pkm/common/raise.ogg", t = 0.000000, v = 0.8 },
            { s = ")^/arccw_uc/pkm/m60/belt1.ogg", t = 0.200000, v = 0.1 },
            { s = ")^/arccw_uc/pkm/m60/belt2.ogg", t = 0.266667, v = 0.3 },
        },
    },
    ["enter_bipod"] = { Source = "modeswitch", Time = 0.466667 },
    ["enter_bipod_bp"] = { Source = "modeswitch_bp", Time = 0.466667 },
    ["enter_bipod_zl"] = { Source = "modeswitch_zl", Time = 0.466667 },
    ["enter_bipod_zl_bp"] = { Source = "modeswitch_zl_bp", Time = 0.466667 },
    ["exit_bipod"] = { Source = "modeswitch", Time = 0.466667 },
    ["exit_bipod_bp"] = { Source = "modeswitch_bp", Time = 0.466667 },
    ["exit_bipod_zl"] = { Source = "modeswitch_zl", Time = 0.466667 },
    ["exit_bipod_zl_bp"] = { Source = "modeswitch_zl_bp", Time = 0.466667 },
    ["toggle"] = { Source = "modeswitch", Time = 0.466667 },
    ["toggle_bp"] = { Source = "modeswitch_bp", Time = 0.466667 },
    ["toggle_zl"] = { Source = "modeswitch_zl", Time = 0.466667 },
    ["toggle_zl_bp"] = { Source = "modeswitch_zl_bp", Time = 0.466667 },
    ["switchsights"] = { Source = "modeswitch", Time = 0.466667 },
    ["switchsights_bp"] = { Source = "modeswitch_bp", Time = 0.466667 },
    ["switchsights_zl"] = { Source = "modeswitch_zl", Time = 0.466667 },
    ["switchsights_zl_bp"] = { Source = "modeswitch_zl_bp", Time = 0.466667 },
}

local commonFoley = "arccw_uc/common/"
local function addFoley(animation, cues)
    animation.SoundTable = animation.SoundTable or {}
    for _, cue in ipairs(cues) do
        animation.SoundTable[#animation.SoundTable + 1] =
            { s = commonFoley .. cue[2], t = cue[1], v = cue[3] }
    end
end
for key, animation in pairs(animations) do
    if key:match("^enter_inspect") then
        addFoley(
            animation,
            { { 2.22, "cloth_4.ogg", 0.23 }, { 2.60, "grab.ogg", 0.30 }, { 5.12, "cloth_6.ogg", 0.22 } }
        )

        animation.SoundTable[#animation.SoundTable + 1] =
            { s = "uc_pkm_new/box_struggle.wav", t = 2.62, v = 0.45 }
    elseif key:match("^reload") then
        local empty = key:match("empty")
        addFoley(animation, {
            { 0.20, "grab.ogg", 0.17 },
            { 0.52, "grab.ogg", 0.25 },
            { 1.30, "cloth_3.ogg", 0.24 },
            { 1.82, "grab.ogg", 0.25 },
            { 2.70, "cloth_2.ogg", 0.24 },
            { 3.85, "cloth_4.ogg", 0.23 },
            { empty and 5.13 or 4.48, "grab.ogg", 0.27 },
        })
    elseif key:match("^ready") then
        addFoley(
            animation,
            { { 0.25, "cloth_3.ogg", 0.24 }, { 0.43, "grab.ogg", 0.23 }, { 0.97, "grab.ogg", 0.25 } }
        )
    elseif key:match("^draw") or key:match("^exit_inspect") then
        addFoley(animation, { { 0.09, "cloth_2.ogg", 0.22 }, { 0.37, "grab.ogg", 0.24 } })
    elseif key:match("^holster") then
        addFoley(animation, { { 0.08, "grab.ogg", 0.16 }, { 0.24, "cloth_6.ogg", 0.25 } })
    elseif key:match("bipod") then
        addFoley(animation, { { 0.03, "cloth_4.ogg", 0.20 }, { 0.24, "grab.ogg", 0.20 } })
    end
end

for key, animation in pairs(animations) do
    if key:match("^reload") and key:match("_bp$") then
        animation.LHIK = false
        animation.LHIKTimeline = nil
    end
end

local sidegripSources = {
    ["idle"] = "idle_sidegrip",
    ["idle2"] = "idle2_sidegrip",
    ["idle_zl"] = "idle_zl_sidegrip",
    ["fire"] = "fire_sidegrip",
    ["fire_sights"] = "fire_sights_sidegrip",
    ["fire_zl"] = "fire_zl_sidegrip",
    ["fire_sights_zl"] = "fire_sights_zl_sidegrip",
    ["ready"] = "ready_sidegrip",
    ["draw"] = "draw_sidegrip",
    ["holster"] = "holster_sidegrip",
    ["draw_zl"] = "draw_zl_sidegrip",
    ["holster_zl"] = "holster_zl_sidegrip",
    ["modeswitch"] = "modeswitch_sidegrip",
    ["modeswitch_zl"] = "modeswitch_zl_sidegrip",
    ["reload"] = "reload_sidegrip",
    ["reload_zl"] = "reload_zl_sidegrip",
    ["reload_empty"] = "reload_empty_sidegrip",
    ["inspect"] = "inspect_sidegrip",
    ["inspect_zl"] = "inspect_zl_sidegrip",
}
local function copy(value)
    if type(value) ~= "table" then
        return value
    end
    local result = {}
    for k, v in pairs(value) do
        result[k] = copy(v)
    end
    return result
end
local variants = {}
for key, animation in pairs(animations) do
    if sidegripSources[animation.Source] then
        local variant = copy(animation)
        variant.Source = sidegripSources[animation.Source]
        variants[key .. "_sidegrip"] = variant
    end
end
for key, animation in pairs(variants) do
    animations[key] = animation
end
animations.reload_type73 = {
    Source = "reload_type73",
    Time = 3.168,
    MinProgress = 2.552,
    LHIK = true,
    LHIKIn = 0.15,
    LHIKOut = 0.3,
    SoundTable = {
        { s = ")^/uc_pkm_new/mag_release_type73.wav", t = 0.484 },
        { s = ")^/uc_pkm_new/mag_out_type73.wav", t = 0.792 },
        { s = ")^/uc_pkm_new/mag_insert_type73.wav", t = 2.508 },
    },
}
animations.reload_empty_type73 = {
    Source = "reload_empty_type73",
    Time = 4.84,
    MinProgress = 4.576,
    LHIK = true,
    LHIKIn = 0.15,
    LHIKOut = 0.3,
    SoundTable = {
        { s = ")^/uc_pkm_new/mag_release_type73.wav", t = 0.484 },
        { s = ")^/uc_pkm_new/mag_out_type73.wav", t = 0.792 },
        { s = ")^/uc_pkm_new/mag_insert_type73.wav", t = 2.508 },
        { s = ")^/uc_pkm_new/chback.wav", t = 3.432 },
        { s = ")^/uc_pkm_new/chforward.wav", t = 3.75496 },
    },
}
for _, key in ipairs({ "reload_type73", "reload_empty_type73" }) do
    local animation = animations[key]
    addFoley(animation, {
        { 0.12, "cloth_3.ogg", 0.24 },
        { 0.32, "grab.ogg", 0.20 },
        { 1.10, "cloth_4.ogg", 0.23 },
        { 1.60, "magpouch.ogg", 0.28 },
        { 2.22, "grab.ogg", 0.25 },
        { key == "reload_type73" and 2.82 or 4.26, "grab.ogg", 0.25 },
    })
end
for _, key in ipairs({ "reload_type73", "reload_empty_type73" }) do
    local variant = copy(animations[key])
    variant.Source = key .. "_9mm"
    for _, event in ipairs(variant.SoundTable or {}) do
        if event.s == ")^/uc_pkm_new/mag_out_type73.wav" then
            event.s = ")^/uc_pkm_new/mag_out_type73_9mm.wav"
        end
        if event.s == ")^/uc_pkm_new/mag_insert_type73.wav" then
            event.s = ")^/uc_pkm_new/mag_insert_type73_9mm.wav"
        end
    end
    animations[key .. "_9mm"] = variant
end
for _, key in ipairs({
    "reload_type73",
    "reload_empty_type73",
    "reload_type73_9mm",
    "reload_empty_type73_9mm",
}) do
    local variant = copy(animations[key])
    variant.Source = key .. "_sidegrip"
    animations[key .. "_sidegrip"] = variant
end
return animations
