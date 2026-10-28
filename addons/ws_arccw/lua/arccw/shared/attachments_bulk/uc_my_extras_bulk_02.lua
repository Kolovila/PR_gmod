                                                                                               
                                                                             

                                       
do
    local att = {}

att.PrintName = "Brace Stock"

att.Icon = Material("entities/att/acwatt_uc_stock_pistol.png", "smooth mips")
att.Description = "Exceptionally light stock that is primarily used with pistols, but in this case it is nicely fitted at the back of your rifle. It is longer than the standard stock, offering more accuracy, as well as increased mobility, but recoil is harder to control."
att.Desc_Neutrals = {
}

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brace Stock"

end

att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Slot = "ud_m16_stock"
att.SortOrder = 10

att.AutoStats = true

att.Mult_SightedSpeedMult = 1.375
att.Mult_ShootSpeedMult = 1.375
att.Mult_SightTime = 0.80
att.Mult_DrawTime = 0.80
att.Mult_HolsterTime = 0.80
att.Mult_RecoilSide = 1.20
att.Mult_Recoil = 1.20
att.Add_BarrelLength = 1.75

att.ActivateElements = {"stock_m16_brace", "stock_none"}

    ArcCW.LoadAttachmentType(att, "ud_m16_stock_brace")
end
                                     

                                      
do
    local att = {}

att.PrintName = "No Stock"

att.Icon = Material("entities/att/arccw_uc_extra_none.png", "smooth mips")
att.Description = "Fully stockless, this shouldn't work but it somehow does."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "No Stock"

end

att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ud_m16_stock"
att.SortOrder = 10

att.AutoStats = true

att.Mult_SightedSpeedMult = 1.5
att.Mult_ShootSpeedMult = 1.5
att.Mult_RecoilSide = 2.5
att.Mult_Recoil = 2.0
att.Add_BarrelLength = -5

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "ud_m16_stock_none")
end
                                    

                                       
do
    local att = {}

att.PrintName = "AMSGL Long Tube"
att.AbbrevName = "Long Tube"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M79 Long Tube"
end

att.Icon = Material("", "smooth mips")
att.Description = "Extended barrel that increases hit probability across greater distances."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.altnofs"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m79_barrel"

att.LHIK = true

att.AutoStats = true

att.Mult_MuzzleVelocity = 2.15
att.Mult_Recoil = 0.80
att.Mult_AccuracyMOA = 0.70

att.Mult_MoveDispersion = 0.75
att.Mult_SightTime = 1.10
att.Mult_ReloadTime = 1.10

att.Mult_SpeedMult = 0.90
att.Mult_SightedSpeedMult = 0.90

att.Mult_Sway = 1.10

att.ActivateElements = {"m79_long"}

    ArcCW.LoadAttachmentType(att, "ud_m79_barrel_long")
end
                                     

                                        
do
    local att = {}

att.PrintName = "AMSGL Short Tube"
att.AbbrevName = "Short Tube"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M79 Short Tube"
end

att.Icon = Material("entities/att/acwatt_ud_m79_barrel_short.png", "smooth mips")
att.Description = "Nicknamed the 'Pirate Gun' due to its likeliness to a hand cannon, this short barrel improves agility at the cost of precision and projectile range."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.altnofs"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m79_barrel"

att.LHIK = true

att.Model = "models/weapons/arccw/atts/lhik_short.mdl"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.5
att.Mult_Recoil = 1.25
att.Mult_AccuracyMOA = 2

att.Mult_MoveDispersion = 0.75
att.Mult_SightTime = 0.75
att.Mult_ReloadTime = 0.85

att.Mult_SpeedMult = 1.01
att.Mult_SightedSpeedMult = 1.05

att.Mult_Sway = 0.75

att.A_Hook_Add_SightsDispersion = function(wep, data)
    if data and !wep.Attachments[1].Installed then
        data.add = data.add + 50
    end
end

att.ActivateElements = {"m79_pirategun", "m79_nosights"}

att.GivesFlags = {"m79_pirategun"}

    ArcCW.LoadAttachmentType(att, "ud_m79_barrel_short")
end
                                      

                                    
do
    local att = {}

att.PrintName = "Raised Sights"
att.AbbrevName = "Raised Sights"
att.Icon = Material("", "mips smooth")

att.SortOrder = 99999
att.Description = "Flip the ladder sights up for a potentially more precise sight picture."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "This depends on preference, really"
}
att.Slot = "ud_m79_sights"

att.AutoStats = true
att.ActivateElements = {"m79_sightsup"}

    ArcCW.LoadAttachmentType(att, "ud_m79_sight_up")
end
                                  

                                            
do
    local att = {}

att.PrintName = "Sawn-Off Polymer Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Replace the entire weapon's furniture with one made out of lightweight polymer, and cut off the stock as well. Handling is maximized but recoil handling becomes the worst it could get on this weapon."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.sightdisp.50"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m79_stock"

att.AutoStats = true
att.Free = true

att.Add_SightsDispersion = 50

att.Mult_Recoil = 1.7
att.Mult_RecoilSide = 1.7
att.Mult_Sway = 4

att.Mult_SightTime = 0.5
att.Mult_HipDispersion = 0.65

att.Mult_SpeedMult = 1.15
att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.2

att.Mult_DrawTime = 0.5
att.Mult_HolsterTime = 0.5

att.ActivateElements = {"m79_nostock", "m79_poly"}

att.Override_ActivePos = Vector(0.5, 2, 1.5)

    ArcCW.LoadAttachmentType(att, "ud_m79_stock_poly_obrez")
end
                                          

                                      
do
    local att = {}

att.PrintName = "Polymer Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Replace the entire weapon's furniture with one made out of lightweight polymer. Handling is improved, but recoil is relatively difficult to manage."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m79_stock"

att.AutoStats = true
att.Free = true

att.Add_SightsDispersion = 50

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.2
att.Mult_Sway = 0.85

att.Mult_SightTime = 0.85
att.Mult_HipDispersion = 0.85

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.8
att.Mult_HolsterTime = 0.8

att.ActivateElements = {"m79_polystock", "m79_poly"}

    ArcCW.LoadAttachmentType(att, "ud_m79_stock_poly")
end
                                    

                                        
do
    local att = {}

att.PrintName = "Mini-14 20\" SD Barrel"
att.AbbrevName = "20\" SD Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 20\" SD Barrel"
end

att.Icon = Material("", "smooth mips")
att.SortOrder = 20
att.Description = "Barrel with integrated suppressor for shooting far-away varmints. More accurate, but slightly heavier.\n\nThis barrel is not compatible with muzzle devices."
att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_barrel"

att.Mult_SightTime = 1.10
att.Mult_Recoil = 0.9
att.Mult_AccuracyMOA = 0.85
att.Mult_Range = 1.05
att.Mult_Sway = 0.85

att.Mult_PhysBulletMuzzleVelocity = 0.90

att.Mult_ShootVol = 0.85
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.ActivateElements = {"ud_mini14_barrel_sd"}

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

att.AutoStats = true

    ArcCW.LoadAttachmentType(att, "ud_mini14_barrel_sd")
end
                                      

                                       
do
    local att = {}

att.PrintName = "Mini-14 10mm Auto Receiver"
att.AbbrevName = "10mm Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 810 10mm Auto Receiver"
end

att.Icon = Material("entities/att/uc_bullets/10.png", "smooth mips")
att.Description = "The 9mm carbine conversion, opened up for the round the FBI briefly fell in love with and then quietly gave up on for kicking too hard. It does noticeably more per shot than the 9mm and asks for a firmer grip in return, which was rather the whole argument at the time."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"
att.SortOrder = 11

att.AutoStats = true

att.Mult_Damage = 35 / 34
att.Mult_DamageMin = 20 / 20
att.Mult_Penetration = 8 / 14
att.Mult_Range = 0.78

att.Override_ClipSize = 20

att.Mult_RPM = 1.28
att.Mult_Recoil = 0.72
att.Mult_RecoilSide = 0.75
att.Mult_VisualRecoilMult = 0.65
att.Mult_HipDispersion = 0.72
att.Mult_AccuracyMOA = 1.10

att.Mult_SightTime = 0.92
att.Mult_ReloadTime = 0.84
att.Mult_Sway = 0.88
att.Mult_ShootSpeedMult = 1.12

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "10mm Auto"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1.15
att.Override_PhysBulletMuzzleVelocity = 400

att.ActivateElements = {"ud_mini14_receiver_10mm"}
att.GivesFlags = {"ud_mini14_receiver_10mm"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

local slotinfo = {
    [7] = {"20-Round Mag", "20-Round Mag", Material("entities/att/ur_mp5/mag30.png", "smooth mips")},
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
att.Mult_ShootPitch = 0.95
att.Mult_ShootVol = 1.1

local fire = {"weapons/arccw_ud/glock/fire_10.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_10.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_10.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_cal_10mm")
end
                                     

                                           
do
    local att = {}

att.PrintName = "Mini-14 .17 Hornet Conversion"
att.AbbrevName = ".17 Hornet"

att.SortOrder = 12
att.Icon = Material("entities/att/uc_bullets/223remington.png", "smooth mips")
att.Description = "A twenty grain bullet doing well over three thousand feet per second, which is a combination that behaves less like a rifle round and more like a rumour. Varmint shooters love it because it does not ricochet: it simply ceases to exist on impact.\n\nNear enough recoilless and very accurate, with a flat enough trajectory that you can ignore drop. It only does about half damage and stops dead at the first hard surface, so it is for hitting people in the open, not through cover."
att.Desc_Pros = {
    "Extremely accurate and flat",
}
att.Desc_Cons = {
    "Stopped by almost any cover",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"
att.AutoStats = true

att.Override_Trivia_Calibre = ".17 Hornet"
att.Override_Trivia_Class = "Varmint Rifle"
att.Override_Ammo = "pistol"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 0.9
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Mult_AccuracyMOA = 0.4
att.Mult_MuzzleVelocity = 1.45
att.Mult_Range = 1.5
att.Mult_Recoil = 0.3
att.Mult_VisualRecoilMult = 0.4
att.Mult_RPM = 1.2
att.Mult_ClipSize = 1.5

att.Mult_Damage = 0.5
att.Mult_DamageMin = 0.45
att.Override_Penetration = 2
att.Mult_ShootPitch = 1.3
att.Mult_ShootVol = 0.8

local fire = {"weapons/arccw_ur/ak/fire_545_auto_1.ogg", "weapons/arccw_ur/ak/fire_545_auto_2.ogg", "weapons/arccw_ur/ak/fire_545_auto_3.ogg"}
local firesup = {"weapons/arccw_ur/ak/fire-sup-01.ogg", "weapons/arccw_ur/ak/fire-sup-02.ogg", "weapons/arccw_ur/ak/fire-sup-03.ogg"}
local firetail = {"weapons/arccw_ur/ak/fire_545_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_cal_17hornet")
end
                                         

                                      
do
    local att = {}

att.PrintName = "Mini-14 9x19mm Receiver"
att.AbbrevName = "9x19mm Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 9x19mm Receiver"
end

att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "Aftermarket 9x19mm conversion for the Mini-14. While the 9x19mm cartridge has moderate stopping power, its recoil is manageable, making it a good choice for follow-up shots."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Mult_SightTime = 0.9
att.Mult_ReloadTime = 0.80
att.Mult_Sway = 0.85

att.Mult_Range = 0.7
att.Mult_Recoil = 0.425
att.Mult_VisualRecoilMult = 0.375
att.Mult_RPM = 1.45
att.Mult_ShootSpeedMult = 1.2

att.Mult_HipDispersion = 0.6

att.Override_ClipSize = 30

att.ActivateElements = {"ud_mini14_receiver_9mm"}

att.Mult_AccuracyMOA = 1.05

att.Mult_Penetration = 0.50
att.Mult_DamageMin = 0.35
att.Mult_Damage = 0.30

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Override_PhysBulletMuzzleVelocity = 670

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

local path = "arccw_uc/common/"

local fire22 = {"weapons/misc/type20_8mm_nambu_fire.wav"}
local fire22sup = {"weapons/misc/type20_8mm_nambu_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "fire-22-dist-01.ogg", path .. "fire-22-dist-02.ogg", path .. "fire-22-dist-03.ogg", path .. "fire-22-dist-04.ogg", path .. "fire-22-dist-05.ogg", path .. "fire-22-dist-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "fire-dist-int-pistol-light-01.ogg", path .. "fire-dist-int-pistol-light-02.ogg", path .. "fire-dist-int-pistol-light-03.ogg", path .. "fire-dist-int-pistol-light-04.ogg", path .. "fire-dist-int-pistol-light-05.ogg", path .. "fire-dist-int-pistol-light-06.ogg"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

local slotinfo = {
    [7] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_mp5/mag30.png", "smooth mips")},
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

    ArcCW.LoadAttachmentType(att, "ud_mini14_cal_9mm")
end
                                    

                                      
do
    local att = {}

att.PrintName = "Mini-14 100-Round C-Mag"
att.AbbrevName = "100-Round C-Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 100-Round C-Mag"
end

att.SortOrder = 30
att.Icon = Material("entities/att/acwatt_ud_m16_mag_100.png", "smooth mips")
att.Description = "Twin drum magazine for vermin genocide. Has a tendency to jam."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.jam"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_mag"

att.AutoStats = true

att.Override_ClipSize = 100

att.Mult_SightTime = 1.35
att.Mult_ReloadTime = 1.75
att.Mult_Sway = 2

att.Mult_SpeedMult = 0.75
att.Mult_ShootSpeedMult = 0.85

att.Mult_DrawTime = 1.40
att.Mult_HolsterTime = 1.40

att.Mult_HipDispersion = 1.75

att.Override_Malfunction = true

att.ActivateElements = {"ud_mini14_mag_100_22lr"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_100"
end

att.ExcludeFlags = {"mini14_762", "mini14_22lr"}
att.HideIfBlocked = true

    ArcCW.LoadAttachmentType(att, "ud_mini14_mag_100")
end
                                    

                                           
do
    local att = {}

att.PrintName = "Mini-14 105-Round C-Mag"
att.AbbrevName = "105-Round C-Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 105-Round C-Mag"
end

att.SortOrder = 30
att.Icon = Material("entities/att/acwatt_ud_m16_mag_100.png", "smooth mips")
att.Description = "Twin drum magazine for vermin genocide. Has a tendency to jam."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.jam"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_mag"

att.AutoStats = true

att.Mult_ClipSize = 7

att.Mult_SightTime = 1.35
att.Mult_ReloadTime = 1.75
att.Mult_Sway = 2

att.Mult_SpeedMult = 0.75
att.Mult_ShootSpeedMult = 0.85

att.Mult_DrawTime = 1.40
att.Mult_HolsterTime = 1.40

att.Mult_HipDispersion = 1.75

att.Override_Malfunction = true

att.ActivateElements = {"ud_mini14_mag_100_22lr"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_100"
end

att.RequireFlags = {"mini14_22lr"}

att.HideIfBlocked = true

    ArcCW.LoadAttachmentType(att, "ud_mini14_mag_105_22lr")
end
                                         

                                         
do
    local att = {}

att.PrintName = "Mini-30 7.62x39mm 75-Round Drum"
att.AbbrevName = "75-Round Drum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 816 7.62x39mm 75-Round Drum"
end

att.SortOrder = 30
att.Icon = Material("entities/att/ur_ak/magazines/762_75.png", "smooth mips")
att.Description = "Effectively an AK drum magazine with a modified feeding lip, this magazine is proof of gun hobbyists' dedication (and lunacy) in search of more dakka."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_mag"

att.AutoStats = true

att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.375
att.Override_ClipSize = 75
att.Mult_Sway = 1.7
att.Mult_ShootSpeedMult = 0.85

att.Mult_MalfunctionMean = 0.875

att.ActivateElements = {"ud_mini14_mag_75_762"}
att.RequireFlags = {"mini14_762"}
att.HideIfBlocked = true

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_100"
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_mag_75_762")
end
                                       

                                                
do
    local att = {}

att.PrintName = "Patriot 809 .17 Mach IV Conversion"
att.AbbrevName = ".17 Mach IV"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/223remington.png", "smooth mips")
att.Description = "A .221 Fireball case squeezed down to seventeen calibre by Vern O'Brien in the sixties, producing a bullet that leaves at over four thousand feet per second and is gone. The name was a boast and it was more or less accurate.\n\nSo fast and so light that it glances off hard surfaces and keeps going for 45 percent damage. Nearly recoilless and extremely accurate, but each hit is worth well under half a normal round."
att.Desc_Pros = {
    "Ricochets off hard surfaces",
    "Extremely accurate, almost no recoil",
}
att.Desc_Cons = {
    "Very weak per hit",
    "No penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".17 Mach IV"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 0.8

att.Mult_Damage = 0.42
att.Mult_DamageMin = 0.4
att.Mult_Penetration = 0.3
att.Mult_Range = 1.35
att.Mult_MuzzleVelocity = 1.7
att.Mult_Recoil = 0.3
att.Mult_RecoilSide = 0.3
att.Mult_VisualRecoilMult = 0.35
att.Mult_RPM = 1.35
att.Mult_ClipSize = 1.4
att.Mult_AccuracyMOA = 0.4
att.Mult_ShootPitch = 1.35

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.45)
    end

    return hit
end
att.Mult_ShootVol = 0.8

local fire = {"weapons/arccw_ur/ak/fire_545_auto_1.ogg", "weapons/arccw_ur/ak/fire_545_auto_2.ogg", "weapons/arccw_ur/ak/fire_545_auto_3.ogg"}
local firesup = {"weapons/arccw_ur/ak/fire-sup-01.ogg", "weapons/arccw_ur/ak/fire-sup-02.ogg", "weapons/arccw_ur/ak/fire-sup-03.ogg"}
local firetail = {"weapons/arccw_ur/ak/fire_545_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_17machiv")
end
                                              

                                                
do
    local att = {}

att.PrintName = "Mini-14 .204 Ruger Receiver"
att.AbbrevName = ".204 Ruger Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot .204 Ruger Receiver"
end

att.Icon = Material("entities/att/17incinerator.png", "smooth mips")
att.Description = "High-velocity rifle cartridge developed in 2004 by Ruger and Hornady. It’s known for its speed, flat trajectory, and low recoil, making it a favorite for varmint hunting and target shooting. It’s based on the .222 Remington Magnum case, modified to achieve impressive performance."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".204 Ruger"

att.Mult_RPM = 0.86
att.Mult_ReloadTime = 1.05
att.Mult_Recoil = 1.285
att.Mult_HipDispersion = 1.10
att.Mult_AccuracyMOA = 0.85

att.Mult_Penetration = 1.65
att.Mult_DamageMin = 1.390
att.Mult_Damage = 1.300
att.ShootPitchVariation = 1
att.Override_PhysBulletMuzzleVelocity = 795
att.Mult_Range = 1.50

att.Override_PhysBulletMuzzleVelocity = 575

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "m16_223remington_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "m16_223remington_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_204ruger")
end
                                              

                                                   
do
    local att = {}

att.PrintName = "Mini-14 2.7×9mm Kolibri Receiver"
att.AbbrevName = "2.7×9mm Kolibri Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 2.7×9mm Kolibri Receiver"
end

att.Icon = Material("entities/att/2mm_kolibri_icon.png", "smooth mips")
att.Description = "Aftermarket conversion kit for the Mini-14 that loads it in the smallest commercially available centerfire cartridge, patented in 1910 and introduced in 1914 by an Austrian watchmaker.\n\nThe 2mm Kolibri was advertised as a ladies' self-defence round. While probably not effective against a mugger if shot at the chest or limbs, it could potentially inflict some damage if shot at the attacker's face.\n\n\"Ever been stung by a bee? How about a wasp? Or a hornet?\""
att.Desc_Pros = {"Extra headshot damage"
}
att.Desc_Cons = {"Where'd you even find this ammo?!"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.90
att.Mult_Sway = 0.80

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.20
att.Mult_Penetration = 0

att.Mult_Range = 0.10
att.Mult_Recoil = 0.15
att.Mult_VisualRecoilMult = 0.10
att.Mult_RPM = 1.25
att.Mult_ShootSpeedMult = 1.3

att.Mult_HipDispersion = 0.6

att.Override_ClipSize = 25

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.55
    end
end

att.ActivateElements = {"ud_mini14_mag_15_22lr", "ud_mini14_receiver_22lr"}
att.GivesFlags = {"mini14_22lr"}

att.Override_Ammo = "Pistol"
att.Override_Trivia_Calibre = "2.7×9mm Kolibri"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 375

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_15_22lr"
end

local path = "weapons/2mm_kolibri_mini14/"

local fire22 = {path .. "kolimini14_fire.wav"}
local fire22sup = {path .. "kolimini14_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "kolimini14_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "kolimini14_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

local slotinfo = {
    [7] = {"25-Round Mag", "25-Round Mag", Material("entities/att/acwatt_ud_mini14_mag_15_22lr.png", "smooth mips")},
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

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_2mm_kolibri")
end
                                                 

                                                  
do
    local att = {}

att.PrintName = "Patriot 809 .300 Whisper Conversion"
att.AbbrevName = ".300 Whisper"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/300blackout.png", "smooth mips")
att.Description = "J.D. Jones again, this time making a subsonic round that would feed reliably from unmodified magazines. It later got standardised, renamed and sold back to everybody as .300 Blackout, which annoyed him considerably.\n\nVery quiet, and anyone hit is slowed to 55 percent speed for three seconds. A solid hit at close range that falls off badly past about thirty metres."
att.Desc_Pros = {
    "Slows whoever it hits",
    "Very quiet",
}
att.Desc_Cons = {
    "Poor range",
    "Drops quickly",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".300 Whisper"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.0
att.Mult_Penetration = 1.1
att.Mult_Range = 0.6
att.Mult_RangeMin = 0.65
att.Mult_MuzzleVelocity = 0.5
att.Mult_Recoil = 0.85
att.Mult_RPM = 0.95
att.Mult_ShootVol = 0.6
att.Mult_ShootPitch = 0.78

local SLOW = 0.55
local DUR  = 3

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

local fire = {"weapons/arccw_ur/ak/fire_366_1.ogg", "weapons/arccw_ur/ak/fire_366_2.ogg", "weapons/arccw_ur/ak/fire_366_3.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_300whisper")
end
                                                

                                           
do
    local att = {}

att.PrintName = "Mini-14 .410 Bore Receiver"
att.AbbrevName = ".410 Bore Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot .410 Bore Receiver"
end

att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "Receiver that accepts .410 bore rounds, changing the weapon into a shotgun."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.Mult_RPM = 0.75
att.Mult_ReloadTime = 1.05
att.Mult_Recoil = 1.15
att.Mult_HipDispersion = 1.10
att.Override_Num = 4
att.Mult_AccuracyMOA = 25

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 1.30
att.Mult_Damage = 1.38
att.ShootPitchVariation = 1

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "mini14_410_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "mini14_410_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_410")
end
                                         

                                             
do
    local att = {}

att.PrintName = "Mini-14 .50 BMG Receiver"
att.AbbrevName = ".50 BMG Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot .50 BMG Receiver"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "In response to the need for new anti-aircraft weaponry during World War I, John Browning developed the .50 BMG. He wanted the round to be used in a machine gun based on a scaled-up version of the M1917 Browning. \n The .50 BMG cartridge is also used in anti-materiel rifles. A wide variety of ammunition is available, and the availability of match grade ammunition has increased the usefulness of .50 caliber rifles by allowing more accurate fire than lower-quality rounds. \n\n\"Sometimes, overkill is just the right amount of kill.\""
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Mult_SightTime = 1.16
att.Mult_ReloadTime = 1.185
att.Mult_Sway = 1.38

att.Mult_Damage = 2.75
att.Mult_DamageMin = 2.55
att.Mult_Penetration = 2.50

att.Mult_Range = 1.85
att.Mult_Recoil = 2.15
att.Mult_VisualRecoilMult = 1.50
att.Mult_RPM = 0.50
att.Mult_ShootSpeedMult = 0.75
att.Mult_MalfunctionMean = 0.88

att.Mult_HipDispersion = 0.9

att.Override_Trivia_Calibre = ".50 BMG"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.50

att.Override_PhysBulletMuzzleVelocity = 487

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "mini14_50bmg_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "mini14_50bmg_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_50bmg")
end
                                           

                                              
do
    local att = {}

att.PrintName = "Mini-14 Garand Receiver"
att.AbbrevName = "Garand Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 809 Garand Receiver"
end

att.Icon = Material("entities/att/arccw_uc_garand.png", "smooth mips")
att.Description = "Odd receiver for the Mini-14 that loosely attempts to transform it into a M1 Garand, loaded in the .30-06 Springfield Cartridge.\nFor whatever reason it creates a ghostly broken metallic ping noise on each shot (weirdly enough) that seemingly comes out of nowhere even though there is no en bloc clip.\n\nOffers more punch and precision but adds to the recoil and makes it more prone to jamming due to the strange receiver build and the surplus cartridges being used.\n\n\"The greatest battle implement ever devised\""
att.Desc_Pros = {
}
att.Desc_Cons = {"Comes with PTSD and memories of war"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_receiver"

att.AutoStats = true

att.Mult_SightTime = 1.13
att.Mult_ReloadTime = 1.12
att.Mult_Sway = 1.24

att.Mult_Damage = 1.95
att.Mult_DamageMin = 1.75
att.Mult_Penetration = 1.40

att.Mult_Range = 1.48
att.Mult_Recoil = 1.25
att.Mult_VisualRecoilMult = 1.32
att.Mult_RPM = 0.79
att.Mult_ShootSpeedMult = 0.93
att.Mult_MalfunctionMean = 0.88

att.Mult_HipDispersion = 0.6

att.Override_ClipSize = 8

att.ActivateElements = {"ud_mini14_mag_15_22lr", "ud_mini14_receiver_22lr"}
att.GivesFlags = {"mini14_22lr"}

att.Override_Trivia_Calibre = ".30-06 Springfield"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1

att.Override_PhysBulletMuzzleVelocity = 487

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_15_22lr"
end

local path = "weapons/2mm_kolibri_mini14/"

local fire22 = {path .. "mini_garand_fire.wav"}
local fire22sup = {path .. "mini_garand_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "mini_garand_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "mini_garand_dist.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

local slotinfo = {
    [7] = {"8-Round Internal Mag", "8-Round Internal Mag", Material("entities/att/acwatt_ud_mini14_mag_15_22lr.png", "smooth mips")},
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

    ArcCW.LoadAttachmentType(att, "ud_mini14_receiver_garand")
end
                                            

                                                  
do
    local att = {}

att.PrintName = "13.2×99mm Hotchkiss"
att.AbbrevName = "13.2×99mm Hotchkiss"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 13.2×99mm Hotchkiss"
end

att.Icon = Material("entities/att/uc_bullets/65grendal.png", "smooth mips")
att.Description = "Light squad weapon configuration loaded in the heavy and powerful 13.2×99mm Hotchkiss that was used in machineguns from countries like Japan, France, China, Mexico, Romania and Chile."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 1.07

att.Mult_Damage = 1.36
att.Mult_DamageMin = 1.38
att.Mult_Penetration = 1.62
att.Mult_ReloadTime = 1.17

att.Mult_Range = 1.49
att.Mult_Recoil = 1.38
att.Mult_VisualRecoilMult = 1.28

att.Override_Trivia_Calibre = "13.2×99mm Hotchkiss"
att.Override_Trivia_Class = "Light Squad Weapon"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.25

local path = "weapons/misc/"

local fire22 = {path .. "type20_hotchkiss_fire.wav"}
local fire22sup = {path .. "type20_hotchkiss_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_13x99_hotchkiss")
end
                                                

                                          
do
    local att = {}

att.PrintName = ".410 Bore"
att.AbbrevName = ".410 Bore"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 .410 Bore"
end

att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "Caliber conversion to the .410 bore round that turns the weapon into a shotgun. Packs a punch at closer range and fires four pellets by default."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.59

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17
att.Override_Penetration = 1.1
att.Override_Num = 4
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.15
att.Mult_VisualRecoilMult = 0.2
att.Mult_ClipSize = 1.2
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"
att.Override_Trivia_Class = "Shotgun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

local path = "weapons/misc/"

local fire22 = {path .. "type20_410_fire.wav"}
local fire22sup = {path .. "type20_410_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_410bore")
end
                                        

                                                   
do
    local att = {}

att.PrintName = "6.5×50mm Arisaka"
att.AbbrevName = "6.5×50mm Arisaka"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 6.5×50mm Arisaka"
end

att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips")
att.Description = "Conversion to the 6.5×50mm Arisaka caliber that was used in the Type 38 rifle and carbine, this round was the standard Japanese military cartridge from 1897 until the late 1930s. Now it has found it's way into your weapon's chamber. \n Limits the firemode to semi auto (unless modified to do otherwise) and makes the weapon somewhat prone to jamming due to this being aged surplus ammunition."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.66

att.Mult_Damage = 1.67
att.Mult_DamageMin = 1.71
att.Mult_Penetration = 1.43

att.Mult_Range = 1.43
att.Mult_Recoil = 1.62
att.Mult_VisualRecoilMult = 1.32
att.Mult_ClipSize = 0.90
att.Mult_MalfunctionMean = 0.76

att.Override_PhysBulletMuzzleVelocity = 434
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = "6.5×50mm Arisaka"
att.Override_Trivia_Class = "Designated Marksman Rifle"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "type20_6mm_arisaka_fire.wav"}
local fire22sup = {path .. "type20_6mm_arisaka_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_6.5x50mm_arisaka")
end
                                                 

                                                   
do
    local att = {}

att.PrintName = "7.7×58mm Arisaka"
att.AbbrevName = "7.7×58mm Arisaka"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 7.7×58mm Arisaka"
end

att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "smooth mips")
att.Description = "Conversion to the 7.7×58mm Arisaka caliber that was introduced with the Type 99 rifle, this round was intended to replace the 6.5×50mm Arisaka during World War II. \n Limits the firemode to semi auto (unless modified to do otherwise). Despite being an old cartridge, it does not affect the feeding and loading mechanism due to the improvement over the previous design."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.82

att.Mult_Damage = 1.73
att.Mult_DamageMin = 1.78
att.Mult_Penetration = 1.48

att.Mult_Range = 1.58
att.Mult_Recoil = 1.66
att.Mult_VisualRecoilMult = 1.35
att.Mult_ClipSize = 0.90

att.Override_PhysBulletMuzzleVelocity = 588
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = "7.7×58mm Arisaka"
att.Override_Trivia_Class = "Designated Marksman Rifle"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "type20_7mm_arisaka_fire.wav"}
local fire22sup = {path .. "type20_7mm_arisaka_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_7.7x58mm_arisaka")
end
                                                 

                                                  
do
    local att = {}

att.PrintName = "7.7×58mm Type 92"
att.AbbrevName = "7.7×58mm Type 92"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 7.7×58mm Type 92"
end

att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "smooth mips")
att.Description = "Heavy machinegun configuration loaded in the 7.7×58mm Type 92, a rimmed version of the 7.7×58mm Arisaka, used in the Type 92 heavy machine gun. Fires slower and is more prone to jamming due to being aged, but hits harder than the Hotchkiss rounds."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.75

att.Mult_Damage = 1.68
att.Mult_DamageMin = 1.72
att.Mult_Penetration = 1.73
att.Mult_ReloadTime = 1.21

att.Mult_Range = 1.52
att.Mult_Recoil = 1.48
att.Mult_VisualRecoilMult = 1.31

att.Override_Trivia_Calibre = "7.7×58mm Type 92"
att.Override_Trivia_Class = "Heavy Machinegun"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.25

local path = "weapons/misc/"

local fire22 = {path .. "type20_7mm_type92_fire.wav"}
local fire22sup = {path .. "type20_7mm_type92_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_7.7x58mm_type92")
end
                                                

                                         
do
    local att = {}

att.PrintName = "7.62x39mm Soviet"
att.AbbrevName = "7.62x39mm Soviet"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 7.62x39mm Soviet"
end

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "Conversion to the 7.62x39mm caliber, effectively turning this into a battle rifle. Powerful but has slower fire rate and more recoil"
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.83

att.Mult_Damage = 1.15
att.Mult_DamageMin = 1.21
att.Mult_Penetration = 1.19

att.Mult_Range = 1.19
att.Mult_Recoil = 1.11
att.Mult_VisualRecoilMult = 1.11

att.Override_Trivia_Calibre = "7.62x39mm"
att.Override_Trivia_Class = "Battle Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1

att.ActivateElements = {"mag_762"}

local path = "weapons/misc/"

local fire22 = {path .. "type20_762_fire.wav"}
local fire22sup = {path .. "type20_762_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_762x39")
end
                                       

                                               
do
    local att = {}

att.PrintName = "8×22mm Nambu"
att.AbbrevName = "8×22mm Nambu"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 8×22mm Nambu"
end

att.Icon = Material("entities/att/uc_bullets/357sig.png", "smooth mips")
att.Description = "Submachine configuration using surplus 8×22mm Nambu caliber rounds. It is a rimless, bottleneck handgun cartridge that was introduced in Imperial Japan in 1904, used in both the Pacific War and Second Sino-Japanese War."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 1.46

att.Mult_Damage = 0.71
att.Mult_DamageMin = 0.76
att.Mult_Penetration = 0.76

att.Mult_Range = 0.95
att.Mult_Recoil = 0.82
att.Mult_VisualRecoilMult = 0.92
att.Mult_ClipSize = 1.15
att.Mult_MalfunctionMean = 0.96
att.Mult_MoveSpeed = 1.03
att.Mult_SightTime = 0.95

att.Override_PhysBulletMuzzleVelocity = 112

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "8×22mm Nambu"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 0.75

att.ActivateElements = {"mag_smg"}

local path = "weapons/misc/"

local fire22 = {path .. "type20_8mm_nambu_fire.wav"}
local fire22sup = {path .. "type20_8mm_nambu_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "type20_8mm_nambu_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "type20_8mm_nambu_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_8x22mm_nambu")
end
                                             

                                     
do
    local att = {}

att.PrintName = "Plastic BB"
att.AbbrevName = "Plastic BB"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Type 20 Plastic BB"
end

att.Icon = Material("entities/att/bb_gun.png", "smooth mips")
att.Description = "I don't get why airsoft is so popular in Japan. \n\n You better not use this in full-auto while in a building, not like i'd even know if you'd do this, but just don't; It's like an unspoken rule or something."
att.Desc_Pros = {

}
att.Desc_Cons = {"NO FULL AUTO IN BUILDINGS!!!"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 2.15

att.Mult_Damage = 0.14
att.Mult_DamageMin = 0.12
att.Mult_Penetration = 0.000001

att.Mult_Range = 0.56
att.Mult_Recoil = 0.07
att.Mult_VisualRecoilMult = 0.11
att.Mult_ClipSize = 4.20
att.Mult_MalfunctionMean = 1.05
att.Mult_MoveSpeed = 1.23
att.Mult_SightTime = 0.75

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 112

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "Plastic BB"
att.Override_Trivia_Class = "Airsoft Replica"
att.Override_ShellScale = 0.00001

local path = "weapons/misc/"

local fire22 = {path .. "bb_gun_fire1.wav",path .. "bb_gun_fire2.wav",path .. "bb_gun_fire3.wav",path .. "bb_gun_fire4.wav",path .. "bb_gun_fire5.wav"}
local fire22sup ={path .. "bb_gun_fire1.wav",path .. "bb_gun_fire2.wav",path .. "bb_gun_fire3.wav",path .. "bb_gun_fire4.wav",path .. "bb_gun_fire5.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "bb_gun_fire_dist1.wav", path .. "bb_gun_fire_dist2.wav", path .. "bb_gun_fire_dist3.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "bb_gun_fire_dist1.wav", path .. "bb_gun_fire_dist2.wav", path .. "bb_gun_fire_dist3.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_type20_cal_bb")
end
                                   

                                       
do
    local att = {}

att.PrintName = "Uzi 2.7×9mm Kolibri Conversion"
att.AbbrevName = "2.7×9mm Kolibri"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-9 2.7×9mm Kolibri Conversion"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/2mm_kolibri_icon.png", "smooth mips")
att.Description = "Conversion of the UZI to the smallest commercially available centerfire cartridge, patented in 1910 and introduced in 1914 by an Austrian watchmaker. Due to it being smaller than .22LR, you can cram even more of these suckers into a mag.\n\nThe 2mm Kolibri was advertised as a ladies' self-defence round. While probably not effective against a mugger if shot at the chest or limbs, it could potentially inflict some damage if shot at the attacker's face.\n\n\"Ever been stung by a bee? How about a wasp? Or a hornet?\""
att.Desc_Pros = {
}

att.Override_Trivia_Calibre = "2.7×9mm Kolibri"
att.Override_Ammo = "Pistol"

att.AutoStats = true

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.20
att.Mult_Penetration = 0

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 360

att.Mult_Recoil = 0.27
att.Mult_VisualRecoilMult = 0.25
att.Mult_RPM = 1.7
att.Mult_ShootSpeedMult = 1.3

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.45
    end
end

att.Mult_ClipSize = 1.35

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_uzi/"

local fire22 = {path .. "koluzi_fire.wav"}
local fire22sup = {path .. "koluzi_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "koluzi_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "koluzi_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_2mm_kolibri")
end
                                     

                                
do
    local att = {}

att.PrintName = "Uzi 4.6x30mm Conversion"
att.AbbrevName = "4.6x30mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-9 4.6x30mm Conversion"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/uc_bullets/46x30.png", "smooth mips")
att.Description = "The 4.6×30mm cartridge is a small-caliber, high-velocity, smokeless powder, rebated, bottleneck, centerfire cartridge designed for personal defense weapons (PDW) developed by German armament manufacturer Heckler & Koch (HK) in 1999. It was designed primarily for the MP7 PDW to minimize weight and recoil while increasing body armor penetration."
att.Desc_Pros = {
}

att.Override_Trivia_Calibre = "4.6x30mm"

att.AutoStats = true

att.Mult_Damage = 1.48
att.Mult_DamageMin = 1.44
att.Mult_Penetration = 1.40

att.Mult_Recoil = 1.28
att.Mult_Range = 1.845
att.Mult_Precision = 1.38
att.Mult_VisualRecoilMult = 0.90
att.Mult_RPM = 0.90
att.Mult_ShootSpeedMult = 0.95
att.Mult_ClipSize = 0.95
att.Mult_ReloadTime = 1.025

att.Override_ShellModel = "models/weapons/arccw/uc_shells/57x28fn.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "uzi_46mm_fire.wav"}
local fire22sup = {path .. "uzi_46mm_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_46mm")
end
                              

                                
do
    local att = {}

att.PrintName = "Uzi .50 Action Express Conversion"
att.AbbrevName = ".50 Action Express"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-9 .50 Action Express Conversion"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Conversion of the UZI to a large-caliber handgun cartridge well-known for being one of the most powerful pistol cartridges. Prone to jamming a bunch."
att.Desc_Pros = {
}

att.Override_Trivia_Calibre = ".50 Action Express"
att.Override_Ammo = "357"

att.AutoStats = true

att.Mult_Damage = 2.15
att.Mult_DamageMin = 1.79
att.Mult_Penetration = 2

att.Mult_Recoil = 1.38
att.Mult_Range = 1.75
att.Mult_Precision = 1.20
att.Mult_MalfunctionMean = 0.25
att.Mult_VisualRecoilMult = 1.13
att.Mult_RPM = 0.80
att.Mult_ShootSpeedMult = 0.85
att.Mult_ClipSize = 0.80
att.Mult_ReloadTime = 1.05

att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "uzi_50ae_fire.wav"}
local fire22sup = {path .. "uzi_50ae_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_50ae")
end
                              

                                     
do
    local att = {}

att.PrintName = "Uzi 16\" Competition Barrel"
att.AbbrevName = "16\" Competition Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP 16\" Competition Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_uzi_body_civvy.png", "smooth mips")
att.Description = "Competition barrel for the Uzi, elongated to fit minimum length requirements. Substantially improves range and recoil, at the cost of forcing the weapon into manual action."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.semionly"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_frame"

att.AutoStats = true
att.SortOrder = 16

att.Mult_AccuracyMOA = 0.5
att.Mult_SightTime = 1.25
att.Mult_Recoil = 0.65
att.Mult_RecoilSide = 0.4
att.Mult_RPM = 0.9
att.Mult_Range = 1.75
att.Mult_Sway = 2
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_TriggerDelayTime = 0
att.Override_ChamberSize = 1
att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

att.Override_HoldtypeActive = "pistol"
att.Override_HoldtypeSights = "revolver"
att.Override_Trivia_Class = "Bolt-Action Pistol"
att.Override_Trivia_Mechanism = "Bolt-Action"

att.Add_BarrelLength = 8

att.ActivateElements = {"ud_uzi_body_civvy"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_body_comp")
end
                                   

                                           
do
    local att = {}

att.PrintName = "Uzi 4.6\" Competition (Micro) Barrel"
att.AbbrevName = "4.6\" Competition (Micro) Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP 4.6\" Competition (Micro) Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_uzi_body_micro.png", "smooth mips")
att.Description = "Extremely compact frame that has it's gas system removed, forcing the weapon to be cycled manually. This variant has an underbarrel rail for attaching foregrips, and also enables the use of certain stocks. The modifications make this model slightly heavier but not by much."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_frame"

att.AutoStats = true
att.SortOrder = 4.6

att.Mult_AccuracyMOA = 1.45
att.Mult_SightTime = 0.615
att.Mult_Recoil = 3
att.Mult_RecoilSide = 1.25
att.Mult_RPM = 1+(3/5)
att.Mult_Range = 0.8
att.Mult_HipDispersion = 1.5
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_DrawTime = 0.615
att.Mult_HolsterTime = 0.615

att.Add_BarrelLength = -8

att.Override_ChamberSize = 1
att.Mult_TriggerDelayTime = 0

att.LHIK = true

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5
att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

att.Override_HoldtypeActive = "pistol"
att.Override_HoldtypeSights = "revolver"
att.Override_Trivia_Class = "Bolt-Action Pistol"
att.Override_Trivia_Mechanism = "Bolt-Action"

att.Model = "models/weapons/arccw/atts/mini_lhik.mdl"

att.ActivateElements = {"ud_uzi_body_micro_railed"}
att.GivesFlags = {"micro_tac"}

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_micro"
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_body_micro_comp")
end
                                         

                                          
do
    local att = {}

att.PrintName = "Uzi 4.6\" Micro Tactical Barrel"
att.AbbrevName = "4.6\" Micro Tactical Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP 4.6\" Micro Tactical Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_uzi_body_micro.png", "smooth mips")
att.Description = "Extremely compact frame that turns this sub-machine gun into a machine pistol. Converts weapon to closed bolt operation. This variant has an underbarrel rail for attaching foregrips, and also enables the use of certain stocks. The modifications make this model slightly heavier but not by much."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_frame"

att.AutoStats = true
att.SortOrder = 4.6

att.Mult_AccuracyMOA = 1.75
att.Mult_SightTime = 0.615
att.Mult_Recoil = 3
att.Mult_RecoilSide = 1.25
att.Mult_RPM = 1+(3/5)
att.Mult_Range = 0.5
att.Mult_HipDispersion = 1.5

att.Mult_DrawTime = 0.615
att.Mult_HolsterTime = 0.615

att.Add_BarrelLength = -8

att.Override_ChamberSize = 1
att.Mult_TriggerDelayTime = 0

att.LHIK = true

att.Override_HoldtypeActive = "pistol"
att.Override_HoldtypeSights = "revolver"
att.Override_Trivia_Class = "Machine Pistol"
att.Override_Trivia_Mechanism = "Blowback"

att.Model = "models/weapons/arccw/atts/mini_lhik.mdl"

att.ActivateElements = {"ud_uzi_body_micro_railed"}
att.GivesFlags = {"micro_tac"}

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_micro"
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_body_micro_tac")
end
                                        

                                   
do
    local att = {}

att.PrintName = "Uzi 16\" SD Barrel"
att.AbbrevName = "16\" SD Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP 16\" SD Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Integrally suppressed barrel."
att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_frame"

att.AutoStats = true
att.SortOrder = 16

att.Mult_AccuracyMOA = 0.5
att.Mult_SightTime = 1.25
att.Mult_Recoil = 0.65
att.Mult_RecoilSide = 0.4
att.Mult_RPM = 0.9
att.Mult_Range = 1.75
att.Mult_Sway = 2
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_TriggerDelayTime = 0
att.Override_ChamberSize = 1

att.Add_BarrelLength = 8

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

att.ActivateElements = {"ud_uzi_body_sd"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_body_sd")
end
                                 

                                            
do
    local att = {}

att.PrintName = "Uzi .11 Whatzit Conversion"
att.AbbrevName = ".11 Whatzit"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-9 .11 Whatzit Conversion"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/11mm_whatzit_imp.png", "smooth mips")
att.Description = "The .11 Whatzit is a wildcat cartridge (of sorts). This is mainly a novelty, and it doesn't appear that any gun has actually been made to chamber and fire this \"cartridge\". That is, if it can even be considered a cartridge, depending on personal opinion. It has a primer, because it is a primer, as well as a projectile. But of course, it lacks any powder. However, it should theoretically be possible to chamber and fire this round, since gun barrels appear to be available in as small as .10 caliber. \n\n\"The kind of thing you'd give a veterinarian to euthanize a Guinea pig.\""
att.Desc_Pros = {"Fires 3 pellets"
}

att.Override_Trivia_Calibre = ".11 Whatzit Conversion"
att.Override_Ammo = "Buckshot"

att.AutoStats = true

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

local path = "weapons/11mm_whatzit_uzi/"

local fire22 = {path .. "11mm_whatzituzi_fire.wav"}
local fire22sup = {path .. "11mm_whatzituzi_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "11mm_whatzituzi_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "11mm_whatzituzi_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_11mm_whatzit")
end
                                          

                                         
do
    local att = {}

att.PrintName = ".30 Carbine Conversion"
att.AbbrevName = ".30 Carbine"

att.SortOrder = 64
att.Icon = Material("entities/att/uc_bullets/30carbine.png", "smooth mips")
att.Description = "The M1 Carbine's cartridge, which is a rifle round only by paperwork and a pistol round only by size. Out of a barrel this short most of the powder is still burning when it leaves, so it arrives fast, flat and with a muzzle blast out of all proportion to the hole it makes."
att.Desc_Pros = {
    "Flat, fast and long reaching",
    "Good penetration for a sidearm",
}
att.Desc_Cons = {
    "Deafening muzzle blast",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".30 Carbine"
att.Override_Ammo = "pistol"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.3
att.Mult_DamageMin = 1.35
att.Mult_Penetration = 1.5
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.5
att.Mult_MuzzleVelocity = 1.6
att.Mult_Recoil = 1.35
att.Mult_RecoilSide = 1.2
att.Mult_VisualRecoilMult = 1.25
att.Mult_RPM = 0.9
att.Mult_ClipSize = 0.85
att.Mult_ShootVol = 1.25
att.Mult_ShootPitch = 1.05

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

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_30carbine")
end
                                       

                                   
do
    local att = {}

att.PrintName = "Uzi 5.56x45mm Conversion Kit"
att.AbbrevName = "5.56x45mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-56 5.56x45mm Conversion Kit"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "Big boy bodykit loaded in 5.56mm, effectively turning this into an assault rifle."
att.Desc_Pros = {
}

att.Override_Trivia_Class = "Assault Rifle"
att.Override_Trivia_Calibre = "5.56x45mm"
att.Override_Ammo = "smg1"

att.AutoStats = true

att.Mult_Damage = 1.68
att.Mult_DamageMin = 1.56
att.Mult_Penetration = 1.65

att.Mult_Recoil = 1.45
att.Mult_Range = 2.35
att.Mult_Precision = 1.40
att.Mult_VisualRecoilMult = 0.80
att.Mult_RPM = 0.90
att.Mult_ShootSpeedMult = 0.90
att.Mult_ReloadTime = 1.10

att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1
att.ActivateElements = {"ud_uzi_body_rifle", "ud_uzi_mag_32_rifle"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_rifle"
end

local path = "weapons/misc/"

local fire22 = {path .. "uzi_556_fire.wav"}
local fire22sup = {path .. "uzi_556_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_556")
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
att.Slot = "ud_uzi_caliber"

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

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_57x28")
end
                                   

                                      
do
    local att = {}

att.PrintName = "Uzi 762x39 Conversion Kit (32-Round)"
att.AbbrevName = "762x39 (32rnd)"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-56 762x39 Conversion Kit (32-Round)"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "Big boy bodykit loaded in 762x39, effectively turning this into an assault rifle."
att.Desc_Pros = {
}

att.Override_Trivia_Class = "Assault Rifle"
att.Override_Trivia_Calibre = "762x39mm"
att.Override_Ammo = "smg1"

att.AutoStats = true

att.Mult_Damage = 1.85
att.Mult_DamageMin = 1.89
att.Mult_Penetration = 1.90

att.Mult_Recoil = 1.64
att.Mult_Range = 2.55
att.Mult_Precision = 1.75
att.Mult_VisualRecoilMult = 0.80
att.Mult_RPM = 0.85
att.Mult_ShootSpeedMult = 0.90
att.Mult_ReloadTime = 1.12

att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1
att.ActivateElements = {"ud_uzi_body_rifle", "ud_uzi_mag_32_762"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_rifle"
end

local path = "weapons/ar458/"

local fire22 = {path .. "ar762_fire.wav"}
local fire22sup = {path .. "ar762_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_762_32")
end
                                    

                                      
do
    local att = {}

att.PrintName = "Uzi 762x39 Conversion Kit (75-Round)"
att.AbbrevName = "762x39 (75rnd)"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "IAL-56 762x39 Conversion Kit (75-Round)"
end
att.Slot = "ud_uzi_caliber"

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "Big boy bodykit loaded in 762x39, effectively turning this into an assault rifle. Now with a big boy drum!"
att.Desc_Pros = {
}

att.Override_Trivia_Class = "Assault Rifle"
att.Override_Trivia_Calibre = "762x39mm"
att.Override_Ammo = "smg1"

att.AutoStats = true

att.Mult_Damage = 1.85
att.Mult_DamageMin = 1.89
att.Mult_Penetration = 1.90

att.Mult_Recoil = 1.64
att.Mult_Range = 2.55
att.Mult_Precision = 1.75
att.Mult_VisualRecoilMult = 0.80
att.Mult_RPM = 0.85
att.Mult_ShootSpeedMult = 0.85
att.Mult_ReloadTime = 1.17
att.Override_ClipSize = 75

att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1
att.ActivateElements = {"ud_uzi_body_rifle", "ud_uzi_mag_75_762"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_762drum"
end

local path = "weapons/ar458/"

local fire22 = {path .. "ar762_fire.wav"}
local fire22sup = {path .. "ar762_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_762_75")
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
att.Slot = "ud_uzi_caliber"

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

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_9x21")
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
att.Slot = "ud_uzi_caliber"

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

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_9x23")
end
                                  

                                          
do
    local att = {}

att.PrintName = "Uzi 9x25mm Dillon Conversion"
att.AbbrevName = "9x25mm Dillon"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "A 10mm case necked down to nine millimetres for competition shooters who wanted the muzzle brake to have something to work with. The fireball is genuinely enormous and that was considered a feature.\n\nArcs to one nearby enemy for 40 percent of the damage, so firing into a group hits two people per shot. Only one jump each. Sharp recoil and a big muzzle flash."
att.Desc_Pros = {
    "Arcs to a second nearby target",
    "Strong penetration",
}
att.Desc_Cons = {
    "Sharp recoil",
    "Reduced capacity",
    "Very loud",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x25mm Dillon"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.15
att.Mult_DamageMin = 1.2
att.Mult_Penetration = 1.7
att.Mult_Range = 1.3
att.Mult_MuzzleVelocity = 1.4
att.Mult_Recoil = 1.3
att.Mult_RPM = 0.95
att.Mult_ClipSize = 0.85
att.Mult_ShootVol = 1.25

local ARC_RANGE = 240
local ARC_FRAC  = 0.4

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
att.Mult_ShootPitch = 1.02

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

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_9x25dillon")
end
                                        

                                            
do
    local att = {}

att.PrintName = "Uzi .22 Eargesplitten Loudenboomer Conversion"
att.AbbrevName = ".22 Eargesplitten"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "P.O. Ackley necked a .378 Weatherby magnum case down to twenty two calibre in pursuit of five thousand feet per second, failed to get there, and named it after what it did to everyone within a hundred metres. He never claimed it was useful.\n\nThe bullet barely stabilises, so every hit rolls somewhere between 35 percent and 210 percent damage. Across a magazine it averages out slightly above normal, but no single shot can be relied on. Very fast, very flat and extremely loud."
att.Desc_Pros = {
    "Individual hits can be devastating",
    "Extremely fast and flat",
}
att.Desc_Cons = {
    "Damage is a lottery shot to shot",
    "Deafening",
    "Empties fast",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 Eargesplitten Loudenboomer"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 0.9

att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.8
att.Mult_Penetration = 1.4
att.Mult_Range = 1.5
att.Mult_RangeMin = 1.4
att.Mult_MuzzleVelocity = 1.9
att.Mult_Recoil = 0.85
att.Mult_RPM = 1.25
att.Mult_ClipSize = 0.85
att.Mult_AccuracyMOA = 0.7
att.Mult_ShootVol = 1.8
att.Mult_ShootPitch = 1.3

att.Hook_BulletHit = function(wep, hit)
    hit.damage = hit.damage * math.Rand(0.35, 2.1)

    return hit
end

local fire = {"weapons/arccw_ur/ak/fire_545_auto_1.ogg", "weapons/arccw_ur/ak/fire_545_auto_2.ogg", "weapons/arccw_ur/ak/fire_545_auto_3.ogg"}
local firesup = {"weapons/arccw_ur/ak/fire-sup-01.ogg", "weapons/arccw_ur/ak/fire-sup-02.ogg", "weapons/arccw_ur/ak/fire-sup-03.ogg"}
local firetail = {"weapons/arccw_ur/ak/fire_545_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_uzi_cal_loudenboomer")
end
                                          

                                        
do
    local att = {}

att.PrintName = "Folded Stock"
att.Icon = Material("entities/att/acwatt_ud_uzi_stock_folded.png", "smooth mips")
att.Description = "Tuck in the folding stock, making the weapon easier to manuver but less controllable."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_stock"
att.AttachSound = "arccw_uc/common/stockslide.ogg"

att.HideIfBlocked = true

att.AutoStats = true
att.Free = true
att.IgnorePickX = true
att.SortOrder = 2

att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 2
att.Mult_Sway = 1.5

att.Mult_SightTime = 0.85
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75
att.Add_BarrelLength = -2

att.ActivateElements = {"ud_uzi_folded_stock"}
att.ExcludeFlags = {"micro_tac"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_stock_folded")
end
                                      

                                       
do
    local att = {}

att.PrintName = "Uzi Micro Stock"
att.AbbrevName = "Micro Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP Micro Stock"
end

att.Icon = Material("entities/att/ur_mp5/stock_pdw.png", "smooth mips")
att.Description = "A light, foldable stock exclusive to the micro variant of the UZI platform."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_uzi_stock"

att.HideIfBlocked = true

att.AutoStats = true
att.SortOrder = 3

att.ToggleStats = {
    {
        PrintName = "Extended",
        Mult_Recoil = 0.90,
        Mult_RecoilSide = 0.925,
        Mult_VisualRecoilMult = 0.95,
        Mult_Sway = 0.75,

        Mult_SightTime = 1.05,
        Mult_SightedSpeedMult = 0.95,
        Mult_ShootSpeedMult = 0.95,

        Mult_DrawTime = 1.05,
        Mult_HolsterTime = 1.05,
        AutoStats = true,
        Hook_ModifyBodygroups = function(wep,data)
        local vm = data.vm

        vm:SetBodygroup(3,5)
        end
    },
    {
        PrintName = "Folded",
        Mult_Recoil = 1.10,
        Mult_RecoilSide = 1.05,
        Mult_VisualRecoilMult = 0.95,
        Mult_Sway = 0.75,

        Mult_SightTime = 0.95,
        Mult_SightedSpeedMult = 0.95,
        Mult_ShootSpeedMult = 0.95,

        Mult_DrawTime = 1.05,
        Mult_HolsterTime = 1.05,
        AutoStats = true,
        Hook_ModifyBodygroups = function(wep,data)
        local vm = data.vm

        vm:SetBodygroup(3,6)
        end
    }
}

att.RequireFlags = {"micro_tac"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_stock_micro")
end
                                     

                                         
do
    local att = {}

att.PrintName = "Uzi Polymer Stock"
att.AbbrevName = "Polymer Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP Polymer Stock"
end

att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
att.Description = "A solid, non-foldable stock made of polymer. Provides decent recoil reduction and doesn't weigh as much as a full wooden stock."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_uzi_stock"

att.HideIfBlocked = true

att.AutoStats = true
att.SortOrder = 3

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.75
att.Mult_VisualRecoilMult = 0.75
att.Mult_Sway = 0.75

att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.95

att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.ExcludeFlags = {"micro_tac"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_stock_polymer")
end
                                       

                                        
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = nil
att.Description = "Remove your stock. Who needs it, anyway? Not a real gangsta, that's who."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_uzi_stock"

att.HideIfBlocked = true

att.AutoStats = true
att.Free = true
att.SortOrder = 1

att.Mult_Recoil = 1.5
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 2
att.Mult_Sway = 2

att.Mult_SightTime = 0.75
att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75
att.Add_BarrelLength = -2

att.ExcludeFlags = {"micro_tac"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_stock_remove")
end
                                      

                                      
do
    local att = {}

att.PrintName = "Uzi Wooden Stock"
att.AbbrevName = "Wooden Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "STAP Wooden Stock"
end

att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
att.Description = "A solid, non-foldable stock made of wood. Old-fashioned and very sturdy, though less compact."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_uzi_stock"

att.HideIfBlocked = true

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

att.ExcludeFlags = {"micro_tac"}

    ArcCW.LoadAttachmentType(att, "ud_uzi_stock_wood")
end
                                    

                                         
do
    local att = {}

att.PrintName = (GetConVar("arccw_truenames"):GetBool() and "SPAS-12 Competition Grip") or "Martello 12/70 Competition Grip"
att.AbbrevName = "Competition Grip"
att.Description = "Flat polymer grip that offers better recoil management but somewhat slower handling."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Icon = Material("entities/att/ur_spas/grip_sport.png", "smooth mips")
att.Slot = "ur_spas12_grip"
att.AutoStats = true
att.Mult_SightedSpeedMult = 1.08
att.Mult_DrawTime = 1.09
att.Mult_HolsterTime = 1.06
att.Mult_PrecisionMOA = 0.8
att.Mult_Recoil = 0.85
att.Mult_Sway = 0.68

    ArcCW.LoadAttachmentType(att, "ue_spas12_sport_grip")
end
                                       

                                     
do
    local att = {}

att.PrintName = "M1911 .22 Long Rifle Conversion"
att.AbbrevName = ".22 Long Rifle"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R .22 Long Rifle Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "Conversion of the M1911 to the .22 LR cartridge, much more weaker and precise. Perfect for range shooting."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_PhysTracerProfile = "uc_plinking"

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 0.075
att.Mult_Range = 0.92
att.Mult_Precision = 1.12
att.Mult_Recoil = 0.31
att.Override_PhysBulletMuzzleVelocity = 240
att.Mult_Damage = 0.25
att.Mult_DamageMin = 0.20
att.Mult_RPM = 1.65
att.Mult_ClipSize = 1.5
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_22lr_fire_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_22lr_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_22lr_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "m1911_22lr_dist_int.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_22lr")
end
                                   

                                          
do
    local att = {}

att.PrintName = ".30 Carbine Conversion"
att.AbbrevName = ".30 Carbine"

att.SortOrder = 64
att.Icon = Material("entities/att/uc_bullets/30carbine.png", "smooth mips")
att.Description = "The M1 Carbine's cartridge, which is a rifle round only by paperwork and a pistol round only by size. Out of a barrel this short most of the powder is still burning when it leaves, so it arrives fast, flat and with a muzzle blast out of all proportion to the hole it makes."
att.Desc_Pros = {
    "Flat, fast and long reaching",
    "Good penetration for a sidearm",
}
att.Desc_Cons = {
    "Deafening muzzle blast",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".30 Carbine"
att.Override_Ammo = "pistol"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.3
att.Mult_DamageMin = 1.35
att.Mult_Penetration = 1.5
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.5
att.Mult_MuzzleVelocity = 1.6
att.Mult_Recoil = 1.35
att.Mult_RecoilSide = 1.2
att.Mult_VisualRecoilMult = 1.25
att.Mult_RPM = 0.9
att.Mult_ClipSize = 0.85
att.Mult_ShootVol = 1.3
att.Mult_ShootPitch = 1.08

local fire = {"weapons/arccw_ud/glock/fire_357.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_357.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_357.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_30carbine")
end
                                        

                                       
do
    local att = {}

att.PrintName = "M1911 .357 Magnum Conversion"
att.AbbrevName = ".357 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R .357 Magnum Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "Conversion of the M1911 to the powerful .357 Magnum cartridge, you know the drill: Lots of punch and power, but at the cost of more recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_357mag")
end
                                     

                                          
do
    local att = {}

att.PrintName = "M1911 .400 Cor-Bon Conversion"
att.AbbrevName = ".400 Cor-Bon"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R .400 Cor-Bon Conversion"
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
att.Slot = "ur_m1911_caliber"

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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_400corbon")
end
                                        

                                      
do
    local att = {}

att.PrintName = "M1911 .44 Magnum Conversion"
att.AbbrevName = ".44 Magnum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R .44 Magnum Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/44magnum.png", "smooth mips")
att.Description = "Conversion of the M1911 to the .44 Magnum cartridge, much more powerful than .357 Magnum but has much less range and precision than it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_44mag")
end
                                    

                                             
do
    local att = {}

att.PrintName = "M1911 .44 Percussion Conversion"
att.AbbrevName = ".44 Percussion"

att.SortOrder = 65
att.Icon = Material("entities/att/uc_bullets/44special.png", "smooth mips")
att.Description = "Loose powder, a lead ball rammed down on top of it and a copper cap on the nipple, in a pistol designed sixty years after all of that stopped being a good idea. It works. It works slowly, it works once, and then it needs ten minutes and both hands."
att.Desc_Pros = {
    "Heavy, slow moving ball",
}
att.Desc_Cons = {
    "Glacial to reload and prone to misfire",
    "Very short ranged",
    "Enormous smoke",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".44 Percussion"
att.Override_MuzzleEffect = "muzzleflash_m79"

att.Mult_Damage = 1.2
att.Mult_DamageMin = 0.9
att.Mult_Range = 0.55
att.Mult_RangeMin = 0.6
att.Mult_MuzzleVelocity = 0.5
att.Mult_Recoil = 1.1
att.Mult_RPM = 0.6
att.Mult_ClipSize = 0.6
att.Mult_ReloadTime = 1.9
att.Mult_MalfunctionMean = 0.45
att.Mult_ShootVol = 1.2
att.Mult_ShootPitch = 0.68

local fire = {"weapons/arccw_ur/sw586/fire-01.ogg", "weapons/arccw_ur/sw586/fire-02.ogg", "weapons/arccw_ur/sw586/fire-03.ogg", "weapons/arccw_ur/sw586/fire-04.ogg", "weapons/arccw_ur/sw586/fire-05.ogg", "weapons/arccw_ur/sw586/fire-06.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_44percussion")
end
                                           

                                     
do
    local att = {}

att.PrintName = "M1911 .50 Action Express Conversion"
att.AbbrevName = ".50 Action Express"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R .50 Action Express Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Conversion of the M1911 to the .50 Action Express cartridge, much more powerful than .44 Magnum but has much less range and precision than it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_50ae")
end
                                   

                                           
do
    local att = {}

att.PrintName = "M1911 OSS Bigot Conversion"
att.AbbrevName = "OSS Bigot"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R OSS Bigot Conversion"
end

att.SortOrder = 70
att.Icon = Material("", "smooth mips")
att.Description = "The \"Bigot\" pistol was created during the final years of World War II by the OSS, an American intelligence and special operations organization. Its purpose was to provide commandos and agents with a stealthy option for incapacitating enemy sentries without alerting others nearby, though its practical effectiveness was limited. It was based on the standard M1911 .45 caliber pistol but modified to fire six-inch hollow darts using a .25 ACP blank cartridge. The darts were fitted to a rod inside the pistol barrel, allowing the gas from the blank to propel the projectile silently. The unique design aimed for stealth rather than combat utility, and testing suggested the weapon had limited range and impact."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "102x7mm Darts"

att.Mult_Penetration = 1.25
att.Mult_Range = 1.10
att.Mult_Precision = 2
att.Mult_Recoil = 0.60
att.Mult_MalfunctionMean = 2
att.Mult_PhysBulletMuzzleVelocity = 55
att.Override_PhysTracerProfile = 1
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 2
att.Mult_DamageMin = 0.50
att.Mult_VisualRecoilMult = 0.50
att.Mult_RPM = 0.80
att.Mult_ShootSpeedMult = 2
att.Mult_ClipSize = 1
att.Mult_ReloadTime = 0.75
att.Override_CanFireUnderwater = true
att.ActivateElements = {"bigot"}
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.Health = 1
att.DamageOnShoot = 1
att.Breakable = true
att.Silencer = true

att.Override_ChamberSize = 0
att.Override_ShootEntity = "arccw_uc_bigot_dart"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/bigot_fire.wav"
    else
        return "weapons/misc/bigot_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/misc/bigot_fire.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "bigot_fire.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_bigot_dart")
end
                                         

                                     
do
    local att = {}

att.PrintName = "M1911 Duke Nukem Conversion"
att.AbbrevName = "Duke Nukem"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R Duke Nukem Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/arccw_duke.png", "smooth mips")
att.Description = "This conversion makes a good choice for those who want to kick alien ass and rescue sexy babes.\n\n\"Hail to The King, baby!\""
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "Duke"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 1.14
att.Mult_Range = 1.22
att.Mult_Precision = 1.20
att.Mult_Recoil = 1.32
att.Mult_MalfunctionMean = 1.02
att.Override_PhysBulletMuzzleVelocity = 260
att.Mult_Damage = 1.20
att.Mult_DamageMin = 1.38
att.Mult_ReloadTime = 0.92
att.Override_ClipSize = 20
att.Mult_RPM = 1.37
att.AttachSound = "weapons/m1911_357mag/m1911_duke_equip.ogg"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_duke_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_duke_fire.wav"
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

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_duke")
end
                                   

                                    
do
    local att = {}

att.PrintName = "M1911 Pack-A-Punch Conversion"
att.AbbrevName = "Pack-A-Punch"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R Pack-A-Punch Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/arccw_uc_pap.png", "smooth mips")
att.Description = "Unorthodox conversion that will infuse your little friend with Element 115 and turn it into a fearsome beast.\n\n\"I once tried to climb inside the Pack-a-Punch machine, hoping that it could perhaps enhance me... I failed.\""
att.Desc_Pros = {"Element 115, baby!"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "Pack-A-Punch"

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 75
att.Mult_Range = 4.55
att.Mult_Precision = 3.25
att.Mult_Recoil = 1.87
att.Mult_MalfunctionMean = 2
att.Override_PhysBulletMuzzleVelocity = 745
att.Mult_PhysBulletMuzzleVelocity = 256
att.Override_PhysTracerProfile = 1
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 6.45
att.Mult_DamageMin = 4.50
att.Mult_VisualRecoilMult = 1.15
att.Mult_RPM = 2.5
att.Mult_ShootSpeedMult = 2
att.Mult_ClipSize = 2
att.Mult_ReloadTime = 0.85
att.AttachSound = "weapons/m1911_357mag/m1911_pap_equip.ogg"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_pap_fire_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_pap_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_pap_fire_dist.wav" end
end

local path = "/weapons/m1911_357mag/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "m1911_pap_dist_int.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_1911_cal_pap")
end
                                  

                                         
do
    local att = {}

att.PrintName = "Scattershot Slide"
att.Icon = Material("entities/att/1911_shot_slide.png")
att.Description = "Peculiar slide with heatshield that allows the weapon to load a variety of shotshells."
att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {

}
att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.GivesFlags = {"ud_1911_flaregun"}

att.Mult_Recoil = 1.27
att.Mult_AccuracyMOA = 5
att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.185
att.Override_Num = 4
att.Mult_Range = 0.82
att.Mult_ShootVol = 1.15
att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.ActivateElements = {"ur_1911_slide_shotty"}

att.Add_BarrelLength = 1.05

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/m1911_357mag/1911_flare_slide_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/m1911_357mag/1911_flare_slide_fire.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_1911_flare_barrel")
end
                                       

                                      
do
    local att = {}

att.PrintName = "M1911 Black Grip"
att.AbbrevName = "Black Grip"
att.Icon = Material("","mips smooth")
att.Description = "Just a black, stylish grip."

att.AutoStats = true
att.Slot = "ur_m1911_grip"

att.ActivateElements = {"ur_1911_grip_dark"}

    ArcCW.LoadAttachmentType(att, "ur_1911_grip_dark")
end
                                    

                                     
do
    local att = {}

att.PrintName = "AMAS 100-Round C-Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1911 100-Round C-Mag"
end
att.AbbrevName = "100-Round C-Mag"
att.Icon = Material("entities/att/acwatt_ud_glock_mag_100.png","mips smooth")
att.Description = "A higher capacity twin drum mag increases the time you can spend without reloading."
att.Slot = "ur_m1911_mag"
att.AutoStats = true

att.Override_ClipSize = 100
att.Mult_SightTime = 1.45
att.Mult_ReloadTime = 1.45
att.Mult_Sway = 1.5
att.Mult_SpeedMult = 0.77
att.Mult_ShootSpeedMult = 0.77

att.Mult_HipDispersion = 1.5

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50"
end

att.ActivateElements = {"ur_1911_cmag"}

    ArcCW.LoadAttachmentType(att, "ur_1911_mag_cmag")
end
                                   

                                     
do
    local att = {}

att.PrintName = "AMAS 50-Round Drum Magazine"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1911 50-Round Drum Magazine"
end
att.AbbrevName = "50-Round Drum Mag"
att.Icon = Material("entities/att/ur_mp5/mag50.png","mips smooth")
att.Description = "A higher capacity drum magazine increases the time you can spend without reloading."
att.Slot = "ur_m1911_mag"
att.AutoStats = true

att.Override_ClipSize = 50
att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.25
att.Mult_Sway = 1.3
att.Mult_SpeedMult = 0.87
att.Mult_ShootSpeedMult = 0.85

att.Mult_HipDispersion = 1.3

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50"
end

att.ActivateElements = {"ur_1911_mag_drum"}

    ArcCW.LoadAttachmentType(att, "ur_1911_mag_drum")
end
                                   

                                             
do
    local att = {}

att.PrintName = "AMAS 7-Round Overpressure Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1911 7-Round Overpressure Mag"
end
att.AbbrevName = "7-Round Overpressure Mag"
att.Icon = Material("","mips smooth")
att.Description = "Special magazine loaded with rounds that travel with more force than standard ones. Good for assasinations, idk."
att.Slot = "ur_m1911_mag"
att.AutoStats = true

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.05
att.Mult_Sway = 1.05
att.Mult_PhysBulletMuzzleVelocity = 1.65
att.Mult_Damage = 1.65
att.Mult_DamageMin = 1.55
att.Mult_Range = 1.85
att.Mult_Recoil = 2.50
att.Mult_RPM = 0.86
att.Mult_Penetration = 1.85

    ArcCW.LoadAttachmentType(att, "ur_1911_mag_overpressure")
end
                                           

                                     
do
    local att = {}

att.PrintName = "AMAS 4-Round Mini Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1911 4-Round Mini Mag"
end
att.AbbrevName = "4-Round Mini Mag"
att.Icon = Material("","mips smooth")
att.Description = "A small 4-round magazine that is only compatible with a compact frame."
att.Slot = "ur_m1911_mag"
att.AutoStats = true

att.Override_ClipSize = 4
att.Mult_SightTime = 0.80
att.Mult_ReloadTime = 0.70
att.Mult_Sway = 0.70
att.Mult_SpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.7

att.Mult_HipDispersion = 0.65

att.ActivateElements = {"ur_1911_mag_small"}

att.RequireFlags = {"ur_1911_kit_ultrashort"}

    ArcCW.LoadAttachmentType(att, "ur_1911_mini_mag")
end
                                   

                                        
do
    local att = {}

att.PrintName = "M1911 Chrome Finish"
att.AbbrevName = "Chrome"
att.Icon = Material("","mips smooth")
att.Description = "Flashy chrome finish specific to the AMT Hardballer."
att.SortOrder = 9

att.Desc_Neutrals = {
    "uc.cosmetic"
}

att.AutoStats = true
att.Slot = "ur_m1911_skin"
att.Free = true
att.ActivateElements = {"ur_1911_skin_chrome"}

    ArcCW.LoadAttachmentType(att, "ur_1911_skin_chrome")
end
                                      

                                      
do
    local att = {}

att.PrintName = "M1911 Gold Finish"
att.AbbrevName = "Gold"
att.Icon = Material("","mips smooth")
att.Description = "Flashy gold finish."
att.SortOrder = 9

att.Desc_Neutrals = {
    "uc.cosmetic"
}

att.AutoStats = true
att.Slot = "ur_m1911_skin"
att.Free = true
att.ActivateElements = {"ur_1911_skin_gold"}

    ArcCW.LoadAttachmentType(att, "ur_1911_skin_gold")
end
                                    

                                       
do
    local att = {}

att.PrintName = "Colt 5\" Automatic Slide"
att.AbbrevName = "5\" Auto Slide"
att.Icon = Material("entities/att/uc_1911_auto_slide.png","mips smooth")
att.Description = "Aftermarket slide that converts the weapon to full-auto, increasing firerate at the cost of less accurate firing."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 3.5

att.Mult_DrawTime = 1.03
att.Mult_HolsterTime = 1.03

att.Mult_Sway = 1.07
att.Mult_HipDispersion = 1.02
att.Mult_SightTime = 1.02

att.Mult_AccuracyMOA = 1.07
att.Mult_Recoil = 1.09
att.Mult_ShootPitch = 1.07
att.Mult_ShootVol = 1.05
att.Mult_RPM = 1.22
att.Override_Firemodes = {
    {
        Mode = 2,
    },
}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_auto")
end
                                     

                                        
do
    local att = {}

att.PrintName = "Colt 5\" Burst-Fire Slide"
att.AbbrevName = "5\" Burst Slide"
att.Icon = Material("entities/att/uc_1911_burst_slide.png","mips smooth")
att.Description = "Homebrew slide that converts the weapon to a 3-round burst, increasing fire rate while not sacrificing accuracy."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 3.5

att.Mult_DrawTime = 1.01
att.Mult_HolsterTime = 1.01

att.Mult_SightTime = 1.02

att.Mult_ShootPitch = 1.14
att.Mult_ShootVol = 1.06
att.Mult_RPM = 1.36

att.Override_Firemodes = {
    {
        Mode = -3,
    },
}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_burst")
end
                                      

                                           
do
    local att = {}

att.PrintName = "Colt 7\" Competition Slide (Alt)"
att.AbbrevName = "7\" Competition Slide (Alt)"
att.Icon = Material("","mips smooth")
att.Description = "Aftermarket shroud and barrel kit that remove the gas system. Requires manual action to operate."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 9

att.Mult_DrawTime = 1.01
att.Mult_HolsterTime = 1.01
att.Add_BarrelLength = 2

att.Mult_Sway = 0.80
att.Mult_HipDispersion = 0.85
att.Mult_SightTime = 1.15
att.Mult_PhysBulletMuzzleVelocity = 2.50
att.Mult_RecoilSide = 0.8

att.Mult_AccuracyMOA = 0.80
att.Mult_Range = 1.35
att.Mult_Recoil = 0.75
att.Mult_ShootPitch = 0.85
att.Mult_ShootVol = 1.10
att.Mult_RPM = 0.90

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

att.ActivateElements = {"ur_1911_slide_comp1", "ur_1911_slide_comp2"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_comp_alt")
end
                                         

                                       
do
    local att = {}

att.PrintName = "Colt 7\" Competition Slide"
att.AbbrevName = "7\" Competition Slide"
att.Icon = Material("","mips smooth")
att.Description = "Aftermarket shroud and barrel kit that improve the gas system."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 9

att.Mult_DrawTime = 1.01
att.Mult_HolsterTime = 1.01
att.Add_BarrelLength = 2

att.Mult_Sway = 0.80
att.Mult_HipDispersion = 0.85
att.Mult_SightTime = 1.15
att.Mult_PhysBulletMuzzleVelocity = 2.25
att.Mult_RecoilSide = 0.8

att.Mult_AccuracyMOA = 0.80
att.Mult_Range = 1.25
att.Mult_Recoil = 0.80
att.Mult_ShootPitch = 0.85
att.Mult_ShootVol = 1.10
att.Mult_RPM = 0.90

att.ActivateElements = {"ur_1911_slide_comp1", "ur_1911_slide_comp2"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_comp")
end
                                     

                                                  
do
    local att = {}

att.PrintName = "16\" AMT Hardballer Slide"
att.AbbrevName = "16\" Hardballer Slide"
att.Icon = Material("","mips smooth")
att.Description = "Slide assembly that converts the Colt 1911 into an AMT Hardballer with an even longer slide."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 12

att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25
att.Add_BarrelLength = 11

att.Mult_Sway = 0.60
att.Mult_HipDispersion = 0.60
att.Mult_SightTime = 1.35
att.Mult_PhysBulletMuzzleVelocity = 2.80
att.Mult_RecoilSide = 0.6

att.Mult_AccuracyMOA = 0.70
att.Mult_Range = 1.40
att.Mult_Recoil = 0.575
att.Mult_ShootPitch = 0.75
att.Mult_ShootVol = 1.35
att.Mult_RPM = 0.80

att.ActivateElements = {"ur_1911_slide_hardballer_long"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_hardballer_long")
end
                                                

                                             
do
    local att = {}

att.PrintName = "12\" AMT Hardballer Slide"
att.AbbrevName = "12\" Hardballer Slide"
att.Icon = Material("","mips smooth")
att.Description = "Slide assembly that converts the Colt 1911 into an AMT Hardballer with a long slide."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 12

att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15
att.Add_BarrelLength = 7

att.Mult_Sway = 0.70
att.Mult_HipDispersion = 0.75
att.Mult_SightTime = 1.25
att.Mult_PhysBulletMuzzleVelocity = 2.55
att.Mult_RecoilSide = 0.7

att.Mult_AccuracyMOA = 0.80
att.Mult_Range = 1.25
att.Mult_Recoil = 0.70
att.Mult_ShootPitch = 0.80
att.Mult_ShootVol = 1.20
att.Mult_RPM = 0.85

att.ActivateElements = {"ur_1911_slide_hardballer"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_hardballer")
end
                                           

                                           
do
    local att = {}

att.PrintName = "Colt 2\" Micro Kit"
att.AbbrevName = "2\" Micro Kit"
att.Icon = Material("","mips smooth")
att.Description = "Extremely small slide and frame that maximizes the potential for concealment."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 2

att.Mult_DrawTime = 0.65
att.Mult_HolsterTime = 0.65
att.Add_BarrelLength = -2.5

att.Mult_Sway = 0.55
att.Mult_HipDispersion = 0.65
att.Mult_SightTime = 0.50

att.Mult_AccuracyMOA = 2
att.Mult_Range = 0.65
att.Mult_Recoil = 1.55

att.ActivateElements = {"ur_1911_kit_ultrashort"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_microkit")
end
                                         

                                     
do
    local att = {}

att.PrintName = "Colt 7\" SD Slide"
att.AbbrevName = "7\" SD Slide"
att.Icon = Material("","mips smooth")
att.Description = "Aftermarket suppressed slide."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 9

att.Mult_DrawTime = 1.05
att.Mult_HolsterTime = 1.05
att.Add_BarrelLength = 2

att.Mult_Sway = 0.90
att.Mult_HipDispersion = 0.95
att.Mult_SightTime = 1.10
att.Mult_PhysBulletMuzzleVelocity = 2
att.Mult_RecoilSide = 0.95

att.Mult_AccuracyMOA = 0.95
att.Mult_Range = 1.25
att.Mult_Recoil = 0.90
att.Mult_ShootPitch = 1.15
att.Mult_ShootVol = 0.80
att.Mult_RPM = 0.95
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

att.ActivateElements = {"ur_1911_slide_sd"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_sd")
end
                                   

                                        
do
    local att = {}

att.PrintName = "Colt 2\" Micro Slide"
att.AbbrevName = "2\" Micro Slide"
att.Icon = Material("","mips smooth")
att.Description = "Extremely small slide that does not make the grip and frame smaller."

att.AutoStats = true
att.Slot = "ur_m1911_slide"
att.SortOrder = 2

att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85
att.Add_BarrelLength = -2.5

att.Mult_Sway = 0.60
att.Mult_HipDispersion = 0.75
att.Mult_SightTime = 0.65

att.Mult_AccuracyMOA = 1.7
att.Mult_Range = 0.65
att.Mult_Recoil = 1.35

att.ActivateElements = {"ur_1911_slide_ultrashort"}

    ArcCW.LoadAttachmentType(att, "ur_1911_slide_small")
end
                                      

                                      
do
    local att = {}

att.PrintName = "AMAS 4-Round California Compliant Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1911 4-Round California Compliant Mag"
end
att.AbbrevName = "4-Round California Compliant"
att.Icon = Material("entities/att/1911_smallmag.png","mips smooth")
att.Description = "A regular-sized M1911 magazine that has been filled in to prevent loading too many rounds, in order to comply with certain gun laws.\n While it does clearly bring you a clip size handicap, the smaller amount of cartridges loaded makes reloading a breeze."
att.Slot = "ur_m1911_mag"
att.AutoStats = true

att.Override_ClipSize = 4
att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 0.75
att.Mult_SpeedMult = 1.02
att.Mult_ShootSpeedMult = 1.5

att.Mult_HipDispersion = 0.75

    ArcCW.LoadAttachmentType(att, "ur_1911_small_mag")
end
                                    

                                        
do
    local att = {}

att.PrintName = "10\" Model 629 Handguard Barrel"
att.AbbrevName = "10\" Handguard Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "10\" Companion .44 Handguard Barrel"
end
att.Icon = Material("entities/att/acwatt_ur_329_barrel_m29.png","smooth mips")
att.Description = "Even longer barrel with a built in handguard."

att.Slot = "ur_329_barrel"
att.AutoStats = true
att.SortOrder = 10

att.LHIK = true

att.ModelOffset = Vector(0, 0, -0.75)

att.Model = "models/vergi_arccw/anglegrip_lhik.mdl"

att.Mult_AccuracyMOA = 0.80
att.Mult_Range = 1.6
att.Mult_Recoil = 0.60
att.Mult_SightTime = 0.85
att.Mult_Sway = 0.85
att.Mult_HipDispersion = 0.9
att.Mult_PhysBulletMuzzleVelocity = 0.85

att.Add_BarrelLength = -1

att.Mult_DrawTime = 1.10
att.Mult_HolsterTime = 1.10

att.ActivateElements = {"ur_329_barrel_flash"}

    ArcCW.LoadAttachmentType(att, "ur_329_barrel_flash")
end
                                      

                                         
do
    local att = {}

att.PrintName = "3\" Model 629 Pocket Barrel"
att.AbbrevName = "3\" Pocket Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "3\" Companion .44 Pocket Barrel"
end
att.Icon = Material("entities/att/acwatt_ur_329_barrel_m29.png","smooth mips")
att.Description = "Even shorter barrel, associated with police officers. Being as compact as possible improves draw time, but the barrel cannot handle gas expansion well."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ur_329_barrel"
att.AutoStats = true
att.SortOrder = 3

att.Mult_AccuracyMOA = 1.3
att.Mult_Range = 0.75
att.Mult_Recoil = 1.3
att.Mult_SightTime = 0.85
att.Mult_Sway = 0.85
att.Mult_HipDispersion = 0.9
att.Mult_PhysBulletMuzzleVelocity = 0.85

att.Add_BarrelLength = -1

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

    ArcCW.LoadAttachmentType(att, "ur_329_barrel_pocket")
end
                                       

                                          
do
    local att = {}

att.PrintName = "4\" R.E.M.O.V.E.R. Barrel"
att.AbbrevName = "4\" R.E.M.O.V.E.R. Barrel"

att.Icon = Material("entities/att/acwatt_ur_329_barrel_m29.png","smooth mips")
att.Description = "Experimental barrel that can, in theory, completely remove any living organism in a single shot. The large screen affixed to the gun makes it unable to aim and harder to conceal. \n\n Legend says that the divine being known as \"Garry\" has created the weapon which this barrel once belonged to, as a way to create (or in this case destroy) anything in a pinch, without putting in much effort. Being a sacred relic and all, this attachment cannot be used by inferior beings such as NPCs (this is quite literally, as they won't be able to equip a weapon that uses this barrel)."

att.Slot = "ur_329_barrel"
att.AutoStats = true
att.SortOrder = 4

att.Mult_AccuracyMOA = 0.15
att.Mult_Range = 8555
att.Mult_Recoil = 3.5
att.Mult_SightTime = 0.85
att.Mult_Sway = 0.15
att.Mult_HipDispersion = 0.15
att.Mult_Damage = 5555
att.Mult_DamageMin = 5255
att.Mult_Precision = 7555
att.Mult_PhysBulletMuzzleVelocity = 99999
att.Mult_RPM = 0.85
att.Mult_Penetration = 5555
att.NotForNPCs = true

att.Hook_ShouldNotSight = function(wep)
    return true
end

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return
    else
        return {
            "weapons/misc/329_remover_fire.wav"
        }
    end
end

att.ActivateElements = {"ur_329_barrel_remover","ur_329_removerlogo"}

    ArcCW.LoadAttachmentType(att, "ur_329_barrel_remover")
end
                                        

                                     
do
    local att = {}

att.PrintName = "8\" SD Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "8\" SD Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_m16_barrel_sd.png", "smooth mips")
att.Description = "Suppressed barrel for the M329, totally not salvaged off of a MP5SD and cut off."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.overheat"
}
att.Desc_Neutrals = {
    "uc.supptail",
}
att.Slot = "ur_329_barrel"

att.AutoStats = true

att.Mult_SightTime = 1.10

att.Mult_Recoil = 0.90
att.Mult_AccuracyMOA = 1.1
att.Mult_RPM = 1.15
att.Mult_HipDispersion = 0.65

att.Add_BarrelLength = 1
att.Mult_PhysBulletMuzzleVelocity = 0.90

att.LHIK = true

att.Mult_ShootVol = 0.85
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.ActivateElements = {"ur_329_barrel_sd"}

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_barrel_sd")
end
                                   

                                        
do
    local att = {}

att.PrintName = "Model 329PD .22 Long Rifle Chambering"
att.AbbrevName = ".22 LR"
att.Icon = Material("entities/att/uc_bullets/22lr.png","smooth mips")
att.Description = "Converts the weapon to the lighter and weaker .22LR round used for plinking."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .22 Long Rifle Chambering"
end

att.AutoStats = true
att.Slot = "ur_329_caliber"

att.Mult_RangeMin = 1.22
att.Mult_Range = 1.19
att.Mult_Recoil = 0.35
att.Override_PhysBulletMuzzleVelocity = 342
att.Mult_Penetration = 1.04
att.Mult_Damage = 0.30
att.Mult_DamageMin = 0.20
att.Mult_Precision = 0.70
att.Mult_ReloadTime = 0.82
att.Override_PhysTracerProfile = "uc_plinking"

att.Override_Trivia_Calibre = ".22 Long Rifle"

local path = "weapons/revolver_38_detective/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_22lr_fire_sup.wav"
    else
        return {
            path .. "329_22lr_fire.wav"
        }
    end
end

local tail = ")^/weapons/revolver_38_detective/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "22lr_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_22lr")
end
                                      

                                        
do
    local att = {}

att.PrintName = "Model 329PD .32-20 Winchester Chambering"
att.AbbrevName = ".32-20 Winchester"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "An 1882 rifle cartridge that revolvers were chambered for so a rancher could carry one box of ammunition for two guns. Mild, accurate, and thoroughly obsolete for about ninety years now.\n\nTags the target for five seconds and follow-up hits do 80 percent more. On its own it is weak, so the first shot is a setup and the rest are the payoff. Very light recoil helps you land them."
att.Desc_Pros = {
    "Follow-up hits are far stronger",
    "Almost no recoil",
}
att.Desc_Cons = {
    "Weak on the first hit",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_329_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".32-20 Winchester"
att.Mult_Damage = 0.72
att.Mult_DamageMin = 0.7
att.Mult_Penetration = 0.9
att.Mult_Range = 1.15
att.Mult_Recoil = 0.5
att.Mult_RecoilSide = 0.5
att.Mult_VisualRecoilMult = 0.55
att.Mult_RPM = 1.25
att.Mult_ClipSize = 1.2
att.Mult_AccuracyMOA = 0.8
att.Mult_ShootPitch = 1.18

local TAG_TIME = 5
local TAG_MULT = 1.8

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    if (ent.UC_TagUntil or 0) > CurTime() then
        hit.damage = hit.damage * TAG_MULT
    end

    ent.UC_TagUntil = CurTime() + TAG_TIME

    return hit
end
att.Mult_ShootVol = 0.8

local fire = {"weapons/arccw_ur/sw586/fire-01.ogg", "weapons/arccw_ur/sw586/fire-02.ogg", "weapons/arccw_ur/sw586/fire-03.ogg", "weapons/arccw_ur/sw586/fire-04.ogg", "weapons/arccw_ur/sw586/fire-05.ogg", "weapons/arccw_ur/sw586/fire-06.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_3220")
end
                                      

                                                
do
    local att = {}

att.PrintName = "Model 329PD .38 Special Chambering"
att.AbbrevName = ".38 Special"
att.Icon = Material("entities/att/uc_bullets/454casull.png","smooth mips")
att.Description = "Known for its accuracy and manageable recoil, the .38 Special cartridge saw use in both world wars and is one of the most common revolver cartridges in the world. It is used for recreational target shooting, formal target competition, personal defense, and small-game hunting. \n\n It is also known for being the round of choice for a certain lieutenant wearing a beige coat... \n\n\"You know, ma'am, I never carry a gun. If people knew that, I'd probably be out of business.\""

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .38 Special Chambering"
end

att.AutoStats = true
att.Slot = "ur_329_caliber"

att.Mult_RangeMin = 1.19
att.Mult_Range = 1.23
att.Mult_Recoil = 1.03
att.Override_PhysBulletMuzzleVelocity = 385
att.Mult_Penetration = 1.08
att.Mult_Damage = 1.21
att.Mult_DamageMin = 1.31
att.Mult_Precision = 1.14
att.Mult_ReloadTime = 0.97

att.Override_Trivia_Calibre = ".38 Special"

local path = "weapons/revolver_38_detective/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_duke_sup.wav"
    else
        return {
            path .. "38_detective_fire.wav"
        }
    end
end

local tail = ")^/weapons/revolver_38_detective/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "38_detective_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_38_detective")
end
                                              

                                       
do
    local att = {}

att.PrintName = "Model 329PD .410 Bore Chambering"
att.AbbrevName = ".410 Bore"
att.Icon = Material("entities/att/uc_bullets/20g.png","smooth mips")
att.Description = "Custom cylinder dimensions meant for a niche Brazillian revolver pattern, chambered for .410 shotshells."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .410 Bore Chambering"
end

att.AutoStats = true
att.Desc_Pros = {
    "ur.deagle.410.1"
}
att.Desc_Cons = {
    "ur.deagle.410.2"
}
att.Slot = "ur_329_caliber"
att.SortOrder = -2

att.Override_Num = 4
att.Mult_Range = 0.5
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0
att.Override_ClipSize = 5
att.Mult_Recoil = 0.75

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17

att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_Penetration = 1

att.Override_IsShotgun = true
att.Override_Ammo = "buckshot"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_Trivia_Calibre = att.AbbrevName

local slotinfo = {
    [6] = {"\"BUCK\" #000 Buckshot", "\"BUCK\" #000 Buckshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
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
att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/329_shotgun_fire_sup.wav"
    else
        return {"weapons/arccw_ur/deagle/fire-410-01.ogg", "weapons/arccw_ur/deagle/fire-410-02.ogg", "weapons/arccw_ur/deagle/fire-410-03.ogg", "weapons/arccw_ur/deagle/fire-410-04.ogg", "weapons/arccw_ur/deagle/fire-410-05.ogg", "weapons/arccw_ur/deagle/fire-410-06.ogg"}
    end
end
att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {"arccw_uc/common/fire-dist-int-pistol-heavy-01.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-02.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-03.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-04.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-05.ogg", "arccw_uc/common/fire-dist-int-pistol-heavy-06.ogg"}
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_410")
end
                                     

                                               
do
    local att = {}

att.PrintName = "Model 329PD .45 Long Colt Chambering"
att.AbbrevName = ".45 Long Colt"
att.Icon = Material("entities/att/uc_bullets/357magnum.png","smooth mips")
att.Description = "This cartridge was adopted by the U.S. Army in 1873 and served as an official US military handgun cartridge for 19 years, before being replaced by the .38 Long Colt in 1892."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .45 Long Colt Chambering"
end

att.AutoStats = true
att.Slot = "ur_329_caliber"

att.Mult_RangeMin = 1.45
att.Mult_Range = 1.51
att.Mult_Recoil = 1.25
att.Override_PhysBulletMuzzleVelocity = 465
att.Mult_Penetration = 1.34
att.Mult_Damage = 1.20
att.Mult_DamageMin = 1.37
att.Mult_Precision = 1.24
att.Mult_ReloadTime = 1.05

att.Override_Trivia_Calibre = ".45 Long Colt"

local path = "weapons/revolver_38_detective/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_50ae_sup.wav"
    else
        return {
            path .. "329_45_fire.wav"
        }
    end
end

local tail = ")^/weapons/revolver_38_detective/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "45_longcolt_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_45_longcolt")
end
                                             

                                             
do
    local att = {}

att.PrintName = "Model 329PD .455 Webley Chambering"
att.AbbrevName = ".455 Webley"

att.SortOrder = 66
att.Icon = Material("entities/att/uc_bullets/44special.png", "smooth mips")
att.Description = "A fat, slow lead bullet that the British Army carried through two world wars on the principle that a man hit by it stops doing whatever he was doing. It travels barely faster than a thrown cricket ball and lands like a dropped anvil."
att.Desc_Pros = {
    "Tremendous stopping power up close",
    "Mild, rolling recoil",
}
att.Desc_Cons = {
    "Very short effective range",
    "Will not penetrate",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_329_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".455 Webley"
att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.1
att.Mult_Penetration = 0.8
att.Mult_Range = 0.7
att.Mult_RangeMin = 0.75
att.Mult_MuzzleVelocity = 0.6
att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 0.9
att.Mult_RPM = 0.95
att.Mult_AccuracyMOA = 1.1
att.Mult_ShootPitch = 0.82
att.Mult_ShootVol = 1.05

local fire = {"weapons/arccw_ur/sw586/fire-01.ogg", "weapons/arccw_ur/sw586/fire-02.ogg", "weapons/arccw_ur/sw586/fire-03.ogg", "weapons/arccw_ur/sw586/fire-04.ogg", "weapons/arccw_ur/sw586/fire-05.ogg", "weapons/arccw_ur/sw586/fire-06.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_455webley")
end
                                           

                                             
do
    local att = {}

att.PrintName = "Model 329PD .475 Wildey Magnum Chambering"
att.AbbrevName = ".475 Wildey Magnum"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/454casull.png", "smooth mips")
att.Description = "Wildey Moore's gas operated magnum, best known for being the pistol Charles Bronson carries in Death Wish 3. The cartridge is a cut down rifle case and it does exactly what the film suggests.\n\nThrows whatever you hit backwards and does 70 percent more damage. Very few rounds and heavy recoil, so make them count."
att.Desc_Pros = {
    "Knocks targets backwards",
    "70 percent more damage",
}
att.Desc_Cons = {
    "Heavy recoil",
    "Very few rounds",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_329_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".475 Wildey Magnum"
att.Mult_Damage = 1.7
att.Mult_DamageMin = 1.6
att.Mult_Penetration = 1.6
att.Mult_Range = 1.35
att.Mult_Recoil = 1.85
att.Mult_RecoilSide = 1.5
att.Mult_VisualRecoilMult = 1.75
att.Mult_RPM = 0.7
att.Mult_ClipSize = 0.7
att.Mult_ReloadTime = 1.2
att.Mult_ShootVol = 1.4
att.Mult_ShootPitch = 0.7

local SHOVE = 520

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local dir = hit.tr.Normal
    dir.z = 0
    dir:Normalize()

    ent:SetVelocity(dir * SHOVE + Vector(0, 0, SHOVE * 0.25))

    return hit
end

local fire = {"weapons/arccw_ur/sw586/fire-01.ogg", "weapons/arccw_ur/sw586/fire-02.ogg", "weapons/arccw_ur/sw586/fire-03.ogg", "weapons/arccw_ur/sw586/fire-04.ogg", "weapons/arccw_ur/sw586/fire-05.ogg", "weapons/arccw_ur/sw586/fire-06.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_475wildey")
end
                                           

                                         
do
    local att = {}

att.PrintName = "Model 329PD .500 S&W Magnum Chambering"
att.AbbrevName = ".500 S&W Magnum"
att.Icon = Material("entities/att/uc_bullets/30carbine.png","smooth mips")
att.Description = "This cartridge was adopted by the U.S. Army in 1873 and served as an official US military handgun cartridge for 19 years, before being replaced by the .38 Long Colt in 1892."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .500 S&W Magnum Chambering"
end

att.AutoStats = true
att.Slot = "ur_329_caliber"

att.Mult_RangeMin = 1.75
att.Mult_Range = 2.45
att.Mult_Recoil = 1.75
att.Override_PhysBulletMuzzleVelocity = 855
att.Mult_Penetration = 1.85
att.Mult_Damage = 1.75
att.Mult_DamageMin = 1.85
att.Mult_Precision = 1.675
att.Mult_ReloadTime = 1.10

att.Override_Trivia_Calibre = ".500 S&W Magnum"

local path = "weapons/revolver_38_detective/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_50ae_sup.wav"
    else
        return {
            "weapons/misc/329_500sw_fire.wav"
        }
    end
end

local tail = ")^/weapons/revolver_38_detective/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "45_longcolt_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_500sw")
end
                                       

                                             
do
    local att = {}

att.PrintName = "Model 329PD 7.62mm Nagant Chambering"
att.AbbrevName = "7.62mm Nagant"
att.Icon = Material("entities/att/uc_bullets/429de.png","smooth mips")
att.Description = "These rounds are the Soviet alternative to any magnum round, offers slightly more punch than rounds like .45 Long Colt but has somewhat shorter range and has a slight risk of jamming due to the chamber size being inadequate."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement 7.62mm Nagant Chambering"
end

att.AutoStats = true
att.Slot = "ur_329_caliber"

att.Mult_RangeMin = 1.24
att.Mult_Range = 1.22
att.Mult_Recoil = 1.38
att.Override_PhysBulletMuzzleVelocity = 212
att.Mult_Penetration = 1.43
att.Mult_Damage = 1.28
att.Mult_DamageMin = 1.34
att.Mult_Precision = 1.11
att.Mult_ReloadTime = 1.02
att.Mult_MalfunctionMean = 0.88
att.Mult_VisualRecoilMult = 1.22

att.Override_Trivia_Calibre = "7.62mm Nagant"

local path = "weapons/revolver_38_detective/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/deagle_50bmg_fire_sup.wav"
    else
        return {
            path .. "762_nagant_fire.wav"
        }
    end
end

local tail = ")^/weapons/revolver_38_detective/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "762_nagant_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_762nagant")
end
                                           

                                             
do
    local att = {}

att.PrintName = "Model 329PD .44 Snakeshot Chambering"
att.AbbrevName = ".44 Snakeshot"
att.Icon = Material("entities/att/uc_bullets/44special.png","smooth mips")
att.Description = "Rounds containing small lead shots. Due to bullet diameter and barrel length, this round has an extremely low effective range.\nAs its name implies, it's mostly useful for shooting snakes and rodents only."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .44 Snakeshot Chambering"
end

att.AutoStats = true
att.Desc_Pros = {
    "ur.329.snakeshot.1"
}
att.Desc_Cons = {
    "ur.329.snakeshot.2",
    "ur.329.snakeshot.3"
}
att.Slot = "ur_329_caliber"
att.SortOrder = -1

att.Override_Num = 4
att.Override_AccuracyMOA = 65
att.Override_AccuracyMOA_Priority = 0

att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_Penetration = 1

att.Mult_Damage = 70 / 60

att.Mult_Range = 0.4
att.Mult_RangeMin = 2

att.Mult_PhysBulletMuzzleVelocity = 0.6

att.Override_Trivia_Calibre = att.AbbrevName

local slotinfo = {
    [6] = {"\"SS\" Snakeshot", "\"SS\" Snakeshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
}
att.Hook_GetDefaultAttName = function(wep, slot)
    if slotinfo[slot] then
        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
    end
end

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/329_shotgun_fire_sup.wav"
    else
        return {"weapons/arccw_ur/deagle/fire-410-01.ogg", "weapons/arccw_ur/deagle/fire-410-02.ogg", "weapons/arccw_ur/deagle/fire-410-03.ogg", "weapons/arccw_ur/deagle/fire-410-04.ogg", "weapons/arccw_ur/deagle/fire-410-05.ogg", "weapons/arccw_ur/deagle/fire-410-06.ogg"}
    end
end

att.GivesFlags = {"329_ss"}

    ArcCW.LoadAttachmentType(att, "ur_329_caliber_snakeshot")
end
                                           

                                              
do
    local att = {}

att.PrintName = "Model 329PD Polymer Grip"
att.AbbrevName = "Polymer Grip"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Enforcement .44 Polymer Grip"
end
att.Icon = Material("entities/att/acwatt_ur_deagle_grip_plastic.png","mips smooth")
att.Description = "Polymer grip which improves handling at the cost of increased recoil."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ur_329_grip"
att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.1

att.Mult_SightTime = 0.85
att.Mult_DrawTime = 0.9
att.Mult_HolsterTime = 0.9

att.ActivateElements = {"grip_poly"}

    ArcCW.LoadAttachmentType(att, "ur_329_grip_polymer_fixed")
end
                                            

                                    
do
    local att = {}

att.PrintName = "Express-12 .22 Long Rifle Conversion"
att.AbbrevName = ".22 Long Rifle"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 .22 Long Rifle Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "Load the shotgun into a common plinking caliber. Probably good for hunting, i dunno."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_Trivia_Class = "Sporting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_PhysTracerProfile = "uc_plinking"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
att.Override_Ammo = "pistol"
att.GivesFlags = {"ud_870_nonshotgun"}

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.09
att.Mult_Precision = 1.13
att.Mult_Recoil = 0.64
att.Mult_MalfunctionMean = 0.93
att.Mult_Damage = 0.12
att.Mult_DamageMin = 0.14
att.Mult_CycleTime = 0.75
att.Mult_VisualRecoilMult = 0.78
att.Mult_RPM = 1.25
att.Mult_ClipSize = 4.09
att.Mult_ReloadTime = 0.65
att.Mult_ShootPitch = 1.04
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_22lr_fire.wav"
    else
        return "weapons/misc/r870_22lr_fire_sup.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_9mm_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_9mm_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_22lr")
end
                                  

                                    
do
    local att = {}

att.PrintName = "Express-760 .30-06 Conversion"
att.AbbrevName = ".30-06"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 7600 .30-06 Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/3006springfield.png", "smooth mips")
att.Description = "The Model 7600, chambered in .30-06 Springfield, is a well-regarded pump-action centerfire rifle produced by Remington Arms from 1981 to 2020. it has been many's favorite for hunting and sport shooting, boasting a high range and penetration."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".30-06 Sprinfield"
att.Override_Trivia_Class = "Hunting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"ud_870_nonshotgun"}

att.Mult_AccuracyMOA = 0.76
att.Mult_Penetration = 3.25
att.Mult_Range = 1.65
att.Mult_Precision = 1.45
att.Mult_Recoil = 1.20
att.Mult_MalfunctionMean = 0.78
att.Mult_CycleTime = 1.18
att.Mult_Damage = 1.47
att.Mult_DamageMin = 1.34
att.Mult_VisualRecoilMult = 1.15
att.Mult_RPM = 0.86
att.Mult_ClipSize = 0.98
att.Mult_ReloadTime = 1.17
att.Mult_ShootPitch = 0.98
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_3006_fire_sup.wav"
    else
        return "weapons/misc/r870_3006_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_4bore_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_4bore_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_3006")
end
                                  

                                    
do
    local att = {}

att.PrintName = "Remington 870 .30-30 Winchester Conversion"
att.AbbrevName = ".30-30 Winchester"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Express-12 .30-30 Winchester Conversion"
end

att.SortOrder = 72
att.Icon = Material("entities/att/uc_bullets/3030winchester.png", "smooth mips")
att.Description = "The round that has shot more deer than any other, in a gun that was never meant to fire it. Nothing about this is a good idea and it works perfectly well."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = ".30-30 Winchester"
att.Override_Trivia_Class = "Sporting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/366tkm.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ud_870_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 2.1
att.Mult_DamageMin = 2.6
att.Mult_Range = 1.9
att.Mult_Penetration = 5.5
att.Mult_AccuracyMOA = 0.42
att.Mult_HipDispersion = 1.05
att.Mult_Recoil = 0.95
att.Mult_VisualRecoilMult = 0.95
att.Mult_RPM = 0.95
att.Mult_ClipSize = 1.15
att.Mult_ReloadTime = 0.95
att.Mult_ShootPitch = 0.88
att.Mult_ShootVol = 1.3

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

    ArcCW.LoadAttachmentType(att, "ur_870_cal_3030")
end
                                  

                                    
do
    local att = {}

att.PrintName = "Express-12 40mm HE Conversion"
att.AbbrevName = "40mm HE"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 40mm HE Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/40.png", "smooth mips")
att.Description = "\"- Papa, papa, i want a China Lake plsssssss \" \n\n \"- Don't worry son, we've got China Lake at home!\" \n\n The China Lake at home:"
att.Desc_Pros = {
}
att.Desc_Cons = {"This is so fucking cursed"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "40mm High-Explosive Grenade"
att.Override_Trivia_Class = "Grenade Launcher"
att.Override_Ammo = "SMG1_Grenade"
att.GivesFlags = {"ud_870_nonshotgun", "ud_870_40mm"}

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.55
att.Mult_Precision = 1.35
att.Mult_Recoil = 1.55
att.Mult_MalfunctionMean = 0.83
att.Override_PhysBulletMuzzleVelocity = 325
att.Mult_PhysBulletMuzzleVelocity = 156
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 1.45
att.Mult_DamageMin = 1.40
att.Mult_CycleTime = 1.20
att.Mult_VisualRecoilMult = 1.05
att.Mult_RPM = 0.80
att.Mult_ClipSize = 0.97
att.Mult_ReloadTime = 1.35
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Mult_MuzzleVelocity = 125
att.Mult_ShootPitch = 0.99
att.Override_Num = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 4.5

local common = ")/arccw_uc/common/"

att.Override_ShellSounds = {common .. "40mm_casing_1.ogg"}

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "sgreload_insert") then
        return anim .. "_40mm"
    end
end

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_40mm_fire.wav"
    else
        return "weapons/misc/r870_40mm_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_40mm_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_40mm_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_40mm")
end
                                  

                                     
do
    local att = {}

att.PrintName = "Express-12 4 Bore Conversion"
att.AbbrevName = "4 Bore"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 4 Bore Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/44special.png", "smooth mips")
att.Description = "The 4 bore ammunition, with its 1-inch diameter and 4-inch case length, is one of the largest and most powerful cartridges ever made. It was used in the 19th and early 20th centuries for hunting large and potentially dangerous game like elephants and rhinoceroses, prized for its immense stopping power. It also found industrial uses, such as breaking ice and removing tree stumps. \n\n Despite its formidable power, the 4 bore has significant drawbacks. The recoil is extremely powerful, requiring a strong firearm and proper technique to manage."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "4 Bore"
att.Override_Trivia_Class = "Hunting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"ud_870_nonshotgun"}

att.Mult_AccuracyMOA = 0.72
att.Mult_Penetration = 6.50
att.Mult_Range = 1.42
att.Mult_Precision = 1.36
att.Mult_Recoil = 1.36
att.Mult_MalfunctionMean = 0.78
att.Mult_CycleTime = 1.18
att.Mult_Damage = 1.62
att.Mult_DamageMin = 1.66
att.Mult_VisualRecoilMult = 1.23
att.Mult_RPM = 0.82
att.Mult_ClipSize = 0.97
att.Mult_ReloadTime = 1.17
att.Mult_ShootPitch = 0.99
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_4bore_fire_sup.wav"
    else
        return "weapons/misc/r870_4bore_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_4bore_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_4bore_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_4bore")
end
                                   

                                         
do
    local att = {}

att.PrintName = "Remington 870 .50 Beowulf Conversion"
att.AbbrevName = ".50 Beowulf"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Express-12 .50 Beowulf Conversion"
end

att.SortOrder = 71
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A fat, slow, straight-walled slug built so that people in states with silly rules could still shoot deer. Out of a pump gun it hits like the buckshot did, except all of it arrives in the same place."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "Very little in the tube",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = ".50 Beowulf"
att.Override_Trivia_Class = "Sporting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ud_870_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 2.9
att.Mult_DamageMin = 3.4
att.Mult_Range = 1.35
att.Mult_Penetration = 4.5
att.Mult_AccuracyMOA = 0.55
att.Mult_HipDispersion = 0.9
att.Mult_Recoil = 1.35
att.Mult_VisualRecoilMult = 1.2
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.62
att.Mult_ReloadTime = 1.05
att.Mult_ShootPitch = 0.75
att.Mult_ShootVol = 1.45

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

    ArcCW.LoadAttachmentType(att, "ur_870_cal_50beowulf")
end
                                       

                                   
do
    local att = {}

att.PrintName = "Express-12 9x19mm Parabellum Conversion"
att.AbbrevName = "9x19mm Parabellum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 9x19mm Parabellum Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "Load the shotgun into a common pistol caliber. Probably good for hunting, i dunno."
att.Desc_Pros = {
}
att.Desc_Cons = {"No spread for you"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_Trivia_Class = "Sporting Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.Override_Ammo = "pistol"
att.GivesFlags = {"ud_870_nonshotgun"}

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.12
att.Mult_Precision = 1.17
att.Mult_Recoil = 0.86
att.Mult_MalfunctionMean = 0.93
att.Mult_CycleTime = 0.85
att.Mult_Damage = 0.23
att.Mult_DamageMin = 0.20
att.Mult_VisualRecoilMult = 0.90
att.Mult_RPM = 1.15
att.Mult_ClipSize = 3.09
att.Mult_ReloadTime = 0.75
att.Mult_ShootPitch = 1.03
att.Override_Num = 1

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_fire_9mm_sup.wav"
    else
        return "weapons/misc/r870_9mm_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_9mm_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_9mm_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_9mm")
end
                                 

                                   
do
    local att = {}

att.PrintName = "Express-12 40mm VOG Conversion"
att.AbbrevName = "40mm VOG"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 40mm VOG Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/40vog.png", "smooth mips")
att.Description = "Loads the shotgun into soviet 40mm VOG grenades, which are caseless. \n\n This means you have room for one more grenade inside the feeding tube because of the lower volume occupied. Additionally, this ejects no casing, loads much faster and cycles a bit faster, but it doesn't have as much range and power as 40mm HE."
att.Desc_Pros = {
}
att.Desc_Cons = {"This is so fucking cursed"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "40mm VOG Grenade"
att.Override_Trivia_Class = "Grenade Launcher"
att.Override_Ammo = "SMG1_Grenade"
att.GivesFlags = {"ud_870_nonshotgun", "ud_870_40mm"}

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.40
att.Mult_Precision = 1.30
att.Mult_Recoil = 1.40
att.Mult_MalfunctionMean = 0.88
att.Override_PhysBulletMuzzleVelocity = 325
att.Mult_PhysBulletMuzzleVelocity = 156
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.30
att.Mult_VisualRecoilMult = 1.03
att.Mult_CycleTime = 1.05
att.Mult_RPM = 0.95
att.Override_ClipSize = 7
att.Mult_ReloadTime = 1.15
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Mult_MuzzleVelocity = 115
att.Mult_ShootPitch = 1.05
att.Override_Num = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 0.00001

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "sgreload_insert") then
        return anim .. "_40mm"
    end
end

local common = ")/arccw_uc/common/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/r870_40mm_vog_fire.wav"
    else
        return "weapons/misc/r870_40mm_vog_fire.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundOutdoors then
        return "weapons/misc/r870_40mm_fire_dist.wav" end
end

local path = "/weapons/misc/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "r870_40mm_fire_dist.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "ur_870_cal_vog")
end
                                 

                                      
do
    local att = {}

att.PrintName = "Vepr 20\" Competition Barrel"
att.AbbrevName = "20\" Competition Barrel"
att.Icon = Material("entities/att/ur_ak/barrel/vepr.png", "mips smooth")
att.Description = "Long competition barrel. The gas system is removed, making this weapon function in manual action. As a result performance is increased, but fire rate is greatly reduced."
att.Desc_Cons = {
        "uc.manual"
    }
att.Slot = {"ur_ak_barrel"}
att.AutoStats = true

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Amur 20\" Competition Barrel"
end

att.SortOrder = 20

att.Add_BarrelLength = 4
att.Mult_SightTime = 1.20
att.Mult_SpeedMult = .97
att.Mult_SightedSpeedMult = 0.85
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_Recoil = 0.70
att.Mult_AccuracyMOA = 0.3
att.Mult_Range = 1.85
att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 0.9
att.Mult_RPM = 0.7

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5
att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

att.ActivateElements = {"barrel_vepr"}
att.GivesFlags = {"ak_barrelchange"}

    ArcCW.LoadAttachmentType(att, "ur_ak_barrel_comp")
end
                                    

                                            
do
    local att = {}

att.PrintName = "RPK 23\" D.E.V.A.S.T.A.T.O.R. Barrel"
att.AbbrevName = "23\" D.E.V.A.S.T.A.T.O.R. Barrel"
att.Icon = Material("", "mips smooth")
att.Description = "Light machine gun barrel as used on the RPK. Except it... has 5 barrels. Good luck for those who want to survive being shot by this."
att.Slot = {"ur_ak_barrel"}
att.AutoStats = true

att.SortOrder = 23

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "PKF-67 23\" D.E.V.A.S.T.A.T.O.R. Barrel"
end

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.5
att.Mult_SpeedMult = .785
att.Mult_SightedSpeedMult = 0.8
att.Mult_Sway = 1.75

att.Mult_Recoil = 2.85
att.Mult_Range = 1.5

att.Bipod = true
att.Mult_BipodRecoil = .25
att.Mult_BipodDispersion = .2

att.Override_Firemodes = {
    {
        Mode = 2,
        PrintName = "AUTO",
        Mult_AccuracyMOA = 2.35,
        Mult_Num = 5,
        Override_AmmoPerShot = 5,
        Mult_Damage = 5,
        Mult_DamageMin = 5,
        Mult_VisualRecoilMult = 5,
        Mult_HipDispersion = 2,
        AutoStats = true,
    },
    {
        Mode = -5,
        PrintName = "BURST",
        Mult_HipDispersion = 0.7,
        Mult_AccuracyMOA = 0.7,
        RunAwayBurst = true,
        PostBurstDelay = 0.10,
        Mult_RPM = 0.875,
        AutoStats = true,
    },
    {
        Mode = 1,
        PrintName = "SEMI",
        RunAwayBurst = true,
        Mult_AccuracyMOA = 2.35,
        Mult_HipDispersion = 0.8,
        Mult_Num = 5,
        Override_AmmoPerShot = 5,
        Mult_Damage = 5,
        Mult_DamageMin = 5,
        Mult_VisualRecoilMult = 5,
        AutoStats = true,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"barrel_devastator"}
att.GivesFlags = {"ak_barrelchange"}

    ArcCW.LoadAttachmentType(att, "ur_ak_barrel_devastator")
end
                                          

                                        
do
    local att = {}

att.PrintName = "16\" Double Barrel"
att.AbbrevName = "16\" Double Barrel"
att.Icon = Material("", "mips smooth")
att.Description = "Double barrel that allows the firing of two bullets at once or in quick succession. The extra barrel adds weight to the rifle. \n\n(Change firemode in order to use Auto, Burst and Semi respectively)."
att.Desc_Cons = {

    }
att.Slot = {"ur_ak_barrel"}
att.AutoStats = true

att.SortOrder = 16

att.Mult_SightTime = 1.10
att.Mult_SpeedMult = .90
att.Mult_SightedSpeedMult = 0.85
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_Recoil = 0.70
att.Mult_ShootPitch = 0.9

att.Mult_MalfunctionMean = 1.5
att.Override_Firemodes = {
    {
        Mode = 2,
        PrintName = "AUTO",
        Mult_AccuracyMOA = 1.25,
        Mult_Num = 2,
        Override_AmmoPerShot = 2,
        Mult_Damage = 2,
        Mult_DamageMin = 2,
        Mult_VisualRecoilMult = 2,
        Mult_HipDispersion = 1.25,
        AutoStats = true,
    },
    {
        Mode = -2,
        PrintName = "BURST",
        Mult_HipDispersion = 0.8,
        Mult_AccuracyMOA = 0.8,
        RunAwayBurst = true,
        PostBurstDelay = 0.10,
        Mult_RPM = 0.95,
        AutoStats = true,
    },
    {
        Mode = 1,
        PrintName = "SEMI",
        RunAwayBurst = true,
        Mult_AccuracyMOA = 1.25,
        Mult_HipDispersion = 0.8,
        Mult_Num = 2,
        Override_AmmoPerShot = 2,
        Mult_Damage = 2,
        Mult_DamageMin = 2,
        Mult_VisualRecoilMult = 2,
        AutoStats = true,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"barrel_double"}
att.GivesFlags = {"ak_barrelchange"}

    ArcCW.LoadAttachmentType(att, "ur_ak_barrel_double")
end
                                      

                                       
do
    local att = {}

att.PrintName = "8\" Draco Barrel"
att.AbbrevName = "8\" Draco Barrel"
att.Icon = Material("", "mips smooth")
att.Description = "Special carbine length handguard and barrel. Its reduced length leads to less unwieldiness, and the shortened gas system increases cyclic rate respectably.\nThese traits combined, however, result in a difficult weapon to control. \n\n This variant is used on the romanian Draco carbine."
att.Slot = {"ur_ak_barrel"}
att.AutoStats = true

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "8\" Drake Barrel"
end

att.SortOrder = 8

att.Mult_ShootPitch = 115 / 100
att.Add_BarrelLength = -6
att.Mult_RPM = 1.131
att.Mult_SightTime = 0.8
att.Mult_HipDispersion = 0.8
att.Mult_SightedSpeedMult = 1.1
att.Mult_SpeedMult = 1.02
att.Mult_Sway = 0.75

att.Mult_Recoil = 1.5
att.Mult_AccuracyMOA = 2
att.Mult_Range = .5

att.ActivateElements = {"barrel_draco"}
att.GivesFlags = {"ak_barrelchange", "barrel_carbine", "ak_barrelkrinkov"}

att.LHIK = true

att.ModelOffset = Vector(-24, -3.1, 3.6)
att.OffsetAng = Angle(10, 0, 0)
att.Model = "models/weapons/arccw/ak_lhik_u.mdl"

    ArcCW.LoadAttachmentType(att, "ur_ak_barrel_draco")
end
                                     

                                  
do
    local att = {}

att.PrintName = "Saiga 12 Gauge Receiver"
att.AbbrevName = "12 Gauge Receiver"

att.Icon = Material("entities/att/uc_bullets/12g.png", "mips smooth")
att.Description = "Shotgun configuration for the Kalashnikov platform, loaded in 12 gauge. Increases hit probability at close range, but is extremely inaccurate if shot at targets further away."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN-12 12 Gauge Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_RPM = 0.77

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17
att.Override_Penetration = 1
att.Override_Num = 29
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.35
att.Mult_VisualRecoilMult = 0.2
att.Mult_ClipSize = 0.7
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_IsShotgun = true
att.Override_Ammo = "Buckshot"

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1
att.Override_Trivia_Class = "Shotgun"
att.Override_Trivia_Calibre = "12 Gauge"
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

local path = ")weapons/ak50/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ak-12g_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ak-12g_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_12g")
end
                                

                                   
do
    local att = {}

att.PrintName = "PP-19 .22 Long Rifle Receiver"
att.AbbrevName = ".22 Long Rifle Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Bogatyr SMG .22 Long Rifle Receiver"
end

att.Icon = Material("entities/att/uc_bullets/22lr.png", "mips smooth")
att.Description = "Conversion of the AK to the very light .22 Long Rifle round used for plinking."
att.Slot = {"ur_ak_cal"}
att.AutoStats = true

att.SortOrder = 9

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = att.AbbrevName
att.Override_Trivia_Class = "Submachine Gun"

att.Mult_Range = 0.7
att.Mult_RPM = 1.65
att.Mult_ReloadTime = .75
att.Mult_Recoil = 0.23
att.Mult_AccuracyMOA = .85
att.Mult_HipDispersion = .75
att.Mult_ShootPitch = 135 / 98

att.Mult_Penetration = 0.000022
att.Mult_DamageMin = 0.23
att.Mult_Damage = 0.16
att.Mult_ClipSize = 1.35

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_PhysTracerProfile = "uc_plinking"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

att.GivesFlags = {"cal_9mm"}
att.ActivateElements = {"mag_9mm"}
local path = ")weapons/ak_tokarev/"

local soundpath = ")weapons/ak_tokarev/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSoundSilenced then return {
        soundpath .. "ak_22lr_fire.wav"
     } end
     if fsound == wep.ShootSoundSilenced then return {
        path .. "ak_22lr_sup.wav"
    } end
end

local tail = ")weapons/ak_tokarev/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "ak_makarov_fire_dist.wav"
        }
    end
end

local slotinfo = {
    [6] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/9_30.png", "mips smooth")},
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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_22lr")
end
                                 

                                  
do
    local att = {}

att.PrintName = "VPO-209 .366 TKM Receiver"
att.AbbrevName = ".366 TKM Receiver"

att.Icon = Material("entities/att/uc_bullets/762x39.png", "mips smooth")
att.Description = "Hunting round based on 7.62x39mm, with more powerful ranged ballistics than the parent cartridge. Weapons chambered for it are exclusively produced for the Russian civilian market, and are therefore semi-automatic only."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN-209 .366 TKM Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.semionly"
}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 1.2
att.Mult_DamageMin = 1.2
att.Mult_Range = 1.25
att.Mult_PrecisionMOA = .75
att.Mult_Penetration = 1.5

att.Mult_RPM = 0.8
att.Mult_Recoil = 1.5
att.Mult_ShootVol = 130 / 125

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/366tkm.mdl"
att.Override_ShellScale = .666
att.Override_Trivia_Calibre = ".366 TKM"
att.Override_Trivia_Manufacturer = "Molot-Oruzhiye"

local path = ")weapons/arccw_ur/ak/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire_366_1.ogg", path .. "fire_366_2.ogg", path .. "fire_366_3.ogg"} end
    if fsound == wep.ShootSoundSilenced then return path .. "fire_sup_1.ogg" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_366")
end
                                

                                        
do
    local att = {}

att.PrintName = "AK .444 Marlin Receiver"
att.AbbrevName = ".444 Marlin Receiver"

att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "mips smooth")
att.Description = "The .444 Marlin (10.9×57mmR) is a rifle cartridge designed in 1964 by Marlin Firearms and Remington Arms. It was designed to fill the gap left when the older .45-70 cartridge was not available in new lever-action rifles; at the time it was the largest lever-action cartridge available. The .444 resembles a lengthened .44 Magnum and provides a significant increase in velocity. \n\n The AK-444 was developed by the American company Tromix as an experimental model. Despite high interest from enthusiasts of unusual weapons, the project never went into serial production and remains a rare prototype."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN .444 Marlin Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 2
att.Mult_DamageMin = 2
att.Mult_Range = 1.65
att.Mult_Penetration = 2
att.Mult_ReloadTime = 0.90

att.Mult_RPM = 0.70
att.Mult_Recoil = 1.65
att.Mult_ShootVol = 1.35

att.Override_Trivia_Calibre = ".444 Marlin"

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "scar_65mm_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "scar_65mm_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_444marlin")
end
                                      

                                 
do
    local att = {}

att.PrintName = "AK-50 .50 Cal Receiver"
att.AbbrevName = ".50 Cal Receiver"

att.Icon = Material("entities/att/uc_bullets/65grendal.png", "mips smooth")
att.Description = "Heavy receiver stolen from an exemplary of Brandon Herrera's AK-50 anti-material rifle and loosely bolted onto a regular Kalashnikov platform. \n It offers tremendous firepower but at the cost of the shortcomings that come with such an amateurish modification. \n\n\"If it doesn't explode, it's not a real prototype.\""

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN-50 .50 Cal Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {"Brandon will avenge his baby"

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 2.85
att.Mult_DamageMin = 3.15
att.Mult_Range = 3.45
att.Mult_PrecisionMOA = 2.55
att.Mult_Penetration = 3.50
att.Mult_ReloadTime = 1.32

att.Mult_RPM = 0.50
att.Mult_Recoil = 1.5
att.Mult_ShootVol = 245

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.50
att.Override_Trivia_Class = "Anti-Material Rifle"
att.Override_Trivia_Calibre = ".50 Cal"
att.Override_Trivia_Manufacturer = "Brandon Herrera"

local path = ")weapons/ak50/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ak50_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ak50_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_50")
end
                               

                                      
do
    local att = {}

att.PrintName = "KF-67 5.45x39mm 7N6 Receiver"
att.AbbrevName = "5.45x39mm 7N6"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/545x39.png", "smooth mips")
att.Description = "The original Soviet 5.45 load, with a deliberate air pocket in the nose so the bullet tips over on impact. Afghan fighters called it the poison bullet because the wounds made no sense to anybody looking at the entry hole.\n\nThe bullet is unstable by design, so it skips off hard surfaces at an angle and carries on for half damage. Recoil is very light and the magazine is large, but each hit is a little under a normal round."
att.Desc_Pros = {
    "Bounces off hard surfaces",
    "Very light recoil",
    "Large magazine",
}
att.Desc_Cons = {
    "Slightly weak per hit",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "5.45x39mm 7N6"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.88
att.Mult_DamageMin = 0.92
att.Mult_Penetration = 1.15
att.Mult_Range = 1.2
att.Mult_MuzzleVelocity = 1.2
att.Mult_Recoil = 0.65
att.Mult_RecoilSide = 0.6
att.Mult_VisualRecoilMult = 0.7
att.Mult_RPM = 1.1
att.Mult_ClipSize = 1.1
att.Mult_AccuracyMOA = 0.85

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.5)
    end

    return hit
end
att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 0.95

local fire = {"weapons/arccw_ur/ak/fire_545_auto_1.ogg", "weapons/arccw_ur/ak/fire_545_auto_2.ogg", "weapons/arccw_ur/ak/fire_545_auto_3.ogg"}
local firesup = {"weapons/arccw_ur/ak/fire-sup-01.ogg", "weapons/arccw_ur/ak/fire-sup-02.ogg", "weapons/arccw_ur/ak/fire-sup-03.ogg"}
local firetail = {"weapons/arccw_ur/ak/fire_545_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_545_7n6")
end
                                    

                                        
do
    local att = {}

att.PrintName = "AK 7.62x39mm Duplex Receiver"
att.AbbrevName = "7.62x39mm Duplex Receiver"

att.Icon = Material("", "mips smooth")
att.Description = "Duplex variant of the 7.62x39mm cartridge, which fires two projectiles per shot. This increases damage and penetration, but reduces rate of fire and increases recoil."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN 7.62x39mm Duplex Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Override_Num = 2
att.Mult_AccuracyMOA = 1.5

att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.05
att.Mult_VisualRecoilMult = 1.05
att.Mult_Range = 0.80
att.Mult_ShootVol = 1.05

att.Override_Trivia_Calibre = "7.62x39mm Duplex"

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_762duplex")
end
                                      

                                        
do
    local att = {}

att.PrintName = "PP-19 Vityaz 7.62mm Nagant Receiver"
att.AbbrevName = "7.62mm Nagant Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Bogatyr SMG 7.62mm Nagant Receiver"
end

att.Icon = Material("entities/att/uc_bullets/429de.png","smooth mips")
att.Description = "These rounds are the Soviet alternative to any magnum round, offers slightly more punch than rounds like .45 Long Colt but has somewhat shorter range and has a slight risk of jamming due to the chamber size being inadequate."

att.Slot = {"ur_ak_cal"}
att.AutoStats = true

att.SortOrder = 9

att.Override_Ammo = "357"
att.Override_Trivia_Class = "Submachine Gun"

att.Mult_RangeMin = 1.50
att.Mult_Range = 1.27
att.Mult_Recoil = 1.38
att.Override_PhysBulletMuzzleVelocity = 212
att.Mult_Penetration = 1.43
att.Mult_Damage = 0.95
att.Mult_DamageMin = 1.10
att.Mult_Precision = 1.225
att.Mult_ReloadTime = 0.90
att.Mult_MalfunctionMean = 0.79
att.Mult_VisualRecoilMult = 1.15
att.Mult_RPM = 0.71

att.Override_Trivia_Calibre = "7.62mm Nagant"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

att.GivesFlags = {"cal_9mm"}
att.ActivateElements = {"mag_9mm"}
local path = ")weapons/ak_tokarev/"

local soundpath = ")weapons/ak_tokarev/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSoundSilenced then return {
        soundpath .. "ak_nagant_fire.wav"
     } end
     if fsound == wep.ShootSoundSilenced then return {
        path .. "ak_nagant_fire_sup.wav"
    } end
end

local tail = ")weapons/ak_tokarev/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "ak_nagant_fire_dist.wav"
        }
    end
end

local slotinfo = {
    [6] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/9_30.png", "mips smooth")},
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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_762nagant")
end
                                      

                                        
do
    local att = {}

att.PrintName = "AK 7.62x41 SP4 Receiver"
att.AbbrevName = "7.62x41 SP4 Receiver"

att.Icon = Material("entities/att/762x41SP4.png", "mips smooth")
att.Description = "Specialized round developed in the early 1980s for Soviet special forces and KGB operations. Its unique design allows for noiseless (save for the piston thumping noise inside the cartridge) and flashless firing, making it ideal for covert missions. The cartridge uses a bottlenecked rimless case with a cylindrical bullet seated flush with the mouth. When fired, a piston inside the cartridge propels the bullet forward while sealing the gases, ensuring silent operation."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN 7.62x41 SP4 Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 1.15
att.Mult_DamageMin = 0.80
att.Mult_Range = 1.22
att.Mult_PrecisionMOA = 1.15
att.Mult_Penetration = 0.70
att.Mult_ReloadTime = 0.94
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.Mult_Sway = 1.075

att.Mult_RPM = 1.10
att.Mult_Recoil = 0.825

att.Override_Trivia_Calibre = "7.62x41 SP4"

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ak_sp4_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ak_sp4_fire_sup.wav" end
end

local fire22dist = {path .. "ak_sp4_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ak_sp4_fire_dist.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_762x41sp4")
end
                                      

                                        
do
    local att = {}

att.PrintName = "AK 7.62×54mmR Receiver"
att.AbbrevName = "7.62×54mmR Receiver"

att.Icon = Material("entities/att/uc_bullets/762x39.png", "mips smooth")
att.Description = "The 7.62×54mmR is a rimmed rifle cartridge developed by the Russian Empire and introduced as a service cartridge in 1891. Originally designed for the bolt-action Mosin–Nagant rifle, it was used during the late tsarist era and throughout the Soviet period to the present day. The cartridge remains one of the few standard-issue rimmed cartridges still in military use, and has one of the longest service lives of any military-issued cartridge. The fully-powered 7.62×54mmR cartridge is still in use by the Russian military in the Dragunov (SVD), SV-98 and other sniper rifles, as well as some modern general-purpose machine guns like the PKM and Pecheneg machine gun."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN 7.62×54mmR Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.32
att.Mult_Range = 2.35
att.Mult_PrecisionMOA = 2.15
att.Mult_Penetration = 1.625
att.Mult_ReloadTime = 1.05

att.Mult_RPM = 0.80
att.Mult_Recoil = 1.22
att.Mult_ShootVol = 1.15

att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.25
att.Override_Trivia_Calibre = "7.62×54mmR"

local path = ")weapons/ar458/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ar762_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ar762_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_762x54mmr")
end
                                      

                                    
do
    local att = {}

att.PrintName = "KF-67 9.3x62mm Mauser Receiver"
att.AbbrevName = "9.3x62mm Mauser"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/762x54.png", "smooth mips")
att.Description = "Otto Bock built this in 1905 for German settlers in Africa who needed something that would stop large animals and still fit a standard Mauser action. It is legal for every species on the continent and it is over a century old.\n\nTags whatever you hit for four seconds. Follow-up hits inside that window do 60 percent more. Heavy, slow firing and strong on its own, and considerably stronger if you stay on one target."
att.Desc_Pros = {
    "Follow-up hits on the same target hit much harder",
    "Heavy and long ranged",
}
att.Desc_Cons = {
    "Slow to cycle",
    "Reduced magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "9.3x62mm Mauser"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1.2

att.Mult_Damage = 1.45
att.Mult_DamageMin = 1.5
att.Mult_Penetration = 1.6
att.Mult_Range = 1.7
att.Mult_RangeMin = 1.6
att.Mult_Recoil = 1.5
att.Mult_VisualRecoilMult = 1.4
att.Mult_RPM = 0.72
att.Mult_ClipSize = 0.65
att.Mult_ShootVol = 1.3
att.Mult_ShootPitch = 0.82

local TAG_TIME = 4
local TAG_MULT = 1.6

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    if (ent.UC_TagUntil or 0) > CurTime() then
        hit.damage = hit.damage * TAG_MULT
    end

    ent.UC_TagUntil = CurTime() + TAG_TIME

    return hit
end

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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_93x62")
end
                                  

                                   
do
    local att = {}

att.PrintName = "AK 9x39 Receiver"
att.AbbrevName = "9x39 Receiver"

att.Icon = Material("entities/att/uc_bullets/9x39.png", "mips smooth")
att.Description = "The 9x39 is based on the Soviet 7.62x39mm case but with the neck expanded to fit a 9.2mm bullet. The intent was to create a more stealthy cartridge for suppressed firearms used by Spetnaz and other special troops that had more power, range, and penetration than 7.62 US subsonic rounds used in AKM-type rifles at the time."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN 9x39 Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Mult_Damage = 0.92
att.Mult_DamageMin = 0.92
att.Mult_Range = 1.15
att.Mult_PrecisionMOA = 1.22
att.Mult_Penetration = 1.05
att.Mult_ReloadTime = 0.97

att.Mult_RPM = 1.05
att.Mult_Recoil = 0.90
att.Mult_ShootVol = 0.95

att.Override_Trivia_Calibre = "9x39"

local path = ")weapons/ak50/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ak_9x39_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ak_9x39_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_9x39")
end
                                 

                                        
do
    local att = {}

att.PrintName = "7.62x39mm Flechette Wildcat"
att.AbbrevName = "7.62 Flechette"

att.SortOrder = 80
att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "A sabot round loaded with a single hardened dart barely thicker than a nail. It will go through a car door, the seat behind it and most of what is sitting in the seat, and it leaves a hole you could miss on a first inspection.\n\nPenetration is more than tripled and damage does not fall off with distance at all, so a hit at 100 metres lands exactly as hard as a hit at 5. Each hit is only worth about half a normal round, so the point is shooting people through walls rather than trading in the open."
att.Desc_Pros = {
    "Goes through cover almost everything else stops at",
    "Hits just as hard at any range",
}
att.Desc_Cons = {
    "Very poor terminal effect",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_ak_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = "7.62x39mm Flechette"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1
att.GivesFlags = {"cal_762"}

att.Hook_BulletHit = function(wep, hit)
    hit.damage = wep:GetDamage(0, true)
    return hit
end

att.Mult_Penetration = 3.6
att.Mult_Damage = 0.5
att.Mult_DamageMin = 0.5
att.Mult_Range = 1.2
att.Mult_MuzzleVelocity = 1.5
att.Mult_AccuracyMOA = 0.7
att.Mult_Recoil = 0.6
att.Mult_VisualRecoilMult = 0.7
att.Mult_ShootPitch = 1.15
att.Mult_ShootVol = 0.95

local fire = {"weapons/arccw_ur/ak/fire_366_1.ogg", "weapons/arccw_ur/ak/fire_366_2.ogg", "weapons/arccw_ur/ak/fire_366_3.ogg"}
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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_flechette")
end
                                      

                                      
do
    local att = {}

att.PrintName = "PP-19 Vityaz 9x18mm Makarov Receiver"
att.AbbrevName = "9x18mm Makarov Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Bogatyr SMG 9x18mm Makarov Receiver"
end

att.Icon = Material("entities/att/uc_bullets/9x18.png", "mips smooth")
att.Description = "Conversion of the AK to the much lighter 9x18mm Makarov round which promotes faster firerates and less recoil than it's Parabellum counterpart."
att.Slot = {"ur_ak_cal"}
att.AutoStats = true

att.SortOrder = 9

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = att.AbbrevName
att.Override_Trivia_Class = "Submachine Gun"

att.Mult_Range = 0.5
att.Mult_RPM = 1.31
att.Mult_ReloadTime = .90
att.Mult_Recoil = 0.52
att.Mult_AccuracyMOA = .85
att.Mult_HipDispersion = .75
att.Mult_ShootPitch = 135 / 98

att.Mult_Penetration = 0.27
att.Mult_DamageMin = 0.55
att.Mult_Damage = 0.45

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x18mm Makarov"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

att.GivesFlags = {"cal_9mm"}
att.ActivateElements = {"mag_9mm"}
local path = ")weapons/ak_tokarev/"

local soundpath = ")weapons/ak_tokarev/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSoundSilenced then return {
        soundpath .. "ak_makarov_fire.wav"
     } end
     if fsound == wep.ShootSoundSilenced then return {
        path .. "ak_makarov_fire_sup.wav"
    } end
end

local tail = ")weapons/ak_tokarev/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "ak_makarov_fire_dist.wav"
        }
    end
end

local slotinfo = {
    [6] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/9_30.png", "mips smooth")},
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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_makarov")
end
                                    

                                      
do
    local att = {}

att.PrintName = "PP-19 Vityaz 7.62x25 Tokarev Receiver"
att.AbbrevName = "7.62x25 Tokarev Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Bogatyr SMG 7.62x25 Tokarev Receiver"
end

att.Icon = Material("entities/att/uc_bullets/454casull.png", "mips smooth")
att.Description = "Converts the weapon to the less versatile 7.62x25 Tokarev round which offers more power but at the cost of adding more recoil."
att.Slot = {"ur_ak_cal"}
att.AutoStats = true

att.SortOrder = 9

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = att.AbbrevName
att.Override_Trivia_Class = "Submachine Gun"

att.Mult_Range = 0.6
att.Mult_RPM = 1.125
att.Mult_ReloadTime = .97
att.Mult_Recoil = 0.90
att.Mult_AccuracyMOA = .85
att.Mult_HipDispersion = .75
att.Mult_ShootPitch = 90 / 110

att.Mult_Penetration = 0.875
att.Mult_DamageMin = 0.85
att.Mult_Damage = 0.925

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "7.62x25 Tokarev"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

att.GivesFlags = {"cal_9mm"}
att.ActivateElements = {"mag_9mm"}
local path = ")weapons/ak_tokarev/"

local soundpath = ")weapons/ak_tokarev/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSoundSilenced then return {
        soundpath .. "ak_tokarev_fire.wav"
     } end
     if fsound == wep.ShootSoundSilenced then return {
        path .. "ak_tokarev_fire_sup.wav"
    } end
end

local tail = ")weapons/ak_tokarev/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "ak_tokarev_fire_dist.wav"
        }
    end
end

local slotinfo = {
    [6] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/9_30.png", "mips smooth")},
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

    ArcCW.LoadAttachmentType(att, "ur_ak_cal_tokarev")
end
                                    

                                     
do
    local att = {}

att.PrintName = "No Dust Cover"
att.AbbrevName = "No Dust Cover"
att.Icon = Material("", "mips smooth")
att.Description = "Remove the dust cover, so you can see the insides of your rifle."
att.Slot = {"ur_ak_cover"}
att.AutoStats = true

att.Desc_Neutrals = {
    "uc.cosmetic",
}

att.ActivateElements = {"cover_none"}

    ArcCW.LoadAttachmentType(att, "ur_ak_cover_none")
end
                                   

                                     
do
    local att = {}

att.PrintName = "Saiga Grip"
att.AbbrevName = "Saiga Grip"
att.Icon = Material("entities/att/ur_ak/grip_saiga.png", "mips smooth")
att.Description = "Robust grip intended for the Saiga."
att.AutoStats = true
att.Slot = {"ur_ak_grip"}

att.Mult_Recoil = 1.125
att.Mult_SightedSpeedMult = 1.10

att.ActivateElements = {"grip_saiga"}

    ArcCW.LoadAttachmentType(att, "ur_ak_grip_saiga")
end
                                   

                                   
do
    local att = {}

att.PrintName = "Surefire Handguard"

att.Description = "Surefire handguard, custom-fitted for the AKM."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "ur_ak_hg"

att.SortOrder = 3

att.Model = "models/weapons/arccw/atts/ud_flashlight_1.mdl"
att.ModelOffset = Vector(0,0,.1)
att.OffsetAng = Angle(0,0,180)
att.ModelScale = Vector(.01,.01,.01)

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 1024
att.FlashlightNearZ = 1
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR
att.FlashlightColor = Color(255, 242, 229)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 3
att.FlashlightBone = "light"

att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}

att.ActivateElements = {"ur_ak_hg_flash"}

    ArcCW.LoadAttachmentType(att, "ur_ak_hg_flash")
end
                                 

                                    
do
    local att = {}

att.PrintName = "AK Railed Handguard"
att.AbbrevName = "Railed Handguard"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KF Railed Handguard"
end
att.Icon = Material("entities/att/ak_railed_hg.png", "mips smooth")
att.Description = "Railed handguard that is best of both worlds, keeps the fancy wood furniture but adds a tactical rail made out of polymer."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = {"ur_ak_hg"}
att.AutoStats = true

att.SortOrder = 15.9

att.Mult_Sway = 1.15
att.Mult_SightedSpeedMult = 1.15
att.Mult_Recoil = 1.08

att.GivesFlags = {"nodong"}
att.ActivateElements = {"hg_railed"}

    ArcCW.LoadAttachmentType(att, "ur_ak_hg_railed")
end
                                  

                                   
do
    local att = {}

att.PrintName = "Saiga Handguard"

att.Description = "Tactical light handguard primarily used for shotgun builds."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "ur_ak_hg"

att.SortOrder = 3

att.Mult_Sway = 1.20
att.Mult_SightedSpeedMult = 1.20
att.Mult_SpeedMult = 1.05
att.Mult_Recoil = 1.045

att.ActivateElements = {"ur_ak_hg_saiga"}

    ArcCW.LoadAttachmentType(att, "ur_ak_hg_saiga")
end
                                 

                                           
do
    local att = {}

att.PrintName = "Heavy Handguard 2.0"
att.Icon = Material("entities/att/ur_ak/handguards/vepr.png", "mips smooth")
att.Description = "Slight improvement over the original Vepr handguard. Not only that but it now accepts underbarrels and also works with the RPK barrel."
att.Slot = {"ur_ak_hg"}

att.AutoStats = true

att.Mult_SightedSpeedMult = 0.85
att.Mult_HipDispersion = 1.25

att.Mult_Sway = 0.65
att.Mult_Recoil = 0.70

att.ActivateElements = {"ur_ak_hg_vepr"}

    ArcCW.LoadAttachmentType(att, "ur_ak_hg_vepr_improved")
end
                                         

                                    
do
    local att = {}

att.PrintName = "AK Vityaz Handguard"
att.AbbrevName = "Vityaz Handguard"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KF Vityaz Handguard"
end
att.Icon = Material("entities/att/ur_ak/barrel/smg.png", "mips smooth")
att.Description = "Short polymer handguard made for the PP19 Vityaz."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = {"ur_ak_hg"}
att.AutoStats = true

att.SortOrder = 15.9

att.Mult_Sway = 1.15
att.Mult_SightedSpeedMult = 1.15
att.Mult_Recoil = 1.08

att.GivesFlags = {"nodong"}
att.ActivateElements = {"hg_vityaz"}

att.LHIK = true

att.ModelOffset = Vector(-24, -3.4, 3.3)
att.OffsetAng = Angle(10, 0, 0)
att.Model = "models/weapons/arccw/ak_lhik_u.mdl"

    ArcCW.LoadAttachmentType(att, "ur_ak_hg_vityaz")
end
                                  

                                     
do
    local att = {}

att.PrintName = "40-Round Magazine"
att.AbbrevName = "40-Round Mag"
att.Icon = Material("", "mips smooth")
att.Description = "Extended 5.56mm magazine."
att.Slot = {"ur_ak_mag"}
att.AutoStats = true
att.Desc_Neutrals = {

}

att.SortOrder = 30

att.HideIfBlocked = true

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 2

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(2,16)
end

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.10

att.ExcludeFlags = {"cal_545","cal_9mm","cal_12g","cal_308"}
att.RequireFlags = {"cal_556"}

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_556_40")
end
                                   

                                      
do
    local att = {}

att.PrintName = "AK-47 125-Round Magazine"
att.AbbrevName = "125-Round Magazine"
att.Icon = Material("", "mips smooth")
att.Description = "Long ass steel magazine so you can make a Chauchat out of your rifle."
att.Slot = {"ur_ak_mag"}
att.Desc_Cons = {"uc.jam"}
att.AutoStats = true

att.SortOrder = 125

att.HideIfBlocked = true

att.Override_ClipSize = 125

att.Mult_SightTime = 1.50
att.Mult_ReloadTime = 1.45
att.Mult_Sway = 1.07
att.Mult_SpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.8
att.Mult_DrawTime = 1.5
att.Mult_RecoilSide = 0.975
att.Mult_HolsterTime = 1.5

att.ActivateElements = {"mag_762_125"}
att.ExcludeFlags = ArcCW.UR.AKCalFlags

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_762_125")
end
                                    

                                          
do
    local att = {}

att.PrintName = "75-Round Polymer Drum"
att.AbbrevName = "75-Round Polymer Drum"
att.Icon = Material("entities/att/ur_ak/magazines/762_75.png", "mips smooth")
att.Description = "Cylindrical drum magazine with capacity for a very large number of rounds, ideal for machine gunners. It is lighter, as it is made out of polymer. Prone to feeding failures."
att.Slot = {"ur_ak_mag"}
att.Desc_Cons = {"uc.jam"}
att.AutoStats = true

att.SortOrder = 75
att.GivesFlags = {"mag_drum"}

att.HideIfBlocked = true

att.Override_ClipSize = 75

att.Mult_SightTime = 1.2
att.Mult_ReloadTime = 1.17
att.Mult_Sway = 2.3
att.Mult_SpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.9
att.Mult_DrawTime = 1.1
att.Mult_RecoilSide = 1.3
att.Mult_HolsterTime = 1.1

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.7
att.Mult_MalfunctionVariance = 1.5

att.Mult_HipDispersion = 1.4

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_75poly"
end

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "fix") then
        return anim .. "_75"
    end
end

att.ActivateElements = {"mag_75_poly"}
att.ExcludeFlags = {"cal_9mm", "cal_12g", "cal_366", "cal_308", "cal_556"}

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_762_75_poly")
end
                                        

                                       
do
    local att = {}

att.PrintName = "100-Round C-Mag"
att.AbbrevName = "100-Round C-Mag"
att.Icon = Material("entities/att/acwatt_ud_m16_mag_100.png", "mips smooth")
att.Description = "Unconventional yet stable 100-round magazine."
att.Slot = {"ur_ak_mag"}
att.Desc_Cons = {"uc.jam"}
att.AutoStats = true

att.SortOrder = 100

att.HideIfBlocked = true

att.Override_ClipSize = 100

att.Mult_SightTime = 1.45
att.Mult_ReloadTime = 1.40
att.Mult_Sway = 1.05
att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.8
att.Mult_DrawTime = 1.4
att.Mult_RecoilSide = 0.90
att.Mult_HolsterTime = 1.4
att.Mult_RecoilSide = 0.90

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.7
att.Mult_MalfunctionVariance = 1.5

att.Mult_HipDispersion = 1.5

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_75"
end

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "fix") then
        return anim .. "_75"
    end
end

att.ActivateElements = {"mag_100_cmag"}
att.ExcludeFlags = {"cal_545", "cal_9mm", "cal_12g", "cal_366", "cal_308"}

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_762_cmag")
end
                                     

                                       
do
    local att = {}

att.PrintName = "PMAG 30 AK/AKM MOE"
att.AbbrevName = "30-Round PMAG"
att.Icon = Material("entities/att/ur_ak/magazines/762_p.png", "mips smooth")
att.Description = "American aftermarket magazine. The grooves give it a slightly better grip surface, but the difference in practice is negligible."
att.Slot = {"ur_ak_mag"}
att.AutoStats = true
att.Desc_Neutrals = {
    "uc.cosmetic",
}

att.SortOrder = 30

att.HideIfBlocked = true

att.ActivateElements = {"mag_762_pmag"}
att.ExcludeFlags = {"cal_545","cal_9mm","cal_12g","cal_308","cal_556"}
att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_poly"
end

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_762_pmag")
end
                                     

                                     
do
    local att = {}

att.PrintName = "40-Round Magazine"
att.AbbrevName = "40-Round Mag"
att.Icon = Material("", "mips smooth")
att.Description = "Extended pistol-caliber magazine."
att.Slot = {"ur_ak_mag"}
att.AutoStats = true
att.Desc_Neutrals = {

}

att.SortOrder = 30

att.HideIfBlocked = true

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 2

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(2,15)
end

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.10

att.ExcludeFlags = {"cal_545","cal_12g","cal_308","cal_556"}
att.RequireFlags = {"cal_9mm"}
att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_9mm_40")
end
                                   

                                    
do
    local att = {}

att.PrintName = "15-Round Saiga Mag"
att.AbbrevName = "15-Round Saiga Mag"
att.Icon = Material("entities/att/ur_ak/magazines/762_75.png", "mips smooth")
att.Description = "Plastic magazine with reduced capacity. It is primarily used for shotguns, however you are free to load it in whatever caliber you want."
att.Slot = {"ur_ak_mag"}
att.Desc_Cons = {}
att.AutoStats = true

att.SortOrder = 15

att.HideIfBlocked = true

att.Override_ClipSize = 15

att.Mult_SightTime = 0.95
att.Mult_ReloadTime = 0.90
att.Mult_Sway = 0.85
att.Mult_DrawTime = 0.95
att.Mult_HolsterTime = 0.95

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_12g"
end

att.ActivateElements = {"mag_saiga"}
att.ExcludeFlags = ArcCW.UR.AKCalFlags

    ArcCW.LoadAttachmentType(att, "ur_ak_mag_saiga")
end
                                  

                                            
do
    local att = {}

att.PrintName = "Kalashnikov Compensator"

att.Icon = Material("entities/att/ur_ak/muzzle_74m.png", "mips smooth")
att.Description = "External compensator used since the '70s for AKs of multiple calibers. Efficiently reduces horizontal recoil and marginally reduces vertical recoil at the cost of a frontal counterweight that will inevitably raise swaying."
att.AutoStats = true
att.Slot = {"ur_ak_muzzle"}

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Vladimir Compensator"
    att.Description = string.Replace(att.Description,"AKs","AVRs")
end

att.Mult_Recoil = .95
att.Mult_RecoilSide = .65

att.Add_BarrelLength = 2.5
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.25

att.SortOrder = 999

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
att.ActivateElements = {"muzzle_ak74"}
att.ExcludeFlags = {"ak_barrelchange"}

    ArcCW.LoadAttachmentType(att, "ur_ak_muzzle_ak74_fixed")
end
                                          

                                           
do
    local att = {}

att.PrintName = "Slant Muzzle Brake"
att.Icon = Material("entities/att/ur_ak/muzzle_m.png", "mips smooth")
att.Description = "External muzzle brake unique to the AKM and some derivatives. The slant-cut design counters muzzle rise without adding as much weight as a universal compensator."
att.AutoStats = true
att.Slot = {"ur_ak_muzzle"}

if !GetConVar("arccw_truenames"):GetBool() then
    att.Description = string.Replace(att.Description,"AKM","AVR-59")
end

att.Mult_Recoil = .9
att.Mult_RecoilSide = .95

att.Add_BarrelLength = 1
att.Mult_SightTime = 1.025
att.Mult_Sway = 1.05
att.Mult_ShootVol = 1.1

att.SortOrder = 998

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
att.ActivateElements = {"muzzle_akm"}
att.ExcludeFlags = {"ak_barrelchange"}
att.RequireFlags = {"cal_default"}

    ArcCW.LoadAttachmentType(att, "ur_ak_muzzle_akm_fixed")
end
                                         

                                    
do
    local att = {}

att.PrintName = "AK Clubfoot Stock"
att.AbbrevName = "Clubfoot Stock"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KF Clubfoot Stock"
end
att.Icon = Material("entities/att/ur_ak/stock/rpk.png", "mips smooth")
att.Description = "Heavy-duty machine gun stock, designed with prone shooting in mind. It has more mass than the factory stock, but is generally more comfortable to aim and shoot with."
att.Slot = {"ur_ak_stock"}
att.AutoStats = true

att.SortOrder = 3

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = .9

att.ToggleStats = {
    {
        PrintName = "Extended",
        Mult_Recoil = .85,
        Mult_Sway = .75,
        ActivateElements = {"stock_rpk"},
        AutoStats = true,
    },
    {
        PrintName = "Folded",
        Mult_SightTime = 0.6,
        Mult_DrawTime = 0.95,
        Mult_HolsterTime = 0.95,
        Mult_Recoil = 1.375,
        Mult_RecoilSide = 1.65,
        Mult_SightedSpeedMult = 1.05,
        Mult_ShootSpeedMult = 1.15,
        Add_BarrelLength = -9,
        Mult_Sway = 2,
        ActivateElements = {"stock_rpkm_folded"},
        AutoStats = true,
    }
}

    ArcCW.LoadAttachmentType(att, "ur_ak_stock_rpk")
end
                                  

                                      
do
    local att = {}

att.PrintName = "Saiga Stock"
att.AbbrevName = "Saiga Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "KFN12 Stock"
end

att.Icon = Material("entities/att/ur_ak/stock/saiga.png", "smooth mips")
att.Description = "Medium-sized stock for the saiga"
att.AutoStats = true
att.Slot = "ur_ak_stock"

att.Mult_MoveDispersion = .85
att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.2

att.Mult_HipDispersion = 0.75
att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.ActivateElements = {"stock_saiga"}

    ArcCW.LoadAttachmentType(att, "ur_ak_stock_saiga")
end
                                    

                                             
do
    local att = {}

att.PrintName = "AW 20\" Blunderbuss Barrel"
att.AbbrevName = "20\" Blunderbuss Barrel"
att.Icon = Material("", "mips smooth")

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AP 20\" Blunderbuss Barrel"
end

att.SortOrder = 20
att.Description = "Cursed smoothbore barrel with comically large cone-shaped muzzle."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_barrel"

att.Mult_Range = 0.50
att.Mult_Recoil = 2
att.Mult_RecoilSide = 1.50
att.Mult_CycleTime = 1.15
att.Mult_AccuracyMOA = 5
att.Mult_MalfunctionMean = 0.45
att.Mult_SpeedMult = 0.80
att.Mult_SightedSpeedMult = 0.75
att.Mult_Precision = 0.40
att.Mult_VisualRecoilMult = 1.85
att.Mult_ShootPitch = 0.80
att.Mult_Penetration = 0.85
att.Mult_HipDispersion = 2
att.Mult_Sway = 1.5
att.Mult_SpeedMult = 0.95
att.Mult_ReloadTime = 1.10
att.Mult_ShootSpeedMult = 0.10

att.Hook_PostFireBullets = function(wep)
    UC_Extras.RecoilJump(wep, 700, 160)
end

att.Add_BarrelLength = -8

att.AutoStats = true
att.ActivateElements = {"barrel_blunderbuss"}

    ArcCW.LoadAttachmentType(att, "ur_aw_barrel_blunderbuss")
end
                                           

                                       
do
    local att = {}

att.PrintName = "AT 14\" Obrez Barrel"
att.AbbrevName = "14\" Obrez Barrel"
att.Icon = Material("entities/att/ur_aw/bar_short.png", "mips smooth")

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AP 14\" Obrez Barrel"
end

att.SortOrder = 14
att.Description = "Sawn-off barrel for gangstas."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_barrel"

att.Mult_SightTime = 0.60
att.Mult_Sway = 0.4
att.Mult_HipDispersion = 0.4
att.Mult_SpeedMult = 1.20
att.Add_BarrelLength = -10
att.Mult_ShootSpeedMult = 1.05
att.Mult_ShootPitch = 1.15

att.Mult_Range = 0.16
att.Mult_AccuracyMOA = 5
att.Mult_Recoil = 1.50

att.AutoStats = true
att.ActivateElements = {"barrel_obrez"}

    ArcCW.LoadAttachmentType(att, "ur_aw_barrel_obrez")
end
                                     

                                         
do
    local att = {}

att.PrintName = "AW 28\" Railgun Barrel"
att.AbbrevName = "28\" Railgun Barrel"
att.Icon = Material("entities/att/uc_lightning.png", "mips smooth")

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AP 28\" Railgun Barrel"
end

att.SortOrder = 28
att.Description = "A laughable attempt at creating an improvised railgun barrel, using random industrial equipment you would have laying around in your garage or workshed. This barrel accelerates projectiles at an unfathomable speed and is slightly longer than the maximum barrel length option available on the market for this firearm. Due to the bulky and amateurish design of this build, the firearm is much heavier, cycles slower and is prone to jamming."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_barrel"

att.Mult_Range = 2.75
att.Mult_Recoil = 1.75
att.Mult_CycleTime = 1.25
att.Mult_Damage = 5.75
att.Mult_DamageMin = 5.55
att.Mult_SightTime = 1.425
att.Mult_Sway = 1.35
att.Mult_AccuracyMOA = 0.05
att.Mult_MalfunctionMean = 0.15
att.Mult_SpeedMult = 0.80
att.Mult_SightedSpeedMult = 0.75
att.Mult_Precision = 2.55
att.Mult_VisualRecoilMult = 1.35
att.Mult_ShootPitch = 0.85
att.Mult_Penetration = 4.85
att.Mult_PhysBulletMuzzleVelocity = 5256

att.Add_BarrelLength = 4

att.AutoStats = true
att.ActivateElements = {"barrel_railgun"}

    ArcCW.LoadAttachmentType(att, "ur_aw_barrel_railgun")
end
                                       

                                            
do
    local att = {}

att.PrintName = "AWM .17 Incinerator Receiver"
att.AbbrevName = ".17 Incinerator"
att.Icon = Material("entities/att/17incinerator.png", "mips smooth")
att.Description = "The .17 incinerator is a homemade rifle caliber. It uses a modified .50 BMG cartridge necked down to .17 caliber. It is mostly made by handloaders and custom shop workers and it was originally created by ammo-one, a custom cartridge company. It uses special lathe-turned 33 grain projectiles that can go up to 5883 feet per second.\n\n\"For when you want to hunt a squirrel from the moon\""
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Damage = 1.85
att.Mult_DamageMin = 1.70
att.Mult_Range = 5.883
att.Override_Range = 1.20
att.Override_RangeMin = 22
att.Mult_CycleTime = 1.12

att.Mult_PhysBulletMuzzleVelocity = 5883

att.Mult_Penetration = 2.25
att.Mult_Recoil = 2.5
att.Mult_ReloadTime = 6.55 / 5.15

att.Mult_ShootSpeedMult = 0.7

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "17incinerator_fire.wav"}
local fire300sup = {path1 .. "17incinerator_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_Trivia_Calibre = ".17 Incinerator"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"mag_300"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_17incinerator")
end
                                          

                                           
do
    local att = {}

att.PrintName = "AWM .223 Remington Receiver"
att.AbbrevName = ".223 Remington"
att.Icon = Material("entities/att/uc_bullets/223remington.png", "mips smooth")
att.Description = "The .223 Remington is considered one of the most popular common-use cartridges and is used by a wide range of semi-automatic and manual-action rifles. Provides decent velocity and precision."
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Damage = 0.80
att.Mult_DamageMin = 0.75
att.Mult_Range = 1.52
att.Mult_CycleTime = 0.85

 att.Override_PhysBulletMuzzleVelocity = 800

att.Mult_Penetration = 0.70
att.Mult_Recoil = 0.60
att.Mult_ReloadTime = 0.85

att.Mult_ShootSpeedMult = 1.12

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "remington223_fire.wav"}
local fire300sup = {path1 .. "223remington_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_Trivia_Calibre = ".223 Remington"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.GivesFlags = {"mag_300"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_223remington")
end
                                         

                                   
do
    local att = {}

att.PrintName = "AWM .22 Long Rifle Receiver"
att.AbbrevName = ".22 Long Rifle"
att.Icon = Material("entities/att/uc_bullets/22lr.png", "mips smooth")
att.Description = "Lighter and weaker ammunition used for plinking. Increases clip size, cycle speed and reload speed but hinders damage and penetration."
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Recoil = 0.31
att.Mult_Damage = 0.21
att.Mult_DamageMin = 0.23
att.Mult_Penetration = 0.075
att.Mult_Range = 1.12
att.Mult_ReloadTime = 0.76
att.Mult_ClipSize = 2.4
att.Mult_CycleTime = 0.80
att.Mult_RPM = 1.85

 att.Override_PhysBulletMuzzleVelocity = 1372
att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysTracerProfile_Priority = -1
att.Override_TracerNum = 1
att.Override_TracerNum_Priority = -1

att.Mult_ShootSpeedMult = 0.98

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "22lr_fire_awp.wav"}
local fire300sup = {path1 .. "22lr_fire_sup_awp.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
att.Override_Ammo = "Pistol"
att.GivesFlags = {"mag_300"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_22lr")
end
                                 

                                         
do
    local att = {}

att.PrintName = "AWM .408 Cheytac Receiver"
att.AbbrevName = ".408 Cheytac"
att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "mips smooth")
att.Description = "The .408 Cheytac round was designed with a possible military need for a cartridge for anti-personnel, anti-sniper, and anti-materiel roles with a (supersonic) precision range of 2,200 yards (2,000 m). It is offered as a competitor to the most common military NATO long-range service cartridges such as .338 Lapua Magnum and the .50 BMG."
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Damage = 1.50
att.Mult_DamageMin = 1.45
att.Mult_Range = 2.20
att.Mult_CycleTime = 1.23

 att.Override_PhysBulletMuzzleVelocity = 2200

att.Mult_Penetration = 1.45
att.Mult_Recoil = 1.80
att.Mult_ReloadTime = 0.98

att.Mult_ShootSpeedMult = 0.98

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "408_cheytac_fire.wav"}
local fire300sup = {path1 .. "408cheytac_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_Trivia_Calibre = ".408 Cheytac"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"mag_300"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_408cheytac")
end
                                       

                                      
do
    local att = {}

att.PrintName = "AWM .410 Bore Receiver"
att.AbbrevName = ".410 Bore"
att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "Receiver that accepts .410 bore rounds, changing the weapon into a shotgun."
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Range = 0.40
att.Mult_CycleTime = 0.85

 att.Mult_RPM = 0.85
 att.Mult_ReloadTime = 0.95
 att.Mult_Recoil = 1.15
 att.Mult_HipDispersion = 1.45
 att.Override_Num = 4
 att.Mult_AccuracyMOA = 25

 att.Mult_Penetration = 14 / 20
 att.Mult_DamageMin = 1.30
 att.Mult_Damage = 1.38
 att.ShootPitchVariation = 1

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "aw_410_fire.wav"}
local fire300sup = {path1 .. "aw_410_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true
att.Override_Ammo = "Buckshot"
att.GivesFlags = {"mag_300"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_410bore")
end
                                    

                                 
do
    local att = {}

att.PrintName = "AWM .50 BMG Receiver"
att.AbbrevName = ".50 BMG"
att.Icon = Material("entities/att/uc_bullets/762x54.png", "mips smooth")
att.Description = "In response to the need for new anti-aircraft weaponry during World War I, John Browning developed the .50 BMG. He wanted the round to be used in a machine gun based on a scaled-up version of the M1917 Browning. \n The .50 BMG cartridge is also used in anti-materiel rifles. A wide variety of ammunition is available, and the availability of match grade ammunition has increased the usefulness of .50 caliber rifles by allowing more accurate fire than lower-quality rounds. \n\n\"Sometimes, overkill is just the right amount of kill.\""
att.Slot = "ur_aw_cal"
att.Desc_Pros = {
}

att.AutoStats = true

att.Mult_Damage = 1.85
att.Mult_DamageMin = 1.75
att.Mult_Range = 2.25
att.Mult_CycleTime = 1.27

 att.Override_PhysBulletMuzzleVelocity = 2255

att.Mult_Penetration = 1.85
att.Mult_Recoil = 2.45
att.Mult_ReloadTime = 0.85

att.Mult_ShootSpeedMult = 0.85

local path = ")weapons/misc/"
local path1 = ")weapons/misc/"

local fire300 = {path .. "50cal_shot_fire.wav"}
local fire300sup = {path1 .. "50cal_shot_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire300sup
    else
        return fire300
    end
end

local tail = ")/arccw_uc/common/338lm/"
local fire338dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire338dist
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_338"
end

att.Override_Trivia_Calibre = ".50 BMG"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.50
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"mag_300"}
att.ActivateElements = {"mag_50bmg"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_50")
end
                               

                                         
do
    local att = {}

att.PrintName = "AWP .510 Whisper Receiver"
att.AbbrevName = ".510 Whisper"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A .50 BMG case cut down and loaded with a seven hundred grain bullet ambling along under the speed of sound. Suppressed it makes less noise than the bolt closing, and it arrives carrying more energy than most rifle rounds do supersonic.\n\nAlmost silent, hits very hard, and slows whoever it hits to 40 percent speed for four seconds. The tradeoff is severe range loss: past about forty metres it drops off a cliff."
att.Desc_Pros = {
    "Massive quiet hit",
    "Badly cripples movement",
}
att.Desc_Cons = {
    "Very short ranged for a sniper rifle",
    "Small magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".510 Whisper"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.6
att.Mult_DamageMin = 1.2
att.Mult_Penetration = 1.4
att.Mult_Range = 0.45
att.Mult_RangeMin = 0.5
att.Mult_MuzzleVelocity = 0.4
att.Mult_Recoil = 1.3
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.7
att.Mult_ShootVol = 0.5
att.Mult_ShootPitch = 0.7

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

local fire = {"weapons/arccw_ur/aw_placeholders/338/fire-300-01.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-02.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-03.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-04.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-05.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-06.ogg"}
local firesup = {"weapons/arccw_ur/aw_placeholders/338/fire-300-sup-01.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-sup-02.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-sup-03.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-sup-04.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-sup-05.ogg", "weapons/arccw_ur/aw_placeholders/338/fire-300-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_510whisper")
end
                                       

                                  
do
    local att = {}

att.PrintName = "AWM 5.56x45mm Receiver"
att.AbbrevName = "5.56mm"
att.Icon = Material("entities/att/uc_bullets/556x45.png", "mips smooth")
att.Description = "Conversion kit for the AWP that allows it to fire 5.56x45mm NATO rounds. Cannot accept muzzle devices, and it also modifies the barrel, magwell and stock."
att.Slot = "ur_aw_cal"

att.AutoStats = true
att.Desc_Pros = {

}
att.Desc_Cons = {
    "Disables Magazine attachments"
}

att.Override_ClipSize = 30

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"

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

local path = "weapons/misc/"

local fire22 = {path .. "mp5_squid_fire.wav"}
local fire22sup = {path .. "mp5_squid_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_556"
end

local slotinfo = {
    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/acwatt_ud_m16_mag_30.png", "mips smooth")},
}

att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

att.GivesFlags = {"mag_556"}
att.ActivateElements = {"mag_556"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_556")
end
                                

                                          
do
    local att = {}

att.PrintName = "AWP .600 Overkill Receiver"
att.AbbrevName = ".600 Overkill"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "Built because somebody looked at the .600 Nitro Express, a round designed for stopping charging elephants, and concluded it was leaving performance on the table. The name was chosen honestly.\n\nJust over double damage and it throws targets off their feet. Two or three rounds per magazine, punishing recoil, and a slow cycle. One shot, one result, then a long wait."
att.Desc_Pros = {
    "Just over double damage",
    "Knocks targets flying",
}
att.Desc_Cons = {
    "Punishing recoil",
    "Two or three rounds",
    "Very slow",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".600 Overkill"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.4

att.Mult_Damage = 2.15
att.Mult_DamageMin = 2.0
att.Mult_Penetration = 2.0
att.Mult_Range = 1.4
att.Mult_Recoil = 2.6
att.Mult_RecoilSide = 2.1
att.Mult_VisualRecoilMult = 2.4
att.Mult_RPM = 0.5
att.Mult_ClipSize = 0.35
att.Mult_ReloadTime = 1.35
att.Mult_ShootVol = 1.7
att.Mult_ShootPitch = 0.55

local SHOVE = 720

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local dir = hit.tr.Normal
    dir.z = 0
    dir:Normalize()

    ent:SetVelocity(dir * SHOVE + Vector(0, 0, SHOVE * 0.25))

    return hit
end

local fire = {"weapons/arccw_ur/aw_placeholders/fire-01.ogg", "weapons/arccw_ur/aw_placeholders/fire-02.ogg", "weapons/arccw_ur/aw_placeholders/fire-03.ogg", "weapons/arccw_ur/aw_placeholders/fire-04.ogg", "weapons/arccw_ur/aw_placeholders/fire-05.ogg", "weapons/arccw_ur/aw_placeholders/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/aw_placeholders/fire-sup-01.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-02.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-03.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-04.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-05.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_600overkill")
end
                                        

                                  
do
    local att = {}

att.PrintName = "AWM 9x19mm Parabellum Receiver"
att.AbbrevName = "9x19mm"
att.Icon = Material("entities/att/uc_bullets/9x19.png", "mips smooth")
att.Description = "Conversion kit for the AWP that allows it to fire 9x19mm rounds. Cannot accept muzzle devices, and it also modifies the barrel, magwell, grip and stock."
att.Slot = "ur_aw_cal"

att.AutoStats = true
att.Desc_Pros = {

}
att.Desc_Cons = {
    "Disables Magazine attachments"
}

att.Override_ClipSize = 30

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "9x19mm Parabellum"

att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .75
att.Mult_Recoil = 0.28
att.Mult_HipDispersion = .75
att.Mult_CycleTime = 0.875

att.Mult_Penetration = 0.25
att.Mult_DamageMin = 0.35
att.Mult_Damage = 0.30
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "m16_380acp_fire.wav"}
local fire22sup = {path .. "m16_380acp_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

local slotinfo = {
    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/acwatt_ud_uzi_mag_32.png", "mips smooth")},
}

att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

att.GivesFlags = {"mag_9mm"}
att.ActivateElements = {"mag_9mm"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_9mm")
end
                                

                                        
do
    local att = {}

att.PrintName = ".338 Frangible Wildcat"
att.AbbrevName = ".338 Frangible"

att.SortOrder = 80
att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "Sintered copper powder pressed into the shape of a bullet, holding together exactly long enough to arrive. Against anything hard it turns back into powder on contact. Against anything soft it does not, and it dumps every bit of its energy in the first few inches.\n\nAgainst a person it does nearly double damage. Against anything hard it does under a third and stops there, because it has no penetration at all. Hit the target, not the wall they are behind."
att.Desc_Pros = {
    "Devastating against flesh",
}
att.Desc_Cons = {
    "Breaks up on hard cover",
    "Will not penetrate",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_aw_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = ".338 Lapua Frangible"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.15

att.Override_Penetration = 1

local SOFT = {
    [MAT_FLESH] = true,
    [MAT_BLOODYFLESH] = true,
    [MAT_ALIENFLESH] = true,
    [MAT_ANTLION] = true,
}

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    local soft = SOFT[hit.tr.MatType] or false

    if !soft and IsValid(ent) and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
        soft = true
    end

    hit.damage = hit.damage * (soft and 1.9 or 0.3)
    return hit
end

att.Mult_Range = 0.8
att.Mult_Recoil = 1.15
att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 1.1

local fire = {"weapons/arccw_ur/aw_placeholders/fire-01.ogg", "weapons/arccw_ur/aw_placeholders/fire-02.ogg", "weapons/arccw_ur/aw_placeholders/fire-03.ogg", "weapons/arccw_ur/aw_placeholders/fire-04.ogg", "weapons/arccw_ur/aw_placeholders/fire-05.ogg", "weapons/arccw_ur/aw_placeholders/fire-06.ogg"}
local firesup = {"weapons/arccw_ur/aw_placeholders/fire-sup-01.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-02.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-03.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-04.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-05.ogg", "weapons/arccw_ur/aw_placeholders/fire-sup-06.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_frangible")
end
                                      

                                    
do
    local att = {}

att.PrintName = "AWM Gauss Receiver"
att.AbbrevName = "Gauss"
att.Icon = Material("entities/att/arccw_gauss.png", "mips smooth")
att.Description = "Conversion kit for the AWP that allows it to fire a high concentration of Tau particles at a single target with great precision. Totally not stolen from the Black Mesa Research Facility... \n\n\"Tell me, Dr. Freeman, if you can. You have destroyed so much. What is it, exactly, that you have created? Can you name even one thing? I thought not.\""
att.Slot = "ur_aw_cal"

att.AutoStats = true
att.Desc_Pros = {
    "Aim at the floor and fire to launch yourself",
    "Rounds ricochet off hard surfaces",
}
att.Desc_Cons = {
    "Disables Magazine attachments"
}

att.Mult_Damage = 450
att.Mult_DamageMin = 200
att.Override_Range = 755
att.Override_RangeMin = 125

att.Mult_PhysBulletMuzzleVelocity = 5256
att.Override_PhysTracerProfile = 4
att.Override_AlwaysPhysBullet = true

att.Mult_Penetration = 450
att.Mult_Recoil = 8.55
att.Mult_CycleTime = 0.95
att.Mult_ReloadTime = 5.55 / 5.15

att.Mult_ShootSpeedMult = 0.77

att.Override_Tracer = "ToolTracer"
att.Override_TracerNum = 1
att.Override_TracerCol = Color(240, 176, 27)
att.Mult_TracerWidth = 3

att.Hook_BulletHit = function(wep, data)
    if CLIENT then return end
    if data.tr.HitNonWorld then return end

    UC_Extras.Ricochet(wep, data, 0.65)
    return false
end

att.Hook_PostFireBullets = function(wep)
    UC_Extras.RecoilJump(wep, 1250, 260)
end
local path = "weapons/awp_gauss/"

local fire22 = {path .. "awpgauss_fire.wav"}
local fire22sup = {path .. "awpgauss_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "awpgauss_fire.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "awpgauss_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_gauss"
end

local slotinfo = {
    [5] = {"5-Round Mag", "5-Round Mag", Material("entities/att/ur_aw/mag338_5.png", "mips smooth")},
}

att.Hook_GetDefaultAttIcon = function(wep, slot)
    if slotinfo[slot] then
        return slotinfo[slot][3]
    end
end

att.Override_Trivia_Calibre = "Gauss"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_Ammo = "SniperPenetratedRound"
att.GivesFlags = {"mag_gauss"}
att.ActivateElements = {"mag_gauss"}

    ArcCW.LoadAttachmentType(att, "ur_aw_cal_gauss")
end
                                  

                                 
do
    local att = {}

att.PrintName = "AW 30-Round C-Mag"
att.AbbrevName = "30-Round C-Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AP 30-Round C-Mag"
end

att.SortOrder = 10
att.Icon = Material("entities/att/acwatt_ud_m16_mag_100.png", "mips smooth")
att.Description = "Double drum magazine for the Arctic Warfare. The extra rounds add weight to the magazine, but allow for many shots to be taken between reloads."
att.Desc_Pros = {}
att.Desc_Neutrals = {}
att.Slot = "ur_aw_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 30

att.Desc_Cons = {
}

att.Mult_SightTime = 1.35
att.Mult_ReloadTime = 5.715 / 5.15
att.Mult_Sway = 1.35

att.Mult_SpeedMult = 0.875
att.Mult_ShootSpeedMult = 0.90

att.Mult_HipDispersion = 1.35

att.ActivateElements = {"mag_30"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_30"
end

    ArcCW.LoadAttachmentType(att, "ur_aw_mag_30")
end
                               

                                                        
do
    local att = {}

att.PrintName = "AI Ironsight Brake UNIVERSAL"
att.Icon = Material("entities/att/ur_aw/muzzle_sights.png", "mips smooth")
att.Description = "Light muzzle brake unique to the AW platform.\n\nEquips alternative \"compact\" iron sights."
att.AutoStats = true
att.Slot = {"muzzle"}

att.Mult_Recoil = .9
att.Mult_RecoilSide = .9

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.05

att.SortOrder = 998

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
att.Model = "models/weapons/arccw/ur_aw_muzzlesight.mdl"
att.ModelScale = Vector(2/3,2/3,2/3)
att.ModelOffset = Vector(0,0,-.075)

att.GivesFlags = {"sights_compact"}

    ArcCW.LoadAttachmentType(att, "ur_aw_muzzle_brake_sights_universal")
end
                                                      

                                                 
do
    local att = {}

att.PrintName = "AI Muzzle Brake UNIVERSAL"
att.Icon = Material("entities/att/ur_aw/muzzle.png", "mips smooth")
att.Description = "Light muzzle brake unique to the AW platform."
att.AutoStats = true
att.Slot = {"muzzle"}

att.Mult_Recoil = .9
att.Mult_RecoilSide = .9

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.05
att.Mult_Sway = 1.05

att.SortOrder = 999

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
att.Model = "models/weapons/arccw/ur_aw_muzzle.mdl"
att.ModelScale = Vector(2/3,2/3,2/3)
att.ModelOffset = Vector(0,0,-.075)

    ArcCW.LoadAttachmentType(att, "ur_aw_muzzle_brake_universal")
end
                                               

                                     
do
    local att = {}

att.PrintName = "Volga Super 10 Bore Buck and Ball"
att.AbbrevName = "10 Bore Buck and Ball"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "The old militia load: one undersized musket ball rattling loose down the barrel with three buckshot stacked behind it. It patterns like a thrown handful of gravel and was standard issue for most of a century anyway.\n\nThe loose ball skips off hard surfaces at an angle and keeps travelling for 60 percent damage, so shots into stone corridors keep working after they miss. Accuracy is genuinely poor."
att.Desc_Pros = {
    "Bounces off walls and floors",
    "Heavy close range hit",
}
att.Desc_Cons = {
    "Very inaccurate",
    "Short ranged",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "10 Bore"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1.1

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.0
att.Mult_Range = 0.6
att.Mult_AccuracyMOA = 2.0
att.Mult_HipDispersion = 1.3
att.Mult_Recoil = 1.35
att.Mult_RPM = 0.85
att.Add_Penetration = 3

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.6)
    end

    return hit
end
att.Mult_ShootPitch = 0.75
att.Mult_ShootVol = 1.35

local fire = {"weapons/arccw_ur/dbs/fire-01.ogg", "weapons/arccw_ur/dbs/fire-02.ogg", "weapons/arccw_ur/dbs/fire-03.ogg", "weapons/arccw_ur/dbs/fire-04.ogg", "weapons/arccw_ur/dbs/fire-05.ogg", "weapons/arccw_ur/dbs/fire-06.ogg"}
local firesup = {"weapons/arccw_ud/870/fire_supp.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-shotgun-01.ogg", "arccw_uc/common/fire-dist-int-shotgun-02.ogg", "arccw_uc/common/fire-dist-int-shotgun-03.ogg", "arccw_uc/common/fire-dist-int-shotgun-04.ogg", "arccw_uc/common/fire-dist-int-shotgun-05.ogg", "arccw_uc/common/fire-dist-int-shotgun-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_db_cal_10bore")
end
                                   

                                          
do
    local att = {}

att.PrintName = "Volga Super .50-140 Sharps Conversion"
att.AbbrevName = ".50-140 Sharps"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A buffalo cartridge from the very end of the buffalo, holding a hundred and forty grains of black powder behind a half inch lead bullet. By the time it was standardised there was almost nothing left on the plains to shoot with it.\n\nThe first hit tags the target for five seconds. Any further hits while the tag is live do 75 percent more damage. Follow-up shots are the whole point, so this rewards you for staying on one target instead of spreading fire."
att.Desc_Pros = {
    "Second and later hits on a tagged target hit far harder",
}
att.Desc_Cons = {
    "Slow to cycle",
    "Heavy recoil",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_db_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".50-140 Sharps"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"ur_izh_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.4
att.Mult_Penetration = 1.5
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.5
att.Mult_Recoil = 1.5
att.Mult_RPM = 0.7
att.Mult_ShootVol = 1.35
att.Mult_ShootPitch = 0.7

local TAG_TIME = 5
local TAG_MULT = 1.75

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    if (ent.UC_TagUntil or 0) > CurTime() then
        hit.damage = hit.damage * TAG_MULT
    end

    ent.UC_TagUntil = CurTime() + TAG_TIME

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

    ArcCW.LoadAttachmentType(att, "ur_db_cal_50140sharps")
end
                                        

                                               
do
    local att = {}

att.PrintName = "IZh-58 12\" Airpod Shotty Barrel"
att.AbbrevName = "12\" Airpod Shotty Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Volga SuperShotgun 12\" Airpod Shotty Barrel"
end

att.Icon = Material("entities/att/arccw_airpodshotty.png","smooth mips")
att.Description = "Black market sawn-off barrel supposedly \"manufactured by Apple\". Loud, proud, and it shoves back hard enough that pointing it at your own feet is a legitimate way to get onto a roof. And remember, if you do not know where to hide the body, just ask Siri.\n\n\"Airpod shotty, i'mma catch a body!\""
att.Slot = {"ur_db_barrel"}
att.AutoStats = true
att.SortOrder = 12

att.Mult_Damage = 3.5
att.Mult_DamageMin = 2
att.Mult_Penetration = 5.5

att.Add_BarrelLength = -16
att.Mult_Sway = .6
att.Mult_SightTime = 0.70
att.Mult_DrawTime = .85
att.Mult_HolsterTime = .85
att.Mult_SpeedMult = 1.03
att.Mult_HipDispersion = 0.75

att.Mult_Recoil = 1.45
att.Mult_AccuracyMOA = 2
att.Mult_Range = .65

att.Hook_PostFireBullets = function(wep)
    UC_Extras.RecoilJump(wep, 900, 200)
end

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/airpodshotty/airpodshotty_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/airpodshotty/airpodshotty_fire_dist.wav" end
end

att.ActivateElements = {"barrel_sw"}
att.GivesFlags = {"sawnoff"}

    ArcCW.LoadAttachmentType(att, "ur_dbs_barrel_airpodshotty")
end
                                             

                                          
do
    local att = {}

att.PrintName = "6\" Desert Eagle Auto Barrel"
att.AbbrevName = "6\" Auto Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "6\" Predator Compensated Barrel"
end
att.Icon = Material("entities/att/arccw_uc_deagle_auto.png","smooth mips")
att.Description = "Black market barrel that converts the weapon into a full-auto variant known as the \"Thunderbird\". \n\n\"For when you want to make sure the target, the target's friends, and the target's distant relatives all get the message.\""
att.Slot = "ur_deagle_barrel"
att.AutoStats = true
att.Desc_Cons = {
}
att.SortOrder = 6

att.Mult_Recoil = 0.83
att.Mult_RecoilSide = 0.73
att.Mult_VisualRecoilMult = 1.13
att.Mult_ShootVol = 1.15
att.Mult_Range = 1.02
att.Mult_ShootPitch = 1.07
att.Mult_RPM = 1.43
att.Override_Firemodes = {
    {
        Mode = 2,
    },
}

att.ActivateElements = {"ur_deagle_barrel_auto", "tac_rail"}
att.GivesFlags = {"barrel_annihilator"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_barrel_auto")
end
                                        

                                                 
do
    local att = {}

att.PrintName = "6\" Competition Barrel"
att.AbbrevName = "6\" Competition Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "6\" Competition Barrel"
end
att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_modern.png","smooth mips")
att.Description = "This barrel has it's gas system removed, making it manual-action only."
att.Slot = "ur_deagle_barrel"
att.SortOrder = 5.5

att.AutoStats = true

att.Mult_Sway = 0.80
att.Mult_HipDispersion = 0.85
att.Mult_SightTime = 1.15
att.Mult_PhysBulletMuzzleVelocity = 2.50
att.Mult_RecoilSide = 0.8

att.Mult_AccuracyMOA = 0.80
att.Mult_Range = 1.35
att.Mult_Recoil = 0.75

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

    ArcCW.LoadAttachmentType(att, "ur_deagle_barrel_competition")
end
                                               

                                                  
do
    local att = {}

att.PrintName = "12\" Marksman Barrel"
att.AbbrevName = "12\" Marksman Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "12\" Predator Marksman Barrel"
end
att.Icon = Material("","smooth mips")
att.Description = "Slightly longer marksman barrel with extra weight for further recoil reduction"
att.Slot = "ur_deagle_barrel"
att.AutoStats = true
att.Desc_Cons = {
}
att.SortOrder = 12

att.Mult_Recoil = 0.65
att.Mult_RecoilSide = 0.70
att.Mult_VisualRecoilMult = 0.90
att.Mult_ShootVol = 1.15
att.Mult_Range = 2.2
att.Mult_ShootPitch = 0.95
att.Mult_HipDispersion = 1.30
att.Mult_AccuracyMOA = 0.40
att.Mult_RPM = 0.80

att.ActivateElements = {"ur_deagle_barrel_ultralong"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_barrel_fullmarksman")
end
                                                

                                          
do
    local att = {}

att.PrintName = "2\" Desert Eagle Stub Barrel"
att.AbbrevName = "2\" Stub Barrel"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "2\" Predator Stub Barrel"
end
att.Icon = Material("","smooth mips")
att.Description = "Custom small barrel for the Desert Eagle that maintains the frame and grip size."
att.Slot = "ur_deagle_barrel"
att.AutoStats = true
att.SortOrder = 2

att.Mult_AccuracyMOA = 1.45
att.Mult_Range = 0.7
att.Mult_SightTime = 0.7
att.Mult_Sway = 0.6
att.Add_BarrelLength = -5.5
att.Mult_HipDispersion = 0.80

att.Mult_DrawTime = 0.7
att.Mult_HolsterTime = 0.7

att.ActivateElements = {"ur_deagle_barrel_snub"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_barrel_stub")
end
                                        

                                             
do
    local att = {}

att.PrintName = "2\" Desert Eagle Stub Kit"
att.AbbrevName = "2\" Stub Kit"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "2\" Predator Stub Kit"
end
att.Icon = Material("","smooth mips")
att.Description = "Custom small barrel and frame kit for the Desert Eagle that make it as compact as possible."
att.Slot = "ur_deagle_barrel"
att.AutoStats = true
att.SortOrder = 2

att.Mult_AccuracyMOA = 1.45
att.Mult_Range = 0.7
att.Mult_SightTime = 0.55
att.Mult_Sway = 0.55
att.Add_BarrelLength = -5.5
att.Mult_HipDispersion = 0.70

att.Mult_DrawTime = 0.6
att.Mult_HolsterTime = 0.6

att.ActivateElements = {"ur_deagle_kit_snub"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_barrel_stubkit")
end
                                           

                                              
do
    local att = {}

att.PrintName = "Desert Eagle 10mm HE Conversion"
att.AbbrevName = "10mm HE"
att.Icon = Material("entities/att/uc_bullets/44special.png","smooth mips")
att.Description = "Experimental pistol-caliber grenade rounds for the Desert Eagle. Not very reliable and the round capacity is limited."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator 10mm HE Conversion"
end

local path = ")^weapons/misc/"
local fire357 = {path .. "deagle_10mm_he_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire357sup
    else
        return fire357
    end
end

local tail = ")/weapons/misc/"
local fire357dist = {tail .. "deagle_10mm_he_fire_dist.wav"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire357dist
    end
end

att.AutoStats = true
att.Slot = "ur_deagle_caliber"

att.Override_ClipSize = 3
att.Mult_Recoil = 0.83
att.Mult_Damage = 1.66
att.Mult_DamageMin = 1.56
att.Mult_Penetration = 1.23
att.Mult_Range = 1.48
att.Mult_ReloadTime = 0.82
att.Override_PhysBulletMuzzleVelocity = 2255

att.Mult_ShootSpeedMult = 0.89
att.Mult_RPM = 0.78
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Mult_MuzzleVelocity = 745
att.Mult_ReloadTime = 0.85

att.Override_Trivia_Calibre = "10mm HE"
att.Override_Ammo = "SMG1_Grenade"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_10mm_he")
end
                                            

                                            
do
    local att = {}

att.PrintName = "Desert Eagle .17 HMR Conversion"
att.AbbrevName = ".17 HMR"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "A .22 Magnum case necked down around a seventeen calibre bullet, which leaves the barrel at well over seven hundred metres a second and arrives having lost interest in existing. Superbly accurate and completely inconsequential."
att.Desc_Pros = {
    "Extremely accurate and flat",
    "No recoil at all",
}
att.Desc_Cons = {
    "Feeble",
    "Stopped by anything solid",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".17 Hornady Magnum Rimfire"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 0.85

att.Mult_Damage = 0.3
att.Mult_DamageMin = 0.25
att.Mult_Penetration = 0.3
att.Mult_Range = 1.3
att.Mult_RangeMin = 1.2
att.Mult_MuzzleVelocity = 1.5
att.Mult_Recoil = 0.25
att.Mult_RecoilSide = 0.25
att.Mult_VisualRecoilMult = 0.3
att.Mult_RPM = 1.35
att.Mult_ClipSize = 1.5
att.Mult_AccuracyMOA = 0.45
att.Mult_ShootVol = 0.6
att.Mult_ShootPitch = 1.35

local fire = {"weapons/arccw_ud/glock/fire_22.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_22.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_17hmr")
end
                                          

                                           
do
    local att = {}

att.PrintName = "Desert Eagle .22 Long Rifle Conversion"
att.AbbrevName = ".22 Long Rifle"
att.Icon = Material("entities/att/uc_bullets/22lr.png","smooth mips")
att.Description = "Conversion of the weapon to an extremely light round used for plinking."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator .22 Long Rifle Conversion"
end

local path = ")^weapons/m1911_357mag/"
local fire357 = {path .. "deagle_22lr_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire357sup
    else
        return fire357
    end
end

local tail = ")/weapons/m1911_357mag/"
local fire357dist = {tail .. "deagle_22lr_fire.wav"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire357dist
    end
end

att.AutoStats = true
att.Slot = "ur_deagle_caliber"

att.Mult_Recoil = 0.31
att.Mult_Damage = 0.22
att.Mult_DamageMin = 0.16
att.Mult_Penetration = 0.075
att.Mult_Range = 1.12
att.Mult_ReloadTime = 0.76
att.Override_PhysTracerProfile = "uc_plinking"

att.Mult_ShootSpeedMult = 1.34
att.Mult_RPM = 1.67
att.Mult_ClipSize = 1.5

att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_22lr")
end
                                         

                                            
do
    local att = {}

att.PrintName = "Desert Eagle .22 WMR Conversion"
att.AbbrevName = ".22 WMR"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "A lengthened, hotter rimfire that does roughly twice what a .22 Long Rifle does, which still leaves it doing very little. In a pistol this size the whole cartridge disappears into the chamber like a raisin in a shoebox."
att.Desc_Pros = {
    "Effectively no recoil",
    "Enormous magazine",
}
att.Desc_Cons = {
    "Very weak",
    "Poor penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 Winchester Magnum Rimfire"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.35
att.Mult_DamageMin = 0.32
att.Mult_Penetration = 0.4
att.Mult_Range = 0.8
att.Mult_RangeMin = 0.85
att.Mult_MuzzleVelocity = 1.1
att.Mult_Recoil = 0.3
att.Mult_RecoilSide = 0.3
att.Mult_VisualRecoilMult = 0.35
att.Mult_RPM = 1.3
att.Mult_ClipSize = 1.6
att.Mult_AccuracyMOA = 0.85
att.Mult_ShootVol = 0.65
att.Mult_ShootPitch = 1.3

local fire = {"weapons/arccw_ud/glock/fire_22.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_22.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_22wmr")
end
                                          

                                           
do
    local att = {}

att.PrintName = "Desert Eagle 28 Gauge Conversion"
att.AbbrevName = "28 Gauge"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "A smoothbore barrel and a magazine of small bore shotshells, which makes the Desert Eagle into something between a handgun and a garden implement. Twenty eight bore is a light, sweet shooting gauge, right up until it is coming out of a pistol.\n\nThis makes the pistol count as a real shotgun. Six pellets in a wide pattern, no penetration, effective for about four metres and useless past that. Because the gun now registers as a shotgun, the Ammo Type slot swaps from bullets over to shotgun shells, so slugs, flechettes, dragon's breath and the depleted uranium loads all become available on it."
att.Desc_Pros = {
    "Wide pattern at contact distance",
    "Opens up every shotgun shell type",
}
att.Desc_Cons = {
    "Effective for about four metres",
    "No penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "28 Gauge"

att.Override_IsShotgun = true

att.Override_Ammo = "buckshot"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1.15
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_HullSize = 0.1
att.Override_Penetration = 1

att.Override_Num = 6

att.Override_AccuracyMOA = 30
att.Override_AccuracyMOA_Priority = 0

att.Mult_Damage = 0.3
att.Mult_DamageMin = 0.24
att.Mult_Range = 0.25
att.Mult_RangeMin = 0.3
att.Mult_Recoil = 1.35
att.Mult_RPM = 0.8
att.Mult_ClipSize = 0.6
att.Mult_HipDispersion = 1.5
att.Mult_ShootPitch = 1.1

local slotinfo = {
    [9] = {"\"BUCK\" #4 Buckshot", "\"BUCK\" #4 Buckshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
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
att.Mult_ShootVol = 1.0

local fire = {"weapons/arccw_ud/870/fire-01.ogg", "weapons/arccw_ud/870/fire-02.ogg", "weapons/arccw_ud/870/fire-03.ogg", "weapons/arccw_ud/870/fire-04.ogg", "weapons/arccw_ud/870/fire-05.ogg", "weapons/arccw_ud/870/fire-06.ogg"}
local firesup = {"weapons/arccw_ud/870/fire_supp.ogg"}
local firetail = {"arccw_uc/common/fire-dist-int-shotgun-01.ogg", "arccw_uc/common/fire-dist-int-shotgun-02.ogg", "arccw_uc/common/fire-dist-int-shotgun-03.ogg", "arccw_uc/common/fire-dist-int-shotgun-04.ogg", "arccw_uc/common/fire-dist-int-shotgun-05.ogg", "arccw_uc/common/fire-dist-int-shotgun-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_28ga")
end
                                         

                                                
do
    local att = {}

att.PrintName = "Desert Eagle .440 Cor-Bon Conversion"
att.AbbrevName = ".440 Cor-Bon"
att.Icon = Material("entities/att/uc_bullets/357sig.png","smooth mips")
att.Description = "The .440 Cor-Bon is a large-caliber handgun cartridge, first produced by Cor-Bon in 1998. Although it looks similar to a .357 SIG, this cartridge was designed after being necked down from an existing cartridge, the .50 AE to accept a .44-caliber bullet. Cor-Bon created a lighter recoiling round than the .50 AE with greater penetrating power than the .50 AE and .44 Magnum."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator .440 Cor-Bon Conversion"
end

local path = ")^weapons/m1911_357mag/"
local fire357 = {path .. "deagle_440corbon_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire357sup
    else
        return fire357
    end
end

local tail = ")/weapons/m1911_357mag/"
local fire357dist = {tail .. "deagle_440corbon_fire.wav"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire357dist
    end
end

att.AutoStats = true
att.Slot = "ur_deagle_caliber"

att.Mult_Recoil = 0.83
att.Mult_Damage = 1.42
att.Mult_DamageMin = 1.34
att.Mult_Penetration = 1.53
att.Mult_Range = 1.38
att.Mult_ReloadTime = 0.85
att.Override_PhysBulletMuzzleVelocity = 2255

att.Mult_ShootSpeedMult = 0.98
att.Mult_RPM = 0.97

att.Override_Trivia_Calibre = ".440 Cor-Bon"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_440corbon")
end
                                              

                                               
do
    local att = {}

att.PrintName = "Desert Eagle .45 Raptor Conversion"
att.AbbrevName = ".45 Raptor"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Description = "A .308 case cut down to take a .45 bullet, built for long slide autoloaders by people who wanted rifle brass in a pistol. It headspaces on the shoulder, which no other .45 does.\n\nDamage climbs as the target weakens, up to 90 percent extra against somebody nearly down. Heavy and reliable to begin with, so it opens well and closes very hard."
att.Desc_Pros = {
    "Damage climbs sharply against wounded targets",
    "Heavy, reliable hits",
}
att.Desc_Cons = {
    "Slow to cycle",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".45 Raptor"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 0.95

att.Mult_Damage = 1.4
att.Mult_DamageMin = 1.35
att.Mult_Penetration = 1.4
att.Mult_Range = 1.3
att.Mult_RangeMin = 1.25
att.Mult_Recoil = 1.25
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.8
att.Mult_ShootVol = 1.2

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local maxhp = ent.GetMaxHealth and ent:GetMaxHealth() or 100
    if maxhp <= 0 then return hit end

    local frac = math.Clamp(ent:Health() / maxhp, 0, 1)
    hit.damage = hit.damage * Lerp(1 - frac, 1, 1.9)

    return hit
end
att.Mult_ShootPitch = 0.9

local fire = {"weapons/arccw_ud/glock/fire_45.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_45.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_45.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_45raptor")
end
                                             

                                            
do
    local att = {}

att.PrintName = "Desert Eagle .460 S&W Magnum Conversion"
att.AbbrevName = ".460 S&W"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/454casull.png", "smooth mips")
att.Description = "The .500's flatter shooting sibling, a lengthened Casull case driving a lighter bullet considerably faster. It gives up a little of the sledgehammer for a great deal of reach, which on a handgun is an unusual thing to be offered."
att.Desc_Pros = {
    "Flattest shooting magnum here",
    "Excellent penetration",
}
att.Desc_Cons = {
    "Heavy recoil",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".460 S&W Magnum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1.05

att.Mult_Damage = 1.8
att.Mult_DamageMin = 1.85
att.Mult_Penetration = 1.8
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.55
att.Mult_MuzzleVelocity = 1.4
att.Mult_Recoil = 1.7
att.Mult_VisualRecoilMult = 1.6
att.Mult_RPM = 0.75
att.Mult_ClipSize = 0.6
att.Mult_AccuracyMOA = 0.85
att.Mult_ShootVol = 1.4
att.Mult_ShootPitch = 0.8

local fire = {"weapons/arccw_ud/glock/fire_50.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_50.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_50.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_460sw")
end
                                          

                                             
do
    local att = {}

att.PrintName = "Desert Eagle .499 LWR Conversion"
att.AbbrevName = ".499 LWR"

att.SortOrder = 77
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "Wilson Combat's half inch answer to the .50 Beowulf, built to do the same job without infringing on anybody's trademark. It is very slightly smaller and very slightly better, which was the entire point.\n\nHits up to 90 percent harder against a target at full health, falling back to normal as they get hurt. An opener: the first shot on somebody fresh is enormous and the follow-ups are ordinary."
att.Desc_Pros = {
    "Enormous against undamaged targets",
    "Heavy even on a normal hit",
}
att.Desc_Cons = {
    "No better than normal against wounded targets",
    "Heavy recoil",
    "Small magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".499 LWR"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.3
att.Mult_Penetration = 1.5
att.Mult_Range = 1.2
att.Mult_Recoil = 1.7
att.Mult_VisualRecoilMult = 1.6
att.Mult_RPM = 0.75
att.Mult_ClipSize = 0.6
att.Mult_ShootVol = 1.45
att.Mult_ShootPitch = 0.7

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local maxhp = ent.GetMaxHealth and ent:GetMaxHealth() or 100
    if maxhp <= 0 then return hit end

    local frac = math.Clamp(ent:Health() / maxhp, 0, 1)
    hit.damage = hit.damage * Lerp(frac, 1, 1.9)

    return hit
end

local fire = {"weapons/arccw_ud/glock/fire_50.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_50.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_50.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_499lwr")
end
                                           

                                                     
do
    local att = {}

att.PrintName = "Desert Eagle .500 Bushwhacker Conversion"
att.AbbrevName = ".500 Bushwhacker"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A wildcat built by shortening a .460 Weatherby magnum case so it will just about fit a revolver cylinder, producing more muzzle energy than most hunting rifles. It exists because somebody looked at the .500 S&W and found it insufficiently committed."
att.Desc_Pros = {
    "More energy than most rifles",
}
att.Desc_Cons = {
    "Barely controllable",
    "Two or three rounds",
    "Very slow",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".500 Bushwhacker"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.2

att.Mult_Damage = 2.3
att.Mult_DamageMin = 2.2
att.Mult_Penetration = 2.0
att.Mult_Range = 1.4
att.Mult_RangeMin = 1.35
att.Mult_Recoil = 2.4
att.Mult_RecoilSide = 2.0
att.Mult_VisualRecoilMult = 2.2
att.Mult_RPM = 0.55
att.Mult_ClipSize = 0.4
att.Mult_ReloadTime = 1.25
att.Mult_ShootVol = 1.6
att.Mult_ShootPitch = 0.62

local fire = {"weapons/arccw_ud/glock/fire_50.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_50.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_50.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_500bushwhacker")
end
                                                   

                                            
do
    local att = {}

att.PrintName = "Desert Eagle .500 S&W Magnum Conversion"
att.AbbrevName = ".500 S&W"

att.SortOrder = 68
att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Smith and Wesson built this to reclaim the title of most powerful production handgun cartridge, and did so by a margin nobody has seriously contested since. Putting it in an autoloader was somebody else's idea and a worse one."
att.Desc_Pros = {
    "Colossal damage",
}
att.Desc_Cons = {
    "Very heavy recoil",
    "Tiny magazine",
    "Slow to recover",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".500 S&W Magnum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1.15

att.Mult_Damage = 2.0
att.Mult_DamageMin = 1.9
att.Mult_Penetration = 1.5
att.Mult_Range = 1.25
att.Mult_RangeMin = 1.2
att.Mult_Recoil = 1.9
att.Mult_RecoilSide = 1.6
att.Mult_VisualRecoilMult = 1.8
att.Mult_RPM = 0.7
att.Mult_ClipSize = 0.55
att.Mult_ShootVol = 1.45
att.Mult_ShootPitch = 0.72

local fire = {"weapons/arccw_ud/glock/fire_50.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_50.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_50.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_500sw")
end
                                          

                                            
do
    local att = {}

att.PrintName = "Desert Eagle .50 BMG Conversion"
att.AbbrevName = ".50 BMG"
att.Icon = Material("entities/att/uc_bullets/338lapua.png","smooth mips")
att.Description = "In response to the need for new anti-aircraft weaponry during World War I, John Browning developed the .50 BMG. He wanted the round to be used in a machine gun based on a scaled-up version of the M1917 Browning. \n The .50 BMG cartridge is also used in anti-materiel rifles. A wide variety of ammunition is available, and the availability of match grade ammunition has increased the usefulness of .50 caliber rifles by allowing more accurate fire than lower-quality rounds. \n\n\"Sometimes, overkill is just the right amount of kill.\""

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator .50 BMG Conversion"
end

local path = ")^weapons/m1911_357mag/"
local fire357 = {path .. "deagle_50bmg_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire357sup
    else
        return fire357
    end
end

local tail = ")/weapons/m1911_357mag/"
local fire357dist = {tail .. "deagle_50bmg_fire_dist.wav"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire357dist
    end
end

att.AutoStats = true
att.Slot = "ur_deagle_caliber"

att.Override_ClipSize = 1
att.Mult_Recoil = 1.85
att.Mult_Damage = 2.55
att.Mult_DamageMin = 2.44
att.Mult_Penetration = 1.85
att.Mult_Range = 2.25
att.Mult_ReloadTime = 0.85
att.Override_PhysBulletMuzzleVelocity = 2255

att.Mult_ShootSpeedMult = 0.8
att.Mult_RPM = 0.67

att.Override_Trivia_Calibre = ".50 BMG"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.50

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_50bmg")
end
                                          

                                                 
do
    local att = {}

att.PrintName = "Desert Eagle .675 Needler Conversion"
att.AbbrevName = ".675 Needler"

att.SortOrder = 69
att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Three shards of a pink crystalline mineral per shot, packed nose out in an oversized case. They barely scratch on the way in, then lodge, resonate and come apart a moment later, taking a good deal of the surrounding area with them."
att.Desc_Pros = {
    "Shards detonate a moment after landing",
    "Three per shot",
}
att.Desc_Cons = {
    "Almost harmless on impact",
    "Short ranged",
    "No penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ur_deagle_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".675 Needler"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1.1
att.Override_Num = 3
att.Override_Num_Priority = 2
att.Override_Penetration = 0

local FUSE = 1.1
local RADIUS = 90

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or NULL
    local pos = hit.tr.HitPos
    local dmg = hit.damage * 2.4

    timer.Simple(FUSE, function()
        if !IsValid(owner) then return end

        util.BlastDamage(IsValid(wep) and wep or owner, owner, pos, RADIUS, dmg)

        local eff = EffectData()
        eff:SetOrigin(pos)
        eff:SetMagnitude(2)
        eff:SetScale(0.4)
        eff:SetRadius(3)
        util.Effect("Explosion", eff)
    end)

    return hit
end

att.Mult_Damage = 0.3
att.Mult_DamageMin = 0.28
att.Mult_Range = 0.6
att.Mult_RangeMin = 0.65
att.Mult_MuzzleVelocity = 0.75
att.Mult_Recoil = 0.9
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.7
att.Mult_ShootPitch = 1.22
att.Mult_ShootVol = 0.9

local fire = {"weapons/arccw_ud/glock/fire_357.ogg"}
local firesup = {"weapons/arccw_ud/glock/fire_supp_357.ogg"}
local firetail = {"weapons/arccw_ud/glock/fire_dist_357.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_675needler")
end
                                               

                                          
do
    local att = {}

att.PrintName = "Desert Eagle 9x19mm Parabellum Conversion"
att.AbbrevName = "9x19mm Parabellum"
att.Icon = Material("entities/att/uc_bullets/9x19.png","smooth mips")
att.Description = "Conversion of the Desert Eagle to the more common and available 9mm Parabellum cartridge, it is considerably weaker but it improves accuracy and overall handling."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator 9x19mm Parabellum Conversion"
end

local path = ")^weapons/m1911_357mag/"
local fire357 = {path .. "deagle_9mm_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire357sup
    else
        return fire357
    end
end

local tail = ")/weapons/m1911_357mag/"
local fire357dist = {tail .. "deagle_9mm_fire_dist.wav"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire357dist
    end
end

att.AutoStats = true
att.Slot = "ur_deagle_caliber"

att.Mult_ClipSize = 1.4
att.Mult_Recoil = 0.47
att.Mult_Damage = 0.40
att.Mult_DamageMin = 0.44
att.Mult_Penetration = 0.30

att.Mult_ShootSpeedMult = 1.2
att.Mult_RPM = 1.42

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.ActivateElements = {"ur_deagle_caliber_9mm"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_caliber_9mm")
end
                                        

                                      
do
    local att = {}

att.PrintName = "Desert Eagle 100-Round C-Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator 100-Round C-Mag"
end
att.AbbrevName = "100-Round C-Mag"
att.Icon = Material("entities/att/acwatt_ud_glock_mag_100.png","mips smooth")
att.Description = "A bulky and impractical twin drum magazine increases the time you can spend without reloading. However, the excessive amount of rounds as well as the magazine itself add infinitely more weight to an already unwieldy weapon."
att.Slot = "ur_deagle_mag"
att.AutoStats = true

att.Override_ClipSize = 100
att.Mult_SightTime = 1.325
att.Mult_ReloadTime = 1.40
att.Mult_Sway = 1.775
att.Mult_SpeedMult = 0.80
att.Mult_ShootSpeedMult = 0.85

att.Mult_HipDispersion = 1.45

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_32"
end

att.ActivateElements = {"ur_deagle_mag_cmag"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_mag_100")
end
                                    

                                       
do
    local att = {}

att.PrintName = "Desert Eagle 32-Round Drum Magazine"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Predator 32-Round Drum Magazine"
end
att.AbbrevName = "32-Round Extended Mag"
att.Icon = Material("entities/att/ur_mp5/mag50.png","mips smooth")
att.Description = "A bulky and impractical drum magazine increases the time you can spend without reloading. However, the excessive amount of rounds as well as the magazine itself add infinitely more weight to an already unwieldy weapon."
att.Slot = "ur_deagle_mag"
att.AutoStats = true

att.Override_ClipSize = 32
att.Mult_SightTime = 1.262
att.Mult_ReloadTime = 1.30
att.Mult_Sway = 1.775
att.Mult_SpeedMult = 0.80
att.Mult_ShootSpeedMult = 0.85

att.Mult_HipDispersion = 1.45

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_32"
end

att.ActivateElements = {"ur_deagle_mag_drum"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_mag_drum")
end
                                     

                                       
do
    local att = {}

att.PrintName = "Predator 4-Round Mini Mag"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Desert Eagle 4-Round Mini Mag"
end
att.AbbrevName = "4-Round Mini Mag"
att.Icon = Material("","mips smooth")
att.Description = "A small 4-round magazine that is only compatible with a compact frame."
att.Slot = "ur_deagle_mag"
att.AutoStats = true

att.Override_ClipSize = 4
att.Mult_SightTime = 0.80
att.Mult_ReloadTime = 0.70
att.Mult_Sway = 0.70
att.Mult_SpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.7

att.Mult_HipDispersion = 0.65

att.ActivateElements = {"ur_deagle_mag_small"}

att.RequireFlags = {"ur_deagle_kit_snub"}

    ArcCW.LoadAttachmentType(att, "ur_deagle_mini_mag")
end
                                     

                                      
do
    local att = {}

att.PrintName = "18\" Competition Barrel"
att.AbbrevName = "18\" Competition Barrel"

att.Icon = Material("","smooth mips")
att.Description = "This variant of the standard barrel is manual-action only, as the gas system was removed to improve performance."
att.Slot = "ur_g3_barrel"
att.Desc_Cons = {
    "uc.nofs",
}
att.AutoStats = true

att.SortOrder = 18

att.Mult_Recoil = 0.80
att.Mult_AccuracyMOA = 0.7
att.Mult_RangeMin = 4
att.Mult_Range = 1.45

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5
att.Mult_PhysBulletMuzzleVelocity = 2.50

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

    ArcCW.LoadAttachmentType(att, "ur_g3_barrel_comp")
end
                                    

                                     
do
    local att = {}

att.PrintName = "18\" EOD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Barrel and handguard assembly with a massive integrated muzzle brake to protect underbarrel weapons.\nDecreases muzzle rise, but performs poorly when hip firing."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.nomuzzle",
    "uc.nohg",
}
att.AutoStats = true

att.Slot = "ur_g3_barrel"

att.SortOrder = 18

att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15
att.Mult_Recoil = 0.8
att.Mult_AccuracyMOA = 0.75
att.Mult_HipDispersion = 1.2

att.ActivateElements = {"ur_g3_barrel_eod"}
att.GivesFlags = {"ur_g3_barrel_eod"}

    ArcCW.LoadAttachmentType(att, "ur_g3_barrel_eod")
end
                                   

                                          
do
    local att = {}

att.PrintName = "HK51 8\" Grip Barrel"
att.AbbrevName = "8\" Grip Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN102 8\" Grip Barrel"
    att.AbbrevName = "8\" Grip Barrel"
end

att.Icon = Material("","smooth mips")
att.Description = "Ridiculously short aftermarket barrel. Colloquially known as a \"flashbang dispenser,\" the tiny barrel drastically increases fire rate - for better and for worse. This variant has a built-in handguard with a grip."
att.Slot = "ur_g3_barrel"
att.Desc_Pros = {
    "ur.g3.8"
}
att.AutoStats = true

att.SortOrder = 8

att.Mult_SightTime = 0.90
att.Add_BarrelLength = -6
att.Mult_SightedSpeedMult = 1.2
att.Mult_HipDispersion = 0.65
att.Mult_Sway = 0.35

att.Mult_Recoil = 1.15
att.Mult_AccuracyMOA = 2
att.Mult_Range = 0.35
att.Mult_RPM = 1.2

att.LHIK = true

att.Model = "models/vergi_arccw/foregrip_lhik.mdl"
att.Override_HoldtypeActive = "smg"

att.GivesFlags = {"ur_g3_barrel_kurzgrip"}

    ArcCW.LoadAttachmentType(att, "ur_g3_barrel_kurzgrip")
end
                                        

                                    
do
    local att = {}

att.PrintName = "G3SD\" Silenced Barrel"
att.AbbrevName = "18\" SD Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AG58SD 18\" Silenced Barrel"
end

att.Icon = Material("","smooth mips")
att.Description = "Integrally suppressed barrel for the G3 platform."
att.Slot = "ur_g3_barrel"
att.AutoStats = true

att.SortOrder = 20

att.Mult_SightTime = 1.12
att.Mult_SightedSpeedMult = 0.95
att.Mult_HipDispersion = 1.12
att.Mult_Sway = 0.7

att.Mult_Recoil = 0.70
att.Mult_AccuracyMOA = 1.3
att.Mult_RPM = 0.80
att.Mult_HipDispersion = 0.65
att.Mult_ShootVol = 0.475
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

att.GivesFlags = {"ur_g3_barrel_sd"}

    ArcCW.LoadAttachmentType(att, "ur_g3_barrel_sd")
end
                                  

                                       
do
    local att = {}

att.PrintName = "G3\" Swordfish Barrel"
att.AbbrevName = "18\" Swordfish Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AG58 18\" Swordfish Barrel"
end

att.Icon = Material("","smooth mips")
att.Description = "Aftermarket barrel that aggressively counters recoil using an integrated compensator. The added weight makes the weapon harder to aim with."
att.Slot = "ur_g3_barrel"
att.AutoStats = true

att.SortOrder = 18

att.Mult_Recoil = 0.7

att.Mult_SightedSpeedMult = 0.8
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.5
att.Add_BarrelLength = 3

att.Mult_PhysBulletMuzzleVelocity = 1.35

att.ActivateElements = {"ur_g3_barrel_sword"}

    ArcCW.LoadAttachmentType(att, "ur_g3_barrel_sword")
end
                                     

                                  
do
    local att = {}

att.PrintName = "G3 Bayonet"
att.AbbrevName = "Muzzle Bayonet"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58 Bayonet"
end

att.Icon = Material("", "mips smooth")
att.Description = "Socket bayonet for the G3, clamped over the muzzle and the front sight block. Long barrels take the full blade, the shorter patterns take the cut-down one, since there is not enough barrel left forward of the handguard to hang the long one off."
att.Slot = {"ur_g3_bayobipod"}
att.AutoStats = true

att.SortOrder = 99998

att.Mult_MeleeDamage = 1.75
att.Mult_MeleeTime = 1.1
att.Mult_MeleeRange = 1.3

att.Mult_SpeedMult = 0.97
att.Mult_SightTime = 1.06
att.Mult_Sway = 1.08

    ArcCW.LoadAttachmentType(att, "ur_g3_bayonet")
end
                                

                                
do
    local att = {}

att.PrintName = "G3 Bipod"
att.AbbrevName = "Integrated Bipod"
att.Icon = Material("", "mips smooth")
att.Description = "Integrated bipod for G3."
att.Slot = {"ur_g3_bayobipod"}
att.AutoStats = true

att.SortOrder = 99999

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58 Bipod"
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = .95
att.Mult_SightedSpeedMult = 0.8
att.Mult_Sway = 1.5

att.Mult_Recoil = .8

att.Bipod = true
att.Mult_BipodRecoil = .25
att.Mult_BipodDispersion = .2


    ArcCW.LoadAttachmentType(att, "ur_g3_bipod")
end
                              

                                      
do
    local att = {}

att.PrintName = "MLOK Handguard"
att.Icon = Material("","smooth mips")
att.Description = "A full size MLOK-style handguard."
att.AutoStats = true
att.Desc_Neutrals = {
    "uc.cosmetic"
}

att.Slot = "ur_g3_handguard"

att.SortOrder = 5

    ArcCW.LoadAttachmentType(att, "ur_g3_hg_fullmlok")
end
                                    

                                 
do
    local att = {}

att.PrintName = "G3 10-Round Marksman Mag"
att.AbbrevName = "10-Round Marksman Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58 10-Round Marksman Mag"
end

att.Icon = Material("entities/att/ur_g3/mag10.png","smooth mips")
att.Description = "Magazine with a very low capacity. The lighter load reduces the weapon's weight significantly."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.SortOrder = 14

att.HideIfBlocked = true

att.Override_ClipSize = 10

att.Mult_SightTime = 0.9
att.Mult_ReloadTime = 0.95
att.Mult_Sway = 0.7

att.Mult_SpeedMult = 1.025
att.Mult_ShootSpeedMult = 1.05

att.Mult_HipDispersion = 0.85

att.ExcludeFlags = {"ur_g3_mag_g41", "cal_556", "ur_g3_mag_ptr32"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_10")
end
                               

                                     
do
    local att = {}

att.PrintName = "G41 20-Round Compact Mag"
att.AbbrevName = "20-Round Compact Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G41 20-Round Compact Mag"
end

att.Icon = Material("entities/att/ur_g3/mag556_20.png","smooth mips")
att.Description = "Low-capacity magazine for the 5.56 variant of the rifle. The lighter load makes the weapon more ergonomic."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,10)
end

att.Override_ClipSize = 20
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.9
att.Mult_Sway = 0.75

att.Mult_SpeedMult = 1.025
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05

att.RequireFlags = {"ur_g3_mag_g41"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_20_g41")
end
                                   

                                     
do
    local att = {}

att.PrintName = "G41 40-Round Mag"
att.AbbrevName = "40-Round Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G41 40-Round Mag"
end

att.Icon = Material("","smooth mips")
att.Description = "High-capacity magazine for the 5.56 variant of the rifle."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,11)
end

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.15
att.Mult_Sway = 1.5
att.Mult_RecoilSide = 1.2
att.Mult_SpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.9

att.RequireFlags = {"ur_g3_mag_g41"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_40_g41")
end
                                   

                                 
do
    local att = {}

att.PrintName = "G3 50-Round Drum Mag"
att.AbbrevName = "50-Round Drum Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58 50-Round Drum Mag"
end

att.Icon = Material("entities/att/ur_g3/mag50.png","smooth mips")
att.Description = "50 round drum-style magazine. Though highly cumbersome and unreliable, it more than doubles the standard capacity of the rifle."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true
att.Desc_Cons = {
    "uc.jam"
}

att.SortOrder = 15
att.HideIfBlocked = true

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.75
att.Mult_MalfunctionVariance = 1.5

att.Override_ClipSize = 50

att.Mult_SightTime = 1.1
att.Mult_ReloadTime = 1.2
att.Mult_Sway = 1.1

att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.85

att.Mult_HipDispersion = 1.5

att.ExcludeFlags = {"ur_g3_mag_g41", "cal_556", "ur_g3_mag_ptr32"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_50")
end
                               

                                      
do
    local att = {}

att.PrintName = "HK33 100-Round C-Mag"
att.AbbrevName = "100-Round C-Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "CN66 100-Round C-Mag"
end

att.Icon = Material("entities/att/ur_g3/mag50.png","smooth mips")
att.Description = "Box magazine that increases the round carrying capacity tremendously, allowing for suppressive fire."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,9)
end

att.Override_ClipSize = 100
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 1.19
att.Mult_ReloadTime = 1.29
att.Mult_Sway = 1.34

att.Mult_SpeedMult = 0.79
att.Mult_SightedSpeedMult = 0.79
att.Mult_ShootSpeedMult = 0.81

att.ActivateElements = {"ur_g3_mag_100_556"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_10rnd" then
        return "reload_50rnd"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty_10rnd" then
        return "reload_empty_50rnd"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty_10rnd_scope" then
        return "reload_empty_50rnd_scope"
    end
end

att.RequireFlags = {"cal_556"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_556_100")
end
                                    

                                     
do
    local att = {}

att.PrintName = "G41 60-Round Casket Mag"
att.AbbrevName = "60-Round Casket Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G41 60-Round Casket Mag"
end

att.Icon = Material("","smooth mips")
att.Description = "High-capacity magazine for the 5.56 variant of the rifle."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,12)
end

att.Override_ClipSize = 60
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 1.35
att.Mult_ReloadTime = 1.25
att.Mult_Sway = 1.5
att.Mult_RecoilSide = 1.25
att.Mult_SpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.85

att.RequireFlags = {"ur_g3_mag_g41"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_60_g41")
end
                                   

                                      
do
    local att = {}

att.PrintName = "G3 100-Round Box Mag"
att.AbbrevName = "100-Round Box Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G58 100-Round Box Mag"
end

att.Icon = Material("entities/att/ur_g3/mag50.png","smooth mips")
att.Description = "Box magazine that increases the round carrying capacity tremendously, allowing for suppressive fire."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Override_ClipSize = 100
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 1.19
att.Mult_ReloadTime = 1.29
att.Mult_Sway = 1.34

att.Mult_SpeedMult = 0.79
att.Mult_SightedSpeedMult = 0.79
att.Mult_ShootSpeedMult = 0.81

att.ActivateElements = {"ur_g3_mag_100"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_10rnd" then
        return "reload_50rnd"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty_10rnd" then
        return "reload_empty_50rnd"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty_10rnd_scope" then
        return "reload_empty_50rnd_scope"
    end
end

att.ExcludeFlags = {"ur_g3_mag_g41", "cal_556", "ur_g3_mag_ptr32"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_box_762")
end
                                    

                                   
do
    local att = {}

att.PrintName = "G41 30-Round Polymer Mag"
att.AbbrevName = "30-Round Polymer Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "G41 30-Round Polymer Mag"
end

att.Icon = Material("","smooth mips")
att.Description = "Fast-loading magazine for the 5.56 variant of the rifle."
att.Slot = {"ur_g3_mag"}
att.AutoStats = true

att.HideIfBlocked = true
att.SortOrder = 10

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4,13)
end

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.90
att.Mult_Sway = 0.85
att.Mult_RecoilSide = 0.95
att.Mult_SpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.15

att.RequireFlags = {"ur_g3_mag_g41"}

    ArcCW.LoadAttachmentType(att, "ur_g3_mag_pmag")
end
                                 

                                               
do
    local att = {}

att.PrintName = "Hensoldt ZF 6x42 PSG1"
att.AbbrevName = "PSG-1 Optic (6x) UNIVERSAL"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Hensoldt ZF 6x42 PMR-2"
    att.AbbrevName = "PMR-2 Optic (6x) UNIVERSAL"
end

att.Icon = Material("entities/att/acwatt_ur_g3_optic_psg1.png", "mips smooth")
att.Description = "Long range combat scope for precision shooting.\nExclusive to the G3 pattern rifle."
att.SortOrder = 300

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp", "optic_sniper"}

att.Model = "models/weapons/arccw/atts/g3_optic_psg.mdl"
att.ModelOffset = Vector(0.55, 0, -1.7)

att.AdditionalSights = {
    {
        Pos = Vector(0.01, 11.5, -1.12),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/PSG1_reticle.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 9.5,
            HolosightPiece = "models/weapons/arccw/atts/g3_optic_psg_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = UC_HalfScope( 6 ),
            Colorable = true,
        },
    }
}

att.HolosightPiece = "models/weapons/arccw/atts/g3_optic_psg_hsp.mdl"
att.Colorable = true

att.Mult_SightedSpeedMult = 0.84

    ArcCW.LoadAttachmentType(att, "ur_g3_optic_psg1_universal")
end
                                             
