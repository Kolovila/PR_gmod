UCMosinOptics = UCMosinOptics or {}
local optics = UCMosinOptics
local size = 512
local target = GetRenderTargetEx("uc_mosin_scope_scene_v2", size, size, RT_SIZE_NO_CHANGE,
    MATERIAL_RT_DEPTH_SEPARATE, 0, 0, IMAGE_FORMAT_RGBA8888)
local lens = CreateMaterial("uc_mosin_scope_lens_v2", "UnlitGeneric", {
    ["$basetexture"] = target:GetName(), ["$model"] = "1", ["$nocull"] = "1"
})
local hidden = "models/comradebear/weapons/upgrades/mosin_scope_clear"
lens:SetTexture("$basetexture", target)
local unitScale = Matrix()
unitScale:Scale(Vector(1, 1, 1))
local rendering = false
local previousWeapon

function optics.Active(wep)
    local sight = wep:GetActiveSights()
    return sight and sight.UCMosinScope and sight
end

function optics.Cleanup(wep)
    local model = wep.UCMosinLensModel
    if IsValid(model) then
        for _, index in ipairs({1, 2, 3}) do model:SetSubMaterial(index, nil) end
    end
    wep.UCMosinLensModel = nil
end

function optics.DrawModel(wep, element, world)
    local model = element.Model
    if not IsValid(model) then return end
    local owner = wep:GetOwner()
    local reference = world and wep.WMModel or (IsValid(owner) and owner:GetViewModel())
    if not IsValid(reference) then return end
    -- Use engine bone merge, including in TPIK which bypasses DrawFunc.
    -- Every scope/cloth vertex is weighted to the matching wpn_body bone.
    if model:GetParent() ~= reference then model:SetParent(reference) end
    model:AddEffects(EF_BONEMERGE)
    model:EnableMatrix("RenderMultiply", unitScale)
    model:SetRenderOrigin(nil)
    model:SetRenderAngles(nil)
    if string.find(model:GetModel(), "4x_cloth", 1, true) then
        model:SetSubMaterial(4, "models/comradebear/weapons/upgrades/mosin_scope_cloth")
    end

    local active = not world and owner == LocalPlayer() and optics.Active(wep)
        and wep:GetSightDelta() < 0.5 and wep:GetBarrelNearWall() <= 0
        and wep.UCMosinScopeFrame == FrameNumber()
    if active then
        if wep.UCMosinLensModel ~= model then optics.Cleanup(wep) end
        -- Only the dedicated RT mesh has upright UVs. The reflection mesh's
        -- UVs are rolled 40 degrees on PU and inverted on PE, so hide it.
        model:SetSubMaterial(1, hidden)
        model:SetSubMaterial(2, "!" .. lens:GetName())
        model:SetSubMaterial(3, hidden)
        wep.UCMosinLensModel = model
    else
        for _, index in ipairs({1, 2, 3}) do model:SetSubMaterial(index, nil) end
    end
end

function optics.Configure(wep)
    local slot = wep.Attachments and wep.Attachments[1]
    local att = slot and slot.Installed and ArcCW.AttachmentTable[slot.Installed]
    if not att or not att.UCMosinNativeOptic then return end
    if slot.VElement then optics.DrawModel(wep, slot.VElement, false) end
    if slot.WElement then optics.DrawModel(wep, slot.WElement, true) end
end

function optics.Render(wep)
    if rendering or wep.UCMosinScopeFrame == FrameNumber() then return end
    local sight = optics.Active(wep)
    local owner = LocalPlayer()
    if not sight or wep:GetOwner() ~= owner or not owner:Alive() or owner:ShouldDrawLocalPlayer()
        or wep:GetSightDelta() >= 0.5 or wep:GetBarrelNearWall() > 0 then
        optics.Cleanup(wep)
        return
    end
    local vx, vy, vw, vh = 0, 0, ScrW(), ScrH()
    if render.GetViewPort then vx, vy, vw, vh = render.GetViewPort() end
    local overdraw = ArcCW.Overdraw
    rendering = true
    ArcCW.Overdraw = true
    render.PushRenderTarget(target, 0, 0, size, size)
    local cameraOpen = false
    local ok, failure = xpcall(function()
        render.Clear(0, 0, 0, 255, true, true)
        render.RenderView({
            origin = EyePos(), angles = EyeAngles(), x = 0, y = 0, w = size, h = size,
            fov = math.Clamp(owner:GetFOV() / sight.ScopeMagnification, 5, 90), aspectratio = 1,
            drawviewmodel = false, drawhud = false, dopostprocess = false, bloomtone = false,
        })
        cam.Start2D()
        cameraOpen = true
        -- Three-post Soviet reticle, drawn into the private image rather than
        -- using the authored faint/tinted model overlay as a HUD texture.
        surface.SetDrawColor(8, 8, 8, 255)
        surface.DrawRect(0, size * 0.494, size * 0.42, size * 0.012)
        surface.DrawRect(size * 0.58, size * 0.494, size * 0.42, size * 0.012)
        surface.DrawRect(size * 0.492, size * 0.64, size * 0.016, size * 0.36)
        draw.NoTexture()
        surface.DrawPoly({{x=size*0.492,y=size*0.64}, {x=size*0.5,y=size*0.5}, {x=size*0.508,y=size*0.64}})
        cam.End2D()
        cameraOpen = false
    end, debug.traceback)
    if cameraOpen then cam.End2D() end
    render.PopRenderTarget()
    render.SetViewPort(vx, vy, vw, vh)
    ArcCW.Overdraw = overdraw
    rendering = false
    if ok then
        lens:SetTexture("$basetexture", target)
        wep.UCMosinScopeFrame = FrameNumber()
    else
        optics.Cleanup(wep)
        if (wep.UCMosinScopeErrorAt or 0) < CurTime() then
            wep.UCMosinScopeErrorAt = CurTime() + 5
            ErrorNoHalt("[UC Mosin optics] " .. tostring(failure) .. "\n")
        end
    end
end

hook.Add("PreRender", "UCMosinPrivateLens", function()
    if rendering then return end
    local owner = LocalPlayer()
    local wep = IsValid(owner) and owner:GetActiveWeapon()
    if previousWeapon ~= wep and IsValid(previousWeapon) then optics.Cleanup(previousWeapon) end
    previousWeapon = wep
    if IsValid(wep) and wep:GetClass() == "arccw_uc_mosin" then
        optics.Render(wep)
        optics.Configure(wep)
    end
end)
