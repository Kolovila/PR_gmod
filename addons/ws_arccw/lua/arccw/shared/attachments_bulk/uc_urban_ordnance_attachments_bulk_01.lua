-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uo_anm14_als.lua
do
    local att = {}

att.PrintName = "ALS Thermite"
att.AbbrevName = "Thermite"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Plain thermite instead of the issued thermate filler.

Thermate is cut with barium nitrate and sulphur so it spatters wide and hot. This does not spread at all.

Half the radius at 105u, 24 damage a tick, and it burns out in 16 seconds instead of 26. In exchange it burns straight down through whatever it is standing on for 55 damage out to 90u below.

Useless for holding ground. Excellent for taking a door off its hinges, which takes about eight seconds.]]
att.Desc_Pros = {
    "uo.burnsthrough",
    "uo.breach",
}
att.Desc_Cons = {
    "uo.smallarea",
    "uo.shortburn",
}
att.SortOrder = 2

att.Slot = "uo_variant_m14"

att.ActivateElements = {"uo_als"}

att.AutoStats = true

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.CoreRadius = 105
    rocket.CoreDamage = 24
    rocket.BurnTime = 16

    rocket.SlagCount = 1
    rocket.SlagSpread = 40

    rocket.BurnThrough = true
    rocket.BurnThroughDamage = 55
    rocket.BurnThroughRange = 90
end

    ArcCW.LoadAttachmentType(att, "uo_anm14_als")
end
-- END BUNDLED ATTACHMENT: uo_anm14_als.lua

-- BEGIN BUNDLED ATTACHMENT: uo_gammon_double.lua
do
    local att = {}

att.PrintName = "Double Charge"
att.AbbrevName = "Double"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Twice the plastic explosive in the bag.

900 blast, 420 damage, 850 driven into the surface it hit, and doors leave frames from three times the usual distance.

Throw distance drops to 0.62. It barely leaves your hand, and the fuze arms in flight whether you have let go or not, so a short throw with this is a genuinely bad idea and nothing will stop you making one.]]
att.Desc_Pros = {
    "uo.breach",
    "uo.bigcharge",
}
att.Desc_Cons = {
    "uo.heavy",
    "uo.selfdanger",
}
att.SortOrder = 3

att.Slot = "uo_charge"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.62

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 900
    rocket.GrenadeDamage = 420
    rocket.ExplosionShake = 85
    rocket.ExplosionSoundLevel = 150

    rocket.SurfaceDamage = 850
    rocket.SurfaceRange = 150
    rocket.DoorRange = 3

    rocket.PhysMass = 2.2
end

    ArcCW.LoadAttachmentType(att, "uo_gammon_double")
end
-- END BUNDLED ATTACHMENT: uo_gammon_double.lua

-- BEGIN BUNDLED ATTACHMENT: uo_gammon_light.lua
do
    local att = {}

att.PrintName = "Half Charge"
att.AbbrevName = "Light"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[A half-filled bag.

400 blast, 150 damage, 140 into the surface. Roughly half a standard charge in every respect.

Throw distance goes up to 1.45, which is the furthest anything in the pack flies. It will cross a courtyard.

For when you want the contact fuze and the reach rather than the demolition.]]
att.Desc_Pros = {
    "uo.longthrow",
}
att.Desc_Cons = {
    "uo.smallcharge",
}
att.SortOrder = 1

att.Slot = "uo_charge"

att.AutoStats = true

att.Mult_MuzzleVelocity = 1.45

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 400
    rocket.GrenadeDamage = 150
    rocket.ExplosionShake = 30

    rocket.SurfaceDamage = 140
    rocket.DoorRange = 1

    rocket.PhysMass = 0.5
end

    ArcCW.LoadAttachmentType(att, "uo_gammon_light")
end
-- END BUNDLED ATTACHMENT: uo_gammon_light.lua

-- BEGIN BUNDLED ATTACHMENT: uo_m67_m69.lua
do
    local att = {}

att.PrintName = "M69 Practice"
att.AbbrevName = "M69"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[The blue practice round. Same body, same spoon, same fuse, black powder spotting charge instead of Composition B.

190 blast, 14 damage. It will sting somebody standing on top of it and that is the whole of its lethality.

It is exactly as loud as a live one and puts up a puff of smoke to mark where it landed. NPCs within 950u react to it as though it were real.

Nothing can tell the difference in the second and a half that matters.]]
att.Desc_Pros = {
    "uo.startles",
}
att.Desc_Cons = {
    "uo.nolethal",
    "uo.nofrag",
}
att.SortOrder = 2

att.Slot = "uo_variant"

att.ActivateElements = {"uo_m69"}

att.AutoStats = true

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 190
    rocket.GrenadeDamage = 14
    rocket.ExplosionShake = 12
    rocket.ExplosionSoundLevel = 150

    rocket.StartleRange = 950

    rocket.PostDetonation = function(ent)
        local pos = ent:GetPos()

        for _, e in ipairs(ents.FindInSphere(pos, ent.StartleRange or 950)) do
            if !IsValid(e) or !e:IsNPC() then continue end
            if e:Health() <= 0 or !e.SetSchedule then continue end

            if e.SetNPCState then e:SetNPCState(NPC_STATE_ALERT) end
            e:SetSchedule(SCHED_COWER)
        end
    end
end

    ArcCW.LoadAttachmentType(att, "uo_m67_m69")
end
-- END BUNDLED ATTACHMENT: uo_m67_m69.lua

-- BEGIN BUNDLED ATTACHMENT: uo_molotov_napalm.lua
do
    local att = {}

att.PrintName = "Gelled Petrol"
att.AbbrevName = "Gel"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Petrol thickened with dissolved polystyrene until it pours like syrup.

4 heavy patches over 80u instead of 7 over 110u, burning for 34 seconds rather than 14.

It sticks. Anything it catches burns for 12 seconds after leaving the fire, for 40 damage.

Throw distance 0.85. Small area, long burn, and running does not put it out.]]
att.Desc_Pros = {
    "uo.longburn",
    "uo.sticky",
}
att.Desc_Cons = {
    "uo.smallarea",
    "uo.heavy",
}
att.SortOrder = 2

att.Slot = "uo_concoction"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.85

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.FirePatches = 4
    rocket.FireSpread = 80

    rocket.FireTime = 34
    rocket.FireRadius = 130
    rocket.FireDamage = 9

    rocket.FireIgnite = 12
    rocket.FireIgniteDamage = 40

    rocket.GrenadeDamage = 20
    rocket.GrenadeRadius = 120
end

    ArcCW.LoadAttachmentType(att, "uo_molotov_napalm")
end
-- END BUNDLED ATTACHMENT: uo_molotov_napalm.lua

-- BEGIN BUNDLED ATTACHMENT: uo_molotov_spirit.lua
do
    local att = {}

att.PrintName = "Grain Alcohol"
att.AbbrevName = "Spirit"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Near-pure alcohol. Thin, and it goes up all at once.

10 patches spread over 220u, the widest of the four, plus a 200u vapour flash on impact for 45 damage.

It burns out in 6 seconds. Fire damage is only 3 a tick and anything it catches burns for 2.

Throw distance 1.1. This is for emptying a room you intend to walk straight into, not for denying one.]]
att.Desc_Pros = {
    "uo.widespread",
    "uo.concussive",
}
att.Desc_Cons = {
    "uo.shortburn",
}
att.Desc_Neutrals = {
    "uo.selfdanger",
}
att.SortOrder = 3

att.Slot = "uo_concoction"

att.AutoStats = true

att.Mult_MuzzleVelocity = 1.1

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.FirePatches = 10
    rocket.FireSpread = 220

    rocket.FireTime = 6
    rocket.FireRadius = 95
    rocket.FireDamage = 3

    rocket.FireIgnite = 2
    rocket.FireIgniteDamage = 14

    rocket.GrenadeDamage = 45
    rocket.GrenadeRadius = 200
end

    ArcCW.LoadAttachmentType(att, "uo_molotov_spirit")
end
-- END BUNDLED ATTACHMENT: uo_molotov_spirit.lua

-- BEGIN BUNDLED ATTACHMENT: uo_molotov_tar.lua
do
    local att = {}

att.PrintName = "Roofing Tar"
att.AbbrevName = "Tar"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Roofing tar cut with petrol. Thick, filthy, and it smokes heavily.

5 patches over 120u for 26 seconds, 5 damage a tick, and anything it catches burns for 7.

It also lays real smoke volumes as it burns, so it takes a room away and hides it at the same time. Nothing else in the pack does both.

Throw distance 0.9.]]
att.Desc_Pros = {
    "uo.smokescreen",
    "uo.longburn",
}
att.Desc_Cons = {
    "uo.smallarea",
}
att.Desc_Neutrals = {
    "uo.selfdanger",
}
att.SortOrder = 4

att.Slot = "uo_concoction"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.9

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.FirePatches = 5
    rocket.FireSpread = 120

    rocket.FireTime = 26
    rocket.FireRadius = 115
    rocket.FireDamage = 5

    rocket.FireIgnite = 7
    rocket.FireIgniteDamage = 26

    rocket.GrenadeDamage = 14
    rocket.GrenadeRadius = 110

    rocket.PostDetonation = function(ent)
        if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

        local pos = ent:GetPos()
        local attacker = ent:GetAttacker()

        for i = 1, 2 do
            local cloud = ents.Create("arccw_smoke")
            if !IsValid(cloud) then break end

            cloud:SetPos(pos + Vector(math.Rand(-30, 30), math.Rand(-30, 30), 6))
            cloud:SetOwner(attacker)
            cloud:Spawn()
        end

        timer.Simple(6, function()
            local cloud = ents.Create("arccw_smoke")
            if !IsValid(cloud) then return end

            cloud:SetPos(pos + Vector(0, 0, 6))
            if IsValid(attacker) then cloud:SetOwner(attacker) end
            cloud:Spawn()
        end)
    end
end

    ArcCW.LoadAttachmentType(att, "uo_molotov_tar")
end
-- END BUNDLED ATTACHMENT: uo_molotov_tar.lua

-- BEGIN BUNDLED ATTACHMENT: uo_pipebomb_flash.lua
do
    local att = {}

att.PrintName = "Flash Powder"
att.AbbrevName = "Flash"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Flash powder. Fast, loud, and it does not fragment.

1000 blast and 280 damage, the largest radius of any filling, with only 8 token fragments to 500u.

Fuse burns 0.6 as long, but the variance goes up to 2.4 seconds, which is the least predictable timer in the pack by a wide margin. You genuinely do not know when this one goes.

All blast, no shrapnel, and no idea when.]]
att.Desc_Pros = {
    "uo.concussive",
}
att.Desc_Cons = {
    "uo.nofrag",
    "uo.selfdanger",
}
att.Desc_Neutrals = {
    "uo.randomfuse",
}
att.SortOrder = 3

att.Slot = "uo_filling"

att.AutoStats = true

att.Mult_FuseTime = 0.6

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 1000
    rocket.GrenadeDamage = 280
    rocket.ExplosionShake = 65

    rocket.FragCount = 8
    rocket.FragDamage = 6
    rocket.FragRange = 500

    rocket.FuseVariance = 2.4
end

    ArcCW.LoadAttachmentType(att, "uo_pipebomb_flash")
end
-- END BUNDLED ATTACHMENT: uo_pipebomb_flash.lua

-- BEGIN BUNDLED ATTACHMENT: uo_pipebomb_nails.lua
do
    local att = {}

att.PrintName = "Black Powder & Nails"
att.AbbrevName = "Nails"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Black powder packed around a couple of handfuls of nails.

620 blast and only 120 damage, but 46 fragments at 24 damage carrying out to 2200u. That is more fragments, further, than anything else in the pack.

Fuse burns 0.75 as long with 1.2 seconds of variance.

Weak blast, lethal a very long way out. Throw it from behind something.]]
att.Desc_Pros = {
    "uo.frag",
}
att.Desc_Cons = {
    "uo.fastfuse",
}
att.Desc_Neutrals = {
    "uo.randomfuse",
}
att.SortOrder = 2

att.Slot = "uo_filling"

att.AutoStats = true

att.Mult_FuseTime = 0.75

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 620
    rocket.GrenadeDamage = 120

    rocket.FragCount = 46
    rocket.FragDamage = 24
    rocket.FragRange = 2200

    rocket.FuseVariance = 1.2
end

    ArcCW.LoadAttachmentType(att, "uo_pipebomb_nails")
end
-- END BUNDLED ATTACHMENT: uo_pipebomb_nails.lua

-- BEGIN BUNDLED ATTACHMENT: uo_pipebomb_thermite.lua
do
    local att = {}

att.PrintName = "Thermite Slurry"
att.AbbrevName = "Thermite"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Thermite slurry rather than an explosive filling.

420 blast, 90 damage, 6 token fragments. As a bomb it is poor.

What it does instead is scatter burning thermite over the area and set fire to it.

Fuse burns 1.25 as long with 1.5 seconds of variance, so it is the slowest and among the least reliable.

Area denial, not a kill.]]
att.Desc_Pros = {
    "uo.incendiary",
}
att.Desc_Cons = {
    "uo.nofrag",
}
att.Desc_Neutrals = {
    "uo.slowfuse",
    "uo.randomfuse",
}
att.SortOrder = 4

att.Slot = "uo_filling"

att.AutoStats = true

att.Mult_FuseTime = 1.25

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 420
    rocket.GrenadeDamage = 90
    rocket.GrenadeDamageType = DMG_BLAST + DMG_BURN

    rocket.FragCount = 6
    rocket.FragDamage = 4
    rocket.FragRange = 400

    rocket.FuseVariance = 1.5

    rocket.PostDetonation = function(ent)
        if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

        local pos = ent:GetPos()
        local attacker = ent:GetAttacker()

        for i = 1, 9 do
            local dir = (Vector(0, 0, 1) + VectorRand() * 1.2):GetNormalized()

            local tr = util.TraceLine({
                start = pos,
                endpos = pos + dir * 200,
                mask = MASK_SOLID_BRUSHONLY,
                filter = ent,
            })

            local fire = ents.Create("arccw_uo_dev_fire")
            if !IsValid(fire) then break end

            fire:SetPos(tr.HitPos + tr.HitNormal * 4)
            fire:SetOwner(attacker)
            fire.FireTime = 18
            fire:Spawn()

            local phys = fire:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocityInstantaneous(dir * math.Rand(80, 220))
            end
        end
    end
end

    ArcCW.LoadAttachmentType(att, "uo_pipebomb_thermite")
end
-- END BUNDLED ATTACHMENT: uo_pipebomb_thermite.lua

-- BEGIN BUNDLED ATTACHMENT: uo_rg14_sleeve.lua
do
    local att = {}

att.PrintName = "Fragmentation Sleeve"
att.AbbrevName = "Sleeve"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[The cast iron jacket every RG-14 was issued with. It slides over the body and clips shut.

Turns an offensive grenade into a defensive one: 460 blast and 140 damage, down from 560 and 175, but 42 fragments at 21 damage carrying to 1900u instead of 8 token ones to 400u.

Throw distance 0.72. The sleeve nearly doubles the weight and this was never a heavy grenade.

Bare it is thrown while advancing. Sleeved it is thrown from behind something.]]
att.Desc_Pros = {
    "uo.frag",
}
att.Desc_Cons = {
    "uo.heavy",
    "uo.selfdanger",
}
att.SortOrder = 2

att.Slot = "uo_sleeve"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.72

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.GrenadeRadius = 460
    rocket.GrenadeDamage = 140
    rocket.GrenadeDamageType = DMG_BLAST

    rocket.FragCount = 42
    rocket.FragDamage = 21
    rocket.FragRange = 1900

    rocket.PhysMass = 0.75
end

    ArcCW.LoadAttachmentType(att, "uo_rg14_sleeve")
end
-- END BUNDLED ATTACHMENT: uo_rg14_sleeve.lua

-- BEGIN BUNDLED ATTACHMENT: uo_type4_ko.lua
do
    local att = {}

att.PrintName = "Kou Hydrogen Cyanide"
att.AbbrevName = "Kou"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[The anti-armour loading. Liquid hydrogen cyanide instead of picric acid, meant to be smashed against a tank's vision block.

No bursting charge at all. The pot is the whole delivery system, so there is no blast, no shards and no explosion effect.

Instead it vents for 9 seconds: 16 damage a tick out to 210u, to anything with line of sight to it.

The pot gives up at 0.55 of its usual impact speed, so breaking it early is easy and is the intended use. Throw it hard.

The cloud is colourless and near silent. There is no warning that you are standing in it, but it is gone in 9 seconds, so it will not deny a corridor the way the tabun canister does.]]
att.Desc_Pros = {
    "uo.poisongas",
    "uo.invisiblegas",
}
att.Desc_Cons = {
    "uo.nofrag",
    "uo.shortgas",
    "uo.smallarea",
}
att.SortOrder = 2

att.Slot = "uo_filling_type4"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.94

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.HCN = true

    rocket.GrenadeRadius = 0
    rocket.GrenadeDamage = 0
    rocket.ExplosionEffect = false
    rocket.ExplosionShake = 0
    rocket.Scorch = false
    rocket.DebrisSounds = false
    rocket.ShardCount = 0

    rocket.BurnTime = 9
    rocket.GasRadius = 210
    rocket.GasDamage = 16
    rocket.GasInterval = 0.4
    rocket.GasHold = 2.5

    rocket.ShatterMult = 0.55
end

    ArcCW.LoadAttachmentType(att, "uo_type4_ko")
end
-- END BUNDLED ATTACHMENT: uo_type4_ko.lua

-- BEGIN BUNDLED ATTACHMENT: uo_ware_bizen.lua
do
    local att = {}

att.PrintName = "Bizen Ware"
att.AbbrevName = "Bizen"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Unglazed stoneware, fired hard and left rough. The walls are visibly thicker than the porcelain.

Breaks at 400 impact speed instead of 265, so you can throw this properly at a wall and still get the fuse and the fragmentation. It is the only Type 4 you can throw like a normal grenade.

40 shards at 11 damage to 400u, up from 30 at 10.

Throw distance 0.84. Thick stoneware is heavy and it does not go far.]]
att.Desc_Pros = {
    "uo.frag",
    "uo.tough",
}
att.Desc_Cons = {
    "uo.heavy",
}
att.SortOrder = 2

att.Slot = "uo_ware"

att.AutoStats = true

att.Mult_MuzzleVelocity = 0.84

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.ShatterSpeed = 400

    rocket.ShardCount = 40
    rocket.ShardDamage = 11
    rocket.ShardRange = 400

    rocket.PhysMass = 0.8
end

    ArcCW.LoadAttachmentType(att, "uo_ware_bizen")
end
-- END BUNDLED ATTACHMENT: uo_ware_bizen.lua

-- BEGIN BUNDLED ATTACHMENT: uo_ware_seto.lua
do
    local att = {}

att.PrintName = "Seto Ware"
att.AbbrevName = "Seto"
att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
att.Description = [[Thin-walled porcelain, turned as light as the potters could manage.

Breaks at 170 impact speed, so any direct throw into geometry breaks it. In practice this is not a timed grenade at all: it is a guaranteed contact burst, at the small charge a broken pot delivers.

22 shards at 9 damage to 460u, down from 30 at 10.

Throw distance 1.16, the furthest of the three.

Getting the fuse out of a Seto pot means the underarm roll onto open ground.]]
att.Desc_Pros = {
    "uo.longthrow",
}
att.Desc_Cons = {
    "uo.fragile",
    "uo.smallcharge",
}
att.SortOrder = 3

att.Slot = "uo_ware"

att.AutoStats = true

att.Mult_MuzzleVelocity = 1.16

att.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    rocket.ShatterSpeed = 170

    rocket.ShardCount = 22
    rocket.ShardDamage = 9
    rocket.ShardRange = 460

    rocket.PhysMass = 0.4
end

    ArcCW.LoadAttachmentType(att, "uo_ware_seto")
end
-- END BUNDLED ATTACHMENT: uo_ware_seto.lua
