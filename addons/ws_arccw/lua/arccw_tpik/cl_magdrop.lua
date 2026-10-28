ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

local cv

local LIFETIME = 12
local FADE = 2
local GRAVITY = 600
local BOUNCE = 0.2
local FRICTION = 5
local REST_SPEED = 20
local MAX_DROPS = 24

local HULL = 1
local REST_HEIGHT = 0.8

local SAMPLES = 5
local LONG_ENOUGH = 1.5

local VEC_ZERO = Vector(0, 0, 0)

local drops = {}

local function has(path, word)
    return string.find(path, word, 1, true) ~= nil
end

local function classify(path)
    if not isstring(path) then return nil end

    path = string.lower(path)

    if has(path, "mag") and (has(path, "drop") or has(path, "fall")) then
        return "mag"
    end

    if has(path, "toss") or has(path, "discard") then return "weapon" end

    if has(path, "insert") then return nil end

    if has(path, "casing") or has(path, "brass") then return "case" end

    if has(path, "shell")
        and (has(path, "eject") or has(path, "drop") or has(path, "fall") or has(path, "out"))
    then
        return "case"
    end

    return nil
end

local function entryKind(entry)
    local s = entry.s
    local kind = classify(s)
    if kind then return kind end

    if istable(s) then
        for _, one in ipairs(s) do
            kind = classify(one)
            if kind then return kind end
        end
    end

    return nil
end

local cueCache = {}

local function cuesFor(wep)
    local class = string.lower(wep:GetClass() or "")
    local cached = cueCache[class]
    if cached then return cached end

    local out = {}

    for key, anim in pairs(wep.Animations or {}) do
        if istable(anim) and istable(anim.SoundTable) then
            local best, bestKind

            for _, entry in pairs(anim.SoundTable) do
                if istable(entry) and isnumber(entry.t) then
                    local kind = entryKind(entry)

                    if kind and (not best or entry.t < best) then
                        best, bestKind = entry.t, kind
                    end
                end
            end

            if bestKind == "weapon" then
                local clip = tonumber(wep.Primary and wep.Primary.ClipSize) or 0
                if clip > 1 then best = nil end
            end

            if bestKind == "case" and anim.ShellEjectAt then best = nil end

            if best then out[key] = {t = best, kind = bestKind} end
        end
    end

    cueCache[class] = out

    return out
end

function TPIK.ClearMagDropCache()
    cueCache = {}
end

local function isCaseBone(name)
    return has(name, "shell") or has(name, "casing") or has(name, "case")
end

local boneCache = {}

local function classifyBones(ent)
    local mdl = ent:GetModel() or ""
    local cached = boneCache[mdl]
    if cached then return cached end

    local out = {}

    for i = 0, (ent:GetBoneCount() or 0) - 1 do
        local name = string.lower(ent:GetBoneName(i) or "")

        if name ~= "" and TPIK.IsAutoPropBone(name) then
            out[#out + 1] = {
                index = i,
                isMag = TPIK.IsMagBone(name),
                isSpare = TPIK.IsSpareMagBone(name),
                isCase = isCaseBone(name),
                isProjectile = TPIK.IsProjectileBone(name)
            }
        end
    end

    boneCache[mdl] = out

    return out
end

local function pickBones(source, kind)
    if kind == "weapon" then
        local roots = {}

        for i = 0, (source:GetBoneCount() or 0) - 1 do
            local name = source:GetBoneName(i) or ""

            if name ~= "" and source:GetBoneParent(i) < 0 and not TPIK.IsCharacterBone(name) then
                roots[#roots + 1] = i
            end
        end

        if #roots == 0 then return nil end

        return roots
    end

    local bones = classifyBones(source)
    local list = {}

    for i = 1, #bones do
        local bone = bones[i]
        local want

        if kind == "mag" then
            want = bone.isMag and not bone.isSpare
        else
            want = bone.isCase and not bone.isSpare and not bone.isProjectile
        end

        if want then list[#list + 1] = bone.index end
    end

    if #list == 0 then return nil end

    return list
end

local function subtreeOf(ent, roots, stop)
    local keep = {}
    for _, r in ipairs(roots) do keep[r] = true end

    for i = 0, (ent:GetBoneCount() or 0) - 1 do
        local parent = ent:GetBoneParent(i)

        if parent and parent >= 0 and keep[parent] and not (stop and stop[i]) then
            keep[i] = true
        end
    end

    return keep
end

local function stopSet(ent, kind)
    local test

    if kind == "case" then
        test = TPIK.IsProjectileBone
    elseif kind == "weapon" then
        test = TPIK.IsCharacterBone
    else
        return nil
    end

    local stop = {}

    for i = 0, (ent:GetBoneCount() or 0) - 1 do
        local name = ent:GetBoneName(i) or ""
        if name ~= "" and test(name) then stop[i] = true end
    end

    return stop
end

local function attachedModels(keep, drop, source, list, boneField)
    if not istable(list) then return end

    for _, element in pairs(list) do
        local model = element.Model

        if IsValid(model) and not element.NoDraw and not element.IsBaseWM then
            local boneName = element[boneField] or element.Bone

            if isstring(boneName) then
                local idx = source:LookupBone(boneName)

                if idx and keep[idx] then
                    local clone = ClientsideModel(model:GetModel(), RENDERGROUP_OPAQUE)

                    if IsValid(clone) then
                        clone:SetSkin(model:GetSkin())

                        for i = 0, model:GetNumBodyGroups() - 1 do
                            clone:SetBodygroup(i, model:GetBodygroup(i))
                        end

                        clone:SetPos(model:GetPos())
                        clone:SetAngles(model:GetAngles())

                        drop.extra = drop.extra or {}
                        drop.extra[#drop.extra + 1] = {
                            ent = clone,
                            pos = drop.ent:WorldToLocal(model:GetPos()),
                            ang = drop.ent:WorldToLocalAngles(model:GetAngles())
                        }
                    end
                end
            end
        end
    end
end

local pending = {}

local function measureDrop(source, list, kind)
    local keep = subtreeOf(source, list, stopSet(source, kind))

    local points = {}

    for idx in pairs(keep) do
        local mat = source:GetBoneMatrix(idx)
        if mat then points[#points + 1] = mat:GetTranslation() end
    end

    if #points == 0 then return nil end

    local sum = Vector(0, 0, 0)
    for _, p in ipairs(points) do sum = sum + p end

    local origin = sum / #points

    local far1, far2, spread = nil, nil, 0

    for i = 1, #points do
        for j = i + 1, #points do
            local d = points[i]:Distance(points[j])

            if d > spread then
                spread, far1, far2 = d, points[i], points[j]
            end
        end
    end

    local ang = source:GetAngles()

    local shape = {
        keep = keep,

        localOffset = WorldToLocal(origin, angle_zero, source:GetPos(), ang)
    }

    if far1 and far2 and spread > 0.5 then
        local axis = (far2 - far1):GetNormalized()

        shape.localAxis = WorldToLocal(origin + axis, angle_zero, origin, ang)
        shape.half = spread * 0.5

        shape.radius = math.Clamp(spread * 0.08, HULL, 3)
    end

    return shape
end

local function ubglCaseSource(wep, boneField)
    local atts = wep.Attachments
    if not istable(atts) then return nil end

    local key = boneField == "WMBone" and "WElement" or "VElement"
    local attTable = ArcCW and ArcCW.AttachmentTable

    for _, slot in pairs(atts) do
        local att = slot.Installed and attTable and attTable[slot.Installed]
        local ejects = slot.Installed and
            (TPIK.UBGLCaseAtts[slot.Installed] or (att and att.TPIK_DropsCase))

        if ejects then
            local element = slot[key]
            local model = element and element.Model

            if IsValid(model) then
                local list = pickBones(model, "case")
                if list then return model, list end
            end
        end
    end

    return nil
end

local function ubglCaseTick(wep, ply, boneField)
    local seq = wep.LHIKAnimation
    local start = wep.LHIKAnimationStart
    local length = wep.LHIKAnimationTime

    if not isnumber(seq) or not isnumber(start) then return end
    if not isnumber(length) or length <= 0 then return end
    if wep.ArcCW_TPIK_UBGLFired == start then return end

    local cycle = (UnPredictedCurTime() - start) / length
    if cycle < TPIK.UBGLCaseCycle or cycle >= 1 then return end

    local model, list = ubglCaseSource(wep, boneField)
    if not model then return end

    local name = model:GetSequenceName(seq)
    if not isstring(name) then return end
    if not string.find(string.lower(name), "reload", 1, true) then return end

    wep.ArcCW_TPIK_UBGLFired = start

    model:SetupBones()

    local shape = measureDrop(model, list, "case")
    if not shape then return end

    pending[#pending + 1] = {source = model, ply = ply, shape = shape}
end

local function spawnDrop(job)
    if #drops >= MAX_DROPS then
        local oldest = table.remove(drops, 1)
        if IsValid(oldest.ent) then oldest.ent:Remove() end

        for _, e in ipairs(oldest.extra or {}) do
            if IsValid(e.ent) then e.ent:Remove() end
        end
    end

    local source = job.source
    local shape = job.shape

    local ent = ClientsideModel(source:GetModel(), RENDERGROUP_OPAQUE)
    if not IsValid(ent) then return end

    ent:SetPos(source:GetPos())
    ent:SetAngles(source:GetAngles())
    ent:SetSkin(source:GetSkin())

    for i = 0, source:GetNumBodyGroups() - 1 do
        ent:SetBodygroup(i, source:GetBodygroup(i))
    end

    ent:SetSequence(source:GetSequence())
    ent:SetCycle(source:GetCycle())
    ent:SetPlaybackRate(0)

    local keep = shape.keep

    for i = 0, (ent:GetBoneCount() or 0) - 1 do
        if not keep[i] then ent:ManipulateBoneScale(i, VEC_ZERO) end
    end

    ent:SetupBones()

    local ang = ent:GetAngles()
    local origin = LocalToWorld(shape.localOffset, angle_zero, ent:GetPos(), ang)

    local down = -ang:Up()
    down.z = down.z - 1
    down:Normalize()

    local ply = job.ply
    local vel = ply:GetVelocity() * 0.5 + down * math.Rand(18, 30)

    vel = vel + ang:Right() * math.Rand(-4, 4)
    vel = vel + ang:Forward() * math.Rand(-4, 4)

    local drop = {
        ent = ent,
        vel = vel,
        spin = Angle(math.Rand(-90, 90), math.Rand(-90, 90), math.Rand(-140, 140)),

        localOffset = shape.localOffset,
        magPos = origin,

        localAxis = shape.localAxis,
        half = shape.half,
        radius = shape.radius,

        born = RealTime(),
        rest = false
    }

    attachedModels(keep, drop, source, job.elements, job.boneField)

    drops[#drops + 1] = drop
end

function TPIK.MagDropTick(wep, source, ply, elements, boneField)
    if not cv then cv = TPIK.CVars end
    if not cv or not cv.MagDrop or not cv.MagDrop:GetBool() then return end
    if not IsValid(source) or not IsValid(ply) then return end

    ubglCaseTick(wep, ply, boneField)

    local key = wep.LastAnimKey
    if not isstring(key) then return end

    local st = wep.ArcCW_TPIK_Mag

    if not st then
        st = {}
        wep.ArcCW_TPIK_Mag = st
    end

    local start = wep.LastAnimFinishTime or 0

    if st.key ~= key or st.start ~= start then
        st.key = key
        st.start = start
        st.fired = false
    end

    if st.fired then return end

    local cue = cuesFor(wep)[key]
    if not cue then return end

    local anim = (wep.Animations or {})[key]
    local length = tonumber(anim and anim.Time)

    if not length or length <= 0 then
        length = source:SequenceDuration() or 0
    end

    if length <= 0 then return end

    local frac = cue.t / length

    if frac > 1 then
        st.fired = true
        return
    end

    if source:GetCycle() < frac then return end

    st.fired = true

    local list = pickBones(source, cue.kind)
    if not list or #list == 0 then return end

    local shape = measureDrop(source, list, cue.kind)
    if not shape then return end

    pending[#pending + 1] = {
        source = source,
        ply = ply,
        shape = shape,
        elements = elements,
        boneField = boneField
    }
end

hook.Add("PostDrawViewModel", "ArcCW_TPIK.MagDrop", function(vm, ply, wep)
    if not IsValid(vm) or not IsValid(ply) or not IsValid(wep) then return end
    if not TPIK.IsArcCWWeapon(wep) then return end

    if vm:GetModel() ~= wep.ViewModel then return end

    TPIK.MagDropTick(wep, vm, ply, wep.VM, "VMBone")
end)

local function worldAxis(drop)
    if not drop.localAxis then return nil end

    return LocalToWorld(drop.localAxis, angle_zero, vector_origin, drop.ent:GetAngles())
end

local function settle(drop, tr, offset)
    local ent = drop.ent

    drop.rest = true
    drop.spin = Angle(0, 0, 0)

    local axis = worldAxis(drop)

    if axis then
        local flat = axis - tr.HitNormal * axis:Dot(tr.HitNormal)

        if flat:LengthSqr() > 0.01 then
            flat:Normalize()

            local cross = axis:Cross(flat)

            if cross:LengthSqr() > 0.0001 then
                local deg = math.deg(math.acos(math.Clamp(axis:Dot(flat), -1, 1)))
                local a = ent:GetAngles()

                a:RotateAroundAxis(cross:GetNormalized(), deg)
                ent:SetAngles(a)
            end
        end
    end

    local base = tr.HitPos + tr.HitNormal * (drop.radius or REST_HEIGHT)

    if offset and offset ~= 0 then
        local laid = worldAxis(drop)

        if laid then base = base - laid * offset end
    end

    return base
end

local function place(drop)
    local ent = drop.ent
    local off = LocalToWorld(drop.localOffset, angle_zero, vector_origin, ent:GetAngles())

    ent:SetPos(drop.magPos - off)
end

hook.Add("Think", "ArcCW_TPIK.MagDrop", function()
    for i = 1, #pending do
        local job = pending[i]

        if IsValid(job.source) and IsValid(job.ply) then spawnDrop(job) end

        pending[i] = nil
    end

    if #drops == 0 then return end

    local dt = RealFrameTime()
    local now = RealTime()

    for i = #drops, 1, -1 do
        local drop = drops[i]
        local ent = drop.ent

        if not IsValid(ent) then
            for _, e in ipairs(drop.extra or {}) do
                if IsValid(e.ent) then e.ent:Remove() end
            end

            table.remove(drops, i)
            continue
        end

        local age = now - drop.born

        if age > LIFETIME then
            ent:Remove()

            for _, e in ipairs(drop.extra or {}) do
                if IsValid(e.ent) then e.ent:Remove() end
            end

            table.remove(drops, i)
            continue
        end

        if age > LIFETIME - FADE then
            local a = math.Clamp((LIFETIME - age) / FADE, 0, 1) * 255

            ent:SetRenderMode(RENDERMODE_TRANSALPHA)
            ent:SetColor(Color(255, 255, 255, a))

            for _, e in ipairs(drop.extra or {}) do
                if IsValid(e.ent) then
                    e.ent:SetRenderMode(RENDERMODE_TRANSALPHA)
                    e.ent:SetColor(Color(255, 255, 255, a))
                end
            end
        end

        if not drop.rest then
            local a = ent:GetAngles()

            a:RotateAroundAxis(a:Up(), drop.spin.y * dt)
            a:RotateAroundAxis(a:Right(), drop.spin.p * dt)
            a:RotateAroundAxis(a:Forward(), drop.spin.r * dt)

            ent:SetAngles(a)

            drop.vel.z = drop.vel.z - GRAVITY * dt

            local step = drop.vel * dt
            local target = drop.magPos + step

            local radius = drop.radius or HULL
            local mins = Vector(-radius, -radius, -radius)
            local maxs = Vector(radius, radius, radius)

            local axis = (drop.half or 0) >= LONG_ENOUGH and worldAxis(drop) or nil
            local count = axis and SAMPLES or 1

            local hit, hitAt

            for k = 1, count do
                local offset = 0

                if axis then
                    offset = -drop.half + (k - 1) * (2 * drop.half / (count - 1))
                end

                local from = axis and (drop.magPos + axis * offset) or drop.magPos

                local tr = util.TraceHull({
                    start = from,
                    endpos = from + step,
                    mins = mins,
                    maxs = maxs,
                    filter = function(e) return not e:IsPlayer() end,
                    mask = MASK_SOLID
                })

                if tr.Hit and (not hit or tr.Fraction < hit.Fraction) then
                    hit, hitAt = tr, offset
                end
            end

            if hit then
                drop.vel = drop.vel - 2 * drop.vel:Dot(hit.HitNormal) * hit.HitNormal
                drop.vel = drop.vel * BOUNCE
                drop.vel = drop.vel - drop.vel * math.min(FRICTION * dt, 1)

                if drop.vel:Length() < REST_SPEED then
                    target = settle(drop, hit, hitAt)
                else
                    target = drop.magPos + step * hit.Fraction
                end
            end

            drop.magPos = target
            place(drop)
        end

        for _, e in ipairs(drop.extra or {}) do
            if IsValid(e.ent) then
                local pos, ang = LocalToWorld(e.pos, e.ang, ent:GetPos(), ent:GetAngles())

                e.ent:SetPos(pos)
                e.ent:SetAngles(ang)
            end
        end
    end
end)

function TPIK.ClearMagDrops()
    for i = #drops, 1, -1 do
        if IsValid(drops[i].ent) then drops[i].ent:Remove() end

        for _, e in ipairs(drops[i].extra or {}) do
            if IsValid(e.ent) then e.ent:Remove() end
        end

        drops[i] = nil
    end
end

concommand.Add("arccw_tpik_magdrop_clear", function()
    TPIK.ClearMagDrops()
end, nil, "Remove every magazine and case currently lying on the floor")
