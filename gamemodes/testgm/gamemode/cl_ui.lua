-- Общие кирпичики интерфейса: масштаб под разрешение, шрифты, цвета, кнопки.
-- Всё меню F4 (cl_menu.lua, cl_shop.lua) рисуется через них.

PR_UI = PR_UI or {}

PR_UI.Colors = {
    bg = Color(16, 18, 22, 245),
    panel = Color(28, 31, 38, 255),
    panel2 = Color(36, 40, 48, 255),
    hover = Color(52, 58, 70, 255),
    line = Color(70, 76, 90, 255),
    accent = Color(196, 64, 52, 255),
    accentDark = Color(140, 44, 36, 255),
    text = Color(235, 237, 240),
    muted = Color(150, 156, 168),
    good = Color(90, 190, 110),
    bad = Color(220, 90, 80),
    gold = Color(230, 190, 90)
}

-- Масштаб: меню свёрстано под 1920x1080, на других экранах всё пропорционально
function PR_UI.UpdateScale()
    PR_UI.Scale = math.Clamp(math.min(ScrW() / 1920, ScrH() / 1080), 0.55, 2)
end

function PR_UI.S(x)
    return math.max(math.Round(x * (PR_UI.Scale or 1)), 1)
end

local S = PR_UI.S

-- Шрифты пересоздаются под масштаб: PR_UI.Font("title") -> имя шрифта
local FONT_SPECS = {
    huge = {font = "Bender", size = 40, weight = 700},
    title = {font = "Bender", size = 30, weight = 700},
    big = {font = "Bender", size = 24, weight = 600},
    normal = {font = "Bender", size = 20, weight = 500},
    small = {font = "Bender", size = 16, weight = 500}
}

function PR_UI.CreateFonts()
    PR_UI.UpdateScale()

    for name, spec in pairs(FONT_SPECS) do
        surface.CreateFont("PR_UI_" .. name, {
            font = spec.font,
            size = S(spec.size),
            weight = spec.weight,
            extended = true,
            antialias = true
        })
    end
end

function PR_UI.Font(name)
    return "PR_UI_" .. name
end

PR_UI.CreateFonts()

hook.Add("OnScreenSizeChanged", "PR_UI_Rescale", function()
    PR_UI.CreateFonts()
    hook.Run("PR_UI_Rescaled")
end)

----------------------------------------------------------------------------------------------------
-- Рисование
----------------------------------------------------------------------------------------------------

function PR_UI.Box(x, y, w, h, color)
    surface.SetDrawColor(color)
    surface.DrawRect(x, y, w, h)
end

function PR_UI.Outline(x, y, w, h, color)
    surface.SetDrawColor(color)
    surface.DrawOutlinedRect(x, y, w, h)
end

function PR_UI.Text(text, font, x, y, color, alignX, alignY)
    draw.SimpleText(text, PR_UI.Font(font), x, y, color or PR_UI.Colors.text, alignX or TEXT_ALIGN_LEFT, alignY or TEXT_ALIGN_TOP)
end

function PR_UI.Money(value)
    return string.Comma(math.floor(tonumber(value) or 0)) .. "$"
end

----------------------------------------------------------------------------------------------------
-- Виджеты
----------------------------------------------------------------------------------------------------

-- Кнопка: PR_UI.Button(parent, "Текст", function() end, {font = "normal", color = ..., disabled = func})
function PR_UI.Button(parent, text, onClick, opts)
    opts = opts or {}

    local btn = vgui.Create("DButton", parent)
    btn:SetText("")
    btn:SetTall(S(opts.height or 44))
    btn.PR_Text = text

    btn.Paint = function(self, w, h)
        local disabled = opts.disabled and opts.disabled()
        local base = opts.color or PR_UI.Colors.panel2
        local color = disabled and PR_UI.Colors.panel or (self:IsHovered() and (opts.hoverColor or PR_UI.Colors.hover) or base)

        PR_UI.Box(0, 0, w, h, color)
        if opts.selected and opts.selected() then
            PR_UI.Box(0, 0, S(4), h, PR_UI.Colors.accent)
        end

        local label = isfunction(self.PR_Text) and self.PR_Text() or self.PR_Text
        PR_UI.Text(label, opts.font or "normal", opts.alignLeft and S(14) or w / 2, h / 2,
            disabled and PR_UI.Colors.muted or PR_UI.Colors.text,
            opts.alignLeft and TEXT_ALIGN_LEFT or TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    btn.DoClick = function()
        if opts.disabled and opts.disabled() then return end
        surface.PlaySound("ui/buttonclick.wav")
        if onClick then onClick() end
    end

    return btn
end

-- Короткое уведомление в углу экрана (стандартные уведомления sandbox)
function PR_UI.Notify(text, isError)
    notification.AddLegacy(text, isError and NOTIFY_ERROR or NOTIFY_GENERIC, 3)
    surface.PlaySound(isError and "buttons/button10.wav" or "buttons/button14.wav")
end

-- Окно-попап с заголовком (редакторы, выбор). Возвращает frame и панель содержимого.
function PR_UI.Popup(title, w, h)
    local frame = vgui.Create("DFrame")
    frame:SetTitle("")
    frame:SetSize(math.min(S(w), ScrW() - S(40)), math.min(S(h), ScrH() - S(40)))
    frame:Center()
    frame:MakePopup()
    frame:ShowCloseButton(false)

    frame.Paint = function(self, fw, fh)
        PR_UI.Box(0, 0, fw, fh, PR_UI.Colors.bg)
        PR_UI.Box(0, 0, fw, S(48), PR_UI.Colors.panel)
        PR_UI.Box(0, S(48), fw, S(2), PR_UI.Colors.accent)
        PR_UI.Text(title, "big", S(16), S(24), PR_UI.Colors.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local close = PR_UI.Button(frame, "X", function() frame:Remove() end, {height = 48, font = "big", color = PR_UI.Colors.panel, hoverColor = PR_UI.Colors.accentDark})
    close:SetWide(S(48))
    close:SetPos(frame:GetWide() - S(48), 0)

    frame:DockPadding(0, 0, 0, 0)

    local body = vgui.Create("DPanel", frame)
    body:Dock(FILL)
    body:DockMargin(S(12), S(62), S(12), S(12))
    body.Paint = nil

    return frame, body
end
