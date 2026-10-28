                                                                                               
                                                                             

                                           
do
    local att = {}

att.PrintName = "Neostead 2000 .408 CheyTac Conversion"
att.AbbrevName = ".408 CheyTac"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Paatopveer-20 .408 CheyTac Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips")
att.Description = "The bullpup layout was always the interesting part of this thing: all of the barrel, none of the length. Chamber it for something that needs every inch and it stops being a novelty."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "Worked by hand, one shot at a time",
}
att.Desc_Neutrals = {
}
att.Slot = "myt_neo_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".408 CheyTac"
att.Override_Trivia_Class = "Anti-Materiel Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"myt_neo_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 4.0
att.Mult_DamageMin = 5.2
att.Mult_Range = 3.0
att.Mult_Penetration = 9
att.Mult_AccuracyMOA = 0.28
att.Mult_HipDispersion = 1.5
att.Mult_Recoil = 1.9
att.Mult_VisualRecoilMult = 1.5
att.Mult_RPM = 0.7
att.Mult_ClipSize = 0.5
att.Mult_ReloadTime = 1.2
att.Mult_ShootPitch = 0.82
att.Mult_ShootVol = 1.4

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

    ArcCW.LoadAttachmentType(att, "myt_neo_cal_408cheytac")
end
                                         

                                               
do
    local att = {}

att.PrintName = "Paatopveer-20 .577 Tyrannosaur Conversion"
att.AbbrevName = ".577 Tyrannosaur"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "Built in 1993 for a professional guide who had been trampled once too often and wanted something that would stop a charging elephant at a distance measured in feet. It generates about three times the recoil energy of a .375 magnum, and there are documented cases of it breaking the shooter's collarbone.\n\nAnything alive that you hit gets physically thrown backwards, hard, and knocked off balance. Damage is nearly doubled. In return the recoil is genuinely difficult to control and you get very few rounds before reloading."
att.Desc_Pros = {
    "Throws targets off their feet",
    "Nearly double damage",
}
att.Desc_Cons = {
    "Brutal recoil",
    "Very small magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "myt_neo_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".577 Tyrannosaur"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"myt_neo_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.3

att.Mult_Damage = 1.9
att.Mult_DamageMin = 1.8
att.Mult_Penetration = 1.6
att.Mult_Range = 1.3
att.Mult_Recoil = 2.3
att.Mult_RecoilSide = 1.9
att.Mult_VisualRecoilMult = 2.1
att.Mult_RPM = 0.6
att.Mult_ClipSize = 0.5
att.Mult_ShootVol = 1.5
att.Mult_ShootPitch = 0.62

local SHOVE = 620

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

    ArcCW.LoadAttachmentType(att, "myt_neo_cal_577tyrannosaur")
end
                                             

                                            
do
    local att = {}

att.PrintName = "Neostead 2000 6.5mm Creedmoor Conversion"
att.AbbrevName = "6.5mm Creedmoor"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Paatopveer-20 6.5mm Creedmoor Conversion"
end

att.SortOrder = 71
att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "smooth mips")
att.Description = "Long, slender and it holds its speed far past where anything else here has given up. The twin tubes mean you can carry two different loads and pick one on the way to the shot."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "myt_neo_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = "6.5mm Creedmoor"
att.Override_Trivia_Class = "Marksman Rifle"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.2
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"myt_neo_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 2.8
att.Mult_DamageMin = 3.5
att.Mult_Range = 2.8
att.Mult_Penetration = 7.5
att.Mult_AccuracyMOA = 0.3
att.Mult_HipDispersion = 1.2
att.Mult_Recoil = 0.9
att.Mult_VisualRecoilMult = 0.9
att.Mult_RPM = 0.9
att.Mult_ClipSize = 1.1
att.Mult_ReloadTime = 1.05
att.Mult_ShootPitch = 1.0
att.Mult_ShootVol = 1.15

local fire = {"weapons/misc/scar_65mm_fire.wav"}
local firesup = {"weapons/misc/scar_65mm_fire_sup.wav"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "myt_neo_cal_65creedmoor")
end
                                          

                                        
do
    local att = {}

att.PrintName = "Paatopveer-20 Dardick Tround Conversion"
att.AbbrevName = "Dardick Tround"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "David Dardick's triangular cartridge, a lump of plastic with the round buried in one corner, fed through an open chambered cylinder that no other design has ever used. It sold badly, and the surviving examples mostly live in glass cases.\n\nThe flat faces make it skip. Any shot that hits a hard surface at an angle bounces off and keeps going for 55 percent damage, so you can bank shots down corridors and around corners. Straight-on hits just bury themselves as normal."
att.Desc_Pros = {
    "Ricochets off hard surfaces at an angle",
    "Odd geometry feeds fast",
}
att.Desc_Cons = {
    "Poor accuracy and short range",
}
att.Desc_Neutrals = {
}
att.Slot = "myt_neo_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "Dardick Tround"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.8
att.Mult_Range = 0.7
att.Mult_RangeMin = 0.75
att.Mult_AccuracyMOA = 1.5
att.Mult_RPM = 1.15
att.Add_Penetration = 4
att.Mult_Recoil = 0.85

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.55)
    end

    return hit
end
att.Mult_ShootPitch = 1.08
att.Mult_ShootVol = 0.95

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

    ArcCW.LoadAttachmentType(att, "myt_neo_cal_dardick")
end
                                      

                                 
do
    local att = {}

att.PrintName = "20mm Grenades"
att.AbbrevName = "20mm Grenade"

att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "The little fin stabilised grenades built for automatic launchers, packed into sleeves so the tube will swallow them. Each carries about a third of what a 40mm shell does, which sounds worse than it is when you are carrying three times as many and reloading in half the time.\n\nSmall, quick and plentiful, for people who would rather throw four of these than one of anything else."
att.Desc_Pros = {
    "Quick to load and quick to cycle",
    "Flies flatter than a 40mm shell",
}
att.Desc_Cons = {
    "Considerably smaller blast",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_hv"

att.Mult_Damage = 0.55
att.Mult_DamageMin = 0.55

att.Mult_MuzzleVelocity = 1.5
att.Mult_Recoil = 0.7
att.Mult_RPM = 1.2
att.Mult_ReloadTime = 0.75
att.Mult_ShootPitch = 1.25

    ArcCW.LoadAttachmentType(att, "uc_40mm_20mm")
end
                               

                                  
do
    local att = {}

att.PrintName = "20x82mm Cannon Rounds"
att.AbbrevName = "20x82mm"

att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "The Mauser MG 151 round out of a Focke-Wulf, sleeved down to feed a grenade launcher by somebody who wanted the trajectory of a rifle and the arrival of a shell. It goes where you point it rather than where gravity eventually takes it, punches straight through the wall, and detonates on the far side.\n\nA direct fire round rather than a lobbed one. Less blast than a proper grenade, but it arrives immediately and it arrives through cover."
att.Desc_Pros = {
    "Flat, fast and direct fire",
    "Penetrates cover, then detonates behind it",
}
att.Desc_Cons = {
    "Much smaller blast than a 40mm shell",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = false
att.Override_Num = 1

att.Override_Damage = 320
att.Override_DamageMin = 260
att.Mult_Penetration = 40

att.Override_Range = 1400
att.Override_RangeMin = 800
att.Override_HullSize = 0.6

att.Mult_Recoil = 1.25
att.Mult_AccuracyMOA = 0.7
att.Mult_ShootPitch = 1.1

local RADIUS = 130

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or NULL
    local pos = hit.tr.HitPos

    util.BlastDamage(IsValid(wep) and wep or owner, IsValid(owner) and owner or wep, pos, RADIUS, hit.damage * 0.6)

    local eff = EffectData()
    eff:SetOrigin(pos)
    eff:SetMagnitude(3)
    eff:SetScale(0.5)
    eff:SetRadius(4)
    util.Effect("Explosion", eff)
    util.Decal("Scorch", pos - hit.tr.HitNormal, pos + hit.tr.HitNormal, ents.GetAll())

    return hit
end

    ArcCW.LoadAttachmentType(att, "uc_40mm_20x82")
end
                                

                                   
do
    local att = {}

att.PrintName = "40mm Bullet"
att.AbbrevName = "40mm Bullet"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Massive custom-made bullet that fits inside of a 40mm tube. The large casing offers the big bullet a great amount of propulsion force."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = false
att.Override_Num = 1

att.Override_Damage = 750
att.Override_DamageMin = 575
att.Mult_Penetration = 7555

att.Override_Range = 1500
att.Override_RangeMin = 850
att.Override_HullSize = 1.25

att.Mult_Recoil = 1.70

 att.Mult_AccuracyMOA = 0.80

att.ActivateElements = {"40mm_bullet"}

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return "weapons/misc/m79_bullet_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/misc/m79_bullet_fire_dist.wav" end
end

if engine.ActiveGamemode() == "urbanstrife" then
    att.PenetrationAmmoType = "357"
end

    ArcCW.LoadAttachmentType(att, "uc_40mm_bullet")
end
                                 

                                      
do
    local att = {}

att.PrintName = "Displacer Capsules"
att.AbbrevName = "Displacer"
att.Icon = Material("entities/att/arccw_displacer_icon.png", "mips smooth")
att.Description = "Unstable capsules hastily ripped off of a Displacer Cannon from the Black Mesa Research Facility. These bad boys have enough uranium to poison someone to their death as well as the ability to potentially transport the target to god-knows-where.\n\nDon't worry if your foe survives, because hitting them with this round will teleport them into oblivion!\n\n\"I'm done letting you make me feel bad. I prefer to feel good, and I\'m going to feel real good when I send you two to a place where you\'ll never see the light of day. Ever. Again.\""
att.Desc_Pros = {

}
att.Desc_Cons = {"May be considered a warcrime"

}
att.Desc_Neutrals = {"This might not be able to teleport much, if not at all"
}
att.Slot = "uc_40mm"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/40mm_displacer/40mm_displacer_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/40mm_displacer/40mm_displacer_fire.wav" end
end

att.Override_ShootEntity = "ent_arccw_displacer_projectile"

att.AutoStats = true

    ArcCW.LoadAttachmentType(att, "uc_40mm_displacer")
end
                                    

                                 
do
    local att = {}

att.PrintName = "MK3A2 Fragmentation Grenades"
att.AbbrevName = "MK3A2 Grenades"
att.Icon = Material("entities/att/arccw_mk3a2.png", "mips smooth")
att.Description = "MK3A2 fragmentation grenades fitted into the tube of the M79.\n Reloads faster but has lower muzzle velocity, and it requires grabbing the grenade once fired.\n\n\"Gordon, grenades!\" - Barney Callhoun"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Mult_ReloadTime = 0.78
att.Mult_MuzzleVelocity = 0.85
att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.75
att.Override_ShootEntity = "npc_grenade_frag"
att.Override_Trivia_Calibre = "MK3A2 Frag Grenades"
att.AttachSound = "vo/streetwar/sniper/ba_nag_grenade05.wav"

att.Mult_ShootPitch = 1.1

att.ActivateElements = {"40mm_caseless"}

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/40mm_displacer/mk3a2_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/40mm_displacer/mk3a2_fire.wav" end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_caseless"
end

    ArcCW.LoadAttachmentType(att, "uc_40mm_frag")
end
                               

                                     
do
    local att = {}

att.PrintName = "40mm Nerve Gas Grenades"
att.AbbrevName = "Nerve Gas"
att.Icon = Material("entities/att/arccw_nervegas.png", "mips smooth")
att.Description = "These grenade rounds release nerve agents that disrupt your nervous system. In other words, this little guy will fuck with your body until you die.\n\n This is basically the nerve gas grenade from the classic M9K, but fitted into your grenade launcher. Quite the throwback am i right?\n\n\"FIGHT FOR NET NEUTRALITY!\""
att.Desc_Pros = {

}
att.Desc_Cons = {"You are a war criminal"

}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/40mm_nervegas/40mm_nervegas_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/40mm_nervegas/40mm_nervegas_fire.wav" end
end

att.Override_ShootEntity = "m9k_nervegasnade"

att.AutoStats = true

    ArcCW.LoadAttachmentType(att, "uc_40mm_nervegas")
end
                                   

                                   
do
    local att = {}

att.PrintName = "USAS-12 .22 Long Rifle Conversion"
att.AbbrevName = ".22 Long Rifle"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMSAS-12 .22 Long Rifle Conversion"
end

att.SortOrder = 71
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "Somebody sleeved a full automatic drum-fed shotgun down to rimfire. It now costs almost nothing to empty, does almost nothing when it lands, and is the single most entertaining object in the armoury."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "Does approximately nothing to anybody",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_a1_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".22 Long Rifle"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 0.8
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
att.GivesFlags = {"uc_a1_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 0.28
att.Mult_DamageMin = 0.35
att.Mult_Range = 0.7
att.Mult_Penetration = 1
att.Mult_AccuracyMOA = 0.5
att.Mult_HipDispersion = 0.55
att.Mult_Recoil = 0.15
att.Mult_VisualRecoilMult = 0.2
att.Mult_RPM = 1.9
att.Mult_ClipSize = 4.0
att.Mult_ReloadTime = 0.8
att.Mult_ShootPitch = 1.28
att.Mult_ShootVol = 0.6

local fire = {"weapons/arccw_ud/mini14/fire_22.ogg"}
local firesup = {"weapons/arccw_ud/mini14/fire_22_supp.ogg"}
local firetail = {"weapons/arccw_ud/mini14/fire_22_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "uc_a1_cal_22lr")
end
                                 

                                    
do
    local att = {}

att.PrintName = "AMSAS-12 2 Bore Conversion"
att.AbbrevName = "2 Bore"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A bore diameter of an inch and a third, firing a lead ball weighing a quarter of a kilogram. These were built for shooting elephants from close range in the 1880s by men who considered 4 bore insufficient, and they weigh about as much as a small child.\n\nThe single largest round in the pack. It throws whatever it hits a long way backwards and does over double damage, but the recoil will knock you around and the gun holds almost nothing."
att.Desc_Pros = {
    "Colossal damage",
    "Hurls targets backwards",
}
att.Desc_Cons = {
    "Recoil is barely manageable",
    "Holds two rounds",
    "Very slow",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_a1_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "2 Bore"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.5

att.Mult_Damage = 2.4
att.Mult_DamageMin = 2.2
att.Mult_Penetration = 1.8
att.Mult_Range = 0.9
att.Mult_Recoil = 2.8
att.Mult_RecoilSide = 2.3
att.Mult_VisualRecoilMult = 2.5
att.Mult_RPM = 0.5
att.Mult_ClipSize = 0.3
att.Mult_ReloadTime = 1.4
att.Mult_ShootVol = 1.7
att.Mult_ShootPitch = 0.55

local SHOVE = 780

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

    ArcCW.LoadAttachmentType(att, "uc_a1_cal_2bore")
end
                                  

                                      
do
    local att = {}

att.PrintName = "AMSAS-12 .458 HAM'R Conversion"
att.AbbrevName = ".458 HAM'R"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "Wilson Combat's attempt to get rifle energy out of a carbine length gas gun, throwing a heavy .458 bullet fast enough that the fuzed loadings need running room before they will function.\n\nThe fuze needs 18 metres to arm. Closer than that you do a quarter damage and it simply thumps them. Past 18 metres it works properly and does about 60 percent more than a normal round. This is a deliberately bad choice for close quarters."
att.Desc_Pros = {
    "Very strong past 18 metres",
}
att.Desc_Cons = {
    "Almost useless closer than that",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_a1_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".458 HAM'R"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"uc_a1_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.2
att.Mult_DamageMin = 1.3
att.Mult_Penetration = 1.5
att.Mult_Range = 1.5
att.Mult_RangeMin = 1.4
att.Mult_Recoil = 1.4
att.Mult_RPM = 0.8
att.Mult_ClipSize = 0.7

local ARM = 18

att.Hook_BulletHit = function(wep, hit)
    if hit.range < ARM then
        hit.damage = hit.damage * 0.25
    else
        hit.damage = hit.damage * 1.6
    end

    return hit
end
att.Mult_ShootPitch = 0.85
att.Mult_ShootVol = 1.25

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

    ArcCW.LoadAttachmentType(att, "uc_a1_cal_458hamr")
end
                                    

                                     
do
    local att = {}

att.PrintName = "USAS-12 7.62x39mm Conversion"
att.AbbrevName = "7.62x39mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMSAS-12 7.62x39mm Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "A drum-fed automatic shotgun rechambered for the cheapest rifle round on earth. What comes out the other end is essentially a squad automatic weapon that nobody signed off on."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_a1_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = "7.62x39mm"
att.Override_Trivia_Class = "Light Machine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"uc_a1_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 2.5
att.Mult_DamageMin = 2.8
att.Mult_Range = 2.0
att.Mult_Penetration = 7
att.Mult_AccuracyMOA = 0.4
att.Mult_HipDispersion = 0.9
att.Mult_Recoil = 0.75
att.Mult_VisualRecoilMult = 0.7
att.Mult_RPM = 1.15
att.Mult_ClipSize = 1.6
att.Mult_ReloadTime = 1.0
att.Mult_ShootPitch = 0.98
att.Mult_ShootVol = 1.1

local fire = {"weapons/misc/type20_762_fire.wav"}
local firesup = {"weapons/misc/type20_762_fire_sup.wav"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "uc_a1_cal_762x39")
end
                                   

                                            
do
    local att = {}

att.PrintName = "\"BSD\" Buckshot Deluxe Rounds"
att.AbbrevName = "\"BSD\" Buckshot Deluxe"
att.SortOrder = 2
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = "Buckshot with a significantly increased amount of pellets (a whopping 12 of them)."
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 12
att.Mult_AccuracyMOA = 1.5

att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_Penetration = 1

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundSilenced then
        return false
    end
end

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_buckshot_deluxe")
end
                                          

                                           
do
    local att = {}

att.PrintName = "\"CABASA\" Cabasa-Howitzer Shell"
att.AbbrevName = "\"CABASA\" Cabasa-Howitzer"

att.SortOrder = 14
att.Icon = Material("entities/att/tnt_powder.png", "mips smooth")
att.Description = [[Field artillery, necked down and stuffed into a case that was never designed to hold it, by someone who heard the word "howitzer" and took it as a challenge rather than a specification. It rattles when you shake it, which is where the name came from and is not a good sign.

One shell per trigger pull, one enormous detonation wherever it lands, and one very firm shove in the opposite direction for you.]]
att.Desc_Pros = {
    "Detonates like a shell on impact",
    "Recoil throws you clear across the room",
}
att.Desc_Cons = {
    "Nearly empties the weapon",
    "Glacially slow to cycle",
    "Catches you in your own blast up close",
}
att.Desc_Neutrals = {
    "Single projectile",
    "Aim at the floor and hold on",
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2

local RADIUS = 210
local KICK   = 900
local LIFT   = 220

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or NULL
    local pos = hit.tr.HitPos

    util.BlastDamage(wep, IsValid(owner) and owner or wep, pos, RADIUS, hit.damage * 1.8)

    local eff = EffectData()
    eff:SetOrigin(pos)
    eff:SetMagnitude(6)
    eff:SetScale(1)
    eff:SetRadius(8)
    util.Effect("Explosion", eff)
    util.Decal("Scorch", pos - hit.tr.HitNormal, pos + hit.tr.HitNormal, ents.GetAll())

    return hit
end

att.Hook_PostFireBullets = function(wep)
    if !SERVER then return end
    if !UC_Extras or !UC_Extras.RecoilJump then return end

    UC_Extras.RecoilJump(wep, KICK, LIFT)
end

att.Mult_Damage = 1.6
att.Mult_DamageMin = 1.6
att.Mult_Penetration = 0.5
att.Mult_Range = 0.7
att.Mult_RangeMin = 0.7
att.Mult_MuzzleVelocity = 0.6

att.Mult_ClipSize = 0.25
att.Mult_RPM = 0.35
att.Mult_Recoil = 2.6
att.Mult_RecoilSide = 2.2
att.Mult_RecoilPunch = 2.4
att.Mult_VisualRecoilMult = 2.2
att.Mult_ShootVol = 1.8
att.Mult_ShootPitch = 0.6
att.Mult_ReloadTime = 1.3
att.Mult_MalfunctionMean = 0.55

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_cabasahowitzer")
end
                                         

                                   
do
    local att = {}

att.PrintName = "\"CACTUS\" Cactus Rounds"
att.AbbrevName = "\"CACTUS\" Cactus"

att.SortOrder = 12
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[Somebody pulled the bullets, tipped out the shot and packed the cases with cholla spines instead. Each one is barbed along its whole length, which means it goes in easily and does not come back out, and the wound keeps working long after the shooting has stopped.

A spray of splinters that barely registers on arrival and then refuses to stop hurting.]]
att.Desc_Pros = {
    "Wounds keep bleeding after the hit",
    "Several splinters per shot",
}
att.Desc_Cons = {
    "Almost no immediate damage",
    "Short ranged, stopped by anything solid",
}
att.Desc_Neutrals = {
    "Hitting again refreshes the bleed rather than stacking it",
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_Num = 4
att.Override_Num_Priority = 2
att.Override_Penetration = 0

local TICKS      = 6
local INTERVAL   = 0.7
local BLEED_FRAC = 0.9

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or NULL
    local tick = hit.damage * BLEED_FRAC
    if tick <= 0 then return hit end

    local id = "UC_CactusBleed_" .. ent:EntIndex()

    timer.Create(id, INTERVAL, TICKS, function()
        if !IsValid(ent) or ent:Health() <= 0 then
            timer.Remove(id)
            return
        end

        local d = DamageInfo()
        d:SetDamage(tick)
        d:SetDamageType(DMG_SLASH)
        d:SetAttacker(IsValid(owner) and owner or ent)
        d:SetInflictor(IsValid(wep) and wep or ent)
        ent:TakeDamageInfo(d)
    end)

    return hit
end

att.Mult_Damage = 0.3
att.Mult_DamageMin = 0.25
att.Mult_Range = 0.45
att.Mult_RangeMin = 0.5
att.Mult_AccuracyMOA = 1.6
att.Mult_HipDispersion = 1.2
att.Mult_Recoil = 0.7
att.Mult_MuzzleVelocity = 0.7
att.Mult_MalfunctionMean = 0.65

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_cactus")
end
                                 

                               
do
    local att = {}

att.PrintName = "\"DU\" Depleted Uranium"
att.AbbrevName = "\"DU\" Depleted Uranium"

att.SortOrder = 15
att.Icon = Material("entities/att/arccw_plutonium_powder.png", "mips smooth")
att.Description = [[Reactor tailings, nearly twice as dense as lead and useless for much else, drawn into a penetrator. It sharpens itself as it goes: the rod sheds material along the sides of the hole instead of flattening, so it stays pointed the whole way through. It is also pyrophoric, and the dust it strips off ignites in air on the way out.

Goes through what stops armour-piercing and sets fire to whatever is behind it. Heavy enough that you carry noticeably less.]]
att.Desc_Pros = {
    "Penetration beyond anything else on offer",
    "Sets fire to what it goes through",
}
att.Desc_Cons = {
    "Heavy, so fewer rounds fit",
    "Hard recoil and a slower cycle",
    "Burns out past maximum range",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_DamageType = DMG_BURN

att.Mult_Penetration = 3.2
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.4
att.Mult_MuzzleVelocity = 1.35

att.Mult_Damage = 1.1
att.Mult_DamageMin = 1.2

att.Mult_ClipSize = 0.7
att.Mult_Recoil = 1.3
att.Mult_RecoilPunch = 1.25
att.Mult_RPM = 0.9
att.Mult_ReloadTime = 1.15
att.Mult_MalfunctionMean = 0.8

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_du")
end
                             

                                   
do
    local att = {}

att.PrintName = "\"DUPLEX\" Duplex Rounds"
att.AbbrevName = "\"DUPLEX\" Duplex"

att.SortOrder = 6
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[Two bullets stacked in one case, the rear one seated slightly crooked so it walks off the first. The US Army spent a decade on this in the sixties, on the theory that a soldier who misses twice at once has a better chance than one who misses once. They were not entirely wrong.

Every trigger pull sends two projectiles for the price of one round.]]
att.Desc_Pros = {
    "Two projectiles per shot",
}
att.Desc_Cons = {
    "Each projectile carries less",
    "Second round walks off the first",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_Num = 2
att.Override_Num_Priority = 2

att.Mult_Damage = 0.62
att.Mult_DamageMin = 0.62
att.Mult_Penetration = 0.8
att.Mult_Range = 0.9
att.Mult_AccuracyMOA = 1.45
att.Mult_HipDispersion = 1.1
att.Mult_Recoil = 1.2
att.Mult_MalfunctionMean = 0.9

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_duplex")
end
                                 

                                  
do
    local att = {}

att.PrintName = "\"HEIAP\" Explosive-Tipped"
att.AbbrevName = "\"HEIAP\" Explosive"

att.SortOrder = 10
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[A tungsten penetrator sitting behind a small charge of high explosive, so the round opens the hole and then goes off inside it. Raufoss built the famous one for the .50, and it appears on every list of things lawyers argue about.

Detonates on impact, spreading half of what it carries to anything stood nearby.]]
att.Desc_Pros = {
    "Detonates on impact",
    "Damages everything around the hit",
}
att.Desc_Cons = {
    "Half the damage goes to the blast",
    "Hard on the magazine and the shooter",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_DamageType = DMG_BLAST

att.Mult_Damage = 1.2
att.Mult_DamageMin = 1.2
att.Mult_Penetration = 1.4
att.Mult_ClipSize = 0.7
att.Mult_Recoil = 1.35
att.Mult_VisualRecoilMult = 1.25
att.Mult_MalfunctionMean = 0.7

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_heiap")
end
                                

                                
do
    local att = {}

att.PrintName = "\"INC\" Incendiary Rounds"
att.AbbrevName = "\"INC\" Incendiary"

att.SortOrder = 7
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[A bullet with its core hollowed out and packed with a pyrotechnic compound that lights on impact. Built to set fire to fuel and fabric rather than to kill outright, which it does anyway given a little time.

Sets targets alight. The compound burns out in flight, so past the weapon's maximum range it arrives as an ordinary and rather poor bullet.]]
att.Desc_Pros = {
    "Ignites what it hits",
}
att.Desc_Cons = {
    "Burns out past maximum range",
    "Poor penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_DamageType = DMG_BURN

att.Mult_Damage = 0.8
att.Mult_DamageMin = 0.8
att.Mult_Penetration = 0.6
att.Mult_Range = 0.85
att.Mult_MalfunctionMean = 0.9

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_inc")
end
                              

                                  
do
    local att = {}

att.PrintName = "\"MATCH\" Match Grade"
att.AbbrevName = "\"MATCH\" Match"

att.SortOrder = 8
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[Hand weighed powder charges and bullets sorted to a tolerance nobody firing in anger would ever notice. Competition shooters pay a great deal for the last quarter of a minute of angle, and this is what that money buys.

Tighter and far more consistent than issue ammunition, and fussy enough that you carry less of it.]]
att.Desc_Pros = {
    "Far more accurate",
    "No damage variance at all",
}
att.Desc_Cons = {
    "Reduced magazine capacity",
    "Tight tolerances jam more readily",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_AccuracyMOA = 0.55
att.Mult_HipDispersion = 0.9
att.Mult_Range = 1.15
att.Override_DamageRand = 0
att.Mult_ClipSize = 0.85
att.Mult_MalfunctionMean = 1.2

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_match")
end
                                

                                
do
    local att = {}

att.PrintName = "\"R.I.P.\" Radically Invasive Projectile"
att.AbbrevName = "\"R.I.P.\" Hollowpoint"

att.SortOrder = 13
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[A solid copper hollowpoint machined into eight trocar petals that shear off on contact and each go their own way, so one hole becomes nine travelling in a cone. G2 Research sold it with a great deal of advertising about how final it was, and rather less about what happens when it meets a car door.

Because the petals spread through whatever they enter, it does not much care where on a target it lands. It cares enormously whether that target is soft.]]
att.Desc_Pros = {
    "Arms and legs hurt as much as centre mass",
    "Savage against unprotected targets",
}
att.Desc_Cons = {
    "Cannot penetrate anything at all",
    "Wasted on hard targets",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_Penetration = 0

att.Hook_BulletHit = function(wep, hit)
    local dmgtable = wep:GetBuff_Override("Override_BodyDamageMults", wep.BodyDamageMults)
    local hg = hit.tr.HitGroup

    if dmgtable and hg and dmgtable[hg] and dmgtable[hg] < 1 and dmgtable[hg] > 0 then
        hit.damage = hit.damage / dmgtable[hg]
    end

    return hit
end

att.Mult_Damage = 1.3
att.Mult_DamageMin = 1.15
att.Mult_Range = 0.7
att.Mult_RangeMin = 0.75
att.Mult_MuzzleVelocity = 0.9
att.Mult_Recoil = 1.1
att.Mult_ClipSize = 0.9

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_rip")
end
                              

                                   
do
    local att = {}

att.PrintName = "\"RUBBER\" Rubber Bullets"
att.AbbrevName = "\"RUBBER\" Rubber"

att.SortOrder = 11
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[A rubber coated slug meant to be bounced off the ground into a crowd, which is a sentence that explains most of the controversy about them. Painful, bruising, and lethal only by accident.

Here the accident is ruled out. Whatever you shoot will still be standing afterwards.]]
att.Desc_Pros = {
    "Cannot kill",
    "Very controllable",
}
att.Desc_Cons = {
    "Feeble and short ranged",
    "No penetration whatsoever",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Override_DamageType = DMG_CLUB
att.Override_Penetration = 0

local FLOOR = 10

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return end

    local hp = ent:Health()
    if hp <= 0 then return end

    local mult = 1
    local dmgtable = wep:GetBuff_Override("Override_BodyDamageMults", wep.BodyDamageMults)
    local hg = hit.tr.HitGroup
    if dmgtable and hg and dmgtable[hg] then
        mult = math.max(dmgtable[hg], 1)
    end

    hit.damage = math.min(hit.damage, math.max(0, hp - FLOOR) / mult)
    return hit
end

att.Mult_Damage = 0.35
att.Mult_DamageMin = 0.3
att.Mult_Range = 0.4
att.Mult_RangeMin = 0.4
att.Mult_Recoil = 0.5
att.Mult_MuzzleVelocity = 0.6

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_rubber")
end
                                 

                                               
do
    local att = {}

att.PrintName = "\"UBATON\" Universal Flexible Baton"

att.SortOrder = 0
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Less-lethal law enforcement round that fires a cushioned, low-velocity "bean bag" filled with lead pellets.
Designed to apprehend targets through pain instead of killing them, though the 40-gram projectile can still inflict deadly or permanent injuries.

Compatible with all weapons.]]
att.Desc_Pros = {
    "uc.baton",
}
att.Desc_Cons = {
    "uc.alwaysphys",
}
att.Desc_Neutrals = {
    "uc.oneprojectile",
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2
att.Mult_Recoil = .5

local path = ")^arccw_uc/common/"

att.Hook_PhysBulletHit = function(wep,data)
    if CLIENT then return end
    local tr = data.tr
    local bullet = data.bullet

    if tr.Entity and (tr.Entity:IsPlayer() or tr.Entity:IsNPC()) and tr.Entity:GetActiveWeapon() then
        local delta = bullet.Travelled / (bullet.Range / ArcCW.HUToM)
        delta = math.Clamp(delta, 0, 1)
        local dmg = Lerp(delta, bullet.DamageMax, bullet.DamageMin)
        local chance = math.random() * bullet.DamageMax

        if chance <= dmg * .5 then
            tr.Entity:DropWeapon()
            if tr.Entity:IsPlayer() then
                tr.Entity:ScreenFade(1,Color(128,0,0,64),.5,0)
                tr.Entity:ViewPunch(Angle(3,0,0))
            end
        end
        if tr.Entity:IsNPC() then
            tr.Entity:SetSchedule(SCHED_FLINCH_PHYSICS)
        end
    end
end

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "shotgun-lesslethal-01.ogg", path .. "shotgun-lesslethal-02.ogg"} end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then return false
    end
end
att.UC_NoInnyOuty = true

att.Mult_Damage = .2
att.Mult_DamageMin = .2
att.Mult_Penetration = 0
att.Mult_Range = .33
att.Mult_RangeMin = .33

att.Override_DamageType = DMG_CLUB

att.Override_AlwaysPhysBullet = true
att.Mult_PhysBulletMuzzleVelocity = 0.5
att.Mult_PhysBulletGravity = 2

att.Override_UC_ShellColor = Color(0.6 * 255, 0.2 * 255, 0.6 * 255)

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_baton_universal")
end
                                             

                                    
do
    local att = {}

att.PrintName = "\"BOLO\" Bolo Shell"

att.SortOrder = 6
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Two slugs joined by a short length of steel wire, which spreads open in flight and arrives spinning. These were sold for a while on the promise that they would cut through things, and were banned or quietly withdrawn nearly everywhere once people worked out what that meant.

Two heavy projectiles that drift further apart the longer they fly.]]
att.Desc_Pros = {
    "Two heavy projectiles",
    "Vicious at close quarters",
}
att.Desc_Cons = {
    "Spreads badly with distance",
    "Very heavy recoil",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 2
att.Override_Num_Priority = 2
att.Mult_Damage = 1.35
att.Mult_DamageMin = 0.5
att.Mult_Range = 0.55
att.Mult_RangeMin = 0.6
att.Add_Penetration = 3
att.Mult_AccuracyMOA = 2.6
att.Mult_HipDispersion = 1.4
att.Mult_Recoil = 1.55
att.Mult_ReloadTime = 1.1

att.Override_DamageType = DMG_SLASH

att.Override_UC_ShellColor = Color(0.55 * 255, 0.2 * 255, 0.15 * 255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_bolo")
end
                                  

                                                  
do
    local att = {}

att.PrintName = "\"UPRTY\" Universal Confetti"
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Joke ammunition filled with tiny pieces of colorful paper. Produces a celebratory puff instead of anything reasonably lethal, allowing your weapon to double as a party popper.

Shotguns are truly the most versatile firearms.]]
att.Desc_Pros = {
    "uc.confetti",
    "uc.infiniteammo"
}
att.Desc_Cons = {
    "uc.noprojectile"
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}
att.SortOrder = -9001
att.AutoStats = true

att.NotForNPCs = true
att.Mult_Recoil = .2
att.Override_Num = 0
att.Override_Num_Priority = 9001
att.Override_InfiniteAmmo = true

local path = ")^arccw_uc/common/"
att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "confetti-01.ogg", path .. "confetti-02.ogg", path .. "confetti-03.ogg", path .. "confetti-04.ogg", path .. "confetti-05.ogg", path .. "confetti-06.ogg"} end
end
att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then return false
    end
end
att.UC_NoInnyOuty = true

att.Hook_AddShootSound = function(wep, data)

    local owner = wep:GetOwner()
    local effectdata = EffectData()
	effectdata:SetOrigin(owner:EyePos() + owner:GetAimVector() * 32)
    effectdata:SetStart(owner:GetAimVector())
    util.Effect("arccw_uc_confetti", effectdata)
end

att.Override_UC_ShellColor = Color(255, 127, 182)

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_confetti_universal")
end
                                                

                                              
do
    local att = {}

att.PrintName = "\"UDRG\" Universal Dragon's Breath"

att.SortOrder = -1
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Novelty magnesium-based round that projects a spectacular jet of sparks and fire. Burning at over 3,000 °F, the blast isn't immediately lethal, but can easily set objects and people ablaze.

Compatible with any weapon.]]
att.Desc_Pros = {
    "uc.ignite",
    "uc.pellet.12",
}
att.Desc_Cons = {
    "uc.accuracy.35",
    "uc.dragon",
    "uc.alwaysphys",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun", "uc_ammo"}
att.AutoStats = true

att.Add_Num = 12

local dontburn = {
    npc_zombie = true,
    npc_zombie_torso = true,
    npc_zombine = true,
    npc_fastzombie = true,
    npc_fastzombie_torso = true,
    npc_headcrab = true,
    npc_headcrab_fast = true,
    npc_headcrab_black = true,
}

att.Hook_PhysBulletHit = function(wep, data)
    if SERVER and data.tr.Entity then
        local d = data.bullet.Travelled * ArcCW.HUToM
        local dur = 6 - d * 2 / wep.Range
        if dur > 0 then
            data.tr.Entity:Extinguish()
            data.tr.Entity:Ignite(dur)
        end

        local delta = math.Clamp(d / data.bullet.Range, 0, 1)

        local dmg = DamageInfo()
        dmg:SetAttacker(data.bullet.Attacker)
        dmg:SetInflictor(data.bullet.Weapon)
        dmg:SetDamage(Lerp(delta, data.bullet.DamageMax, data.bullet.DamageMin))
        dmg:SetDamagePosition(data.bullet.Pos)
        dmg:SetDamageForce(data.bullet.Vel)
        dmg:SetDamageType(dontburn[data.tr.Entity:GetClass()] and DMG_BUCKSHOT or (DMG_BURN + DMG_BUCKSHOT))

        data.tr.Entity:TakeDamageInfo(dmg)
    end

    local effect = EffectData()
    effect:SetOrigin(data.tr.HitPos)
    util.Effect("StunstickImpact",effect)

    if data.tr.HitWorld then
        util.Decal("FadingScorch",data.tr.HitPos - data.tr.HitNormal,data.tr.HitPos + data.tr.HitNormal)
    end
end

att.Override_PhysBulletImpact = false

att.Override_DamageType = DMG_BURN + DMG_BUCKSHOT

att.Override_HullSize = 2
att.Override_HullSize_Priority = 100
att.Add_AccuracyMOA = 35
att.Mult_Damage = .5
att.Mult_DamageMin = .5

att.Override_AlwaysPhysBullet = true
att.Override_PhysBulletMuzzleVelocity = 100
att.Mult_PhysBulletGravity = 0.75
att.Override_PhysBulletDrag = 4

att.Override_PhysTracerProfile = "uc_dragon"
att.Override_MuzzleEffect = "muzzleflash_dragonbreath"

att.Override_UC_ShellColor = Color(0.9 * 255, 0.3 * 255, 0.1 * 255)

att.Hook_AddShootSound = function(wep, data)
    wep:EmitSound("DB_ADD", data.volume,data.pitch,1,CHAN_WEAPON - 1)
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_drgn_universal")
end
                                            

                                       
do
    local att = {}

att.PrintName = "\"DU BUCK\" Depleted Uranium Buckshot"

att.SortOrder = 7
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Buckshot swaged from reactor tailings. Each pellet is nearly twice as dense as lead and pyrophoric on impact, so a pattern of them goes through cover ordinary buck bounces off and leaves everything behind it alight.

Where the tungsten load buys you a tight pattern that holds together, this buys you holes and fire and does not much care where the pellets land.]]
att.Desc_Pros = {
    "Punches through cover at close range",
    "Sets fire to what it hits",
}
att.Desc_Cons = {
    "Patterns loosely",
    "Heavy recoil and slow to load",
    "Loses its bite past maximum range",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_DamageType = DMG_BURN

att.Add_Penetration = 13
att.Mult_Damage = 1.05
att.Mult_DamageMin = 1.2
att.Mult_Range = 1.25
att.Mult_RangeMin = 1.15
att.Mult_AccuracyMOA = 1.35
att.Mult_HipDispersion = 1.15
att.Mult_Recoil = 1.4
att.Mult_ReloadTime = 1.25
att.Mult_HullSize = 0.7

att.Override_UC_ShellColor = Color(0.3 * 255, 0.4 * 255, 0.25 * 255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_du_buck")
end
                                     

                                       
do
    local att = {}

att.PrintName = "\"DU SLUG\" Depleted Uranium Slug"

att.SortOrder = 8
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[A single dart of depleted uranium riding a sabot, which is the closest a shotgun will ever come to being an anti-tank gun. It sharpens itself on the way through rather than flattening, and the dust it sheds ignites in air.

The sabot slug is the one you put a scope over. This is the one you use when the thing you need to shoot is behind a wall.]]
att.Desc_Pros = {
    "Enormous penetration",
    "Sets fire to what it goes through",
}
att.Desc_Cons = {
    "Less accurate than a proper sabot",
    "Brutal recoil, slow to load",
    "Loses its bite past maximum range",
}
att.Desc_Neutrals = {
    "Single projectile",
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2

att.Override_DamageType = DMG_BURN

att.Add_Penetration = 24
att.Mult_Damage = 1.15
att.Mult_DamageMin = 1.35
att.Mult_Range = 2.4
att.Mult_RangeMin = 2.1
att.Mult_MuzzleVelocity = 1.3
att.Mult_AccuracyMOA = 0.45
att.Mult_HipDispersion = 2.4
att.Mult_Recoil = 1.6
att.Mult_RecoilPunch = 1.4
att.Mult_ReloadTime = 1.3

att.Override_HullSize = 0

att.Override_UC_ShellColor = Color(0.3 * 255, 0.4 * 255, 0.25 * 255)

att.GivesFlags = {"uc_slug"}

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_du_slug")
end
                                     

                                              
do
    local att = {}

att.PrintName = "\"UHE\" Universal FRAG-12"
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Shotgun slug with a small high-explosive warhead. On impact, the round saturates its surroundings with shrapnel like a frag grenade.
Meant for breaching, but it can also useful for applying damage over an area.
Beware: the explosion doesn't care who it hurts.

Compatible with all weapons.]]
att.Desc_Pros = {
    "uc.explode"
}
att.Desc_Cons = {
    "uc.alwaysphys",
}
att.Desc_Neutrals = {
    "uc.oneprojectile",
}
att.SortOrder = 2

att.Slot = {"ud_ammo_shotgun", "uc_ammo"}

att.Mult_Penetration = 0.1
att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.75
att.Mult_Range = .5
att.Mult_HipDispersion = 1.5
att.Override_Num = 1
att.Override_Num_Priority = 99
att.AutoStats = true

att.Override_HullSize = 0

att.GivesFlags = {"uc_slug"}

att.Override_AlwaysPhysBullet = true
att.Mult_PhysBulletGravity = 1.5
att.Override_PhysBulletImpact = false

att.Hook_PhysBulletHit = function(wep, data)
    if SERVER then
    local delta = data.bullet.Travelled / (data.bullet.Range / ArcCW.HUToM)
    delta = math.Clamp(delta, 0, 1)
    local dmg = Lerp(delta, data.bullet.DamageMax, data.bullet.DamageMin)

    util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, 128, dmg)

    local eff = EffectData()
    eff:SetOrigin(data.tr.HitPos)
    eff:SetMagnitude(4)
    eff:SetScale(0.5)
    eff:SetRadius(4)
    util.Effect("Sparks", eff)
    util.Effect("Explosion", eff)
    util.Decal("Scorch", data.tr.HitPos - data.tr.HitNormal, data.tr.HitPos + data.tr.HitNormal, ents.GetAll())
    end
end

att.Override_UC_ShellColor = Color(0.9 * 255, 0.7 * 255, 0.3 * 255)

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_frag_universal")
end
                                            

                                         
do
    local att = {}

att.PrintName = "\"GRAPE\" Grapeshot Bag"

att.SortOrder = 1
att.Icon = Material("entities/att/grapeshot.png", "mips smooth")
att.Description = "A collection of smaller-caliber round shots packed tightly in a canvas bag and separated from the gunpowder charge by a metal wadding, rather than being a single solid projectile. When assembled, the shot resembles a cluster of grapes, hence the name. \n\n\"Together, we make history... one scattershot at a time.\""
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {

}
att.Slot = {"ud_ammo_shotgun","uc_ammo", "ammo_shotgun", "go_ammo"}

att.AutoStats = true

att.Override_Num = 9
att.Mult_Damage = 2.20
att.Mult_DamageMin = 2.2
att.Mult_AccuracyMOA = 1.92
att.Add_Penetration = 2
att.Mult_RangeMin = 0.32
att.Mult_Range = 0.27
att.Mult_HipDispersion = 6
att.Mult_ReloadTime = 1.44
att.Mult_Recoil = 1.72

att.Override_HullSize = 0
att.Override_DamageType = DMG_BULLET

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell")  then
        return false
    end
end

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/musket_shotgun_fire_sup.wav"
    else
        return "weapons/misc/grapeshot_fire.wav"
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_grapeshot")
end
                                       

                                      
do
    local att = {}

att.PrintName = "\"HATTON\" Breaching Round"

att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Powdered metal bound in wax, fired into a door hinge from an inch away. It destroys the lock and then disintegrates, which is the entire point: whoever is on the other side of that door is not supposed to be hit by anything.

Takes doors, locks and props apart. Against people it is close to useless, by design.]]
att.Desc_Pros = {
    "Tears through props, doors and hardware",
    "Mild recoil",
}
att.Desc_Cons = {
    "Nearly harmless to people",
    "Disintegrates on contact",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2
att.Override_Penetration = 0

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    local living = IsValid(ent) and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot())

    hit.damage = hit.damage * (living and 0.2 or 6)
    return hit
end

att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.5
att.Mult_Range = 0.25
att.Mult_RangeMin = 0.25
att.Mult_Recoil = 0.7
att.Mult_MuzzleVelocity = 0.55

att.Override_HullSize = 0
att.Override_DamageType = DMG_CLUB

att.Override_UC_ShellColor = Color(0.5 * 255, 0.5 * 255, 0.5 * 255)

att.GivesFlags = {"uc_slug"}

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_hatton")
end
                                    

                                      
do
    local att = {}

att.PrintName = "\"MUSKET\" Musket Ball"

att.SortOrder = 1
att.Icon = Material("entities/att/arccw_uc_musketball.png", "mips smooth")
att.Description = "A ball made out of molten lead that requires additional preparation in order to reload, on top of being extremely inaccurate. \n\n\"Blow a golf ball-sized hole through a man and he's dead on the spot.\""
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {

}
att.Slot = {"ud_ammo_shotgun","uc_ammo", "ammo_shotgun", "go_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2
att.Mult_Damage = 2.50
att.Mult_DamageMin = 2.5
att.Mult_AccuracyMOA = 1.82
att.Add_Penetration = 2
att.Mult_RangeMin = 0.41
att.Mult_Range = 0.35
att.Mult_HipDispersion = 4
att.Mult_ReloadTime = 1.42
att.Mult_Recoil = 1.65

att.Override_HullSize = 0
att.Override_DamageType = DMG_BULLET

att.GivesFlags = {"uc_slug"}

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell")  then
        return false
    end
end

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/musket_shotgun_fire_sup.wav"
    else
        return "weapons/misc/musketball_shotgun_fire.wav"
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_musket")
end
                                    

                                     
do
    local att = {}

att.PrintName = "\"SABOT\" Sabot Slug"

att.SortOrder = 2
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[A sub-calibre hardened slug carried in a plastic sleeve that peels away at the muzzle. Because the projectile never touches the bore it can be shaped properly, which is why these are the only shotgun rounds worth putting a scope over.

Flatter, further and harder through cover than a full-bore slug.]]
att.Desc_Pros = {
    "Rifle-like reach and accuracy",
    "Strong penetration",
}
att.Desc_Cons = {
    "Heavy recoil",
    "Slower to load",
}
att.Desc_Neutrals = {
    "Single projectile",
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Override_Num = 1
att.Override_Num_Priority = 2
att.Mult_Damage = 0.8
att.Mult_DamageMin = 0.85
att.Mult_AccuracyMOA = 0.15
att.Add_Penetration = 14
att.Mult_Range = 3.2
att.Mult_RangeMin = 2.6
att.Mult_MuzzleVelocity = 1.4
att.Mult_HipDispersion = 2.2
att.Mult_Recoil = 1.3
att.Mult_ReloadTime = 1.15

att.Override_HullSize = 0
att.Override_DamageType = DMG_BULLET

att.Override_UC_ShellColor = Color(0.15 * 255, 0.3 * 255, 0.55 * 255)

att.GivesFlags = {"uc_slug"}

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_sabot")
end
                                   

                                        
do
    local att = {}

att.PrintName = "\"TUNG\" Tungsten Buckshot"

att.SortOrder = 4
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Buckshot swaged from tungsten rather than lead. The pellets are far denser, so they hold their pattern and their energy well past where ordinary buck has given up, and they go through the sort of thing people hide behind.

Expensive enough that nobody issues it and everybody wants it.]]
att.Desc_Pros = {
    "Holds its pattern and energy at range",
    "Punches through light cover",
}
att.Desc_Cons = {
    "Sharp recoil",
    "Slow to reload",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Add_Penetration = 9
att.Mult_Range = 1.8
att.Mult_RangeMin = 1.5
att.Mult_AccuracyMOA = 0.65
att.Mult_Damage = 1.1
att.Mult_DamageMin = 1.35
att.Mult_Recoil = 1.3
att.Mult_ReloadTime = 1.2
att.Mult_HullSize = 0.6

att.Override_UC_ShellColor = Color(0.35 * 255, 0.35 * 255, 0.4 * 255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_sg_tungsten")
end
                                      

                                             
do
    local att = {}

att.PrintName = "\"SSD\" Snakeshot Deluxe Rounds"
att.AbbrevName = "\"SSD\" Snakeshot Deluxe"
att.SortOrder = 2
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = "Snakeshot with a significantly increased amount of pellets (a whopping 12 of them)."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_ammo"}

att.AutoStats = true

att.Override_Num = 12
att.Add_AccuracyMOA = 60
att.Override_AccuracyMOA_Priority = 0

att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_Penetration = 1

att.Mult_Damage = 70 / 60

att.Mult_Range = 0.4
att.Mult_RangeMin = 2

att.Mult_PhysBulletMuzzleVelocity = 0.6

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundSilenced then
        return false
    end
end

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_snakeshot_deluxe")
end
                                           

                               
do
    local att = {}

att.PrintName = "\"WC\" Wadcutter"
att.AbbrevName = "\"WC\" Wadcutter"

att.SortOrder = 9
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
att.Description = [[A flat fronted cylinder of soft lead, shaped to punch a clean circle through a paper target so the scorer can tell which ring it touched. It has no nose to speak of and the air notices immediately.

Hits very hard at conversational distance and sheds everything shortly after.]]
att.Desc_Pros = {
    "Brutal up close",
    "Gentle recoil",
}
att.Desc_Cons = {
    "Falls off a cliff at range",
    "Will barely penetrate",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_ammo"

att.AutoStats = true

att.Mult_Damage = 1.45
att.Mult_DamageMin = 0.45
att.Mult_Range = 0.4
att.Mult_RangeMin = 0.5
att.Mult_Penetration = 0.25
att.Mult_MuzzleVelocity = 0.7
att.Mult_Recoil = 0.85

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_ammo_wc")
end
                             

                                      
do
    local att = {}

att.PrintName = "No Barrel"
att.AbbrevName = "No Barrel"
att.Description = "Remove the barrel from this weapon. Somehow still manages to be able to mount muzzle devices."
att.Icon = Material("", "smooth mips")
att.Slot = "uc_myt_fal_b"
att.Desc_Cons = {

}

att.AutoStats = true

att.Mult_Recoil = 1.25
att.Mult_SightedSpeedMult = 0.92
att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85
att.Mult_RangeMin = 0.90
att.Mult_Range = 0.80
att.Add_BarrelLength = 0.6

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(0.72, 2.009, 0.759)
att.Override_ActiveAng = Angle(0, 0, 0)

att.ActivateElements = {"l_n"}

    ArcCW.LoadAttachmentType(att, "uc_c1a1_no_barrel")
end
                                    

                                       
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = Material("entities/att/arccw_uc_extra_none.png", "smooth mips")
att.Description = "Completely remove the stock."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_myt_fal_stock"

att.AutoStats = true
att.Free = true
att.IgnorePickX = true
att.SortOrder = 999

att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.05

att.Mult_SightedSpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.85

att.Mult_Sway = 1.4
att.Add_BarrelLength = -4

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_c1a1_stock_none")
end
                                     

                                            
do
    local att = {}

att.PrintName = "Red Mountain Company"
att.Description = "Be the change you want to see."

att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.AutoStats = true
att.Slot = "charm"

att.Free = true

att.Model = "models/weapons/arccw/atts/charmbase.mdl"

att.DroppedModel = "models/Items/BoxSRounds.mdl"

att.Charm = true
att.CharmModel = "models/weapons/arccw/atts/uc_rmccharm.mdl"
att.CharmAtt = "Charm"
att.CharmScale = Vector(0.5, 0.5, 0.5)
att.CharmOffset = Vector(0, -1, -0.2)
att.CharmAngle = Angle(20, 0, 80)

    ArcCW.LoadAttachmentType(att, "uc_charm_rmccharm_fixed")
end
                                          

                                            
do
    local att = {}

att.PrintName = "Slugger"

att.SortOrder = 1
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = "Forces weapons to only use manual-action modes. Not the most competitively viable, but it surely shows you can still kick ass without all those fancy-shmancy automatic modes."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.manualonly",
}

att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.Slot = "charm"
att.AutoStats = true

att.ActivateElements = {"uc_manualonly"}
att.GivesFlags = {"needsmanual"}
att.Hook_Compatible = function(wep)
    if (!wep.ManualAction and !wep.UC_CanManualAction) or !wep:GetIsShotgun() then return false end
end

    ArcCW.LoadAttachmentType(att, "uc_charm_sgmanual_fixed")
end
                                          

                                                      
do
    local att = {}

att.PrintName = "Urban Charm - Anarchy"
att.Description = "The icon of a Garry's Mod addon."

att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.AutoStats = true
att.Slot = "charm"

att.Free = true

att.Model = "models/weapons/arccw/atts/charmbase.mdl"

att.DroppedModel = "models/Items/BoxSRounds.mdl"

att.Charm = true
att.CharmModel = "models/weapons/arccw/atts/uc_urbancharm.mdl"
att.CharmAtt = "Charm"
att.CharmScale = Vector(0.5, 0.5, 0.5)
att.CharmOffset = Vector(0, -1.1, -0.2)
att.CharmAngle = Angle(20, 0, 80)
att.CharmSkin = 3

    ArcCW.LoadAttachmentType(att, "uc_charm_urbancharm_anarchy_fixed")
end
                                                    

                                                       
do
    local att = {}

att.PrintName = "Urban Charm - Ordnance"
att.Description = "The icon of a Garry's Mod addon."

att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.AutoStats = true
att.Slot = "charm"

att.Free = true

att.Model = "models/weapons/arccw/atts/charmbase.mdl"

att.DroppedModel = "models/Items/BoxSRounds.mdl"

att.Charm = true
att.CharmModel = "models/weapons/arccw/atts/uc_urbancharm.mdl"
att.CharmAtt = "Charm"
att.CharmScale = Vector(0.5, 0.5, 0.5)
att.CharmOffset = Vector(0, -1.1, -0.2)
att.CharmAngle = Angle(20, 0, 80)
att.CharmSkin = 4

    ArcCW.LoadAttachmentType(att, "uc_charm_urbancharm_ordnance_fixed")
end
                                                     

                                   
do
    local att = {}

att.PrintName = "12-Round 12 Gauge Mag"
att.AbbrevName = "12-Round 12 Gauge Mag"
att.Icon = Material("", "mips smooth")
att.Description = "Stripper clip loaded in 12 Gauge."
att.Slot = {"uc_myt_fal_mag"}
att.Desc_Cons = {}
att.AutoStats = true

att.SortOrder = 6

att.HideIfBlocked = true

att.Override_ClipSize = 12

att.Mult_SightTime = 0.95
att.Mult_ReloadTime = 0.95
att.Mult_Sway = 0.85
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
att.Mult_ClipSize = 1.2
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_IsShotgun = true
att.Mult_DrawTime = 0.95
att.Mult_HolsterTime = 0.95
att.Override_Ammo = "Buckshot"

att.Hook_TranslateAnimation = function(wep, anim)
    if anim == "reload" then
        return "reload_shotgun"
    end
end

att.Hook_TranslateAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_shotgun"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload" then
        return "reload_shotgun"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload_empty" then
        return "reload_shotgun"
    end
end

local path = ")weapons/ak50/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ak-12g_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ak-12g_fire_sup.wav" end
end

att.Override_ShotgunReload = false
att.Override_HybridReload = false
att.Override_Trivia_Calibre = "12 Gauge"
att.Override_Trivia_Class = "Shotgun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.ActivateElements = {"conv_12g"}

    ArcCW.LoadAttachmentType(att, "uc_fal_mag_12g")
end
                                 

                                   
do
    local att = {}

att.PrintName = "Balanced Recoil System"
att.AbbrevName = "Balanced Action"

att.SortOrder = 23
att.Icon = Material("entities/att/arccw_uc_heavybolt.png", "mips smooth")
att.Description = "A counterweight running opposite the bolt, so that the two masses arrive at the ends of their travel at the same moment and cancel. The Soviets put it in the AK-107 and swore by it. It is heavy, it is fiddly, and it works.\n\nRecoil per shot drops by about a third, so long bursts stay on target. In exchange the gun is slower into the shoulder and slower to settle after you stop firing."
att.Desc_Pros = {
    "Sight picture barely moves under fire",
}
att.Desc_Cons = {
    "Heavy, and slow onto the shoulder",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true

att.Mult_Recoil = 0.62
att.Mult_RecoilSide = 0.6
att.Mult_VisualRecoilMult = 0.5

att.Mult_SightTime = 1.2
att.Mult_DrawTime = 1.15
att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.94
att.Mult_RPM = 0.94

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"

    ArcCW.LoadAttachmentType(att, "uc_fg_balanced")
end
                                 

                                        
do
    local att = {}

att.PrintName = "Binary Trigger"
att.AbbrevName = "Binary Trigger"
att.Description = "Modified trigger that fires once when pressed and another time when released."
att.Icon = Material("", "smooth mips")
att.Slot = {"uc_fg","uc_fg_singleshot", "fcg", "perk"}

att.AutoStats = true
att.Mult_RPM = 3.65

att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "BINARY"
    },
    {
        Mode = 0
    }
}

att.Hook_PostFireBullets = function(wep)
    wep.ArcCW_BinaryReady = true
end

att.Hook_Think = function(wep)
    if !wep.ArcCW_BinaryReady then return end

    local owner = wep:GetOwner()
    if !IsValid(owner) then return end

    if !owner:KeyDown(IN_ATTACK) then
        wep.ArcCW_BinaryReady = false

        if wep:Clip1() > 0 and !wep:GetReloading() then

            wep.Primary.OwnerTriggered = false
            wep.LastTriggerTime = 0

            wep:PrimaryAttack()

            local gunRPM = wep:GetBuff_Stat("RPM") or 600
            local delay = 60 / gunRPM

            wep:SetNextPrimaryFire(CurTime() + delay)
        end
    end
end

    ArcCW.LoadAttachmentType(att, "uc_fg_binarytrigger")
end
                                      

                                      
do
    local att = {}

att.PrintName = "Chrome-Lined Internals"
att.AbbrevName = "Chrome-Lined"

att.SortOrder = 22
att.Icon = Material("entities/att/arccw_uc_heavybolt.png", "mips smooth")
att.Description = "Chamber and bore plated hard, the way service rifles have been since somebody worked out that a jungle will eat an unlined barrel in a season. It costs a little accuracy and buys a gun that does not care what you drag it through.\n\nThe gun jams roughly two and a half times less often. The trade is permanent: your groups open up slightly whether you are hipfiring or aimed, and that does not go away."
att.Desc_Pros = {
    "Very reliable, and tolerates long strings of fire",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true

att.Mult_MalfunctionMean = 2.4
att.Mult_HeatCapacity = 1.35
att.Mult_HeatDissipation = 1.25
att.Mult_FixTime = 0.8

att.Mult_AccuracyMOA = 1.12
att.Mult_Range = 0.96

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"

    ArcCW.LoadAttachmentType(att, "uc_fg_chromelined")
end
                                    

                                     
do
    local att = {}

att.PrintName = "Forced Auto"
att.AbbrevName = "Forced Auto"
att.Description = "Modified internals that force the gun into fully-automatic firemode, even if it's manual action."
att.Icon = Material("entities/att/arccw_uc_no_bolt_auto.png", "smooth mips")
att.Slot = {"uc_fg","uc_fg_singleshot", "fcg", "perk"}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}

att.AutoStats = true

att.Mult_CycleTime = 0.00000000000000001
att.Mult_RPM = 3.65
att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = false

    ArcCW.LoadAttachmentType(att, "uc_fg_forcedauto")
end
                                   

                                     
do
    local att = {}

att.PrintName = "Forced Semi"
att.AbbrevName = "Forced Semi"
att.Description = "Modified internals that force the gun into semi-automatic firemode, even if it's manual action."
att.Icon = Material("entities/att/arccw_uc_no_bolt.png", "smooth mips")
att.Slot = {"uc_fg","uc_fg_singleshot", "fcg", "perk"}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}

att.AutoStats = true

att.Mult_CycleTime = 0.00000000000000001
att.Mult_RPM = 3.65
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = false

    ArcCW.LoadAttachmentType(att, "uc_fg_forcedsemi")
end
                                   

                                      
do
    local att = {}

att.PrintName = "30-Round 9x19mm Parabellum Magazine"
att.AbbrevName = "30-Round 9x19mm Parabellum Mag"

att.Description = "Cursed receiver and barrel group that accepts 9x19mm Parabellum rounds from detachable stick magazines, turning this anti-material rifle into a pistol."
att.Icon = Material("entities/att/ur_mp5/mag_str.png","smooth mips")
att.Slot = "uc_myt_gm6_mag"
att.AutoStats = true

att.SortOrder = 9

att.Override_ClipSize = 30

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Mult_RPM = 1.875
att.Mult_ReloadTime = 0.85
att.Mult_Recoil = 0.385
att.Mult_HipDispersion = 0.75

att.Mult_Penetration = 0.30
att.Mult_DamageMin = 0.30
att.Mult_Damage = 0.20
att.ShootPitchVariation = 1

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(2.15, 8.35, 1.05)
att.Override_ActiveAng = Angle(-2, -2, 0)

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/misc/type20_8mm_nambu_fire_sup.wav"
    else
        return "weapons/misc/type20_8mm_nambu_fire.wav"
    end
end

att.ActivateElements = {"conv_pistol"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_pistol"
end

    ArcCW.LoadAttachmentType(att, "uc_gm6_mag_pistol")
end
                                    

                                       
do
    local att = {}

att.PrintName = "M1911 Sally Conversion"
att.AbbrevName = "Sally"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMAS-R Sally Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/arccw_uc_sally.png", "smooth mips")
att.Description = "Turn your trusty sidearm into the legendary Sally, allowing you to blow up any fucker at your leisure.\n\n\"She never lets me down\""
att.Desc_Pros = {"Explosions, explosions everywhere"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ur_m1911_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "Sally"
att.Override_Ammo = "SMG1_Grenade"

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 75
att.Mult_Range = 4.55
att.Mult_Precision = 3.25
att.Mult_Recoil = 1.97
att.Mult_MalfunctionMean = 2
att.Override_PhysBulletMuzzleVelocity = 745
att.Mult_PhysBulletMuzzleVelocity = 256
att.Override_PhysTracerProfile = 1
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 8.45
att.Mult_DamageMin = 6.50
att.Mult_VisualRecoilMult = 1.15
att.Mult_RPM = 1.8
att.Mult_ShootSpeedMult = 2
att.Mult_ClipSize = 0.7
att.Mult_ReloadTime = 1.17
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Mult_MuzzleVelocity = 745
att.Mult_ShootPitch = 1.15

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 4.5
att.Override_ShellSounds = {"arccw_uc/common/40mm_casing_1.ogg"}

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

    ArcCW.LoadAttachmentType(att, "uc_m1911_cal_sally")
end
                                     

                                            
do
    local att = {}

att.PrintName = "Flamethrower Conversion Kit"
att.AbbrevName = "Flamethrower"
att.Icon = Material("entities/att/arccw_flamethrower.png", "mips smooth")
att.Description = "Conversion kit that allows you to feed a gas canister into the M79 for a continuous burst of flames.\n\n Whether you want to start illegal forest fires or just commit war crimes, this is just for you!\n\n\"I fear no man. But that thing... it scares me...\""
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}
att.OverrideClipSize = 150
att.Mult_ClipSize = 150

att.Hook_Compatible = function(wep)
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode == 2 then
            return false
        end
    end

    return
end

att.Mult_Recoil = 0.1
att.Mult_RPM = 3.5

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return "ambient/fire/mtov_flame2.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "ambient/fire/mtov_flame2.wav" end
end

att.Override_ShootEntity = "arccw_bo1_flames"

att.AutoStats = true

    ArcCW.LoadAttachmentType(att, "uc_m79_cal_flamethrower")
end
                                          

                                                      
do
    local att = {}

att.PrintName = "Cylinder Suppressor UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_cylinder.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nBulky and heavy, but provides better ballistic performance.\n\n\"By the time you figured it out, it would be too late.\""
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
att.ModelOffset = Vector(-1, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.Add_BarrelLength = 6
att.Mult_SightTime = 1.15
att.Mult_HipDispersion = 1.2
att.Mult_Sway = 1.15
att.Mult_Range = 1.1

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_cylinder_universal")
end
                                                    

                                                        
do
    local att = {}

att.PrintName = "L15 'Lighthouse' Suppressor"
att.AbbrevName = "Lighthouse Suppressor UNIVERSAL"

att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_lighthouse.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nImproves close range stopping power slightly due to redirection of gas pressure."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_light.mdl"
att.ModelOffset = Vector(-0.25, 0, 0)
att.OffsetAng = Angle(0, 180, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 0.85
att.Mult_RangeMin = 1.75

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_lighthouse_universal")
end
                                                      

                                                  
do
    local att = {}

att.PrintName = "PBS-1 Suppressor UNIVERSAL"

att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_pbs1.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nGas redirection causes the side benefit of straightening recoil."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/uc_pbs1.mdl"
att.ModelOffset = Vector(2.9, 0, 0)
att.ModelScale = Vector(1.3, 1.3, 1.3)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_RecoilSide = 0.75

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_pbs1_universal")
end
                                                

                                                  
do
    local att = {}

att.PrintName = "PBS-4 Suppressor UNIVERSAL"

att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_pbs4.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nOriginally designed for carbine barrels, this suppressor compensates for inaccuracy, and can be mounted to other barrels with some gunsmithing work."
att.Desc_Neutrals = {}

att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/uc_pbs4.mdl"
att.ModelOffset = Vector(2.9, 0, 0)
att.ModelScale = Vector(1.3, 1.3, 1.3)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_AccuracyMOA = 0.75

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_pbs4_universal")
end
                                                

                                                   
do
    local att = {}

att.PrintName = "Salvo 12 Suppressor UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_salvo.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nLow profile and relatively lightweight, with no negative ballistic impact."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_salvo.mdl"
att.ModelOffset = Vector(-1, 0, -0.12)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 0.8

att.Add_BarrelLength = 8
att.Mult_SightTime = 1.1
att.Mult_HipDispersion = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_salvo_universal")
end
                                                 

                                                 
do
    local att = {}

att.PrintName = "US G.I. 45 Suppressor"
att.AbbrevName = "G.I. Suppressor UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_ssq.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nEnhances ballistics performance significantly, but its low maximum pressure makes it incompatible with supersonic ammunition."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_ssq.mdl"
att.ModelOffset = Vector(0.5, 0, 0.0)
att.ModelScale = Vector(0.8, 0.8, 0.8)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.25

att.Add_BarrelLength = 5
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    return false
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_ssq_universal")
end
                                               

                                                 
do
    local att = {}

att.PrintName = "Mountain Armory Tactical Suppressor"
att.AbbrevName = "Tactical Suppressor UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_tactical.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nLow-profile and enhances ballistics, but slightly cumbersome."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_tactical.mdl"
att.ModelOffset = Vector(2.25, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.1

att.Add_BarrelLength = 4
att.Mult_SightTime = 1.07
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_tac_universal")
end
                                               

                                                  
do
    local att = {}

att.PrintName = "TGP-A Suppressor UNIVERSAL"

att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_tgpa.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nWell rounded suppressor with no notable downsides."
att.Desc_Neutrals = {}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/uc_tgpa.mdl"
att.ModelOffset = Vector(2.6, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.Add_BarrelLength = 5
att.Mult_Range = 0.9
att.Mult_SightTime = 1.07
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_tgpa_universal")
end
                                                

                                                    
do
    local att = {}

att.PrintName = "Annihilator Handcannon Flashlight"
att.AbbrevName = "Annihilator Flashlight UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_optic_annihilator.png", "mips smooth")
att.Description = "Oversized flashlight module with iron sights, attached on the upper rail."
att.Desc_Cons = {
}
att.AutoStats = true

att.Slot = {"optic", "optic_lp", "optic_sniper"}
att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ur_annihilator_laser.mdl"
att.ModelOffset = Vector(-6,0,-3.5)
att.ModelScale = Vector( 0.933, 0.933, 0.933 )

att.Mult_Sway = 1.5
att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 0.975

att.AdditionalSights = {
    {
        Pos = Vector(0, 20, -1.62),
        Ang = Angle(-.2, 0, 0),
        Magnification = 1,
    }
}

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 1024
att.FlashlightNearZ = 1
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR
att.FlashlightColor = Color(255, 242, 229)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 3
att.FlashlightBone = "laser"

att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Wide",
        Flashlight = true,
        FlashlightFOV = 80,
        FlashlightFarZ = 768,
        FlashlightBrightness = 1
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}

    ArcCW.LoadAttachmentType(att, "uc_optic_annihilator_flashlight")
end
                                                  

                                                   
do
    local att = {}

att.PrintName = "Annihilator Handcannon Laser"
att.AbbrevName = "Annihilator Laser UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_optic_annihilator.png", "mips smooth")
att.Description = "Oversized laser module with iron sights, attached on the upper rail."
att.Desc_Cons = {
    "con.beam"
}
att.AutoStats = true

att.Slot = {"optic", "optic_lp", "optic_sniper"}
att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ur_annihilator_laser.mdl"
att.ModelOffset = Vector(-6,0,-3.5)
att.ModelScale = Vector( 0.933, 0.933, 0.933 )

att.Mult_Sway = 1.5
att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 0.975

att.AdditionalSights = {
    {
        Pos = Vector(0, 20, -1.62),
        Ang = Angle(-.2, 0, 0),
        Magnification = 1,
    }
}

att.LaserStrength = 2
att.ToggleStats = {
    {
        PrintName = "On",
        Laser = true,
        LaserBone = "laser",
        LaserColor = Color(50, 255, 50),
        Mult_HipDispersion = 0.75,
        Mult_MoveDispersion = 0.6,
        Mult_SightTime = 0.85
    },
    {
        PrintName = "Off",
        Laser = false,
    },
}

    ArcCW.LoadAttachmentType(att, "uc_optic_annihilator_universal")
end
                                                 

                                             
do
    local att = {}

att.PrintName = "Kobra EKP-8-16 Reflex Sight (RDS)"
att.AbbrevName = "Kobra (RDS) UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_optic_kobra.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight.\nExclusive to the \"Warsaw Pact\" optic mount, and is slightly more agile than rail mounted optics."

att.SortOrder = 299

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.swapreticle"
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp", "optic_sniper"}

att.Model = "models/weapons/arccw/atts/ur_kobra.mdl"
att.ModelOffset = Vector(-2, 0, -4.55)

local R1, R2, R3, R4 = Material("hud/reticles/uc_kobra1.png", "mips smooth"), Material("hud/reticles/uc_kobra2.png", "mips smooth"), Material("hud/reticles/uc_kobra3.png", "mips smooth"), Material("hud/reticles/uc_kobra4.png", "mips smooth")

att.AdditionalSights = {
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,

        HolosightData = {
            HolosightReticle = R1,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 1.5,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,

        HolosightData = {
            HolosightReticle = R2,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,

        HolosightData = {
            HolosightReticle = R3,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
    {
        Pos = Vector(0, 13, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,

        HolosightData = {
            HolosightReticle = R4,
            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
            HolosightNoFlare = true,
            HolosightSize = 2,
            HolosightBone = "holosight",
            Colorable = true
        }
    },
}

att.Holosight = true
att.HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl"
att.Mult_SightedSpeedMult = 0.925

att.ExcludeFlags = {"ak_norail","cover_rail"}

    ArcCW.LoadAttachmentType(att, "uc_optic_kobra_universal")
end
                                           

                                         
do
    local att = {}

att.PrintName = "M203 Leaf Sights"
att.Icon = Material("entities/att/m203_leaf_sights.png")
att.Description = "Folded leaf sights primarily used with grenade launchers, now mounted onto your gun as a main optic. Doesn't do much as far as aiming goes."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 998

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp", "optic_sniper"}

att.Model = "models/weapons/arccw/atts/m203iron.mdl"

att.Mult_SightTime = 1.05

    ArcCW.LoadAttachmentType(att, "uc_optic_m203_sights")
end
                                       

                                            
do
    local att = {}

att.PrintName = "PSO-1 (4x) UNIVERSAL"
att.AbbrevName = "PSO-1 (4x) UNIVERSAL"
att.Icon = Material("entities/att/acwatt_uc_optic_pso1.png", "mips smooth")
att.Description = "Medium range combat scope for improved precision at longer ranges.\nExclusive to the \"Warsaw Pact\" optic mount, and is slightly more agile than rail mounted optics."

att.SortOrder = 300

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp", "optic_sniper"}

att.Model = "models/weapons/arccw/atts/ur_pso1.mdl"
att.ModelOffset = Vector(-2, 0, -4.55)

att.AdditionalSights = {
    {
        Pos = Vector(0, 13, -1.5),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_pso.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 10.5,
            HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = UC_HalfScope( 4 ),
            Colorable = true,
        },
    }
}

att.HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl"
att.Colorable = true

att.Mult_SightedSpeedMult = .8
att.ExcludeFlags = {"ak_norail","cover_rail"}

    ArcCW.LoadAttachmentType(att, "uc_optic_pso1_universal")
end
                                          

                                          
do
    local att = {}

att.PrintName = "Black Powder Load"
att.AbbrevName = "Black Powder"

att.SortOrder = 16
att.Icon = Material("entities/att/acwatt_uc_powder_high.png", "smooth mips")
att.Description = [[Charcoal, sulphur and saltpetre, the way it was done for six hundred years before somebody worked out nitrocellulose. It burns dirty and slow, throws a bank of white smoke thick enough to lose the target in, and leaves the bore caked in residue that gets worse with every shot you take.

Loading the weapon is also swabbing it, so a fresh magazine is a fresh barrel.]]
att.Desc_Pros = {
    "Works in anything that takes a cartridge",
    "Enormous report and muzzle bloom",
}
att.Desc_Cons = {
    "Fouls as you shoot, ruining accuracy",
    "Slow, short ranged and unreliable",
}
att.Desc_Neutrals = {
    "Reloading clears the fouling",
}
att.Slot = "uc_powder"

att.AutoStats = true

local MAX_FOUL  = 12
local FOUL_DISP = 0.09

att.Hook_PostFireBullets = function(wep)
    wep.UC_Fouling = math.min((wep.UC_Fouling or 0) + 1, MAX_FOUL)
end

att.Hook_PostReload = function(wep)
    wep.UC_Fouling = 0
end

att.Hook_ModDispersion = function(wep, hip)
    local foul = wep.UC_Fouling or 0
    if foul <= 0 then return end

    return hip * (1 + (FOUL_DISP * foul))
end

att.Override_MuzzleEffect = "muzzleflash_m79"

att.Mult_Damage = 0.9
att.Mult_DamageMin = 0.8
att.Mult_Range = 0.6
att.Mult_RangeMin = 0.7
att.Mult_PhysBulletMuzzleVelocity = 0.65

att.Mult_Recoil = 1.25
att.Mult_RecoilPunch = 1.3
att.Mult_VisualRecoilMult = 1.2

att.Mult_ShootVol = 1.35
att.Mult_ShootPitch = 0.9

att.Mult_RPM = 0.92
att.Mult_MalfunctionMean = 0.6
att.Mult_HeatCapacity = 0.7
att.Mult_HeatDissipation = 0.85

    ArcCW.LoadAttachmentType(att, "uc_powder_blackpowder")
end
                                        

                                 
do
    local att = {}

att.PrintName = "Composition-4 Load"

att.SortOrder = 19
att.Icon = Material("entities/att/powderc4.png", "smooth mips")
att.Description = "Ammunition loaded with a C-4 explosive as a propellant. Adds considerably more velocity and power to the projectile but is more prone to jamming the weapon."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 1.25
att.Mult_Range = 1.12
att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.25
att.Mult_Penetration = 1.15

att.Mult_ShootVol = 1.26
att.Mult_RPM = 0.88
att.Mult_ShootPitch = 0.88

att.Mult_MalfunctionMean = 0.78
att.Mult_PhysBulletMuzzleVelocity = 1.26

local tail = ")^/weapons/misc/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "c4_powder_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_powder_c4")
end
                               

                                  
do
    local att = {}

att.PrintName = "Carbon Dioxide Load"

att.SortOrder = 19
att.Icon = Material("entities/att/co2_powder.png", "smooth mips")
att.Description = "CO2-propelled ammunition, not really useful for actual firearms but it works exceptionally with airsoft replicas."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 0.42
att.Mult_Range = 0.75

att.Mult_RPM = 1.05
att.Mult_ShootPitch = 1.01

att.Mult_MalfunctionMean = 0.95

    ArcCW.LoadAttachmentType(att, "uc_powder_co2")
end
                                

                                             
do
    local att = {}

att.PrintName = "Compressed Air Load"

att.SortOrder = 19
att.Icon = Material("entities/att/acwatt_comp_air.png", "smooth mips")
att.Description = "Ammunition loaded with nothing but compressed air. As a result the projectile will barely exit the firearm's barrel with a high chance of the projectile getting stuck inside of the weapon and jamming it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 0.07
att.Mult_Range = 0.14

att.Mult_ShootVol = 1.03
att.Mult_RPM = 1.12
att.Mult_ShootPitch = 1.25
att.Mult_Damage = 0.10
att.Mult_DamageMin = 0.11
att.Mult_Penetration = 0

att.Mult_MalfunctionMean = 0.07
att.Mult_PhysBulletMuzzleVelocity = 0.14

local path = "weapons/misc/"

local fire22 = {path .. "popgun.wav"}
local fire22sup = {path .. "popgun.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

    ArcCW.LoadAttachmentType(att, "uc_powder_compressed_air")
end
                                           

                                      
do
    local att = {}

att.PrintName = "Cordite Load"

att.SortOrder = 19
att.Icon = Material("entities/att/cordite.png", "smooth mips")
att.Description = "Ammunition loaded with a peculiar kind of smokeless propellant that consists of bundled filaments (hence why the name \"Cordite\", due to it being a \"cord powder\"). It was made in attempt to replace the older iterations of gunpowder (black powder). \n\n Using rounds loaded with this spaghetti-like propellant promotes greater recoil control and lowers the likeliness of malfunction, at the cost of reducing range and accuracy."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 0.86
att.Mult_Range = 0.73

att.Mult_ShootVol = 0.88
att.Mult_RPM = 0.98
att.Mult_ShootPitch = 1.01

att.Mult_MalfunctionMean = 1.38
att.Mult_PhysBulletMuzzleVelocity = 0.73

    ArcCW.LoadAttachmentType(att, "uc_powder_cordite")
end
                                    

                                    
do
    local att = {}

att.PrintName = "Flash Powder Load"
att.AbbrevName = "Flash Powder"

att.SortOrder = 22
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "smooth mips")
att.Description = [[The mixture that fills theatrical maroons and cheap fireworks, loaded into a cartridge by somebody who wanted a distraction rather than a corpse. It burns almost instantly, which makes it useless for pushing a bullet and excellent at producing an enormous bang and a wall of white light.

The round barely reaches across a room and barely marks what it touches. Whoever it lands near stops being useful for a few seconds, which is usually the point.]]
att.Desc_Pros = {
    "Blinds and staggers whoever it hits",
    "Can shake weapons out of hands",
}
att.Desc_Cons = {
    "Does almost no damage",
    "Very short ranged and slow",
    "Deafeningly loud",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Override_Penetration = 0

local DROP_CHANCE = 0.35

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end

    if ent:IsPlayer() then
        ent:ScreenFade(1, Color(255, 255, 255, 220), 2.2, 0.6)
        ent:ViewPunch(Angle(math.Rand(-7, -3), math.Rand(-6, 6), math.Rand(-3, 3)))
    end

    if ent:IsNPC() then
        ent:SetSchedule(SCHED_FLINCH_PHYSICS)
    end

    if (ent:IsPlayer() or ent:IsNPC()) and ent.DropWeapon and math.random() <= DROP_CHANCE then
        ent:DropWeapon()
    end

    local eff = EffectData()
    eff:SetOrigin(hit.tr.HitPos)
    eff:SetMagnitude(4)
    eff:SetScale(0.5)
    eff:SetRadius(6)
    util.Effect("Sparks", eff)

    return hit
end

att.Mult_Damage = 0.2
att.Mult_DamageMin = 0.18
att.Mult_Range = 0.35
att.Mult_RangeMin = 0.4
att.Mult_PhysBulletMuzzleVelocity = 0.5

att.Mult_Recoil = 0.6
att.Mult_VisualRecoilMult = 0.8
att.Mult_RPM = 0.9
att.Mult_ShootVol = 1.7
att.Mult_ShootPitch = 1.15
att.Mult_MalfunctionMean = 0.85

    ArcCW.LoadAttachmentType(att, "uc_powder_flash")
end
                                  

                                      
do
    local att = {}

att.PrintName = "Gyrojet Rocket Load"
att.AbbrevName = "Gyrojet"

att.SortOrder = 22
att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "smooth mips")
att.Description = "A cartridge that is really a small solid fuel rocket, leaving the barrel at a walking pace and still gaining speed forty metres later. MBAssociates built these for real in the sixties and shipped very few, because a bullet that is weakest where fights actually happen is a hard thing to sell.\n\nDamage is scored on how far the bullet has flown, not on where you were standing. Point blank it does about a third of what the card says. At 40 metres and beyond it does nearly double. Anything closer than about 15 metres is a waste of a round."
att.Desc_Pros = {
    "Gets stronger the further it travels",
    "Almost silent and almost recoilless",
}
att.Desc_Cons = {
    "Nearly harmless up close",
    "Very slow to leave the barrel",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"
att.AutoStats = true

local BURNOUT = 40
local MUZZLE  = 0.3
local PEAK    = 1.75

att.Hook_BulletHit = function(wep, hit)
    local t = math.Clamp(hit.range / BURNOUT, 0, 1)
    hit.damage = hit.damage * Lerp(t, MUZZLE, PEAK)
    return hit
end

att.Mult_MuzzleVelocity = 0.45
att.Mult_Range = 1.35
att.Mult_Recoil = 0.25
att.Mult_VisualRecoilMult = 0.4
att.Mult_ShootPitch = 0.8
att.Mult_ShootVol = 0.6
att.Mult_Penetration = 1.3
att.Mult_MalfunctionMean = 0.8

    ArcCW.LoadAttachmentType(att, "uc_powder_gyrojet")
end
                                    

                                    
do
    local att = {}

att.PrintName = "Match Powder"
att.AbbrevName = "Match Powder"

att.SortOrder = 15
att.Icon = Material("entities/att/acwatt_uc_powder_subsonic.png", "smooth mips")
att.Description = [[Extruded powder from a single lot, thrown to the tenth of a grain and stable across temperature, so every charge burns the same way and every bullet leaves at the same speed. Benchrest shooters chase this because velocity spread is what opens a group up at distance, not the rifle.

A deliberate, settled shot from this is as close to exact as the weapon can manage. Emptying the magazine at speed wastes everything you paid for.]]
att.Desc_Pros = {
    "A settled first shot is nearly perfect",
    "Longer reach and clean, consistent burn",
}
att.Desc_Cons = {
    "Slow to cycle",
    "Rewards nothing about volume of fire",
}
att.Desc_Neutrals = {
    "Pause between shots to reset the bonus",
}
att.Slot = "uc_powder"

att.AutoStats = true

local SETTLE  = 1.6
local COLDMUL = 0.15

att.Hook_ModDispersion = function(wep, hip)
    if CurTime() - (wep.UC_LastMatchShot or 0) < SETTLE then return end

    return hip * COLDMUL
end

att.Hook_PostFireBullets = function(wep)
    wep.UC_LastMatchShot = CurTime()
end

att.Mult_AccuracyMOA = 0.8
att.Mult_Range = 1.3
att.Mult_RangeMin = 1.2
att.Mult_PhysBulletMuzzleVelocity = 1.15

att.Mult_Damage = 0.95
att.Mult_DamageMin = 0.95

att.Mult_RPM = 0.85
att.Mult_Recoil = 0.9
att.Mult_ShootVol = 0.95
att.Mult_MalfunctionMean = 1.35

    ArcCW.LoadAttachmentType(att, "uc_powder_match")
end
                                  

                                        
do
    local att = {}

att.PrintName = "Plutonium Load"

att.SortOrder = 19
att.Icon = Material("entities/att/arccw_plutonium_powder.png", "smooth mips")
att.Description = "Ammunition loaded with plutonium as a propellant, offering a ridiculous amount of power at the cost of jamming and decreased fire rate. Due to the casing containing this radioactive substance, the bullet will offer mild radiation damage to the user in addition to the ballistic damage."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 2.72
att.Mult_Range = 5.85
att.Mult_Damage = 3.65
att.Mult_DamageMin = 3.65
att.Mult_Penetration = 5.55

att.Mult_ShootVol = 1.75
att.Mult_RPM = 0.55
att.Mult_ShootPitch = 0.62

att.Mult_MalfunctionMean = 0.08
att.Mult_PhysBulletMuzzleVelocity = 5.85
att.Override_DamageType = DMG_RADIATION

local tail = ")^/weapons/misc/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "plutonium_powder_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_powder_plutonium")
end
                                      

                                    
do
    local att = {}

att.PrintName = "Range Load"
att.AbbrevName = "Range Load"

att.SortOrder = 20
att.Icon = Material("entities/att/acwatt_uc_powder_low.png", "smooth mips")
att.Description = [[Cheap factory practice ammunition, loaded light and loaded identically, by the thousand, for people who are going to shoot all of it at paper. Soft primers, clean powder and a bullet that does not have to do anything on arrival except make a hole.

Nothing about it is impressive and nothing about it ever surprises you, which on a range is the entire selling point.]]
att.Desc_Pros = {
    "Utterly consistent, no damage variance",
    "Gentle and very reliable",
}
att.Desc_Cons = {
    "Weak, and will not get through cover",
}
att.Desc_Neutrals = {
    "Runs cool enough to shoot all day",
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Override_DamageRand = 0

att.Mult_Damage = 0.7
att.Mult_DamageMin = 0.7
att.Mult_Penetration = 0.6
att.Mult_Range = 0.8
att.Mult_RangeMin = 0.85
att.Mult_PhysBulletMuzzleVelocity = 0.85

att.Mult_Recoil = 0.7
att.Mult_RecoilSide = 0.7
att.Mult_RecoilPunch = 0.75
att.Mult_VisualRecoilMult = 0.75

att.Mult_AccuracyMOA = 0.85
att.Mult_MoveDispersion = 0.9

att.Mult_ShootVol = 0.85
att.Mult_MalfunctionMean = 1.6
att.Mult_HeatCapacity = 1.25
att.Mult_HeatDissipation = 1.2

    ArcCW.LoadAttachmentType(att, "uc_powder_range")
end
                                  

                                            
do
    local att = {}

att.PrintName = "Super Overload Load"
att.AbbrevName = "Super Overload"

att.SortOrder = 20
att.Icon = Material("entities/att/tnt_powder.png", "smooth mips")
att.Description = [[A case filled past the point any load book will admit exists, seated on a bullet that was never meant to be pushed this hard. It shoots flat and it shoots through things, right up until the brass lets go and vents the whole charge back along the bolt into your face.

The gun will fail on this. Not if, when. The only question is whether you are still holding it when the case gives.]]
att.Desc_Pros = {
    "Enormous velocity, reach and penetration",
}
att.Desc_Cons = {
    "Jams constantly",
    "Cases rupture and injure the shooter",
    "Punishing recoil and slow to cycle",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

local RUPTURE_CHANCE = 0.07
local RUPTURE_MIN    = 14
local RUPTURE_MAX    = 28
local FLOOR          = 5

att.Hook_PostFireBullets = function(wep)
    if !SERVER then return end
    if math.random() > RUPTURE_CHANCE then return end

    local owner = wep:GetOwner()
    if !IsValid(owner) or !owner.Health then return end

    local hp = owner:Health()
    if hp <= 0 then return end

    local hurt = math.min(math.random(RUPTURE_MIN, RUPTURE_MAX), math.max(0, hp - FLOOR))

    if hurt > 0 then
        local dmg = DamageInfo()
        dmg:SetDamage(hurt)
        dmg:SetDamageType(DMG_BLAST)
        dmg:SetAttacker(owner)
        dmg:SetInflictor(IsValid(wep) and wep or owner)
        owner:TakeDamageInfo(dmg)
    end

    if owner:IsPlayer() then
        owner:ViewPunch(Angle(-9, math.Rand(-4, 4), 0))
        owner:ScreenFade(1, Color(255, 240, 180, 90), 0.4, 0)
    end

    local eff = EffectData()
    eff:SetOrigin(owner:EyePos())
    eff:SetMagnitude(2)
    eff:SetScale(0.4)
    eff:SetRadius(3)
    util.Effect("Sparks", eff)
end

att.Mult_Damage = 2.2
att.Mult_DamageMin = 2.2
att.Mult_Penetration = 2.4
att.Mult_Range = 2.1
att.Mult_RangeMin = 1.8
att.Mult_PhysBulletMuzzleVelocity = 2.3

att.Mult_Recoil = 2.1
att.Mult_RecoilSide = 1.9
att.Mult_RecoilPunch = 2.0
att.Mult_VisualRecoilMult = 1.8

att.Mult_RPM = 0.6
att.Mult_ShootVol = 1.6
att.Mult_ShootPitch = 0.7
att.Mult_MalfunctionMean = 0.12
att.Mult_HeatCapacity = 0.5

    ArcCW.LoadAttachmentType(att, "uc_powder_superoverload")
end
                                          

                                        
do
    local att = {}

att.PrintName = "Tannerite Load"
att.AbbrevName = "Tannerite"

att.SortOrder = 21
att.Icon = Material("entities/att/powderc4.png", "smooth mips")
att.Description = [[Ammonium nitrate and aluminium powder, mixed in the driveway from a kit sold for making targets go bang, and packed into the projectile instead of the case. It is inert until something hits it hard enough, and then it is very much not inert.

The bullet does almost nothing on its own. What arrives with it is the problem, for the target and for anyone stood near the target, yourself included.]]
att.Desc_Pros = {
    "Detonates on impact with a wide blast",
    "Damages everything around the point of impact",
}
att.Desc_Cons = {
    "The bullet itself is feeble",
    "Will happily catch you at close range",
    "No penetration whatsoever",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Override_Penetration = 0

local RADIUS = 150

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or wep
    local pos = hit.tr.HitPos

    util.BlastDamage(wep, owner, pos, RADIUS, hit.damage * 1.6)

    local eff = EffectData()
    eff:SetOrigin(pos)
    eff:SetMagnitude(3)
    eff:SetScale(0.6)
    eff:SetRadius(4)
    util.Effect("Explosion", eff)
    util.Decal("Scorch", pos - hit.tr.HitNormal, pos + hit.tr.HitNormal, ents.GetAll())

    return hit
end

att.Mult_Damage = 0.45
att.Mult_DamageMin = 0.45
att.Mult_Range = 0.8
att.Mult_RangeMin = 0.8

att.Mult_Recoil = 1.3
att.Mult_VisualRecoilMult = 1.2
att.Mult_RPM = 0.8
att.Mult_ShootVol = 1.3
att.Mult_ShootPitch = 0.85
att.Mult_MalfunctionMean = 0.5
att.Mult_ClipSize = 0.8

    ArcCW.LoadAttachmentType(att, "uc_powder_tannerite")
end
                                      

                                  
do
    local att = {}

att.PrintName = "Trinitrotoluene Load"

att.SortOrder = 19
att.Icon = Material("entities/att/tnt_powder.png", "smooth mips")
att.Description = "Ammunition loaded with TNT as a propellant. Offers great power but makes the weapon very unreliable."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_Recoil = 1.42
att.Mult_Range = 1.32
att.Mult_Damage = 1.55
att.Mult_DamageMin = 1.55
att.Mult_Penetration = 1.75

att.Mult_ShootVol = 1.46
att.Mult_RPM = 0.72
att.Mult_ShootPitch = 0.78

att.Mult_MalfunctionMean = 0.18
att.Mult_PhysBulletMuzzleVelocity = 1.46

local tail = ")^/weapons/misc/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "tnt_powder_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_powder_tnt")
end
                                

                                
do
    local att = {}

att.PrintName = "SCAR-H 45-Round 5.45x39mm Mag"
att.AbbrevName = "45-Round 5.45x39mm Mag"

att.Icon = Material("", "smooth mips")
att.Description = "Carbine caliber."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_scar_mag"
att.SortOrder = 10 + 308

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.45x39mm Soviet"
att.Override_Trivia_Class = "Carbine"

att.Mult_Range = 1.2
att.Mult_RPM = 1.083
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = .95
att.Mult_Recoil = .85
att.Mult_AccuracyMOA = .85
att.Mult_HipDispersion = .75

att.Mult_Penetration = .65
att.Mult_DamageMin = .8
att.Mult_Damage = .8
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
att.Override_ShellScale = 0.666

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_ak"
end
att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_ak"
end

att.GivesFlags = {"conv_545"}

local path = ")weapons/arccw_ur/ak/545_39/"
local path1 = ")weapons/arccw_ur/ak/"
local tail = ")/arccw_uc/common/556x45/"
local fire545dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg",tail .. "fire-dist-556x45-rif-ext-02.ogg",tail .. "fire-dist-556x45-rif-ext-03.ogg",tail .. "fire-dist-556x45-rif-ext-04.ogg",tail .. "fire-dist-556x45-rif-ext-05.ogg",tail .. "fire-dist-556x45-rif-ext-06.ogg"}
local fire545 = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local fire545supp = {path .. "fire-sup-01.ogg", path .. "fire-sup-02.ogg", path .. "fire-sup-03.ogg", path .. "fire-sup-04.ogg", path .. "fire-sup-05.ogg", path .. "fire-sup-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then
        return fire545supp
    else
        return fire545
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire545dist
    end
end

    ArcCW.LoadAttachmentType(att, "uc_scar_545")
end
                              

                                 
do
    local att = {}

att.PrintName = "SCAR-H 30-Round 9x39mm Mag"
att.AbbrevName = "30-Round 9x39mm Mag"

att.Icon = Material("", "smooth mips")
att.Description = "Unusual calibre prone to jamming, maybe."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_scar_mag"
att.SortOrder = 10 + 308

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "9x39mm Soviet"
att.Override_Trivia_Class = "Carbine"

att.Mult_RPM = 800/650
att.Mult_SightedSpeedMult = 1.075
att.Mult_Recoil = 0.4
att.Mult_HipDispersion = .7

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.5
att.Mult_MalfunctionVariance = 1.5

att.Mult_Penetration = 7 / 20
att.Mult_DamageMin = 17 / 35
att.Mult_Damage = 29 / 65
att.ShootPitchVariation = 1
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_ak"
end
att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_ak"
end

att.GivesFlags = {"conv_sd"}

local tail762 = ")/arccw_uc/common/762x39/"
local fire762dist = {tail762 .. "fire-dist-762x39-rif-ext-01.ogg", tail762 .. "fire-dist-762x39-rif-ext-02.ogg", tail762 .. "fire-dist-762x39-rif-ext-03.ogg", tail762 .. "fire-dist-762x39-rif-ext-04.ogg", tail762 .. "fire-dist-762x39-rif-ext-05.ogg", tail762 .. "fire-dist-762x39-rif-ext-06.ogg"}
local fire762distint = {tail762 .. "fire-dist-762x39-rif-int-01.ogg", tail762 .. "fire-dist-762x39-rif-int-02.ogg", tail762 .. "fire-dist-762x39-rif-int-03.ogg", tail762 .. "fire-dist-762x39-rif-int-04.ogg", tail762 .. "fire-dist-762x39-rif-int-05.ogg", tail762 .. "fire-dist-762x39-rif-int-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire762dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire762distint
    end
end

att.Hook_GetShootSound = function(wep, fsound)
	if wep:GetBuff_Override("Silencer") then
		return "myt_c1a1/shot_939_sd.ogg"
	else
		return "myt_c1a1/939-1.ogg" || "myt_c1a1/939-2.ogg" || "myt_c1a1/939-3.ogg"
	end
end

    ArcCW.LoadAttachmentType(att, "uc_scar_9x39")
end
                               

                                    
do
    local att = {}

att.PrintName = "SCAR-H 20-Round .410 Bore Mag"
att.AbbrevName = "20-Round .410 Bore Mag"

att.Icon = Material("entities/att/ue_scar/l_556.png", "smooth mips")
att.Description = "Turn this SCAR into a fucking shotgun, simple as that."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_scar_mag"
att.SortOrder = 25 + 410

att.AutoStats = true
att.HideIfBlocked = true

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.Mult_ReloadTime = 1.05
att.Mult_Recoil = 1.15
att.Mult_HipDispersion = 1.10
att.Override_Num = 4
att.Mult_AccuracyMOA = 25

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 1.30
att.Mult_Damage = 1.38
att.ShootPitchVariation = 1

att.Mult_RPM = 0.80

local path = "weapons/misc/"

local fire22 = {path .. "scar_410_fire.wav"}
local fire22sup = {path .. "scar_410_fire_sup.wav"}

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

    ArcCW.LoadAttachmentType(att, "uc_scar_mag_410")
end
                                  

                                          
do
    local att = {}

att.PrintName = "SCAR-H 10-Round 6.5 Creedmoor Mag"
att.AbbrevName = "10-Round 6.5 Creedmoor Mag"

att.Icon = Material("entities/att/ue_scar/l_308.png", "smooth mips")
att.Description = "The 6.5mm Creedmoor is a popular centerfire rifle cartridge introduced by Hornady in 2007. It was designed for long-range target shooting but has also gained popularity in medium game hunting."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_myt_scar_mag"
att.SortOrder = 10 + 308

att.Mult_DamageMin = 1.4
att.Mult_Damage = 1.335
att.Mult_Penetration = 1.38

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 10

att.ActivateElements = {"conv_ssr"}

att.Mult_RPM = 0.70

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

local path = "weapons/misc/"

local fire22 = {path .. "scar_65mm_fire.wav"}
local fire22sup = {path .. "scar_65mm_fire_sup.wav"}

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

    ArcCW.LoadAttachmentType(att, "uc_scar_mag_creedmoor")
end
                                        

                                           
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = Material("entities/att/arccw_uc_extra_none.png")
att.Description = "Removes the stock completely, making the weapon's rear as compact as it can get."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 996

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_myt_scar_stock"
att.ActivateElements = {"stock_none"}

att.Mult_SightTime = 0.80
att.Mult_Sway = 1.45

att.Mult_SightedSpeedMult = 1.5
att.Mult_ShootSpeedMult = 1.5
att.Mult_RecoilSide = 2.2
att.Mult_Recoil = 2.2
att.Add_BarrelLength = -5

    ArcCW.LoadAttachmentType(att, "uc_scar_stockless_full")
end
                                         

                                       
do
    local att = {}

att.PrintName = "Buttcap A"
att.Icon = Material("entities/att/ur_mp5/stock_cap.png")
att.Description = "Removes the stock in favour of a less conventional buttcap."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 999

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_myt_scar_stock"
att.ActivateElements = {"stock_buttcap_a"}

att.Mult_SightTime = 0.95
att.Mult_Sway = 1.35

att.Mult_SightedSpeedMult = 1.3
att.Mult_ShootSpeedMult = 1.3
att.Mult_RecoilSide = 1.8
att.Mult_Recoil = 2.0
att.Add_BarrelLength = -4

    ArcCW.LoadAttachmentType(att, "uc_scar_stocklessA")
end
                                     

                                       
do
    local att = {}

att.PrintName = "Buttcap B"
att.Icon = Material("entities/att/ur_mp5/stock_cap.png")
att.Description = "Removes the stock in favour of a less conventional buttcap."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 998

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_myt_scar_stock"
att.ActivateElements = {"stock_buttcap_b"}

att.Mult_SightTime = 0.95
att.Mult_Sway = 1.35

att.Mult_SightedSpeedMult = 1.3
att.Mult_ShootSpeedMult = 1.3
att.Mult_Recoil = 2.0
att.Mult_RecoilSide = 1.8
att.Add_BarrelLength = -4

    ArcCW.LoadAttachmentType(att, "uc_scar_stocklessB")
end
                                     

                                       
do
    local att = {}

att.PrintName = "Buttcap C"
att.Icon = Material("entities/att/ur_mp5/stock_cap.png")
att.Description = "Removes the stock in favour of a less conventional buttcap."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 997

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_myt_scar_stock"
att.ActivateElements = {"stock_buttcap_c"}

att.Mult_SightTime = 0.95
att.Mult_Sway = 1.35

att.Mult_SightedSpeedMult = 1.3
att.Mult_ShootSpeedMult = 1.3
att.Mult_RecoilSide = 1.8
att.Mult_Recoil = 2.0
att.Add_BarrelLength = -4

    ArcCW.LoadAttachmentType(att, "uc_scar_stocklessC")
end
                                     

                                 
do
    local att = {}

att.PrintName = "Buffer Tube"
att.Icon = Material("entities/att/acwatt_ud_m16_stock_buffer.png", "smooth mips")
att.Description = "The concept of \"stocks\" and \"recoil reduction\" are liberal gibberish made up to stop FREEDOM-LOVING AMERICANS from exercising their GOD-GIVEN RIGHTS."
    att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = 995

att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "uc_myt_scar_stock"
att.ActivateElements = {"stock_tube"}

att.Mult_SpeedMult = 1.05

att.Mult_SightTime = 0.75
att.Mult_DrawTime = 0.6
att.Mult_HolsterTime = 0.6

att.Mult_Recoil = 1.5
att.Mult_RecoilSide = 2

att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.15

att.Add_BarrelLength = -8
att.Mult_Sway = 3

    ArcCW.LoadAttachmentType(att, "uc_scar_tube")
end
                               

                                      
do
    local att = {}

att.PrintName = "Rifle Grenade"
att.Icon = Material("entities/att/arccw_uc_extra_rifle_grenade.png")
att.Description = "Surplus barrel-mounted rifle grenade from World War II, that can be fired from the first shot of the weapon it is mounted on."
att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {

}
att.AutoStats = true
att.Slot = "muzzle"
att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/ud_silencer_light.mdl"
att.ModelOffset = Vector(-0.25, 0, 0)
att.OffsetAng = Angle(0, 180, 0)

att.IsMuzzleDevice = true

att.Mult_Recoil = 1.52
att.Mult_Range = 3.55
att.Mult_ShootVol = 1.45
att.Mult_PhysBulletMuzzleVelocity = 3.55

att.Add_BarrelLength = 1.15

att.Health = 1
att.DamageOnShoot = 1
att.Breakable = true

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound then return ")^/weapons/40mm_displacer/mk3a2_fire.wav" end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return ")^/weapons/40mm_displacer/mk3a2_fire.wav" end
end

att.Override_ShootEntity = "arccw_uc_40mm_hv"

    ArcCW.LoadAttachmentType(att, "uc_supp_riflenade")
end
                                    

                                                      
do
    local att = {}

att.PrintName = "URBAN Rail-Mounted Spotlight"
att.AbbrevName = "URBAN Spotlight"
att.Icon = Material("entities/ucepicfail.png")
att.Description = "shine urbna"
att.Desc_Pros = {
    "uc.light"
}
att.Desc_Cons = {
    "con.light"
}
att.Desc_Neutrals = {
    "Also useful if you use StormFox",
}
att.AutoStats = true

att.Slot = {"tac"}
att.SortOrder = .9

att.Model = "models/weapons/arccw/atts/uc_flashlight.mdl"
att.ModelOffset = Vector(0.5,0,-0.07)
att.OffsetAng = Angle(0,0,0)
att.ModelScale = Vector(0.75,0.75,0.75)

att.Flashlight = false
att.FlashlightFOV = 40
att.FlashlightFarZ = 5000
att.FlashlightNearZ = 1
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_CONSTANT
att.FlashlightColor = Color(255, 255, 255)
att.FlashlightTexture = "entities/ucepicfail.png"
att.FlashlightBrightness = 1
att.FlashlightBone = "flashlight"

att.ToggleStats = {
    {
        PrintName = "NO URBNA",
        Flashlight = false,
    },
    {
        PrintName = "YES URBNA",
        Flashlight = true
    },
    {
        PrintName = "MORE URBNA",
        Flashlight = true,
        FlashlightFarZ = 10000,
        FlashlightBrightness = 2
    },
    {
        PrintName = "EVEN MORE URBNA",
        Flashlight = true,
        FlashlightFarZ = 25000,
        FlashlightBrightness = 3
    },
    {
        PrintName = "ALL URBNA",
        Flashlight = true,
        FlashlightFarZ = 50000,
        FlashlightBrightness = 4
    }
}

    ArcCW.LoadAttachmentType(att, "uc_tac_flashlight_urbna_spotlight")
end
                                                    

                                   
do
    local att = {}

att.PrintName = "Athletic"
att.Icon = Material("entities/att/arccw_uc_athletic.png", "smooth mips")
att.Description = "You've always attended PE classes and never skipped, good job! That doesn't mean you are a combat expert though."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_tp", "perk", "go_perk", "bo1_perk"}

att.AutoStats = true
att.SortOrder = 999

att.Mult_Recoil = 1.30
att.Mult_RecoilSide = 1.15
att.Mult_SightTime = 0.70
att.Mult_Sway = 0.70
att.Mult_MoveSpeed = 1.40
att.Mult_SightedSpeedMult = 10
att.BO1_StaminUp = true

hook.Add("Move", "ArcCW_BO1_StaminUp", function(ply, mv)
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not wep.ArcCW or not wep:GetBuff_Override("BO1_StaminUp") then return end

    local max = ply:GetMaxSpeed()
    local s = ply.ArcCW_LastTickSpeedMult or 1

    if ply:Crouching() then s = s * ply:GetCrouchedWalkSpeed() end

    mv:SetMaxSpeed(max * s * 1.15)
    mv:SetMaxClientSpeed(max * s * 1.15)
end)

    ArcCW.LoadAttachmentType(att, "uc_tp_athletic")
end
                                 

                                        
do
    local att = {}

att.PrintName = "Breath Control"
att.AbbrevName = "Breath Control"

att.SortOrder = 22
att.Icon = Material("", "mips smooth")
att.Description = "Fire in the natural respiratory pause, at the bottom of the breath, when the chest is still and the heartbeat is the only thing left moving the sights. Every marksmanship course on earth teaches it and almost nobody does it under pressure.\n\nSway while aimed is cut in half, so long shots hold steady. The catch is that you cannot walk and stay steady: moving while aimed throws it off completely."
att.Desc_Pros = {
    "Very steady when sighted",
}
att.Desc_Cons = {
    "Slow to move while aiming",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"
att.AutoStats = true

att.Mult_Sway = 0.5
att.Mult_AccuracyMOA = 0.88
att.Mult_SightTime = 0.94

att.Mult_SightedSpeedMult = 0.75
att.Mult_HipDispersion = 1.12

    ArcCW.LoadAttachmentType(att, "uc_tp_breathcontrol")
end
                                      

                                 
do
    local att = {}

att.PrintName = "Brütal"
att.Icon = Material("entities/att/arccw_brutal.png", "smooth mips")
att.Description = "\"A good roadie knows his whole job is to make someone else look good, keep someone else safe, help someone else do what they were put here to do. A good roadie stays out of the spotlight. If he's doing his job right, you don't even know he's there. Once in a while he might step on stage just to fix a problem, to set something right. But then before you even realize he was there or what he did, he's gone.\" - Eddie Riggs"
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_tp", "perk", "go_perk", "bo1_perk"}

att.AutoStats = true
att.SortOrder = 999

att.Mult_Recoil = 0.82
att.Mult_RecoilSide = 1.25
att.Mult_SightTime = 0.85
att.Mult_Sway = 0.85
att.Mult_MoveSpeed = 1.22
att.Mult_MeleeDamage = 1.47
att.Mult_MeleeTime = 0.57
att.AttachSound = "weapons/misc/perk_brutal.ogg"

    ArcCW.LoadAttachmentType(att, "uc_tp_brutal")
end
                               

                               
do
    local att = {}

att.PrintName = "Fudd"
att.Icon = Material("entities/att/arccw_fudd.png", "smooth mips")
att.Description = "Reject the second amendment and become the most unlikeable firearm owner ever. \n\n \"See sonny, them pistols in that cabinet... all they're good for is killin' people.\""
att.Desc_Pros = {

}
att.Desc_Cons = {
    "Full-auto is unethical so you get none, lol"
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_tp", "perk", "go_perk", "bo1_perk"}

att.AutoStats = true
att.SortOrder = 999

att.Mult_Recoil = 0.5
att.Mult_RecoilSide = 0.15
att.Mult_SightTime = 1.15
att.Mult_MoveSpeed = 1.05
att.Mult_RPM = 0.50
att.Mult_ClipSize = 0.60
att.Mult_Range = 1.35
att.Mult_Precision = 1.25
att.Mult_CycleTime = 0.50
att.Mult_MalfunctionMean = 1.50
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.AttachSound = "weapons/misc/sad_trombone.ogg"

    ArcCW.LoadAttachmentType(att, "uc_tp_fudd")
end
                             

                                         
do
    local att = {}

att.PrintName = "Old Man\'s Child"
att.Icon = Material("entities/att/oldmanschild.png", "mips smooth")
att.Description = "\"Come with the fall of dawn and grant us your powers, show us the way to go, lead the pack into your storm!\""
att.Desc_Pros = {
    "+500% Headshot Damage"
}
att.Slot = {"bo1_perk", "uc_tp", "perk", "go_perk"}
att.SortOrder = 999
att.NoRandom = true
att.NotForNPCS = true

att.AutoStats = true
att.Mult_HipDispersion = 0.5
att.Mult_MoveDispersion = 0.5
att.Mult_Recoil = 0.75
att.Mult_Sway = 0.1

att.Hook_BulletHit = function(wep, data)
    if data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 5
    end
end

att.AttachSound = "weapons/misc/perk_oldmanschild.ogg"

    ArcCW.LoadAttachmentType(att, "uc_tp_old_mans_child")
end
                                       

                                        
do
    local att = {}

att.PrintName = "Sentry"
att.Icon = Material("entities/att/arccw_sentry.png", "smooth mips")
att.Description = "Turns the user into a sentry turret by affixing them to the ground and increasing their firepower."
att.Desc_Pros = {

}
att.Desc_Cons = {
    "You cannot move"
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_tp", "perk", "go_perk", "bo1_perk"}

att.AutoStats = true
att.SortOrder = 999

att.Mult_Recoil = 1.25
att.Mult_RecoilSide = 1.05
att.Mult_SightTime = 0.35
att.Mult_Sway = 0.35
att.Mult_MoveSpeed = 0.00001
att.Mult_RPM = 2.5
att.Mult_ClipSize = 2

    ArcCW.LoadAttachmentType(att, "uc_tp_sentry_turret")
end
                                      

                                   
do
    local att = {}

att.PrintName = "Wei Shen"
att.Icon = Material("entities/att/arccw_wei_shen.png", "smooth mips")
att.Description = "Years of experience infiltrating chinese gangster groups as an undercover cop make you good at both hand-to-hand combat and gunfights. \n\n \"You're a cop. I am an undercover cop. The rules are different.\" - Wei Shen"
att.Desc_Pros = {

}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = {"uc_tp", "perk", "go_perk", "bo1_perk"}

att.AutoStats = true
att.SortOrder = 999

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.85
att.Mult_SightTime = 1.10
att.Mult_MoveSpeed = 1.15
att.Mult_RPM = 1.05
att.Mult_Range = 1.25
att.Mult_Precision = 1.35
att.Mult_CycleTime = 1.05
att.Mult_MalfunctionMean = 1.05
att.Mult_MeleeDamage = 1.20
att.Mult_MeleeTime = 0.80
att.Mult_Sway = 0.95

att.AttachSound = "weapons/misc/wei_shen.ogg"

    ArcCW.LoadAttachmentType(att, "uc_tp_wei_shen")
end
                                 

                                          
do
    local att = {}

att.PrintName = "17\" Long Barrel"
att.AbbrevName = "17\" Long Barrel"
att.Icon = Material("", "mips smooth")
att.Description = "Longer barrel for increased accuracy and range. The longer barrel improves the weapon's effective range and accuracy."
att.Slot = {"uc_type20_barrel"}
att.AutoStats = true

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "17\" Long Barrel"
end

att.SortOrder = 8

att.Add_BarrelLength = 4
att.Mult_RPM = 0.98
att.Mult_SightTime = 1.05
att.Mult_HipDispersion = 0.85
att.Mult_SightedSpeedMult = 0.95
att.Mult_SpeedMult = 0.98
att.Mult_Sway = 0.85

att.Mult_Recoil = 0.9
att.Mult_Range = 1.15

att.ActivateElements = {"barrel_long"}

    ArcCW.LoadAttachmentType(att, "uc_type20_barrel_long")
end
                                        

                                           
do
    local att = {}

att.PrintName = "10\" Short Barrel"
att.AbbrevName = "10\" Short Barrel"
att.Icon = Material("", "mips smooth")
att.Description = "Shorter barrel for increased maneuverability. The shorter barrel reduces the weapon's effective range and accuracy."
att.Slot = {"uc_type20_barrel"}
att.AutoStats = true

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "10\" Short Barrel"
end

att.SortOrder = 8

att.Mult_ShootPitch = 115 / 100
att.Add_BarrelLength = -6
att.Mult_RPM = 1.05
att.Mult_SightTime = 0.8
att.Mult_HipDispersion = 0.8
att.Mult_SightedSpeedMult = 1.1
att.Mult_SpeedMult = 1.02
att.Mult_Sway = 0.75

att.Mult_Recoil = 1.1
att.Mult_Range = .9

att.ActivateElements = {"barrel_short"}

    ArcCW.LoadAttachmentType(att, "uc_type20_barrel_short")
end
                                         

                                         
do
    local att = {}

att.PrintName = "Kawara K-20 12.7x55mm STs-130 Conversion"
att.AbbrevName = "12.7x55mm STs-130"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "Russian half inch subsonic, built for the ASh-12 that Spetsnaz units carry into buildings. It moves slowly enough to stay quiet and weighs enough that this does not matter at the ranges it is used at.\n\nHits very hard and drops the target to 45 percent speed for three and a half seconds. Quiet, but the range is poor and the magazine is small."
att.Desc_Pros = {
    "Very heavy hit",
    "Cripples movement",
    "Quiet",
}
att.Desc_Cons = {
    "Short ranged",
    "Small magazine",
    "Slow",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "12.7x55mm STs-130"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.7
att.Mult_DamageMin = 1.35
att.Mult_Penetration = 1.3
att.Mult_Range = 0.55
att.Mult_RangeMin = 0.6
att.Mult_MuzzleVelocity = 0.45
att.Mult_Recoil = 1.45
att.Mult_RPM = 0.7
att.Mult_ClipSize = 0.6
att.Mult_ShootVol = 0.7
att.Mult_ShootPitch = 0.68

local SLOW = 0.45
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

    ArcCW.LoadAttachmentType(att, "uc_type20_cal_127x55")
end
                                       

                                            
do
    local att = {}

att.PrintName = "Kawara K-20 .30 Herrett Conversion"
att.AbbrevName = ".30 Herrett"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/30carbine.png", "smooth mips")
att.Description = "Steve Herrett and Bob Milek necked a .30-30 case down and shortened it for Thompson Contender pistols in the seventies. It was never chambered in a factory rifle and every case that exists was formed by hand.\n\nTags the target for four and a half seconds; hits inside that window do 65 percent more. Rewards picking one target and staying on them rather than spraying."
att.Desc_Pros = {
    "Follow-up hits land much harder",
}
att.Desc_Cons = {
    "Unremarkable on the first shot",
    "Reduced magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".30 Herrett"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.1
att.Mult_DamageMin = 1.15
att.Mult_Penetration = 1.2
att.Mult_Range = 1.25
att.Mult_Recoil = 1.1
att.Mult_RPM = 0.9
att.Mult_ClipSize = 0.85
att.Mult_AccuracyMOA = 0.85

local TAG_TIME = 4.5
local TAG_MULT = 1.65

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
att.Mult_ShootPitch = 0.95
att.Mult_ShootVol = 1.0

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

    ArcCW.LoadAttachmentType(att, "uc_type20_cal_30herrett")
end
                                          

                                           
do
    local att = {}

att.PrintName = "Rock Salt Handload"
att.AbbrevName = "Rock Salt"

att.SortOrder = 80
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "smooth mips")
att.Description = "A shell somebody emptied and refilled with coarse salt, which is a thing farmers have genuinely done to people found in their orchards. It will not kill anybody. It will comprehensively ruin their afternoon and they will not come back.\n\n24 pellets that cannot finish anybody. The round is hard capped so it always leaves the target at least 8 HP, headshots included. Use it to break up a fight, not to win one."
att.Desc_Pros = {
    "Enormous number of pellets",
    "Cannot kill by accident",
}
att.Desc_Cons = {
    "Cannot kill on purpose either",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_type20_cal"
att.AutoStats = true

att.Override_Trivia_Calibre = "12 Gauge Rock Salt"
att.Override_Num = 24
att.Override_Penetration = 0

local FLOOR = 8

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return hit end

    local hp = ent:Health()
    if hp <= 0 then return hit end

    local mult = 1
    local dmgtable = wep:GetBuff_Override("Override_BodyDamageMults", wep.BodyDamageMults)
    local hg = hit.tr.HitGroup
    if dmgtable and hg and dmgtable[hg] then
        mult = math.max(dmgtable[hg], 1)
    end

    hit.damage = math.min(hit.damage, math.max(0, hp - FLOOR) / mult)
    return hit
end

att.Mult_Damage = 0.16
att.Mult_DamageMin = 0.12
att.Mult_Range = 0.42
att.Mult_AccuracyMOA = 2.2
att.Mult_Recoil = 0.45
att.Mult_VisualRecoilMult = 0.5
att.Mult_ShootPitch = 1.12
att.Mult_ShootVol = 0.85

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

    ArcCW.LoadAttachmentType(att, "uc_type20_cal_rocksalt")
end
                                         

                                      
do
    local att = {}

att.PrintName = "100-Round Mag"
att.AbbrevName = "100-Round Mag"

att.Icon = Material("","smooth mips")
att.Description = "Magazine with a very high capacity. The heavier load increases the weapon's weight."
att.Slot = {"uc_type20_mag"}
att.AutoStats = true

att.SortOrder = 14

att.HideIfBlocked = true

att.Override_ClipSize = 100

att.Mult_SightTime = 1.15
att.Mult_ReloadTime = 1.15
att.Mult_Sway = 1.10

att.Mult_SpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.90

att.Mult_HipDispersion = 1.05

att.ExcludeFlags = {"mag_smg"}

att.ActivateElements = {"mag_100"}

    ArcCW.LoadAttachmentType(att, "uc_type20_mag_100")
end
                                    

                                     
do
    local att = {}

att.PrintName = "15-Round Mag"
att.AbbrevName = "15-Round Mag"

att.Icon = Material("","smooth mips")
att.Description = "Magazine with a very low capacity. The lighter load reduces the weapon's weight significantly."
att.Slot = {"uc_type20_mag"}
att.AutoStats = true

att.SortOrder = 14

att.HideIfBlocked = true

att.Override_ClipSize = 15

att.Mult_SightTime = 0.9
att.Mult_ReloadTime = 0.95
att.Mult_Sway = 0.7

att.Mult_SpeedMult = 1.025
att.Mult_ShootSpeedMult = 1.05

att.Mult_HipDispersion = 0.85

att.ExcludeFlags = {"mag_smg"}

att.ActivateElements = {"mag_15"}

    ArcCW.LoadAttachmentType(att, "uc_type20_mag_15")
end
                                   

                                         
do
    local att = {}

att.PrintName = "50-Round Magazine"
att.AbbrevName = "50-Round Mag"
att.Icon = Material("", "mips smooth")
att.Description = "Extended pistol-caliber magazine."
att.Slot = {"uc_type20_mag"}
att.AutoStats = true
att.Desc_Neutrals = {

}

att.SortOrder = 30

att.HideIfBlocked = true

att.Override_ClipSize = 50
att.Override_ClipSize_Priority = 2

att.Hook_ModifyBodygroups = function(wep,data)
    local vm = data.vm

    vm:SetBodygroup(4, 4)
end

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.10

att.RequireFlags = {"mag_smg"}

    ArcCW.LoadAttachmentType(att, "uc_type20_mag_smg_50")
end
                                       

                                        
do
    local att = {}

att.PrintName = "Extended Stock"
att.AbbrevName = "Extended Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Extend the standard stock to provide a better brace at the cost of combat mobility."
att.Icon = Material("", "smooth mips")
att.Slot = "uc_type20_stock"

att.AutoStats = true

att.HideIfBlocked = true

att.Mult_Recoil = .8
att.Mult_Sway = .8

att.Mult_SightedSpeedMult = .85
att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.ActivateElements = {"stock_extended"}

    ArcCW.LoadAttachmentType(att, "uc_type20_stock_ext")
end
                                      

                                   
do
    local att = {}

att.PrintName = "Flashlight Grip"

att.Icon = Material("", "smooth mips")
att.Description = "Foregrip fitted with a flashlight."
att.Desc_Cons = {
    "uc.noubs"
}
att.AutoStats = true

att.Slot = "foregrip"

att.LHIK = true

att.ModelOffset = Vector(-16, -2.8, 3.75)
att.Model = "models/vergi_arccw/uc_taclight_grip.mdl"

att.Mult_Recoil = 0.8
att.Mult_SightTime = 1.1
att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15

att.Flashlight = false
att.FlashlightFOV = 50
att.FlashlightFarZ = 512
att.FlashlightNearZ = 1
att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR
att.FlashlightColor = Color(255, 255, 255)
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 4
att.FlashlightBone = "1"

att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Wide",
        Flashlight = true,
        FlashlightFOV = 80,
        FlashlightFarZ = 768,
        FlashlightBrightness = 1
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}

att.Override_HoldtypeActive = "smg"
att.Override_HoldtypeActive_Priority = 2

    ArcCW.LoadAttachmentType(att, "uc_ub_taclight")
end
                                 

                                 
do
    local att = {}

att.PrintName = "AG-40 Underbarrel Grenade Launcher"
att.AbbrevName = "AG-40"
att.Icon = Material("", "mips smooth")
att.Description = [[Romanian sliding-barrel, single-shot grenade launcher. The AG-40P's 40x47mm high-explosive round hits hard on a pronounced arc; the AG-40PN conversion accepts NATO 40x46mm dual-purpose ammunition.

Its short, straight-ahead breech stroke makes it quicker to reload than a swiveling launcher, but the heavy mount and sharp kick tax the host rifle.]]

att.Desc_Pros = {
    "Powerful Romanian HE grenade",
    "Quick sliding-breech reload",
    "P / PN chambering conversion"
}
att.Desc_Cons = {
    "Heavy underbarrel mount",
    "Pronounced grenade drop and recoil"
}

att.SortOrder = -99998
att.AutoStats = true
att.Slot = "uc_ubgl"
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true
att.Model = "models/vergi_arccw/uc_ubgl_ag40.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

att.SelectUBGLSound = ""
att.ExitUBGLSound = ""
att.UBGL = true
att.UBGL_PrintName = "AG-40"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 100
att.UBGL_Recoil = 2.8
att.UBGL_Capacity = 1
att.UBGL_ClipSize = 1

local infiniteAmmo = GetConVar("arccw_uc_infiniteubwammo")
local soundPath = ")^/weapons/uc_ag40/"
local reloadTime = 2.8

                                                                              
                                                                             
local projectileProfiles = {
    arccw_uc_40mm_he = {velocity = 3150, damage = 140},
    arccw_uc_40mm_dp = {velocity = 2900, damage = 105}
}

local function hasInfiniteAmmo()
    return infiniteAmmo and infiniteAmmo:GetBool()
end

local function canPlayAnimation()
    return (game.SinglePlayer() and SERVER) or
        (not game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        return wep:GetInUBGL() and "idle_armed" or "idle"
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then return true end
end

att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)

    if canPlayAnimation() then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/raise.ogg", t = 0.1},
            {s = "arccw_uc/common/grab.ogg", t = 0.4}
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)

    if canPlayAnimation() then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/shoulder.ogg", t = 0.35}
        })
    end
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local class = wep:GetBuff_Override("UBGL_Entity") or "arccw_uc_40mm_he"
    local profile = projectileProfiles[class] or projectileProfiles.arccw_uc_40mm_he
    local projectile = wep:FireRocket(class, profile.velocity)

    if SERVER and IsValid(projectile) then
        projectile.Damage = profile.damage
    end

    if canPlayAnimation() then
        wep:MyEmitSound(soundPath .. "ag40_fire.wav", 105, 100, 1, CHAN_WEAPON)
        wep:MyEmitSound(soundPath .. "ag40_fire_dist.wav", 149, 100, 0.65, CHAN_BODY)
        wep:MyEmitSound(soundPath .. "ag40_mech.wav", 85, 100, 0.7, CHAN_AUTO)
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end

    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNextSecondaryFire(CurTime() + 0.6)
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end

    local owner = wep:GetOwner()
    if not IsValid(owner) then return end
    if not hasInfiniteAmmo() and owner:GetAmmoCount("smg1_grenade") <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + reloadTime)

    if canPlayAnimation() then
        wep:DoLHIKAnimation("reload", reloadTime)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle1.ogg", t = 0},
            {s = soundPath .. "ag40_open.ogg", t = 0.22},
            {s = "arccw_uc/common/magpouch_replace_small.ogg", t = 0.72, v = 0.7},
            {s = soundPath .. "ag40_insert.ogg", t = 1.22},
            {s = soundPath .. "ag40_close.ogg", t = 1.95},
            {s = "arccw_uc/common/shoulder.ogg", t = 2.5}
        })
    end

    if not hasInfiniteAmmo() then
        owner:RemoveAmmo(1, "smg1_grenade")
    end
    wep:SetClip2(1)
end

att.Mult_SightTime = 1.24
att.Mult_SpeedMult = 0.88
att.Mult_SightedSpeedMult = 0.84
att.Mult_Sway = 1.13

att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "AG-40P | Romanian 40x47 HE",
        UBGL_Entity = "arccw_uc_40mm_he"
    },
    {
        PrintName = "AG-40PN | NATO 40x46 HEDP",
        UBGL_Entity = "arccw_uc_40mm_dp"
    }
}

    ArcCW.LoadAttachmentType(att, "uc_ubgl_ag40")
end
                               

                                        
do
    local att = {}

att.PrintName = "URBPG Underslung Rocket Launcher"
att.AbbrevName = "URBPG Rocket Launcher"
att.Icon = Material("entities/att/rpega.png", "mips smooth")
att.Description = "85x40mm selectable underslung rocket-propelled grenade launcher."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
}
att.Slot = {"uc_ubgl"}
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true

att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_fucking_rpg_ux.mdl"

att.SelectUBGLSound =  ""
att.ExitUBGLSound = ""

att.UBGL = true

att.UBGL_PrintName = "UBGL"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Entity = "arccw_uc_40mm_he"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 600
att.UBGL_Recoil = 2

att.UBGL_Capacity = 1
att.UBGL_ClipSize = 1

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local function Ammo(wep)
    return wep:GetOwner():GetAmmoCount("smg1_grenade")
end

local function uglbglmodel(wep, owner)
    local vm = owner:GetViewModel()

    local lhik_model = owner

    for i, k in pairs(wep.Attachments) do
        if k.Installed == "uc_ubgl_fucking_rpg" then
            lhik_model = k
        end
    end
    if !IsValid(lhik_model) then return owner end

    return lhik_model
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    local retu = "idle"

    if key == "idle" then
        if wep:GetInUBGL() then retu = retu .. "_armed"  end
        if wep:Clip2() == 0 then retu = retu .. "_empty" end

        return retu
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then
        return true
    end
end

att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    wep:DoLHIKAnimation((wep:Clip2() == 0) and "to_armed_empty" or "to_armed", 0.7)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
        {s = "arccw_uc/common/raise.ogg", t = 0.2},
    })
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.8)
    wep:DoLHIKAnimation((wep:Clip2() == 0) and "to_idle_empty" or "to_idle", 0.8)
    wep:PlaySoundTable({
        {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
        {s = "arccw_uc/common/shoulder.ogg", t = 0.4},
    })
end

local blast =     "arccw_uc/common/rocket/fire-01.ogg", "arccw_uc/common/rocket/fire-02.ogg", "arccw_uc/common/rocket/fire-03.ogg", "arccw_uc/common/rocket/fire-04.ogg", "arccw_uc/common/rocket/fire-05.ogg", "arccw_uc/common/rocket/fire-06.ogg"
local tail =     "arccw_uc/common/rocket/fire-dist-01.ogg", "arccw_uc/common/rocket/fire-dist-02.ogg", "arccw_uc/common/rocket/fire-dist-03.ogg", "arccw_uc/common/rocket/fire-dist-04.ogg", "arccw_uc/common/rocket/fire-dist-05.ogg", "arccw_uc/common/rocket/fire-dist-06.ogg"
local mech =     "arccw_uc/common/rocket/mech-01.ogg", "arccw_uc/common/rocket/mech-02.ogg", "arccw_uc/common/rocket/mech-03.ogg", "arccw_uc/common/rocket/mech-04.ogg", "arccw_uc/common/rocket/mech-05.ogg", "arccw_uc/common/rocket/mech-06.ogg"

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local owner = wep:GetOwner()
    local class = wep:GetBuff_Override("UBGL_Entity")

    local proj = wep:FireRocket(class, 5000)
    if SERVER then
        proj.Damage = 999
    end

    wep:MyEmitSound(blast, 100, 100, 1, CHAN_WEAPON)
    wep:MyEmitSound(tail, 149, 100, 0.8, CHAN_BODY)
    wep:MyEmitSound(mech, 149, 100, 0.6, CHAN_AUTO)

	if SERVER then
		local d = DamageInfo()
		d:SetDamage(math.random(30, 60))
		d:SetAttacker(owner)
		d:SetDamageType(DMG_BURN)
		owner:TakeDamageInfo(d)
	end

    local vPoint = uglbglmodel(wep, owner):GetPos()
    local effectdata = EffectData()
    effectdata:SetOrigin( vPoint )
    util.Effect( "HelicopterMegaBomb", effectdata )
    wep:DoLHIKAnimation("fire")
    wep:SetClip2(wep:Clip2() - 1)
    wep:DoEffects()
end

local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 4.6)

    wep:DoLHIKAnimation("reload", 4.6)
    wep:PlaySoundTable({
        {s = ratel, t = 0},
        {s = "arccw_uc/common/magpouch_replace_small.ogg", t = 0.9},
        {s = rottle, t = 1.0},
        {s = "arccw_uc/common/rocket/tap.ogg", t = 1.9},
        {s = "arccw_uc/common/rocket/slide1.ogg", t = 2.0},
        {s = rottle, t = 2.1},
        {s = "arccw_uc/common/rocket/slide2.ogg", t = 2.8},
        {s = rottle, t = 2.9},
        {s = "arccw_uc/common/rocket/insert.ogg", t = 3.2},
        {s = rottle, t = 3.3},
        {s = "arccw_uc/common/rocket/cock.ogg", t = 4.0},
        {s = ratel, t = 3.8},
    })

    local reserve = Ammo(wep)
    reserve = reserve + wep:Clip2()
    local clip = 1
    local load = math.Clamp(clip, 0, reserve)
    wep:GetOwner():SetAmmo(reserve - load, "smg1_grenade")
    wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85

    ArcCW.LoadAttachmentType(att, "uc_ubgl_fucking_rpg")
end
                                      

                                       
do
    local att = {}

att.PrintName = "HK79 Underbarrel Grenade Launcher"
att.AbbrevName = "HK79 Grenade Launcher"
att.Icon = Material("entities/att/acwatt_uc_ubgl_hk79.png", "mips smooth")
att.Description = "Single-shot long-barreled underbarrel grenade launcher designed for the G3. The trigger is on the side, and the barrel release is on the bottom. Fires specialized 40x46mm grenade types."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
}
att.Slot = {"uc_ubgl"}
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true

att.ModelOffset = Vector(3.2, 0, -1.5)
att.Model = "models/weapons/arccw/atts/uc_ubgl_hk79_3.mdl"

att.SelectUBGLSound =  ""
att.ExitUBGLSound = ""

att.UBGL = true

att.UBGL_PrintName = "UBGL"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 120
att.UBGL_Recoil = 2
att.UBGL_Capacity = 1

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local pretty = GetConVar("arccw_uc_infiniteubwammo")

att.Hook_ModifyAttBodygroups = function(wep, data)
    if wep:GetBuff_Override("UC_UseClassicHK79Mount") then
        data.element.Model:SetBodygroup(1, 1)
    end
end

local function Ammo(wep)
    return (pretty:GetBool() and 9999 or wep:GetOwner():GetAmmoCount("smg1_grenade"))
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        if wep:GetInUBGL() then
            return "idle_armed"
        else
            return "idle"
        end
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then
        return true
    end
end

att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/grab.ogg", t = 0},
            {s = "arccw_uc/common/raise.ogg", t = 0.2},
            {s = "weapons/misc/hk79_ready.ogg", t = 0.5},
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/shoulder.ogg", t = 0},
            {s = "weapons/misc/hk79_lower.ogg", t = 0.4},
        })
    end
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local owner = wep:GetOwner()
    local class = wep:GetBuff_Override("UBGL_Entity") or "arccw_uc_40mm_hv"

    local vel, dmg = 2500, 130

    if class == "arccw_uc_40mm_hv" then
        vel = vel * 2
        dmg = dmg * 0.85
    elseif class == "arccw_uc_40mm_dp" then
        dmg = dmg * 0.6
    elseif class == "arccw_uc_40mm_airburst" then
        vel = vel * 0.75
    end

    local proj = wep:FireRocket(class, vel)
    if SERVER then
        proj.Damage = dmg
    end
    wep:MyEmitSound(")^/weapons/misc/hk79_fire.wav")
    wep:MyEmitSound(")^/arccw_uc/common/40mm/fire-dist-0" .. math.random(1, 6) .. ".ogg", 149, 100, 0.5, CHAN_BODY)
    wep:MyEmitSound(")^/arccw_uc/common/40mm/mech-0" .. math.random(1, 6) .. ".ogg", 149, 100, 0.5, CHAN_AUTO)

    if game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end
    wep:SetClip2(wep:Clip2() - 1)
    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 3)

    local holy = (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if holy then
        wep:DoLHIKAnimation("reload", 3)
        wep:PlaySoundTable({
            {s = { "arccw_uc/common/rattle1.ogg", "arccw_uc/common/rattle2.ogg", "arccw_uc/common/rattle3.ogg" }, t = 0},
            {s = "weapons/misc/hk79_open.ogg", t = 0.2},
            {s = "arccw_uc/common/magpouch_replace_small.ogg", t = 0.9},
            {s = "weapons/misc/hk79_insert.ogg", t = 1.7},
            {s = "arccw_uc/common/shoulder.ogg", t = 2.0},
            {s = "weapons/misc/hk79_close.ogg", t = 2.2},
            {s = "arccw_uc/common/shoulder.ogg", t = 2.7},
        })
    end

    local reserve = Ammo(wep)
    reserve = reserve + wep:Clip2()
    local clip = 1
    local load = math.Clamp(clip, 0, reserve)
    if (!pretty:GetBool()) then
        wep:GetOwner():RemoveAmmo(1, "smg1_grenade")
    end
    wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85

att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "High Velocity",
        UBGL_Entity = "arccw_uc_40mm_hv"
    },
    {
        PrintName = "Dual Purpose",
        UBGL_Entity = "arccw_uc_40mm_dp"
    },
    {
        PrintName = "Airburst",
        UBGL_Entity = "arccw_uc_40mm_airburst"
    },
}

    ArcCW.LoadAttachmentType(att, "uc_ubgl_hk79_fixed")
end
                                     

                                           
do
    local att = {}

att.PrintName = "Masterkey Underslung Grenade Launcher"
att.AbbrevName = "Masterkey Grenade Launcher"
att.Icon = Material("entities/att/masterkey_40mm.png", "mips smooth")
att.Description = "Underslung pump-action grenade launcher. Think of this as an underbarrel China Lake on a budget. \n\n Cycles a bit slower due to using a much heavier pumping mechanism that can actually bear cycling a 40mm cartridge."

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
}
att.Slot = {"uc_ubgl"}
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true

att.ModelOffset = Vector(1.0, 0, -1.7)
att.Model = "models/weapons/arccw/atts/uc_ubgl_masterkey.mdl"

att.SelectUBGLSound =  ""
att.ExitUBGLSound = ""

att.UBGL = true

att.UBGL_PrintName = "UBPGL"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 105
att.UBGL_Recoil = 1

att.UBGL_Capacity = 4
att.UBGL_ClipSize = 4

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local pretty = GetConVar("arccw_uc_infiniteubwammo")

att.Hook_ModifyAttBodygroups = function(wep, data)
    if wep:GetBuff_Override("UC_UseClassicM203Mount") then
        data.element.Model:SetBodygroup(1, 1)
    end
end

local function Ammo(wep)
    return (pretty:GetBool() and 9999 or wep:GetOwner():GetAmmoCount("smg1_grenade"))
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        if wep:GetNW2Bool("MasterkeyInReload", false) or wep:GetNW2Float("MasterkeyReloadTime", CurTime()) >= CurTime() then
            return "DoNotPlayIdle"
        elseif wep:GetInUBGL() then
            return "idle_armed"
        else
            return "idle"
        end
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then
        return true
    end
end

att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/raise.ogg", t = 0.15},
            {s = "arccw_uc/common/grab.ogg", t = 0.3},
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/shoulder.ogg", t = 0.3},
        })
    end
end

local f1 = {
    ")weapons/misc/r870_40mm_fire.wav",
}
local f2 = {
    ")weapons/misc/r870_40mm_fire_dist.wav",
}
local f3 = {
    ")arccw_uc/common/ub12ga/mech-01.ogg",
    ")arccw_uc/common/ub12ga/mech-02.ogg",
    ")arccw_uc/common/ub12ga/mech-03.ogg",
    ")arccw_uc/common/ub12ga/mech-04.ogg",
    ")arccw_uc/common/ub12ga/mech-05.ogg",
    ")arccw_uc/common/ub12ga/mech-06.ogg",
}

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 or wep:GetNextPrimaryFire() > CurTime() then return end
    if wep:GetNW2Bool("MasterkeyNeedsPump", false) then return end

    local owner = wep:GetOwner()
    local class = wep:GetBuff_Override("UBGL_Entity") or "arccw_uc_40mm_he"
    local dir = (owner:EyeAngles() + wep:GetFreeAimOffset()):Forward()
    local proj = wep:FireRocket(class, 2500)
        if SERVER then
            proj.Damage = 130

        end

    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:MyEmitSound(table.Random(f1), 80, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f2), 149, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f3), 80, 100, 1, CHAN_STATIC )
    end

    if game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end
    wep:SetNextPrimaryFire(CurTime() + 0.4)
    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNW2Bool("MasterkeyNeedsPump", true)
    wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.3)
end

att.Hook_Think = function(wep)
    local p = wep:GetOwner()
    local pred = game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if wep:GetNW2Bool("MasterkeyInReload", false) then
        if wep:GetNW2Float("MasterkeyReloadTime", CurTime()) <= CurTime() then
            if (!p and false or p:KeyDown(IN_ATTACK)) or Ammo(wep) <= 0 or wep:Clip2() == 4 then
                wep:SetReloading(CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.5)
                if pred then
                    wep:DoLHIKAnimation("sgreload_end")
                    wep:PlaySoundTable({
                        {s = ")arccw_uc/common/shoulder.ogg", t = 0.1},
                    })
                end
                wep:SetNW2Bool("MasterkeyInReload", false)
            else
                wep:SetReloading(CurTime() + 0.9)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
                if pred then
                    wep:DoLHIKAnimation("sgreload_insert", 0.9)
                    wep:PlaySoundTable({
                        {s = {")weapons/misc/generic_40mm_load1.ogg", ")weapons/misc/generic_40mm_load2.ogg", ")weapons/misc/generic_40mm_load3.ogg"}, t = 0.05},
                    })
                end
                wep:SetClip2(wep:Clip2() + 1)
                if !pretty:GetBool() then
                    wep:GetOwner():RemoveAmmo(1, "buckshot")
                end
            end
        end
    elseif wep:GetNW2Bool("MasterkeyNeedsPump", false) and wep:GetNW2Float("MasterkeyPumpTime", CurTime()) <= CurTime() and wep:Clip2() > 0 and !wep:GetOwner():KeyDown( IN_ATTACK ) then
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetPriorityAnim(CurTime() + 0.4)
        if pred then
            wep:DoLHIKAnimation("cycle", 1.0)
            wep:PlaySoundTable({
                {s = ")weapons/misc/generic_pump_medium1.ogg", t = 0.02},
                {s = ")weapons/arccw_ud/870/eject.ogg", t = 0.13},
                {s = ")weapons/misc/generic_pump_medium2.ogg", t = 0.17},
            })
        end
    end
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 4 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 1)

    local holy = (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if wep:Clip2() == 0 then
        wep:SetNW2Bool("MasterkeyNeedsPump", true)
    end
        if holy then
            wep:DoLHIKAnimation("sgreload_start", 0.7)
            wep:PlaySoundTable({
                {s = ")arccw_uc/common/raise.ogg", t = 0.15},
                {s = ")arccw_uc/common/grab.ogg", t = 0.3},
            })
        end
        wep:SetReloading(CurTime() + 0.7)
        wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
    wep:SetNW2Bool("MasterkeyInReload", true)

end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85
att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "High Explosive",
        UBGL_Entity = "arccw_uc_40mm_he"
    },
    {
        PrintName = "Smoke",
        UBGL_Entity = "arccw_uc_40mm_smoke"
    }
}

    ArcCW.LoadAttachmentType(att, "uc_ubgl_masterkey_40mm")
end
                                         

                                    
do
    local att = {}

att.PrintName = "USP22 .22 Long Rifle Conversion"
att.AbbrevName = ".22 Long Rifle"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "P93-22 .22 Long Rifle Conversion"
end

att.SortOrder = 9
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "Lighter and weaker ammunition used for plinking. Increases clip size and reload speed but hinders damage and penetration."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_usp_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 Long Rifle"

att.Mult_Recoil = 0.31
att.Mult_Damage = 0.21
att.Mult_DamageMin = 0.15
att.Mult_Penetration = 0.075
att.Mult_Range = 1.12
att.Mult_ReloadTime = 0.76

att.Mult_PhysBulletMuzzleVelocity = 362 / 315

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
att.Mult_ShootSpeedMult = 1.34
att.Mult_RPM = 1.67
att.Mult_ClipSize = 1.14

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysTracerProfile_Priority = -1
att.Override_TracerNum = 1
att.Override_TracerNum_Priority = -1

local path = ")weapons/metrocop_ammo/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {path .. "usp_22lr_fire_sup.wav"}
    else
        return {path .. "usp_22lr_fire.wav"}
    end
end

local tail = ")weapons/metrocop_ammo/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "usp_22lr_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_usp_cal_22lr")
end
                                  

                                            
do
    local att = {}

att.PrintName = "USP9 9x19mm Civil Protection Conversion"
att.AbbrevName = "9x19mm Civil Protection"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "P93-9 9x19mm CP Conversion"
end

att.SortOrder = 9
att.Icon = Material("entities/att/arccw_combine.png", "smooth mips")
att.Description = "This particular brand of 9mm ammunition is infused with the spirit of a Civil Protection officer, augmenting you with additional physical performance in combat, as well as improving the firearm's ergonomics and reliability tremendously. \n\n\"Civil Protection is compromised. Re-establish.\""
att.Desc_Pros = {"You feel oddly more authoritative than usual."
}
att.Desc_Cons = {"This may intimidate even your allies."
}
att.Desc_Neutrals = {
}
att.Slot = "uc_usp_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x19mm Civil Protection"

att.Mult_Damage = 12 / 47
att.Mult_DamageMin = 16 / 9
att.Mult_Penetration = 6 / 9
att.Mult_RangeMin = 18 / 9
att.Mult_RPM = 1.20
att.Mult_ReloadTime = 0.7

att.Mult_Recoil = 0.6
att.Mult_RecoilSide = 1.05

att.Mult_PhysBulletMuzzleVelocity = 362 / 315

att.Mult_JumpDispersion = 0
att.Mult_MoveDispersion = .5
att.Mult_HipDispersion = 0.85
att.Mult_DrawTime = 0.5
att.Mult_SightTime = 0.85
att.Mult_MoveSpeed = 1.25
att.Override_ShootWhileSprint = true
att.Override_CanFireUnderwater = true

att.Add_ClipSize = 5
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Override_PhysTracerProfile = 0
att.Override_PhysTracerProfile_Priority = -1
att.Override_TracerNum = 1
att.Override_TracerNum_Priority = -1

local path = ")weapons/metrocop_ammo/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {path .. "metrocop_fire_suppressed.wav"}
    else
        return {path .. "metrocop_fire.wav"}
    end
end

local tail = ")weapons/metrocop_ammo/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "metrocop_fire_tail.wav"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_usp_cal_metrocop_9mm")
end
                                          

                                       
do
    local att = {}

att.PrintName = "USP22 .11 Whatzit Conversion"
att.AbbrevName = ".11 Whatzit"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "P93-22 .11 Whatzit Conversion"
end

att.SortOrder = 9
att.Icon = Material("entities/att/11mm_whatzit_imp.png", "smooth mips")
att.Description = "The .11 Whatzit is a wildcat cartridge (of sorts). This is mainly a novelty, and it doesn't appear that any gun has actually been made to chamber and fire this \"cartridge\". That is, if it can even be considered a cartridge, depending on personal opinion. It has a primer, because it is a primer, as well as a projectile. But of course, it lacks any powder. However, it should theoretically be possible to chamber and fire this round, since gun barrels appear to be available in as small as .10 caliber. \n\n\"The kind of thing you'd give a veterinarian to euthanize a Guinea pig.\""
att.Desc_Pros = {"Fires 3 pellets"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_usp_caliber"

att.AutoStats = true

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

local path = "weapons/2mm_kolibri_glock/"
local path2 = "weapons/misc/"
local fire22 = {path2 .. "usp_whatzit_fire.wav"}
local fire22sup = {path2 .. "usp_whatzit_fire_sup.wav"}
local fire22dist = {path .. "glockolibri_fire_distant.wav"}
local fire22distint = {path .. "glockolibri_fire_distant_int.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_usp_cal_whatzit")
end
                                     

                                         
do
    local att = {}

att.PrintName = "P93 .32 NAA Conversion"
att.AbbrevName = ".32 NAA"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/380acp.png", "smooth mips")
att.Description = "North American Arms necked a .380 case down to .32 for a pocket pistol, which is an unusual direction to take a cartridge that was already small. The brass is cheap because it is made from something more common.\n\nEvery hit kicks the target's view hard enough to spoil their aim, so this is a way to shut somebody down while a teammate deals with them. On its own it is weak and short ranged."
att.Desc_Pros = {
    "Every hit throws off the target's aim",
    "Very controllable",
}
att.Desc_Cons = {
    "Weak hits",
    "Short ranged",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_usp_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".32 NAA"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 0.85

att.Mult_Damage = 0.7
att.Mult_DamageMin = 0.65
att.Mult_Penetration = 0.7
att.Mult_Range = 0.8
att.Mult_MuzzleVelocity = 1.15
att.Mult_Recoil = 0.6
att.Mult_RPM = 1.2
att.Mult_ClipSize = 1.2
att.Mult_ShootPitch = 1.2

local KICK = 6

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if !IsValid(ent) then return hit end

    if ent:IsPlayer() then
        ent:ViewPunch(Angle(math.Rand(-KICK, -KICK * 0.35), math.Rand(-KICK, KICK), 0))
    elseif ent:IsNPC() then
        ent:SetSchedule(SCHED_FLINCH_PHYSICS)
    end

    return hit
end
att.Mult_ShootVol = 0.8

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

    ArcCW.LoadAttachmentType(att, "uc_usp_caliber_32naa")
end
                                       

                                            
do
    local att = {}

att.PrintName = "P93 7.5 FK BRNO Conversion"
att.AbbrevName = "7.5 FK BRNO"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/357sig.png", "smooth mips")
att.Description = "A Czech pistol cartridge that leaves the muzzle at nearly six hundred metres a second and shoots flat to a hundred, which is not a thing pistol rounds do. The gun built for it weighs a kilo and a half empty, for reasons that become clear on firing.\n\nOne hit in four knocks the weapon clean out of the target's hands. It also shoots very flat and defeats armour well, which makes it a good answer to somebody better armed than you are."
att.Desc_Pros = {
    "One hit in four disarms the target",
    "Flat shooting with strong penetration",
}
att.Desc_Cons = {
    "Sharp recoil",
    "Slightly reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_usp_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "7.5 FK BRNO"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.35
att.Mult_Penetration = 2.0
att.Mult_Range = 1.5
att.Mult_RangeMin = 1.45
att.Mult_MuzzleVelocity = 1.5
att.Mult_Recoil = 1.3
att.Mult_RPM = 0.92
att.Mult_ClipSize = 0.85
att.Mult_AccuracyMOA = 0.8
att.Mult_ShootVol = 1.15

local DISARM = 0.25

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
att.Mult_ShootPitch = 1.15

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

    ArcCW.LoadAttachmentType(att, "uc_usp_caliber_75fkbrno")
end
                                          

                                     
do
    local att = {}

att.PrintName = "5\" K&M23 LAM Slide"
att.AbbrevName = "5\" MK23 LAM Slide"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "5\" MK23 LAM Slide"
end

att.Icon = Material("", "smooth mips")
att.Description = "The legendary big laser sighting module. Improves aiming but adds weight to the pistol."
att.Desc_Cons = {

}
att.AutoStats = true
att.SortOrder = 7

att.Slot = "uc_usp_slide"

att.Mult_Recoil = 0.85

att.Model = "models/weapons/arccw/atts/ud_flashlight_1.mdl"
att.ModelOffset = Vector(0,0,0)
att.OffsetAng = Angle(0,0,180)
att.ModelScale = Vector(0.01,0.01,0.01)
att.Laser = false
att.LaserStrength = 2 / 5
att.LaserBone = "light"

att.ColorOptionsTable = {Color(255, 0, 0, 150)}

att.ToggleStats = {
    {
        PrintName = "On",
        Laser = true,
        Mult_HipDispersion = 0.8,
        Mult_MoveDispersion = 0.8,
    },
    {
        PrintName = "Off",
        Laser = false,
    }
}

att.Mult_SightTime = 1.20
att.Mult_Range = 1.10
att.Mult_PrecisionMOA = 0.70
att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25
att.Mult_ShootSpeedMult = 0.80
att.Mult_HipDispersion = 0.80
att.Mult_SpeedMult = 0.90
att.Mult_Sway = 1.08
att.Mult_RecoilSide = 1.15

att.ActivateElements = {"lam"}

    ArcCW.LoadAttachmentType(att, "uc_usp_slide_lam")
end
                                   

                                          
do
    local att = {}

att.PrintName = "7\" P93 Threaded Slide"
att.AbbrevName = "7\" Threaded Slide"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "7\" USP Threaded Slide"
end

att.Icon = Material("entities/att/acwatt_uc_usp_slide_default.png", "smooth mips")
att.Description = "Slightly longer barrel that maintains precision without adding any excessive weight onto the firearm."
att.Desc_Cons = {

}
att.AutoStats = true
att.SortOrder = 7

att.Slot = "uc_usp_slide"

att.Mult_Recoil = .9

att.Mult_SightTime = 1.05
att.Add_BarrelLength = 4

att.ActivateElements = {"uc_usp_slide_threaded"}

    ArcCW.LoadAttachmentType(att, "uc_usp_slide_threaded")
end
                                        

                                       
do
    local att = {}

att.PrintName = "Free Man"
att.Icon = Material("entities/att/acwatt_uc_usp_tp_hl.png", "smooth mips")
att.Description = "You are the right man in the wrong place."
att.Desc_Pros = {
    "+6% Coolness"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 999

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(1, 5, .75)
att.Override_ActiveAng = Angle(-2, -2, 0)

    ArcCW.LoadAttachmentType(att, "uc_usp_tp_hl_fixed")
end
                                     

                                         
do
    local att = {}

att.PrintName = "Express-12 16\" ACCWS Double Barrel"
att.AbbrevName = "16\" Double Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 MCS 16\" Double Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Heavily modified receiver that supports having two barrels. Fires two rounds at once. The second barrel also acts as a feeding tube through magic."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.nofs",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_barrel"

att.AutoStats = true

att.Mult_AccuracyMOA = 2.45
att.Mult_Recoil = 1.85

att.Mult_Sway = 0.85
att.Mult_SightTime = 1.20
att.Mult_SpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.90

att.Mult_HipDispersion = 1.45

att.Override_Firemodes = {
    {
        Mode = 1,
        Mult_Num = ArcCW.UC.StdDmg["12g_s"].num * 1.02,
        Override_AmmoPerShot = 2,
        Mult_Damage = ArcCW.UC.StdDmg["12g_s"].max * 1.02,
        Mult_DamageMin = ArcCW.UC.StdDmg["12g_s"].min * 1.02,
        Mult_VisualRecoilMult = 2,
        Mult_HipDispersion = 2.0,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"ud_870_barrel_double"}

    ArcCW.LoadAttachmentType(att, "ud_870_barrel_double")
end
                                       

                                            
do
    local att = {}

att.PrintName = "Express-12 40\" Long Barrel"
att.AbbrevName = "40\" Long Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 40\" Wingmaster Barrel"
    att.AbbrevName = "40\" Wingmaster Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Extremely long barrel. Pellet spread is almost nonexistent, and range is also maximized."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_barrel"

att.AutoStats = true

att.Mult_AccuracyMOA = 0.3
att.Mult_Recoil = 0.675
att.Mult_Range = 1.375

att.Mult_Sway = 1.65
att.Mult_SightTime = 1.365
att.Mult_SpeedMult = 0.875

att.Mult_HipDispersion = 1.25

att.Add_BarrelLength = 14

att.ActivateElements = {"ud_870_barrel_extralong"}

    ArcCW.LoadAttachmentType(att, "ud_870_barrel_extralong")
end
                                          

                                         
do
    local att = {}

att.PrintName = "Express-12 10\" ACCWS Fluted Barrel"
att.AbbrevName = "10\" Fluted Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 MCS 10\" Fluted Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "There's no need to add a compensator on a shotgun, when the barrel itself can be the compensator."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.nofs",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_barrel"

att.AutoStats = true
att.SortOrder = -1

att.Mult_AccuracyMOA = 1.65
att.Mult_Recoil = 0.90
att.Mult_Range = 0.8

att.Mult_Sway = 0.5
att.Mult_SightTime = 0.75
att.Mult_SpeedMult = 1.05

att.Mult_HipDispersion = 0.75

att.Add_BarrelLength = -4

att.A_Hook_Add_SightsDispersion = function(wep, data)
    if data and !wep.Attachments[1].Installed then
        data.add = data.add + 75
    end
end

att.ActivateElements = {"ud_870_barrel_fluted"}

    ArcCW.LoadAttachmentType(att, "ud_870_barrel_fluted")
end
                                       

                                         
do
    local att = {}

att.PrintName = "Express-12 .577 Snider Conversion"
att.AbbrevName = ".577 Snider"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "The British Army's first metallic cartridge, a fat lead slug ambling along at about the speed of a thrown brick. It was obsolete within fifteen years and stayed in colonial service for another forty.\n\nA slow, heavy bullet that cripples movement. Anyone you hit is slowed to 45 percent speed for three seconds, which stacks up badly for them if you keep landing shots. Range is poor and it drops fast."
att.Desc_Pros = {
    "Cripples the target's movement",
    "Heavy hit",
}
att.Desc_Cons = {
    "Very slow and short ranged",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".577 Snider"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"ud_870_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.4
att.Mult_DamageMin = 1.1
att.Mult_Range = 0.5
att.Mult_RangeMin = 0.55
att.Mult_MuzzleVelocity = 0.5
att.Mult_Recoil = 1.3
att.Mult_RPM = 0.75
att.Mult_ShootPitch = 0.7

local SLOW = 0.45
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
att.Mult_ShootVol = 1.3

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

    ArcCW.LoadAttachmentType(att, "ud_870_cal_577snider")
end
                                       

                                     
do
    local att = {}

att.PrintName = "Express-12 8 Bore Punt Gun Conversion"
att.AbbrevName = "8 Bore Punt"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "Punt guns were mounted on boats and fired into flocks of sitting waterfowl, killing fifty birds at a time until most countries decided that was not sport and banned them. This is a shoulder fired version, which is a worse idea by every measure.\n\nA wall of shot that shoves whatever survives it backwards. Damage is up by half, but you get very few rounds and the recoil is severe."
att.Desc_Pros = {
    "Throws targets backwards",
    "Very heavy pattern",
}
att.Desc_Cons = {
    "Severe recoil",
    "Few rounds",
    "Slow to reload",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "8 Bore"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1.35

att.Mult_Damage = 1.5
att.Mult_DamageMin = 1.4
att.Mult_Range = 0.8
att.Mult_Recoil = 2.2
att.Mult_RecoilSide = 1.8
att.Mult_VisualRecoilMult = 2.0
att.Mult_RPM = 0.55
att.Mult_ClipSize = 0.45
att.Mult_ReloadTime = 1.35
att.Mult_ShootVol = 1.6
att.Mult_ShootPitch = 0.6

local SHOVE = 560

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

    ArcCW.LoadAttachmentType(att, "ud_870_cal_8bore")
end
                                   

                                    
do
    local att = {}

att.PrintName = "Express-12 Flashlight Forend"
att.AbbrevName = "Flashlight Forend"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 Flashlight Forend"
end

att.Icon = Material("", "smooth mips")
att.Description = "A hardened polymer forend with a built-in flashlight, improving sighted mobility slightly and allowing you to see in the dark."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_slide"

att.AutoStats = true

att.Mult_SightTime = 0.95
att.Mult_SightedSpeedMult = 1.05
att.Mult_RecoilSide = 1.15

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

att.ActivateElements = {"ud_870_slide_flash"}

    ArcCW.LoadAttachmentType(att, "ud_870_hg_flash")
end
                                  

                                        
do
    local att = {}

att.PrintName = "Express-12 Hollow Stock"
att.AbbrevName = "Hollow Stock"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 Hollow Stock"
end

att.Icon = Material("", "smooth mips")
att.Description = "This wooden stock has been hollowed out in an attempt to \"optimize\" it, probably not very effective."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_stock"

att.AutoStats = true

att.Mult_SightedSpeedMult = 1.125
att.Mult_SightTime = 0.95
att.Mult_Recoil = 1.075

att.ActivateElements = {"ud_870_stock_hollow"}

    ArcCW.LoadAttachmentType(att, "ud_870_stock_hollow")
end
                                      

                                             
do
    local att = {}

att.PrintName = "Express-12 Sawn-Off Grip (Alt)"
att.AbbrevName = "Sawn-Off Grip (Alt)"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName =  "Remington 870 Sawn-Off Grip (Alt)"
    att.AbbrevName = "Sawn-Off Grip (Alt)"
end

att.Icon = Material("entities/att/acwatt_ud_870_stock_raptor.png", "smooth mips")
att.Description = "Stockless wood grip for when you simply don't care about accuracy or control."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ud_870_stock"

att.AutoStats = true

att.Mult_SpeedMult = 1.05
att.Mult_SightTime = 0.6
att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.6
att.Mult_HolsterTime = 0.6

att.Mult_Recoil = 1.75
att.Mult_RecoilSide = 2
att.Mult_VisualRecoilMult = 0.5

att.Add_BarrelLength = -4
att.Mult_Sway = 3

att.ActivateElements = {"ud_870_stock_sawnoff_alt"}

att.Override_ActivePos = Vector(0, 2.5, -0.5)
att.Override_HoldtypeActive = "shotgun"
att.Override_HoldtypeSights = "ar2"

    ArcCW.LoadAttachmentType(att, "ud_870_stock_sawnoff_alt")
end
                                           

                                             
do
    local att = {}

att.PrintName = "Express-12 Folded Stock"
att.AbbrevName = "Folded Stock"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName =  "Remington 870 Folded Stock"
    att.AbbrevName = "Folded Stock"
end

att.Icon = Material("entities/att/ur_spas/stock_fold.png", "smooth mips")
att.Description = "Folding metal stock that offers more flexibility in combat situations. Drastically weighs down the gun due to being made out of heavy materials."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_stock"

att.AutoStats = true

att.Mult_SpeedMult = 0.95
att.Mult_SightTime = 0.95
att.Mult_SightedSpeedMult = 1.4
att.Mult_ShootSpeedMult = 1.2

att.Mult_DrawTime = 0.7
att.Mult_HolsterTime = 0.7

att.Mult_Recoil = 0.90
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.12

att.Add_BarrelLength = -4
att.Mult_Sway = 3

att.ActivateElements = {"stock_folded"}

att.Override_ActivePos = Vector(0, 2.5, -0.5)
att.Override_HoldtypeActive = "shotgun"
att.Override_HoldtypeSights = "ar2"

    ArcCW.LoadAttachmentType(att, "ud_870_stock_spas_folded")
end
                                           

                                               
do
    local att = {}

att.PrintName = "Express-12 Unfolded Stock"
att.AbbrevName = "Unfolded Stock"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName =  "Remington 870 Unfolded Stock"
    att.AbbrevName = "Unfolded Stock"
end

att.Icon = Material("entities/att/ur_spas/stock_std.png", "smooth mips")
att.Description = "Folding metal stock that offers more flexibility in combat situations. Drastically weighs down the gun due to being made out of heavy materials."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_870_stock"

att.AutoStats = true

att.Mult_SpeedMult = 0.92
att.Mult_SightTime = 0.8
att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.8
att.Mult_HolsterTime = 0.8

att.Mult_Recoil = 0.70
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.15

att.Mult_Sway = 3

att.ActivateElements = {"stock_unfolded"}

att.Override_ActivePos = Vector(0, 2.5, -0.5)
att.Override_HoldtypeActive = "shotgun"
att.Override_HoldtypeSights = "ar2"

    ArcCW.LoadAttachmentType(att, "ud_870_stock_spas_unfolded")
end
                                             

                                   
do
    local att = {}

att.PrintName = "Express-12 12 Shell Tube"
att.AbbrevName = "12 Shell Tube"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 12 Shell Tube"
end

att.Icon = Material("", "smooth mips")
att.Description = "A larger extension of the default shell tube holds more rounds, but increases weapon weight even more."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_870_tube"

att.AutoStats = true

att.Override_ClipSize = 12
att.Mult_Sway = 1.5
att.Mult_SightedSpeedMult = 0.75
att.Mult_SightTime = 1.20
att.Mult_ReloadTime = 1.1

att.ActivateElements = {"ud_870_tube_12"}

    ArcCW.LoadAttachmentType(att, "ud_870_tube_12")
end
                                 

                                   
do
    local att = {}

att.PrintName = "Express-12 18 Shell Tube"
att.AbbrevName = "18 Shell Tube"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 12 Shell Tube"
end

att.Icon = Material("", "smooth mips")
att.Description = "A larger extension of the default shell tube holds more rounds, but increases weapon weight even more."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_870_tube"

att.AutoStats = true

att.Override_ClipSize = 18
att.Mult_Sway = 1.5
att.Mult_SightedSpeedMult = 0.70
att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.1

att.ActivateElements = {"ud_870_tube_18"}

    ArcCW.LoadAttachmentType(att, "ud_870_tube_18")
end
                                 

                                   
do
    local att = {}

att.PrintName = "Express-12 25 Shell Drum"
att.AbbrevName = "25 Shell Drum"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Remington 870 25 Shell Drum"
end

att.Icon = Material("", "smooth mips")
att.Description = "A modified feeding tube fitted with a massive non-detachable high-capacity drum magazine. The heavy weight puts a lot of strain on the weapon."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_870_tube"

att.AutoStats = true

att.Override_ClipSize = 25
att.Mult_Sway = 1.2
att.Mult_SightedSpeedMult = 0.575
att.Mult_SightTime = 1.375
att.Mult_ReloadTime = 1.1

att.ActivateElements = {"ud_870_tube_25"}

    ArcCW.LoadAttachmentType(att, "ud_870_tube_25")
end
                                 

                                               
do
    local att = {}

att.PrintName = "Glock .22 CHeetah Conversion"
att.AbbrevName = ".22 CHeetah"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 .22 CHeetah Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/17incinerator.png", "smooth mips")
att.Description = "The .22 CHeetah (with an uppercase C and H) is a wildcat cartridge developed in the 1970s or 1980s by Jim Carmichel and Fred Huntington. It's essentially a modified Remington .308 BR case, resized to fit .22 caliber bullets. The cartridge is known for its high velocity and long-range accuracy, with a muzzle speed of around 4,300 feet per second and a bullet weight of 50 grains. It's popular among varmint hunters due to its performance, but it's also notoriously hard on barrels, requiring frequent cleaning."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 CHeetah"
att.Override_Ammo = "Pistol"

att.Mult_Damage = 1.465
att.Mult_DamageMin = 1.50
att.Mult_Penetration = 1.15

att.Mult_Range = 1.30

att.Mult_Recoil = 1.335
att.Mult_VisualRecoilMult = 1.35
att.Mult_RPM = 0.820
att.Mult_ShootSpeedMult = 0.95
att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.35
    end
end

att.Mult_ClipSize = 0.80

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1.45
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/misc/"
local fire22 = {path .. "glock_cheetah_fire.wav"}
local fire22sup = {path .. "glock_cheetah_fire_sup.wav"}
local fire22dist = {path .. "uzi_50ae_tail.wav"}
local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_22cheetah")
end
                                             

                                            
do
    local att = {}

att.PrintName = "Glock .256 Winchester Magnum Conversion"
att.AbbrevName = ".256 Winchester Magnum"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "A .357 case necked down to a quarter inch, introduced in 1960 for a pistol that Winchester then declined to build. It survives as a curiosity and as a reminder that a cartridge without a gun is just an expensive noise.\n\nShatters on hard surfaces and sprays fragments for 40 percent damage at anyone within about two metres of the impact. Shoot the wall or floor beside somebody in cover instead of trying to hit them. On a direct hit it is just a flat, fast bullet and nothing more."
att.Desc_Pros = {
    "Fragments off walls to reach people in cover",
    "Flat and fast",
}
att.Desc_Cons = {
    "Modest damage on a direct hit",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".256 Winchester Magnum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.95
att.Mult_DamageMin = 1.0
att.Mult_Penetration = 1.4
att.Mult_Range = 1.4
att.Mult_RangeMin = 1.3
att.Mult_MuzzleVelocity = 1.45
att.Mult_Recoil = 0.9
att.Mult_RPM = 1.05
att.Mult_ClipSize = 0.85
att.Mult_AccuracyMOA = 0.75
att.Mult_ShootPitch = 1.18

local SPALL_R    = 130
local SPALL_FRAC = 0.4

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    if IsValid(ent) and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local owner = IsValid(wep) and wep:GetOwner() or NULL

    for _, e in ipairs(ents.FindInSphere(hit.tr.HitPos, SPALL_R)) do
        if e == owner then continue end
        if !(e:IsPlayer() or e:IsNPC() or e:IsNextBot()) then continue end
        if e:Health() <= 0 then continue end

        local d = DamageInfo()
        d:SetDamage(hit.damage * SPALL_FRAC)
        d:SetDamageType(DMG_BULLET)
        d:SetAttacker(IsValid(owner) and owner or wep)
        d:SetInflictor(IsValid(wep) and wep or e)
        e:TakeDamageInfo(d)
    end

    local eff = EffectData()
    eff:SetOrigin(hit.tr.HitPos)
    eff:SetNormal(hit.tr.HitNormal)
    eff:SetMagnitude(2)
    eff:SetScale(0.5)
    eff:SetRadius(4)
    util.Effect("Sparks", eff)

    return hit
end
att.Mult_ShootVol = 1.05

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_256win")
end
                                          

                                                 
do
    local att = {}

att.PrintName = "Glock 2.7×9mm Kolibri Conversion"
att.AbbrevName = "2.7×9mm Kolibri"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 2.7×9mm Kolibri Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/2mm_kolibri_icon.png", "smooth mips")
att.Description = "Conversion of the Glock to the smallest commercially available centerfire cartridge, patented in 1910 and introduced in 1914 by an Austrian watchmaker. Due to it being smaller than .22LR, you can cram even more of these suckers into a mag.\n\nThe 2mm Kolibri was advertised as a ladies' self-defence round. While probably not effective against a mugger if shot at the chest or limbs, it could potentially inflict some damage if shot at the attacker's face.\n\n\"Ever been stung by a bee? How about a wasp? Or a hornet?\""
att.Desc_Pros = {"Extra headshot damage"
}
att.Desc_Cons = {"Where'd you even find this ammo?!"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "2.7×9mm Kolibri"
att.Override_Ammo = "Pistol"

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.20
att.Mult_Penetration = 0

att.Mult_Recoil = 0.10
att.Mult_VisualRecoilMult = 0.10
att.Mult_RPM = 1.7
att.Mult_Penetration = 0
att.Mult_ShootSpeedMult = 1.25
att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.35
    end
end

att.Override_PhysTracerProfile = "uc_plinking"
att.Mult_PhysBulletMuzzleVelocity = 325 / 345

att.Mult_ClipSize = 1.35

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_glock/"
local fire22 = {path .. "glockolibri_fire.wav"}
local fire22sup = {path .. "glockolibri_fire_suppressed.wav"}
local fire22dist = {path .. "glockolibri_fire_distant.wav"}
local fire22distint = {path .. "glockolibri_fire_distant_int.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_2mm_kolibri")
end
                                               

                                             
do
    local att = {}

att.PrintName = "Glock 7.65x21mm Parabellum Conversion"
att.AbbrevName = "7.65mm Parabellum"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "The original Luger cartridge, before somebody opened the neck up to nine millimetres and made it famous. It is still standard issue in a few countries that never saw a reason to change.\n\nBounces off hard surfaces at an angle for half damage, so shots into hard cover keep working. Light recoil and quick, with hits a bit under a normal round."
att.Desc_Pros = {
    "Ricochets off hard surfaces",
    "Light recoil, fast firing",
}
att.Desc_Cons = {
    "Slightly weak per hit",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "7.65x21mm Parabellum"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.88
att.Mult_Penetration = 1.3
att.Mult_Range = 1.15
att.Mult_MuzzleVelocity = 1.2
att.Mult_Recoil = 0.75
att.Mult_RPM = 1.15
att.Mult_ClipSize = 1.1
att.Mult_AccuracyMOA = 0.85
att.Mult_ShootPitch = 1.12

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    if UC_Extras and UC_Extras.Ricochet then
        UC_Extras.Ricochet(wep, hit, 0.5)
    end

    return hit
end
att.Mult_ShootVol = 0.95

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_30luger")
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
att.Slot = "ud_glock_caliber"

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
att.Mult_ShootPitch = 1.15
att.Mult_ShootVol = 0.85

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_46x30")
end
                                         

                                          
do
    local att = {}

att.PrintName = "Glock .50 Action Express Conversion"
att.AbbrevName = ".50 Action Express"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 .50 Action Express Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Conversion of the Glock to a large-caliber handgun cartridge well-known for being one of the most powerful pistol cartridges. Prone to jamming a bunch."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = ".50 Action Express"
att.Override_Ammo = "357"

att.Mult_Damage = 2.05
att.Mult_DamageMin = 1.75
att.Mult_Penetration = 2

att.Mult_Recoil = 1.85
att.Mult_VisualRecoilMult = 1.65
att.Mult_Range = 1.75
att.Mult_RPM = 0.70
att.Mult_ShootSpeedMult = 0.85
att.Mult_MalfunctionMean = 0.40
att.Mult_Precision = 1.50
att.Mult_ReloadTime = 1.05
att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.75
    end
end

att.Mult_ClipSize = 0.65

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1.45
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/misc/"
local fire22 = {path .. "glock_50ae_fire.wav"}
local fire22sup = {path .. "glock_50ae_fire_sup.wav"}
local fire22dist = {path .. "uzi_50ae_tail.wav"}
local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_50ae")
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
att.Slot = "ud_glock_caliber"

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
att.Mult_ShootPitch = 1.12
att.Mult_ShootVol = 0.9

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_57x28")
end
                                         

                                                 
do
    local att = {}

att.PrintName = "Glock 6mm Flobert Conversion"
att.AbbrevName = "6mm Flobert"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 6mm Flobert Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/6mm_flobert.png", "smooth mips")
att.Description = "Cartridges that have the same caliber as a .22 but much shorter length, due to using a percussion cap with less propellant instead of a typical casing. "
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

att.Override_Trivia_Calibre = "6mm Flobert"
att.Override_Ammo = "Pistol"

att.Mult_Damage = 0.84
att.Mult_DamageMin = 0.97
att.Mult_Penetration = 0.00011

att.Mult_Recoil = 0.24
att.Mult_VisualRecoilMult = 0.24
att.Mult_RPM = 1.5
att.Mult_ShootSpeedMult = 1.25
att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.35
    end
end

att.Override_PhysTracerProfile = "uc_plinking"
att.Mult_PhysBulletMuzzleVelocity = 325 / 345

att.Mult_ClipSize = 1.28

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_glock/"
local fire22 = {path .. "glockbert_fire.wav"}
local fire22sup = {path .. "glockbert_fire_sup.wav"}
local fire22dist = {path .. "glockbert_fire.wav"}
local fire22distint = {path .. "glockbert_fire.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_6mm_flobert")
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
att.Slot = "ud_glock_caliber"

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_9x21")
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
att.Slot = "ud_glock_caliber"

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_9x23")
end
                                        

                                        
do
    local att = {}

att.PrintName = "Glock Plastic BB Conversion"
att.AbbrevName = "Plastic BB"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 Plastic BB Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/bb_gun.png", "smooth mips")
att.Description = "Reduces your beloved weapon to a puny little toy, why you'd do this is beyond me, but remember: NO FULL AUTO IN BUILDINGS!!!!!"
att.Desc_Pros = {
}
att.Desc_Cons = {"NO FULL AUTO IN BUILDINGS!!!"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

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

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_bb")
end
                                      

                                             
do
    local att = {}

att.PrintName = "Glock .11 Whatzit Conversion"
att.AbbrevName = ".11 Whatzit"

if not GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 .11 Whatzit Conversion"
end

att.SortOrder = 00
att.Icon = Material("entities/att/11mm_whatzit_imp.png", "smooth mips")
att.Description = "The .11 Whatzit is a wildcat cartridge (of sorts). This is mainly a novelty, and it doesn't appear that any gun has actually been made to chamber and fire this \"cartridge\". That is, if it can even be considered a cartridge, depending on personal opinion. It has a primer, because it is a primer, as well as a projectile. But of course, it lacks any powder. However, it should theoretically be possible to chamber and fire this round, since gun barrels appear to be available in as small as .10 caliber. \n\n\"The kind of thing you'd give a veterinarian to euthanize a Guinea pig.\""
att.Desc_Pros = {"Fires 3 pellets"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_caliber"

att.AutoStats = true

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

local path = "weapons/2mm_kolibri_glock/"
local fire22 = {path .. "whatzit_fire.wav"}
local fire22sup = {path .. "whatzit_fire_sup.wav"}
local fire22dist = {path .. "glockolibri_fire_distant.wav"}
local fire22distint = {path .. "glockolibri_fire_distant_int.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_caliber_whatzit")
end
                                           

                                                
do
    local att = {}

att.PrintName = "ATF Glock 19M Frame"
att.AbbrevName = "ATF Glock 19M"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "ATF Glock 19M Frame"
end

att.Icon = Material("entities/att/atf.png", "smooth mips")
att.Description = "Modified  Glock-19 frame that is used by the ATF and the FBI. It has several improvements over the original model."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_frame"

att.AutoStats = true

att.Mult_ReloadTime = 0.87
att.Mult_SightTime = 0.96
att.Mult_SightedSpeedMult = 1.05
att.Mult_DrawTime = 0.95
att.Mult_HolsterTime = 0.95
att.Add_BarrelLength = -4
att.Mult_MalfunctionMean = 1.15
att.Mult_RPM = 1.15

    ArcCW.LoadAttachmentType(att, "ud_glock_frame_atf_glock19m")
end
                                              

                                          
do
    local att = {}

att.PrintName = "Tokyo Marui Glock 17 Gen.4 Frame"
att.AbbrevName = "Tokyo Marui Glock 17"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Tokyo Marui Glock 17 Gen.4 Frame"
end

att.Icon = Material("entities/att/glock_bb_frame.png", "smooth mips")
att.Description = "Plastic frame disassembled from an airsoft Glock 17 Gen.4 replica manufactured by Tokyo Marui and assembled onto the other parts of your Glock. \n\n Due to the frame being made of such lightweight yet brittle materials, the weapon will be much easier to handle but the recoil will be more snappy and it will be much more prone to jamming."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_frame"

att.AutoStats = true

att.Mult_ReloadTime = 0.82
att.Mult_SightTime = 0.81
att.Mult_SightedSpeedMult = 1.15
att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75
att.Mult_MalfunctionMean = 0.52
att.Mult_RPM = 1.20
att.Mult_Recoil = 1.35
att.Mult_VisualRecoilMult = 1.27
att.Mult_MoveSpeed = 1.12
att.Mult_Range = 0.85
att.Mult_ShootPitch = 1.01

    ArcCW.LoadAttachmentType(att, "ud_glock_frame_bb_g17")
end
                                        

                                        
do
    local att = {}

att.PrintName = "Roni Carbine Conversion"
att.AbbrevName = "Carbine Frame"

att.Icon = Material("entities/att/arccw_uc_roni.png", "smooth mips")
att.Description = "Aftermarket conversion kit that converts the pistol into a full-blown carbine. Overall performance of the firearm is improved but extra weight is added."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_frame"

att.AutoStats = true

att.Mult_ReloadTime = 1.10
att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.80
att.Mult_DrawTime = 0.80
att.Mult_HolsterTime = 0.80
att.Add_BarrelLength = 1.15
att.Mult_MalfunctionMean = 1.40
att.Mult_RPM = 1.45
att.Mult_Recoil = 0.85
att.Mult_AccuracyMOA = 0.90
att.Mult_Range = 1.15

att.Mult_HipDispersion = 0.8

att.Mult_PhysBulletMuzzleVelocity = 1.15

att.ActivateElements = {"ud_glock_frame_roni"}

    ArcCW.LoadAttachmentType(att, "ud_glock_frame_roni")
end
                                      

                                    
do
    local att = {}

att.PrintName = "Glock 50-Round Drum Mag"
att.AbbrevName = "50-Round Drum Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "GEN3 50-Round Drum Mag"
end

att.SortOrder = 33
att.Icon = Material("entities/att/ur_mp5/mag50.png", "smooth mips")
att.Description = "A large drum mag with a decent capacity. Not as generous as a C-Mag but it is more reliable."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_glock_mag"

att.AutoStats = true

att.Mult_SightTime = 1.15
att.Mult_ReloadTime = 1.20
att.Override_ClipSize = 50

att.Mult_HipDispersion = 1.25
att.Mult_Sway = 1.5
att.Mult_ShootSpeedMult = 0.95

att.Mult_HipDispersion = 1.25

att.ActivateElements = {"ud_glock_mag_50"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_33"
end

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "fix") then
        return anim .. "_33"
    end
end

    ArcCW.LoadAttachmentType(att, "ud_glock_mag_50")
end
                                  

                                                  
do
    local att = {}

att.PrintName = "KKM Precision Compensator"
att.AbbrevName = "KKM Compensator UNIVERSAL"
att.Icon = Material("entities/att/kkm.png", "mips smooth")
att.Description = "Weapon-exclusive compensator that redirects propellant gasses to reduce weapon recoil.\nHighly effective, but reduces weapon cyclic rate."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/uc_kkm_brake.mdl"
att.ModelOffset = Vector(0.07, 0, 0.165)
att.ModelScale = Vector(1.25, 1.25, 1.25)
att.OffsetAng = Angle(0, 0, 0)

att.IsMuzzleDevice = true

att.Mult_Recoil = 0.7
att.Mult_RecoilSide = 0.8

att.Add_BarrelLength = 2
att.Mult_SightTime = 1.1
att.Mult_Sway = 1.15
att.Mult_RPM = 0.85
att.Mult_ShootVol = 1.2

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "ud_glock_muzzle_kkm_universal")
end
                                                

                                           
do
    local att = {}

att.PrintName = "GEN3 Airsoft Slide"
att.AbbrevName = "Airsoft Slide"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Glock 17 Airsoft Slide"
end

att.Icon = Material("entities/att/glock_bb_slide.png", "smooth mips")
att.Description = "A plastic slide with an orange tip, transplanted from an airsoft replica. Could be used in tandem with the other airsoft parts, or... you could use it as it is with a regular pistol frame and trick your victims into thinking that you are actually using a toy. \n\n Magically converts the pistol to full-auto and prevents the use of muzzle devices."
att.Desc_Pros = {
    "uc.auto",
}
att.Desc_Cons = {
    "uc.jam"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_glock_slide"

att.AutoStats = true

att.Override_Trivia_Class = "Airsoft Pistol"

att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 1.05
att.Mult_MoveDispersion = 1.5
att.Mult_HipDispersion = 1.25
att.Mult_Recoil = 1.25
att.Mult_RPM = 2.45
att.Mult_ShootSpeedMult = 1.15

att.Override_Malfunction = true

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        PrintName = "fcg.safe2",
        Mode = 0,
    }
}

att.ActivateElements = {"ud_glock_slide_airsoft"}

    ArcCW.LoadAttachmentType(att, "ud_glock_slide_airsoft")
end
                                         

                                         
do
    local att = {}

att.PrintName = "19\" M4 Super 90 Competition Barrel (Alt)"
att.AbbrevName = "19\" Competition Barrel (Alt)"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "19\" FC1040 Competition Barrel (Alt)"
end

att.Icon = Material("entities/att/acwatt_ud_m1014_barrel_sport.png", "smooth mips")
att.Description = "Modified competition barrel that removes the weapon's gas system. As a result performance is increased but forces the user to manually chamber the next round. Due to the nature of the firearm, shells will get stuck when cycling the next round."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_barrel"

att.AutoStats = true
att.Add_BarrelLength = 1

att.Mult_RecoilSide = 0.8
att.Mult_PhysBulletMuzzleVelocity = 2.25

att.Mult_Recoil = 0.70
att.Mult_AccuracyMOA = 0.3
att.Mult_Range = 1.85
att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 0.9

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

att.Override_ShellScale = 0.00001
att.Mult_HipDispersion = 1.15

att.Override_ManualAction = true

att.ActivateElements = {"ud_autoshotgun_barrel_sport"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_barrel_comp")
end
                                       

                                           
do
    local att = {}

att.PrintName = "18.5\" M4 Super 90 Double Barrel"
att.AbbrevName = "18.5\" Double Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "14\" FC1040 Double Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Heavily modified receiver that supports having two barrels. Fires two rounds at once."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_barrel"

att.AutoStats = true

att.Mult_AccuracyMOA = 2.45
att.Mult_Recoil = 1.85

att.Mult_Sway = 0.85
att.Mult_SightTime = 1.20
att.Mult_SpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.90

att.Mult_HipDispersion = 1.45

att.Override_Firemodes = {
    {
        Mode = 1,
        Mult_Num = ArcCW.UC.StdDmg["12g_s"].num * 1.2,
        Override_AmmoPerShot = 2,
        Mult_Damage = ArcCW.UC.StdDmg["12g_s"].max * 1.2,
        Mult_DamageMin = ArcCW.UC.StdDmg["12g_s"].min * 1.2,
        Mult_VisualRecoilMult = 2,
        Mult_HipDispersion = 2.0,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"ud_autoshotgun_barrel_double"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_barrel_double")
end
                                         

                                           
do
    local att = {}

att.PrintName = "18.5\" M4 Super 90 Triple Barrel"
att.AbbrevName = "18.5\" Triple Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "14\" FC1040 Triple Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Heavily modified receiver that supports having three barrels. Fires three rounds at once."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_barrel"

att.AutoStats = true

att.Mult_AccuracyMOA = 3.0
att.Mult_Recoil = 2.85

att.Mult_Sway = 0.85
att.Mult_SightTime = 1.25
att.Mult_SpeedMult = 0.75
att.Mult_ShootSpeedMult = 0.90

att.Mult_HipDispersion = 1.45

att.Override_Firemodes = {
    {
        Mode = 1,
        Mult_Num = ArcCW.UC.StdDmg["12g_s"].num * 1.3,
        Override_AmmoPerShot = 3,
        Mult_Damage = ArcCW.UC.StdDmg["12g_s"].max * 1.3,
        Mult_DamageMin = ArcCW.UC.StdDmg["12g_s"].min * 1.3,
        Mult_VisualRecoilMult = 2.25,
        Mult_HipDispersion = 2.15,
    },
    {
        Mode = 0
    }
}

att.ActivateElements = {"ud_autoshotgun_barrel_triple"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_barrel_triple")
end
                                         

                                     
do
    local att = {}

att.PrintName = "Benelli M4 5.56x45mm Conversion"
att.AbbrevName = "5.56x45mm NATO"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "FC1040 5.56x45mm Conversion"
end

att.SortOrder = 70
att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "The service shotgun rebarrelled to the service rifle round, which is either sensible logistics or an admission that somebody bought the wrong gun. Flat, fast and it holds a great deal more of it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m1014_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Trivia_Class = "Carbine"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ud_m1014_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 1.9
att.Mult_DamageMin = 2.0
att.Mult_Range = 2.2
att.Mult_Penetration = 7
att.Mult_AccuracyMOA = 0.32
att.Mult_HipDispersion = 0.85
att.Mult_Recoil = 0.5
att.Mult_VisualRecoilMult = 0.55
att.Mult_RPM = 1.35
att.Mult_ClipSize = 2.2
att.Mult_ReloadTime = 0.9
att.Mult_ShootPitch = 1.08
att.Mult_ShootVol = 1.0

local fire = {"weapons/misc/uzi_556_fire.wav"}
local firesup = {"weapons/misc/uzi_556_fire_sup.wav"}
local firetail = {"arccw_uc/common/fire-dist-int-rifle-01.ogg", "arccw_uc/common/fire-dist-int-rifle-02.ogg", "arccw_uc/common/fire-dist-int-rifle-03.ogg", "arccw_uc/common/fire-dist-int-rifle-04.ogg", "arccw_uc/common/fire-dist-int-rifle-05.ogg", "arccw_uc/common/fire-dist-int-rifle-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_m1014_cal_556")
end
                                   

                                        
do
    local att = {}

att.PrintName = "FC1040 .620 JDJ Conversion"
att.AbbrevName = ".620 JDJ"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "J.D. Jones necked a 20mm Vulcan case down to .620 and built a rifle around it, producing something that sits between an anti-materiel rifle and an artillery piece. It is the smaller sibling of the .950 and that tells you most of what you need.\n\nOver double damage and it physically throws people backwards. The magazine holds a third of what it did and the recoil is severe, so every shot needs to count."
att.Desc_Pros = {
    "Over double damage",
    "Knocks targets backwards",
}
att.Desc_Cons = {
    "Severe recoil",
    "Tiny magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m1014_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".620 JDJ"

att.Override_IsShotgun = false
att.Override_Num = 1
att.Override_Ammo = "ar2"
att.Override_HullSize = 0
att.GivesFlags = {"ud_m1014_nonshotgun"}
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.35

att.Mult_Damage = 2.2
att.Mult_DamageMin = 2.1
att.Mult_Penetration = 2.4
att.Mult_Range = 1.7
att.Mult_RangeMin = 1.6
att.Mult_Recoil = 2.5
att.Mult_RecoilSide = 2.0
att.Mult_VisualRecoilMult = 2.3
att.Mult_RPM = 0.55
att.Mult_ClipSize = 0.33
att.Mult_ShootVol = 1.6
att.Mult_ShootPitch = 0.6

local SHOVE = 700

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

    ArcCW.LoadAttachmentType(att, "ud_m1014_cal_620jdj")
end
                                      

                                      
do
    local att = {}

att.PrintName = "Benelli M4 9x39mm Conversion"
att.AbbrevName = "9x39mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "FC1040 9x39mm Conversion"
end

att.SortOrder = 71
att.Icon = Material("entities/att/uc_bullets/9x39.png", "smooth mips")
att.Description = "A heavy subsonic bullet meant to be fired through a can and heard by nobody. Semi-automatic and quiet is a combination this gun has never been accused of before."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "Falls out of the air past a couple of streets",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m1014_cal"

att.AutoStats = true

att.Override_Num = 1
att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "9x39mm"
att.Override_Trivia_Class = "Carbine"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1.05
att.Override_ShellSounds = ArcCW.ShellSoundsTable
att.GivesFlags = {"ud_m1014_nonshotgun"}

att.Override_IsShotgun = false
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults

att.Mult_Damage = 2.4
att.Mult_DamageMin = 1.9
att.Mult_Range = 0.95
att.Mult_Penetration = 4
att.Mult_AccuracyMOA = 0.45
att.Mult_HipDispersion = 0.8
att.Mult_Recoil = 0.62
att.Mult_VisualRecoilMult = 0.65
att.Mult_RPM = 1.2
att.Mult_ClipSize = 1.8
att.Mult_ReloadTime = 0.9
att.Mult_ShootPitch = 0.78
att.Mult_ShootVol = 0.65

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

    ArcCW.LoadAttachmentType(att, "ud_m1014_cal_9x39")
end
                                    

                                         
do
    local att = {}

att.PrintName = "FC1040 Tethered Harpoon Slug"
att.AbbrevName = "Harpoon Slug"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/12g.png", "smooth mips")
att.Description = "A barbed slug on a spool of braided line, sold for shooting fish and occasionally used for retrieving things nobody wants to walk out to. The line is rated well past what the barb will hold.\n\nWhatever you hit gets ripped off its feet and thrown at you, hard enough to clear most of the distance in one go. Good for hauling somebody out of cover, off a ledge, or straight into the rest of your team. The slug itself is a single weak projectile with no spread and very little reach."
att.Desc_Pros = {
    "Rips targets off their feet and hauls them in",
    "Single accurate projectile",
}
att.Desc_Cons = {
    "Weak on its own",
    "Very short ranged",
    "Slow to reload",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m1014_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "12 Gauge Harpoon"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g_slug.mdl"
att.Override_ShellScale = 1
att.Override_Num = 1
att.Override_Num_Priority = 2
att.Override_HullSize = 0

att.Mult_Damage = 0.7
att.Mult_DamageMin = 0.6
att.Mult_Range = 0.4
att.Mult_RangeMin = 0.45
att.Mult_MuzzleVelocity = 0.6
att.Mult_AccuracyMOA = 0.4
att.Mult_Recoil = 0.9
att.Mult_RPM = 0.7
att.Mult_ReloadTime = 1.3

local HAUL      = 1750
local LIFT      = 190
local ROPE_TIME = 0.9
local ROPE_MAT  = "cable/rope"

local function MuzzleWorldPos(wep, owner)
    local muzz = wep

    if wep.GetMuzzleDevice then
        local m = wep:GetMuzzleDevice(true)
        if IsValid(m) then muzz = m end
    end

    local idx = wep:GetBuff_Override("Override_MuzzleEffectAttachment", wep.MuzzleEffectAttachment) or 1

    local posang = muzz.GetAttachment and muzz:GetAttachment(idx)
    if posang and posang.Pos then return posang.Pos end

    local named = wep.LookupAttachment and wep:LookupAttachment("muzzle") or 0
    if named > 0 then
        posang = wep:GetAttachment(named)
        if posang and posang.Pos then return posang.Pos end
    end

    if IsValid(owner) and owner.GetShootPos then return owner:GetShootPos() end

    return wep:GetPos()
end

att.Hook_BulletHit = function(wep, hit)
    if !SERVER then return hit end

    local ent = hit.tr.Entity
    local owner = IsValid(wep) and wep:GetOwner() or NULL
    if !IsValid(ent) or !IsValid(owner) then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local dir = owner:WorldSpaceCenter() - ent:WorldSpaceCenter()
    dir:Normalize()

    if ent:IsPlayer() and ent.SetGroundEntity then
        ent:SetGroundEntity(NULL)
    end

    ent:SetVelocity(dir * HAUL + Vector(0, 0, LIFT))

    local mpos = MuzzleWorldPos(wep, owner)
    local lpos = wep:WorldToLocal(mpos)

    local rope = constraint.CreateKeyframeRope(mpos, 1.6, ROPE_MAT, nil,
        wep, lpos, 0,
        ent, Vector(0, 0, 0), 0, {})

    if IsValid(rope) then
        SafeRemoveEntityDelayed(rope, ROPE_TIME)
    end

    return hit
end
att.Mult_ShootPitch = 0.85
att.Mult_ShootVol = 0.9

local fire = {"weapons/arccw_ud/m1014/fire.ogg"}
local firesup = {"weapons/arccw_ud/m1014/fire_supp.ogg"}
local firetail = {"weapons/arccw_ud/m1014/fire_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_m1014_cal_harpoon")
end
                                       

                                            
do
    local att = {}

att.PrintName = "Wooden Handguard"
att.Icon = Material("", "smooth mips")
att.Description = "Heavy handguard made out of wood, works well with the wooden furniture stock options available for the weapon."
att.Desc_Neutrals = {
}
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = "ud_1014_hg"

att.AutoStats = true

att.Mult_SightTime = 1.15
att.Mult_ShootSpeedMult = 0.875
att.Mult_SightedSpeedMult = 0.875
att.Mult_Recoil = 0.90

att.ActivateElements = {"ud_m1014_handguard_wood"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_handguard_wood")
end
                                          

                                    
do
    local att = {}

att.PrintName = "RIS Handguard"
att.Icon = Material("entities/att/uc_neo_rail_forend.png", "smooth mips")
att.Description = "Tactical handguard made out of lighter materials, allowing for far better ergonomics but while also making the recoil less bearable."
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = "ud_1014_hg"

att.AutoStats = true
att.SortOrder = 999

att.Mult_SightTime = 0.70
att.Mult_ShootSpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.9
att.Mult_Recoil = 1.15

att.ActivateElements = {"ud_autoshotgun_rail_fg"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_hg_ris")
end
                                  

                                      
do
    local att = {}

att.PrintName = "Sporting Handguard"
att.Icon = Material("entities/att/acwatt_ud_870_slide_poly.png", "smooth mips")
att.Description = "Aftermarket handguard with a rough grip surface. It's much lighter, but not as comfortable to grip."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = { "This Urban Coalition item was cut from the original version and has now been restored!"
}
att.Slot = "ud_1014_hg"

att.AutoStats = true
att.SortOrder = 999

att.Mult_SightTime = 0.85
att.Mult_ShootSpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.9

att.ActivateElements = {"ud_m1014_handguard_sport"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_hg_sport")
end
                                    

                                        
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = Material("entities/att/arccw_uc_extra_none.png", "smooth mips")
att.Description = "Completely remove the stock and the buffer tube."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_stock"

att.AutoStats = true
att.Free = true
att.IgnorePickX = true
att.SortOrder = 999

att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.4

att.Mult_SightedSpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.85

att.Mult_Sway = 1.7
att.Add_BarrelLength = -10

att.ActivateElements = {"ud_autoshotgun_stock_none"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_stock_none")
end
                                      

                                                
do
    local att = {}

att.PrintName = "Sawn-off Wood Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Compact yet stylish pistol grip."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_stock"

att.AutoStats = true

att.Mult_Recoil = 1.2
att.Mult_RecoilSide = 1.3

att.Mult_SightedSpeedMult = 0.85
att.Mult_ShootSpeedMult = 1.05

att.Mult_Sway = 1.8
att.Add_BarrelLength = -8

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_stock"
end

att.ActivateElements = {"ud_autoshotgun_stock_wood_sawnoff"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_stock_wood_sawnoff")
end
                                              

                                        
do
    local att = {}

att.PrintName = "Wooden Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Solid, non-adjustable wooden stock. Provides an even better brace at the cost of combat mobility."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_1014_stock"

att.AutoStats = true

att.Mult_Recoil = .685
att.Mult_Sway = .685

att.Mult_SightedSpeedMult = .85
att.Mult_DrawTime = 1.375
att.Mult_HolsterTime = 1.375

att.ActivateElements = {"ud_autoshotgun_stock_wood"}

att.Hook_TranslateAnimation = function(wep, anim)
    return anim .. "_stock"
end

    ArcCW.LoadAttachmentType(att, "ud_m1014_stock_wood")
end
                                      

                                     
do
    local att = {}

att.PrintName = "FC1040 25 Shell Drum"
att.AbbrevName = "25 Shell Drum"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M4 Super 90 25 Shell Drum"
end

att.Icon = Material("", "smooth mips")
att.Description = "Custom-made, massive, high-capacity drum tube that allows for even more shells to be loaded."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_1014_tube"

att.Override_ClipSize = 25

att.AutoStats = true

att.Mult_Sway = 1.2
att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.15
att.Mult_SightedSpeedMult = 0.60

att.ActivateElements = {"ud_autoshotgun_tube_25"}

    ArcCW.LoadAttachmentType(att, "ud_m1014_tube_25")
end
                                   

                                     
do
    local att = {}

att.PrintName = "30\" Extended Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "30\" M16 Extended Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Extended barrel that improves range and recoil control."
att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {

}
att.Slot = "ud_m16_blen"
att.SortOrder = 30

att.AutoStats = true

att.Mult_SightTime = 1.15

att.Mult_Range = 1.15
att.Mult_Recoil = 0.85
att.Mult_AccuracyMOA = 0.85
att.Mult_RPM = 0.90
att.Mult_HipDispersion = 0.65

att.Add_BarrelLength = 10
att.Mult_PhysBulletMuzzleVelocity = 1.35

att.ActivateElements = {"barrel_30"}

    ArcCW.LoadAttachmentType(att, "ud_m16_barrel_30")
end
                                   

                                       
do
    local att = {}

att.PrintName = "No Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "No Barrel"
end

att.Icon = Material("", "smooth mips")
att.Description = "Remove the barrel"
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.overheat"
}
att.Desc_Neutrals = {
    "uc.supptail",
    "ud.m16.allowfs",
}
att.Slot = "ud_m16_blen"

att.AutoStats = true

att.Mult_Sway = 1.15
att.Mult_RecoilSide = 1.15
att.Mult_Recoil = 1.15
att.Mult_Penetration = 0.90
att.Mult_Range = 0.95

att.LHIK = true
att.LHIKHide = true
att.Ignore = true

att.GivesFlags = {"ud_m16_rscompatible"}
att.ActivateElements = {"barrel_none"}

    ArcCW.LoadAttachmentType(att, "ud_m16_barrel_none")
end
                                     

                                         
do
    local att = {}

att.PrintName = "20\" Suppressed Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "20\" M16 SD Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_m16_barrel_sd.png", "smooth mips")
att.Description = "Integrally suppressed long barrel made by hobbyists. Dampens sound effectively, but the suppressor adds to weapon weight.\nPerformance may degrade with sustained fire."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.overheat"
}
att.Desc_Neutrals = {
    "uc.supptail",
    "ud.m16.allowfs",
}
att.Slot = "ud_m16_blen"

att.AutoStats = true

att.Mult_SightTime = 1.15

att.Mult_Recoil = 1.30
att.Mult_AccuracyMOA = 1.3
att.Mult_RPM = 1.222
att.Mult_HipDispersion = 0.65

att.Mult_PhysBulletMuzzleVelocity = 0.90

att.LHIK = true

att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"

att.Mult_ShootVol = 0.475
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.GivesFlags = {"sd_long", "ud_m16_rscompatible", "ud_m16_sd"}
att.SDBarrel = true

att.ActivateElements = {"hg_sd", "hg_m16_sdlong"}

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

    ArcCW.LoadAttachmentType(att, "ud_m16_barrel_sdlong")
end
                                       

                                             
do
    local att = {}

att.PrintName = "30\" Suppressed Barrel"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "30\" M16 SD Barrel"
end

att.Icon = Material("entities/att/acwatt_ud_m16_barrel_sd.png", "smooth mips")
att.Description = "Integrally suppressed marksman barrel made by hobbyists. Dampens sound effectively, but the suppressor adds to weapon weight.\nPerformance may degrade with sustained fire."
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.overheat"
}
att.Desc_Neutrals = {
    "uc.supptail",
    "ud.m16.allowfs",
}
att.Slot = "ud_m16_blen"

att.AutoStats = true

att.Mult_SightTime = 1.15

att.Mult_Range = 1.10
att.Mult_Recoil = 0.90
att.Mult_AccuracyMOA = 1.1
att.Mult_RPM = 0.95
att.Mult_HipDispersion = 0.65

att.Add_BarrelLength = 10
att.Mult_PhysBulletMuzzleVelocity = 1.10

att.LHIK = true

att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"

att.Mult_ShootVol = 0.200
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.GivesFlags = {"sd_long", "ud_m16_rscompatible", "ud_m16_sd"}
att.SDBarrel = true

att.ActivateElements = {"hg_sd", "hg_m16_sdmarksman"}

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

    ArcCW.LoadAttachmentType(att, "ud_m16_barrel_sdmarksman")
end
                                           

                                   
do
    local att = {}

att.PrintName = "Dong Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "Wooden dong handguard."

att.AbbrevName = "Dong Handguard"
att.Slot = "ud_m16_hg"
att.AutoStats = true

att.Mult_Sway = 0.9
att.Mult_RecoilSide = 0.85
att.Mult_Recoil = 0.85

att.Mult_SightedSpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.95

att.LHIK = true
att.Model = "models/weapons/arccw/atts/lmg_lhik.mdl"

att.ActivateElements = {"hg_m16_dong"}
att.ModelOffset = (Vector(0.41, 0, -1.63) - Vector(11.5, 2.8, -4.2)) + Vector(-0.1, 0, 0)

    ArcCW.LoadAttachmentType(att, "ud_m16_hg_dong")
end
                                 

                                   
do
    local att = {}

att.PrintName = "No Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "Remove the handguard. Allows you to equip certain special barrels such as the full length SD barrel."

att.AbbrevName = "No Handguard"
att.Slot = "ud_m16_hg"
att.AutoStats = true

att.Mult_Sway = 1.65
att.Mult_RecoilSide = 1.50
att.Mult_Recoil = 2.15
att.Mult_Penetration = 0.90
att.Mult_Range = 0.70
att.Mult_Precision = 0.65

att.Mult_SightedSpeedMult = 1.15
att.Mult_ShootSpeedMult = 1.10
att.Mult_SightTime = 0.50
att.Mult_DrawTime = 0.50
att.Mult_HolsterTime = 0.50

att.LHIK = true
att.Ignore = true

att.ActivateElements = {"barrel_none"}

    ArcCW.LoadAttachmentType(att, "ud_m16_hg_none")
end
                                 

                                  
do
    local att = {}

att.PrintName = "STANAG 10-Round Compact Mag"
att.AbbrevName = "10-Round Compact Mag"
att.SortOrder = 20
att.Icon = Material("entities/att/acwatt_ud_m16_mag_20.png", "smooth mips")
att.Description = "Original, low-capacity magazine for the M16, capped at 10 rounds. The lighter load reduces the weapon's weight and brings back memories of the rice fields."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_m16_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 10

att.Mult_SightTime = 0.78
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 0.75

att.Mult_SpeedMult = 1.025
att.Mult_SightedSpeedMult = 1.05
att.Mult_ShootSpeedMult = 1.05

att.Mult_MalfunctionMean = 1.5

att.Mult_HipDispersion = 0.75

att.ActivateElements = {"ud_m16_mag_20"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_20"
end

att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}

    ArcCW.LoadAttachmentType(att, "ud_m16_mag_10")
end
                                

                                   
do
    local att = {}

att.PrintName = "STANAG 125-Round Mag"
att.AbbrevName = "125-Round Mag"
att.SortOrder = 20
att.Icon = Material("entities/att/ur_g3/mag556_40.png", "smooth mips")
att.Description = "Long ass magazine that somehow manages to cram more cartridges than a C-Mag."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_m16_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 125

att.Mult_SightTime = 1.6
att.Mult_ReloadTime = 1.6
att.Mult_Sway = 4

att.Mult_SpeedMult = 0.875
att.Mult_ShootSpeedMult = 0.875

att.Mult_DrawTime = 1.3
att.Mult_HolsterTime = 1.3

att.Mult_HipDispersion = 1.8

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.77
att.Mult_MalfunctionVariance = 1.6

att.ActivateElements = {"ud_m16_mag_125"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_60"
end

att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}

    ArcCW.LoadAttachmentType(att, "ud_m16_mag_125")
end
                                 

                                     
do
    local att = {}

att.PrintName = "Izmash 75-Round Drum Mag"
att.AbbrevName = "75-Round Drum Mag"
att.SortOrder = 20
att.Icon = Material("entities/att/ur_ak/magazines/762_75.png", "smooth mips")
att.Description = "Steel drum magazine. More reliable than a C-Mag, but heavier."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_m16_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 75

att.Mult_SightTime = 1.4
att.Mult_ReloadTime = 1.45
att.Mult_Sway = 3

att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.9

att.Mult_DrawTime = 1.30
att.Mult_HolsterTime = 1.30

att.Mult_HipDispersion = 1.6

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.800
att.Mult_MalfunctionVariance = 1.35

att.ActivateElements = {"ud_m16_mag_75_762"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_60"
end

att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}

    ArcCW.LoadAttachmentType(att, "ud_m16_mag_75_ak")
end
                                   

                                  
do
    local att = {}

att.PrintName = "STANAG 75-Round Drum Mag"
att.AbbrevName = "75-Round Drum Mag"
att.SortOrder = 20
att.Icon = Material("entities/att/ur_g3/mag50.png", "smooth mips")
att.Description = "Polymer drum magazine. More reliable than a C-Mag."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_m16_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 75

att.Mult_SightTime = 1.3
att.Mult_ReloadTime = 1.3
att.Mult_Sway = 2

att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.9

att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15

att.Mult_HipDispersion = 1.3

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.825
att.Mult_MalfunctionVariance = 1.35

att.ActivateElements = {"ud_m16_mag_75"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_60"
end

att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}

    ArcCW.LoadAttachmentType(att, "ud_m16_mag_75")
end
                                

                                      
do
    local att = {}

att.PrintName = "50-Round AMSMG Drum Mag"
att.AbbrevName = "50-Round Drum Mag"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "50-Round 9mm AR-15 Drum Mag"
end

att.Icon = Material("", "smooth mips")
att.Description = "A drum magazine for the 9mm caliber conversion."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "ud_m16_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 50
att.Mult_SightTime = 1.15
att.Mult_ReloadTime = 1.25
att.Mult_Sway = 1.35
att.Mult_ShootSpeedMult = 0.90

att.ActivateElements = {"ud_m16_9mm_mag_50"}
att.RequireFlags = {"m16_9mm"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

    ArcCW.LoadAttachmentType(att, "ud_m16_mag_9mm_50")
end
                                    

                                                
do
    local att = {}

att.PrintName = "Model 605 Three-prong"
att.AbbrevName = "M605 Three-prong UNIVERSAL"
att.Icon = Material("entities/att/acwatt_ud_m16_muzzle_605.png", "mips smooth")
att.Description = ""
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "muzzle"

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/fesiug_threeprong_605.mdl"
att.ModelOffset = Vector(0.4, 0, 0)
att.ModelScale = Vector(1, 1, 1)
att.OffsetAng = Angle(0, 0, 0)

att.Add_BarrelLength = 4
att.Mult_Sway = 1.1
att.Mult_HipDispersion = 0.9

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "ud_m16_muzzle_605_universal")
end
                                              

                                                
do
    local att = {}

att.PrintName = "Model 607 Moderator"
att.AbbrevName = "M607 Moderator UNIVERSAL"
att.Icon = Material("entities/att/acwatt_ud_m16_muzzle_607.png", "mips smooth")
att.Description = ""
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "muzzle"

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/fesiug_moderator_607.mdl"
att.ModelOffset = Vector(0.2, 0, 0)
att.ModelScale = Vector(1, 1, 1)
att.OffsetAng = Angle(0, 0, 0)

att.Add_BarrelLength = 4
att.Mult_Sway = 1.1
att.Mult_HipDispersion = 0.9

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "ud_m16_muzzle_607_universal")
end
                                              

                                                  
do
    local att = {}

att.PrintName = "CAR-15 XM177 Moderator"
att.AbbrevName = "XM177 Moderator UNIVERSAL"
att.Icon = Material("entities/att/acwatt_ud_m16_muzzle_xm177.png", "mips smooth")
att.Description = ""
att.Desc_Pros = {
    "uc.flashhider"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "muzzle"

att.SortOrder = 998

att.Model = "models/weapons/arccw/atts/fesiug_moderator_xm177.mdl"
att.ModelOffset = Vector(0.3, 0, 0)
att.ModelScale = Vector(1, 1, 1)
att.OffsetAng = Angle(0, 0, 0)

att.Add_BarrelLength = 4
att.Mult_Sway = 1.1
att.Mult_HipDispersion = 0.9

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

    ArcCW.LoadAttachmentType(att, "ud_m16_muzzle_xm177_universal")
end
                                                

                                            
do
    local att = {}

att.PrintName = "AMCAR-NG 14.5x114mm Upper Receiver"
att.AbbrevName = "14.5x114mm"

att.SortOrder = 77
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "The Soviet anti-tank rifle round, later the KPV heavy machine gun's cartridge, which is used against light armour and helicopters. Fitting one to a rifle upper is an act of open contempt for the receiver underneath it.\n\nThe fuze arms at 30 metres. Under that you do a fifth damage. Past it you do double, with enormous penetration. Two rounds per magazine and the recoil is close to uncontrollable. This is a long range instrument only."
att.Desc_Pros = {
    "Devastating past 30 metres",
    "Enormous penetration",
}
att.Desc_Cons = {
    "Nearly harmless up close",
    "Two rounds",
    "Recoil is severe",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = "14.5x114mm"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.55

att.Mult_Damage = 2.6
att.Mult_DamageMin = 2.6
att.Mult_Penetration = 3.4
att.Mult_Range = 2.2
att.Mult_RangeMin = 2.0
att.Mult_MuzzleVelocity = 1.6
att.Mult_Recoil = 3.0
att.Mult_RecoilSide = 2.5
att.Mult_VisualRecoilMult = 2.7
att.Mult_RPM = 0.32
att.Mult_ClipSize = 0.12
att.Mult_ReloadTime = 1.6
att.Mult_ShootVol = 1.85
att.Mult_ShootPitch = 0.5

local ARM = 30

att.Hook_BulletHit = function(wep, hit)
    if hit.range < ARM then
        hit.damage = hit.damage * 0.2
    else
        hit.damage = hit.damage * 2.0
    end

    return hit
end

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_145x114")
end
                                          

                                         
do
    local att = {}

att.PrintName = "AMCAR-NG 20 Gauge Upper Receiver"
att.AbbrevName = "20 Gauge"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "A smoothbore upper and a box magazine full of twenty bore shells, which turns a service rifle into an ungainly but very effective bird gun. Lighter than a twelve and considerably easier to hold onto."
att.Desc_Pros = {
    "Wide pattern, brutal at close range",
}
att.Desc_Cons = {
    "Useless past a corridor",
    "No penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = "20 Gauge"
att.Override_Ammo = "buckshot"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 0.9
att.Override_IsShotgun = true
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_HullSize = 0.1
att.Override_Penetration = 1

att.Override_Num = 7

att.Override_AccuracyMOA = 26
att.Override_AccuracyMOA_Priority = 0

att.Mult_Damage = 0.28
att.Mult_DamageMin = 0.22
att.Mult_Range = 0.3
att.Mult_RangeMin = 0.35
att.Mult_Recoil = 1.3
att.Mult_RPM = 0.75
att.Mult_ClipSize = 0.55
att.Mult_HipDispersion = 1.5
att.Mult_ShootPitch = 0.95

local slotinfo = {
    [12] = {"\"BUCK\" #3 Buckshot", "\"BUCK\" #3 Buckshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
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
att.Mult_ShootVol = 1.1

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_20ga")
end
                                       

                                         
do
    local att = {}

att.PrintName = "AMCAR-NG 20mm Cannon Upper Receiver"
att.AbbrevName = "20mm"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/40.png", "smooth mips")
att.Description = "An aircraft cannon barrel, a very optimistic bolt and a magazine that holds three. This is the point at which the rifle stops being a rifle and becomes a shoulder fired autocannon that happens to have a pistol grip."
att.Desc_Pros = {
    "Obliterates whatever it touches",
}
att.Desc_Cons = {
    "Three rounds",
    "Barely controllable",
    "Glacial",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = "20x102mm"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.7

att.Mult_Damage = 3.5
att.Mult_DamageMin = 3.5
att.Mult_Penetration = 3.0
att.Mult_Range = 1.8
att.Mult_RangeMin = 1.7
att.Mult_Recoil = 3.2
att.Mult_RecoilSide = 2.6
att.Mult_VisualRecoilMult = 2.8
att.Mult_RPM = 0.3
att.Mult_ClipSize = 0.15
att.Mult_ReloadTime = 1.5
att.Mult_ShootVol = 1.8
att.Mult_ShootPitch = 0.52

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_20mm")
end
                                       

                                                
do
    local att = {}

att.PrintName = "AMCAR-NG .221 Fireball Upper Receiver"
att.AbbrevName = ".221 Fireball"

att.SortOrder = 76
att.Icon = Material("entities/att/uc_bullets/223remington.png", "smooth mips")
att.Description = "Remington's shortened .222, built for a bolt action pistol and named for what comes out of the muzzle. It remains one of the mildest centrefire rounds anybody has ever made that still shoots genuinely flat.\n\nDoes up to 70 percent more damage to a target at full health, dropping back to normal as they get hurt. It opens people up very well and finishes them badly, so expect to spend most of the magazine or pair it with something heavier. Almost no recoil and a high rate of fire."
att.Desc_Pros = {
    "Far stronger against undamaged targets",
    "Very fast and controllable",
}
att.Desc_Cons = {
    "Falls off against wounded targets",
    "Mediocre penetration",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".221 Fireball"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 0.9

att.Mult_Damage = 0.68
att.Mult_DamageMin = 0.7
att.Mult_Penetration = 0.8
att.Mult_Range = 1.1
att.Mult_MuzzleVelocity = 1.25
att.Mult_Recoil = 0.55
att.Mult_RecoilSide = 0.55
att.Mult_VisualRecoilMult = 0.6
att.Mult_RPM = 1.3
att.Mult_ClipSize = 1.15
att.Mult_AccuracyMOA = 0.75
att.Mult_ShootPitch = 1.28

att.Hook_BulletHit = function(wep, hit)
    local ent = hit.tr.Entity
    if !IsValid(ent) or !ent.Health then return hit end
    if !(ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then return hit end

    local maxhp = ent.GetMaxHealth and ent:GetMaxHealth() or 100
    if maxhp <= 0 then return hit end

    local frac = math.Clamp(ent:Health() / maxhp, 0, 1)
    hit.damage = hit.damage * Lerp(frac, 1, 1.7)

    return hit
end
att.Mult_ShootVol = 0.85

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_221fireball")
end
                                              

                                                 
do
    local att = {}

att.PrintName = "AMCAR-NG .223 Remington Receiver"
att.AbbrevName = ".223 Remington Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 .223 Remington Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/223remington.png", "smooth mips")
att.Description = "The .223 Remington is considered one of the most popular common-use cartridges and is used by a wide range of semi-automatic and manual-action rifles. Provides decent velocity and precision."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.75

att.Mult_Damage = 1.44
att.Mult_DamageMin = 1.48
att.Mult_Penetration = 1.72

att.Mult_Range = 2.05
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.44
att.Mult_VisualRecoilMult = 1.44

att.Override_PhysBulletMuzzleVelocity = 795

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Trivia_Calibre = ".223 Remington"

att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1

local path = "weapons/misc/"

local fire22 = {path .. "m16_223remington_fire.wav"}
local fire22sup = {path .. "m16_223remington_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = { "weapons/ar458/ar458_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar458_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_223remington")
end
                                               

                                            
do
    local att = {}

att.PrintName = "AMCAR-NG .277 Fury Upper Receiver"
att.AbbrevName = ".277 Fury"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "SIG's hybrid case round, with a steel head so it can be loaded to pressures that would flatten ordinary brass. The US Army adopted it to defeat armour at distances the 5.56 had quietly given up on."
att.Desc_Pros = {
    "Defeats armour at long range",
    "Flat shooting",
}
att.Desc_Cons = {
    "Sharp recoil",
    "Reduced capacity",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".277 Fury"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.15

att.Mult_Damage = 1.35
att.Mult_DamageMin = 1.4
att.Mult_Penetration = 1.9
att.Mult_Range = 1.5
att.Mult_RangeMin = 1.45
att.Mult_MuzzleVelocity = 1.35
att.Mult_Recoil = 1.3
att.Mult_VisualRecoilMult = 1.25
att.Mult_RPM = 0.9
att.Mult_ClipSize = 0.8
att.Mult_AccuracyMOA = 0.85
att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 1.15

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_277fury")
end
                                          

                                                
do
    local att = {}

att.PrintName = "AMCAR-NG 2.7×9mm Kolibri Upper Receiver"
att.AbbrevName = "2.7×9mm Kolibri Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 2.7×9mm Kolibri Upper Receiver"
end

att.Icon = Material("entities/att/2mm_kolibri_icon.png", "smooth mips")
att.Description = "Conversion of the AR-15 to the smallest commercially available centerfire cartridge, patented in 1910 and introduced in 1914 by an Austrian watchmaker. Due to it being smaller than .22LR, you can cram even more of these suckers into a mag.\n\nThe 2mm Kolibri was advertised as a ladies' self-defence round. While probably not effective against a mugger if shot at the chest or limbs, it could potentially inflict some damage if shot at the attacker's face.\n\n\"Ever been stung by a bee? How about a wasp? Or a hornet?\""
att.Desc_Pros = {"Extra headshot damage"
}
att.Desc_Cons = {"Where'd you even find this ammo?!"
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 1.22

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.20
att.Mult_Penetration = 0

att.Mult_Range = 0.10
att.Mult_ShootSpeedMult = 1.5
att.Mult_Recoil = 0.05
att.Mult_VisualRecoilMult = 0.10
att.Mult_ClipSize = 1.35

att.Mult_HeatCapacity = 0.4

att.Hook_BulletHit = function(wep,data)
    if SERVER and data.tr and data.tr.HitGroup == HITGROUP_HEAD then
        data.damage = data.damage * 1.45
    end
end

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 345 / 0.8333

att.Override_Ammo = "Pistol"
att.Override_Trivia_Calibre = "2.7×9mm Kolibri"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

local path = "weapons/2mm_kolibri_m16/"

local fire22 = {path .. "armalibri_fire.wav"}
local fire22sup = {path .. "armalibri_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "armalibri_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "armalibri_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_2mm_kolibri")
end
                                              

                                         
do
    local att = {}

att.PrintName = "AMCAR-NG .30-06 Springfield Upper Receiver"
att.AbbrevName = ".30-06 Springfield"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/3006springfield.png", "smooth mips")
att.Description = "The cartridge America fought both world wars and Korea with, adapted onto a rifle that postdates all of them. The case is longer than the magazine really wants and the recoil is longer than your shoulder really wants."
att.Desc_Pros = {
    "Enormous reach and penetration",
}
att.Desc_Cons = {
    "Punishing recoil",
    "Very small magazine",
    "Slow to cycle",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".30-06 Springfield"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1.25

att.Mult_Damage = 1.65
att.Mult_DamageMin = 1.7
att.Mult_Penetration = 1.8
att.Mult_Range = 1.9
att.Mult_RangeMin = 1.8
att.Mult_MuzzleVelocity = 1.3
att.Mult_Recoil = 1.65
att.Mult_VisualRecoilMult = 1.5
att.Mult_RPM = 0.62
att.Mult_ClipSize = 0.5
att.Mult_ShootVol = 1.3
att.Mult_ShootPitch = 0.85

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_3006")
end
                                       

                                           
do
    local att = {}

att.PrintName = "AMCAR-NG .308 Winchester Upper Receiver"
att.AbbrevName = ".308 Winchester"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "A full power battle rifle cartridge in an upper that was never really meant to hold one. It reaches out past anything else on the platform and it lets you know about it every single time you press the trigger."
att.Desc_Pros = {
    "Full power reach and penetration",
}
att.Desc_Cons = {
    "Heavy recoil, slow cycle, small magazine",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".308 Winchester"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1.15

att.Mult_Damage = 1.5
att.Mult_DamageMin = 1.5
att.Mult_Penetration = 1.6
att.Mult_Range = 1.7
att.Mult_RangeMin = 1.6
att.Mult_MuzzleVelocity = 1.2
att.Mult_Recoil = 1.5
att.Mult_VisualRecoilMult = 1.4
att.Mult_RPM = 0.7
att.Mult_ClipSize = 0.6
att.Mult_ShootVol = 1.2
att.Mult_ShootPitch = 0.95

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_308win")
end
                                         

                                        
do
    local att = {}

att.PrintName = "AMPAW-9 .357 Magnum Upper Receiver"
att.AbbrevName = ".357 Magnum Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "R0635 .357 Magnum Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/357magnum.png", "smooth mips")
att.Description = "A converted receiver that fires .357 Magnum rounds. Very powerful and accurate but increases recoil and decreases fire rate."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_Penetration = 6 / 16
att.Mult_RPM = 0.62

att.Mult_Damage = 1.04
att.Mult_DamageMin = 1.01
att.Mult_Penetration = 1.12

att.Mult_Range = 1.04
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 0.95
att.Mult_HipDispersion = 0.85

att.Mult_SightTime = 0.9

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 20

att.Mult_HeatCapacity = 1.5

att.GivesFlags = {"m16_auto", "m16_9mm"}
att.ExcludeFlags = {"m16_noauto"}
att.ActivateElements = {"ud_m16_9mm_mag"}

att.Override_PhysBulletMuzzleVelocity = 396 / 0.93333

att.Override_Ammo = "357"
att.Override_Trivia_Calibre = ".357 Magnum"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

local path = ")^weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/misc/m16_357_fire.wav" end
    if fsound == wep.ShootSoundSilenced then return {path .. "m16_357_fire_sup.wav"} end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local slotinfo = {
    [11] = {"20-Round Mag", "20-Round Mag", Material("entities/att/acwatt_ud_m16_9mm_20.png", "smooth mips")},
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

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_357")
end
                                      

                                           
do
    local att = {}

att.PrintName = "AMPAW-9 .380 ACP Upper Receiver"
att.AbbrevName = ".380 ACP Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "R0635 .380 ACP Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/380acp.png", "smooth mips")
att.Description = "A converted receiver that fires .380 ACP rounds. Has less range effectiveness but also less recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.85

att.Mult_Damage = 0.83
att.Mult_DamageMin = 0.84
att.Mult_Penetration = 0.42

att.Mult_Range = 0.65
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 0.5
att.Mult_HipDispersion = 0.85

att.Mult_SightTime = 0.9

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 20

att.Mult_HeatCapacity = 1.5

att.GivesFlags = {"m16_auto", "m16_9mm"}
att.ExcludeFlags = {"m16_noauto"}
att.ActivateElements = {"ud_m16_9mm_mag"}

att.Override_PhysBulletMuzzleVelocity = 396 / 0.93333

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".380 ACP"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

local path = ")^weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/misc/m16_380acp_fire.wav" end
    if fsound == wep.ShootSoundSilenced then return {path .. "m16_380acp_sup.wav"} end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local slotinfo = {
    [11] = {"20-Round Mag", "20-Round Mag", Material("entities/att/acwatt_ud_m16_9mm_20.png", "smooth mips")},
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

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_380acp")
end
                                         

                                            
do
    local att = {}

att.PrintName = "AMCAR-NG .410 Bore Upper Receiver"
att.AbbrevName = ".410 Bore Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 .410 Bore Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "Conversion kit for the M16 that enables it to feed .410 bore shotshells.\n\nConsiderable amount of recoil, but not much precision due to spread."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.65

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17
att.Override_Penetration = 1
att.Override_Num = 4
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.15
att.Mult_VisualRecoilMult = 0.2
att.Mult_ClipSize = 0.85
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

local path = "weapons/410bore_m16/"

local fire22 = {path .. "410bore_m16_fire.wav"}
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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_410bore")
end
                                          

                                             
do
    local att = {}

att.PrintName = "AMCAR-NG .458 Socom Upper Receiver"
att.AbbrevName = ".458 Socom Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 .458 Socom Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "Marksman rifle configuration for the weapon, loaded in .458 Socom.\nVery snappy recoil, but offers tremendous power and range."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.75

att.Mult_Damage = 1.65
att.Mult_DamageMin = 1.50
att.Mult_Penetration = 0.80

att.Mult_Recoil = 1.50
att.Mult_RecoilSide = 2
att.Mult_VisualRecoilMult = 2
att.Mult_RPM = 0.5
att.Mult_Range = 1.25
att.Mult_ShootVol = 1.2

att.Mult_SightTime = 0.91
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 0.667

att.Mult_SpeedMult = 1.025

att.Override_PhysBulletMuzzleVelocity = 550

att.Mult_ClipSize = 0.67

att.Override_PhysBulletMuzzleVelocity = 595

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".458 Socom"

att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1

local path = "weapons/ar458/"

local fire22 = {path .. "ar458_fire.wav"}
local fire22sup = {path .. "ar458_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "ar458_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar458_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_458socom")
end
                                           

                                          
do
    local att = {}

att.PrintName = "AMPAW-9 .45 ACP Upper Receiver"
att.AbbrevName = ".45 ACP Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "R0635 .45 ACP Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Description = "A converted receiver that fires .45 ACP rounds. Powerful and accurate but increases kickback."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_Penetration = 6 / 16
att.Mult_RPM = 0.85

att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.95
att.Mult_Penetration = 0.87

att.Mult_Range = 0.9
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 0.7
att.Mult_HipDispersion = 0.85

att.Mult_SightTime = 0.9

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 20

att.Mult_HeatCapacity = 1.5

att.GivesFlags = {"m16_auto", "m16_9mm"}
att.ExcludeFlags = {"m16_noauto"}
att.ActivateElements = {"ud_m16_9mm_mag"}

att.Override_PhysBulletMuzzleVelocity = 396 / 0.93333

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".45 ACP"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

local path = ")^weapons/ar45/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/ar45/ar45_fire.wav" end
    if fsound == wep.ShootSoundSilenced then return {path .. "ar45_fire_sup.wav"} end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local slotinfo = {
    [11] = {"20-Round Mag", "20-Round Mag", Material("entities/att/acwatt_ud_m16_9mm_20.png", "smooth mips")},
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

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_45acp")
end
                                        

                                          
do
    local att = {}

att.PrintName = "AMCAR-NG .50 BMG Receiver"
att.AbbrevName = ".50 BMG Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 .50 BMG Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "In response to the need for new anti-aircraft weaponry during World War I, John Browning developed the .50 BMG. He wanted the round to be used in a machine gun based on a scaled-up version of the M1917 Browning. \n The .50 BMG cartridge is also used in anti-materiel rifles. A wide variety of ammunition is available, and the availability of match grade ammunition has increased the usefulness of .50 caliber rifles by allowing more accurate fire than lower-quality rounds. \n\n\"Sometimes, overkill is just the right amount of kill.\""
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

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
att.Override_ClipSize = 10
att.Mult_TriggerDelayTime = 1.50

att.Mult_HipDispersion = 0.9
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_Trivia_Calibre = ".50 BMG"
att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.50

att.Override_PhysBulletMuzzleVelocity = 750

att.ActivateElements = {"upper_50bmg", "ud_m16_mag_50bmg"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50bmg"
end

local path = ")weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "m16_50bmg_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "m16_50bmg_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_50bmg")
end
                                        

                                              
do
    local att = {}

att.PrintName = "AMCAR-NG 5.56x45mm Duplex Upper Receiver"
att.AbbrevName = "5.56x45mm Duplex Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 5.56x45mm Duplex Receiver"
end

att.Icon = Material("", "smooth mips")
att.Description = "The 5.56×45mm duplex round contains two projectiles in a single casing. Theoretically, this allows for a higher hit probability at the cost of increased recoil and reduced effective range."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Override_Num = 2
att.Mult_AccuracyMOA = 1.5

att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.05
att.Mult_VisualRecoilMult = 1.05
att.Mult_Range = 0.80
att.Mult_ShootVol = 1.05

att.Override_Trivia_Calibre = "5.56x45mm SCF"

local path = "weapons/ar458/"

local fire22dist = {path .. "ar458_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar458_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_556duplex")
end
                                            

                                           
do
    local att = {}

att.PrintName = "AMCAR-NG 5.56x45mm SCF"
att.AbbrevName = "5.56x45mm SCF Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 5.56x45mm SCF Receiver"
end

att.Icon = Material("entities/att/556SCF.png", "smooth mips")
att.Description = "The 5.56×45mm annular-primed SCF (synthetic case flechette) is a unique type of ammunition designed for experimental use, that features a lightweight, translucent plastic casing and contains a saboted carbon steel flechette—a small, dart-like projectile. The design aimed to reduce weight and improve performance compared to traditional brass-cased ammunition. The flechette itself is incredibly light, weighing just 0.66 grams, and achieves high muzzle velocities."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.SortOrder = -12

att.AutoStats = true
att.SortOrder = 3

att.Mult_Damage = 0.90
att.Mult_DamageMin = 1.50
att.Mult_Penetration = 1.50

att.Mult_Recoil = 1.20
att.Mult_RecoilSide = 0.85
att.Mult_VisualRecoilMult = 2
att.Mult_RPM = 0.95
att.Mult_Range = 1.25
att.Mult_ShootVol = 1.05

att.Mult_SightTime = 1.05
att.Mult_ReloadTime = 1.05
att.Mult_Sway = 0.90

att.Override_PhysBulletMuzzleVelocity = 2500

att.Override_Trivia_Calibre = "5.56x45mm SCF"

local path = "weapons/ar458/"

local fire22dist = {path .. "ar458_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar458_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_556scf")
end
                                         

                                           
do
    local att = {}

att.PrintName = "AMCAR-NG 7.62x39 Upper Receiver"
att.AbbrevName = "7.62x39 Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AR-15 7.62x39 Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "Conversion to the 7.62x39 caliber. Powerful but has slower fire rate and more recoil"
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
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

att.Override_Trivia_Calibre = "7.62x39"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1

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

local fire22dist = {path .. "ar762_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar762_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_762x39")
end
                                         

                                           
do
    local att = {}

att.PrintName = "AMCAR-NG .950 JDJ Upper Receiver"
att.AbbrevName = ".950 JDJ"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "The largest sporting cartridge ever built, firing a bullet the thickness of a shotgun bore weighing well over a hundred grams. Three rifles exist for it. Each weighs about as much as the person holding it, for reasons that become obvious immediately."
att.Desc_Pros = {
    "Nothing survives being hit by it",
}
att.Desc_Cons = {
    "Two rounds",
    "Recoil bordering on self harm",
    "Nearly unusable",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = ".950 JDJ"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 2.0

att.Mult_Damage = 5.0
att.Mult_DamageMin = 5.0
att.Mult_Penetration = 3.5
att.Mult_Range = 1.6
att.Mult_RangeMin = 1.5
att.Mult_Recoil = 4.0
att.Mult_RecoilSide = 3.2
att.Mult_VisualRecoilMult = 3.5
att.Mult_RPM = 0.22
att.Mult_ClipSize = 0.1
att.Mult_ReloadTime = 1.8
att.Mult_ShootVol = 1.0
att.Mult_ShootPitch = 1.0

local fire = {"weapons/misc/m16_950jdj_fire.wav"}
local firesup = {"weapons/misc/m16_950Jdj_fire_sup.wav"}
local firetail = {"weapons/arccw_ud/m16/fire-50-dist-01.ogg", "weapons/arccw_ud/m16/fire-50-dist-02.ogg", "weapons/arccw_ud/m16/fire-50-dist-03.ogg", "weapons/arccw_ud/m16/fire-50-dist-04.ogg", "weapons/arccw_ud/m16/fire-50-dist-05.ogg", "weapons/arccw_ud/m16/fire-50-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_950jdj")
end
                                         

                                         
do
    local att = {}

att.PrintName = "AMCAR-NG 9x39mm Upper Receiver"
att.AbbrevName = "9x39mm"

att.SortOrder = 67
att.Icon = Material("entities/att/uc_bullets/9x39.png", "smooth mips")
att.Description = "A heavy subsonic bullet on a shortened rifle case, built in Russia specifically so that a suppressed weapon would be genuinely quiet rather than merely quieter. It hits hard, it hits close, and nobody hears where it came from."
att.Desc_Pros = {
    "Very heavy hit for its size",
    "Extremely quiet",
}
att.Desc_Cons = {
    "Short ranged",
    "Drops quickly",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x39mm"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1

att.Mult_Damage = 1.45
att.Mult_DamageMin = 1.3
att.Mult_Penetration = 1.3
att.Mult_Range = 0.6
att.Mult_RangeMin = 0.65
att.Mult_MuzzleVelocity = 0.5
att.Mult_Recoil = 1.1
att.Mult_RPM = 0.85
att.Mult_ClipSize = 0.75
att.Mult_ShootVol = 0.7
att.Mult_ShootPitch = 0.8

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_9x39")
end
                                       

                                             
do
    local att = {}

att.PrintName = "AMCAR-NG 4.73x33mm Caseless Upper Receiver"
att.AbbrevName = "4.73x33mm Caseless"

att.SortOrder = 75
att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "The G11 round: a block of propellant with the bullet buried inside it and no case at all, so there is nothing to extract and nothing to throw away. It worked, it was extraordinary, and German reunification killed the programme before anyone could field it.\n\nThere is no case to carry heat out of the gun, so the barrel heats fast, and the propellant burns harder as it does. Damage runs from 75 percent when cold up to 190 percent when the gun is nearly overheating. Fire rate is very high. Learn to ride the heat bar right up to the limit."
att.Desc_Pros = {
    "Damage climbs sharply as the gun heats",
    "Very high rate of fire",
    "Large magazine",
}
att.Desc_Cons = {
    "Weak when cold",
    "Overheats quickly",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"

att.AutoStats = true

att.Override_Trivia_Calibre = "4.73x33mm DM11"
att.Override_ShellEffect = "NONE"

att.Mult_RPM = 1.45
att.Mult_ClipSize = 1.3
att.Mult_Recoil = 0.75
att.Mult_VisualRecoilMult = 0.8
att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.85
att.Mult_HeatCapacity = 0.45
att.Mult_HeatDissipation = 0.7
att.Mult_Penetration = 1.1
att.Mult_ShootPitch = 1.2

att.Hook_BulletHit = function(wep, hit)
    if !IsValid(wep) then return hit end

    local cap = wep:GetBuff("HeatCapacity")
    if !cap or cap <= 0 then return hit end

    local h = math.Clamp(wep:GetHeat() / cap, 0, 1)
    hit.damage = hit.damage * Lerp(h, 0.75, 1.9)

    return hit
end
att.Mult_ShootVol = 0.9

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

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_caseless")
end
                                           

                                           
do
    local att = {}

att.PrintName = "1.6mm Needle Wildcat Upper"
att.AbbrevName = "1.6mm Needle"

att.SortOrder = 80
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "A cartridge no larger than a match, fed through an upper receiver built by somebody who wanted to know how fast a gas system could physically run. The answer turned out to be faster than the magazine can supply it.\n\nRoughly 2.3 times the fire rate with almost no recoil, feeding from a magazine that holds a bit more than double but empties in about a second and a half. Each hit is worth about a third of a normal round, so this only works if you land most of the burst."
att.Desc_Pros = {
    "Extreme rate of fire, almost no recoil",
}
att.Desc_Cons = {
    "Individually feeble",
}
att.Desc_Neutrals = {
}
att.Slot = "ud_m16_receiver"
att.AutoStats = true

att.Override_Trivia_Calibre = "1.6x14mm Needle"
att.Override_Trivia_Class = "Machine Pistol"
att.Override_Ammo = "pistol"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 0.7
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.Mult_RPM = 2.3
att.Mult_ClipSize = 2.2
att.Mult_Damage = 0.3
att.Mult_DamageMin = 0.3
att.Mult_Penetration = 0.35
att.Mult_Range = 0.6
att.Mult_Recoil = 0.2
att.Mult_VisualRecoilMult = 0.3
att.Mult_HipDispersion = 0.75
att.Mult_ShootPitch = 1.4
att.Mult_HeatCapacity = 0.6
att.Mult_ShootVol = 0.7

local fire = {"weapons/arccw_ur/ak/fire_545_auto_1.ogg", "weapons/arccw_ur/ak/fire_545_auto_2.ogg", "weapons/arccw_ur/ak/fire_545_auto_3.ogg"}
local firesup = {"weapons/arccw_ur/mp5/fire-sup-01.ogg", "weapons/arccw_ur/mp5/fire-sup-02.ogg", "weapons/arccw_ur/mp5/fire-sup-03.ogg", "weapons/arccw_ur/mp5/fire-sup-04.ogg", "weapons/arccw_ur/mp5/fire-sup-05.ogg", "weapons/arccw_ur/mp5/fire-sup-06.ogg"}
local firetail = {"weapons/arccw_ur/ak/fire_545_dist.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then return firesup end
    return fire
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return false end
    return firetail
end

    ArcCW.LoadAttachmentType(att, "ud_m16_receiver_needle")
end
                                         
