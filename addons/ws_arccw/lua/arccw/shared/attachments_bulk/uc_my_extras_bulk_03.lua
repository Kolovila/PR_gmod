                                                                                               
                                                                             

                                              
do
    local att = {}

att.PrintName = "Zeiss Diavari DA 1.5-6x Sniper Scope"
att.AbbrevName = "G3SG/1 Optic (1.5-6x) UNIVERSAL"

if !GetConVar("arccw_truenames"):GetBool() then
    att.AbbrevName = "SSR Optic (1.5-6x) UNIVERSAL"
end

att.Icon = Material("entities/att/acwatt_ur_g3_optic_sg1.png", "mips smooth")
att.Description = "Variable power scope, adjustable for a very wide range of magnifications.\nExclusive to the G3 pattern rifle."
att.SortOrder = 300

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp", "optic_sniper"}

att.Model = "models/weapons/arccw/atts/g3_optic_sg1.mdl"
att.ModelOffset = Vector(0.55, 0, -1.7)

att.AdditionalSights = {
    {
        Pos = Vector(0.01, 10.5, -1.18),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ScopeMagnificationMin = UC_HalfScope( 1.5 ),
        ScopeMagnificationMax = UC_HalfScope( 6 ),
        ScopeMagnification = UC_HalfScope( 4.5 ),
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/SG1_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 9.5,
            HolosightPiece = "models/weapons/arccw/atts/g3_optic_sg1_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = UC_HalfScope( 4.5 ),
            HolosightMagnificationMin = UC_HalfScope( 1.5 ),
            HolosightMagnificationMax = UC_HalfScope( 6 ),
            Colorable = true,
        },
    }
}

att.HolosightPiece = "models/weapons/arccw/atts/g3_optic_sg1_hsp.mdl"
att.Colorable = true

att.Mult_SightedSpeedMult = 0.78

    ArcCW.LoadAttachmentType(att, "ur_g3_optic_sg1_universal")
end
                                            

                                   
do
    local att = {}

att.PrintName = "G3 10mm Auto Receiver"
att.AbbrevName = "G3 10mm Auto Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 10mm Auto Receiver"
    att.AbbrevName = "CN66 10mm Auto Receiver"
end

att.Description = "Receiver and barrel group that accepts 10mm Auto rounds from detachable submachinegun magazines."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.Override_Trivia_Calibre = "10mm Auto"

att.Override_PhysBulletMuzzleVelocity = 440

att.Mult_Damage = 0.5385
att.Mult_DamageMin = 0.5714
att.Mult_Penetration = 0.4
att.Mult_Range = 0.35

att.Mult_RPM = 1.35
att.Mult_ClipSize = 1.5
att.Mult_ReloadTime = 0.85

att.Mult_Recoil = 0.55
att.Mult_RecoilSide = 0.62
att.Mult_VisualRecoilMult = 0.7
att.Mult_AccuracyMOA = 1.2
att.Mult_HipDispersion = 0.78
att.Mult_ShootVol = 0.88
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/m16_357_fire_sup.wav"
    else
        return "weapons/misc/m16_357_fire.wav"
    end
end

att.ActivateElements = {"ur_g3_mag_smg", "ur_g3_rec_smg"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

local slotinfo = {
    [9] = {"30-Round 10mm Mag", "30-Round 10mm Mag", Material("entities/att/ur_mp5/mag_str.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_10mm")
end
                                 

                                   
do
    local att = {}

att.PrintName = "G3 .22 Long Rifle Receiver"
att.AbbrevName = "G3 .22 Long Rifle Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 .22 Long Rifle Receiver"
    att.AbbrevName = "CN66 .22 Long Rifle Receiver"
end

att.Description = "Receiver and barrel group cut for the .22 Long Rifle rimfire, feeding from the same detachable submachinegun magazines. Training conversions like this were sold for every service rifle worth the name, because a day on the range costs a fraction of what it costs in the real chambering.\n\nIt will punch paper all afternoon and barely move in the hands. It will not do much else."
att.Icon = Material("entities/att/uc_bullets/22lr.png", "mips smooth")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_Ammo = "pistol"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 370

att.Mult_Damage = 0.1846
att.Mult_DamageMin = 0.2
att.Mult_Penetration = 0.15
att.Mult_Range = 0.18

att.Mult_RPM = 1.7
att.Mult_ClipSize = 1.75
att.Mult_ReloadTime = 0.78

att.Mult_Recoil = 0.18
att.Mult_RecoilSide = 0.2
att.Mult_VisualRecoilMult = 0.3
att.Mult_AccuracyMOA = 0.9
att.Mult_HipDispersion = 0.68
att.Mult_ShootPitch = 1.12
att.Mult_ShootVol = 0.7

local path = ")weapons/arccw_ud/mini14/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return path .. "fire_22_supp.ogg"
    else
        return path .. "fire_22.ogg"
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {path .. "fire_22_dist.ogg"}
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {path .. "fire_22_dist.ogg"}
    end
end

att.ActivateElements = {"ur_g3_mag_smg", "ur_g3_rec_smg"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

local slotinfo = {
    [9] = {"35-Round .22 LR Mag", "35-Round .22 LR Mag", Material("entities/att/ur_mp5/mag_str.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_22lr")
end
                                 

                                  
do
    local att = {}

att.PrintName = "G3 .280 British Receiver"
att.AbbrevName = "G3 .280 British Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 .280 British Receiver"
    att.AbbrevName = "CN66 .280 British Receiver"
end

att.Description = "Receiver and barrel group that accepts .280 British rounds.\n\n The .280 British (7mm MK1Z) was a post-WWII intermediate rifle cartridge developed by the UK. It aimed to provide a balance of range, firepower, and manageable recoil for rifles and light machine guns. Although it showed promise, it wasn't adopted by NATO, which chose the 7.62×51mm NATO round instead."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_Trivia_Calibre = ".280 British"

att.Mult_RPM = 0.865
att.Mult_ReloadTime = 1.025
att.Mult_Recoil = 1.17
att.Mult_HipDispersion = 1.045

att.Mult_Penetration = 1.22
att.Mult_DamageMin = 1.10
att.Mult_Damage = 1.27
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/g3_280_fire_sup.wav"
    else
        return "weapons/misc/g3_280_fire.wav"
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_280")
end
                                

                                         
do
    local att = {}

att.PrintName = "AG58 .338 Spectre Receiver"
att.AbbrevName = ".338 Spectre"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "A heavy subsonic built by Teppo Jutsu on a shortened 10mm case, throwing a bullet nearly twice the weight of a .308 at about a third of the speed. Suppressed it is quieter than most air rifles.\n\nVery quiet and it wrecks movement: anyone hit drops to 50 percent speed for three and a half seconds. It hits hard but drops away quickly, so treat it as a close to medium range tool."
att.Desc_Pros = {
    "Cripples target movement",
    "Very quiet",
    "Heavy hit",
}
att.Desc_Cons = {
    "Poor range",
    "Drops fast",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_g3_rec"

att.AutoStats = true

att.Override_Trivia_Calibre = ".338 Spectre"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 0.9

att.Mult_Damage = 1.4
att.Mult_DamageMin = 1.15
att.Mult_Penetration = 1.2
att.Mult_Range = 0.55
att.Mult_RangeMin = 0.6
att.Mult_MuzzleVelocity = 0.45
att.Mult_Recoil = 1.1
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.8
att.Mult_ShootVol = 0.6
att.Mult_ShootPitch = 0.72

local SLOW = 0.5
local DUR  = 3.5

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end

    if ent:IsPlayer() then
        ent:SetLaggedMovementValue(SLOW)

        local id = "UC_Chill_" .. ent:EntIndex()
        timer.Create(id, DUR, 1, function()
            if IsValid(ent) and ent:IsPlayer() then
                ent:SetLaggedMovementValue(1)
            end
        end)
    elseif ent:IsNPC() then
        ent:SetSchedule(SCHED_FLINCH_PHYSICS)
    end

    return hit
end

local fire = {"weapons/arccw_ud/m16/fire_beo.ogg", "weapons/arccw_ud/m16/fire_beo_new.ogg"}
local firesup = {"weapons/arccw_ud/m16/fire-sup-01.ogg", "weapons/arccw_ud/m16/fire-sup-02.ogg", "weapons/arccw_ud/m16/fire-sup-03.ogg", "weapons/arccw_ud/m16/fire-sup-04.ogg", "weapons/arccw_ud/m16/fire-sup-05.ogg", "weapons/arccw_ud/m16/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_338spectre")
end
                                       

                                  
do
    local att = {}

att.PrintName = "G3 .410 Bore Receiver"
att.AbbrevName = "G3 .410 Bore Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 .410 Bore Receiver"
    att.AbbrevName = "CN66 .410 Bore Receiver"
end

att.Description = "Receiver and barrel group that accepts .410 bore rounds, changing the weapon into a shotgun."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.Mult_RPM = 0.80
att.Mult_ReloadTime = 1.05
att.Mult_Recoil = 1.15
att.Mult_HipDispersion = 1.10
att.Override_Num = 4
att.Mult_AccuracyMOA = 25

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 1.30
att.Mult_Damage = 1.38
att.ShootPitchVariation = 1

local path = "weapons/410bore_m16/"

local fire22 = {path .. "410_bore_g3_fire.wav"}
local fire22sup = {path .. "410bore_m16_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "410bore_m16_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "410bore_m16_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_410")
end
                                

                                 
do
    local att = {}

att.PrintName = "G3 .45 ACP Receiver"
att.AbbrevName = "G3 .45 ACP Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 .45 ACP Receiver"
    att.AbbrevName = "CN66 .45 ACP Receiver"
end

att.Description = "Receiver and barrel group that accepts .45 ACP rounds from detachable submachinegun magazines."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.Override_Trivia_Calibre = ".45 ACP"

att.Override_PhysBulletMuzzleVelocity = 280

att.Mult_Damage = 0.6923
att.Mult_DamageMin = 0.4286
att.Mult_Penetration = 0.45
att.Mult_Range = 0.25

att.Mult_RPM = 1.15
att.Mult_ClipSize = 1.25
att.Mult_ReloadTime = 0.88

att.Mult_Recoil = 0.62
att.Mult_RecoilSide = 0.7
att.Mult_VisualRecoilMult = 0.8
att.Mult_AccuracyMOA = 1.25
att.Mult_HipDispersion = 0.85
att.Mult_ShootVol = 0.92
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/mp5_45acp_fire_sup.wav"
    else
        return "weapons/misc/mp5_45acp_fire.wav"
    end
end

att.ActivateElements = {"ur_g3_mag_smg", "ur_g3_rec_smg"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

local slotinfo = {
    [9] = {"30-Round .45 ACP Mag", "30-Round .45 ACP Mag", Material("entities/att/ur_mp5/mag_str.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_45")
end
                               

                                     
do
    local att = {}

att.PrintName = "PTR32 7.62x39mm Receiver"
att.AbbrevName = "PTR32 7.62x39mm Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PTR32 7.62x39mm Receiver"
    att.AbbrevName = "PTR32 7.62x39mm Receiver"
end

att.Description = "The PTR32 KFR is a semi-automatic 7.62×39mm rifle that pairs PTR's roller-delayed blowback operating system with the intermediate-caliber performance of the AK-pattern cartridge."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_ClipSize = 30

att.Override_Trivia_Calibre = "7.62x39mm"

att.Mult_Recoil = .7
att.Mult_Damage = ArcCW.UC.StdDmg["762_39"].max / ArcCW.UC.StdDmg["762_51"].max
att.Mult_DamageMin = ArcCW.UC.StdDmg["762_39"].min / ArcCW.UC.StdDmg["762_51"].min

att.Mult_Penetration = ArcCW.UC.StdDmg["762_39"].pen / ArcCW.UC.StdDmg["762_51"].pen
att.Mult_MuzzleVelocity = ArcCW.UC.StdDmg["762_39"].vel / ArcCW.UC.StdDmg["762_51"].vel
att.Mult_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["762_39"].vel / ArcCW.UC.StdDmg["762_51"].vel
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/ar458/ar762_fire_sup.wav"
    else
        return "weapons/ar458/ar762_fire.wav"
    end
end

att.ActivateElements = {"ur_g3_mag_ptr32"}

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_762x39")
end
                                   

                                        
do
    local att = {}

att.PrintName = "AG58 8mm Remington Magnum Receiver"
att.AbbrevName = "8mm Remington Magnum"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/300winchester.png", "smooth mips")
att.Description = "Remington's belted magnum from 1978, intended for very large game at very long range. Almost nobody bought a rifle for it and it survives mostly as a parent case for wildcatters who needed something enormous to neck down.\n\nArms at 22 metres: a quarter damage inside that, 65 percent more than normal past it. Long reach and hard hitting, with a small magazine and a slow cycle to pay for it."
att.Desc_Pros = {
    "Very strong past 22 metres",
    "Long reach",
}
att.Desc_Cons = {
    "Weak up close",
    "Small magazine",
    "Slow",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_g3_rec"

att.AutoStats = true

att.Override_Trivia_Calibre = "8mm Remington Magnum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1.25

att.Mult_Damage = 1.4
att.Mult_DamageMin = 1.5
att.Mult_Penetration = 1.7
att.Mult_Range = 1.9
att.Mult_RangeMin = 1.8
att.Mult_MuzzleVelocity = 1.3
att.Mult_Recoil = 1.6
att.Mult_VisualRecoilMult = 1.5
att.Mult_RPM = 0.68
att.Mult_ClipSize = 0.6
att.Mult_ShootVol = 1.35

local ARM = 22

att.Hook_BulletHit = function(wep, hit)
    if hit.range < ARM then
        hit.damage = hit.damage * 0.25
    else
        hit.damage = hit.damage * 1.65
    end

    return hit
end
att.Mult_ShootPitch = 0.8

local fire = {"weapons/arccw_ur/ak/fire_308_1.ogg", "weapons/arccw_ur/ak/fire_308_2.ogg", "weapons/arccw_ur/ak/fire_308_3.ogg", "weapons/arccw_ur/ak/fire_308_4.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_8mmremmag")
end
                                      

                                  
do
    local att = {}

att.PrintName = "G3 9x19mm Parabellum Receiver"
att.AbbrevName = "G3 9x19mm Parabellum Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 9x19mm Parabellum Receiver"
    att.AbbrevName = "CN66 9x19mm Parabellum Receiver"
end

att.Description = "Receiver and barrel group that accepts 9x19mm Parabellum rounds from detachable submachinegun magazines."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Override_PhysBulletMuzzleVelocity = 420

att.Mult_Damage = 0.4615
att.Mult_DamageMin = 0.4857
att.Mult_Penetration = 0.3
att.Mult_Range = 0.3

att.Mult_RPM = 1.54
att.Mult_ClipSize = 1.5
att.Mult_ReloadTime = 0.85

att.Mult_Recoil = 0.42
att.Mult_RecoilSide = 0.5
att.Mult_VisualRecoilMult = 0.55
att.Mult_AccuracyMOA = 1.15
att.Mult_HipDispersion = 0.7
att.Mult_ShootVol = 0.82
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/m16_380acp_sup.wav"
    else
        return "weapons/misc/m16_380acp_fire.wav"
    end
end

att.ActivateElements = {"ur_g3_mag_smg", "ur_g3_rec_smg"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

local slotinfo = {
    [9] = {"30-Round 9x19mm Mag", "30-Round 9x19mm Mag", Material("entities/att/ur_mp5/mag_str.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_9mm")
end
                                

                                  
do
    local att = {}

att.PrintName = "G41 5.56x45mm Receiver"
att.AbbrevName = "G41 5.56 Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G41 5.56x45mm Receiver"
    att.AbbrevName = "G41 5.56 Receiver"
end

att.Description = "The H&K G41 is a German 5.56×45mm NATO assault rifle introduced in 1981 and produced in limited quantities by Heckler & Koch. It was designed to replace the 7.62×51mm NATO chambered Heckler & Koch G3 and the G3 based .223 Remington/5.56×45mm and later 5.56×45mm NATO chambered Heckler & Koch HK33 service rifles providing a more modern weapon compatible with then recently introduced NATO standards."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Override_ClipSize = 30

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Trivia_Class = "Assault Rifle"

att.Mult_RPM = 650 / 520
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .95
att.Mult_Recoil = 0.45
att.Mult_HipDispersion = .75

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 20 / 35
att.Mult_Damage = 34 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"ur_g3_mag_g41"}

local path = ")weapons/arccw_ur/g3/"
local path1 = ")weapons/arccw_ur/ak/556/"

local fire556 = {path .. "fire-556-01.ogg",path .. "fire-556-02.ogg",path .. "fire-556-03.ogg",path .. "fire-556-04.ogg",path .. "fire-556-05.ogg",path .. "fire-556-06.ogg"}
local fire556sup = {path1 .. "fire-sup-01.ogg",path1 .. "fire-sup-02.ogg",path1 .. "fire-sup-03.ogg",path1 .. "fire-sup-04.ogg",path1 .. "fire-sup-05.ogg",path1 .. "fire-sup-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire556sup
    else
        return fire556
    end
end

local tail = ")/arccw_uc/common/556x45/"
local fire556dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire556dist
    end
end

local slotinfo = {
    [9] = {"30-Round 5.56 Mag", "30-Round 5.56 Mag", Material("entities/att/ur_g3/mag556_30.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_g41")
end
                                

                                   
do
    local att = {}

att.PrintName = "MC-51 Receiver"
att.AbbrevName = "MC-51 Receiver"

att.Description = "During the mid-1980s, UK special forces explored possible alternatives for the Sterling L34 silenced submachine gun, which had poor range and stopping to replace the Sterling. The MC-51 was essentially a very short G3 rifle, cut down to the dimensions of a submachine gun. It was chambered for 7.62x51mm NATO ammunition, which not only offered greater power than the 9mm Sterling, but also enabled far superior range and accuracy."
att.Icon = Material("entities/att/ur_g3/rec_33.png","smooth mips")
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.SortOrder = 12

att.Mult_RPM = 1.25
att.Mult_ReloadTime = 0.95
att.Mult_Recoil = 1.10
att.Mult_HipDispersion = 1.20

att.Mult_Penetration = 0.95
att.Mult_DamageMin = 0.95
att.Mult_Damage = 0.95

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_mc51")
end
                                 

                                      
do
    local att = {}

att.PrintName = "PSG-1 .280 Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PMR-2 .280 Receiver"
end

att.Description = "Infamously expensive semi-automatic receiver. Comes with sublime long-range performance and a comfortable wooden grip that improves handling. This variant is chambered in the .280 British caliber."
att.Icon = Material("entities/att/ur_g3/rec_psg.png","smooth mips")
att.Slot = "ur_g3_rec"
att.Desc_Cons = {
    "uc.semionly"
}
att.AutoStats = true

att.SortOrder = 13
att.Mult_AccuracyMOA = 0.5
att.Mult_Range = 1.25
att.Mult_MoveDispersion = 0.5

att.Mult_PhysBulletMuzzleVelocity = 1.20

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = ".280 British"
att.Override_Trivia_Class = "Sniper Rifle"

att.Mult_RPM = 0.865
att.Mult_ReloadTime = 1.025
att.Mult_Recoil = 1.07
att.Mult_HipDispersion = 1.045

att.Mult_Penetration = 1.22
att.Mult_DamageMin = 1.10
att.Mult_Damage = 1.27
att.ShootPitchVariation = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/g3_280_fire_sup.wav"
    else
        return "weapons/misc/g3_280_fire.wav"
    end
end

att.GivesFlags = {"ur_g3_rec_psg"}

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_psg_280")
end
                                    

                                      
do
    local att = {}

att.PrintName = "PSG-1 5.56 Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PMR-2 5.56 Receiver"
end

att.Description = "Infamously expensive semi-automatic receiver. Comes with sublime long-range performance and a comfortable wooden grip that improves handling. This variant is chambered in 5.56x45mm."
att.Icon = Material("entities/att/ur_g3/rec_psg.png","smooth mips")
att.Slot = "ur_g3_rec"
att.Desc_Cons = {
    "uc.semionly"
}
att.AutoStats = true

att.SortOrder = 13
att.Mult_Recoil = 0.35
att.Mult_AccuracyMOA = 0.5
att.Mult_Range = 1.25
att.Mult_MoveDispersion = 0.5

att.Mult_PhysBulletMuzzleVelocity = 1.15

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Trivia_Class = "Sniper Rifle"

att.Mult_RPM = 650 / 520
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .95
att.Mult_HipDispersion = .75

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 20 / 35
att.Mult_Damage = 34 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.GivesFlags = {"cal_556", "ur_g3_rec_psg"}

local path = ")weapons/arccw_ur/g3/"
local path1 = ")weapons/arccw_ur/ak/556/"

local fire556 = {path .. "fire-556-01.ogg",path .. "fire-556-02.ogg",path .. "fire-556-03.ogg",path .. "fire-556-04.ogg",path .. "fire-556-05.ogg",path .. "fire-556-06.ogg"}
local fire556sup = {path1 .. "fire-sup-01.ogg",path1 .. "fire-sup-02.ogg",path1 .. "fire-sup-03.ogg",path1 .. "fire-sup-04.ogg",path1 .. "fire-sup-05.ogg",path1 .. "fire-sup-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire556sup
    else
        return fire556
    end
end

local tail = ")/arccw_uc/common/556x45/"
local fire556dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire556dist
    end
end

local slotinfo = {
    [9] = {"30-Round 5.56 Mag", "30-Round 5.56 Mag", Material("entities/att/ur_g3/mag556_30.png", "mips smooth")},
}

att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end
att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_psg_556")
end
                                    

                                    
do
    local att = {}

att.PrintName = "7.62x51mm Sabot Wildcat Receiver"
att.AbbrevName = "7.62 Sabot"

att.SortOrder = 80
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "A full sized case necked down around a discarding sabot and a tungsten sub-calibre penetrator. It leaves faster than anything else the rifle will chamber and arrives with most of that still intact.\n\nThe fastest and flattest thing the rifle will chamber: nearly double muzzle velocity, double the range and well over double the penetration. The penetrator is narrow, so the hit itself is slightly weaker up close and slightly stronger far out."
att.Desc_Pros = {
    "Flattest, fastest thing on the platform",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_g3_rec"
att.AutoStats = true

att.Override_Trivia_Calibre = "7.62x51mm Sabot"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25

att.Mult_MuzzleVelocity = 1.8
att.Mult_Range = 2.1
att.Mult_Penetration = 2.4
att.Mult_AccuracyMOA = 0.6
att.Mult_Damage = 0.8
att.Mult_DamageMin = 1.15
att.Mult_Recoil = 0.85
att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 1.1

local fire = {"weapons/arccw_ur/ak/fire_308_1.ogg", "weapons/arccw_ur/ak/fire_308_2.ogg", "weapons/arccw_ur/ak/fire_308_3.ogg", "weapons/arccw_ur/ak/fire_308_4.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_g3_rec_sabot")
end
                                  

                                       
do
    local att = {}

att.PrintName = "G3 \"Swordfish\" Futuristic Stock"
att.AbbrevName = "Futuristic Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58-Future Folding Stock"
end

att.Icon = Material("entities/att/ur_mp5/stock_fish.png", "smooth mips")
att.Description = "Plastic-polymer stock with a telescoping buttstock and adjustable cheek riser. Though these features make for much situational adaptability, recoil control suffers as a result of the light construction.\n\nToggling the stock modifies performance accordingly."
att.AutoStats = true
att.Slot = "ur_g3_stock"

att.ToggleLockDefault = true
att.ToggleSound = "arccw_uc/common/stockslide.ogg"

att.Mult_MoveDispersion = .85
att.Mult_Sway = 1.5
att.Mult_SightTime = 1.2
att.Mult_RecoilSide = 1.15
att.Mult_HipDispersion = 0.85

att.ToggleStats = {
    {
        PrintName = "Extended",
        ActivateElements = {"stock_future"},
        AutoStats = true,
    },
    {
        PrintName = "Collapsed",
        ActivateElements = {"stock_future_collapsed"},
        AutoStats = true,
        Mult_ShootSpeedMult = 1.05,
        Add_BarrelLength = -1.5
    },
    {
        PrintName = "Folded",
        ActivateElements = {"stock_future_folded"},
        AutoStats = true,
        Mult_ShootSpeedMult = 1.15,
        Add_BarrelLength = -4
    }
}

    ArcCW.LoadAttachmentType(att, "ur_g3_stock_future")
end
                                     

                                     
do
    local att = {}

att.PrintName = "G3 Buttstock"
att.AbbrevName = "No Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AG58 Buttstock"
end

att.Icon = Material("","smooth mips")
att.Description = "Remove that pesky and bulky stock and replace it with a nice and elegant buttcap."
att.AutoStats = true
att.Slot = {"ur_g3_stock"}

att.SortOrder = 10

att.Mult_SightTime = 0.75

att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.05

att.Mult_SightedSpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.85

att.Mult_Sway = 1.4
att.Add_BarrelLength = -4

att.ActivateElements = {"ur_g3_stock_none"}

    ArcCW.LoadAttachmentType(att, "ur_g3_stock_none")
end
                                   

                                    
do
    local att = {}

att.PrintName = "G3 PDW Folding Stock"
att.AbbrevName = "PDW Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58-PDW Folding Stock"
end

att.Icon = Material("entities/att/ur_mp5/stock_pdw.png", "smooth mips")
att.Description = "Light polymer \"personal defense weapon\" stock. Ideal for point shooting due to its conventional shape. It can be folded to reduce profile even further at the cost of recoil.\n\nToggling the stock modifies performance accordingly."
att.AutoStats = true
att.Slot = "ur_g3_stock"

att.ToggleLockDefault = true
att.ToggleSound = "arccw_uc/common/stockslide.ogg"

att.Mult_MoveDispersion = .85
att.Mult_Recoil = 1.5
att.Mult_RecoilSide = 1.25

att.Mult_HipDispersion = 0.75
att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.ToggleStats = {
    {
        PrintName = "Extended",
        ActivateElements = {"stock_pdw"},
        AutoStats = true,
    },
    {
        PrintName = "Folded",
        ActivateElements = {"stock_pdw_folded"},
        AutoStats = true,
        Add_BarrelLength = -12,
        Mult_Recoil = 2,
        Mult_ShootSpeedMult = 1.20,
        Mult_SightedSpeedMult = 1.20,
        Mult_Sway = 3,
    }
}

    ArcCW.LoadAttachmentType(att, "ur_g3_stock_pdw")
end
                                  

                                    
do
    local att = {}

att.PrintName = "UMP Style B&T Folding Stock"
att.AbbrevName = "B&T Folding Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "umpa Folding Stock"
end

att.Icon = Material("entities/att/ur_mp5/stock_ump.png", "smooth mips")
att.Description = "Folding stock derived from a submachinegun pattern by the same manufacturer. Its wide buttpad reduces horizontal recoil at the cost of mobility and aim speed. \n\nToggling the stock modifies performance accordingly."
att.AutoStats = true
att.Slot = "ur_g3_stock"

att.ToggleLockDefault = true
att.ToggleSound = "arccw_uc/common/stockslide.ogg"

att.Mult_DrawTime = 1.1
att.Mult_HolsterTime = 1.1
att.Mult_SightedSpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.85
att.Mult_Recoil = 0.9

att.ToggleStats = {
    {
        PrintName = "Extended",
        ActivateElements = {"stock_ump"},
        AutoStats = true,
        Mult_HipDispersion = .75,
    },
    {
        PrintName = "Folded",
        ActivateElements = {"stock_ump_folded"},
        AutoStats = true,
        Add_BarrelLength = -12,
        Mult_Sway = 3,
    }
}

    ArcCW.LoadAttachmentType(att, "ur_g3_stock_ump")
end
                                  

                                          
do
    local att = {}

att.PrintName = "IZh-58 .408 CheyTac Conversion"
att.AbbrevName = ".408 CheyTac"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Volga Super .408 CheyTac Conversion"
end

att.SortOrder = 73
att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips")
att.Description = "Two barrels of a cartridge designed to stay supersonic past a mile, in a break-action farm gun with no sights worth the name. You get two shots at something very far away, and then a long think about your choices."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "Two rounds, and a very long reload",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".408 CheyTac"
att.Override_Trivia_Class = "Anti-Materiel Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ur_izh_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 4.2
att.Mult_DamageMin = 5.5
att.Mult_Range = 3.2
att.Mult_Penetration = 9
att.Mult_AccuracyMOA = 0.3
att.Mult_HipDispersion = 1.6
att.Mult_Recoil = 2.1
att.Mult_VisualRecoilMult = 1.6
att.Mult_RPM = 0.8
att.Mult_ClipSize = 1
att.Mult_ReloadTime = 1.25
att.Mult_ShootPitch = 0.85
att.Mult_ShootVol = 1.38

local fire = {"weapons/misc/408_cheytac_fire.wav"}
local firesup = {"weapons/misc/408cheytac_fire_sup.wav"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_izh_cal_408cheytac")
end
                                        

                                     
do
    local att = {}

att.PrintName = "IZh-58 .44 Magnum Conversion"
att.AbbrevName = ".44 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Volga Super .44 Magnum Conversion"
end

att.SortOrder = 74
att.Icon = Material("entities/att/uc_bullets/44magnum.png", "smooth mips")
att.Description = "Sleeved down to a revolver cartridge, which makes the thing pleasant to shoot for the first time in its life and means you can feed it out of the same box as your sidearm."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".44 Magnum"
att.Override_Trivia_Class = "Sporting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 0.95
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.GivesFlags = {"ur_izh_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 1.6
att.Mult_DamageMin = 1.7
att.Mult_Range = 1.15
att.Mult_Penetration = 2.6
att.Mult_AccuracyMOA = 0.55
att.Mult_HipDispersion = 0.72
att.Mult_Recoil = 0.55
att.Mult_VisualRecoilMult = 0.6
att.Mult_RPM = 1.25
att.Mult_ClipSize = 1
att.Mult_ReloadTime = 0.82
att.Mult_ShootPitch = 0.78
att.Mult_ShootVol = 1.35

local fire = {"weapons/arccw_ud/glock/fire_357.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_357.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-pistol-heavy-01.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-02.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-03.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-04.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-05.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_izh_cal_44mag")
end
                                   

                                        
do
    local att = {}

att.PrintName = "Volga Super .585 Nyati Conversion"
att.AbbrevName = ".585 Nyati"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IZh-58 .585 Nyati Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/3030winchester.png", "smooth mips")
att.Description = "Extremely powerful big-game hunting cartridge developed by Ross Seyfried in the late 20th century. It was designed to take down the largest and most dangerous animals, such as elephants and Cape buffalo. The cartridge fires a 750-grain bullet at velocities exceeding 2,300 feet per second, producing over 10,000 foot-pounds of energy. Its name, \"Nyati\", comes from the Swahili word for cape buffalo."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".585 Nyati"
att.Override_Trivia_Class = "Hunting Rifle"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"ur_izh_nonshotgun"}
att.Override_IsShotgun = false

att.Mult_AccuracyMOA = 0.12
att.Mult_Penetration = 4.10
att.Mult_Range = 1.45
att.Mult_Precision = 2
att.Mult_Recoil = 2.60
att.Mult_MalfunctionMean = 0.40
att.Mult_Damage = 3.25
att.Mult_DamageMin = 1.80
att.Mult_VisualRecoilMult = 1.75
att.Mult_RPM = 0.60
att.Mult_ReloadTime = 1.20
att.Mult_MuzzleVelocity = 1.80
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_3006_fire_sup.wav"
    else
        return "weapons/misc/izh_585nyati_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/izh_700nitro_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "izh_700nitro_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_izh_cal_585nyati")
end
                                      

                                        
do
    local att = {}

att.PrintName = "Volga Super .700 Nitro Express Conversion"
att.AbbrevName = ".700 Nitro Express"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IZh-58 .700 Nitro Express Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/30carbine.png", "smooth mips")
att.Description = "Powerful big-game rifle cartridge developed in the United Kingdom by Holland & Holland in 1988. It was designed for hunting the largest and most dangerous animals, such as elephants and Cape buffalo. The cartridge fires a massive 1,000-grain bullet at a velocity of 2,000 feet per second, generating over 8,900 foot-pounds of energy. This immense stopping power ensures a clean and humane kill for big-game hunters."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".700 Nitro Express"
att.Override_Trivia_Class = "Hunting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"ur_izh_nonshotgun"}
att.Override_IsShotgun = false

att.Mult_AccuracyMOA = 0.10
att.Mult_Penetration = 8.50
att.Mult_Range = 2.50
att.Mult_Precision = 2.45
att.Mult_Recoil = 2.45
att.Mult_MalfunctionMean = 0.50
att.Mult_Damage = 2.25
att.Mult_DamageMin = 1.90
att.Mult_VisualRecoilMult = 1.70
att.Mult_RPM = 0.70
att.Mult_ReloadTime = 1.15
att.Mult_MuzzleVelocity = 2.25
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_3006_fire_sup.wav"
    else
        return "weapons/misc/izh_700nitro_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/izh_700nitro_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "izh_700nitro_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_izh_cal_700nitro")
end
                                      

                                                
do
    local att = {}

att.PrintName = "M1911 .38-45 Clerke Conversion"
att.AbbrevName = ".38-45 Clerke"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Description = "Bo Clerke necked a .45 ACP case down to .38 in the fifties so bullseye shooters could keep their frames and lose their recoil. Every case has to be formed by hand and the die sets have been out of production for decades.\n\nArcs to one nearby enemy for 45 percent of the damage, so shooting into a group hits two people. Only one jump per shot. Light recoil and quick to fire."
att.Desc_Pros = {
    "Arcs to a second nearby target",
    "Light recoil",
}
att.Desc_Cons = {
    "Weak per hit",
    "Poor penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".38-45 Clerke"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/40sw.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.8
att.Mult_DamageMin = 0.78
att.Mult_Penetration = 0.85
att.Mult_Range = 1.1
att.Mult_MuzzleVelocity = 1.2
att.Mult_Recoil = 0.7
att.Mult_RPM = 1.2
att.Mult_ClipSize = 1.1
att.Mult_ShootPitch = 1.12

local ARC_RANGE = 220
local ARC_FRAC  = 0.45

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    local owner = IsValid(wep) and wep:GetOwner() or NULL
    if !IsValid(ent) then return hit end

    for _, e in ipairs(ents.FindInSphere(hit.tr.HitPos, ARC_RANGE)) do
        if e == ent or e == owner then continue end
        if !(e:IsPlayer() or e:IsNPC() or e:IsNextBot()) then continue end
        if e:Health() <= 0 then continue end

        local d = DamageInfo()
        d:SetDamage(hit.damage * ARC_FRAC)
        d:SetDamageType(DMG_SHOCK)
        d:SetAttacker(IsValid(owner) and owner or wep)
        d:SetInflictor(IsValid(wep) and wep or e)
        e:TakeDamageInfo(d)

        local eff = EffectData()
        eff:SetOrigin(e:WorldSpaceCenter())
        eff:SetStart(hit.tr.HitPos)
        eff:SetMagnitude(1)
        eff:SetScale(1)
        util.Effect("ManhackSparks", eff)

        break
    end

    return hit
end
att.Mult_ShootVol = 0.9

local fire = {"weapons/arccw_ud/glock/fire_40.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_40.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_40.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_m1911_caliber_3845clerke")
end
                                              

                                                
do
    local att = {}

att.PrintName = "M1911 .460 Rowland Conversion"
att.AbbrevName = ".460 Rowland"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Description = "Johnny Rowland lengthened a .45 ACP case by a hundredth of an inch, purely so it cannot be chambered in a gun not built for the pressure, and then loaded it to almost double. It makes a 1911 hit like a .44 magnum and wears one out about as fast.\n\nA finisher. Damage climbs as the target weakens, up to 80 percent extra against somebody nearly down. It already hits half again as hard as .45 ACP, so it closes fights other rounds leave open. Recoil and muzzle blast are both severe."
att.Desc_Pros = {
    "Damage climbs sharply against wounded targets",
    "Half again the damage of .45 ACP",
}
att.Desc_Cons = {
    "Severe recoil and blast",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".460 Rowland"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 0.9

att.Mult_Damage = 1.5
att.Mult_DamageMin = 1.45
att.Mult_Penetration = 1.5
att.Mult_Range = 1.4
att.Mult_RangeMin = 1.3
att.Mult_MuzzleVelocity = 1.35
att.Mult_Recoil = 1.55
att.Mult_VisualRecoilMult = 1.45
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.85
att.Mult_ShootVol = 1.0
att.Mult_ShootPitch = 1.0

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local maxhp = ent.GetMaxHealth and ent:GetMaxHealth() or 100
    if maxhp <= 0 then return hit end

    local frac = math.Clamp(ent:Health() / maxhp, 0, 1)
    hit.damage = hit.damage * Lerp(1 - frac, 1, 1.8)

    return hit
end

local fire = {"weapons/misc/generic_460_rowland.wav"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_45.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-pistol-heavy-01.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-02.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-03.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-04.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-05.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_m1911_caliber_460rowland")
end
                                              

                                            
do
    local att = {}

att.PrintName = "14\" Rifle Kit"

att.Icon = Material("", "smooth mips")
att.Description = "An upper and lower receiver that feature a longer barrel, and a modified magwell and a rifle magazine loaded in .30 Carbine"
att.AutoStats = true

att.Slot = "ur_mp5_barrel"

att.SortOrder = 14

att.Add_BarrelLength = 5
att.Mult_Sway = 1.15
att.Mult_SightTime = 1.20

att.Mult_HipDispersion = 0.85

att.ActivateElements = {"ur_mp5_barrel_rifle", "ur_mp5_mag_rifle", "receiver_lower_carbine"}
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}
att.Override_Trivia_Class = "Carbine"
att.Override_Trivia_Calibre = ".30 Carbine"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.58
att.Mult_DamageMin = 1.41
att.Mult_Penetration = 1.55

att.Mult_Recoil = 1.48
att.Mult_VisualRecoilMult = 1.23
att.Mult_RPM = 0.685
att.Mult_ShootSpeedMult = 0.90
att.Mult_Range = 1.70
att.Override_AccuracyMOA = 3
att.Override_ClipSize = 20

att.Mult_PhysBulletMuzzleVelocity = 1.35

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_rifle"
end

local path = "weapons/misc/"

local fire22 = {path .. "mp5_30carbine_fire.wav"}
local fire22sup = {path .. "mp5_30carbine_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_barrel_30carbine")
end
                                          

                                          
do
    local att = {}

att.PrintName = "14\" Carbine Upper"

att.Icon = Material("", "smooth mips")
att.Description = "An upper receiver that features a longer barrel"
att.AutoStats = true

att.Slot = "ur_mp5_barrel"

att.SortOrder = 14

att.Add_BarrelLength = 5
att.Mult_Sway = 1.15
att.Mult_SightTime = 1.20
att.Mult_RPM = 0.85

att.Mult_Recoil = 0.80
att.Mult_AccuracyMOA = 0.70
att.Mult_Range = 1.45

att.Mult_HipDispersion = 0.85

att.ActivateElements = {"ur_mp5_barrel_carbine"}
att.Override_Trivia_Class = "Carbine"

att.Mult_PhysBulletMuzzleVelocity = 1.20

    ArcCW.LoadAttachmentType(att, "ur_mp5_barrel_carbine")
end
                                        

                                           
do
    local att = {}

att.PrintName = "4.5\" Uber-Kurz Upper"

att.Icon = Material("entities/att/arccw_uberkurz_upper.png", "smooth mips")
att.Description = "Machine pistol variant with a maximally compact barrel and a lightened bolt assembly for increased cyclic rate.\nMid-range accuracy is poor, and recoil is noticibly increased. This variant works with ALL handguards."
att.AutoStats = true

att.Slot = "ur_mp5_barrel"

att.SortOrder = 4.5

att.LHIK = true

att.ModelOffset = Vector(6.5, -0.5, -1)
att.Model = "models/weapons/arccw/atts/lhik_kurz.mdl"

att.Add_BarrelLength = -4
att.Mult_Sway = .5
att.Mult_SightTime = .75
att.Mult_RPM = 1.125

att.Mult_Recoil = 1.25
att.Mult_AccuracyMOA = 3
att.Mult_Range = .5

att.Mult_HipDispersion = 0.85

att.ActivateElements = {"ur_mp5_barrel_uberkurz"}
att.Override_Trivia_Class = "Machine Pistol"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_kurz"
end

att.Mult_PhysBulletMuzzleVelocity = 0.9375

    ArcCW.LoadAttachmentType(att, "ur_mp5_barrel_uberkurz")
end
                                         

                                        
do
    local att = {}

att.PrintName = "PK5-4 7.63x25mm Mauser Conversion"
att.AbbrevName = "7.63x25mm Mauser"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/357sig.png", "smooth mips")
att.Description = "The Broomhandle's cartridge, and for thirty years the fastest pistol round in the world. The Soviets copied it as the 7.62 Tokarev and the two are close enough that people have fired the wrong one for a century.\n\nSkips off hard surfaces at an angle for 55 percent damage, so bursts into hard cover keep working after the first miss. Flat, fast, high penetration, light hits."
att.Desc_Pros = {
    "Ricochets off hard surfaces",
    "Flat, fast and armour piercing",
}
att.Desc_Cons = {
    "Light hits",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "7.63x25mm Mauser"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.8
att.Mult_DamageMin = 0.85
att.Mult_Penetration = 1.8
att.Mult_Range = 1.4
att.Mult_RangeMin = 1.3
att.Mult_MuzzleVelocity = 1.5
att.Mult_Recoil = 0.8
att.Mult_RPM = 1.1
att.Mult_ClipSize = 1.05
att.Mult_AccuracyMOA = 0.8
att.Mult_ShootPitch = 1.18

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.55)
    end

    return hit
end
att.Mult_ShootVol = 0.95

local fire = {"weapons/arccw_ur/mp5/fire-01.ogg", "weapons/arccw_ur/mp5/fire-02.ogg", "weapons/arccw_ur/mp5/fire-03.ogg", "weapons/arccw_ur/mp5/fire-04.ogg", "weapons/arccw_ur/mp5/fire-05.ogg", "weapons/arccw_ur/mp5/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_30mauser")
end
                                      

                                      
do
    local att = {}

att.PrintName = ".357 Magnum Conversion"
att.AbbrevName = ".357 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = ".357 Magnum Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "Conversion to the powerful .357 Magnum cartridge, you know the drill: Lots of punch and power, but at the cost of more recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".357 Magnum"
att.Override_Ammo = "357"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 2
att.Mult_Range = 1.55
att.Mult_Precision = 1.25
att.Mult_Recoil = 1.65
att.Mult_MalfunctionMean = 1.02
att.Override_PhysBulletMuzzleVelocity = 480
att.Mult_Damage = 1.85
att.Mult_DamageMin = 1.32
att.Mult_RPM = 0.88

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_357mag_fire_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_357mag_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_357mag")
end
                                    

                                         
do
    local att = {}

att.PrintName = ".400 Cor-Bon Conversion"
att.AbbrevName = ".400 Cor-Bon"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = ".400 Cor-Bon Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/429de.png", "smooth mips")
att.Description = "Automatic pistol cartridge developed in 1997 by Cor-Bon. It was designed to replicate the ballistics of the 10mm Auto cartridge but in a .45 ACP form factor. Essentially, it's a .45 ACP case necked down to .40 caliber with a 25-degree shoulder."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".400 Cor-Bon"

att.Mult_Penetration = 1.20
att.Mult_Range = 1.27
att.Mult_Precision = 1.36
att.Mult_Recoil = 1.375
att.Override_PhysBulletMuzzleVelocity = 165
att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.415
att.Mult_RPM = 0.85
att.Mult_ReloadTime = 1.05

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/m1911_400corbon_fire_sup.wav"
    else
        return "weapons/misc/m1911_400corbon_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_400corbon")
end
                                       

                                    
do
    local att = {}

att.PrintName = "PK5-4 .41 Action Express Conversion"
att.AbbrevName = ".41 Action Express"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/40sw.png", "smooth mips")
att.Description = "Evan Whildin's rebated rim design from 1986, built so a nine millimetre pistol could be converted by swapping the barrel and nothing else. The .40 S&W arrived four years later and killed it completely.\n\nJust under one hit in five knocks the target's weapon out of their hands, and at this rate of fire that adds up fast. Hits are a little heavier than nine millimetre."
att.Desc_Pros = {
    "Frequently disarms targets on full auto",
    "Heavier than 9mm",
}
att.Desc_Cons = {
    "Slightly reduced capacity",
    "More recoil",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".41 Action Express"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/40sw.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.2
att.Mult_Penetration = 1.15
att.Mult_Range = 1.1
att.Mult_Recoil = 1.2
att.Mult_RPM = 0.94
att.Mult_ClipSize = 0.85
att.Mult_ShootPitch = 0.95

local DISARM = 0.18

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.DropWeapon then return hit end
    if !(ent:IsPlayer() or ent:IsNPC()) then return hit end
    if math.random() > DISARM then return hit end

    ent:DropWeapon()

    if ent:IsPlayer() then
        ent:ViewPunch(Angle(-2, math.Rand(-3, 3), 0))
    end

    return hit
end
att.Mult_ShootVol = 1.05

local fire = {"weapons/arccw_ur/mp5/fire-40-01.ogg", "weapons/arccw_ur/mp5/fire-40-02.ogg", "weapons/arccw_ur/mp5/fire-40-03.ogg", "weapons/arccw_ur/mp5/fire-40-04.ogg", "weapons/arccw_ur/mp5/fire-40-05.ogg", "weapons/arccw_ur/mp5/fire-40-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-40-sup-01.ogg", "weapons/arccw_ur/mp5/fire-40-sup-02.ogg", "weapons/arccw_ur/mp5/fire-40-sup-03.ogg", "weapons/arccw_ur/mp5/fire-40-sup-04.ogg", "weapons/arccw_ur/mp5/fire-40-sup-05.ogg", "weapons/arccw_ur/mp5/fire-40-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_41ae")
end
                                  

                                     
do
    local att = {}

att.PrintName = ".44 Magnum Conversion"
att.AbbrevName = ".44 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = ".44 Magnum Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/44magnum.png", "smooth mips")
att.Description = "Conversion to the .44 Magnum cartridge, much more powerful than .357 Magnum but has much less range and precision than it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".44 Magnum"
att.Override_Ammo = "357"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 2.3
att.Mult_Range = 1.28
att.Mult_Precision = 1.25
att.Mult_Recoil = 1.75
att.Mult_MalfunctionMean = 1.02
att.Override_PhysBulletMuzzleVelocity = 290
att.Mult_Damage = 1.97
att.Mult_DamageMin = 1.41
att.Mult_RPM = 0.84

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_44mag_fire_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_44mag_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_44mag")
end
                                   

                                     
do
    local att = {}

att.PrintName = "4.6x30mm Conversion"
att.AbbrevName = "4.6x30mm"

att.SortOrder = 61
att.Icon = Material("entities/att/uc_bullets/46x30.png", "smooth mips")
att.Description = "Heckler und Koch's answer to the question of what a pistol round should do if the target is wearing armour. A tiny, very fast, steel cored bullet that goes through vests and puts a neat hole in whatever is behind them, on the theory that a hole is a hole."
att.Desc_Pros = {
    "Defeats armour easily",
    "Very controllable and fast firing",
}
att.Desc_Cons = {
    "Each hit lands light",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "4.6x30mm"
att.Override_Ammo = "smg1"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/57x28fn.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.72
att.Mult_DamageMin = 0.8
att.Mult_Penetration = 2.2
att.Mult_Range = 1.35
att.Mult_RangeMin = 1.25
att.Mult_MuzzleVelocity = 1.5
att.Mult_Recoil = 0.7
att.Mult_RecoilSide = 0.7
att.Mult_VisualRecoilMult = 0.75
att.Mult_RPM = 1.12
att.Mult_ClipSize = 1.15
att.Mult_AccuracyMOA = 0.8
att.Mult_ShootPitch = 1.2
att.Mult_ShootVol = 0.85

local fire = {"weapons/arccw_ur/mp5/fire-01.ogg", "weapons/arccw_ur/mp5/fire-02.ogg", "weapons/arccw_ur/mp5/fire-03.ogg", "weapons/arccw_ur/mp5/fire-04.ogg", "weapons/arccw_ur/mp5/fire-05.ogg", "weapons/arccw_ur/mp5/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_46x30")
end
                                   

                                    
do
    local att = {}

att.PrintName = ".50 Action Express Conversion"
att.AbbrevName = ".50 Action Express"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = ".50 Action Express Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Conversion to the .50 Action Express cartridge, much more powerful than .44 Magnum but has much less range and precision than it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".50 Action Express"
att.Override_Ammo = "357"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 3.3
att.Mult_Range = 1.38
att.Mult_Precision = 1.05
att.Mult_Recoil = 1.85
att.Mult_MalfunctionMean = 1.23
att.Override_PhysBulletMuzzleVelocity = 290
att.Mult_Damage = 2.15
att.Mult_DamageMin = 1.65
att.Mult_RPM = 0.70
att.Mult_ClipSize = 0.80
att.Mult_ReloadTime = 1.05

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_50ae_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_50ae.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_50ae")
end
                                  

                                         
do
    local att = {}

att.PrintName = "5.56x30mm MINSAS Conversion"
att.AbbrevName = "5.56x30mm MINSAS"

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/556.png", "smooth mips")
att.Description = "The 5.56x30mm MINSAS is a firearm cartridge manufactured by India's Ordnance Factory Board (OFB) for close-quarters combat use. It has an effective range of 300 metres (980 ft) and good penetration against body armor. OFB claims it exhibits penetration superior to 9x19mm Parabellum rounds."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "5.56x30mm MINSAS"
att.Override_Ammo = "smg1"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Mult_Penetration = 1.50
att.Mult_Range = 2.10
att.Mult_Precision = 1.0980
att.Mult_Recoil = 1.175
att.Override_PhysBulletMuzzleVelocity = 210
att.Mult_Damage = 1.17
att.Mult_DamageMin = 1.10
att.Mult_RPM = 0.90
att.Mult_ReloadTime = 1.05

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/type20_6mm_arisaka_fire_sup.wav"
    else
        return "weapons/misc/type20_6mm_arisaka_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_556minsas")
end
                                       

                                     
do
    local att = {}

att.PrintName = "5.7x28mm Conversion"
att.AbbrevName = "5.7x28mm"

att.SortOrder = 62
att.Icon = Material("entities/att/uc_bullets/57x28.png", "smooth mips")
att.Description = "FN's rival to the 4.6, and the one that actually sold. A necked down bottleneck case throwing a small pointed bullet fast enough to defeat soft armour, out of magazines that hold an unreasonable number of them."
att.Desc_Pros = {
    "Defeats armour easily",
    "Enormous magazine capacity",
}
att.Desc_Cons = {
    "Each hit lands light",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "5.7x28mm"
att.Override_Ammo = "smg1"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/57x28fn.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.78
att.Mult_DamageMin = 0.85
att.Mult_Penetration = 2.0
att.Mult_Range = 1.4
att.Mult_RangeMin = 1.3
att.Mult_MuzzleVelocity = 1.55
att.Mult_Recoil = 0.72
att.Mult_RecoilSide = 0.72
att.Mult_VisualRecoilMult = 0.75
att.Mult_RPM = 1.08
att.Mult_ClipSize = 1.25
att.Mult_AccuracyMOA = 0.78
att.Mult_ShootPitch = 1.15
att.Mult_ShootVol = 0.9

local fire = {"weapons/arccw_ur/mp5/fire-01.ogg", "weapons/arccw_ur/mp5/fire-02.ogg", "weapons/arccw_ur/mp5/fire-03.ogg", "weapons/arccw_ur/mp5/fire-04.ogg", "weapons/arccw_ur/mp5/fire-05.ogg", "weapons/arccw_ur/mp5/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_57x28")
end
                                   

                                    
do
    local att = {}

att.PrintName = "9x21mm Gyurza Conversion"
att.AbbrevName = "9x21mm Gyurza"

att.SortOrder = 63
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "The SP-10 load for the Russian Gyurza pistol: a hardened steel core in a bottlenecked nine millimetre case, built specifically to punch through body armour that ordinary nine stops dead against. Everything else about it was a secondary concern."
att.Desc_Pros = {
    "Defeats armour",
    "Flatter and harder hitting than 9x19",
}
att.Desc_Cons = {
    "Slightly slower to cycle",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x21mm Gyurza"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.15
att.Mult_DamageMin = 1.2
att.Mult_Penetration = 2.4
att.Mult_Range = 1.2
att.Mult_RangeMin = 1.15
att.Mult_MuzzleVelocity = 1.2
att.Mult_Recoil = 1.1
att.Mult_RPM = 0.97
att.Mult_AccuracyMOA = 0.95
att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 1.0

local fire = {"weapons/arccw_ur/mp5/fire-01.ogg", "weapons/arccw_ur/mp5/fire-02.ogg", "weapons/arccw_ur/mp5/fire-03.ogg", "weapons/arccw_ur/mp5/fire-04.ogg", "weapons/arccw_ur/mp5/fire-05.ogg", "weapons/arccw_ur/mp5/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_9x21")
end
                                  

                                    
do
    local att = {}

att.PrintName = "9x23mm Largo Conversion"
att.AbbrevName = "9x23mm Largo"

att.SortOrder = 63
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "A Spanish nine millimetre from the Twenties, loaded to pressures the rest of Europe considered rude, for the Star and Astra pistols. Longer case, more powder, noticeably flatter shooting than the Parabellum it looks almost identical to."
att.Desc_Pros = {
    "Flatter and harder hitting than 9x19",
}
att.Desc_Cons = {
    "Slightly reduced capacity",
    "Sharper recoil",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x23mm Largo"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.2
att.Mult_DamageMin = 1.15
att.Mult_Penetration = 1.2
att.Mult_Range = 1.3
att.Mult_RangeMin = 1.2
att.Mult_MuzzleVelocity = 1.25
att.Mult_Recoil = 1.15
att.Mult_RPM = 0.95
att.Mult_ClipSize = 0.95
att.Mult_ShootPitch = 0.98
att.Mult_ShootVol = 1.1

local fire = {"weapons/arccw_ur/mp5/fire-01.ogg", "weapons/arccw_ur/mp5/fire-02.ogg", "weapons/arccw_ur/mp5/fire-03.ogg", "weapons/arccw_ur/mp5/fire-04.ogg", "weapons/arccw_ur/mp5/fire-05.ogg", "weapons/arccw_ur/mp5/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/mp5/fire-dist-01.ogg", "weapons/arccw_ur/mp5/fire-dist-02.ogg", "weapons/arccw_ur/mp5/fire-dist-03.ogg", "weapons/arccw_ur/mp5/fire-dist-04.ogg", "weapons/arccw_ur/mp5/fire-dist-05.ogg", "weapons/arccw_ur/mp5/fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_cal_9x23")
end
                                  

                                          
do
    local att = {}

att.PrintName = "MP5 .224 Boz Conversion"
att.AbbrevName = ".224 Boz Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/22 .224 Boz Conversion"
end

att.Description = "The .224 Boz round is a specialized high-velocity cartridge created by Civil Defence Supply in the UK. It takes the 10mm Auto case and necks it down to accept a .224 caliber (5.56mm) bullet, combining the large case capacity of the 10mm Auto with the aerodynamic efficiency and high velocity of a smaller-diameter bullet."

att.Icon = Material("entities/att/224boz.png", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Override_Trivia_Calibre = ".224 Boz"

att.Mult_Damage = 1.224
att.Mult_DamageMin = 1.192
att.Mult_Penetration = 1.1375

att.Mult_Recoil = 1.274
att.Mult_VisualRecoilMult = 1.312
att.Mult_RPM = 0.7925
att.Mult_ShootSpeedMult = 0.95
att.Mult_Range = 1.32
att.Override_AccuracyMOA = 3

local path = "weapons/misc/"

local fire22 = {path .. "mp5_224boz_fire.wav"}
local fire22sup = {path .. "mp5_224boz_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.GivesFlags = {"ur_mp5_cal_22lr"}

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"receiver_lower_semi"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_caliber_224boz")
end
                                        

                                               
do
    local att = {}

att.PrintName = "MP5 2.7×9mm Kolibri Conversion"
att.AbbrevName = "2.7×9mm Kolibri Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/22 2.7×9mm Kolibri Conversion"
end

att.Description = "A semi-automatic homebrew model of the MP5 rechambered in the unconventional and minuscule 2.7×9mm Kolibri cartridge.\n\nThe 2mm Kolibri was advertised as a ladies' self-defence round. While probably not effective against a mugger if shot at the chest or limbs, it could potentially inflict some damage if shot at the attacker's face.\n\n\"Ever been stung by a bee? How about a wasp? Or a hornet?\""

att.Icon = Material("entities/att/2mm_kolibri_icon.png", "smooth mips")
att.Desc_Pros = {"Extra headshot damage"
}
att.Desc_Cons = {"Where'd you even find this ammo?!"
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Override_Trivia_Calibre = "2.7×9mm Kolibri"
att.Override_Ammo = "Pistol"

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.20
att.Mult_Penetration = 0

att.Mult_Recoil = 0.28
att.Mult_VisualRecoilMult = 0.31
att.Mult_RPM = 1.19
att.Mult_Penetration = 0
att.Mult_ShootSpeedMult = 1.5

att.Override_PhysBulletMuzzleVelocity = 340
att.Mult_HipDispersion = 0.75

att.Mult_ClipSize = 1.35

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.40
    end
end

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_mp5/"

local fire22 = {path .. "kolimp5_fire.wav"}
local fire22sup = {path .. "kolimp5_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "kolimp5_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "kolimp5_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

att.GivesFlags = {"ur_mp5_cal_22lr"}

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"receiver_lower_semi"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_caliber_2mm_kolibri")
end
                                             

                                         
do
    local att = {}

att.PrintName = "MP5 .45 ACP Conversion"
att.AbbrevName = ".45 ACP Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/45 .45 ACP Conversion"
end

att.Description = "Receiver modified to accept the .45 ACP round. It is more powerful but it doesn't perform as well."

att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Override_Trivia_Calibre = ".45 ACP"

att.Mult_Damage = 1.45
att.Mult_DamageMin = 1.30
att.Mult_Penetration = 1.4

att.Mult_Recoil = 1.34
att.Mult_VisualRecoilMult = 1.18
att.Mult_RPM = 0.825
att.Mult_ShootSpeedMult = 0.95
att.Mult_Range = 1.50
att.Override_AccuracyMOA = 4

local path = "weapons/misc/"

local fire22 = {path .. "mp5_45acp_fire.wav"}
local fire22sup = {path .. "mp5_45acp_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.GivesFlags = {"ur_mp5_cal_10mm"}
att.ActivateElements = {"ur_mp5_mag_waffle"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_caliber_45acp")
end
                                       

                                           
do
    local att = {}

att.PrintName = "MP5 .11 Whatzit Conversion"
att.AbbrevName = ".11 Whatzit Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/22 .11 Whatzit Conversion"
end

att.Description = "The .11 Whatzit is a wildcat cartridge (of sorts). This is mainly a novelty, and it doesn't appear that any gun has actually been made to chamber and fire this \"cartridge\". That is, if it can even be considered a cartridge, depending on personal opinion. It has a primer, because it is a primer, as well as a projectile. But of course, it lacks any powder. However, it should theoretically be possible to chamber and fire this round, since gun barrels appear to be available in as small as .10 caliber. \n\n\"The kind of thing you'd give a veterinarian to euthanize a Guinea pig.\""

att.Icon = Material("entities/att/11mm_whatzit_imp.png", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Override_Trivia_Calibre = ".11 Whatzit"
att.Override_Ammo = "Buckshot"

att.Mult_Damage = ArcCW.UC.CalConv("9mm", "22lr", "max")
att.Mult_DamageMin = ArcCW.UC.CalConv("9mm", "22lr", "min")
att.Mult_Penetration = ArcCW.UC.CalConv("9mm", "22lr", "pen")

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 365

att.Mult_Recoil = 1.21
att.Mult_VisualRecoilMult = 1.21
att.Mult_RPM = 0.82
att.Mult_ShootSpeedMult = 1.4
att.Override_IsShotgun = true
att.Override_Num = 3
att.Mult_Range = 0.7
att.Override_AccuracyMOA = 25
att.Override_AccuracyMOA_Priority = 3

att.Mult_ClipSize = 0.8

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_mp5/"

local fire22 = {path .. "whatzit_fire.wav"}
local fire22sup = {path .. "whatzit_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "kolimp5_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "kolimp5_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

att.GivesFlags = {"ur_mp5_cal_22lr"}

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"receiver_lower_semi"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_caliber_whatzit")
end
                                         

                                        
do
    local att = {}

att.PrintName = "MP5 40-Round Extended Mag"
att.AbbrevName = "40-Round Ext Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5 40-Round Extended Mag"
end

att.SortOrder = 20
att.Icon = Material("entities/att/mp5_mag40.png", "smooth mips")
att.Description = "40-round extended magazine. The extra protruding length is cumbersome, but the magazine maintains high reliability."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ur_mp5_mag"

att.AutoStats = true

att.Mult_SightTime = 1.08
att.Mult_Recoil = 0.9
att.Mult_ReloadTime = 1.10
att.Mult_SpeedMult = 0.9
att.Override_ClipSize = 40
att.Mult_Sway = 1.15

att.ActivateElements = {"ur_mp5_mag_40"}

att.ExcludeFlags = {"ur_mp5_cal_10mm","ur_mp5_cal_40sw"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_mag_40_fixed")
end
                                      

                                       
do
    local att = {}

att.PrintName = "MP5 Carbine Receiver"
att.AbbrevName = "Carbine Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5 Carbine Receiver"
end

att.Description = "Lower receiver with larger pistol grip for maximizing precision and recoil reduction."

att.Icon = Material("", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Mult_Recoil = 0.85
att.Mult_VisualRecoilMult = 0.90
att.Mult_RPM = 0.95
att.Mult_ShootSpeedMult = 0.95
att.Mult_Range = 1.10

att.GivesFlags = {"ur_mp5_cal_22lr"}

att.Override_Firemodes_Priority = 0.5
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"receiver_lower_carbine"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_rec_carbine")
end
                                     

                                    
do
    local att = {}

att.PrintName = "MP5 Sadu ASALT 96 Conversion"
att.AbbrevName = "ASALT 96 Conversion"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/22 Sadu ASALT 96 Conversion"
end

att.Description = "Conversion based on the Romanian ASALT 96 (Romanian: Pistolul-mitralieră Model 1996 ASALT; \"PM Md. 1996 ASALT\" for short) which uses a copy of the Uzi action, but has a conventional layout, polymer lower receiver, grip safety and MP5 style retractable stock. It is produced by Romanian firm Uzina Mecanică Sadu."

att.Icon = Material("", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Mult_Recoil = 1.15
att.Mult_VisualRecoilMult = 0.80
att.Mult_RPM = 0.70
att.Mult_ShootSpeedMult = 1.25
att.Mult_Range = 1.25
att.Override_ClipSize = 32
att.Mult_ReloadTime = 1.05
att.Mult_SpeedMult = 1.175
att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.75)

att.Model = "models/vergi_arccw/anglegrip_lhik.mdl"

att.ActivateElements = {"ur_mp5_kit_sadu"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_sadu"
end

local path = "weapons/misc/"

local fire22 = {path .. "fire_sadu.wav"}
local fire22sup = {path .. "m16_380acp_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_rec_sadu")
end
                                  

                                     
do
    local att = {}

att.PrintName = "MP5 \"Squid-Game\" Special Receiver"
att.AbbrevName = "\"Game Special\" Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PK5/22 \"Squid-Game\" Special Receiver"
end

att.Description = "Black-market receiver that originates from a remote South-Korean island hiding many morbid secrets. The modifications done to this receiver make it excel ridiculously well at hitting long range targets, but fire rate is much slower. Whether you're a pink-hooded guard setting out to kill some losers and control any misbehaviour among a crowd, or simply a player of the deadly games looking to rebel and escape the island you're stranded on, this will likely be the weapon you'll come across. \n\n \"Player 456, have you had fun playing the hero?\" - The Front Man"

att.Icon = Material("entities/att/uc_squid_logo.png", "smooth mips")
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_mp5_caliber"

att.AutoStats = true
att.SortOrder = -1

att.Mult_Recoil = 0.90
att.Mult_VisualRecoilMult = 0.95
att.Mult_RPM = 0.75
att.Mult_ShootSpeedMult = 0.95
att.Mult_Range = 1.55
att.Override_AccuracyMOA = 3
att.Override_AccuracyMOA_Priority = 3

local path = "weapons/misc/"

local fire22 = {path .. "mp5_squid_fire.wav"}
local fire22sup = {path .. "m16_380acp_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ur_mp5_rec_squid")
end
                                   

                                       
do
    local att = {}

att.PrintName = "Brace Stock"

att.Icon = Material("", "smooth mips")
att.Description = "Exceptionally light stock offering more accuracy, as well as increased mobility, but recoil is harder to control."
att.Desc_Neutrals = {
}

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brace Stock"

end

att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Slot = "ur_mp5_stock"
att.SortOrder = 10

att.AutoStats = true

att.Mult_SightedSpeedMult = 1.375
att.Mult_ShootSpeedMult = 1.375
att.Mult_SightTime = 0.75
att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75
att.Mult_RecoilSide = 1.30
att.Mult_Recoil = 1.30
att.Add_BarrelLength = 0.90

att.ActivateElements = {"ur_mp5_stock_brace"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_stock_brace")
end
                                     

                                            
do
    local att = {}

att.PrintName = "MP5A2 Wooden Stock"
att.AbbrevName = "Wooden Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "K7 Wooden Stock"
end

att.Icon = Material("entities/att/acwatt_ur_mp5_stock_solid.png", "smooth mips")
att.Description = "A solid, non-foldable stock made of wood. Its weight improves recoil control but harms handling."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ur_mp5_stock"

att.AutoStats = true
att.SortOrder = 4

att.Mult_Recoil = 0.75
att.Mult_RecoilSide = 0.5
att.Mult_VisualRecoilMult = 0.5
att.Mult_Sway = 0.5

att.Mult_SightTime = 1.25
att.Mult_SightedSpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.9

att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.ActivateElements = {"ur_mp5_stock_wood"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_stock_wood_fixed")
end
                                          

                                   
do
    local att = {}

att.PrintName = "Dong Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "MP5K with romanian dong, what else can i say? Slightly better than the MP5K grip."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "ur_mp5_hg"

att.LHIK = true

att.ModelOffset = Vector(-1.3, 0, -0)
att.Model = "models/weapons/arccw/atts/ur_kurzlhik.mdl"
att.Override_HoldtypeActive = "smg"

att.SortOrder = 2

att.Mult_Sway = .75
att.Mult_SightTime = .95
att.Mult_Recoil = .80

att.ActivateElements = {"ur_mp5_barrel_dong"}
att.RequireFlags = {"mp5_kurz"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_ub_dong")
end
                                 

                                         
do
    local att = {}

att.PrintName = "Heatshield Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "Heavy handguard with a slotted metal design that greatly absorbs recoil. Features an underbarrel picatinny rail."
att.AutoStats = true

att.Slot = "ur_mp5_hg"

att.SortOrder = 999

att.Mult_Sway = 0.75
att.Mult_SightTime = 1.20
att.Mult_Recoil = 0.60

att.ActivateElements = {"ur_mp5_ub_heatshield"}
att.ExcludeFlags = {"barrel_sd","mp5_kurz"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_ub_heatshield")
end
                                       

                                           
do
    local att = {}

att.PrintName = "UNI-K Handguard"

att.Icon = Material("entities/att/arccw_unik_grip.png", "smooth mips")
att.Description = "The iconic handguard for the Kurz machine pistol variant, featuring a stubby foregrip and handstop that make the shortened SMG much more comfortable and controllable. This model allows for the use of any upper receiver."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "ur_mp5_hg"

att.LHIK = true

att.ModelOffset = Vector(-1.3, 0, -0)
att.Model = "models/weapons/arccw/atts/ur_kurzlhik.mdl"
att.Override_HoldtypeActive = "smg"

att.SortOrder = 2

att.Mult_Sway = .75
att.Mult_SightTime = .95
att.Mult_Recoil = .85

att.ActivateElements = {"ur_mp5_ub_kurzgrip"}
att.GivesFlags = {"mp5_badhg"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_ub_kurzgrip_alt")
end
                                         

                                  
do
    local att = {}

att.PrintName = "Prototype Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "MP5K handguard with a totally not p90 grip."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "ur_mp5_hg"

att.LHIK = true

att.ModelOffset = Vector(-1.3, 0, -0)
att.Model = "models/weapons/arccw/atts/ur_kurzlhik.mdl"
att.Override_HoldtypeActive = "smg"

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,13)
end

att.SortOrder = 2

att.Mult_Sway = .75
att.Mult_SightTime = .975
att.Mult_Recoil = .90

att.ActivateElements = {"ur_mp5_barrel_p90"}
att.RequireFlags = {"mp5_kurz"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_ub_p90")
end
                                

                                   
do
    local att = {}

att.PrintName = "Wood Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "Standard handguard design with a wooden furniture. Slightly heavier."
att.AutoStats = true

att.Slot = "ur_mp5_hg"

att.SortOrder = 999

att.Mult_Sway = 0.90
att.Mult_SightTime = 1.10
att.Mult_Recoil = 0.85

att.ActivateElements = {"ur_mp5_ub_wood"}
att.ExcludeFlags = {"barrel_sd","mp5_kurz"}

    ArcCW.LoadAttachmentType(att, "ur_mp5_ub_wood")
end
                                 

                                       
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 24\" Hunter Barrel") or "Paatopveer-20 24\" Hunter Barrel"
att.AbbrevName = "24\" Hunter Barrel"
att.Description = "Longer barrel that was designed for hunting and range shooting."
att.Icon = Material("entities/att/acwatt_ud_870_barrel.png", "smooth mips")
att.Slot = "uc_neo_barrel"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true

att.Mult_Recoil = 0.95
att.Mult_SightedSpeedMult = 1.04
att.Mult_DrawTime = 1.04
att.Mult_HolsterTime = 1.02
att.Mult_RangeMin = 1.11
att.Mult_Range = 1.06
att.Add_BarrelLength = 1.2

att.ActivateElements = {"muz_ex"}

    ArcCW.LoadAttachmentType(att, "ur_neo_long_barrel")
end
                                     

                                           
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 30.5\" Marksman Barrel") or "Paatopveer-20 30.5\" Marksman Barrel"
att.AbbrevName = "30.5\" Marksman Barrel"
att.Description = "Extremely long barrel that is ineffective if used with scattershot type cartridges. Muzzle devices cannot be equipped on this barrel."
att.Icon = Material("entities/att/acwatt_ud_870_barrel.png", "smooth mips")
att.Slot = "uc_neo_barrel"
att.Desc_Cons = {

}

att.AutoStats = true

att.Mult_Recoil = 0.80
att.Mult_SightedSpeedMult = 0.85
att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15
att.Mult_RangeMin = 1.25
att.Mult_Range = 1.305
att.Add_BarrelLength = 1.85

att.ActivateElements = {"barrel_marksman"}

    ArcCW.LoadAttachmentType(att, "ur_neo_marksman_barrel")
end
                                         

                                     
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 Detached Forend") or "Paatopveer-20 Detached Forend"
att.AbbrevName = "Detached Forend"
att.Description = "Removing the forend trims the fat of this weapon very nicely and allows you to fire it one-handed and semi-auto (somehow)."
att.Icon = Material("entities/att/arccw_uc_extra_none.png", "smooth mips")
att.Slot = "uc_neo_forend"
att.Desc_Cons = {
    "What the fuck"
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true

att.Mult_Recoil = 1.14
att.Mult_SightedSpeedMult = 1.14
att.Mult_DrawTime = 0.86
att.Mult_HolsterTime = 0.82
att.Mult_CycleTime = 0.00000000000000001
att.Mult_ReloadTime = 0.87
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(1, 5, .75)
att.Override_ActiveAng = Angle(-2, -2, 0)

att.ActivateElements = {"no_pump"}

    ArcCW.LoadAttachmentType(att, "ur_neo_no_forend")
end
                                   

                                     
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 Sawn-Off Carry Handle") or "Paatopveer-20 Sawn-Off Carry Handle"
att.AbbrevName = "Sawn-Off Carry Handle"
att.Description = "Cutting off the ugly and bulky carry handle of this thing allows you to benefit from tremendously lighter weight, but the lack of said weight makes you a bit more influenced by the recoil."
att.Icon = Material("entities/att/arccw_uc_extra_none.png", "smooth mips")
att.Slot = "irons_neo"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true
att.SortOrder = 9999
att.Mult_Recoil = 1.26
att.Mult_SightedSpeedMult = 1.26
att.Mult_DrawTime = 0.76
att.Mult_HolsterTime = 0.72

att.ActivateElements = {"sawn_off_top"}

    ArcCW.LoadAttachmentType(att, "ur_neo_no_handle")
end
                                   

                                      
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 RIS Forend") or "Paatopveer-20 RIS Forend"
att.AbbrevName = "RIS Forend"
att.Description = "Tactical forend equipped with rails for extra customization. Due to this forend using far less materials, cycling the pump is much faster."
att.Icon = Material("entities/att/uc_neo_rail_forend.png", "smooth mips")
att.Slot = "uc_neo_forend"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true

att.Mult_Recoil = 1.03
att.Mult_SightedSpeedMult = 1.06
att.Mult_DrawTime = 0.96
att.Mult_HolsterTime = 0.92
att.Mult_CycleTime = 0.90
att.Mult_ReloadTime = 0.97

att.ActivateElements = {"rail_bot"}

    ArcCW.LoadAttachmentType(att, "ur_neo_ris_forend")
end
                                    

                                          
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 18\" Sawn-Off Barrel") or "Paatopveer-20 18\" Sawn-Off Barrel"
att.AbbrevName = "18\" Sawn-Off Barrel"
att.Description = "Illegally sawn-off barrel that reduces the weapon weight but does not make the weapon any more concealable due to this thing already being bulky as it is."
att.Icon = Material("entities/att/neo_sawn_off.png", "smooth mips")
att.Slot = "uc_neo_barrel"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true

att.Mult_Recoil = 1.22
att.Mult_SightedSpeedMult = 0.92
att.Mult_DrawTime = 0.88
att.Mult_HolsterTime = 0.84
att.Mult_RangeMin = 0.90
att.Mult_Range = 0.80
att.Add_BarrelLength = 0.6

att.ActivateElements = {"sawn_off_barrel"}

    ArcCW.LoadAttachmentType(att, "ur_neo_sawnoff_barrel")
end
                                        

                                        
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 Tactical Rail") or "Paatopveer-20 Tactical Rail"
att.AbbrevName = "Tactical Rail"
att.Description = "Top-mounted picattiny rail, nothing much to say about it."
att.Icon = Material("entities/att/acwatt__no_scope.png", "smooth mips")
att.Slot = "irons_neo"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true
att.SortOrder = 9999

att.ActivateElements = {"optic_rail"}

    ArcCW.LoadAttachmentType(att, "ur_neo_tactical_top")
end
                                      

                                       
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "NeoStead 2000 Wood Forend") or "Paatopveer-20 Wood Forend"
att.AbbrevName = "Wood Forend"
att.Description = "Heavy forend made of wood. Recoil is reduced by the weight, but cycling is slower."
att.Icon = Material("", "smooth mips")
att.Slot = "uc_neo_forend"
att.Desc_Cons = {

}

att.AutoStats = true

att.Mult_Recoil = 0.85
att.Mult_SightedSpeedMult = 0.85
att.Mult_DrawTime = 1.20
att.Mult_HolsterTime = 1.20
att.Mult_CycleTime = 1.20
att.Mult_ReloadTime = 1.05

att.ActivateElements = {"no_pump","pump_wood"}

    ArcCW.LoadAttachmentType(att, "ur_neo_wood_forend")
end
                                     

                                            
do
    local att = {}

att.PrintName = "14\" SPAS-12 Breacher Kit"
att.AbbrevName = "14\" Breacher Kit"
att.Description = "Crackhead bodykit that is the result of someone attempting to make the shotgun more light and compact. The barrel, pump, grip and buttcap are cut short and the heatshield is nowhere to be seen. Rear sights are also elevated to fit your needs, although you may not need much aim with this setup."
att.Desc_Cons = {
    "uc.nomuzzle",
}
att.Icon = Material("", "smooth mips")

att.Slot = "ur_spas12_barrel"

att.SortOrder = 14

att.AutoStats = true
att.Add_BarrelLength = -4

att.Mult_RecoilSide = 1.15
att.Mult_Recoil = 1.50
att.Mult_Sway = 1.50

att.Mult_AccuracyMOA = 1.15
att.Mult_RangeMin = 0.75
att.Mult_CycleTime = 0.75
att.Mult_ReloadTime = 0.75
att.Override_ClipSize = 4
att.Mult_HipDispersion = 1.35
att.Mult_SpeedMult = 1.25
att.Mult_ShootSpeedMult = 1.25

att.ActivateElements = {"ur_spas12_barrel_breacher"}
att.GivesFlags = {"nomuzzle"}

    ArcCW.LoadAttachmentType(att, "ur_spas_barrel_breacher")
end
                                          

                                    
do
    local att = {}

att.PrintName = "Martello 12/70 25 Shell Tube"
att.AbbrevName = "25 Shell Drum Tube"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SPAS-12 25 Shell Tube"
end

att.Icon = Material("", "smooth mips")
att.Description = "Extended magazine tube with a drum that holds 25 rounds of 12 gauge ammunition. It is very unwieldy, but allows you to carry more ammo."
att.Icon = Material("", "smooth mips")
att.Slot = "ur_spas12_tube"

att.AutoStats = true

att.Override_ClipSize = 25
att.Mult_SpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.85
att.Mult_Sway = 0.75
att.Mult_SightedSpeedMult = 0.85
att.Mult_SightTime = 1.15
att.Mult_DrawTime = 1.15
att.Mult_ReloadTime = 1.05

att.ActivateElements = {"ur_spas12_tube_25"}

    ArcCW.LoadAttachmentType(att, "ur_spas_tube_25")
end
                                  

                                                 
do
    local att = {}

att.PrintName = "21.5\" SPAS-12 Blunderbuss Barrel"
att.AbbrevName = "21.5\" Blunderbuss Barrel"
att.Description = "Unorthodox barrel assembly and wooden pump that turns your very modern and menacing shotgun into an ancient, albeit stylish smoothbore weapon that is extremely inaccurate, yet much deadlier. Due to the absence of the magazine tube and for the purpose of this kind of barrel, only one round can be loaded and fired at a time."
att.Desc_Cons = {
    "uc.nomuzzle",
}
att.Icon = Material("", "smooth mips")

att.Slot = "ur_spas12_barrel"

att.SortOrder = 21.5

att.AutoStats = true

att.Mult_RecoilSide = 1.50
att.Mult_Recoil = 2.15
att.Mult_Sway = 1.2

att.Mult_AccuracyMOA = 5
att.Mult_RangeMin = 0.3
att.Mult_CycleTime = 0.8
att.Mult_ReloadTime = 1.25
att.Override_ClipSize = 1
att.Mult_HipDispersion = 2
att.Mult_Sway = 1.5
att.Mult_SpeedMult = 0.80
att.Mult_ShootSpeedMult = 0.10
att.Mult_Damage = 3.5
att.Mult_DamageMin = 1.5
att.Mult_PhysBulletMuzzleVelocity = 3.5
att.Mult_Penetration = 3.5
att.Mult_ShootPitch = 0.85

att.Hook_PostFireBullets = function(wep)
    UC_Extras.RecoilJump(wep, 700, 160)
end

att.ActivateElements = {"ur_spas12_barrel_blunderbuss", "ur_spas12_pump_wood"}
att.GivesFlags = {"nomuzzle"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_barrel_blunderbuss")
end
                                               

                                                 
do
    local att = {}

att.PrintName = "22.5\" SPAS-12 Competition Kit"
att.AbbrevName = "22.5\" Competition Kit"
att.Description = "Aftermarket sporting kit that replaces the stock forend, handguard, and barrel. The removal of the semi-automatic gas system and integrated compensator greatly improves weapon overall performance."
att.Desc_Cons = {
    "uc.nomuzzle",
    "ur.spas12.pump"
}
att.Icon = Material("entities/att/ur_spas/barrel_comp.png", "smooth mips")

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.pump",
        Override_ManualAction = true,
    },

}
att.Override_Firemodes_Priority = 1

att.Slot = "ur_spas12_barrel"

att.SortOrder = 22.5

att.AutoStats = true
att.Add_BarrelLength = 1

att.Mult_RecoilSide = 0.85
att.Mult_Recoil = 0.75
att.Mult_Sway = 1.2

att.Mult_AccuracyMOA = 0.85
att.Mult_RangeMin = 1.5
att.Mult_CycleTime = 0.9

att.ActivateElements = {"ur_spas12_barrel_comp","ur_spas12_pump1_comp","ur_spas12_pump2_comp"}
att.GivesFlags = {"nomuzzle"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_barrel_sport_fixed")
end
                                               

                                         
do
    local att = {}

att.PrintName = "Franchi SPAS-12 .357 Magnum Conversion"
att.AbbrevName = ".357 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Martello 12/70 .357 Magnum Conversion"
end

att.SortOrder = 71
att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "A revolver round out of a two foot barrel, which is where it has always done its best work. Cheap, quick, and the gas system barely notices it going off."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".357 Magnum"
att.Override_Trivia_Class = "Carbine"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1.05
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.GivesFlags = {"ur_spas12_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.5
att.Mult_Range = 1.25
att.Mult_Penetration = 2.2
att.Mult_AccuracyMOA = 0.5
att.Mult_HipDispersion = 0.68
att.Mult_Recoil = 0.42
att.Mult_VisualRecoilMult = 0.5
att.Mult_RPM = 1.4
att.Mult_ClipSize = 1.5
att.Mult_ReloadTime = 0.85
att.Mult_ShootPitch = 1.02
att.Mult_ShootVol = 1.2

local fire = {"weapons/arccw_ud/glock/fire_357.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_357.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-pistol-heavy-01.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-02.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-03.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-04.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-05.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_spas12_cal_357mag")
end
                                       

                                             
do
    local att = {}

att.PrintName = "Martello 12/70 .416 Barrett Conversion"
att.AbbrevName = ".416 Barrett"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips")
att.Description = "Built to sidestep a proposed ban on civilian .50 BMG by necking the same case down to .416, and which turned out to shoot flatter than the round it was imitating. Barrett got a better cartridge out of a piece of legislation.\n\nThe fuze arms at 25 metres. Inside that you do 30 percent damage. Past it you do 70 percent more than normal, with excellent penetration and reach. A long range conversion that punishes you for using it in a doorway."
att.Desc_Pros = {
    "Excellent past 25 metres",
    "Strong penetration",
}
att.Desc_Cons = {
    "Nearly useless up close",
    "Small magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".416 Barrett"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"ur_spas12_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.3
att.Mult_DamageMin = 1.45
att.Mult_Penetration = 2.2
att.Mult_Range = 2.4
att.Mult_RangeMin = 2.2
att.Mult_MuzzleVelocity = 1.5
att.Mult_AccuracyMOA = 0.5
att.Mult_Recoil = 1.6
att.Mult_RPM = 0.65
att.Mult_ClipSize = 0.5
att.Mult_HipDispersion = 2.0

local ARM = 25

att.Hook_BulletHit = function(wep, hit)
    if hit.range < ARM then
        hit.damage = hit.damage * 0.3
    else
        hit.damage = hit.damage * 1.7
    end

    return hit
end
att.Mult_ShootPitch = 0.8
att.Mult_ShootVol = 1.45

local fire = {"weapons/arccw_ud/m16/fire-50-01.ogg", "weapons/arccw_ud/m16/fire-50-02.ogg", "weapons/arccw_ud/m16/fire-50-03.ogg", "weapons/arccw_ud/m16/fire-50-04.ogg", "weapons/arccw_ud/m16/fire-50-05.ogg", "weapons/arccw_ud/m16/fire-50-06.ogg"}
local firesup = {"weapons/arccw_ud/m16/fire-sup-01.ogg", "weapons/arccw_ud/m16/fire-sup-02.ogg", "weapons/arccw_ud/m16/fire-sup-03.ogg", "weapons/arccw_ud/m16/fire-sup-04.ogg", "weapons/arccw_ud/m16/fire-sup-05.ogg", "weapons/arccw_ud/m16/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ud/m16/fire-50-dist-01.ogg", "weapons/arccw_ud/m16/fire-50-dist-02.ogg", "weapons/arccw_ud/m16/fire-50-dist-03.ogg", "weapons/arccw_ud/m16/fire-50-dist-04.ogg", "weapons/arccw_ud/m16/fire-50-dist-05.ogg", "weapons/arccw_ud/m16/fire-50-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_spas12_cal_416barrett")
end
                                           

                                          
do
    local att = {}

att.PrintName = "Franchi SPAS-12 7.62x51mm Conversion"
att.AbbrevName = "7.62x51mm NATO"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Martello 12/70 7.62x51mm Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "Somebody looked at a gas-operated shotgun with a folding stock and decided what it really wanted was a full power rifle cartridge. The gas system copes. The shooter is on their own."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = "7.62x51mm NATO"
att.Override_Trivia_Class = "Battle Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ur_spas12_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 3.2
att.Mult_DamageMin = 3.6
att.Mult_Range = 2.4
att.Mult_Penetration = 8
att.Mult_AccuracyMOA = 0.35
att.Mult_HipDispersion = 1.1
att.Mult_Recoil = 1.15
att.Mult_VisualRecoilMult = 1.05
att.Mult_RPM = 1.05
att.Mult_ClipSize = 1.2
att.Mult_ReloadTime = 0.95
att.Mult_ShootPitch = 0.92
att.Mult_ShootVol = 1.25

local fire = {"weapons/arccw_ur/ak/fire_308_1.ogg", "weapons/arccw_ur/ak/fire_308_2.ogg", "weapons/arccw_ur/ak/fire_308_3.ogg", "weapons/arccw_ur/ak/fire_308_4.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_spas12_cal_762nato")
end
                                        

                                       
do
    local att = {}

att.PrintName = "Martello 12/70 Cryogenic Load"
att.AbbrevName = "Cryogenic 12 Gauge"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "Shells packed with a liquefied gas charge instead of powder, which throws the shot column out on a burst of expanding vapour at temperatures that frost the barrel. The idea comes back every few decades and is abandoned every few decades.\n\nTwo effects. Whoever you hit is slowed to 40 percent speed for four seconds, and every shot cools the gun by 4 heat instead of heating it, so this barrel will not overheat no matter how fast you empty it. Damage is well below normal."
att.Desc_Pros = {
    "Slows targets badly",
    "Cools the gun as you fire",
}
att.Desc_Cons = {
    "Noticeably weak",
    "Short ranged",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "12 Gauge Cryogenic"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1
att.Hook_PostFireBullets = function(wep)
    if !SERVER then return end
    if !IsValid(wep) then return end

    wep:SetHeat(math.max(0, wep:GetHeat() - 4))
end

att.Mult_Damage = 0.65
att.Mult_DamageMin = 0.6
att.Mult_Range = 0.7
att.Mult_MuzzleVelocity = 0.75
att.Mult_Recoil = 0.7
att.Mult_RPM = 1.1
att.Mult_ShootPitch = 1.25
att.Mult_HeatCapacity = 1.5

local SLOW = 0.4
local DUR  = 4

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end

    if ent:IsPlayer() then
        ent:SetLaggedMovementValue(SLOW)

        local id = "UC_Chill_" .. ent:EntIndex()
        timer.Create(id, DUR, 1, function()
            if IsValid(ent) and ent:IsPlayer() then
                ent:SetLaggedMovementValue(1)
            end
        end)
    elseif ent:IsNPC() then
        ent:SetSchedule(SCHED_FLINCH_PHYSICS)
    end

    return hit
end
att.Mult_ShootVol = 0.8

local fire = {"weapons/arccw_ur/spas12/fire-01.ogg", "weapons/arccw_ur/spas12/fire-02.ogg", "weapons/arccw_ur/spas12/fire-03.ogg", "weapons/arccw_ur/spas12/fire-04.ogg", "weapons/arccw_ur/spas12/fire-05.ogg", "weapons/arccw_ur/spas12/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/spas12/fire_supp.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-shotgun-01.ogg", "arccw_uc/common/fire-dist-int-shotgun-02.ogg", "arccw_uc/common/fire-dist-int-shotgun-03.ogg", "arccw_uc/common/fire-dist-int-shotgun-04.ogg", "arccw_uc/common/fire-dist-int-shotgun-05.ogg", "arccw_uc/common/fire-dist-int-shotgun-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_spas12_cal_cryo")
end
                                     

                                           
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "SPAS-12 Classic Rail") or "Martello 12/70 Classic Rail"
att.AbbrevName = "Classic Rail"
att.Description = "Just a vintage rail, not much to say about it."
att.Icon = Material("entities/att/acwatt__no_scope.png", "smooth mips")
att.Slot = "irons_spas"
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true
att.SortOrder = 9999
att.ActivateElements = {"rail_classic"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_classic_rail")
end
                                         

                                                
do
    local att = {}

att.PrintName = "Folded Stock"
att.Icon = Material("entities/att/ur_spas/stock_comp_fold.png", "smooth mips")
att.Description = [[Folding the stock makes the weapon significantly shorter, allowing for easier use around corners and making it easier on the move at the cost of less stability.

Contrary to some depictions, the stock obstructs iron sights when folded.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
    "ur.spas12.folded",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_stock"
att.AttachSound = "arccw_uc/common/stockslide.ogg"

att.AutoStats = true
att.Free = true
att.IgnorePickX = true

att.HideIfBlocked = true

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(3,5)
end

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.5

att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1
att.Mult_SightTime = 0.5

att.Mult_Sway = 2
att.Add_BarrelLength = -12

att.Override_IronSightStruct = {
    Pos = Vector(-1.1, -2, -1.1),
     Ang = Angle(3, 1.5, 0),
     Magnification = 1.075,
     SwitchToSound = "",
     CrosshairInSights = true,
}

att.Override_HoldtypeActive = "shotgun"
att.Override_HoldtypeSights = "ar2"

att.A_Hook_Add_SightsDispersion = function(wep, data)
    if data and !wep.Attachments[1].Installed then
        data.add = data.add + 75
    end
end

att.RequireFlags = {"ur_spas12_barrel_comp"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_comp_folded")
end
                                              

                                         
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "SPAS-12 Fixed Polymer Stock") or "Martello 12/70 Fixed Polymer Stock"
att.AbbrevName = "Fixed Stock"
att.Icon = Material("entities/att/acwatt_ud_m1014_stock_in.png", "smooth mips")
att.Description = "Solid, non-adjustable polymer stock designed specifically for the civilian market. Provides a better brace at the cost of combat mobility."
att.Icon = Material("entities/att/ur_spas/stock_full.png", "smooth mips")
att.Slot = "ur_spas12_stock"

att.AutoStats = true

att.HideIfBlocked = true

att.Mult_Recoil = .8
att.Mult_Sway = .8

att.Mult_SightedSpeedMult = .85
att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.ExcludeFlags = {"ur_spas12_barrel_comp"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_full")
end
                                       

                                         
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "SPAS-12 Hook Stock") or "Martello 12/70 Hook Stock"
att.AbbrevName = "Hook Stock"
att.Description = "Extended stock with it's exclusive butt hook that can be pushed in and turned 90 degrees to the left or right, to fit under the user's forearm. This is to enable the shotgun to be fired with one hand; e.g. while abseiling/rappelling, or from a vehicle window while driving. The hook can be released from the buttplate completely by turning 180 degrees."
att.Icon = Material("entities/att/ur_spas/stock_hook.png", "smooth mips")
att.Slot = "ur_spas12_stock"
att.Desc_Cons = {
    "Can't use pump-action or ironsights"
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true

att.Mult_Recoil = 1.32
att.Mult_Sway = .8

att.Mult_SightedSpeedMult = 1.04
att.Mult_DrawTime = 1.07
att.Mult_HolsterTime = 1.04
att.AutoStats = true
att.LHIK = true
att.LHIKHide = true
att.Mult_RecoilSide = 2
att.Mult_MoveDispersion = 1.5
att.Mult_HipDispersion = 0.5
att.Mult_PrecisionMOA = 0.8
att.Override_HoldtypeActive = "pistol"
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Hook_ShouldNotSight = function(wep)
    return true
end

att.HideIfBlocked = true
att.ExcludeFlags = {"ur_spas12_barrel_comp", "ux_spas_vintage_comp"}

att.AttachSound = "weapons/misc/hook_stock_equip.ogg"
att.DetachSound = "weapons/misc/hook_stock_unequip.ogg"
att.Override_ActivePos = Vector(0.5, -0.927, 1.417)
att.Override_ActiveAng = Angle(0, 0, -36.52)

att.Override_ShootWhileSprint = true

    att.ActivateElements = {"ur_spas12_stock_hook"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_hook")
end
                                       

                                       
do
    local att = {}

att.PrintName = "Folded Stock"
att.Icon = Material("entities/att/ur_spas/stock_fold.png", "smooth mips")
att.Description = [[Folding the stock makes the weapon significantly shorter, allowing for easier use around corners and making it easier on the move at the cost of less stability.

Contrary to some depictions, the stock obstructs iron sights when folded.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
    "ur.spas12.folded",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_stock"
att.AttachSound = "arccw_uc/common/stockslide.ogg"

att.AutoStats = true
att.Free = true
att.IgnorePickX = true

att.HideIfBlocked = true

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.5

att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1
att.Mult_SightTime = 0.5

att.Mult_Sway = 2
att.Add_BarrelLength = -12

att.Override_IronSightStruct = {
    Pos = Vector(-1.1, -2, -1.1),
     Ang = Angle(3, 1.5, 0),
     Magnification = 1.075,
     SwitchToSound = "",
     CrosshairInSights = true,
}

att.Override_HoldtypeActive = "shotgun"
att.Override_HoldtypeSights = "ar2"

att.A_Hook_Add_SightsDispersion = function(wep, data)
    if data and !wep.Attachments[1].Installed then
        data.add = data.add + 75
    end
end

att.ExcludeFlags = {"ur_spas12_barrel_comp", "ux_spas_vintage_comp"}

att.GivesFlags = {"spas12_foldstock"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_in")
end
                                     

                                         
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = Material("entities/att/ur_spas/grip_std.png", "smooth mips")
att.Description = "A real theoretical physicist won't need this."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_spas12_stock"

att.AutoStats = true
att.Free = true
att.SortOrder = -1

att.HideIfBlocked = true

att.Mult_SpeedMult = 1.05

att.Mult_SightTime = 0.5
att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

att.Mult_Recoil = 1.4
att.Mult_RecoilSide = 2

att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.15

att.Add_BarrelLength = -12
att.Mult_Sway = 3

att.ExcludeFlags = {"ur_spas12_barrel_comp"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_none")
end
                                       

                                           
do
    local att = {}

att.PrintName = "Waffle Stock"
att.AbbrevName = "Waffle Stock"
att.Slot = "ur_spas12_stock"
att.Icon = Material("entities/att/acwatt_ud_m16_stock_waffle.png", "smooth mips")
att.Description = "Carbine stock for the SPAS-12."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.HideIfBlocked = true
att.ExcludeFlags = {"ur_spas12_barrel_comp"}
att.SortOrder = 6

att.Mult_Sway = 1.25
att.Mult_SightedSpeedMult = 1.1

att.ActivateElements = {"ur_spas12_buffer", "ur_spas12_stock_waffle","ur_spas12_stock_none"}

    ArcCW.LoadAttachmentType(att, "ur_spas12_stock_waffle")
end
                                         

 
do
    local att = {}

att.PrintName = "Neal Protocol"
att.AbbrevName = "Neal Protocol"
att.ShortName = "uc_ammo_sg_neal_protocol"
att.SortOrder = 3
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[A Vietnam-era ambush loading technique: place a slug directly in the chamber, then fill the magazine tube with buckshot. The first shot is reserved for a precise hit on the enemy squad leader; the buckshot behind it is for the confusion that follows.

The first shot after loading is a full-power, accurate slug. Every subsequent shell is the weapon's normal buckshot.]]
att.Desc_Pros = {
    "First shot is an accurate, full-power slug",
    "Following shots retain normal buckshot performance",
}
att.Desc_Cons = {
    "Only one slug is prepared at a time",
    "Slug has heavier recoil",
}
att.Desc_Neutrals = {
    "Loading ammunition prepares the slug again",
}

 
att.Slot = {"ud_ammo_shotgun", "uc_ammo", "ammo_shotgun", "go_ammo"}
att.AutoStats = true

local function SlugPending(wep)
    if wep.UC_NealSlugPending == nil then
        wep.UC_NealSlugPending = wep:Clip1() > 0
        wep.UC_NealKnownClip = wep:Clip1()
    end

    return wep.UC_NealSlugPending and wep:Clip1() > 0
end

 
 
att.O_Hook_Override_Num = function(wep, data)
    if not SlugPending(wep) then return end

    data.current = 1
    return data
end

att.O_Hook_Override_DamageType = function(wep, data)
    if not SlugPending(wep) then return end

    data.current = DMG_BULLET
    return data
end

att.O_Hook_Override_HullSize = function(wep, data)
    if not SlugPending(wep) then return end

    data.current = 0
    return data
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    if not SlugPending(wep) then return end

    data.mult = data.mult * 0.18
    return data
end

att.M_Hook_Mult_HipDispersion = function(wep, data)
    if not SlugPending(wep) then return end

    data.mult = data.mult * 0.75
    return data
end

att.M_Hook_Mult_Range = function(wep, data)
    if not SlugPending(wep) then return end

    data.mult = data.mult * 2.5
    return data
end

att.M_Hook_Mult_RangeMin = function(wep, data)
    if not SlugPending(wep) then return end

    data.mult = data.mult * 2
    return data
end

att.M_Hook_Mult_Recoil = function(wep, data)
    if not SlugPending(wep) then return end

    data.mult = data.mult * 1.25
    return data
end

att.A_Hook_Add_Penetration = function(wep, data)
    if not SlugPending(wep) then return end

    data.add = data.add + 10
    return data
end

 
 
att.Hook_Think = function(wep)
    local clip = wep:Clip1()

    if wep.UC_NealKnownClip == nil then
        wep.UC_NealKnownClip = clip
        wep.UC_NealSlugPending = clip > 0
        return
    end

    if clip > wep.UC_NealKnownClip then
        wep.UC_NealSlugPending = true
    end

    wep.UC_NealKnownClip = clip
end

att.Hook_PostReload = function(wep)
     
     
    if wep:Clip1() > 0 then
        wep.UC_NealSlugPending = true
    end
end

att.Hook_PreFireBullets = function(wep)
     
     
    wep.UC_NealFiringSlug = SlugPending(wep)
end

att.Hook_PostFireBullets = function(wep)
    local firedSlug = wep.UC_NealFiringSlug

     
     
    if firedSlug and ArcCW.PhysBullets then
        local now = CurTime()

        for i = #ArcCW.PhysBullets, 1, -1 do
            local bullet = ArcCW.PhysBullets[i]
            if bullet.Weapon == wep and now - (bullet.StartTime or 0) <= 0.1 then
                bullet.UC_NealSlug = true
            elseif (bullet.StartTime or 0) < now - 0.1 then
                break
            end
        end
    end

    wep.UC_NealSlugPending = false
    wep.UC_NealKnownClip = wep:Clip1()
    wep.UC_NealFiringSlug = nil
end

att.Hook_PhysBulletHit = function(wep, data)
    if SERVER and (data.bullet.UC_NealSlug or wep.UC_NealFiringSlug) then
        data.bullet.UC_NealSlug = true
        wep.UC_NealResolvingBullet = data.bullet
    end
end

att.Hook_BulletHit = function(wep, hit)
    local bullet = wep.UC_NealResolvingBullet
    if not bullet then return hit end

    local range = math.max(bullet.Range or 1, 0.001)
    local delta = math.Clamp((bullet.Travelled or 0) / (range / ArcCW.HUToM), 0, 1)

    hit.damage = Lerp(delta, bullet.DamageMax, bullet.DamageMin)
    hit.dmgtype = bullet.DamageType or DMG_BULLET
    hit.penleft = bullet.Penleft or bullet.Penetration or hit.penleft
    return hit
end

att.Hook_PostBulletHit = function(wep)
    local source = wep.UC_NealResolvingBullet
    if not source then return end

     
    if ArcCW.PhysBullets then
        for i = #ArcCW.PhysBullets, 1, -1 do
            local bullet = ArcCW.PhysBullets[i]
            if bullet ~= source and bullet.Weapon == wep and bullet.StartTime == source.StartTime then
                bullet.UC_NealSlug = true
            end
        end
    end

    wep.UC_NealResolvingBullet = nil
end

att.Override_UC_ShellColor = Color(0.7 * 255, 0.15 * 255, 0.1 * 255)

att.Hook_Compatible = function(wep)
    if not wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_neal_protocol")
end
 
