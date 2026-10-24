-- Меню F4: группировка, магазины (cl_shop.lua), профиль.
-- Открывается по F4 (GM:ShowSpare2 -> open_main_menu -> сервер шлёт списки и MainMenuOpen).

PR_Menu = PR_Menu or {}

local S = PR_UI.S
local C = PR_UI.Colors

----------------------------------------------------------------------------------------------------
-- Вкладка «Группировка»
----------------------------------------------------------------------------------------------------

local function FlagPath(frac)
    return "test_gm_mat/flags/" .. string.lower(frac) .. ".png"
end

local function BuildFaction(parent)
    local ply = LocalPlayer()

    local title = vgui.Create("DLabel", parent)
    title:Dock(TOP)
    title:SetTall(S(52))
    title:DockMargin(0, 0, 0, S(10))
    title:SetFont(PR_UI.Font("title"))
    title:SetTextColor(C.text)
    title:SetText("Группировка")

    local grid = vgui.Create("DIconLayout", parent)
    grid:Dock(FILL)
    grid:SetSpaceX(S(14))
    grid:SetSpaceY(S(14))

    local list = table.Copy(PR_FRACTIONS)
    if PR_IsAdmin(ply) then table.insert(list, "admin") end

    for _, frac in ipairs(list) do
        local card = grid:Add("DButton")
        card:SetSize(S(300), S(250))
        card:SetText("")

        local flag = Material(FlagPath(frac), "smooth")

        card.Paint = function(self, w, h)
            local current = ply:GetNWString("PR_fraction") == frac
            PR_UI.Box(0, 0, w, h, self:IsHovered() and C.hover or C.panel)
            if current then PR_UI.Outline(0, 0, w, h, C.accent) PR_UI.Outline(1, 1, w - 2, h - 2, C.accent) end

            if not flag:IsError() then
                local fw, fh = w - S(40), h - S(110)
                local ratio = flag:Width() / math.max(flag:Height(), 1)
                local dw, dh = math.min(fw, fh * ratio), math.min(fh, fw / ratio)
                surface.SetDrawColor(255, 255, 255)
                surface.SetMaterial(flag)
                surface.DrawTexturedRect((w - dw) / 2, S(20) + (fh - dh) / 2, dw, dh)
            end

            PR_UI.Text(frac, "big", w / 2, h - S(70), C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            PR_UI.Text(current and "Ты здесь" or "Вступить", "normal", w / 2, h - S(34), current and C.good or C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        card.DoClick = function()
            if ply:GetNWString("PR_fraction") == frac then return end
            surface.PlaySound("ui/buttonclick.wav")

            net.Start("SetFrac")
                net.WriteString(frac)
            net.SendToServer()

            PR_UI.Notify("Группировка: " .. frac)
        end
    end
end

----------------------------------------------------------------------------------------------------
-- Вкладка «Профиль»
----------------------------------------------------------------------------------------------------

local function Bar(parent, label, getValue, getMax)
    local row = vgui.Create("DPanel", parent)
    row:Dock(TOP)
    row:SetTall(S(62))
    row:DockMargin(0, 0, 0, S(10))
    row.Paint = function(self, w, h)
        local value, max = getValue(), math.max(getMax(), 1)
        PR_UI.Text(label, "normal", 0, 0, C.muted)
        PR_UI.Text(value .. " / " .. max, "normal", w, 0, C.text, TEXT_ALIGN_RIGHT)
        PR_UI.Box(0, S(30), w, S(24), C.panel)
        PR_UI.Box(0, S(30), w * math.Clamp(value / max, 0, 1), S(24), C.accent)
    end
end

local function Stat(parent, label, getValue)
    local row = vgui.Create("DPanel", parent)
    row:Dock(TOP)
    row:SetTall(S(34))
    row.Paint = function(self, w, h)
        PR_UI.Text(label, "normal", 0, h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        PR_UI.Text(tostring(getValue()), "big", w, h / 2, C.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end
end

local function BuildProfile(parent)
    local ply = LocalPlayer()
    local function Frac() return ply:GetNWString("PR_fraction") end

    local title = vgui.Create("DLabel", parent)
    title:Dock(TOP)
    title:SetTall(S(52))
    title:DockMargin(0, 0, 0, S(10))
    title:SetFont(PR_UI.Font("title"))
    title:SetTextColor(C.text)
    title:SetText("Профиль: " .. ply:Nick())

    local columns = vgui.Create("DPanel", parent)
    columns:Dock(FILL)
    columns.Paint = nil

    local left = vgui.Create("DPanel", columns)
    left:Dock(LEFT)
    left:SetWide(S(560))
    left:DockMargin(0, 0, S(30), 0)
    left.Paint = nil

    local right = vgui.Create("DPanel", columns)
    right:Dock(FILL)
    right.Paint = nil

    Stat(left, "Группировка", function() return Frac() ~= "" and Frac() or "нет" end)
    Stat(left, "Деньги", function() return PR_UI.Money(ply:GetNWInt("PR_money")) end)
    Stat(left, "Монеты", function() return ply:GetNWInt("PR_coin") .. " ©" end)
    left:DockPadding(0, 0, 0, 0)

    local gap = vgui.Create("DPanel", left)
    gap:Dock(TOP)
    gap:SetTall(S(20))
    gap.Paint = nil

    Bar(left, "Уровень " .. ply:GetNWInt("PR_level"), function() return ply:GetNWInt("PR_exp") end, function() return ply:GetNWInt("PR_level") * 100 end)
    Bar(left, "Уровень в группировке", function() return ply:GetNWInt("PR_exp_" .. Frac()) end, function() return ply:GetNWInt("PR_level_" .. Frac()) * 100 end)
    Stat(left, "Опыт оружия группировки", function() return ply:GetNWInt("PR_weapon_exp_" .. Frac()) end)

    Stat(right, "Убийств игроков", function() return ply:GetNWInt("PR_kills") end)
    Stat(right, "Убийств NPC", function() return ply:GetNWInt("PR_kills_npc") end)
    Stat(right, "Смертей", function() return ply:GetNWInt("PR_deaths") end)
    Stat(right, "K/D", function() return math.Round(ply:GetNWInt("PR_kills") / math.max(ply:GetNWInt("PR_deaths"), 1), 2) end)
    Stat(right, "Купленного оружия", function() return #(PR_PurchasedWeapons or {}) end)
    Stat(right, "Купленной формы", function() return #(PR_PurchasedModels or {}) end)
end

----------------------------------------------------------------------------------------------------
-- Окно
----------------------------------------------------------------------------------------------------

local TABS = {
    {id = "faction", name = "Группировка", build = BuildFaction},
    {id = "weapon", name = "Оружие", build = function(p) PR_Shop.Build(p, "weapon") end},
    {id = "equip", name = "Снаряжение", build = function(p) PR_Shop.Build(p, "equip") end},
    {id = "vehicle", name = "Техника", build = function(p) PR_Shop.Build(p, "vehicle") end},
    {id = "cloth", name = "Одежда", build = function(p) PR_Shop.Build(p, "cloth") end},
    {id = "profile", name = "Профиль", build = BuildProfile}
}

PR_Menu.Tab = PR_Menu.Tab or "faction"

function PR_Menu.IsOpen()
    return IsValid(PR_Menu.Frame)
end

function PR_Menu.ShowTab(id)
    if not IsValid(PR_Menu.Content) then return end

    PR_Menu.Tab = id
    PR_Menu.Content:Clear()
    PR_Shop.Page = nil

    for _, tab in ipairs(TABS) do
        if tab.id == id then tab.build(PR_Menu.Content) end
    end
end

function PR_Menu.Open()
    if PR_Menu.IsOpen() then return end

    local ply = LocalPlayer()
    local w = math.min(S(1640), ScrW() - S(40))
    local h = math.min(S(920), ScrH() - S(40))

    local frame = vgui.Create("EditablePanel")
    frame:SetSize(w, h)
    frame:Center()
    frame:MakePopup()
    -- Клавиатура остаётся игре: F4 закрывает меню, как и открывает
    frame:SetKeyboardInputEnabled(false)
    PR_Menu.Frame = frame

    frame.Paint = function(self, fw, fh)
        Derma_DrawBackgroundBlur(self, self.PR_Opened or SysTime())
        PR_UI.Box(0, 0, fw, fh, C.bg)
        PR_UI.Box(0, 0, fw, S(64), C.panel)
        PR_UI.Box(0, S(64), fw, S(2), C.accent)

        PR_UI.Text("PR", "huge", S(24), S(32), C.accent, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        local frac = ply:GetNWString("PR_fraction")
        local info = (frac ~= "" and frac or "без группировки") .. "   ·   " .. PR_UI.Money(ply:GetNWInt("PR_money"))
            .. "   ·   уровень " .. ply:GetNWInt("PR_level")
        PR_UI.Text(info, "normal", fw - S(80), S(32), C.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end
    frame.PR_Opened = SysTime()

    local close = PR_UI.Button(frame, "X", PR_Menu.Close, {height = 64, font = "big", color = C.panel, hoverColor = C.accentDark})
    close:SetSize(S(64), S(64))
    close:SetPos(w - S(64), 0)

    -- Вкладки
    local tabs = vgui.Create("DPanel", frame)
    tabs:SetPos(0, S(66))
    tabs:SetSize(S(230), h - S(66))
    tabs.Paint = function(self, tw, th) PR_UI.Box(0, 0, tw, th, C.panel) end
    tabs:DockPadding(0, S(10), 0, 0)

    for _, tab in ipairs(TABS) do
        local btn = PR_UI.Button(tabs, tab.name, function() PR_Menu.ShowTab(tab.id) end, {
            alignLeft = true,
            height = 54,
            font = "big",
            color = C.panel,
            selected = function() return PR_Menu.Tab == tab.id end
        })
        btn:Dock(TOP)
    end

    local content = vgui.Create("DPanel", frame)
    content:SetPos(S(230) + S(20), S(66) + S(16))
    content:SetSize(w - S(230) - S(40), h - S(66) - S(32))
    content.Paint = nil
    PR_Menu.Content = content

    PR_Menu.ShowTab(PR_Menu.Tab)
end

function PR_Menu.Close()
    if IsValid(PR_Menu.Frame) then PR_Menu.Frame:Remove() end
    PR_Menu.Frame = nil
    PR_Shop.Page = nil
end

function PR_Menu.Toggle()
    if PR_Menu.IsOpen() then
        PR_Menu.Close()
    else
        PR_Menu.Open()
    end
end

net.Receive("MainMenuOpen", PR_Menu.Toggle)

-- Сменилось разрешение: пересобираем меню под новый масштаб
hook.Add("PR_UI_Rescaled", "PR_MenuRebuild", function()
    if PR_Menu.IsOpen() then
        PR_Menu.Close()
        PR_Menu.Open()
    end
end)
