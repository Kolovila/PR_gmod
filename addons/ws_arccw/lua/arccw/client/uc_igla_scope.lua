UCIgla = UCIgla or {}
local lens = CreateMaterial("uc_igla_rt_lens", "UnlitGeneric", {
    ["$basetexture"] = "models/krazy/igla/igla_lens_d",
    ["$model"] = "1",
    ["$nocull"] = "1",
})
local function symbol(name)
    return CreateMaterial("uc_igla_" .. name, "UnlitGeneric", {
        ["$basetexture"] = "models/krazy/igla/" .. name,
        ["$translucent"] = "1",
        ["$vertexcolor"] = "1",
        ["$vertexalpha"] = "1",
    })
end
local square = symbol("target_square")
local diamond = symbol("target_diamond")

local size = 512
local function scopeTarget(name)
    return GetRenderTargetEx(
        name,
        size,
        size,
        RT_SIZE_NO_CHANGE,
        MATERIAL_RT_DEPTH_SEPARATE,
        0,
        0,
        IMAGE_FORMAT_RGBA8888
    )
end
local scene = scopeTarget("uc_igla_scene_v2")
local image = scopeTarget("uc_igla_lens_v2")

local monochrome = CreateMaterial("uc_igla_monochrome_v2", Material("pp/colour"):GetShader(), {
    ["$fbtexture"] = "uc_igla_scene_v2",
    ["$ignorez"] = "1",
    ["$pp_colour_addr"] = "0",
    ["$pp_colour_addg"] = "0",
    ["$pp_colour_addb"] = "0",
    ["$pp_colour_brightness"] = "-0.03",
    ["$pp_colour_contrast"] = "0.8",
    ["$pp_colour_colour"] = "0",
    ["$pp_colour_mulr"] = "0",
    ["$pp_colour_mulg"] = "0",
    ["$pp_colour_mulb"] = "0",
})
local hotMaterial = Material("models/debug/debugwhite")
local rendering = false
local function viewport()
    if render.GetViewPort then
        return render.GetViewPort()
    end
    return 0, 0, ScrW(), ScrH()
end
local function hot(ent, owner)
    if not IsValid(ent) or ent == owner or ent:GetNoDraw() then
        return false
    end
    if ent:IsPlayer() then
        return ent:Alive()
    end
    if ent:IsNPC() then
        return ent:Health() > 0
    end
    return UCIgla.Target(ent) or ent:IsOnFire()
end
function UCIgla.RenderScope(wep)
    if rendering or not wep:GetBuff_Override("Override_UCIglaThermal") or not wep:IglaAiming() then
        return
    end
    if wep.UCIglaScopeFrame == FrameNumber() then
        return
    end
    local owner = LocalPlayer()
    if wep:GetOwner() ~= owner then
        return
    end
    wep.UCIglaScopeFrame = FrameNumber()
    local sight = wep:GetActiveSights()
    local fov = math.Clamp(owner:GetFOV() / (sight.ScopeMagnification or 3.5) / 1.2, 8, 45)
    wep.UCIglaScopeFOV = fov
    local origin, angles = EyePos(), EyeAngles()
    local vx, vy, vw, vh = viewport()
    rendering = true
    local overdraw = ArcCW.Overdraw
    ArcCW.Overdraw = true
    render.PushRenderTarget(image, 0, 0, size, size)
    local cameraOpen = false
    local ok, failure = xpcall(function()
        render.Clear(0, 0, 0, 255, true, true)
        render.RenderView({
            origin = origin,
            angles = angles,
            x = 0,
            y = 0,
            w = size,
            h = size,
            fov = fov,
            aspectratio = 1,
            drawviewmodel = false,
            drawhud = false,
            dopostprocess = false,
            bloomtone = false,
        })
        render.CopyRenderTargetToTexture(scene)
        monochrome:SetTexture("$fbtexture", scene)
        render.OverrideDepthEnable(true, false)
        render.SetMaterial(monochrome)
        render.DrawScreenQuad()
        render.OverrideDepthEnable(false, false)

        cam.Start3D(origin, angles, fov, 0, 0, size, size)
        cameraOpen = true
        render.MaterialOverride(hotMaterial)
        render.SuppressEngineLighting(true)
        render.SetColorModulation(0.9, 0.9, 0.9)
        for _, ent in ipairs(ents.FindInSphere(origin, 24000)) do
            if hot(ent, owner) and UCIgla.Visible(origin, ent, { owner, wep }) then
                ent:DrawModel()
            end
        end
        cam.End3D()
        cameraOpen = false
    end, debug.traceback)
    if cameraOpen then
        cam.End3D()
    end
    render.OverrideDepthEnable(false, false)
    render.SetColorModulation(1, 1, 1)
    render.SuppressEngineLighting(false)
    render.MaterialOverride()
    render.PopRenderTarget()

    render.SetViewPort(vx, vy, vw, vh)
    ArcCW.Overdraw = overdraw
    rendering = false
    if not ok then
        wep.UCIglaScopeFrame = nil
        if (wep.UCIglaScopeErrorAt or 0) < CurTime() then
            wep.UCIglaScopeErrorAt = CurTime() + 5
            ErrorNoHalt("[UC Igla scope] " .. tostring(failure) .. "\n")
        end
        return
    end
    UCIgla.DrawScope(image)
end
function UCIgla.DrawScope(source)
    local owner = LocalPlayer()
    local wep = IsValid(owner) and owner:GetActiveWeapon()
    if not IsValid(wep) or wep:GetClass() ~= "arccw_uc_igla" or not wep:IglaAiming() then
        return
    end
    if not source then
        return
    end
    local size = source:Width()
    local vx, vy, vw, vh = viewport()

    render.PushRenderTarget(source, 0, 0, size, size)
    cam.Start2D()

    surface.SetDrawColor(242, 211, 139, 255)
    surface.DrawLine(size * 0.47, size * 0.5, size * 0.49, size * 0.5)
    surface.DrawLine(size * 0.51, size * 0.5, size * 0.53, size * 0.5)
    surface.DrawLine(size * 0.5, size * 0.47, size * 0.5, size * 0.49)
    surface.DrawLine(size * 0.5, size * 0.51, size * 0.5, size * 0.53)
    surface.SetDrawColor(242, 211, 139, 175)
    for _, offset in ipairs({ 0.10, 0.18 }) do
        for _, side in ipairs({ -1, 1 }) do
            local x = size * (0.5 + offset * side)
            local y = size * (0.5 + offset * side)
            surface.DrawLine(x, size * 0.494, x, size * 0.506)
            surface.DrawLine(size * 0.494, y, size * 0.506, y)
        end
    end
    local profile, kind = UCIgla.Profile(wep)
    local progress = wep:GetNW2Float("UCIglaProgress", 0)
    local locked = wep:GetNW2Bool("UCIglaLocked", false)
    local color = kind == "laser" and Color(255, 95, 80)
        or kind == "passive" and Color(100, 170, 255)
        or kind == "active" and Color(110, 255, 140)
        or Color(240, 240, 240)
    local ent = wep:GetNW2Entity("UCIglaTarget")
    if IsValid(ent) then
        local direction = UCIgla.Point(ent) - EyePos()
        local angles = EyeAngles()
        local depth = direction:Dot(angles:Forward())
        local fov = wep.UCIglaScopeFOV or 20
        local scale = size / (2 * math.tan(math.rad(fov / 2)))
        if depth > 0 then
            local x = size / 2 + direction:Dot(angles:Right()) / depth * scale
            local y = size / 2 - direction:Dot(angles:Up()) / depth * scale
            local extent = size * 0.14
            surface.SetDrawColor(
                color.r,
                color.g,
                color.b,
                locked and 255 or math.floor(120 + 100 * math.sin(CurTime() * 12) ^ 2)
            )
            surface.SetMaterial(locked and diamond or square)
            surface.DrawTexturedRect(x - extent / 2, y - extent / 2, extent, extent)
            draw.SimpleText(
                math.floor(direction:Length() * 0.0254) .. " m",
                "DermaDefaultBold",
                size / 2,
                size * 0.75,
                color,
                TEXT_ALIGN_CENTER
            )
        end
    end
    draw.SimpleText(profile.name, "DermaDefaultBold", size / 2, size * 0.22, color, TEXT_ALIGN_CENTER)
    draw.SimpleText(
        wep:GetNW2String("UCIglaStatus", "STANDBY"),
        "DermaDefaultBold",
        size / 2,
        size * 0.8,
        color,
        TEXT_ALIGN_CENTER
    )
    surface.SetDrawColor(20, 20, 20, 220)
    surface.DrawRect(size * 0.32, size * 0.84, size * 0.36, size * 0.012)
    surface.SetDrawColor(color)
    surface.DrawRect(size * 0.32, size * 0.84, size * 0.36 * progress, size * 0.012)
    cam.End2D()
    render.PopRenderTarget()
    render.SetViewPort(vx, vy, vw, vh)
    lens:SetTexture("$basetexture", source)
    local vm = owner:GetViewModel()
    if IsValid(vm) then
        vm:SetSubMaterial(4, "!uc_igla_rt_lens")
        wep.UCIglaVM = vm
    end
end

hook.Add("PreRender", "UCIglaPrivateLens", function()
    if rendering then
        return
    end
    local owner = LocalPlayer()
    if not IsValid(owner) then
        return
    end
    local wep = owner:GetActiveWeapon()
    if IsValid(wep) and wep:GetClass() == "arccw_uc_igla" then
        UCIgla.RenderScope(wep)
    end
end)
