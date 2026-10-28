ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.Editor = TPIK.Editor or {}

TPIK.Editor.Camera = TPIK.Editor.Camera or {
    dist = 90,
    height = 0,
    side = 16,
    yaw = 0,
    pitch = 0
}

local cvPosX = CreateClientConVar("arccw_tpik_editor_x", "-1", true, false)
local cvPosY = CreateClientConVar("arccw_tpik_editor_y", "-1", true, false)

local COL = {
    bg     = Color(22, 24, 28),
    line   = Color(38, 42, 48),
    text   = Color(208, 213, 220),
    dim    = Color(112, 120, 130),
    accent = Color(224, 176, 96),
    hover  = Color(34, 37, 43),
    track  = Color(46, 50, 57)
}

surface.CreateFont("ArcCW_TPIK.Title",  {font = "Tahoma",   size = 17, weight = 500, antialias = true})
surface.CreateFont("ArcCW_TPIK.Header", {font = "Tahoma",   size = 12, weight = 700, antialias = true})
surface.CreateFont("ArcCW_TPIK.Text",   {font = "Tahoma",   size = 14, weight = 400, antialias = true})
surface.CreateFont("ArcCW_TPIK.Small",  {font = "Tahoma",   size = 12, weight = 400, antialias = true})
surface.CreateFont("ArcCW_TPIK.Value",  {font = "Consolas", size = 14, weight = 400, antialias = true})

local W, H = 420, 480
local PAD = 16
local HEADER = 46
local FOOTER = 40
local TABSTRIP = 28
local CAMERA = 66

local POS_AXES = {{"Right / left", "x"}, {"Forward / back", "y"}, {"Up / down", "z"}}
local ANG_AXES = {{"Pitch", "p"}, {"Yaw", "y"}, {"Roll", "r"}}

local TAB_LIST = {
    {name = "Base",    pos = "Pos",       ang = "Ang",       help = "Where the gun sits at rest"},
    {name = "Aim",     pos = "SightPos",  ang = "SightAng",  help = "Added while aiming down sights"},
    {name = "Reload",  pos = "ReloadPos", ang = "ReloadAng", help = "Added while reloading"},
    {name = "Sprint",  pos = "SprintPos", ang = "SprintAng", help = "Added while sprinting"},
    {name = "Bones",   bones = true,                         help = "Click a bone to cycle auto / hide / keep"},
    {name = "Options", toggles = true,                       help = "Per-weapon switches"}
}

local TOGGLES = {
    {key = "NoTPIK",        label = "Never mirror this weapon"},
    {key = "NoLeftHand",    label = "Leave the left arm on the body"},
    {key = "ForceLeftHand", label = "Always solve the left arm"}
}

local function activeWeapon()
    local ply = LocalPlayer()
    if not IsValid(ply) then return nil end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not TPIK.IsArcCWWeapon(wep) then return nil end

    return wep
end

local function effective(wep, key)
    local value = TPIK.GetConfig(wep).Offsets[key]

    if TPIK.IsAngleKey(key) then
        return isangle(value) and Angle(value) or Angle(0, 0, 0)
    end

    return isvector(value) and Vector(value) or Vector(0, 0, 0)
end

local function boneNames(wep)
    local s = wep.ArcCW_TPIK
    local model = s and s.mirror
    local temp

    if not IsValid(model) then
        if not isstring(wep.ViewModel) or wep.ViewModel == "" then return {} end

        temp = ClientsideModel(wep.ViewModel, RENDERGROUP_OPAQUE)
        if not IsValid(temp) then return {} end

        temp:SetNoDraw(true)
        temp:SetupBones()
        model = temp
    end

    local out = {}

    for index = 0, model:GetBoneCount() - 1 do
        local name = model:GetBoneName(index)

        if isstring(name) and name ~= "" and name ~= "__INVALIDBONE__" then
            out[#out + 1] = name
        end
    end

    if IsValid(temp) then temp:Remove() end

    table.sort(out)

    return out
end

local function text(parent, str, font, colour, tall)
    local panel = parent:Add("DPanel")
    panel:Dock(TOP)
    panel:SetTall(tall or 18)

    panel.Paint = function(_, w, h)
        draw.SimpleText(str, font, 0, h * 0.5, colour, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    return panel
end

local function divider(parent, top)
    local panel = parent:Add("DPanel")
    panel:Dock(TOP)
    panel:DockMargin(0, top or 0, 0, 6)
    panel:SetTall(1)

    panel.Paint = function(_, w, h)
        surface.SetDrawColor(COL.line)
        surface.DrawRect(0, 0, w, h)
    end

    return panel
end

local function sliderRow(parent, label, value, min, max, onChange, labelWidth)
    local row = parent:Add("DPanel")
    row:Dock(TOP)
    row:SetTall(22)
    row.Value = value

    local LABEL_W = labelWidth or 108
    local VALUE_W = 46

    local function commit(new)
        new = math.Round(math.Clamp(new, min, max), 2)
        if new == row.Value then return end

        row.Value = new
        onChange(new)
    end

    local track = row:Add("DPanel")
    track:Dock(FILL)
    track:DockMargin(LABEL_W, 0, VALUE_W, 0)
    track:SetCursor("sizewe")

    local function fromCursor()
        local x = track:ScreenToLocal(input.GetCursorPos())
        commit(min + (max - min) * math.Clamp(x / math.max(track:GetWide(), 1), 0, 1))
    end

    track.OnMousePressed = function(self, key)
        if key == MOUSE_RIGHT then
            commit(0)
            return
        end

        self.Dragging = true
        self:MouseCapture(true)
        fromCursor()
    end

    track.OnMouseReleased = function(self)
        self.Dragging = false
        self:MouseCapture(false)
    end

    track.Think = function(self)
        if self.Dragging then fromCursor() end
    end

    track.Paint = function(self, w, h)
        local mid = math.floor(h * 0.5)

        surface.SetDrawColor(COL.track)
        surface.DrawRect(0, mid, w, 1)

        local zero = w * ((0 - min) / (max - min))
        local at = w * ((row.Value - min) / (max - min))

        surface.SetDrawColor(COL.accent)
        surface.DrawRect(math.min(zero, at), mid, math.abs(at - zero), 1)

        local hovered = self.Dragging or self:IsHovered()

        draw.RoundedBox(2, math.Clamp(at - 2, 0, w - 4), mid - 5, 4, 11,
            hovered and COL.text or COL.accent)
    end

    row.Paint = function(self, w, h)
        draw.SimpleText(label, "ArcCW_TPIK.Text", 0, h * 0.5, COL.dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(string.format("%.2f", self.Value), "ArcCW_TPIK.Value", w, h * 0.5,
            self.Value == 0 and COL.dim or COL.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end

    return row
end

local function toggleRow(parent, label, value, onChange)
    local row = parent:Add("DButton")
    row:Dock(TOP)
    row:DockMargin(0, 0, 0, 4)
    row:SetTall(26)
    row:SetText("")
    row.Value = value

    row.DoClick = function(self)
        self.Value = not self.Value
        onChange(self.Value)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    row.Paint = function(self, w, h)
        local box = 14
        local y = math.floor((h - box) * 0.5)

        surface.SetDrawColor(self.Value and COL.accent or COL.track)
        surface.DrawOutlinedRect(0, y, box, box, 1)

        if self.Value then
            draw.RoundedBox(0, 4, y + 4, box - 8, box - 8, COL.accent)
        end

        draw.SimpleText(label, "ArcCW_TPIK.Text", box + 10, h * 0.5,
            (self:IsHovered() or self.Value) and COL.text or COL.dim,
            TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    return row
end

local function boneRow(parent, class, bone, auto)
    local row = parent:Add("DButton")
    row:Dock(TOP)
    row:SetTall(19)
    row:SetText("")

    row.DoClick = function()
        local current = TPIK.GetUserBone(class, bone)
        local next

        if current == nil then
            next = auto and "keep" or "hide"
        elseif current == "hide" then
            next = "keep"
        end

        TPIK.SetUserBone(class, bone, next)
        surface.PlaySound("ui/buttonclick.wav")
    end

    row.Paint = function(self, w, h)
        local current = TPIK.GetUserBone(class, bone)
        local tag, colour

        if current == "hide" then
            tag, colour = "HIDE", COL.accent
        elseif current == "keep" then
            tag, colour = "KEEP", COL.text
        elseif auto then
            tag, colour = "auto", COL.track
        else
            tag, colour = "", COL.track
        end

        if self:IsHovered() then
            surface.SetDrawColor(COL.hover)
            surface.DrawRect(0, 0, w, h)
        end

        draw.SimpleText(bone, "ArcCW_TPIK.Small", 2, h * 0.5,
            current and COL.text or COL.dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(tag, "ArcCW_TPIK.Header", w - 2, h * 0.5, colour,
            TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end

    return row
end

local function flatButton(parent, label, tooltip, onClick)
    local button = parent:Add("DButton")
    button:Dock(LEFT)
    button:DockMargin(0, 0, 6, 0)
    button:SetText("")
    button:SetTooltip(tooltip)
    button.DoClick = onClick

    button.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBox(3, 0, 0, w, h, COL.hover)
        end

        surface.SetDrawColor(self:IsHovered() and COL.accent or COL.line)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        draw.SimpleText(label, "ArcCW_TPIK.Text", w * 0.5, h * 0.5,
            self:IsHovered() and COL.text or COL.dim, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    return button
end

local function styleScroll(scroll)
    local bar = scroll:GetVBar()
    bar:SetWide(3)
    bar:SetHideButtons(true)
    bar.Paint = function() end
    bar.btnUp.Paint = function() end
    bar.btnDown.Paint = function() end
    bar.btnGrip.Paint = function(_, w, h)
        draw.RoundedBox(1, 0, 0, w, h, COL.track)
    end
end

local function pasteDialog(onDone)
    local W2, H2 = 460, 300
    local FOOT = 42

    local dialog = vgui.Create("DFrame")
    dialog:SetSize(W2, H2)
    dialog:SetTitle("")
    dialog:ShowCloseButton(false)
    dialog:SetSizable(false)
    dialog:Center()
    dialog:MakePopup()

    dialog.Paint = function(_, w, h)
        draw.RoundedBox(4, 0, 0, w, h, COL.bg)

        surface.SetDrawColor(COL.line)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        draw.SimpleText("Paste Lua", "ArcCW_TPIK.Title", PAD, 18, COL.text,
            TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Ctrl+V an ArcCW_TPIK.Register block, then Apply", "ArcCW_TPIK.Small",
            PAD, 35, COL.dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local entry = dialog:Add("DTextEntry")
    entry:SetPos(PAD, 50)
    entry:SetSize(W2 - PAD * 2, H2 - 50 - FOOT)
    entry:SetMultiline(true)
    entry:SetPaintBackground(false)
    entry:SetTextColor(COL.text)
    entry:SetFont("ArcCW_TPIK.Value")
    entry:RequestFocus()

    entry.Paint = function(self, w, h)
        surface.SetDrawColor(COL.line)
        surface.DrawOutlinedRect(0, 0, w, h, 1)

        self:DrawTextEntryText(COL.text, COL.accent, COL.accent)

        if self:GetText() == "" then
            draw.SimpleText("ArcCW_TPIK.Register(\"class\", { ... })", "ArcCW_TPIK.Small",
                6, 12, COL.track, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    local footer = dialog:Add("DPanel")
    footer:SetPos(PAD, H2 - FOOT + 8)
    footer:SetSize(W2 - PAD * 2, 24)
    footer.Paint = function() end

    flatButton(footer, "Apply", "Read the block and overwrite the tuning for every weapon it names",
        function()
            local ok, result = TPIK.ImportUserConfig(entry:GetValue())

            if not ok then
                notification.AddLegacy("ArcCW TPIK: " .. tostring(result), NOTIFY_ERROR, 5)
                surface.PlaySound("buttons/button10.wav")

                return
            end

            notification.AddLegacy("ArcCW TPIK: applied to " .. table.concat(result, ", "),
                NOTIFY_GENERIC, 5)
            surface.PlaySound("buttons/button15.wav")

            dialog:Remove()
            onDone()
        end):SetWide(70)

    flatButton(footer, "Cancel", "Close without changing anything", function()
        dialog:Remove()
    end):SetWide(70)

    return dialog
end

local function previewView(ply, pos, ang, fov)
    local cam = TPIK.Editor.Camera
    local angles = Angle(ang.p + cam.pitch, ang.y + cam.yaw, 0)
    local origin = ply:EyePos() + Vector(0, 0, cam.height)

    local tr = util.TraceHull({
        start = origin,
        endpos = origin - angles:Forward() * cam.dist + angles:Right() * cam.side,
        mins = Vector(-4, -4, -4),
        maxs = Vector(4, 4, 4),
        filter = ply
    })

    return {origin = tr.HitPos, angles = angles, fov = fov, drawviewer = true}
end

local function setPreview(on)
    if on then
        hook.Add("ShouldDrawLocalPlayer", "ArcCW_TPIK.EditorPreview", function() return true end)
        hook.Add("CalcView", "ArcCW_TPIK.EditorPreview", previewView)
    else
        hook.Remove("ShouldDrawLocalPlayer", "ArcCW_TPIK.EditorPreview")
        hook.Remove("CalcView", "ArcCW_TPIK.EditorPreview")
    end
end

local frame

function TPIK.Editor.Open()
    if IsValid(frame) then frame:Remove() end

    local cam = TPIK.Editor.Camera
    local activeTab = 1
    local shownClass, rebuild, orbit

    frame = vgui.Create("DFrame")
    frame:SetSize(W, H)
    frame:SetTitle("")
    frame:ShowCloseButton(false)
    frame:SetSizable(false)

    local x, y = cvPosX:GetInt(), cvPosY:GetInt()

    if x < 0 or y < 0 then
        x, y = 40, math.floor((ScrH() - H) * 0.5)
    end

    frame:SetPos(math.Clamp(x, 0, ScrW() - W), math.Clamp(y, 0, ScrH() - H))
    frame:MakePopup()

    setPreview(true)

    frame.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, COL.bg)

        surface.SetDrawColor(COL.line)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        surface.DrawRect(PAD, HEADER, w - PAD * 2, 1)
        surface.DrawRect(PAD, h - FOOTER, w - PAD * 2, 1)

        draw.SimpleText("ArcCW TPIK", "ArcCW_TPIK.Title", PAD, 16, COL.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        local wep = activeWeapon()
        local name = wep and (wep.PrintName or wep:GetClass()) or "no weapon"

        draw.SimpleText(name, "ArcCW_TPIK.Small", PAD, 33, COL.dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    frame.OnMousePressed = function(self)
        if gui.MouseY() - self:GetY() > HEADER then return end

        self.Dragging = {gui.MouseX() - self.x, gui.MouseY() - self.y}
        self:MouseCapture(true)
    end

    frame.OnMouseWheeled = function(_, delta)
        cam.dist = math.Clamp(cam.dist - delta * 10, 20, 300)
        return true
    end

    local close = frame:Add("DButton")
    close:SetSize(24, 24)
    close:SetPos(W - PAD - 24, 11)
    close:SetText("")
    close.DoClick = function() frame:Remove() end

    close.Paint = function(self, w, h)
        surface.SetDrawColor(self:IsHovered() and COL.text or COL.dim)
        surface.DrawLine(7, 7, w - 7, h - 7)
        surface.DrawLine(w - 7, 7, 7, h - 7)
    end

    local tabStrip = frame:Add("DPanel")
    tabStrip:SetPos(PAD, HEADER + 6)
    tabStrip:SetSize(W - PAD * 2, TABSTRIP)
    tabStrip.Paint = function() end

    for index, tab in ipairs(TAB_LIST) do
        local button = tabStrip:Add("DButton")
        button:Dock(LEFT)
        button:SetWide(math.floor((W - PAD * 2) / #TAB_LIST))
        button:SetText("")

        button.DoClick = function()
            activeTab = index
            rebuild()
        end

        button.Paint = function(self, w, h)
            local on = activeTab == index

            draw.SimpleText(tab.name, "ArcCW_TPIK.Header", w * 0.5, h * 0.5 - 2,
                on and COL.text or (self:IsHovered() and COL.dim or COL.track),
                TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if on then
                surface.SetDrawColor(COL.accent)
                surface.DrawRect(w * 0.5 - 12, h - 4, 24, 1)
            end
        end
    end

    local contentY = HEADER + 6 + TABSTRIP + 6
    local contentH = H - FOOTER - CAMERA - contentY - 8

    local content = frame:Add("DPanel")
    content:SetPos(PAD, contentY)
    content:SetSize(W - PAD * 2, contentH)
    content.Paint = function() end

    local camPanel = frame:Add("DPanel")
    camPanel:SetPos(PAD, contentY + contentH + 8)
    camPanel:SetSize(W - PAD * 2, CAMERA)
    camPanel.Paint = function(_, w)
        surface.SetDrawColor(COL.line)
        surface.DrawRect(0, 0, w, 1)
    end

    local camSpacer = camPanel:Add("DPanel")
    camSpacer:Dock(TOP)
    camSpacer:SetTall(4)
    camSpacer.Paint = function() end

    sliderRow(camPanel, "Camera distance", cam.dist, 20, 300, function(value)
        cam.dist = value
    end, 118)

    sliderRow(camPanel, "Camera height", cam.height, -40, 40, function(value)
        cam.height = value
    end, 118)

    sliderRow(camPanel, "Camera side", cam.side, -60, 60, function(value)
        cam.side = value
    end, 118)

    local footer = frame:Add("DPanel")
    footer:SetPos(PAD, H - FOOTER + 9)
    footer:SetSize(W - PAD * 2, 24)
    footer.Paint = function() end

    flatButton(footer, "Save", "Write every tuned weapon to data/arccw_tpik/weapons.json", function()
        TPIK.SaveUserConfigs()
        notification.AddLegacy("ArcCW TPIK: saved", NOTIFY_GENERIC, 3)
        surface.PlaySound("buttons/button15.wav")
    end):SetWide(54)

    flatButton(footer, "Revert", "Throw away unsaved edits and reload the file", function()
        TPIK.LoadUserConfigs()
        rebuild()
    end):SetWide(54)

    flatButton(footer, "Reset", "Drop this weapon's tuning entirely", function()
        local wep = activeWeapon()
        if not wep then return end

        TPIK.ClearUserConfig(wep:GetClass())
        rebuild()
    end):SetWide(54)

    flatButton(footer, "Copy Lua", "Copy this weapon's tuning as an ArcCW_TPIK.Register call", function()
        local wep = activeWeapon()
        if not wep then return end

        local export = TPIK.ExportUserConfig(wep:GetClass())

        if not export then
            notification.AddLegacy("ArcCW TPIK: nothing tuned on this weapon", NOTIFY_ERROR, 3)
            return
        end

        SetClipboardText(export)
        notification.AddLegacy("ArcCW TPIK: copied to clipboard", NOTIFY_GENERIC, 3)
    end):SetWide(66)

    flatButton(footer, "Paste Lua", "Take someone else's ArcCW_TPIK.Register block and apply it", function()
        pasteDialog(rebuild)
    end):SetWide(68)

    local recentre = footer:Add("DButton")
    recentre:Dock(RIGHT)
    recentre:SetWide(24)
    recentre:SetText("")
    recentre:SetTooltip("Reset the camera")

    recentre.DoClick = function()
        cam.dist, cam.height, cam.side, cam.yaw, cam.pitch = 90, 0, 16, 0, 0
        rebuild()
    end

    recentre.Paint = function(self, w, h)
        surface.SetDrawColor(self:IsHovered() and COL.text or COL.dim)
        surface.DrawOutlinedRect(w * 0.5 - 6, h * 0.5 - 6, 12, 12, 1)
        surface.DrawRect(w * 0.5 - 1, h * 0.5 - 1, 2, 2)
    end

    local function buildBones(wep, class)
        sliderRow(content, "Hide distance", TPIK.GetConfig(wep).PropDist or TPIK.PropBoneMaxDist,
            0, 64, function(value)
                TPIK.SetUserValue(class, "PropDist", value)
            end)

        divider(content, 4)

        local search = content:Add("DTextEntry")
        search:Dock(TOP)
        search:DockMargin(0, 0, 0, 4)
        search:SetTall(20)
        search:SetUpdateOnType(true)
        search:SetPaintBackground(false)
        search:SetTextColor(COL.text)

        local scroll = content:Add("DScrollPanel")
        scroll:Dock(FILL)
        styleScroll(scroll)

        local names = boneNames(wep)

        local function fill(filter)
            scroll:Clear()

            filter = string.lower(filter or "")
            local shown = 0

            for _, bone in ipairs(names) do
                if filter == "" or string.find(string.lower(bone), filter, 1, true) then
                    boneRow(scroll, class, bone, TPIK.IsAutoPropBone(bone))
                    shown = shown + 1
                end
            end

            if shown == 0 then
                text(scroll, "no bones match", "ArcCW_TPIK.Small", COL.track, 18)
            end
        end

        search.OnValueChange = function(_, value) fill(value) end

        search.Paint = function(self, w, h)
            surface.SetDrawColor(COL.line)
            surface.DrawRect(0, h - 1, w, 1)

            self:DrawTextEntryText(COL.text, COL.accent, COL.accent)

            if self:GetText() == "" then
                draw.SimpleText("filter bones", "ArcCW_TPIK.Small", 2, h * 0.5 - 1,
                    COL.track, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end

        fill("")
    end

    local function axisRows(parent, wep, class, key, axes, min, max)
        for _, axis in ipairs(axes) do
            local component = axis[2]

            sliderRow(parent, axis[1], effective(wep, key)[component], min, max, function(value)
                local current = effective(wep, key)
                current[component] = value

                TPIK.SetUserValue(class, key, current)
            end)
        end
    end

    rebuild = function()
        content:Clear()

        local wep = activeWeapon()

        if not wep then
            shownClass = nil
            text(content, "Hold an ArcCW weapon to tune it.", "ArcCW_TPIK.Text", COL.dim, 20)

            return
        end

        shownClass = wep:GetClass()

        local class = shownClass
        local tab = TAB_LIST[activeTab]
        local saved = TPIK.UserWeapons[string.lower(class)] ~= nil

        text(content, tab.help .. (saved and "   \194\183   saved" or ""), "ArcCW_TPIK.Small", COL.dim, 16)
        divider(content, 4)

        if tab.bones then
            buildBones(wep, class)
            return
        end

        if tab.toggles then
            for _, toggle in ipairs(TOGGLES) do
                toggleRow(content, toggle.label, TPIK.GetConfig(wep)[toggle.key] == true, function(value)
                    TPIK.SetUserValue(class, toggle.key, value)
                end)
            end

            return
        end

        axisRows(content, wep, class, tab.pos, POS_AXES, -32, 32)
        divider(content, 8)
        axisRows(content, wep, class, tab.ang, ANG_AXES, -90, 90)
    end

    rebuild()

    local function insideFrame(panel)
        while IsValid(panel) do
            if panel == frame then return true end
            panel = panel:GetParent()
        end

        return false
    end

    frame.Think = function(self)
        local wep = activeWeapon()
        local class = wep and wep:GetClass() or nil

        if class ~= shownClass then rebuild() end

        if input.IsMouseDown(MOUSE_RIGHT) and not insideFrame(vgui.GetHoveredPanel()) then
            local mx, my = gui.MousePos()

            if orbit then
                cam.yaw = cam.yaw - (mx - orbit[1]) * 0.4
                cam.pitch = math.Clamp(cam.pitch + (my - orbit[2]) * 0.4, -70, 70)
            end

            orbit = {mx, my}
        else
            orbit = nil
        end
    end

    frame.OnRemove = function(self)
        setPreview(false)

        RunConsoleCommand("arccw_tpik_editor_x", tostring(math.Round(self:GetX())))
        RunConsoleCommand("arccw_tpik_editor_y", tostring(math.Round(self:GetY())))
    end

    return frame
end

concommand.Add("arccw_tpik_editor", TPIK.Editor.Open,
    nil, "Open the per-weapon ArcCW TPIK offset editor")
