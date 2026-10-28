local SWEP = { Primary = {}, Secondary = {} }

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "2Urban Renewal"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_mp5"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.PistolShellSoundsTable

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.PrintName = "PK5-4"

SWEP.TrueName = "MP5A4"

SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = [[Versatile submachine gun known for its use by high profile police units around the world, most famously by the British SAS during the Iranian embassy siege. Its reliable closed-bolt design and craftsmanship allowed it to remain relevant among new generations of submachine guns.

If accurate, sophisticated close-combat performance is what you're looking for, no weapon has a better track record.

Switch to burst fire mode to reduce dispersion from moving and hipfiring.]]
SWEP.Trivia_Manufacturer = "Crowdley & Nelson"
SWEP.Trivia_Calibre = "9x19mm Parabellum"
SWEP.Trivia_Mechanism = "Roller-Delayed Blowback"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1966

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Heckler & Koch"
end

SWEP.ViewModel = "models/weapons/arccw/c_ur_mp5_ux.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_ur_mp5_ux.mdl"
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = ArcCW.UC.StdDmg["9mm"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["9mm"].min
SWEP.Penetration = ArcCW.UC.StdDmg["9mm"].pen
SWEP.RangeMin = 20
SWEP.Range = 100

SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 400
SWEP.PhysBulletMuzzleVelocity = 400

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 30
SWEP.ExtendedClipSize = 40
SWEP.ReducedClipSize = 15

SWEP.Recoil = 0.22
SWEP.RecoilSide = 0.17

SWEP.RecoilRise = 0.6
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 0.6
SWEP.RecoilPunchBack = 1.5

SWEP.Sway = 0.25

SWEP.Delay = 60 / 800
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -3,
        Mult_MoveDispersion = 0.75,
        Mult_HipDispersion = 0.9,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 120

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 60

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 500
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "pistol"
SWEP.MagID = "mp5"

SWEP.HeatCapacity = 75
SWEP.HeatDissipation = 15
SWEP.HeatDelayTime = 3

SWEP.MalfunctionMean = 200

SWEP.SpeedMult = 0.925
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.3
SWEP.ShootSpeedMult = 0.95

SWEP.BarrelLength = 24
SWEP.ExtraSightDist = 2

SWEP.HolsterPos = Vector(0.5, -2, 1)
SWEP.HolsterAng = Angle(-8.5, 8, -10)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
     Pos = Vector(-3.17, -1, 0.6),
     Ang = Angle(0.45, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 60,
}

SWEP.ActivePos = Vector(-0.3, 1.1, 0.6)
SWEP.ActiveAng = Angle(0, 0, -1)

SWEP.SprintPos = Vector(0, -3, 0)
SWEP.SprintAng = Angle(0, 0, 0)
SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-2, 0.5, 0)
SWEP.CrouchAng = Angle(0, 0, -14)

SWEP.BarrelOffsetHip = Vector(4, 0, -4)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-8, 4, -5),
    ang        =    Angle(-12, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale = 1
}

local path = ")weapons/arccw_ur/mp5/"
local common = ")/arccw_uc/common/"

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg"
}
SWEP.ShootSoundSilenced = {
    path .. "fire-sup-01.ogg",
    path .. "fire-sup-02.ogg",
    path .. "fire-sup-03.ogg",
    path .. "fire-sup-04.ogg",
    path .. "fire-sup-05.ogg",
    path .. "fire-sup-06.ogg"
}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = path .. "dryfire.ogg"

SWEP.DistantShootSoundOutdoors = {
    path .. "fire-dist-01.ogg",
    path .. "fire-dist-02.ogg",
    path .. "fire-dist-03.ogg",
    path .. "fire-dist-04.ogg",
    path .. "fire-dist-05.ogg",
    path .. "fire-dist-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-pistol-01.ogg",
    common .. "fire-dist-int-pistol-02.ogg",
    common .. "fire-dist-int-pistol-03.ogg",
    common .. "fire-dist-int-pistol-04.ogg",
    common .. "fire-dist-int-pistol-05.ogg",
    common .. "fire-dist-int-pistol-06.ogg"
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
    common .. "sup-tail-10.ogg"
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg"
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 0.6
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.BulletBones = {
}

SWEP.AttachmentElements = {
    ["ur_mp5_barrel_sd"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
            {ind = 4, bg = 9},
        },
        AttPosMods = {
            [6] = {
                vpos = Vector(0, 1.3, 10),
                vang = Angle(90, 0, -90),
            },
            [7] = {
				vpos = Vector(-1.15, 0.3, 8),
				vang = Angle(90, 0, 180),
			},
        },
    },
    ["ur_mp5_barrel_eod"] = {
        VMBodygroups = {
            {ind = 4, bg = 10},
        },
        AttPosMods = {
            [6] = {
                vpos = Vector(0, 1.5, 10),
                vang = Angle(90, 0, -90),
            },
            [7] = {
				vpos = Vector(-0.95, 0.3, 8),
				vang = Angle(90, 0, 180),
			},
		}
    },
    ["ur_mp5_barrel_kurz"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
            {ind = 4, bg = 7},
        },
        AttPosMods = {[4] = {
            vpos = Vector(-0.1, 0.3, 11.5),
            vang = Angle(90, 0, -90),
        }}
    },
    ["ur_mp5_barrel_uberkurz"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
        },
        AttPosMods = {[4] = {
            vpos = Vector(-0.1, 0.3, 11.5),
            vang = Angle(90, 0, -90),
        }}
    },
    ["ur_mp5_barrel_swordfish"] = {
        VMBodygroups = {
            {ind = 1, bg = 3},
            {ind = 6, bg = 0},
        },
    },
    ["ur_mp5_barrel_carbine"] = {
        VMBodygroups = {
            {ind = 1, bg = 4},
        },
        AttPosMods = {[4] = {
            vpos = Vector(-0.101, 0.3, 21.5),
            vang = Angle(90, 0, -90),
        }},
    },
    ["ur_mp5_kit_sadu"] = {
        VMBodygroups = {
            {ind = 0, bg = 3},
            {ind = 1, bg = 6},
            {ind = 2, bg = 3},
            {ind = 3, bg = 13},
            {ind = 4, bg = 9},
            {ind = 5, bg = 6},
            {ind = 7, bg = 2},
        },
        AttPosMods = {[4] = {
            vpos = Vector(-0.05, 1, 18),
            vang = Angle(90, 0, -90),
        }},
        Override_IronSightStruct = {
            Pos = Vector(-3.16, -2.439, 1.8),
            Ang = Angle(0, 0, 0),
            Magnification = 1.1
        },
        NameChange = "SAD-9",
        TrueNameChange = "Sadu ASALT 96",
    },
    ["ur_mp5_barrel_rifle"] = {
        VMBodygroups = {
            {ind = 1, bg = 5},
        },
        AttPosMods = {[4] = {
            vpos = Vector(-0.101, 0.3, 21.5),
            vang = Angle(90, 0, -90),
        }},
    },
    ["ur_mp5_barrel_dong"] = {
        VMElements = {
            {
                Model = "models/weapons/arc9/darsu_eft/mods/ak_hg_wasr_ux.mdl",
                Bone = "body",
                Scale = Vector(1.5, 1, 1.1),
                Offset = {
                    pos = Vector(-0.051, 0, 5.86),
                    ang = Angle(0,0,-90),
                }
            }
        },
},
["ur_mp5_barrel_p90"] = {
     VMBodygroups = {
            {ind = 4, bg = 13},
        },
},

    ["ur_mp5_rail_fg"] = {
        VMBodygroups = {{ind = 4, bg = 4}},
    },
    ["ur_mp5_ub_classic"] = {
        VMBodygroups = {{ind = 4, bg = 3}},
    },
    ["ur_mp5_ub_surefire"] = {
        VMBodygroups = {{ind = 4, bg = 1}},
    },
    ["ur_mp5_ub_surelock"] = {
        VMBodygroups = {{ind = 4, bg = 2}},
    },
    ["ur_mp5_ub_kurzgrip"] = {
        VMBodygroups = {{ind = 4, bg = 6}},
    },
    ["ur_mp5_ub_kurzmlok"] = {
        VMBodygroups = {{ind = 4, bg = 8}},
    },
    ["ur_mp5_ub_wood"] = {
        VMBodygroups = {{ind = 4, bg = 11}},
    },
    ["ur_mp5_ub_heatshield"] = {
        VMBodygroups = {{ind = 4, bg = 12}},
    },

    ["ur_mp5_mag_15"] = {
        VMBodygroups = {{ind = 5, bg = 1}},
    },
    ["ur_mp5_mag_40"] = {
            VMBodygroups = {
                {ind = 5, bg = 4},
            }
    },
    ["ur_mp5_mag_rifle"] = {
        VMBodygroups = {
            {ind = 5, bg = 5},
        }
    },
    ["ur_mp5_mag_50"] = {
        VMBodygroups = {{ind = 5, bg = 3}},
    },
    ["ur_mp5_mag_waffle"] = {
        VMBodygroups = {{ind = 5, bg = 2}},
    },

    ["ur_mp5_rail_optic"] = {
        VMBodygroups = {{ind = 6, bg = 1}},
    },

    ["ur_mp5_clamp"] = {
        VMBodygroups = {{ind = 5, bg = 1}},
    },

    ["receiver_lower"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
    },
    ["receiver_lower_semi"] = {
        VMBodygroups = {{ind = 2, bg = 0}},
    },
    ["receiver_lower_carbine"] = {
        VMBodygroups = {{ind = 2, bg = 2}},
    },
    ["receiver_lower_0"] = {
        VMBodygroups = {{ind = 2, bg = 0}},
    },
    ["receiver_upper_0"] = {
        VMBodygroups = {{ind = 7, bg = 0}},
    },

    ["stock_a3"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
        },
    },
    ["stock_a3_folded"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["ur_mp5_stock_remove"] = {
        VMBodygroups = {{ind = 3, bg = 10}},
    },
    ["ur_mp5_stock_wood"] = {
        VMBodygroups = {{ind = 3, bg = 11}},
    },
    ["ur_mp5_stock_brace"] = {
        VMBodygroups = {{ind = 3, bg = 12}},
    },
    ["stock_pdw"] = {
        VMBodygroups = {{ind = 3, bg = 3}},
    },
    ["stock_pdw_folded"] = {
        VMBodygroups = {{ind = 3, bg = 4}},
    },
    ["stock_ump"] = {
        VMBodygroups = {{ind = 3, bg = 5}},
    },
    ["stock_ump_folded"] = {
        VMBodygroups = {{ind = 3, bg = 6}},
    },
    ["stock_future"] = {
        VMBodygroups = {{ind = 3, bg = 7}},
    },
    ["stock_future_folded"] = {
        VMBodygroups = {{ind = 3, bg = 8}},
    },
    ["ur_mp5_precision_irons"] = {
        VMBodygroups = {
            {ind = 0, bg = 2},
            {ind = 6, bg = 0},
            },
    },
}

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local atts = wep.Attachments
    local vm = data.vm
    if IsValid(vm) then
        local barr = string.Replace(atts[2].Installed or "default","ur_mp5_barrel_","")
        local hg = string.Replace(atts[5].Installed or "default","ur_mp5_ub_","")

        if atts[6].Installed or atts[7].Installed then
            if barr == "sd" then
                vm:SetBodygroup(8, 1)
            elseif barr == "eod" then
                vm:SetBodygroup(8, 2)
            elseif hg == "default" or hg == "classic" then
                vm:SetBodygroup(4, 4)
                vm:SetBodygroup(8, 0)
            else
                vm:SetBodygroup(8, 0)
            end
        else
            vm:SetBodygroup(8, 0)
        end

        if hg == "mlok" then
            if barr == "kurz" then
                vm:SetBodygroup(4,8)
            else
                vm:SetBodygroup(4,5)
            end
        end

        if barr == "sword" then
            vm:SetBodygroup(0,(atts[1].Installed and 3) or 1)
        end
    end
end

SWEP.Hook_NameChange = function(wep,name)
    local atts = wep.Attachments
    local barr = string.Replace(atts[2].Installed or "default","ur_mp5_barrel_","")
    local cal = string.Replace(atts[3].Installed or "default","ur_mp5_caliber_","")
    local stock = string.Replace(atts[8].Installed or "default","ur_mp5_stock_","")
    local fakeNames = !GetConVar("arccw_truenames"):GetBool()
    local defaultCals = {
        ["default"] = true,
        ["noburst"] = true,
        ["semi"] = true
    }

    local start = "MP5"
    local mid = "A"
    local num = "4"
    if fakeNames then
        start = "PK5"
        mid = "-"
    end

    if cal == "semi" or atts[12].Installed == "uc_fg_civvy" then
        if fakeNames then
            return "PK5-CIV"
        else
            if barr == "long" or barr == "sd" then
                start = "HK94"
            else
                return "SP5" .. ((barr == "kurz" and "K-PDW") or "")
            end
        end
    end

    if !defaultCals[cal] then
        if barr == "sd" then
            num = "SD"
        else
            num = ""
        end
        if cal == "10auto" then
            mid = "/10"
        elseif cal == "40sw" then
            mid = "/40"
        elseif cal == "22lr" then
            if barr == "sd" then
                mid = "SD"
                num = " .22 LR"
            else
                mid = " .22 LR"
            end
        end
    else
        if barr == "kurz" then
            if fakeNames then
                mid = "C"
            else
                mid = "K"
            end
            if stock == "pdw" then
                num = "-PDW"
            elseif cal == "default" then
                if fakeNames then
                    num = "-4"
                else
                    num = "A4"
                end
            else
                num = ""
            end
        else
            if barr == "sd" then
                mid = "SD"
            end

            if cal == "noburst" or cal == "semi" then
                if stock == "a3" then
                    num = "3"
                elseif stock == "none" then
                    num = "1"
                else
                    num = "2"
                end
            else
                if stock == "a3" then
                    if barr == "sd" then
                        num = "6"
                    else
                        num = "5"
                    end
                elseif stock == "none" then
                    if barr == "sd" then
                        num = "4"
                    end
                else
                    if barr == "sd" then
                        num = "5"
                    end
                end
            end
        end
    end

    return start .. mid .. num
end

SWEP.Hook_Think = ArcCW.UC.ADSReload

local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local rutle = {common .. "movement-smg-03.ogg",common .. "movement-smg-04.ogg"}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["ready"] = {
        Source = "ready",
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0.15},
            {s = path .. "rack1.ogg",         t = 0.15, c = ci},
            {s = path .. "rack2.ogg",         t = 0.38, c = ci},
            {s = ratel,         t = 0.75},
        }
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["fire"] = {
        Source = "fire",
        Time = 13 / 30,
        ShellEjectAt = 0.03,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron"] = {
        Source = "idle",
        Time = 13 / 30,
        ShellEjectAt = 0.03,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0 }},
    },

    ["fix"] = {
        Source = "fix",
        Time = 40 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        ShellEjectAt = 0.36,
        SoundTable = {
            {s = rottle, t = 0.15},
            {s = path .. "rack1.ogg",         t = 0.27, c = ci},
            {s = path .. "rack2.ogg",         t = 0.5, c = ci},
        },
    },

    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = path .. "magout.ogg",        t = 0.4, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.61, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.045, c = ci},
            {s = path .. "chlock.ogg",         t = 0.18, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = 0.86, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.13, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.05, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_sadu"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = "weapons/misc/sadu_magout.ogg",        t = 0.4, c = ci},
            {s = rottle, t = 0.25},
            {s = "weapons/misc/sadu_magin.ogg",         t = 0.61, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty_sadu"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = "weapons/misc/sadu_chback.ogg",         t = 0.045, c = ci},
            {s = path .. "chlock.ogg",         t = 0.18, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = "weapons/misc/sadu_magout.ogg",        t = 0.86, c = ci},
            {s = rottle, t = 0.25},
            {s = "weapons/misc/sadu_magin.ogg",         t = 1.13, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = "weapons/misc/sadu_chforward.ogg",         t = 2.05, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_kurz"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = path .. "magout.ogg",        t = 0.4, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.63, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty_kurz"] = {
        Source = "reload_empty_kurz",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.066, c = ci},
            {s = path .. "chlock.ogg",         t = 0.2, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = 0.86, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.13, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.1, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },

    ["reload_15"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.5, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty_15"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.2, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_empty_kurz_15"] = {
        Source = "reload_empty_kurz",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.2, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_rifle"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = "weapons/misc/mp5_rifle_magout.ogg",        t = 0.25, c = ci},
            {s = rottle, t = 0.25},
            {s = "weapons/misc/mp5_rifle_magin.ogg",         t = 1.0, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty_rifle"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = "weapons/misc/mp5_rifle_magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = "weapons/misc/mp5_rifle_magin.ogg",         t = 1.6, c = ci},
            {s = common .. "rifle_magdrop.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_empty_kurz_rifle"] = {
        Source = "reload_empty_kurz",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = "weapons/misc/mp5_rifle_magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = "weapons/misc/mp5_rifle_magin.ogg",         t = 1.6, c = ci},
            {s = common .. "rifle_magdrop.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },

    ["reload_40"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.05},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.5, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.25},
            {s = ratel,  t = 1.55},
            {s = common .. "shoulder.ogg",  t = 1.5},
        },
    },
    ["reload_empty_40"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.2, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_empty_kurz_40"] = {
        Source = "reload_empty_kurz",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg",         t = 0.1, c = ci},
            {s = path .. "chlock.ogg",         t = 0.19, c = ci},
            {s = common .. "magpouch.ogg", t = 0.4},
            {s = path .. "magout.ogg",        t = .9, c = ci},
            {s = rottle, t = 0.25},
            {s = path .. "magin.ogg",         t = 1.2, c = ci},
            {s = common .. "magdrop_smg.ogg",  t = 1.5},
            {s = rottle, t = 1.25},
            {s = path .. "chamber.ogg",         t = 2.13, c = ci},
            {s = ratel,  t = 2.4},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },

    ["reload_drum"] = {
        Source = "reload_drum",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 1.6,
        LastClip1OutTime = 1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.9,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "magout.ogg",        t = 0.32, c = ci},
            {s = rottle, t = 0.25},
            {s = rottle, t = 0.75},
            {s = path .. "magin.ogg",         t = 1.05, c = ci},
            {s = common .. "cloth_4.ogg",  t = 1.65},
            {s = path .. "magtap.ogg",         t = 1.755, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.25},
        },
    },
    ["reload_empty_drum"] = {
        Source = "reload_empty_drum",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        MinProgress = 2.4,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 1,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "magout.ogg",        t = 0.3, c = ci},
            {s = rottle, t = 0.25},
            {s = rottle, t = 0.75},
            {s = common .. "magdrop.ogg",  t = 1.0},
            {s = path .. "magin.ogg",         t = 1.05, c = ci},
            {s = common .. "cloth_4.ogg",  t = 1.65},
            {s = path .. "magtap.ogg",         t = 1.755, c = ci},
            {s = path .. "rack1.ogg",         t = 2.3, c = ci},
            {s = path .. "rack2.ogg",         t = 2.5, c = ci},
            {s = common .. "shoulder.ogg",  t = 3.0},
        },
    },

    ["enter_inspect"] = {
        Source = "inspect_enter",
        LHIK = false,
        LHIKIn = 0,
        LHIKOut = 2.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-smg-03.ogg", t = 0},
        },
    },
    ["idle_inspect"] = {
        Source = "inspect_loop",
        LHIK = false,
        LHIKIn = 0,
        LHIKOut = 999,
    },
    ["exit_inspect"] = {
        Source = "inspect_exit",
        LHIK = false,
        LHIKIn = 0,
        LHIKOut = 999,
        SoundTable = {
            {s = common .. "movement-smg-01.ogg", t = 0.2},
            {s = rottle, t = 0.25},
            {s = rottle, t = 1.2},
            {s = common .. "movement-smg-04.ogg", t = 1.25},
        },
    },

    ["enter_sprint"] = {
        Source = "sprint_enter",
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKOut = 0,
        Time = .5,
    },
    ["idle_sprint"] = {
        Source = "sprint_loop",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_sprint"] = {
        Source = "sprint_exit",
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.4,
        LHIKOut = 0.5,
        Time = .5,
    },
}

SWEP.AutosolveSourceSeq = "idle"

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic_lp","optic","ur_mp5_optic", "optic_sniper"},
        Bone = "body",
        Offset = {
            vpos = Vector(-0.1, -1.6, 3),
            vang = Angle(90, 0, -90),
        },
        CorrectivePos = Vector(-0.09, 0, 0),
        CorrectiveAng = Angle(1, 0.6, -4.0),
        InstalledEles = {"ur_mp5_rail_optic"},
        ExcludeFlags = {"ur_mp5_kit_sadu"},
    },
    {
        PrintName = "Upper Receiver",
        DefaultAttName = "9\" Standard Upper",
        DefaultAttIcon = Material("entities/att/ur_mp5/upper_std.png", "smooth mips"),
        Slot = "ur_mp5_barrel",
        Bone = "body",
        Offset = {
            vpos = Vector(2.6, -3.7, -17.3),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"ur_mp5_kit_sadu"},
    },
    {
        PrintName = "Lower Receiver",
        DefaultAttName = "Navy Lower",
        DefaultAttIcon = Material("entities/att/ur_mp5/grip.png", "smooth mips"),
        Slot = "ur_mp5_caliber",
        DefaultEles = {"receiver_lower_0"},
        ExcludeFlags = {"ur_mp5_mag_rifle"},
        Bone = "body",
        Offset = {
            vpos = Vector(0, 2.9, 10.063),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "body",
        Offset = {
            vpos = Vector(0, 0.3, 14.8),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"barrel_sd","barrel_eod","barrel_sword"}
    },
    {
        PrintName = "Handguard",
        DefaultAttName = "Tropical Handguard",
        DefaultAttIcon = Material("entities/att/ur_mp5/hg_std.png", "smooth mips"),
        Slot = {"ur_mp5_hg"},
        ExcludeFlags = {"barrel_sd", "barrel_eod", "ur_mp5_kit_sadu"},
        Bone = "body",
        Offset = {
            vpos = Vector(0, .9, 10),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip"},
        Bone = "body",
        Offset = {
            vpos = Vector(0, .9, 10),
            vang = Angle(90, 0, -90),
        },
        GivesFlags = {"mp5_rail"},
        ExcludeFlags = {"mp5_badhg", "ur_mp5_barrel_dong", "ur_mp5_kit_sadu"},
        MergeSlots = {15},
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "body",
        Offset = {
            vpos = Vector(-0.9, 0.2, 8),
            vang = Angle(90, 0, 180),
        },
        VMScale = Vector(.8,.8,.8),
        GivesFlags = {"mp5_rail"},
    },
    {
        PrintName = "Stock",
        Slot = {"ur_mp5_stock"},
        DefaultAttName = "Full Stock",
        DefaultAttIcon = Material("entities/att/ur_mp5/stock_std.png", "smooth mips"),
        ExcludeFlags = {"ur_mp5_kit_sadu"},
    },
    {
        PrintName = "Magazine",
        Slot = {"ur_mp5_mag"},
        DefaultAttName = "30-Round Mag",
        DefaultAttIcon = Material("entities/att/ur_mp5/mag30.png", "smooth mips"),
        ExcludeFlags = {"ur_mp5_cal_40sw","ur_mp5_cal_10mm", "ur_mp5_mag_rifle", "ur_mp5_kit_sadu"}
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth"),
        Slot = "uc_ammo",
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load",
        ExcludeFlags = {"barrel_sd"}
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm", "mp5_charm"},
        FreeSlot = true,
        Bone = "Body",
        Offset = {
            vpos = Vector(0.6, 1.1, 2.5),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "M203 slot",
        Slot = {"uc_ubgl", "ubgl"},
        Bone = "Body",
        Offset = {
            vpos = Vector(0, 0, 7.9),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
        ExcludeFlags = {"mp5_badhg"},
    }
}

UCExtras_RegisterWeapon(SWEP, "arccw_ur_mp5")
