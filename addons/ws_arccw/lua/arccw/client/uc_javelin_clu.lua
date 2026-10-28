local J = UCJavelin
local phosphor = Color(183, 204, 174)
local quiet = Color(112, 134, 105)
local caution = Color(207, 181, 117)
local hot = Material("models/debug/debugwhite")
local fontHeight = 0

local function fonts()
    if ScrH() == fontHeight then
        return
    end
    fontHeight = ScrH()
    surface.CreateFont(
        "UCJavelinCLU",
        { font = "Consolas", size = math.max(12, math.Round(fontHeight * 0.018)), weight = 500 }
    )
    surface.CreateFont(
        "UCJavelinSmall",
        { font = "Consolas", size = math.max(10, math.Round(fontHeight * 0.014)), weight = 400 }
    )
end

local function scopedWeapon()
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() or ply:ShouldDrawLocalPlayer() then
        return
    end
    local weapon = ply:GetActiveWeapon()
    if IsValid(weapon) and weapon:GetClass() == "arccw_uc_javelin" and weapon:JavelinScoped() then
        return weapon
    end
end

hook.Add("PreDrawViewModel", "UCJavelin.CLU", function(vm, ply, weapon)
    if IsValid(weapon) and scopedWeapon() == weapon then
        return true
    end
end)

hook.Add("RenderScreenspaceEffects", "UCJavelin.Thermal", function()
    local weapon = scopedWeapon()
    if
        not weapon
        or weapon:GetBuff_Override("Override_UCJNoThermal")
        or not weapon:GetNW2Bool("UCJThermal", true)
    then
        return
    end
    DrawColorModify({
        ["$pp_colour_addr"] = 0,
        ["$pp_colour_addg"] = 0,
        ["$pp_colour_addb"] = 0,
        ["$pp_colour_brightness"] = -0.055,
        ["$pp_colour_contrast"] = 1.22,
        ["$pp_colour_colour"] = 0,
        ["$pp_colour_mulr"] = 0,
        ["$pp_colour_mulg"] = 0,
        ["$pp_colour_mulb"] = 0,
    })

    cam.Start3D(EyePos(), EyeAngles())
    render.MaterialOverride(hot)
    render.SuppressEngineLighting(true)
    local level = weapon:GetBuff_Override("Override_UCJBlackHot") and 0.12 or 0.82
    render.SetColorModulation(level, level, level)
    for _, ent in ipairs(J.Targets(weapon)) do
        if
            IsValid(ent)
            and ent ~= LocalPlayer()
            and ent:GetPos():DistToSqr(EyePos()) < weapon.JavelinRange ^ 2
            and J.Visible(LocalPlayer(), ent)
        then
            ent:DrawModel()
        end
    end
    render.SetColorModulation(1, 1, 1)
    render.SuppressEngineLighting(false)
    render.MaterialOverride(nil)
    cam.End3D()
end)

function J.CLULayout(w, h)
    local sh = math.min(h * 0.80, w * 0.82 * 3 / 4)
    local sw = sh * 4 / 3
    return {
        x = (w - sw) / 2,
        y = (h - sh) / 2,
        w = sw,
        h = sh,
        scale = sh / 720,
        cx = w / 2,
        cy = h / 2,
    }
end

local function text(value, x, y, colour, align, small)
    draw.SimpleText(
        value,
        small and "UCJavelinSmall" or "UCJavelinCLU",
        x,
        y,
        colour or phosphor,
        align or TEXT_ALIGN_LEFT,
        TEXT_ALIGN_CENTER
    )
end

local function corners(x, y, halfW, halfH, length, colour)
    surface.SetDrawColor(colour or phosphor)
    for _, dx in ipairs({ -1, 1 }) do
        for _, dy in ipairs({ -1, 1 }) do
            local px, py = x + dx * halfW, y + dy * halfH
            surface.DrawLine(px, py, px - dx * length, py)
            surface.DrawLine(px, py, px, py - dy * length)
        end
    end
end

local function mask(l, w, h)
    local x, y, sw, sh = l.x, l.y, l.w, l.h
    local radius = math.max(8, math.Round(22 * l.scale))
    surface.SetDrawColor(5, 7, 5, 255)
    surface.DrawRect(0, 0, w, y)
    surface.DrawRect(0, y + sh, w, h - y - sh)
    surface.DrawRect(0, y, x, sh)
    surface.DrawRect(x + sw, y, w - x - sw, sh)
    for row = 0, radius do
        local inset = radius - math.sqrt(math.max(0, radius ^ 2 - (radius - row) ^ 2))
        surface.DrawRect(x, y + row, inset, 1)
        surface.DrawRect(x + sw - inset, y + row, inset, 1)
        surface.DrawRect(x, y + sh - row - 1, inset, 1)
        surface.DrawRect(x + sw - inset, y + sh - row - 1, inset, 1)
    end
    surface.SetDrawColor(30, 35, 29, 230)
    surface.DrawOutlinedRect(x - 2, y - 2, sw + 4, sh + 4, 2)
end

function J.DrawCLU(weapon)
    if scopedWeapon() ~= weapon then
        return
    end
    fonts()
    local w, h = ScrW(), ScrH()
    local l = J.CLULayout(w, h)
    local s, cx, cy = l.scale, l.cx, l.cy
    local margin = math.max(18, 28 * s)
    local left, right = l.x + margin, l.x + l.w - margin
    local top, bottom = l.y + margin, l.y + l.h - margin
    local thermal = weapon:GetNW2Bool("UCJThermal", true)
    local direct = weapon:GetCurrentFiremode().JavelinDirect == true
    local safe = weapon:GetCurrentFiremode().Mode == 0
    local target = weapon:GetNW2Entity("UCJTarget")
    local progress = math.Clamp(weapon:GetNW2Float("UCJProgress", 0), 0, 1)
    local locked = weapon:GetNW2Bool("UCJLocked", false)
    local visible = IsValid(target) and J.Visible(LocalPlayer(), target)
    local status = weapon:GetNW2String("UCJStatus", "SEEKER COOLING")

    if thermal then
        surface.SetDrawColor(0, 0, 0, 11)
        for row = l.y + 2, l.y + l.h - 2, 4 do
            surface.DrawRect(l.x, row, l.w, 1)
        end
    end
    surface.SetDrawColor(quiet)
    surface.DrawLine(left, top + 18 * s, right, top + 18 * s)
    surface.DrawLine(left, bottom - 34 * s, right, bottom - 34 * s)
    text("CLU", left, top)
    local black = weapon:GetBuff_Override("Override_UCJBlackHot")
    local sight = weapon:GetBuff_Override("Override_IronSightStruct") or weapon.IronSightStruct
    text(
        thermal and (black and "IR / BLACK-HOT" or "IR / WHITE-HOT") or "DAY",
        cx,
        top,
        phosphor,
        TEXT_ALIGN_CENTER
    )
    text(
        safe and "SAFE" or (direct and "DIR" or "TOP"),
        right,
        top,
        safe and caution or phosphor,
        TEXT_ALIGN_RIGHT
    )

    surface.SetDrawColor(phosphor)
    local gap, arm = 4 * s, 9 * s
    surface.DrawLine(cx - arm - gap, cy, cx - gap, cy)
    surface.DrawLine(cx + gap, cy, cx + gap + arm, cy)
    surface.DrawLine(cx, cy - gap - arm, cx, cy - gap)
    surface.DrawLine(cx, cy + gap, cx, cy + gap + arm)
    corners(cx, cy, l.w * 0.105, l.h * 0.10, 12 * s, quiet)

    local range = "---"
    if visible then
        local point = J.AimPoint(target):ToScreen()
        range = string.format(
            "%03d",
            math.Round(LocalPlayer():GetShootPos():Distance(J.AimPoint(target)) * 0.0254)
        )
        if
            point.visible
            and point.x > left + 35 * s
            and point.x < right - 35 * s
            and point.y > top + 65 * s
            and point.y < bottom - 90 * s
        then
            local extent = (32 - progress * 12) * s
            corners(point.x, point.y, extent, extent, 8 * s, locked and phosphor or quiet)
        end
    end
    text("EST " .. range .. " m", left, bottom - 57 * s, quiet, nil, true)
    text(locked and visible and "TRACK" or "SEEK", right, bottom - 57 * s, phosphor, TEXT_ALIGN_RIGHT, true)
    text(
        status == "LOCK / READY" and "LOCK" or status,
        cx,
        bottom - 57 * s,
        locked and visible and phosphor or caution,
        TEXT_ALIGN_CENTER
    )
    if progress > 0 and not locked then
        for i = 1, 8 do
            surface.SetDrawColor(i <= math.floor(progress * 8) and phosphor or quiet)
            surface.DrawRect(cx - 35 * s + (i - 1) * 10 * s, bottom - 86 * s, 5 * s, 3 * s)
        end
    end
    text(
        weapon:Clip1() > 0 and "MSL RDY" or "NO MSL",
        left,
        bottom,
        weapon:Clip1() > 0 and phosphor or caution,
        nil,
        true
    )
    text(
        thermal and (black and "BLACK HOT" or "WHITE HOT")
            or tostring(sight.Magnification or 4) .. "x OPTICAL",
        cx,
        bottom,
        quiet,
        TEXT_ALIGN_CENTER,
        true
    )
    text("FGM-148", right, bottom, quiet, TEXT_ALIGN_RIGHT, true)
    mask(l, w, h)
end

killicon.Add("arccw_uc_javelin", "vgui/killicons/tfa_mw2cr_javelin", Color(230, 218, 180))
killicon.AddAlias("arccw_uc_javelin_missile", "arccw_uc_javelin")
