AddCSLuaFile()
UCIgla = UCIgla or {}
local I = UCIgla

I.Rounds = {
    ir = {
        name = "9M39 IR",
        skin = 0,
        damage = 520,
        radius = 230,
        speed = 11500,
        ignition = 0.25,
        lock = 1.8,
        cone = 6,
        fuse = 100,
        turn = 100,
        range = 24000,
    },
    laser = {
        name = "Heavy / LASER",
        skin = 1,
        damage = 900,
        radius = 155,
        speed = 7000,
        ignition = 0.15,
        lock = 0,
        cone = 6,
        fuse = 0,
        turn = 65,
        range = 17000,
    },
    passive = {
        name = "Semi-active RADAR",
        skin = 2,
        damage = 520,
        radius = 210,
        speed = 13500,
        ignition = 0.18,
        lock = 1.1,
        cone = 3.5,
        fuse = 85,
        turn = 110,
        range = 25000,
    },
    active = {
        name = "Autonomous RADAR",
        skin = 3,
        damage = 360,
        radius = 180,
        speed = 15000,
        ignition = 0.12,
        lock = 0,
        cone = 12,
        fuse = 75,
        turn = 125,
        range = 25000,
    },
}
I.AirNPCs = { npc_helicopter = true, npc_combinegunship = true, npc_combinedropship = true }
function I.Target(ent)
    if not IsValid(ent) then
        return false
    end
    if ent:GetNW2Bool("UCIglaDecoy", false) then
        return false
    end
    if ent:IsNPC() and ent:Health() <= 0 then
        return false
    end
    if ent:GetNW2Bool("UCIglaTarget", false) then
        return true
    end
    if ent:IsVehicle() or I.AirNPCs[ent:GetClass()] then
        return true
    end
    local c = string.lower(ent:GetClass())
    return ent.LFS
        or ent.LVS
        or ent.IsAircraft
        or ent.Drone
        or string.StartWith(c, "lfs_")
        or string.StartWith(c, "lvs_")
        or string.StartWith(c, "wac_")
end
function I.Point(ent)
    return ent:WorldSpaceCenter()
end
function I.Visible(from, ent, filter)
    local tr = util.TraceLine({ start = from, endpos = I.Point(ent), filter = filter, mask = MASK_SHOT })
    return not tr.Hit or tr.Entity == ent
end
function I.Friendly(owner, ent)
    if not IsValid(owner) then
        return false
    end
    if ent == owner or ent:GetOwner() == owner then
        return true
    end
    local driver = ent.GetDriver and ent:GetDriver()
    if IsValid(driver) then
        if driver == owner then
            return true
        end
        if
            owner:IsPlayer()
            and driver:IsPlayer()
            and owner:Team() ~= TEAM_UNASSIGNED
            and driver:Team() == owner:Team()
        then
            return true
        end
    end
    return false
end
function I.Profile(wep)
    local kind = wep:GetBuff_Override("Override_UCIglaRound") or "ir"
    return I.Rounds[kind] or I.Rounds.ir, kind
end
function I.Turn(direction, desired, degrees)
    local dot = math.Clamp(direction:Dot(desired), -1, 1)
    local angle = math.acos(dot)
    if angle < 0.0001 then
        return desired
    end
    local t = math.min(1, math.rad(degrees) / angle)

    if dot < -0.999 then
        return direction
    end
    return (
        direction * (math.sin((1 - t) * angle) / math.sin(angle))
        + desired * (math.sin(t * angle) / math.sin(angle))
    ):GetNormalized()
end

I.SoundReplacements = {
    insert = "uc_igla/insert.wav",
    insert_slide = "uc_igla/insert_slide.wav",
    slide = "uc_igla/insert_slide.wav",
    mech = "uc_igla/mech.wav",
}
function I.Sound(sample)
    return I.SoundReplacements[sample] or ("igla/" .. sample .. ".wav")
end
local events = {
    ready = "retract",
    clank = "clank",
    insert = "insert",
    slide = "slide",
    insert_2 = "second_insert",
    click = "click",
    return_ = "return",
    Draw = "draw",
    Holster = "holster",
}
for event, sample in pairs(events) do
    sound.Add({
        name = "UCIg." .. (event == "return_" and "return" or event),
        channel = I.SoundReplacements[sample] and CHAN_AUTO or CHAN_ITEM,
        volume = 0.7,
        level = 65,
        pitch = 100,
        sound = I.Sound(sample),
    })
end
game.AddParticles("particles/iw4_rockettrail.pcf")
game.AddParticles("particles/uc_igla_explosion.pcf")
PrecacheParticleSystem("rockettrail_smoke")
PrecacheParticleSystem("uc_igla_explosion_flash")

if SERVER then
    util.AddNetworkString("UCIglaExplosion")
end
if CLIENT then
    killicon.Add("arccw_uc_igla", "arccw/weaponicons/arccw_uc_igla", Color(255, 255, 255))
    killicon.Add("arccw_uc_igla_missile", "arccw/weaponicons/arccw_uc_igla", Color(255, 255, 255))
    net.Receive("UCIglaExplosion", function()
        local pos = net.ReadVector()
        local distance = LocalPlayer():EyePos():Distance(pos)
        local band = distance < 2000 and "close"
            or distance < 4000 and "medium_close"
            or distance < 6000 and "medium"
            or "far"
        local sample = "igla/explosion_" .. band .. "_" .. math.random(0, 2) .. ".wav"
        timer.Simple(math.min(distance / 13500, 2), function()
            sound.Play(sample, pos, 140, 100, 1)
        end)
    end)
end
