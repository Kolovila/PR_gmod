local CATEGORY = "ArcCW - Urban Coalition"
local ORIGINAL = "UC_AddWeaponContent"
local PATCH = "UC_Extras_WeaponContent"

local SORT_PACK, SORT_ALPHA, SORT_CLASS, SORT_COUNTRY, SORT_ERA = 0, 1, 2, 3, 4
local SORT_COUNT = 5

CreateClientConVar("arccw_uc_menu_sort", SORT_PACK, true, false,
    "UC spawnmenu grouping: 0 pack, 1 pack A to Z, 2 class, 3 country, 4 era", 0, SORT_COUNT - 1)

CreateClientConVar("arccw_uc_menu_logo", 1, true, false,
    "Faint Urban Coalition logo behind the UC spawnmenu", 0, 1)

CreateClientConVar("arccw_uc_menu_theme", 0, true, false,
    "UC spawnmenu theme: 0 dark, 1 light", 0, 1)



local logo = Material("entities/ucepicfail.png", "smooth mips")

local cvSort, cvLogo, cvMenu, cvTheme

local function sortMode()
    cvSort = cvSort or GetConVar("arccw_uc_menu_sort")
    return cvSort and cvSort:GetInt() or 0
end

local function logoOn()
    cvLogo = cvLogo or GetConVar("arccw_uc_menu_logo")
    return cvLogo and cvLogo:GetBool()
end

local function menuOn()
    cvMenu = cvMenu or GetConVar("arccw_uc_menu")
    return cvMenu and cvMenu:GetBool()
end

local function lightOn()
    cvTheme = cvTheme or GetConVar("arccw_uc_menu_theme")
    return cvTheme and cvTheme:GetBool()
end


local gradient = Material("gui/gradient")
local gradientDown = Material("gui/gradient_down")
local gradientUp = Material("gui/gradient_up")

local ACCENT_R, ACCENT_G, ACCENT_B = 135, 206, 250
local LOGO_SIZE, LOGO_INSET = 48, 56
local FLAG_W, FLAG_H = 44, 30

local THEME_DARK = {
    tint = Color(8, 11, 16),
    tintFlat = 46,
    tintFade = 104,
    panel = Color(14, 18, 24),
    logo = Color(255, 255, 255),
    logoAlpha = 38,
    back = Color(10, 13, 18),
    title = Color(255, 255, 255),
    text = Color(184, 196, 206),
    dim = Color(150, 162, 172),
}

local THEME_LIGHT = {
    tint = Color(238, 241, 246),
    tintFlat = 54,
    tintFade = 120,
    panel = Color(228, 233, 240),
    logo = Color(26, 32, 42),
    logoAlpha = 30,
    back = Color(240, 243, 248),
    title = Color(16, 20, 28),
    text = Color(54, 62, 74),
    dim = Color(104, 114, 126),
}

local themeFrame, themeCache = -1, THEME_DARK

local function theme()
    local frame = FrameNumber()

    if themeFrame ~= frame then
        themeFrame = frame
        themeCache = lightOn() and THEME_LIGHT or THEME_DARK
    end

    return themeCache
end

local SND_HOVER = "uc_menu/hover.ogg"
local SND_CLICK = "uc_menu/menubutton.ogg"
local SND_CYCLE = "uc_menu/menubutton.ogg"
local SND_SELECT = "uc_menu/select.ogg"

local SORT_INFO = {
    [SORT_PACK] = {"icon16/box.png", "Grouped by pack"},
    [SORT_ALPHA] = {"icon16/text_align_left.png", "Grouped by pack, A to Z"},
    [SORT_CLASS] = {"icon16/application_view_list.png", "Grouped by weapon class"},
    [SORT_COUNTRY] = {"icon16/world.png", "Grouped by country of origin"},
    [SORT_ERA] = {"icon16/time.png", "Grouped by era"},
}

local ERAS = {
    {1849, "Pre-Industrial"},
    {1913, "Industrial Age"},
    {1918, "First World War"},
    {1938, "Interwar"},
    {1945, "Second World War"},
    {1964, "Early Cold War"},
    {1975, "Vietnam"},
    {1991, "Late Cold War"},
    {2019, "Modern"},
    {math.huge, "Near Future"},
}

local PACK_STYLE = {
    ["urban decay"] = {Color(214, 62, 58), "uc_menu/uc_red.png"},
    ["urban renewal"] = {Color(50, 126, 255), "uc_menu/uc_blue.png"},
    ["urban armoury"] = {Color(88, 170, 96), "uc_menu/uc_logo_meleegreen.png"},
    ["urban ordnance"] = {Color(158, 108, 204), "uc_menu/uc_logo_purple.png"},
    ["urban resurgence"] = {Color(168, 214, 84), "uc_menu/uc_logo_resurgencegreen.png"},
    ["urban one-offs"] = {Color(240, 138, 120), "uc_menu/uc_logo_oneoffssalmon.png"},
    ["urban expedition"] = {Color(150, 200, 240), "uc_menu/uc_logo_expeditionbabyblue.png"},
    ["urban vintage"] = {Color(224, 176, 62), "uc_menu/uc_logo_vintageyellow.png"},
    ["urban anarchy"] = {Color(232, 140, 52), "uc_menu/uc_logo_anarchyorange.png"},
    ["urban utilities"] = {Color(90, 205, 214), "uc_menu/uc_logo_cyan.png"},
}

local PACK_LOGO = {}

local function packStyle(name)
    if not isstring(name) then return nil end

    local entry = PACK_STYLE[string.lower(string.Trim(name))]
    if not entry then return nil end

    local path = entry[2]

    if not PACK_LOGO[path] then
        PACK_LOGO[path] = Material(path, "smooth mips")
    end

    return entry[1], PACK_LOGO[path]
end

local quietUntil = 0

local function quiet()
    return RealTime() < quietUntil
end

local function goQuiet()
    quietUntil = RealTime() + 0.6
end

local function menuOpen()
    return IsValid(g_SpawnMenu) and g_SpawnMenu:IsVisible()
end

local STRUGGLING = 0.04

local function struggling()
    return FrameTime() > STRUGGLING
end

local startWarming

local DRAW_PER_FRAME = 2

local drawQueue, drawSeen = {}, {}

local function queueDraw(mat)
    if not mat or mat:IsError() then return end

    local name = mat:GetName()

    if not isstring(name) or drawSeen[name] then return end

    drawSeen[name] = true
    drawQueue[#drawQueue + 1] = mat
end

hook.Add("HUDPaint", PATCH .. ".Preload", function()
    if #drawQueue == 0 then return end
    if quiet() or struggling() then return end

    surface.SetDrawColor(255, 255, 255, 1)

    for _ = 1, DRAW_PER_FRAME do
        local mat = table.remove(drawQueue)

        if not mat then break end

        surface.SetMaterial(mat)
        pcall(surface.DrawTexturedRect, 0, 0, 1, 1)
    end
end)

local COLOURS = {}

local function C(r, g, b)
    local key = r * 65536 + g * 256 + b
    local col = COLOURS[key]

    if not col then
        col = Color(r, g, b)
        COLOURS[key] = col
    end

    return col
end

local WHITE = C(245, 245, 245)
local BLACK = C(24, 24, 24)

local flagAlpha = 255

local function box(col, x, y, w, h)
    surface.SetDrawColor(col.r, col.g, col.b, flagAlpha)
    surface.DrawRect(x, y, w, h)
end

local STRIPE_1 = {BLACK, C(221, 0, 0), C(255, 206, 0)}
local STRIPE_2 = {WHITE, C(255, 212, 0), BLACK}
local STRIPE_3 = {WHITE, C(0, 57, 166), C(213, 43, 30)}
local STRIPE_4 = {C(237, 41, 57), WHITE, C(237, 41, 57)}
local STRIPE_5 = {C(0, 140, 69), WHITE, C(205, 33, 42)}
local STRIPE_6 = {C(0, 85, 164), WHITE, C(239, 65, 53)}
local STRIPE_7 = {BLACK, C(250, 209, 5), C(237, 41, 57)}
local STRIPE_8 = {C(0, 43, 127), C(252, 209, 22), C(206, 17, 38)}
local STRIPE_9 = {C(205, 42, 52), WHITE, C(67, 111, 66)}
local STRIPE_10 = {WHITE, C(0, 150, 110), C(214, 38, 18)}
local STRIPE_11 = {C(0, 57, 166), WHITE, C(213, 43, 30)}
local STRIPE_12 = {C(237, 41, 57), WHITE}
local STRIPE_13 = {C(206, 17, 38), WHITE}
local STRIPE_14 = {BLACK, WHITE, C(221, 0, 0)}
local STRIPE_15 = {C(0, 87, 183), C(255, 215, 0)}

local function stripes(cols, x, y, w, h, vertical)
    local n = #cols

    for i = 1, n do
        if vertical then
            local bw = w / n
            box(cols[i], x + (i - 1) * bw, y, math.ceil(bw), h)
        else
            local bh = h / n
            box(cols[i], x, y + (i - 1) * bh, w, math.ceil(bh))
        end
    end
end

local function alternating(a, b, count, x, y, w, h)
    local bh = h / count

    for i = 1, count do
        box((i % 2 == 1) and a or b, x, y + (i - 1) * bh, w, math.ceil(bh))
    end
end

local function nordic(field, cross, x, y, w, h)
    box(field, x, y, w, h)

    local t = math.max(2, h * 0.2)

    box(cross, x, y + (h - t) * 0.5, w, t)
    box(cross, x + w * 0.34 - t * 0.5, y, t, h)
end

local TRIANGLE_POLY = {
    {x = 0, y = 0},
    {x = 0, y = 0},
    {x = 0, y = 0},
}

local function hoistTriangle(col, x, y, w, h)
    TRIANGLE_POLY[1].x, TRIANGLE_POLY[1].y = x, y
    TRIANGLE_POLY[2].x, TRIANGLE_POLY[2].y = x + w * 0.45, y + h * 0.5
    TRIANGLE_POLY[3].x, TRIANGLE_POLY[3].y = x, y + h

    draw.NoTexture()
    surface.SetDrawColor(col.r, col.g, col.b, flagAlpha)
    surface.DrawPoly(TRIANGLE_POLY)
end

local DISC_COS, DISC_SIN, DISC_POLY = {}, {}, {}

for i = 0, 15 do
    local a = math.rad(i * 22.5)

    DISC_COS[i + 1] = math.cos(a)
    DISC_SIN[i + 1] = math.sin(a)
    DISC_POLY[i + 1] = {x = 0, y = 0}
end

local function disc(col, x, y, w, h, radius)
    local cx, cy = x + w * 0.5, y + h * 0.5
    local r = math.min(w, h) * radius

    for i = 1, 16 do
        local pt = DISC_POLY[i]

        pt.x = cx + DISC_COS[i] * r
        pt.y = cy + DISC_SIN[i] * r
    end

    draw.NoTexture()
    surface.SetDrawColor(col.r, col.g, col.b, flagAlpha)
    surface.DrawPoly(DISC_POLY)
end

local COUNTRY_FLAG = {
    ["United States"] = {
        colours = {C(178, 34, 52), WHITE, C(60, 59, 110)},
        draw = function(x, y, w, h)
            alternating(C(178, 34, 52), WHITE, 7, x, y, w, h)
            box(C(60, 59, 110), x, y, w * 0.42, h * 0.55)
        end,
    },
    ["United Kingdom"] = {
        colours = {C(1, 33, 105), WHITE, C(200, 16, 46)},
        draw = function(x, y, w, h)
            box(C(1, 33, 105), x, y, w, h)

            local t = math.max(2, h * 0.16)

            box(WHITE, x, y + (h - t * 2) * 0.5, w, t * 2)
            box(WHITE, x + (w - t * 2) * 0.5, y, t * 2, h)
            box(C(200, 16, 46), x, y + (h - t) * 0.5, w, t)
            box(C(200, 16, 46), x + (w - t) * 0.5, y, t, h)
        end,
    },
    ["Germany"] = {
        colours = {BLACK, C(221, 0, 0), C(255, 206, 0)},
        draw = function(x, y, w, h)
            stripes(STRIPE_1, x, y, w, h)
        end,
    },
    ["German Empire"] = {
        colours = {BLACK, WHITE, C(221, 0, 0)},
        draw = function(x, y, w, h)
            stripes(STRIPE_14, x, y, w, h)
        end,
    },
    ["Soviet Union"] = {
        colours = {C(204, 0, 0), C(255, 215, 0)},
        draw = function(x, y, w, h)
            box(C(204, 0, 0), x, y, w, h)

            local t = math.max(2, h * 0.13)

            box(C(255, 215, 0), x + w * 0.14, y + h * 0.18, t * 2.6, t)
            box(C(255, 215, 0), x + w * 0.14, y + h * 0.18, t, h * 0.36)
        end,
    },
    ["Russian Empire"] = {
        colours = {WHITE, C(255, 212, 0), BLACK},
        draw = function(x, y, w, h)
            stripes(STRIPE_2, x, y, w, h)
        end,
    },
    ["Russia"] = {
        colours = {WHITE, C(0, 57, 166), C(213, 43, 30)},
        draw = function(x, y, w, h)
            stripes(STRIPE_3, x, y, w, h)
        end,
    },
    ["Ukraine"] = {
        colours = STRIPE_15,
        draw = function(x, y, w, h)
            stripes(STRIPE_15, x, y, w, h)
        end,
    },
    ["Japan"] = {
        colours = {WHITE, C(188, 0, 45)},
        draw = function(x, y, w, h)
            box(WHITE, x, y, w, h)
            disc(C(188, 0, 45), x, y, w, h, 0.3)
        end,
    },
    ["Austria"] = {
        colours = {C(237, 41, 57), WHITE},
        draw = function(x, y, w, h)
            stripes(STRIPE_4, x, y, w, h)
        end,
    },
    ["Italy"] = {
        colours = {C(0, 140, 69), WHITE, C(205, 33, 42)},
        draw = function(x, y, w, h)
            stripes(STRIPE_5, x, y, w, h, true)
        end,
    },
    ["France"] = {
        colours = {C(0, 85, 164), WHITE, C(239, 65, 53)},
        draw = function(x, y, w, h)
            stripes(STRIPE_6, x, y, w, h, true)
        end,
    },
    ["Belgium"] = {
        colours = {BLACK, C(250, 209, 5), C(237, 41, 57)},
        draw = function(x, y, w, h)
            stripes(STRIPE_7, x, y, w, h, true)
        end,
    },
    ["Romania"] = {
        colours = {C(0, 43, 127), C(252, 209, 22), C(206, 17, 38)},
        draw = function(x, y, w, h)
            stripes(STRIPE_8, x, y, w, h, true)
        end,
    },
    ["Canada"] = {
        colours = {C(213, 43, 30), WHITE},
        draw = function(x, y, w, h)
            box(WHITE, x, y, w, h)
            box(C(213, 43, 30), x, y, w * 0.25, h)
            box(C(213, 43, 30), x + w * 0.75, y, w * 0.25, h)
            disc(C(213, 43, 30), x, y, w, h, 0.19)
        end,
    },
    ["Israel"] = {
        colours = {WHITE, C(0, 56, 184)},
        draw = function(x, y, w, h)
            box(WHITE, x, y, w, h)

            local t = math.max(2, h * 0.14)

            box(C(0, 56, 184), x, y + h * 0.16, w, t)
            box(C(0, 56, 184), x, y + h * 0.84 - t, w, t)
            disc(C(0, 56, 184), x, y, w, h, 0.17)
        end,
    },
    ["Hungary"] = {
        colours = {C(205, 42, 52), WHITE, C(67, 111, 66)},
        draw = function(x, y, w, h)
            stripes(STRIPE_9, x, y, w, h)
        end,
    },
    ["China"] = {
        colours = {C(238, 28, 37), C(255, 222, 0)},
        draw = function(x, y, w, h)
            box(C(238, 28, 37), x, y, w, h)

            local t = math.max(2, h * 0.16)

            box(C(255, 222, 0), x + w * 0.12, y + h * 0.18, t * 1.6, t * 1.6)
            box(C(255, 222, 0), x + w * 0.33, y + h * 0.12, t * 0.7, t * 0.7)
            box(C(255, 222, 0), x + w * 0.33, y + h * 0.34, t * 0.7, t * 0.7)
        end,
    },
    ["Sweden"] = {
        colours = {C(0, 106, 167), C(254, 205, 0)},
        draw = function(x, y, w, h) nordic(C(0, 106, 167), C(254, 205, 0), x, y, w, h) end,
    },
    ["Finland"] = {
        colours = {WHITE, C(0, 53, 128)},
        draw = function(x, y, w, h) nordic(WHITE, C(0, 53, 128), x, y, w, h) end,
    },
    ["Denmark"] = {
        colours = {C(198, 12, 48), WHITE},
        draw = function(x, y, w, h) nordic(C(198, 12, 48), WHITE, x, y, w, h) end,
    },
    ["Bulgaria"] = {
        colours = {WHITE, C(0, 150, 110), C(214, 38, 18)},
        draw = function(x, y, w, h)
            stripes(STRIPE_10, x, y, w, h)
        end,
    },
    ["Czech Republic"] = {
        colours = {WHITE, C(215, 20, 26), C(17, 69, 126)},
        draw = function(x, y, w, h)
            box(WHITE, x, y, w, h * 0.5)
            box(C(215, 20, 26), x, y + h * 0.5, w, h * 0.5)
            hoistTriangle(C(17, 69, 126), x, y, w, h)
        end,
    },
    ["Yugoslavia"] = {
        colours = {C(0, 57, 166), WHITE, C(213, 43, 30)},
        draw = function(x, y, w, h)
            stripes(STRIPE_11, x, y, w, h)
            disc(C(218, 41, 28), x, y, w, h, 0.16)
        end,
    },
    ["Singapore"] = {
        colours = {C(237, 41, 57), WHITE},
        draw = function(x, y, w, h)
            stripes(STRIPE_12, x, y, w, h)

            local t = math.max(2, h * 0.13)

            box(WHITE, x + w * 0.1, y + h * 0.14, t * 1.6, t * 1.6)
        end,
    },
    ["Indonesia"] = {
        colours = {C(206, 17, 38), WHITE},
        draw = function(x, y, w, h)
            stripes(STRIPE_13, x, y, w, h)
        end,
    },
    ["Colombia"] = {
        colours = {C(252, 209, 22), C(0, 56, 147), C(206, 17, 38)},
        draw = function(x, y, w, h)
            box(C(252, 209, 22), x, y, w, h * 0.5)
            box(C(0, 56, 147), x, y + h * 0.5, w, h * 0.25)
            box(C(206, 17, 38), x, y + h * 0.75, w, h * 0.25)
        end,
    },
    ["South Africa"] = {
        colours = {C(0, 122, 77), C(255, 182, 18), C(222, 56, 49), C(0, 31, 99)},
        draw = function(x, y, w, h)
            box(C(222, 56, 49), x, y, w, h * 0.5)
            box(C(0, 31, 99), x, y + h * 0.5, w, h * 0.5)
            box(C(255, 182, 18), x, y + h * 0.36, w * 0.5, h * 0.28)
            box(C(0, 122, 77), x, y + h * 0.4, w * 0.42, h * 0.2)
        end,
    },
    ["Holy Roman Empire"] = {
        colours = {C(255, 206, 0), BLACK},
        draw = function(x, y, w, h)
            box(C(255, 206, 0), x, y, w, h)
            disc(BLACK, x, y, w, h, 0.22)
        end,
    },
    ["Unknown"] = {
        colours = {C(120, 126, 134)},
        draw = function(x, y, w, h) box(C(120, 126, 134), x, y, w, h) end,
    },
}

local COUNTRY_TEXT = {}

local function flagOf(name)
    return isstring(name) and COUNTRY_FLAG[name] or nil
end

local function flagTextColour(entry)
    local cached = COUNTRY_TEXT[entry]
    if cached then return cached end

    local best, score

    for _, col in ipairs(entry.colours) do
        local sum = col.r + col.g + col.b

        if sum > 230 and sum < 690 then
            local peak = math.max(col.r, col.g, col.b)

            if not score or peak > score then best, score = col, peak end
        end
    end

    best = best or color_white
    COUNTRY_TEXT[entry] = best

    return best
end

local function drawFlag(entry, x, y, w, h)
    flagAlpha = 255
    entry.draw(x, y, w, h)

    surface.SetDrawColor(0, 0, 0, 200)
    surface.DrawOutlinedRect(x, y, w, h)
end

local FADE_SLICES, QUIET_SLICES = 7, 3

local function drawFlagFade(entry, pnl, x, y, w, h, peak, clipTop, clipBottom)
    if h <= 0 then return end

    local slices = quiet() and QUIET_SLICES or FADE_SLICES
    local sliceH = h / slices
    local sx, sy = pnl:LocalToScreen(x, y)

    for i = 0, slices - 1 do
        local alpha = peak * (1 - i / slices)

        if alpha >= 2 then
            local top = math.floor(sy + i * sliceH)
            local bottom = math.ceil(sy + (i + 1) * sliceH)

            if not (clipTop and (bottom < clipTop or top > clipBottom)) then
                render.SetScissorRect(sx, top, sx + w, bottom, true)

                flagAlpha = alpha
                entry.draw(x, y, w, h)

                render.SetScissorRect(0, 0, 0, 0, false)
            end
        end
    end

    flagAlpha = 255
end

local BLEND_COLUMNS = 16

local function wash(cols, x, y, w, h, alpha)
    local n = #cols

    if n < 2 then
        local col = cols[1]

        surface.SetDrawColor(col.r, col.g, col.b, alpha)
        surface.SetMaterial(gradientDown)
        surface.DrawTexturedRect(x, y, w, h)

        return
    end

    local cw = w / BLEND_COLUMNS

    for i = 0, BLEND_COLUMNS - 1 do
        local t = (i / (BLEND_COLUMNS - 1)) * (n - 1)
        local lo = math.floor(t)
        local hi = math.min(lo + 2, n)
        local f = t - lo

        local a, b = cols[lo + 1], cols[hi]

        surface.SetDrawColor(
            Lerp(f, a.r, b.r), Lerp(f, a.g, b.g), Lerp(f, a.b, b.b), alpha)
        surface.SetMaterial(gradientDown)
        surface.DrawTexturedRect(x + i * cw, y, math.ceil(cw) + 1, h)
    end
end

local function drawFlagRule(entry, w, y, h)
    local cols = entry.colours
    local bands = #cols
    local bw = w / bands

    for i = 1, bands do
        local col = cols[i]

        surface.SetDrawColor(col.r, col.g, col.b, 225)
        surface.DrawRect((i - 1) * bw, y, math.ceil(bw), h)
    end
end

local CLASS_RULES = {
    {"launcher", "Launchers"},
    {"mine", "Mines"},
    {"grenade", "Grenades"},
    {"incendiary", "Grenades"},
    {"molotov", "Grenades"},
    {"charge", "Remote Explosives"},
    {"demolition", "Remote Explosives"},
    {"explosive device", "Remote Explosives"},
    {"melee", "Melee"},
    {"pistol", "Sidearms"},
    {"revolver", "Sidearms"},
    {"shotgun", "Shotguns"},
    {"submachine", "Submachine Guns"},
    {"machine gun", "Machine Guns"},
    {"anti-materiel", "Anti-Materiel Rifles"},
    {"anti-material", "Anti-Materiel Rifles"},
    {"anti-tank rifle", "Anti-Materiel Rifles"},
    {"antitank rifle", "Anti-Materiel Rifles"},
    {"anti materiel", "Anti-Materiel Rifles"},
    {"sniper", "Sniper Rifles"},
    {"marksman", "Marksman Rifles"},
    {"battle rifle", "Battle Rifles"},
    {"assault rifle", "Assault Rifles"},
    {"assault carbine", "Assault Rifles"},
    {"automatic rifle", "Assault Rifles"},
    {"carbine", "Assault Rifles"},
    {"bolt-action", "Battle Rifles"},
    {"bolt action", "Battle Rifles"},
    {"lever-action", "Battle Rifles"},
    {"lever action", "Battle Rifles"},
    {"service rifle", "Battle Rifles"},
    {"rifle", "Rifles"},
    {"signal", "Equipment"},
    {"reconnaissance", "Equipment"},
    {"distraction", "Equipment"},
    {"munition", "Equipment"},
}

local CLASS_ICON_SOURCE = {
    ["Sidearms"] = "arccw_ud_glock",
    ["Submachine Guns"] = "arccw_ur_mp5",
    ["Personal Defense Weapon"] = "arccw_uc_ar57",
    ["Shotguns"] = "arccw_ud_870",
    ["Assault Rifles"] = "arccw_ur_ak",
    ["Battle Rifles"] = "arccw_ur_g3",
    ["Rifles"] = "arccw_uc_mosin",
    ["Marksman Rifles"] = "arccw_uc_psl",
    ["Sniper Rifles"] = "arccw_ur_aw",
    ["Anti-Materiel Rifles"] = "arccw_ua_m82",
    ["Machine Guns"] = "arccw_ua_m249",
    ["Launchers"] = "arccw_uc_rpg7",
    ["Melee"] = "arccw_uc_kabar",
    ["Grenades"] = "arccw_uo_m67",
    ["Mines"] = "arccw_uo_claymore",
    ["Remote Explosives"] = "arccw_uo_c4",
    ["Equipment"] = "arccw_uo_flare",
}

local ERA_ICON_SOURCE = {
    ["Pre-Industrial"] = "arccw_uc_zweihander",
    ["Industrial Age"] = "arccw_uc_mhenry",
    ["First World War"] = "arccw_uo_mills",
    ["Interwar"] = "arccw_uc_tommy",
    ["Second World War"] = "arccw_uc_sks",
    ["Early Cold War"] = "arccw_ur_ak",
    ["Vietnam"] = "arccw_ud_mini14",
    ["Late Cold War"] = "arccw_uc_steyracr",
    ["Modern"] = "arccw_myt_uc_scar",
    ["Near Future"] = "arccw_uc_evolys",
    ["Undated"] = "arccw_uc_crowbar",
}

local WHITE_ICON = {}

local function whiteIcon(source)
    if not isstring(source) then return nil end

    local cached = WHITE_ICON[source]
    if cached ~= nil then return cached or nil end

    local mat = Material("entities/" .. source .. ".png", "smooth mips")

    if not mat or mat:IsError() then
        WHITE_ICON[source] = false
        return nil
    end

    local okay, tex = pcall(mat.GetTexture, mat, "$basetexture")

    if okay and tex and not tex:IsError() then
        local white = CreateMaterial("uc_menu_white_" .. source .. "_2", "UnlitGeneric", {
            ["$basetexture"] = "color/white",
            ["$translucent"] = "1",
            ["$vertexcolor"] = "1",
            ["$vertexalpha"] = "1",
            ["$color2"] = "[255 255 255]",
        })

        if white and not white:IsError() then
            pcall(white.SetTexture, white, "$basetexture", tex)
            pcall(white.SetVector, white, "$color2", Vector(255, 255, 255))
            pcall(white.Recompute, white)

            mat = white
        end
    end

    WHITE_ICON[source] = mat

    return mat
end

local function classIcon(name)
    if not isstring(name) then return nil end

    return whiteIcon(CLASS_ICON_SOURCE[name])
end

local function eraIcon(name)
    if not isstring(name) then return nil end

    return whiteIcon(ERA_ICON_SOURCE[name])
end

local CLASS_ORDER = {
    "Sidearms", "Submachine Guns", "Personal Defense Weapon", "Shotguns",
    "Assault Rifles", "Battle Rifles", "Rifles",
    "Marksman Rifles", "Sniper Rifles", "Anti-Materiel Rifles",
    "Machine Guns", "Launchers", "Melee", "Grenades", "Mines",
    "Remote Explosives", "Equipment", "Other",
}

local CLASS_OVERRIDE = {
    ["arccw_uc_barrett_mars"] = "Launchers",
    ["arccw_uc_6p62"] = "Machine Guns",
    ["arccw_uc_aa12"] = "Shotguns",
    ["arccw_uc_beretta"] = "Sidearms",
    ["arccw_uc_c96"] = "Sidearms",
    ["arccw_uc_carpati"] = "Sidearms",
    ["arccw_uc_fort230"] = "Submachine Guns",
    ["arccw_uc_igla"] = "Launchers",
    ["arccw_uc_javelin"] = "Launchers",
    ["arccw_uc_ks23"] = "Shotguns",
    ["arccw_uc_lewis"] = "Machine Guns",
    ["arccw_uc_m37"] = "Shotguns",
    ["arccw_uc_pkm"] = "Machine Guns",
    ["arccw_uc_reapr"] = "Machine Guns",
    ["arccw_uc_rpg26"] = "Launchers",
    ["arccw_uc_svd"] = "Marksman Rifles",
}

local COUNTRY_ALIAS = {
    ["usa"] = "United States",
    ["us"] = "United States",
    ["u.s.a."] = "United States",
    ["u.s."] = "United States",
    ["united states"] = "United States",
    ["united states of america"] = "United States",
    ["america"] = "United States",

    ["ussr"] = "Soviet Union",
    ["u.s.s.r."] = "Soviet Union",
    ["cccp"] = "Soviet Union",
    ["soviet union"] = "Soviet Union",
    ["soviet russia"] = "Soviet Union",

    ["uk"] = "United Kingdom",
    ["u.k."] = "United Kingdom",
    ["great britain"] = "United Kingdom",
    ["britain"] = "United Kingdom",
    ["england"] = "United Kingdom",
    ["united kingdom"] = "United Kingdom",

    ["west germany"] = "Germany",
    ["east germany"] = "Germany",
    ["nazi germany"] = "Germany",
    ["german reich"] = "Germany",
    ["germany"] = "Germany",

    ["german empire"] = "German Empire",

    ["ukraine"] = "Ukraine",
    ["ua"] = "Ukraine",
    ["ukr"] = "Ukraine",

    ["czechia"] = "Czech Republic",
    ["czech republic"] = "Czech Republic",

    ["zuid afrika"] = "South Africa",
    ["south africa"] = "South Africa",

    ["wallonia"] = "Belgium",
    ["flanders"] = "Belgium",
    ["belgium"] = "Belgium",

    ["prc"] = "China",
    ["people's republic of china"] = "China",
    ["china"] = "China",

    ["-"] = "Unknown",
    ["?"] = "Unknown",
    ["n/a"] = "Unknown",
    ["none"] = "Unknown",
    ["unmarked"] = "Unknown",
    ["unknown"] = "Unknown",
}

local function classOf(wep)
    if isstring(wep.UC_Class) and wep.UC_Class ~= "" then return wep.UC_Class end

    local override = CLASS_OVERRIDE[string.lower(wep.ClassName or "")]
    if override then return override end

    local trivia = wep.Trivia_Class
    if not isstring(trivia) or trivia == "" then return "Other" end

    local lower = string.lower(trivia)

    for _, rule in ipairs(CLASS_RULES) do
        if string.find(lower, rule[1], 1, true) then return rule[2] end
    end

    return trivia
end

local function countryOf(wep)
    if isstring(wep.UC_Country) and wep.UC_Country ~= "" then return wep.UC_Country end

    local raw = wep.Trivia_Country
    if not isstring(raw) then return "Unknown" end

    local name = string.Trim(string.gsub(raw, "%s+", " "))

    name = string.match(name, "^([^/]+)") or name
    name = string.Trim(name)

    if name == "" then return "Unknown" end

    local alias = COUNTRY_ALIAS[string.lower(name)]
    if alias then return alias end

    return name
end

local function eraOf(wep)
    if isstring(wep.UC_Era) and wep.UC_Era ~= "" then return wep.UC_Era, 0 end

    local year = tonumber(wep.Trivia_Year)

    if not year then return "Undated", #ERAS + 1 end

    for i, era in ipairs(ERAS) do
        if year <= era[1] then return era[2], i end
    end

    return "Undated", #ERAS + 1
end

local function packOf(wep)
    local raw = wep.UC_CategoryPack

    if not isstring(raw) or raw == "" then return "\255Unsorted", "Unsorted" end

    local shown = string.match(raw, "^%d+(.*)$")

    if not shown or shown == "" then shown = raw end

    return raw, string.Trim(shown)
end

local function ucWeapons()
    local out = {}

    for _, entry in pairs(weapons.GetList() or {}) do
        local class = entry and entry.ClassName

        if isstring(class) then
            local wep = entry

            if wep.Category == nil then wep = weapons.Get(class) end

            if wep and wep.Spawnable and wep.Category == CATEGORY then
                wep.ClassName = wep.ClassName or class
                out[#out + 1] = wep
            end
        end
    end

    return out
end

local function grouped(mode)
    local groups, label, sortKey, rank = {}, {}, {}, {}

    for _, wep in ipairs(ucWeapons()) do
        local key, shown

        if mode == SORT_CLASS then
            key = classOf(wep)
            shown = key
        elseif mode == SORT_COUNTRY then
            key = countryOf(wep)
            shown = key
        elseif mode == SORT_ERA then
            local era, index = eraOf(wep)

            key, shown = era, era
            rank[key] = index
        else
            key, shown = packOf(wep)
        end

        groups[key] = groups[key] or {}
        label[key] = shown
        sortKey[key] = (mode == SORT_ALPHA) and string.lower(shown) or key

        table.insert(groups[key], wep)
    end

    for _, list in pairs(groups) do
        table.sort(list, function(a, b)
            return string.lower(a.PrintName or a.ClassName or "")
                 < string.lower(b.PrintName or b.ClassName or "")
        end)
    end

    local order = {}
    for key in pairs(groups) do order[#order + 1] = key end

    if mode == SORT_CLASS then
        local rank = {}
        for i, name in ipairs(CLASS_ORDER) do rank[name] = i end

        table.sort(order, function(a, b)
            local ra, rb = rank[a] or 900, rank[b] or 900
            if ra ~= rb then return ra < rb end
            return a < b
        end)
    elseif mode == SORT_COUNTRY then
        table.sort(order, function(a, b)
            if (a == "Unknown") ~= (b == "Unknown") then return b == "Unknown" end
            return a < b
        end)
    elseif mode == SORT_ERA then
        table.sort(order, function(a, b)
            local ra, rb = rank[a] or 900, rank[b] or 900
            if ra ~= rb then return ra < rb end
            return a < b
        end)
    else
        table.sort(order, function(a, b) return sortKey[a] < sortKey[b] end)
    end

    return groups, order, label
end

local dragFrame, dragging = -1, false

local function isDragging()
    local frame = FrameNumber()

    if dragFrame ~= frame then
        dragFrame = frame
        dragging = dragndrop.IsDragging()
    end

    return dragging
end

local function measure(container)
    local frame = FrameNumber()

    if container.UCRangeFrame ~= frame then
        container.UCRangeFrame = frame

        local bar = container.VBar
        local scroll = IsValid(bar) and bar:GetScroll() or 0
        local tall = container:GetTall()
        local _, sy = container:LocalToScreen(0, 0)

        container.UCTop = scroll - 80
        container.UCBottom = scroll + tall + 80
        container.UCScreenTop = sy - 80
        container.UCScreenBottom = sy + tall + 80
    end
end

local function visibleRange(container)
    measure(container)

    return container.UCTop, container.UCBottom
end

local function screenRange(container)
    measure(container)

    return container.UCScreenTop, container.UCScreenBottom
end

local function scrollerOf(pnl)
    local target = pnl
    local depth = 0

    while IsValid(target) and depth < 16 do
        if IsValid(target.VBar) then return target end
        target = target:GetParent()
        depth = depth + 1
    end

    return nil
end

local BULLET_ICONS = {
    "3006springfield", "300blackout", "300winchester", "3030winchester",
    "408cheytac", "460roland", "454casull", "65creedmoor", "65grendal",
    "223remington", "357magnum", "44magnum", "44special", "50beowulf",
    "545x39", "556x45", "762x39", "762x51", "762x54", "30carbine",
    "338lapua", "380acp", "357sig", "429de", "45acp", "45gap", "46x30",
    "40vog", "40sw", "50ae", "50gi", "57x28", "9x18", "9x19", "9x39",
    "22lr", "12g", "20g", "10", "40",
}

local BULLET_ALIAS = {
    ["22longrifle"] = "22lr",
    ["50actionexpress"] = "50ae",
    ["50gi"] = "50gi",
    ["12gauge"] = "12g",
    ["20gauge"] = "20g",
}

local BULLET_CACHE = {}

local function bulletIcon(calibre)
    if not isstring(calibre) then return nil end

    local cached = BULLET_CACHE[calibre]
    if cached ~= nil then return cached or nil end

    local key = string.lower(calibre)

    key = string.gsub(key, "\195\151", "x")
    key = string.gsub(key, "[^%w]", "")

    local name = BULLET_ALIAS[key]

    if not name then
        local best

        for _, icon in ipairs(BULLET_ICONS) do
            if string.sub(key, 1, #icon) == icon then
                if not best or #icon > #best then best = icon end
            end
        end

        name = best
    end

    if not name then
        BULLET_CACHE[calibre] = false
        return nil
    end

    local mat = Material("entities/att/uc_bullets/" .. name .. ".png", "smooth mips")

    if not mat or mat:IsError() then
        BULLET_CACHE[calibre] = false
        return nil
    end

    BULLET_CACHE[calibre] = mat

    return mat
end

local hoverMatrix = Matrix()
local hoverVec = Vector()

local tooltip

local function shorten(text, limit)
    if not isstring(text) then return nil end

    text = string.Trim(text)
    if text == "" or text == "-" then return nil end

    if #text > limit then return string.sub(text, 1, limit - 1) .. "..." end

    return text
end

local function tooltipPanel()
    if IsValid(tooltip) then return tooltip end

    tooltip = vgui.Create("DPanel")

    tooltip:SetDrawOnTop(true)
    tooltip:SetMouseInputEnabled(false)
    tooltip:SetVisible(false)

    tooltip.Paint = function(pnl, w, h)
        local col = pnl.Accent or color_white

        local sk = theme()
        local back = sk.back

        surface.SetDrawColor(back.r, back.g, back.b, 246)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(col.r, col.g, col.b, 34)
        surface.SetMaterial(gradient)
        surface.DrawTexturedRect(0, 0, w, h)

        surface.SetDrawColor(col.r, col.g, col.b, 225)
        surface.DrawRect(0, 0, 3, h)

        surface.SetDrawColor(col.r, col.g, col.b, 95)
        surface.DrawOutlinedRect(0, 0, w, h)

        draw.SimpleText(pnl.Title or "", "UCWepSel2", 12, 8, sk.title,
            TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

        local y = 30

        for i = 1, #pnl.Rows do
            local row = pnl.Rows[i]
            local x = 12

            if row.icon then
                local ink = sk.title

                surface.SetDrawColor(ink.r, ink.g, ink.b, 235)
                surface.SetMaterial(row.icon)
                surface.DrawTexturedRect(12, y - 1, 18, 18)

                x = 36
            elseif row.flag then
                drawFlag(row.flag, 12, y + 2, 18, 12)

                x = 36
            end

            draw.SimpleText(row.text, "UCWepSel3", x, y, row.dim
                and sk.dim or sk.text,
                TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

            y = y + 20
        end
    end

    return tooltip
end

local function showTooltip(icon)
    local pnl = tooltipPanel()
    local data = icon.UCTip

    if not data then return end

    pnl.Title = data.title
    pnl.Rows = data.rows
    pnl.Accent = data.accent or color_white

    surface.SetFont("UCWepSel2")
    local tw = surface.GetTextSize(data.title or "")

    surface.SetFont("UCWepSel3")

    for i = 1, #data.rows do
        local row = data.rows[i]
        local rw = surface.GetTextSize(row.text)

        if row.icon or row.flag then rw = rw + 24 end

        tw = math.max(tw, rw)
    end

    pnl:SetSize(tw + 26, 34 + #data.rows * 20)
    pnl:SetVisible(true)
    pnl:SetAlpha(0)
    pnl:AlphaTo(255, 0.12, 0)
end

local function showLabelTooltip(text)
    if not isstring(text) then return end

    local pnl = tooltipPanel()

    pnl.Title = text
    pnl.Rows = {}
    pnl.Accent = Color(ACCENT_R, ACCENT_G, ACCENT_B)

    surface.SetFont("UCWepSel2")

    pnl:SetSize(surface.GetTextSize(text) + 26, 34)
    pnl:SetVisible(true)
    pnl:SetAlpha(0)
    pnl:AlphaTo(255, 0.12, 0)
end

local function hideTooltip()
    if IsValid(tooltip) then tooltip:SetVisible(false) end
end

local strips = {}

local function updateStrip(pnl)
    local container = pnl.UCContainer

    if not IsValid(container) then
        pnl:Remove()
        return
    end

    local visible = container:IsVisible()

    if pnl:IsVisible() ~= visible then pnl:SetVisible(visible) end
    if not visible then return end

    local owner = pnl:GetParent()
    if not IsValid(owner) then return end

    local cx, cy = container:LocalToScreen(0, 0)
    local ox, oy = owner:LocalToScreen(0, 0)

    local bar = container.VBar
    local inset = (IsValid(bar) and bar:IsVisible()) and bar:GetWide() or 0

    pnl:SetPos(
        (cx - ox) + container:GetWide() - pnl:GetWide() - inset - 8,
        math.max(cy - oy, 0) + 10)
end

hook.Remove("Think", PATCH .. ".Tooltip")

hook.Add("Think", PATCH .. ".Frame", function()
    if not menuOpen() then return end

    for i = #strips, 1, -1 do
        local pnl = strips[i]

        if not IsValid(pnl) then
            table.remove(strips, i)
        else
            updateStrip(pnl)
        end
    end

    if not tooltip then return end
    if not IsValid(tooltip) or not tooltip:IsVisible() then return end

    local x, y = input.GetCursorPos()
    local w, h = tooltip:GetSize()

    tooltip:SetPos(
        math.Clamp(x + 18, 0, ScrW() - w - 4),
        math.Clamp(y + 20, 0, ScrH() - h - 4))
end)

local function makeButton(strip, label, sound, onClick)
    local button = vgui.Create("DButton", strip)

    button:SetSize(36, 36)
    button:SetText("")

    button.Glow = 0
    button.UCLabel = label

    button.OnCursorEntered = function(pnl)
        surface.PlaySound(SND_HOVER)
        showLabelTooltip(pnl.UCLabel)
    end

    button.OnCursorExited = function() hideTooltip() end

    button.Paint = function(pnl, w, h)
        local glow = math.Approach(pnl.Glow, pnl:IsHovered() and 1 or 0, FrameTime() * 7)

        pnl.Glow = glow

        local panel = theme().panel

        surface.SetDrawColor(panel.r, panel.g, panel.b, 180 + 60 * glow)
        surface.DrawRect(0, 0, w, h)

        if glow > 0.01 then
            surface.SetDrawColor(ACCENT_R, ACCENT_G, ACCENT_B, 34 * glow)
            surface.SetMaterial(gradientUp)
            surface.DrawTexturedRect(0, 0, w, h)
        end

        surface.SetDrawColor(ACCENT_R, ACCENT_G, ACCENT_B, 80 + 175 * glow)
        surface.DrawOutlinedRect(0, 0, w, h)

        if pnl.Icon then
            local pad = 7 - glow

            surface.SetDrawColor(255, 255, 255, 195 + 60 * glow)
            surface.SetMaterial(pnl.Icon)
            surface.DrawTexturedRect(pad, pad, w - pad * 2, h - pad * 2)
        end
    end

    button.SetIconPath = function(pnl, path)
        if pnl.IconPath == path then return end

        pnl.IconPath = path
        pnl.Icon = Material(path, "smooth")
    end

    button.DoClick = function(pnl)
        surface.PlaySound(sound or SND_CLICK)
        onClick(pnl)
    end

    return button
end

local function rebuild(node)
    if not IsValid(node) then return end

    if IsValid(node.PropPanel) then node.PropPanel:Remove() end

    node.PropPanel = nil
    node:InternalDoClick()
end

local function buildOverlay(container, node)
    local host = container:GetParent()
    if not IsValid(host) then host = container end

    local strip = vgui.Create("DPanel", host)

    strip:SetSize(36, 36 * 4 + 22)
    strip:SetZPos(32767)

    strip.Paint = function(pnl, w, h)
        local panel = theme().panel

        surface.SetDrawColor(panel.r, panel.g, panel.b, 150)
        surface.SetMaterial(gradient)
        surface.DrawTexturedRect(0, 0, w, h)
    end

    local sortButton = makeButton(strip, "Change grouping", SND_CYCLE, function()
        local mode = sortMode()
        local next = (mode + 1) % SORT_COUNT

        RunConsoleCommand("arccw_uc_menu_sort", tostring(next))

        timer.Simple(0, function() rebuild(node) end)
    end)

    sortButton:SetPos(0, 0)

    sortButton.Think = function(pnl)
        local mode = sortMode()
        local info = SORT_INFO[mode] or SORT_INFO[SORT_PACK]

        pnl:SetIconPath(info[1])

        if pnl.UCLabel ~= info[2] then
            pnl.UCLabel = info[2]

            if IsValid(tooltip) and tooltip:IsVisible() and pnl:IsHovered() then
                showLabelTooltip(info[2])
            end
        end
    end

    local top = makeButton(strip, "Back to the top", SND_CLICK, function()
        local scroller = scrollerOf(container)

        if IsValid(scroller) and IsValid(scroller.VBar) then
            scroller.VBar:AnimateTo(0, 0.25, 0, 0.4)
        end
    end)

    top:SetIconPath("icon16/arrow_up.png")
    top:SetPos(0, 42)

    local backdrop = makeButton(strip, "Show or hide the backdrop", SND_CLICK, function()
        RunConsoleCommand("arccw_uc_menu_logo", logoOn() and "0" or "1")
    end)

    backdrop:SetIconPath("icon16/picture.png")
    backdrop:SetPos(0, 84)

    local skin = makeButton(strip, "Dark or light theme", SND_CLICK, function()
        RunConsoleCommand("arccw_uc_menu_theme", lightOn() and "0" or "1")
    end)

    skin:SetPos(0, 126)

    skin.Think = function(pnl)
        local light = lightOn()

        pnl:SetIconPath(light and "icon16/weather_sun.png" or "icon16/weather_clouds.png")

        local label = light and "Light theme" or "Dark theme"

        if pnl.UCLabel ~= label then
            pnl.UCLabel = label

            if IsValid(tooltip) and tooltip:IsVisible() and pnl:IsHovered() then
                showLabelTooltip(label)
            end
        end
    end

    strip.UCContainer = container
    strips[#strips + 1] = strip

    updateStrip(strip)

    return strip
end

local function paintBackdrop(pnl, w, h)
    local sk = theme()
    local tint = sk.tint

    surface.SetDrawColor(tint.r, tint.g, tint.b, sk.tintFlat)
    surface.DrawRect(0, 0, w, h)

    surface.SetDrawColor(tint.r, tint.g, tint.b, sk.tintFade)
    surface.SetMaterial(gradientUp)
    surface.DrawTexturedRect(0, 0, w, h)

    if not logoOn() then return end
    if not logo or logo:IsError() then return end

    local size = math.min(w, h) * 0.75
    if size <= 8 then return end

    local mark = sk.logo
    local pulse = sk.logoAlpha + 10 * math.sin(RealTime() * 0.7)

    surface.SetDrawColor(mark.r, mark.g, mark.b, pulse)
    surface.SetMaterial(logo)
    surface.DrawTexturedRect((w - size) * 0.5, (h - size) * 0.5, size, size)
end

local function addIcon(container, wep)
    if not isfunction(CreateUCWeapon) then return end

    local icon = CreateUCWeapon(container, {
        nicename = wep.PrintName or wep.ClassName,
        spawnname = wep.ClassName,
        material = wep.IconOverride or ("entities/" .. tostring(wep.ClassName) .. ".png"),
        admin = wep.AdminOnly,

        uc_manu = wep.Trivia_Manufacturer,
        uc_year = wep.Trivia_Year,
        uc_cali = wep.Trivia_Calibre,
    })

    if not IsValid(icon) then return end

    local rows = {}

    local class = shorten(classOf(wep), 24)
    local cali = shorten(wep.Trivia_Calibre, 26)
    local year = tonumber(wep.Trivia_Year)
    local country = countryOf(wep)

    if class then
        rows[#rows + 1] = {
            text = year and (class .. "   " .. math.floor(year)) or class,
            icon = classIcon(class),
        }
    end

    if cali then
        rows[#rows + 1] = {text = cali, icon = bulletIcon(wep.Trivia_Calibre)}
    end

    if country ~= "Unknown" then
        rows[#rows + 1] = {text = country, flag = flagOf(country), dim = true}
    end

    icon.UCTip = {
        title = wep.PrintName or wep.ClassName,
        rows = rows,
        accent = container.UCAccent,
    }

    icon:SetTooltip(nil)

    icon.Hover = 0
    icon.UCAccent = container.UCAccent
    icon.UCFlag = container.UCFlag
    icon.UCContainer = container

    local basePaint = icon.Paint

    icon.Paint = function(pnl, w, h)
        local host = pnl.UCContainer

        if IsValid(host) then
            local top, bottom = screenRange(host)
            local _, y = pnl:LocalToScreen(0, 0)

            if y + h < top or y > bottom then
                pnl.Hover = 0
                return
            end
        end

        local want = (not isDragging() and pnl:IsHovered()) and 1 or 0

        pnl.Hover = math.Approach(pnl.Hover, want, FrameTime() * 8)

        if pnl.Hover <= 0.01 then return basePaint(pnl, w, h) end

        if pnl.UCFlag then
            drawFlagFade(pnl.UCFlag, pnl, 0, 0, w, h, 52 * pnl.Hover)
        else
            local accent = pnl.UCAccent

            if accent then
                surface.SetDrawColor(accent.r, accent.g, accent.b, 44 * pnl.Hover)
                surface.SetMaterial(gradientUp)
                surface.DrawTexturedRect(0, 0, w, h)
            end
        end

        local scale = 1 + 0.05 * pnl.Hover
        local cx, cy = pnl:LocalToScreen(w * 0.5, h * 0.5)

        hoverMatrix:Identity()

        hoverVec:SetUnpacked(cx, cy, 0)
        hoverMatrix:Translate(hoverVec)

        hoverVec:SetUnpacked(scale, scale, 1)
        hoverMatrix:Scale(hoverVec)

        hoverVec:SetUnpacked(-cx, -cy, 0)
        hoverMatrix:Translate(hoverVec)

        local clip = DisableClipping(true)

        cam.PushModelMatrix(hoverMatrix)
        basePaint(pnl, w, h)
        cam.PopModelMatrix()

        DisableClipping(clip)
    end

    icon.OnCursorEntered = function(pnl)
        surface.PlaySound(SND_HOVER)
        showTooltip(pnl)
    end

    icon.OnCursorExited = hideTooltip

    local baseClick = icon.DoClick

    icon.DoClick = function(pnl)
        surface.PlaySound(SND_SELECT)
        hideTooltip()
        goQuiet()

        if baseClick then baseClick(pnl) end
    end
end

local function populate(node, pnlContent)
    if IsValid(node.PropPanel) then return end

    local container = vgui.Create("ContentContainer", pnlContent)

    node.PropPanel = container

    container:SetVisible(false)
    container:SetTriggerSpawnlistChange(false)
    container.Paint = paintBackdrop

    local mode = sortMode()
    local groups, order, label = grouped(mode)

    local packMode = (mode == SORT_PACK or mode == SORT_ALPHA)
    local sections = {}

    for _, key in ipairs(order) do
        local header = vgui.Create("ContentHeader", container)
        local name = label[key] or key

        header:SetText(name)

        local colour, badge, flag

        if packMode then
            colour, badge = packStyle(name)
        elseif mode == SORT_COUNTRY then
            flag = flagOf(name)

            if flag then colour = flagTextColour(flag) end
        elseif mode == SORT_CLASS then
            badge = classIcon(name)
        elseif mode == SORT_ERA then
            badge = eraIcon(name)
        end

        colour = colour or color_white

        header.UpdateColours = function(pnl) pnl:SetTextStyleColor(colour) end
        header:SetTextColor(colour)

        if badge or flag then
            local baseSize = header.SizeToContents

            header.SizeToContents = function(pnl)
                baseSize(pnl)
                pnl:SetWide(pnl:GetWide() + LOGO_INSET)
            end

            header:SetTextInset(LOGO_INSET, 0)
            header:SizeToContents()
        end

        local base = header.PaintOver

        header.PaintOver = function(pnl, w, h)
            surface.SetDrawColor(colour.r, colour.g, colour.b, 46)
            surface.SetMaterial(gradient)
            surface.DrawTexturedRect(0, 0, w, h)

            if flag then
                drawFlagRule(flag, w, h - 4, 2)
                drawFlag(flag, 6, (h - FLAG_H) * 0.5, FLAG_W, FLAG_H)
            else
                surface.SetDrawColor(colour.r, colour.g, colour.b, 190)
                surface.DrawRect(0, h - 4, w, 2)

                if badge then
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.SetMaterial(badge)
                    surface.DrawTexturedRect(4, (h - LOGO_SIZE) * 0.5, LOGO_SIZE, LOGO_SIZE)
                end
            end

            if base then base(pnl, w, h) end
        end

        container:Add(header)

        sections[#sections + 1] = {
            header = header,
            colour = colour,
            single = {colour},
            flag = (mode == SORT_COUNTRY) and flag or nil,
            banded = packMode or (mode == SORT_COUNTRY),
        }

        container.UCAccent = colour
        container.UCFlag = flag

        for _, wep in ipairs(groups[key]) do
            addIcon(container, wep)
        end
    end

    container.UCAccent = nil
    container.UCFlag = nil

    local list = container.IconList

    if IsValid(list) then
        local baseListPaint = list.Paint

        list.Paint = function(pnl, w, h)
            local top, bottom = visibleRange(container)
            local light = lightOn()

            for i = 1, #sections do
                local sec = sections[i]
                local head = sec.header

                if light and IsValid(head) then
                    local hy = head:GetY()
                    local ht = head:GetTall()

                    if hy + ht > top and hy < bottom then
                        surface.SetDrawColor(16, 20, 28, 165)
                        surface.DrawRect(0, hy, w, ht)
                    end
                end

                if sec.banded and IsValid(head) then
                    local y1 = head:GetY()
                    local after = sections[i + 1]
                    local y2 = (after and IsValid(after.header)) and after.header:GetY() or h
                    local band = y2 - y1

                    if band > 0 and y2 > top and y1 < bottom then
                        local col = sec.colour

                        if sec.flag then
                            local st, sb = screenRange(container)

                            drawFlagFade(sec.flag, pnl, 0, y1, w, band, 40, st, sb)
                        else
                            wash(sec.single, 0, y1, w, band, 40)
                        end

                        surface.SetDrawColor(col.r, col.g, col.b, 60)
                        surface.SetMaterial(gradientDown)
                        surface.DrawTexturedRect(0, y1, w, math.min(band, 40))

                        surface.SetDrawColor(col.r, col.g, col.b, 110)
                        surface.DrawRect(0, y1, w, 1)
                    end
                end
            end

            if baseListPaint then return baseListPaint(pnl, w, h) end
        end
    end

    buildOverlay(container, node)

    startWarming()

    container:SetAlpha(0)
    container:AlphaTo(255, 0.22, 0)
end

local WARM_PER_TICK = 2
local WARM_DELAY = 20
local PREBUILD_DELAY = 4

local warmQueue, warmIndex, warmNode, warmDone = nil, 1, nil, false

local function warmMaterial(path)
    local mat = Material(path)

    if not mat or mat:IsError() then
        local alt = string.Replace(string.Replace(path, "entities/", "VGUI/entities/"), ".png", "")

        mat = Material(alt)
    end

    queueDraw(mat)
end

local function warmTick()
    if quiet() or struggling() then return end

    if not warmQueue then
        timer.Remove(PATCH .. ".Warm")
        return
    end

    for _ = 1, WARM_PER_TICK do
        local path = warmQueue[warmIndex]

        if not path then
            warmQueue = nil
            warmDone = true
            timer.Remove(PATCH .. ".Warm")

            for name in pairs(CLASS_ICON_SOURCE) do queueDraw(classIcon(name)) end
            for name in pairs(ERA_ICON_SOURCE) do queueDraw(eraIcon(name)) end

            timer.Simple(PREBUILD_DELAY, function()
                if not IsValid(warmNode) then return end
                if IsValid(warmNode.PropPanel) then return end
                if not isfunction(warmNode.DoPopulate) then return end

                warmNode:DoPopulate()

                if IsValid(warmNode.PropPanel) then
                    warmNode.PropPanel:SetAlpha(255)
                end
            end)

            return
        end

        warmMaterial(path)

        warmIndex = warmIndex + 1
    end
end

function startWarming()
    if warmQueue or warmDone then return end

    local queue = {}

    for _, wep in pairs(weapons.GetList()) do
        if wep.Spawnable and wep.Category == CATEGORY then
            queue[#queue + 1] = wep.IconOverride
                or ("entities/" .. tostring(wep.ClassName) .. ".png")
        end
    end

    if #queue == 0 then return end

    warmQueue = queue
    warmIndex = 1

    timer.Create(PATCH .. ".Warm", 0.1, 0, warmTick)
end

local function findNode(tree)
    if not IsValid(tree) then return nil end

    local root = tree:Root()
    if not IsValid(root) then return nil end

    for _, child in pairs(root:GetChildNodes() or {}) do
        if IsValid(child) and child:GetText() == CATEGORY then return child end
    end

    return nil
end

hook.Add("PopulateWeapons", PATCH, function(pnlContent, tree, node)
    if not menuOn() then return end

    local target = findNode(tree)
    if not target then return end

    target.DoPopulate = function(self) populate(self, pnlContent) end

    if IsValid(target.PropPanel) then
        target.PropPanel:Remove()
        target.PropPanel = nil
    end

    local root = tree:Root()

    if IsValid(root) and root:GetChildNode(0) == target then
        target:InternalDoClick()
    end

    warmNode = target
end)

local function displace()
    local hooks = hook.GetTable().PopulateWeapons

    if hooks and hooks[ORIGINAL] then
        hook.Remove("PopulateWeapons", ORIGINAL)
    end
end

displace()

hook.Add("InitPostEntity", PATCH, function()
    displace()

    timer.Simple(WARM_DELAY, startWarming)
end)
hook.Add("OnReloaded", PATCH, displace)

timer.Simple(0, displace)
timer.Simple(5, displace)
