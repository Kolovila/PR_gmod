ArcCW = ArcCW or {}
ArcCW.UO = ArcCW.UO or {}

local UO = ArcCW.UO

UO.Version = 2

CreateConVar("arccw_uo_damagemult", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Damage multiplier for all Urban Ordnance explosives.")
CreateConVar("arccw_uo_placedlife", 300, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Seconds a placed Urban Ordnance device stays in the world. 0 for forever.")
CreateConVar("arccw_uo_placedkillable", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Placed Urban Ordnance devices can be shot and destroyed.")
CreateConVar("arccw_uo_incendiary", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Incendiary Urban Ordnance may create persistent fire.")

function UO.DamageMult()
    local cv = GetConVar("arccw_uo_damagemult")
    return cv and math.Clamp(cv:GetFloat(), 0, 100) or 1
end

local modelcache = {}

function UO.Model(...)
    local args = {...}
    for _, mdl in ipairs(args) do
        if !isstring(mdl) or mdl == "" then continue end
        local c = modelcache[mdl]
        if c == nil then
            c = util.IsValidModel(mdl)
            modelcache[mdl] = c
        end
        if c then return mdl end
    end
    return args[#args] or "models/weapons/w_grenade.mdl"
end

local soundcache = {}

local function rawpath(str)
    return (string.gsub(str, "^[^%w]+", ""))
end

function UO.Sound(...)
    local args = {...}
    for _, snd in ipairs(args) do
        local check = istable(snd) and snd[1] or snd
        if !isstring(check) or check == "" then continue end
        local c = soundcache[check]
        if c == nil then
            c = file.Exists("sound/" .. rawpath(check), "GAME")
            soundcache[check] = c
        end
        if c then return snd end
    end
    return args[#args]
end

function UO.PickSound(snd)
    if istable(snd) then return snd[math.random(#snd)] end
    return snd
end

local uo = "arccw_uo/common/"
local uc = "arccw_uc/common/"

UO.Snd = {}

UO.Snd.Rattle = {uc .. "cloth_1.ogg", uc .. "cloth_2.ogg", uc .. "cloth_3.ogg", uc .. "cloth_4.ogg", uc .. "cloth_6.ogg", uc .. "rattle.ogg"}
UO.Snd.PinPull = uo .. "pinpull.ogg"
UO.Snd.SpoonEject = uo .. "spooneject.ogg"

UO.Snd.FusePop = {}
UO.Snd.FusePopHeld = {}
for i = 1, 10 do
    UO.Snd.FusePop[i] = uo .. string.format("fuse-pop-%02d.ogg", i)
    UO.Snd.FusePopHeld[i] = uo .. string.format("fuse-pop-held-%02d.ogg", i)
end

UO.Snd.Explosion = {uc .. "explosion-close-01.ogg", uc .. "explosion-close-02.ogg"}
UO.Snd.ExplosionIn = {uc .. "explosion-close-int-01.ogg", uc .. "explosion-close-int-02.ogg", uc .. "explosion-close-int-03.ogg", uc .. "explosion-close-int-04.ogg"}
UO.Snd.Debris = {uc .. "debris-01.ogg", uc .. "debris-02.ogg", uc .. "debris-03.ogg", uc .. "debris-04.ogg", uc .. "debris-05.ogg"}

UO.Snd.Throw = UO.Sound("nades/f1/m67_throw_01.wav", "weapons/arccw/melee_lift.wav")

UO.Snd.BounceHard = {"physics/metal/metal_grenade_impact_hard1.wav", "physics/metal/metal_grenade_impact_hard2.wav", "physics/metal/metal_grenade_impact_hard3.wav"}
UO.Snd.BounceSoft = {"physics/metal/metal_grenade_impact_soft1.wav", "physics/metal/metal_grenade_impact_soft2.wav", "physics/metal/metal_grenade_impact_soft3.wav"}

local traces1 = {
    {Distance = Vector(0, 0, 1024), Influence = 1},
}

local traces2 = {
    {Distance = Vector(0, 0, 1024), Influence = 1},
    {Distance = Vector(768, 768, 0), Influence = 0.5},
    {Distance = Vector(-768, 768, 0), Influence = 0.5},
}

local traces3 = {
    {Distance = Vector(0, 0, 1024), Influence = 0.5},
    {Distance = Vector(0, 768, 768), Influence = 1},
    {Distance = Vector(0, -768, 768), Influence = 1},
    {Distance = Vector(0, 768, 0), Influence = 0.5},
    {Distance = Vector(768, 768, 0), Influence = 0.5},
    {Distance = Vector(-768, 768, 0), Influence = 0.5},
}

local traces4 = {
    {Distance = Vector(0, 0, 1024), Influence = 0.5},
    {Distance = Vector(0, 768, 768), Influence = 1},
    {Distance = Vector(0, -768, 768), Influence = 1},
    {Distance = Vector(0, 768, 0), Influence = 0.5},
    {Distance = Vector(0, -1024, 0), Influence = 0.5},
    {Distance = Vector(768, 768, 0), Influence = 0.5},
    {Distance = Vector(-768, 768, 0), Influence = 0.5},
    {Distance = Vector(-768, -768, 0), Influence = 0.5},
    {Distance = Vector(768, -768, 0), Influence = 0.5},
}

local choice = {traces1, traces2, traces3, traces4}

local tracebase = {
    start = vector_origin,
    endpos = vector_origin,
    filter = NULL,
    mask = MASK_SOLID_BRUSHONLY,
}

function UO.Openness(pos, filter, quality)
    local set = choice[quality or 3] or traces3
    local vol, influ = 0, 0

    for _, tin in ipairs(set) do
        tracebase.start = pos
        tracebase.endpos = pos + tin.Distance
        tracebase.filter = filter

        influ = influ + tin.Influence

        local result = util.TraceLine(tracebase)
        vol = vol + (result.HitSky and 1 or result.Fraction) * tin.Influence
    end

    if influ == 0 then return 1 end
    return vol / influ
end

function UO.InnyOuty(ent, pos)
    if CLIENT then return end
    if !IsValid(ent) then return end

    pos = pos or ent:GetPos()

    local so = ent.ExplosionSounds
    local si = ent.ExplosionSoundsIndoors
    if !so and !si then return end

    local lvl = ent.ExplosionSoundLevel or 140
    local vol = UO.Openness(pos, ent, ent.ExplosionTraceQuality)

    if so then
        local v = math.Clamp(vol * 1.4, 0, 1)
        if v > 0.15 then sound.Play(UO.PickSound(so), pos, lvl, math.random(97, 103), v) end
    end

    if si then
        local v = math.Clamp((1 - vol) * 1.4, 0, 1)
        if v > 0.15 then sound.Play(UO.PickSound(si), pos, lvl, math.random(97, 103), v) end
    end
end

function UO.IsTarget(ent)
    if !IsValid(ent) then return false end
    if ent:IsPlayer() then return ent:Alive() end
    if ent:IsNPC() or ent:IsNextBot() then return ent:Health() > 0 end
    return false
end

function UO.FindTargets(pos, radius, ignore)
    local out = {}
    for _, ent in ipairs(ents.FindInSphere(pos, radius)) do
        if ent == ignore then continue end
        if !UO.IsTarget(ent) then continue end
        out[#out + 1] = ent
    end
    return out
end

function UO.NearestTarget(pos, radius, ignore, los)
    local best, bestdist
    for _, ent in ipairs(UO.FindTargets(pos, radius, ignore)) do
        local d = ent:WorldSpaceCenter():DistToSqr(pos)
        if bestdist and d >= bestdist then continue end
        if los then
            local tr = util.TraceLine({
                start = los,
                endpos = ent:WorldSpaceCenter(),
                filter = ignore,
                mask = MASK_SHOT,
            })
            if tr.Entity != ent and tr.Fraction < 0.95 then continue end
        end
        best, bestdist = ent, d
    end
    return best
end

function UO.EyePos(ent)
    if ent.EyePos then return ent:EyePos() end
    return ent:WorldSpaceCenter()
end

function UO.BustDoors(inflictor, pos, radius)
    if CLIENT then return end
    if !ArcCW.DoorBust then return end

    local r2 = (radius / 3.5) ^ 2

    for _, ent in ipairs(ents.FindByClass("prop_door_rotating")) do
        if ent:GetPos():DistToSqr(pos) > r2 then continue end

        local trace = util.TraceLine({
            start = pos + Vector(0, 0, 15),
            endpos = ent:LocalToWorld(Vector(0, 25, 0)),
            filter = inflictor,
        })

        if trace.Entity == ent then
            ArcCW.DoorBust(ent, (ent:GetPos() - pos):GetNormalized() * 400)
        end
    end
end

function UO.Blast(inflictor, attacker, pos, radius, damage, dmgtype)
    if CLIENT then return end
    if radius <= 0 or damage <= 0 then return end

    damage = damage * UO.DamageMult()

    inflictor = IsValid(inflictor) and inflictor or game.GetWorld()
    attacker = IsValid(attacker) and attacker or inflictor

    if dmgtype then
        local d = DamageInfo()
        d:SetInflictor(inflictor)
        d:SetAttacker(attacker)
        d:SetDamage(damage)
        d:SetDamageType(dmgtype)
        util.BlastDamageInfo(d, pos, radius)
    else
        util.BlastDamage(inflictor, attacker, pos, radius, damage)
    end

    UO.BustDoors(inflictor, pos, radius)
end

function UO.Shrapnel(ent, attacker, num, damage, range, dir, spread)
    if CLIENT then return end
    if !IsValid(ent) then return end

    num = num or 20
    damage = (damage or 8) * UO.DamageMult()
    range = range or 1024
    spread = spread or 1

    attacker = IsValid(attacker) and attacker or ent
    local src = ent:GetPos()

    for i = 1, num do
        local d
        if dir then
            d = dir + VectorRand() * spread
        else
            local ang = (i / num) * math.pi * 2
            d = Vector(math.sin(ang), math.cos(ang), 0) + VectorRand() * Vector(0.35, 0.35, 0.5)
        end
        d:Normalize()

        ent:FireBullets({
            Attacker = attacker,
            Inflictor = ent,
            Src = src,
            Dir = d,
            Damage = damage,
            Force = damage * 0.5,
            Num = 1,
            Tracer = 0,
            Distance = range,
            HullSize = 2,
        })
    end
end

function UO.Flash(pos, attacker, power, maxtime)
    if CLIENT then return end

    power = power or 640
    maxtime = maxtime or 3

    for _, ent in ipairs(ents.FindInSphere(pos, power)) do
        if !UO.IsTarget(ent) then continue end

        local eye = UO.EyePos(ent)
        local dist = eye:Distance(pos)

        local tr = util.TraceLine({
            start = pos,
            endpos = eye,
            filter = function(e) return e != ent end,
            mask = MASK_OPAQUE,
        })
        if tr.Hit then continue end

        local facing = 1
        if ent:IsPlayer() then
            facing = math.Clamp(((pos - eye):GetNormalized():Dot(ent:EyeAngles():Forward()) + 1) * 0.5, 0, 1)
        end

        local falloff = 1 - math.Clamp(dist / power, 0, 1)
        local time = maxtime * falloff * Lerp(facing, 0.25, 1)

        if time <= 0.05 then continue end

        if ent:IsPlayer() then
            ent:ScreenFade(SCREENFADE.IN, Color(255, 255, 255, 255), math.min(time, 1.5), time)
            ent:SetDSP(37, false)
        elseif ent.SetSchedule then
            ent.ArcCW_UO_Flashed = CurTime() + time
            if ent.SetNPCState then ent:SetNPCState(NPC_STATE_ALERT) end

            local id = "ArcCW_UO_Flash_" .. ent:EntIndex()
            timer.Create(id, 0.25, math.ceil(time / 0.25), function()
                if !IsValid(ent) or !ent.SetSchedule then timer.Remove(id) return end
                ent:SetSchedule(SCHED_COWER)
            end)
        end
    end
end

UO.Particles = {
    Grenade = "explosion_grenade_fas2",
    HE = "explosion_he_grenade_fas2",
    Big = "explosion_HE_m79_fas2",
    Directional = "explosion_HE_claymore_fas2",
}

function UO.Explosion(pos, particle, water)
    if water then
        local ed = EffectData()
        ed:SetOrigin(pos)
        util.Effect("WaterSurfaceExplosion", ed)
        return
    end

    ParticleEffect(particle or UO.Particles.Grenade, pos, Angle(-90, 0, 0))
end

function UO.Sparks(pos, normal, mag, scale)
    local ed = EffectData()
    ed:SetOrigin(pos)
    ed:SetNormal(normal or vector_up)
    ed:SetMagnitude(mag or 3)
    ed:SetScale(scale or 1)
    ed:SetRadius(mag or 3)
    util.Effect("Sparks", ed)
end

if SERVER then
    util.AddNetworkString("ArcCW_UO_Sensor")
end

UO.SensorTargets = UO.SensorTargets or {}

if SERVER then
    function UO.SensorPing(tagged, duration, recipients)
        local num = math.min(#tagged, 64)
        if num == 0 then return end

        net.Start("ArcCW_UO_Sensor", true)
            net.WriteUInt(num, 7)
            for i = 1, num do
                net.WriteUInt(tagged[i]:EntIndex(), MAX_EDICT_BITS)
            end
            net.WriteFloat(duration)
        if recipients then
            net.Send(recipients)
        else
            net.Broadcast()
        end
    end
else
    net.Receive("ArcCW_UO_Sensor", function()
        local num = net.ReadUInt(7)
        local list = {}
        for i = 1, num do
            list[i] = net.ReadUInt(MAX_EDICT_BITS)
        end
        local duration = net.ReadFloat()

        local expiry = CurTime() + duration
        for _, idx in ipairs(list) do
            local ent = Entity(idx)
            if IsValid(ent) then UO.SensorTargets[ent] = expiry end
        end
    end)

    local halocol = Color(80, 200, 255)

    hook.Add("PreDrawHalos", "ArcCW_UO_Sensor", function()
        local live = {}

        for ent, t in pairs(UO.SensorTargets) do
            if !IsValid(ent) or t < CurTime() then
                UO.SensorTargets[ent] = nil
                continue
            end
            live[#live + 1] = ent
        end

        if #live == 0 then return end

        halo.Add(live, halocol, 2, 2, 1, true, true)
    end)
end

if SERVER then
    util.AddNetworkString("ArcCW_UO_Gas")

    function UO.Gas(ply, duration)
        if !IsValid(ply) or !ply:IsPlayer() then return end

        net.Start("ArcCW_UO_Gas", true)
            net.WriteFloat(duration)
        net.Send(ply)
    end
else
    UO.GasUntil = UO.GasUntil or 0
    UO.GasPeak = UO.GasPeak or 1

    net.Receive("ArcCW_UO_Gas", function()
        local d = net.ReadFloat()
        UO.GasUntil = math.max(UO.GasUntil or 0, CurTime() + d)
        UO.GasPeak = d
    end)

    hook.Add("RenderScreenspaceEffects", "ArcCW_UO_Gas", function()
        local left = (UO.GasUntil or 0) - CurTime()
        if left <= 0 then return end

        local f = math.Clamp(left / math.max(UO.GasPeak or 1, 0.1), 0, 1)

        DrawMotionBlur(0.45, 0.72 * f, 0.008)

        DrawColorModify({
            ["$pp_colour_addr"] = 0.015 * f,
            ["$pp_colour_addg"] = 0.04 * f,
            ["$pp_colour_addb"] = 0.015 * f,
            ["$pp_colour_brightness"] = 0.02 * f,
            ["$pp_colour_contrast"] = 1 - (0.3 * f),
            ["$pp_colour_colour"] = 1 - (0.6 * f),
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0,
        })
    end)
end

if CLIENT then

    local function closecustomise()
        if !ArcCW.InvHUD or !IsValid(ArcCW.InvHUD) then return end
        ArcCW.InvHUD:Remove()
    end

    hook.Add("EntityRemoved", "ArcCW_UO_CustomiseGuard", function(ent)
        if !ArcCW.InvHUD or !IsValid(ArcCW.InvHUD) then return end

        local ply = LocalPlayer()
        if !IsValid(ply) then return end
        if ent != ply:GetActiveWeapon() then return end

        closecustomise()
    end)

    hook.Add("Think", "ArcCW_UO_CustomiseGuard", function()
        if !ArcCW.InvHUD or !IsValid(ArcCW.InvHUD) then return end

        local ply = LocalPlayer()
        if !IsValid(ply) then return end
        if ply:Alive() and IsValid(ply:GetActiveWeapon()) then return end

        closecustomise()
    end)

end

function UO.DetonateRemote(owner, class)
    if CLIENT then return 0 end
    if !IsValid(owner) then return 0 end

    local list = ents.FindByClass(class)
    local n = 0

    table.sort(list, function(a, b) return (a.SpawnTime or 0) < (b.SpawnTime or 0) end)

    for i, ent in ipairs(list) do
        if !IsValid(ent) then continue end
        if ent:GetOwner() != owner then continue end
        if !ent.RemoteDetonate then continue end

        local delay = n * 0.06
        n = n + 1

        if delay <= 0 then
            ent:RemoteDetonate()
        else
            timer.Simple(delay, function()
                if IsValid(ent) then ent:RemoteDetonate() end
            end)
        end
    end

    return n
end

function UO.PlacedLife()
    local cv = GetConVar("arccw_uo_placedlife")
    local v = cv and cv:GetFloat() or 300
    if v <= 0 then return math.huge end
    return v
end
