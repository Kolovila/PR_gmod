include("shared.lua")

-- Интерфейс точки захвата: табличка над точкой, полоса захвата, меню владельца с наймом охраны
-- и меню настройки для админа. Рисуется кирпичиками PR_UI (gamemode/cl_ui.lua), как меню F4.

ENT.RenderGroup = RENDERGROUP_BOTH

local S = PR_UI.S
local C = PR_UI.Colors

----------------------------------------------------------------------------------------------------
-- Общее
----------------------------------------------------------------------------------------------------

local function HasOwnerTeam(team)
	return isstring(team) and team ~= "" and team ~= "Ничья"
end

local function OwnerName(team)
	return HasOwnerTeam(team) and PR_FractionName(team) or "ничья"
end

local flagCache = {}

-- Флаг группировки; nil, если картинки нет
local function Flag(frac)
	if not HasOwnerTeam(frac) then return end
	if flagCache[frac] == nil then
		local mat = Material(PR_FractionFlag(frac), "smooth")
		flagCache[frac] = not mat:IsError() and mat or false
	end
	return flagCache[frac] or nil
end

-- Флаг, вписанный в прямоугольник с сохранением пропорций. false, если рисовать нечего
local function DrawFlag(frac, x, y, w, h)
	local mat = Flag(frac)
	if not mat then return false end

	local ratio = mat:Width() / math.max(mat:Height(), 1)
	local dw, dh = math.min(w, h * ratio), math.min(h, w / ratio)
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(mat)
	surface.DrawTexturedRect(x + (w - dw) / 2, y + (h - dh) / 2, dw, dh)
	return true
end

local function Bar(x, y, w, h, progress, color)
	PR_UI.Box(x, y, w, h, C.panel2)
	PR_UI.Box(x, y, math.floor(w * math.Clamp(progress, 0, 1)), h, color or C.accent)
end

local function CaptureProgress(point)
	local total = point:GetCaptureEnd() - point:GetCaptureStart()
	if total <= 0 then return 0 end
	return math.Clamp((CurTime() - point:GetCaptureStart()) / total, 0, 1)
end

-- Ключи таблицы по возрастанию цены, при равной цене — по имени
local function KeysByPrice(tbl)
	local keys = table.GetKeys(tbl or {})
	table.sort(keys, function(a, b)
		local pa, pb = tbl[a].Price or 0, tbl[b].Price or 0
		if pa ~= pb then return pa < pb end
		return a < b
	end)
	return keys
end

----------------------------------------------------------------------------------------------------
-- Табличка над точкой
----------------------------------------------------------------------------------------------------

surface.CreateFont("PR_Point3D_Title", {font = "Bender", size = 64, weight = 700, extended = true, antialias = true})
surface.CreateFont("PR_Point3D_Text", {font = "Bender", size = 40, weight = 500, extended = true, antialias = true})

local LABEL_RANGE = 1400
local LABEL_FADE = 300
local HINT_RANGE = 250

function ENT:Initialize()
	-- Табличка выше модели: расширяем границы отрисовки, иначе она пропадает у края экрана
	self:SetRenderBounds(Vector(-120, -120, -40), Vector(120, 120, 150))
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	local name = self:GetCurPoint()
	if name == "" then return end

	local lp = LocalPlayer()
	local eye = lp:EyePos()
	local dist = eye:Distance(self:GetPos())
	if dist > LABEL_RANGE then return end

	local pos = self:GetPos() + Vector(0, 0, 105)
	local ang = Angle(0, (eye - pos):Angle().y + 90, 90)

	local team = self:GetCaptureTeam()
	local capturer = self:GetCapturer()
	local capturing = IsValid(capturer)
	local hasFlag = Flag(team) ~= nil

	local w, h = 640, capturing and 236 or 160
	local x, y = -w / 2, -h

	-- Табличка растёт с расстоянием, чтобы оставаться читаемой, и плавно гаснет у края дальности
	local scale = math.Clamp(dist * 0.0005, 0.1, 0.35)

	surface.SetAlphaMultiplier(math.Clamp((LABEL_RANGE - dist) / LABEL_FADE, 0, 1))
	cam.Start3D2D(pos, ang, scale)
		PR_UI.Box(x, y, w, h, ColorAlpha(C.bg, 225))
		PR_UI.Box(x, y, 8, h, HasOwnerTeam(team) and C.accent or C.line)

		local textX = x + 40
		if hasFlag then
			DrawFlag(team, x + 32, y + 24, 150, 100)
			textX = x + 210
		end

		draw.SimpleText(name, "PR_Point3D_Title", textX, y + 24, C.text)
		draw.SimpleText(HasOwnerTeam(team) and PR_FractionName(team) or "Ничья", "PR_Point3D_Text", textX, y + 96, HasOwnerTeam(team) and C.gold or C.muted)

		if capturing then
			local by = PR_FractionName(capturer:GetNWString("PR_fraction"))
			-- Под строкой владельца: полоса, под ней кто захватывает
			Bar(x + 32, y + 150, w - 64, 18, CaptureProgress(self), C.bad)
			draw.SimpleText("Захватывает " .. by, "PR_Point3D_Text", x + 32, y + 176, C.bad)
		end

		-- Подсказка, когда игрок рядом
		if dist < HINT_RANGE and lp:Alive() then
			local own = team == lp:GetNWString("PR_fraction")
			local hint = own and "[E] Меню точки" or (capturing and "" or "[E] Захватить")
			if hint ~= "" then
				surface.SetFont("PR_Point3D_Text")
				local tw, th = surface.GetTextSize(hint)
				PR_UI.Box(-tw / 2 - 24, y + h + 12, tw + 48, th + 16, ColorAlpha(C.bg, 225))
				draw.SimpleText(hint, "PR_Point3D_Text", 0, y + h + 20, C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			end
		end
	cam.End3D2D()
	surface.SetAlphaMultiplier(1)
end

----------------------------------------------------------------------------------------------------
-- Полоса захвата на экране: у захватчика и у всех, кто рядом
----------------------------------------------------------------------------------------------------

local CAPTURE_HUD_RANGE = 1500

hook.Add("HUDPaint", "PR_CaptureProgress", function()
	local lp = LocalPlayer()
	if not IsValid(lp) then return end

	local point
	for _, p in ipairs(ents.FindByClass("zahvat_ojka")) do
		local capturer = p:GetCapturer()
		if IsValid(capturer) and (capturer == lp or lp:GetPos():DistToSqr(p:GetPos()) < CAPTURE_HUD_RANGE ^ 2) then
			point = p
			if capturer == lp then break end
		end
	end
	if not point then return end

	local capturer = point:GetCapturer()
	local byFrac = capturer:GetNWString("PR_fraction")
	local mine = capturer == lp
	local defending = not mine and point:GetCaptureTeam() == lp:GetNWString("PR_fraction")

	local title, color
	if mine then
		title, color = "Захват точки «" .. point:GetCurPoint() .. "»", C.accent
	elseif defending then
		title, color = "Твою точку «" .. point:GetCurPoint() .. "» захватывают!", C.bad
	else
		title, color = "Точку «" .. point:GetCurPoint() .. "» захватывает " .. PR_FractionName(byFrac), C.gold
	end

	local w, h = S(560), S(84)
	local x, y = math.floor(ScrW() / 2 - w / 2), math.floor(ScrH() * 0.7)
	local secondsLeft = math.max(math.ceil(point:GetCaptureEnd() - CurTime()), 0)

	PR_UI.Box(x, y, w, h, C.bg)
	PR_UI.Box(x, y, S(4), h, color)

	local textX = x + S(20)
	if DrawFlag(byFrac, x + S(16), y + S(12), S(84), h - S(24)) then
		textX = x + S(116)
	end

	PR_UI.Text(title, "big", textX, y + S(14), C.text)
	PR_UI.Text(secondsLeft .. " с", "big", x + w - S(16), y + S(14), color, TEXT_ALIGN_RIGHT)
	Bar(textX, y + h - S(30), x + w - S(16) - textX, S(12), CaptureProgress(point), color)
	if mine then
		PR_UI.Text("не отходи от точки", "small", textX, y + h - S(6), C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end
end)

----------------------------------------------------------------------------------------------------
-- Кирпичики окон
----------------------------------------------------------------------------------------------------

-- Тёмный блок с заголовком; содержимое докается внутрь
local function Section(parent, title, tall)
	local pnl = vgui.Create("DPanel", parent)
	pnl:Dock(tall and TOP or FILL)
	if tall then
		pnl:SetTall(S(tall))
		pnl:DockMargin(0, 0, 0, S(12))
	end
	pnl:DockPadding(S(16), S(46), S(16), S(14))
	pnl.PR_Title = title
	pnl.Paint = function(self, w, h)
		PR_UI.Box(0, 0, w, h, C.panel)
		local text = isfunction(self.PR_Title) and self.PR_Title() or self.PR_Title
		PR_UI.Text(text, "big", S(16), S(24), C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	return pnl
end

-- Подпись над группой кнопок
local function Caption(parent, text)
	local lbl = vgui.Create("DPanel", parent)
	lbl:Dock(TOP)
	lbl:SetTall(S(26))
	lbl.Paint = function(self, w, h)
		PR_UI.Text(isfunction(text) and text() or text, "small", 0, h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	return lbl
end

-- Сетка кнопок одинакового размера: cols в ряд, высота ряда rowH
local function Grid(parent, cols, rowH)
	local gap = S(6)
	local grid = vgui.Create("DPanel", parent)
	grid:Dock(TOP)
	grid:DockMargin(0, 0, 0, S(10))
	grid.Paint = nil
	grid.PR_Items = {}

	grid.PerformLayout = function(self, w)
		local cw = (w - gap * (cols - 1)) / cols
		for i, item in ipairs(self.PR_Items) do
			local col, row = (i - 1) % cols, math.floor((i - 1) / cols)
			item:SetPos(math.floor(col * (cw + gap)), row * (S(rowH) + gap))
			item:SetSize(math.floor(cw), S(rowH))
		end
	end

	function grid:PR_Add(item)
		item:SetParent(self)
		table.insert(self.PR_Items, item)
		local rows = math.ceil(#self.PR_Items / cols)
		self:SetTall(rows * S(rowH) + (rows - 1) * gap)
		self:InvalidateLayout()
	end

	function grid:PR_Clear()
		for _, item in ipairs(self.PR_Items) do item:Remove() end
		self.PR_Items = {}
		self:SetTall(0)
	end

	return grid
end

-- Кнопка выбора: подпись и строка под ней, выбранная обведена акцентом
local function Choice(label, sub, isSelected, onClick)
	local btn = vgui.Create("DButton")
	btn:SetText("")
	btn.Paint = function(self, w, h)
		local selected = isSelected()
		PR_UI.Box(0, 0, w, h, selected and C.hover or (self:IsHovered() and C.panel2 or C.bg))
		if selected then
			PR_UI.Outline(0, 0, w, h, C.accent)
			PR_UI.Outline(1, 1, w - 2, h - 2, C.accent)
		end

		local subText = isfunction(sub) and sub() or sub
		if subText and subText ~= "" then
			PR_UI.Text(label, "normal", w / 2, h * 0.36, C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			PR_UI.Text(subText, "small", w / 2, h * 0.72, selected and C.gold or C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			PR_UI.Text(label, "normal", w / 2, h / 2, C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	btn.DoClick = function()
		surface.PlaySound("ui/buttonclick.wav")
		onClick()
	end
	return btn
end

-- Окно-подтверждение в стиле меню
local function Confirm(text, yesText, onYes)
	local frame, body = PR_UI.Popup("Точно?", 560, 220)

	local msg = vgui.Create("DPanel", body)
	msg:Dock(FILL)
	msg.Paint = function(self, w, h)
		PR_UI.Text(text, "normal", w / 2, h / 2, C.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local row = vgui.Create("DPanel", body)
	row:Dock(BOTTOM)
	row:SetTall(S(48))
	row.Paint = nil

	local no = PR_UI.Button(row, "Отмена", function() frame:Remove() end, {height = 48})
	no:Dock(LEFT)
	no:SetWide(S(200))

	local yes = PR_UI.Button(row, yesText, function()
		frame:Remove()
		onYes()
	end, {height = 48, color = C.accent, hoverColor = C.accentDark})
	yes:Dock(RIGHT)
	yes:SetWide(S(200))
end

----------------------------------------------------------------------------------------------------
-- Меню владельца
----------------------------------------------------------------------------------------------------

local function IsLeader()
	local ply = LocalPlayer()
	return ply:GetNWBool("PR_leader_" .. ply:GetNWString("PR_fraction"))
end

local function BuyUpgrade(ent, kind)
	if not IsLeader() then
		PR_UI.Notify("Улучшать точку может только лидер группировки", true)
		return
	end

	local price = ent:GetUpgradePrice(kind)
	if not price then return end

	if LocalPlayer():GetNWInt("PR_money") < price then
		PR_UI.Notify("Не хватает денег", true)
		return
	end

	net.Start("UpgradePoint")
		net.WriteEntity(ent)
		net.WriteString(kind)
	net.SendToServer()
end

local function UpgradeRow(parent, ent, kind, title, levelText, effectText)
	local row = vgui.Create("DPanel", parent)
	row:Dock(TOP)
	row:SetTall(S(64))
	row:DockMargin(0, 0, 0, S(8))
	row.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		PR_UI.Box(0, 0, w, h, C.bg)
		PR_UI.Text(title .. "  ·  " .. levelText(), "normal", S(14), h * 0.33, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		PR_UI.Text(effectText(), "small", S(14), h * 0.7, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	local btn = PR_UI.Button(row, function()
		local price = IsValid(ent) and ent:GetUpgradePrice(kind)
		return price and PR_UI.Money(price) or "Максимум"
	end, function() BuyUpgrade(ent, kind) end, {
		height = 44,
		color = C.accentDark,
		hoverColor = C.accent,
		disabled = function() return not IsValid(ent) or not ent:GetUpgradePrice(kind) or not IsLeader() end
	})
	btn:Dock(RIGHT)
	btn:SetWide(S(160))
	btn:DockMargin(0, S(10), S(10), S(10))
end

-- Найм охраны: тип, оружие, живучесть, доклад о врагах
local function BuildGuardForm(form, ent)
	local typeKeys = KeysByPrice(ent.GuardianTypes)
	local choice = {type = typeKeys[1], weapon = "", hp = 1, signal = false}

	local function Price()
		return ent:GetGuardianPrice(choice.type, choice.weapon, choice.hp, choice.signal)
	end

	local function Full()
		return ent:GetGuardianCount() >= ent.MaxGuardianCount
	end

	-- Итог и кнопка внизу
	local footer = vgui.Create("DPanel", form)
	footer:Dock(BOTTOM)
	footer:SetTall(S(56))
	footer:DockMargin(0, S(10), 0, 0)

	local hire = PR_UI.Button(footer, "Нанять", function()
		local price = Price()
		if not price or Full() then return end
		if LocalPlayer():GetNWInt("PR_money") < price then
			PR_UI.Notify("Не хватает денег", true)
			return
		end

		net.Start("SpawnGuardianNPC")
			net.WriteEntity(ent)
			net.WriteString(choice.type)
			net.WriteString(choice.weapon)
			net.WriteUInt(choice.hp, 4)
			net.WriteBool(choice.signal)
		net.SendToServer()
	end, {
		height = 56,
		font = "big",
		color = C.accent,
		hoverColor = C.accentDark,
		disabled = function()
			local price = Price()
			return not IsValid(ent) or not price or Full() or LocalPlayer():GetNWInt("PR_money") < price
		end
	})
	hire:Dock(RIGHT)
	hire:SetWide(S(220))

	footer.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		local price = Price()
		PR_UI.Text("Итого", "small", 0, 0, C.muted)
		PR_UI.Text(price and PR_UI.Money(price) or "—", "title", 0, h, C.gold, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

		local reason
		if Full() then
			reason = "Охрана укомплектована"
		elseif price and LocalPlayer():GetNWInt("PR_money") < price then
			reason = "Не хватает денег"
		end
		if reason then
			PR_UI.Text(reason, "normal", w - S(236), h / 2, C.bad, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end

	local scroll = vgui.Create("DScrollPanel", form)
	scroll:Dock(FILL)

	-- Тип
	Caption(scroll, "Кого нанять")
	local typeGrid = Grid(scroll, 2, 56)

	-- Оружие зависит от типа: пересобираем при смене
	Caption(scroll, "Оружие")
	local weaponGrid = Grid(scroll, 4, 50)

	local function FillWeapons()
		weaponGrid:PR_Clear()

		weaponGrid:PR_Add(Choice("Стандартное", "бесплатно", function() return choice.weapon == "" end, function()
			choice.weapon = ""
		end))

		local gtype = ent.GuardianTypes[choice.type]
		local weapons = gtype and ent.GuardianWeapons[gtype.Weapons] or {}
		for _, key in ipairs(KeysByPrice(weapons)) do
			weaponGrid:PR_Add(Choice(key, PR_UI.Money(weapons[key].Price), function() return choice.weapon == key end, function()
				choice.weapon = key
			end))
		end

		scroll:GetCanvas():InvalidateLayout()
		scroll:InvalidateLayout()
	end

	for _, key in ipairs(typeKeys) do
		local gtype = ent.GuardianTypes[key]
		typeGrid:PR_Add(Choice(key, "от " .. PR_UI.Money(gtype.Price), function() return choice.type == key end, function()
			if choice.type == key then return end
			choice.type = key
			choice.weapon = ""
			FillWeapons()
		end))
	end

	FillWeapons()

	-- Живучесть: множитель здоровья, он же множитель цены типа
	Caption(scroll, "Живучесть")
	local hpGrid = Grid(scroll, #ent.GuardianHealthMul, 50)
	for i, mul in ipairs(ent.GuardianHealthMul) do
		hpGrid:PR_Add(Choice("x" .. mul .. " HP", function()
			local gtype = ent.GuardianTypes[choice.type]
			return gtype and PR_UI.Money(math.floor(gtype.Price * mul)) or ""
		end, function() return choice.hp == i end, function()
			choice.hp = i
		end))
	end

	-- Доклад в чат группировки, когда защитник видит врага
	Caption(scroll, "Связь")
	local signalGrid = Grid(scroll, 2, 50)
	signalGrid:PR_Add(Choice("Молчит", "бесплатно", function() return not choice.signal end, function()
		choice.signal = false
	end))
	signalGrid:PR_Add(Choice("Докладывает о врагах", "+" .. PR_UI.Money(ent.GuardianSignalPrice), function() return choice.signal end, function()
		choice.signal = true
	end))
end

local function OpenOwnerMenu()
	local ply = LocalPlayer()
	local ent = net.ReadEntity()
	if not IsValid(ent) then return end

	if IsValid(PR_PointMenu) then PR_PointMenu:Remove() end

	local frame, body = PR_UI.Popup("Точка «" .. ent:GetCurPoint() .. "»", 1180, 780)
	PR_PointMenu = frame

	-- Владелец и кто может улучшать
	local top = vgui.Create("DPanel", body)
	top:Dock(TOP)
	top:SetTall(S(60))
	top:DockMargin(0, 0, 0, S(12))
	top.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		PR_UI.Box(0, 0, w, h, C.panel)

		local team = ent:GetCaptureTeam()
		local x = S(16)
		if DrawFlag(team, x, S(10), S(64), h - S(20)) then x = x + S(80) end
		PR_UI.Text("Владелец: " .. OwnerName(team), "big", x, h / 2, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		local leader = IsLeader()
		PR_UI.Text(leader and "Ты лидер — улучшения доступны" or "Улучшать точку может только лидер", "normal", w - S(16), h / 2, leader and C.good or C.muted, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	local left = vgui.Create("DPanel", body)
	left:Dock(LEFT)
	left:SetWide(math.floor((frame:GetWide() - S(24)) * 0.42))
	left:DockMargin(0, 0, S(12), 0)
	left.Paint = nil

	-- Доход
	local income = Section(left, "Доход", 140)
	local incomeInfo = vgui.Create("DPanel", income)
	incomeInfo:Dock(FILL)
	incomeInfo.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		local interval = ent:GetIncomeInterval()
		local remain = math.max(ent:GetNextIncome() - CurTime(), 0)

		PR_UI.Text("+" .. PR_UI.Money(ent:GetIncomeAmount()), "title", 0, 0, C.gold)
		PR_UI.Text("каждые " .. interval .. " с", "normal", w, S(6), C.muted, TEXT_ALIGN_RIGHT)
		Bar(0, h - S(30), w, S(10), 1 - remain / math.max(interval, 1), C.gold)
		PR_UI.Text("до выплаты " .. math.ceil(remain) .. " с", "small", 0, h, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end

	-- Касса
	local cash = Section(left, "Касса", 118)
	local take = PR_UI.Button(cash, "Забрать", function()
		net.Start("PR_PointTakeMoney")
			net.WriteEntity(ent)
		net.SendToServer()
	end, {
		height = 56,
		font = "big",
		color = C.accent,
		hoverColor = C.accentDark,
		disabled = function() return not IsValid(ent) or ent:GetStoredMoney() <= 0 end
	})
	take:Dock(RIGHT)
	take:SetWide(S(170))

	local cashInfo = vgui.Create("DPanel", cash)
	cashInfo:Dock(FILL)
	cashInfo.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		local stored = ent:GetStoredMoney()
		PR_UI.Text(PR_UI.Money(stored), "huge", 0, h / 2, stored > 0 and C.gold or C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	-- Улучшения
	local upgrades = Section(left, "Улучшения", 204)
	UpgradeRow(upgrades, ent, "monitor", "Монитор",
		function() return "ур. " .. ent:GetUpgradeMonitor() .. " из " .. #ent.UpgradePrices end,
		function()
			local now = ent:GetIncomeInterval()
			if not ent:GetUpgradePrice("monitor") then return "выплата каждые " .. now .. " с" end
			return "выплата каждые " .. now .. " → " .. (now - 100) .. " с"
		end)
	UpgradeRow(upgrades, ent, "computer", "Компьютер",
		function() return "ур. " .. ent:GetUpgradeComputer() .. " из " .. (#ent.UpgradePrices + 1) end,
		function()
			local now = ent:GetIncomeAmount()
			if not ent:GetUpgradePrice("computer") then return PR_UI.Money(now) .. " за выплату" end
			return PR_UI.Money(now) .. " → " .. PR_UI.Money(now + 1000) .. " за выплату"
		end)

	-- Охрана
	local guard = Section(body, function()
		if not IsValid(ent) or not ent:CanHaveGuardians() then return "Охрана" end
		return "Охрана  " .. ent:GetGuardianCount() .. " / " .. ent.MaxGuardianCount
	end)
	local guardPaint = guard.Paint
	guard.Paint = function(self, w, h)
		guardPaint(self, w, h)
		if IsValid(ent) and not ent:CanHaveGuardians() then
			PR_UI.Text("Мародёрам охрана не положена", "big", w / 2, h / 2 - S(18), C.gold, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			PR_UI.Text("Точку держи сам — и следи, чтобы свои же не утащили кассу", "normal", w / 2, h / 2 + S(18), C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end

	local form = vgui.Create("DPanel", guard)
	form:Dock(FILL)
	form.Paint = nil
	BuildGuardForm(form, ent)

	-- Закрыть меню, если игрок умер, точку убрали или её захватили
	-- Первую секунду не сверяем фракцию: сетевые переменные могут прийти позже, чем команда открыть меню
	local openedAt = CurTime()
	local frameThink = frame.Think
	frame.Think = function(self)
		if frameThink then frameThink(self) end

		local lostPoint = CurTime() - openedAt > 1 and IsValid(ent) and ent:GetCaptureTeam() ~= ply:GetNWString("PR_fraction")
		if not ply:Alive() or not IsValid(ent) or lostPoint then
			self:Remove()
			return
		end

		-- Мародёрам охрана не положена: форму найма не показываем
		form:SetVisible(ent:CanHaveGuardians())
	end
end

----------------------------------------------------------------------------------------------------
-- Меню настройки (админ)
----------------------------------------------------------------------------------------------------

PR_Capture_Points_List = PR_Capture_Points_List or {}

local function RequestConfigs()
	net.Start("GetPointsCfgs")
	net.SendToServer()
end

net.Receive("GivePointsCfgs", function()
	PR_Capture_Points_List.Config = net.ReadTable()
	hook.Run("PR_PointConfigsUpdated")
end)

local function OpenAdminMenu()
	local ent = net.ReadEntity()
	if not IsValid(ent) then return end

	if IsValid(PR_PointAdminMenu) then PR_PointAdminMenu:Remove() end

	local frame, body = PR_UI.Popup("Настройка точки", 860, 600)
	PR_PointAdminMenu = frame

	-- Что сейчас выбрано на этой точке
	local top = vgui.Create("DPanel", body)
	top:Dock(TOP)
	top:SetTall(S(60))
	top:DockMargin(0, 0, 0, S(12))
	top.Paint = function(self, w, h)
		if not IsValid(ent) then return end
		PR_UI.Box(0, 0, w, h, C.panel)

		-- Владелец берём из выбранной записи: на точку он попадёт после «Установить точку»
		local name = ent:GetCurPoint()
		local cfg = (PR_Capture_Points_List.Config or {})[name]
		local team = cfg and cfg.Team or ent:GetCaptureTeam()
		local x = S(16)
		if name ~= "" and DrawFlag(team, x, S(10), S(64), h - S(20)) then x = x + S(80) end

		if name == "" then
			PR_UI.Text("Запись не выбрана — выбери или создай слева", "big", x, h / 2, C.gold, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		else
			PR_UI.Text("«" .. name .. "»", "big", x, h / 2, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			PR_UI.Text("владелец: " .. OwnerName(team), "normal", w - S(16), h / 2, C.muted, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end

	-- Справа действия
	local actions = vgui.Create("DPanel", body)
	actions:Dock(RIGHT)
	actions:SetWide(S(280))
	actions:DockMargin(S(12), 0, 0, 0)
	actions:DockPadding(S(16), S(16), S(16), S(16))
	actions.Paint = function(self, w, h) PR_UI.Box(0, 0, w, h, C.panel) end

	local set = PR_UI.Button(actions, "Установить точку", function()
		net.Start("SetPoint")
			net.WriteEntity(ent)
		net.SendToServer()
		frame:Remove()
	end, {height = 52, font = "big", color = C.accent, hoverColor = C.accentDark, disabled = function()
		return not IsValid(ent) or ent:GetCurPoint() == ""
	end})
	set:Dock(TOP)

	local setHint = vgui.Create("DLabel", actions)
	setHint:Dock(TOP)
	setHint:DockMargin(0, S(8), 0, S(20))
	setHint:SetFont(PR_UI.Font("small"))
	setHint:SetTextColor(C.muted)
	setHint:SetWrap(true)
	setHint:SetAutoStretchVertical(true)
	setHint:SetText("Применить выбранную запись и запомнить, где точка стоит на этой карте. После рестарта она появится здесь же.")

	local remove = PR_UI.Button(actions, "Убрать с карты", function()
		Confirm("Убрать точку «" .. ent:GetCurPoint() .. "» с карты?", "Убрать", function()
			net.Start("PR_PointRemove")
				net.WriteEntity(ent)
			net.SendToServer()
			if IsValid(frame) then frame:Remove() end
		end)
	end, {height = 48, color = C.accentDark, hoverColor = C.accent})
	remove:Dock(TOP)

	local removeHint = vgui.Create("DLabel", actions)
	removeHint:Dock(TOP)
	removeHint:DockMargin(0, S(8), 0, 0)
	removeHint:SetFont(PR_UI.Font("small"))
	removeHint:SetTextColor(C.muted)
	removeHint:SetWrap(true)
	removeHint:SetAutoStretchVertical(true)
	removeHint:SetText("Владелец и улучшения в записи останутся.")

	-- Слева записи точек и создание новой
	local list = Section(body, "Записи точек")

	local create = vgui.Create("DPanel", list)
	create:Dock(BOTTOM)
	create:SetTall(S(44))
	create:DockMargin(0, S(10), 0, 0)
	create.Paint = nil

	local nameEntry = vgui.Create("DTextEntry", create)
	nameEntry:Dock(FILL)
	nameEntry:DockMargin(0, 0, S(8), 0)
	nameEntry:SetFont(PR_UI.Font("normal"))
	nameEntry:SetPlaceholderText("Название новой точки")

	local function CreateConfig()
		local name = string.Trim(nameEntry:GetValue())
		if name == "" then return end

		net.Start("CreateNewCfgs")
			net.WriteString(name)
			net.WriteEntity(ent)
		net.SendToServer()
		RequestConfigs()
		nameEntry:SetValue("")
	end
	nameEntry.OnEnter = CreateConfig

	local createBtn = PR_UI.Button(create, "Создать", CreateConfig, {height = 44, color = C.accentDark, hoverColor = C.accent})
	createBtn:Dock(RIGHT)
	createBtn:SetWide(S(140))

	local scroll = vgui.Create("DScrollPanel", list)
	scroll:Dock(FILL)

	local function Fill()
		if not IsValid(scroll) then return end
		scroll:Clear()

		local configs = PR_Capture_Points_List.Config or {}
		local names = table.GetKeys(configs)
		table.sort(names)

		if #names == 0 then
			local empty = scroll:Add("DPanel")
			empty:Dock(TOP)
			empty:SetTall(S(60))
			empty.Paint = function(self, w, h)
				PR_UI.Text("Записей пока нет", "normal", w / 2, h / 2, C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
			return
		end

		for _, name in ipairs(names) do
			local cfg = configs[name]
			local row = scroll:Add("DButton")
			row:SetText("")
			row:Dock(TOP)
			row:SetTall(S(56))
			row:DockMargin(0, 0, 0, S(6))
			row.Paint = function(self, w, h)
				local current = IsValid(ent) and ent:GetCurPoint() == name
				PR_UI.Box(0, 0, w, h, current and C.hover or (self:IsHovered() and C.panel2 or C.bg))
				if current then PR_UI.Box(0, 0, S(4), h, C.accent) end

				local x = S(14)
				if DrawFlag(cfg.Team, x, S(10), S(52), h - S(20)) then x = x + S(64) end
				PR_UI.Text(name, "normal", x, h * 0.33, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				PR_UI.Text(OwnerName(cfg.Team), "small", x, h * 0.7, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				PR_UI.Text("монитор " .. (cfg.Monitor or 0) .. "  ·  комп " .. (cfg.System or 1), "small", w - S(14), h / 2, C.muted, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end
			row.DoClick = function()
				surface.PlaySound("ui/buttonclick.wav")
				net.Start("SetServerPointsCfgs")
					net.WriteString(name)
					net.WriteEntity(ent)
				net.SendToServer()
			end
		end
	end

	Fill()
	RequestConfigs()

	hook.Add("PR_PointConfigsUpdated", "PR_PointAdminMenu", Fill)
	frame.OnRemove = function()
		hook.Remove("PR_PointConfigsUpdated", "PR_PointAdminMenu")
	end

	local frameThink = frame.Think
	frame.Think = function(self)
		if frameThink then frameThink(self) end
		if not IsValid(ent) then self:Remove() end
	end
end

net.Receive("OpenIDKPanel", OpenOwnerMenu)
net.Receive("OpenAdminPanel", OpenAdminMenu)
