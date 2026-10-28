ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK
local cv = TPIK.CVars

local ENTITY = FindMetaTable("Entity")
local entityGetBoneMatrix = ENTITY.GetBoneMatrix

local boneIndexCache = setmetatable({}, {__mode = "k"})

function TPIK.GetBone(ent, boneName)
    if not IsValid(ent) or not isstring(boneName) then return nil end

    local mdl = ent:GetModel() or ""
    local cache = boneIndexCache[ent]

    if not cache or cache.mdl ~= mdl then
        cache = {mdl = mdl, bones = {}}
        boneIndexCache[ent] = cache
    end

    local cached = cache.bones[boneName]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    local idx = ent:LookupBone(boneName)
    if idx == -1 then idx = nil end

    if idx or ent:GetBoneCount() > 0 then
        cache.bones[boneName] = idx or false
    end

    return idx
end

local getBone = TPIK.GetBone

local mirrors = {}

local function state(wep)
    local s = wep.ArcCW_TPIK

    if not s then
        s = {}
        wep.ArcCW_TPIK = s
    end

    return s
end

TPIK.State = state

local function releaseElement(model)
    if not IsValid(model) then return end

    model:SetParent(nil)
    model:RemoveEffects(EF_BONEMERGE)
    model:SetNoDraw(true)
end

local function adoptElements(wep, mirror)
    local list = wep.WM
    if not istable(list) then return end

    local s = state(wep)
    local kept = s.adoptedModels

    if not kept then
        kept = {}
        s.adoptedModels = kept
    end

    local seen

    for _, element in pairs(list) do
        local model = element.Model

        if element.IsBaseWM then
            if not element.NoDraw then element.NoDraw = true end

            if IsValid(model) and model ~= mirror then
                model:SetNoDraw(true)
            end
        elseif element.BoneMerge and IsValid(model) then
            if model:GetParent() ~= mirror then
                model:SetParent(mirror)
                model:AddEffects(EF_BONEMERGE)
            end

            model:SetNoDraw(element.NoDraw == true)

            seen = seen or {}
            seen[model] = true
            kept[model] = true
        end
    end

    for model in pairs(kept) do
        if not seen or not seen[model] then
            kept[model] = nil
            releaseElement(model)
        end
    end
end

function TPIK.ReleaseElements(s)
    if not s or not s.adoptedModels then return end

    for model in pairs(s.adoptedModels) do
        releaseElement(model)
    end

    s.adoptedModels = nil
end

local function desiredModel(wep)
    local mdl = wep.ViewModel

    if isstring(mdl) and mdl ~= "" then return mdl end

    if wep:IsCarriedByLocalPlayer() then
        local vm = LocalPlayer():GetViewModel()

        if IsValid(vm) then
            local live = vm:GetModel()
            if isstring(live) and live ~= "" then return live end
        end
    end

    return mdl
end

local function buildMirror(wep)
    local mdl = desiredModel(wep)

    if not isstring(mdl) or mdl == "" then return nil end

    local mirror = ClientsideModel(mdl, RENDERGROUP_OPAQUE)
    if not IsValid(mirror) then return nil end

    mirror:SetNoDraw(true)
    mirror:SetMoveType(MOVETYPE_NONE)
    mirror:SetSolid(SOLID_NONE)
    mirror:SetNotSolid(true)
    mirror:AddEffects(EF_NOINTERP)
    mirror:DrawShadow(false)
    mirror:SetIK(cv.ViewModelIK:GetBool())

    mirror.Weapon = wep

    return mirror
end

local function measureAlignment(wep, mirror, s)
    if s.measured and s.alignModel == mirror:GetModel() then return true end

    local idle = mirror:LookupSequence("idle")
    s.idleSeq = (idle and idle >= 0) and idle or 0

    mirror:SetPos(vector_origin)
    mirror:SetAngles(angle_zero)
    mirror:ResetSequence(s.idleSeq)
    mirror:SetCycle(0)
    mirror:SetPlaybackRate(0)
    mirror:InvalidateBoneCache()
    mirror:SetupBones()

    if mirror:GetBoneCount() <= 0 then return false end

    local handIdx = getBone(mirror, TPIK.AnchorBone)

    s.noArmBones = handIdx == nil or entityGetBoneMatrix(mirror, handIdx) == nil
    s.alignModel = mirror:GetModel()
    s.measured = true

    return true
end

TPIK.MeasureAlignment = measureAlignment

function TPIK.EnsureMirror(wep)
    local s = state(wep)
    local mirror = s.mirror

    if IsValid(mirror) and mirror:GetModel() ~= desiredModel(wep) then
        mirror:Remove()
        mirror = nil
        s.measured = nil
        s.propBones = nil
    end

    if not IsValid(mirror) then
        mirror = buildMirror(wep)
        if not IsValid(mirror) then return nil end

        s.mirror = mirror
        mirrors[wep] = mirror

        if s.savedMirrorVMWM == nil then
            s.savedMirrorVMWM = wep.MirrorVMWM == true
        end

        s.rebuild = true
    end

    local owner = wep:GetOwner()

    if IsValid(owner) and mirror:GetOwner() ~= owner then
        mirror:SetOwner(owner)
    end

    if not measureAlignment(wep, mirror, s) then return nil end

    if not wep.MirrorVMWM or s.rebuild then
        wep.MirrorVMWM = true
        s.rebuild = false

        if isfunction(wep.SetupModel) then
            pcall(wep.SetupModel, wep, true)
        end
    end

    if wep.WMModel ~= mirror then
        wep.WMModel = mirror
    end

    adoptElements(wep, mirror)

    if not wep:GetNoDraw() then wep:SetNoDraw(true) end

    return mirror
end

function TPIK.ReleaseMirror(wep, dying)
    local s = IsValid(wep) and wep.ArcCW_TPIK or nil
    local mirror = (s and s.mirror) or mirrors[wep]

    mirrors[wep] = nil

    if s then TPIK.ReleaseElements(s) end

    if IsValid(mirror) then mirror:Remove() end

    if not IsValid(wep) or not s then return end

    wep.ArcCW_TPIK = nil
    wep:SetNoDraw(false)

    if s.savedMirrorVMWM ~= nil then
        wep.MirrorVMWM = s.savedMirrorVMWM
    end

    if dying then return end

    if wep.WMModel == mirror then wep.WMModel = nil end

    if isfunction(wep.SetupModel) then
        pcall(wep.SetupModel, wep, true)
    end
end

function TPIK.ReleaseAll()
    for wep in pairs(mirrors) do
        TPIK.ReleaseMirror(wep)
    end
end

local STALE = 0.5

hook.Add("Think", "ArcCW_TPIK.Sweep", function()
    local now = RealTime()

    for wep, mirror in pairs(mirrors) do
        if not IsValid(wep) then
            mirrors[wep] = nil

            if IsValid(mirror) then mirror:Remove() end
        elseif not IsValid(mirror) or not IsValid(wep:GetOwner()) then
            TPIK.ReleaseMirror(wep)
        else
            local s = wep.ArcCW_TPIK

            if s and now - (s.lastSeen or now) > STALE then
                TPIK.ReleaseMirror(wep)
            elseif not mirror:GetNoDraw() then
                mirror:SetNoDraw(true)
            end
        end
    end
end)

hook.Add("EntityRemoved", "ArcCW_TPIK.Cleanup", function(ent)
    if ent.ArcCW_TPIK then TPIK.ReleaseMirror(ent, true) end
end)

local function copyPoseParameters(mirror, vm, s)
    local mdl = vm:GetModel() or ""

    if not s.poseList or s.poseModel ~= mdl then
        local list = {}

        for i = 0, vm:GetNumPoseParameters() - 1 do
            local name = vm:GetPoseParameterName(i)

            if isstring(name) and name ~= "" then
                local min, max = vm:GetPoseParameterRange(i)

                min = tonumber(min) or 0
                max = tonumber(max) or 1

                list[#list + 1] = {name = name, min = min, span = max - min}
            end
        end

        s.poseList = list
        s.poseModel = mdl
    end

    for _, param in ipairs(s.poseList) do
        mirror:SetPoseParameter(param.name, param.min + vm:GetPoseParameter(param.name) * param.span)
    end
end

local VEC_ONE = Vector(1, 1, 1)
local VEC_ZERO = Vector(0, 0, 0)

local function applyAmmoBones(wep, mirror, s)
    local sets = s.ammoSets

    if not sets or s.ammoModel ~= mirror:GetModel() then
        sets = {
            {key = "Override_CaseBones", field = "CaseBones", count = "GetVisualClip"},
            {key = "Override_BulletBones", field = "BulletBones", count = "GetVisualBullets"},
            {key = "Override_StripperClipBones", field = "StripperClipBones", count = "GetVisualLoadAmount"}
        }

        s.ammoSets = sets
        s.ammoModel = mirror:GetModel()
        s.ammoTouched = {}
    end

    local touched = s.ammoTouched

    for _, set in ipairs(sets) do
        local ok, bones = pcall(wep.GetBuff_Override, wep, set.key, wep[set.field])
        if not ok or not istable(bones) then continue end

        local counter = wep[set.count]
        if not isfunction(counter) then continue end

        local okCount, have = pcall(counter, wep)
        if not okCount then continue end

        have = tonumber(have) or 0

        for index, names in pairs(bones) do
            if not isnumber(index) then continue end

            for _, name in pairs(istable(names) and names or {names}) do
                local bone = getBone(mirror, name)
                if not bone then continue end

                local visible = have >= index

                if touched[bone] ~= visible then
                    touched[bone] = visible
                    mirror:ManipulateBoneScale(bone, visible and VEC_ONE or VEC_ZERO)
                end
            end
        end
    end
end

local function loadedRounds(wep)
    local visual = wep.GetVisualClip

    if isfunction(visual) then
        local ok, count = pcall(visual, wep)
        if ok and isnumber(count) then return count end
    end

    local ok, count = pcall(wep.Clip1, wep)
    if ok and isnumber(count) then return count end

    return 1
end

local function propBones(wep, mirror, s)
    if s.propBones and s.propEnt == mirror and s.propModel == mirror:GetModel() then
        return s.propBones
    end

    local config = TPIK.GetConfig(wep)
    local forced = config.HideBones
    local kept = config.KeepBones

    local bones = {}

    for i = 0, mirror:GetBoneCount() - 1 do
        local name = string.lower(mirror:GetBoneName(i) or "")

        if not kept[name] then
            local match = forced[name] or TPIK.IsAutoPropBone(name)

            if match then
                bones[#bones + 1] = {
                    index = i,
                    always = forced[name] == true,
                    hidden = false,
                    isMag = TPIK.IsMagBone(name),
                    isSpare = TPIK.IsSpareMagBone(name),
                    isReloadOnly = TPIK.IsReloadOnlyBone(name),
                    isLoaded = TPIK.IsLoadedRoundBone(name),
                    name = name
                }
            end
        end
    end

    s.propBones = bones
    s.propEnt = mirror
    s.propModel = mirror:GetModel()

    return bones
end

function TPIK.HideProps(wep, mirror, s, gripPos)
    local bones = propBones(wep, mirror, s)
    if #bones == 0 then return end

    local maxDist = TPIK.GetConfig(wep).PropDist or TPIK.PropBoneMaxDist

    local reloading = TPIK.IsReloading(wep)
    if not reloading then maxDist = maxDist * TPIK.PropIdleScale end

    local maxDistSqr = maxDist * maxDist
    local loaded = loadedRounds(wep)

    local animKey = wep.LastAnimKey
    local named = isstring(animKey)

    local perWeapon = TPIK.AnimHideBones[string.lower(wep:GetClass() or "")]
    local perAnim = named and perWeapon and perWeapon[animKey] or nil

    for i = 1, #bones do
        local bone = bones[i]
        local hide = bone.always
        local dist

        local mat = entityGetBoneMatrix(mirror, bone.index)
        local here = mat and mat:GetTranslation()

        if not hide and here then
            dist = here:DistToSqr(gripPos)
            hide = dist > maxDistSqr
        end

        bone.dist = dist

        if bone.isLoaded then
            if loaded > 0 then
                hide = false
            elseif not reloading then
                hide = true
            end
        end

        if bone.isSpare or bone.isReloadOnly then
            if not reloading then hide = true end
        end

        if perAnim and bone.name then
            for _, token in ipairs(perAnim) do
                if string.find(bone.name, token, 1, true) then
                    hide = true
                    break
                end
            end
        end

        bone.wantHide = hide
    end

    local hiddenSet = {}

    for i = 1, #bones do
        if bones[i].wantHide then hiddenSet[bones[i].index] = true end
    end

    for i = 1, #bones do
        local bone = bones[i]

        if not bone.wantHide then
            local parent = mirror:GetBoneParent(bone.index)

            while parent and parent >= 0 do
                if hiddenSet[parent] then
                    bone.wantHide = true
                    hiddenSet[bone.index] = true
                    break
                end

                parent = mirror:GetBoneParent(parent)
            end
        end
    end

    for i = 1, #bones do
        local bone = bones[i]
        local want = bone.wantHide and VEC_ZERO or VEC_ONE
        local current = mirror:GetManipulateBoneScale(bone.index)

        if current ~= want then
            mirror:ManipulateBoneScale(bone.index, want)
        end

        bone.hidden = bone.wantHide
    end
end

local function keepViewModelTicking(vm, s)
    local frame = FrameNumber()
    if s.vmTickFrame == frame then return end
    s.vmTickFrame = frame

    local seq = vm:GetSequence()
    local cycle = vm:GetCycle()

    if s.vmSeq == seq and s.vmCycle == cycle and vm:GetPlaybackRate() ~= 0 then
        s.vmStalls = (s.vmStalls or 0) + 1
    else
        s.vmStalls = 0
    end

    if (s.vmStalls or 0) >= 2 then
        if vm.ArcCW_TPIK_Advanced ~= frame then
            vm.ArcCW_TPIK_Advanced = frame

            local advanced = TPIK.AdvanceCycle(vm, seq, vm:GetPlaybackRate(), RealFrameTime())
            if advanced then vm:SetCycle(advanced) end
        end
    end

    s.vmSeq = seq
    s.vmCycle = vm:GetCycle()
end

local bodygroupData = {}

local function applyWeaponBodygroups(wep, mirror)
    if not wep.GetBuff_Hook then return end

    bodygroupData.vm = mirror

    pcall(wep.GetBuff_Hook, wep, "Hook_ModifyBodygroups", bodygroupData)

    bodygroupData.vm = nil
end

function TPIK.SyncAnimation(wep, mirror, ply, isLocal, s)
    local vm = isLocal and ply:GetViewModel() or nil

    if IsValid(vm) and vm:GetModel() == mirror:GetModel() then
        keepViewModelTicking(vm, s)

        if mirror:GetSequence() ~= vm:GetSequence() then
            mirror:SetSequence(vm:GetSequence())
        end

        local vmCycle = vm:GetCycle()

        if not TPIK.IsLoopingSequence(mirror, mirror:GetSequence()) then
            vmCycle = math.Clamp(vmCycle, 0, 1)
        end

        mirror:SetCycle(vmCycle)
        -- The viewmodel supplies the cycle; do not also advance the mirror.
        mirror:SetPlaybackRate(0)

        copyPoseParameters(mirror, vm, s)

        if mirror:GetSkin() ~= vm:GetSkin() then
            mirror:SetSkin(vm:GetSkin())
        end

        local groups = math.min(vm:GetNumBodyGroups(), mirror:GetNumBodyGroups())

        for i = 0, groups - 1 do
            if mirror:GetBodygroup(i) ~= vm:GetBodygroup(i) then
                mirror:SetBodygroup(i, vm:GetBodygroup(i))
            end
        end
    else
        local remote = TPIK.GetRemoteAnim(ply)

        if remote and remote.seq then
            TPIK.AdvanceModel(mirror, remote)
        elseif mirror:GetSequence() ~= s.idleSeq then
            mirror:ResetSequence(s.idleSeq or 0)
            mirror:SetPlaybackRate(1)
        end
    end

    applyWeaponBodygroups(wep, mirror)
    applyAmmoBones(wep, mirror, s)
end

function TPIK.PlaceElement(mirror, slot, element)
    local boneName = element.WMBone or element.Bone
    local idx = boneName and getBone(mirror, boneName)
    local mat = idx and entityGetBoneMatrix(mirror, idx)

    if not mat then return nil end

    local bonePos, boneAng = mat:GetTranslation(), mat:GetAngles()

    local offset = element.OffsetPos or vector_origin

    if slot then
        offset = slot.VMOffsetPos or (slot.Offset or {}).vpos or offset
    end

    local ang = Angle(boneAng)
    local offsetAng = element.OffsetAng or angle_zero

    ang:RotateAroundAxis(ang:Right(), offsetAng.p)
    ang:RotateAroundAxis(ang:Up(), offsetAng.y)
    ang:RotateAroundAxis(ang:Forward(), offsetAng.r)

    local pos = Vector(bonePos)
    pos:Add(boneAng:Forward() * offset.x)
    pos:Add(boneAng:Right() * offset.y)
    pos:Add(boneAng:Up() * offset.z)

    local modelOffset = element.ModelOffset or vector_origin

    pos:Add(ang:Forward() * modelOffset.x)
    pos:Add(ang:Right() * modelOffset.y)
    pos:Add(ang:Up() * modelOffset.z)

    return pos, ang
end

local function charmTransform(element)
    local parent = element.CharmParent and element.CharmParent.Model
    if not IsValid(parent) then return nil end

    local idx = parent:LookupAttachment(element.CharmAtt or "charm")
    local data = idx and idx > 0 and parent:GetAttachment(idx)

    if not data then return nil end

    local pos, ang = data.Pos, data.Ang
    local offset = element.CharmOffset or vector_origin
    local rotate = element.CharmAngle or angle_zero
    local scale = element.CharmScale or Vector(1, 1, 1)

    pos = pos + ang:Forward() * offset.x * scale.x
    pos = pos + ang:Right() * offset.y * scale.y
    pos = pos + ang:Up() * offset.z * scale.z

    ang:RotateAroundAxis(ang:Right(), rotate.p)
    ang:RotateAroundAxis(ang:Up(), rotate.y)
    ang:RotateAroundAxis(ang:Forward(), rotate.r)

    return pos, ang
end

local hidden = {}

local function suppressElementDraws(wep)
    local list = wep.WM
    if not istable(list) then return end

    for _, element in pairs(list) do
        if not element.IsBaseWM then
            hidden[#hidden + 1] = element
            hidden[#hidden + 1] = element.NoDraw == true
            element.NoDraw = true
        end
    end
end

local function restoreElementDraws()
    for i = #hidden - 1, 1, -2 do
        local element = hidden[i]

        if istable(element) then element.NoDraw = hidden[i + 1] end

        hidden[i + 1] = nil
        hidden[i] = nil
    end

    for i = #hidden, 1, -1 do
        hidden[i] = nil
    end
end

local function drawElement(element, pos, ang, flags)
    local model = element.Model

    model:SetPos(pos)
    model:SetAngles(ang)
    model:SetRenderOrigin(pos)
    model:SetRenderAngles(ang)
    model:SetupBones()
    model:DrawModel(flags)
end

local function drawElements(wep, mirror, flags)
    local list = wep.WM
    if not istable(list) then return end

    local attachments = wep.Attachments
    local charms

    for _, element in pairs(list) do
        local model = element.Model

        if element.IsBaseWM or element.NoDraw or not IsValid(model) then continue end

        if element.BoneMerge then
            model:SetupBones()
            model:DrawModel(flags)
        elseif element.CharmParent then
            charms = charms or {}
            charms[#charms + 1] = element
        else
            local slot = element.Slot and istable(attachments) and attachments[element.Slot] or nil
            local pos, ang = TPIK.PlaceElement(mirror, slot, element)

            if pos then drawElement(element, pos, ang, flags) end
        end
    end

    if not charms then return end

    for i = 1, #charms do
        local element = charms[i]
        local pos, ang = charmTransform(element)

        if pos then drawElement(element, pos, ang, flags) end
    end
end

function TPIK.DrawMirror(wep, mirror, flags)
    mirror:DrawModel(flags)

    if isfunction(wep.DrawCustomModel) then
        suppressElementDraws(wep)
        pcall(wep.DrawCustomModel, wep, true)
        restoreElementDraws()

        drawElements(wep, mirror, flags)
    end

    if isfunction(wep.DoLaser) then
        pcall(wep.DoLaser, wep, true)
    end

    if isfunction(wep.ShouldGlint) and isfunction(wep.DoScopeGlint) then
        local ok, glint = pcall(wep.ShouldGlint, wep)
        if ok and glint then pcall(wep.DoScopeGlint, wep) end
    end
end
