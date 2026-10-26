-- Окно вариантов патрулей: создать, поправить, удалить, выпустить сейчас.
-- Открывается из «Редактора патрулей» (Shift+R или кнопка в меню территорий) и командой pr_patrol_types.
-- Сервер проверяет и обрезает всё, что отсюда приходит (PR_Patrol.CleanType в sv_patrols.lua).

PR_PatrolEditor = PR_PatrolEditor or {Spots = {}, Zone = ""}
PR_PatrolEditor.Types = PR_PatrolEditor.Types or {}

local S = PR_UI.S
local C = PR_UI.Colors

net.Receive("PR_PatrolTypes", function()
	PR_PatrolEditor.Types = net.ReadTable() or {}
	hook.Run("PR_PatrolTypesUpdated")
end)

-- Боты-экипажи техники патрулей — не игроки: прячем системные «вступает в игру», «покидает игру»
-- и «меняет имя». Сервер заранее присылает имя бота, при уходе причина — «Экипаж патруля»
local crewNames = {}

net.Receive("PR_PatrolCrewName", function()
	crewNames[net.ReadString()] = CurTime() + 15
end)

hook.Add("ChatText", "PR_HideCrewJoin", function(index, name, text, kind)
	if kind ~= "joinleave" and kind ~= "namechange" then return end
	if string.find(text, "Экипаж патруля", 1, true) then return true end

	for crew, untilTime in pairs(crewNames) do
		if CurTime() > untilTime then
			crewNames[crew] = nil
		elseif string.find(text, crew, 1, true) then
			return true
		end
	end
end)

net.Receive("PR_PatrolTypeResult", function()
	local ok = net.ReadBool()
	local key = net.ReadString()
	local text = net.ReadString()

	PR_UI.Notify(text, not ok)
	if ok then hook.Run("PR_PatrolTypeDone", key) end
end)

----------------------------------------------------------------------------------------------------
-- Что можно выбрать: NPC, оружие NPC, оружие игроков (добыча)
----------------------------------------------------------------------------------------------------

local function SortOptions(out)
	table.sort(out, function(a, b) return string.lower(a.label) < string.lower(b.label) end)
	return out
end

local function NPCOptions()
	local out, seen = {}, {}

	for class, data in pairs(list.Get("NPC")) do
		seen[class] = true
		table.insert(out, {value = class, label = data.Name or class, sub = class .. (data.Category and ("  ·  " .. data.Category) or "")})
	end

	-- Не всё есть в спавн-меню: охрану Решалы пак регистрирует только как сущности
	for class, info in pairs(scripted_ents.GetList()) do
		local t = info.t or {}
		if not seen[class] and t.Type == "ai" and not string.find(class, "_base$") then
			table.insert(out, {value = class, label = t.PrintName or class, sub = class .. (t.Category and ("  ·  " .. t.Category) or "")})
		end
	end

	return SortOptions(out)
end

local function NPCWeaponOptions()
	local out, seen = {}, {}

	for _, w in ipairs(list.Get("NPCUsableWeapons")) do
		if w.class and not seen[w.class] then
			seen[w.class] = true
			table.insert(out, {value = w.class, label = language.GetPhrase(w.title or w.class), sub = w.class})
		end
	end

	for _, w in ipairs(weapons.GetList()) do
		local class = w.ClassName
		if class and not seen[class] and string.StartWith(class, "weapon_vj_") then
			seen[class] = true
			table.insert(out, {value = class, label = w.PrintName or class, sub = class})
		end
	end

	return SortOptions(out)
end

-- Техника: simfphys (наземная, водит бот) и LFS/LVS (своим ИИ)
local KIND_NAMES = {ground = "Наземная", air = "Авиация", aiground = "Наземная (LVS)"}

local function VehicleOptions()
	local out = {}

	for class, v in pairs(list.Get("simfphys_vehicles")) do
		table.insert(out, {value = class, label = "[Наземная] " .. (v.Name or class), sub = class .. (v.Category and ("  ·  " .. v.Category) or "")})
	end

	for class, info in pairs(scripted_ents.GetList()) do
		local t = info.t or {}
		local kind = t.Spawnable and PR_PatrolVehicleKind(class)
		if kind and kind ~= "ground" then
			table.insert(out, {value = class, label = "[" .. KIND_NAMES[kind] .. "] " .. (t.PrintName or class), sub = class .. (t.Category and ("  ·  " .. t.Category) or "")})
		end
	end

	return SortOptions(out)
end

local function DropOptions()
	local out = {}
	for class, w in pairs(list.Get("Weapon")) do
		if w.Spawnable then
			table.insert(out, {value = class, label = language.GetPhrase(w.PrintName or class), sub = class .. (w.Category and ("  ·  " .. w.Category) or "")})
		end
	end
	return SortOptions(out)
end

----------------------------------------------------------------------------------------------------
-- Выбор из списка с поиском
----------------------------------------------------------------------------------------------------

-- options = {{value, label, sub}}, selected = список значений. onDone(список значений)
function PR_PatrolEditor.Pick(title, options, selected, multi, onDone)
	local chosen = {}
	for _, v in ipairs(selected or {}) do chosen[v] = true end

	local frame, body = PR_UI.Popup(title, 680, 760)

	local search = vgui.Create("DTextEntry", body)
	search:Dock(TOP)
	search:SetTall(S(40))
	search:DockMargin(0, 0, 0, S(8))
	search:SetFont(PR_UI.Font("normal"))
	search:SetPlaceholderText("Поиск по названию или классу")
	search:SetUpdateOnType(true)

	if multi then
		local done = PR_UI.Button(body, function()
			return "Готово  (" .. table.Count(chosen) .. ")"
		end, function()
			local out = {}
			for _, o in ipairs(options) do
				if chosen[o.value] then table.insert(out, o.value) end
			end
			-- То, чего нет в игре сейчас, но уже было выбрано, не теряем
			for _, v in ipairs(selected or {}) do
				if chosen[v] and not table.HasValue(out, v) then table.insert(out, v) end
			end
			onDone(out)
			frame:Remove()
		end, {height = 48, font = "big", color = C.accent, hoverColor = C.accentDark})
		done:Dock(BOTTOM)
		done:DockMargin(0, S(8), 0, 0)
	end

	local list = vgui.Create("DScrollPanel", body)
	list:Dock(FILL)

	local function Fill()
		list:Clear()
		local query = string.lower(string.Trim(search:GetValue()))
		local shown = 0

		for _, o in ipairs(options) do
			local text = string.lower(o.label .. " " .. o.value)
			if query == "" or string.find(text, query, 1, true) then
				shown = shown + 1
				if shown > 300 then break end

				local row = list:Add("DButton")
				row:SetText("")
				row:Dock(TOP)
				row:SetTall(S(50))
				row:DockMargin(0, 0, 0, S(4))
				row.Paint = function(self, w, h)
					local on = chosen[o.value]
					PR_UI.Box(0, 0, w, h, on and C.hover or (self:IsHovered() and C.panel2 or C.panel))
					if on then PR_UI.Box(0, 0, S(4), h, C.accent) end
					PR_UI.Text(o.label, "normal", S(16), h * 0.34, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					PR_UI.Text(o.sub or o.value, "small", S(16), h * 0.72, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					if multi then
						-- Квадратик-галочка справа
						local box = S(22)
						local bx, by = w - S(18) - box, (h - box) / 2
						PR_UI.Outline(bx, by, box, box, on and C.good or C.line)
						if on then PR_UI.Box(bx + S(5), by + S(5), box - S(10), box - S(10), C.good) end
					end
				end
				row.DoClick = function()
					surface.PlaySound("ui/buttonclick.wav")
					if multi then
						chosen[o.value] = not chosen[o.value] or nil
					else
						onDone({o.value})
						frame:Remove()
					end
				end
			end
		end

		if shown == 0 then
			local empty = list:Add("DPanel")
			empty:Dock(TOP)
			empty:SetTall(S(60))
			empty.Paint = function(self, w, h)
				PR_UI.Text("Ничего не нашлось", "normal", w / 2, h / 2, C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end

	search.OnValueChange = Fill
	Fill()
	search:RequestFocus()

	return frame
end

----------------------------------------------------------------------------------------------------
-- Поля формы
----------------------------------------------------------------------------------------------------

local FORMATION_NAMES = {
	around = "Вокруг главного",
	wedge = "Клин",
	column = "Колонна"
}

local function Header(parent, title, onRemove)
	local bar = vgui.Create("DPanel", parent)
	bar:Dock(TOP)
	bar:SetTall(S(44))
	bar:DockMargin(0, S(14), 0, S(8))
	bar.Paint = function(self, w, h)
		PR_UI.Box(0, 0, w, h, C.panel)
		PR_UI.Box(0, 0, S(4), h, C.accent)
		PR_UI.Text(isfunction(title) and title() or title, "big", S(16), h / 2, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	if onRemove then
		local remove = PR_UI.Button(bar, "Убрать", onRemove, {height = 44, color = C.accentDark, hoverColor = C.accent})
		remove:Dock(RIGHT)
		remove:SetWide(S(130))
	end

	return bar
end

local function Row(parent, label, hint)
	local row = vgui.Create("DPanel", parent)
	row:Dock(TOP)
	row:SetTall(S(42))
	row:DockMargin(0, 0, 0, S(6))
	row.Paint = function(self, w, h)
		if hint then
			PR_UI.Text(label, "normal", 0, h * 0.32, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			PR_UI.Text(hint, "small", 0, h * 0.76, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		else
			PR_UI.Text(label, "normal", 0, h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end
	return row
end

local CONTROL_WIDTH = 460

local function TextField(parent, label, get, set, opts)
	opts = opts or {}
	local row = Row(parent, label, opts.hint)

	local entry = vgui.Create("DTextEntry", row)
	entry:Dock(RIGHT)
	entry:SetWide(S(opts.width or CONTROL_WIDTH))
	entry:SetFont(PR_UI.Font("normal"))
	if opts.numeric then entry:SetNumeric(true) end
	entry:SetValue(tostring(get() or ""))
	entry:SetUpdateOnType(true)
	entry.OnValueChange = function(self, value)
		if opts.numeric then set(tonumber(value) or 0) else set(value) end
	end
	return entry
end

-- Кнопка с кратким списком выбранного; по клику — окно выбора
local function PickField(parent, label, get, set, options, multi, labels)
	local row = Row(parent, label)

	local btn = PR_UI.Button(row, function()
		local values = get() or {}
		if #values == 0 then return "не выбрано" end
		local first = labels[values[1]] or values[1]
		return #values > 1 and (first .. "  и ещё " .. (#values - 1)) or first
	end, function()
		PR_PatrolEditor.Pick(label, options(), get(), multi, set)
	end, {height = 42, alignLeft = true, color = C.panel2})
	btn:Dock(RIGHT)
	btn:SetWide(S(CONTROL_WIDTH))
	return btn
end

local function Toggle(parent, label, get, set)
	local row = Row(parent, label)
	local btn = PR_UI.Button(row, function() return get() and "Да" or "Нет" end, function() set(not get()) end, {
		height = 42,
		color = C.panel2,
		selected = get
	})
	btn:Dock(RIGHT)
	btn:SetWide(S(CONTROL_WIDTH))
	return btn
end

local function Choice(parent, label, choices, get, set)
	local row = Row(parent, label)
	local combo = vgui.Create("DComboBox", row)
	combo:Dock(RIGHT)
	combo:SetWide(S(CONTROL_WIDTH))
	combo:SetFont(PR_UI.Font("normal"))
	for _, c in ipairs(choices) do
		combo:AddChoice(c[2], c[1], get() == c[1])
	end
	combo.OnSelect = function(_, _, _, value) set(value) end
	return combo
end

----------------------------------------------------------------------------------------------------
-- Окно
----------------------------------------------------------------------------------------------------

local function NewTemplate()
	return {
		name = "Новый патруль",
		weight = 1,
		chance = 0.5,
		maxAlive = 1,
		formation = "around",
		announce = "",
		leaderKilled = "",
		leader = {name = "Главный", class = {}, weapons = {}, health = 300, reward = {money = 1000, exp = 5}, drop = {}},
		followers = {
			{name = "Свита", class = {}, count = 3, weapons = {}, health = 200, reward = {money = 300, exp = 2}}
		},
		vehicles = {}
	}
end

local function NewVehicle()
	return {name = "", class = {}, count = 1, health = 0, reward = {money = 3000, exp = 15}}
end

local function AsList(value)
	if istable(value) then return value end
	if isstring(value) and value ~= "" then return {value} end
	return {}
end

-- Копия варианта, удобная для формы: списки всегда списки, пустые поля заполнены
local function ForEditing(data)
	local edit = table.Copy(data)
	edit.formation = isstring(edit.formation) and edit.formation or "around"
	edit.announce = edit.announce or ""
	edit.leaderKilled = edit.leaderKilled or ""

	local function FixNPC(def)
		def.class = AsList(def.class)
		def.weapons = AsList(def.weapons)
		def.reward = def.reward or {money = 0, exp = 0}
	end

	if edit.leader then
		FixNPC(edit.leader)
		edit.leader.drop = AsList(edit.leader.drop)
	end
	edit.followers = edit.followers or {}
	for _, group in ipairs(edit.followers) do FixNPC(group) end

	edit.vehicles = edit.vehicles or {}
	for _, v in ipairs(edit.vehicles) do
		v.name = v.name or ""
		v.class = AsList(v.class)
		v.count = v.count or 1
		v.crew = nil -- экипаж всегда полный, поле осталось от старых сохранений
		v.health = v.health or 0
		v.reward = v.reward or {money = 0, exp = 0}
	end

	return edit
end

local function NPCCount(data)
	local n = data.leader and 1 or 0
	for _, group in ipairs(data.followers or {}) do n = n + (group.count or 1) end
	return n
end

local function VehicleCount(data)
	local n = 0
	for _, v in ipairs(data.vehicles or {}) do n = n + (v.count or 1) end
	return n
end

function PR_PatrolEditor.OpenTypes()
	if not PR_IsAdmin(LocalPlayer()) then return end
	if IsValid(PR_PatrolEditor.TypesFrame) then PR_PatrolEditor.TypesFrame:Remove() end

	net.Start("PR_PatrolTypes")
	net.SendToServer()

	local frame, body = PR_UI.Popup("Патрули", 1280, 880)
	PR_PatrolEditor.TypesFrame = frame

	-- Подписи для кнопок выбора: класс -> понятное имя (собираем один раз на окно)
	local labels = {}
	local cache = {}
	local function Cached(name, build)
		return function()
			if not cache[name] then
				cache[name] = build()
				for _, o in ipairs(cache[name]) do labels[o.value] = labels[o.value] or o.label end
			end
			return cache[name]
		end
	end
	local npcOptions = Cached("npc", NPCOptions)
	local npcWeaponOptions = Cached("npcWeapons", NPCWeaponOptions)
	local dropOptions = Cached("drop", DropOptions)
	local vehicleOptions = Cached("vehicles", VehicleOptions)
	npcOptions()
	npcWeaponOptions()
	dropOptions()
	vehicleOptions()

	-- touched: админ сам выбрал вариант или начал новый — список с сервера его выбор не сбивает
	local state = {key = nil, edit = nil, touched = false}

	local function FirstKey()
		for key in SortedPairsByMemberValue(PR_PatrolEditor.Types, "name") do return key end
	end

	-- Слева список вариантов
	local side = vgui.Create("DPanel", body)
	side:Dock(LEFT)
	side:SetWide(S(320))
	side:DockMargin(0, 0, S(12), 0)
	side:DockPadding(S(8), S(8), S(8), S(8))
	side.Paint = function(self, w, h) PR_UI.Box(0, 0, w, h, C.panel) end

	local content = vgui.Create("DPanel", body)
	content:Dock(FILL)
	content.Paint = nil

	local Select

	local add = PR_UI.Button(side, "+ Новый патруль", function()
		state.touched = true
		Select(nil)
	end, {height = 48, font = "big", color = C.accent, hoverColor = C.accentDark})
	add:Dock(BOTTOM)
	add:DockMargin(0, S(8), 0, 0)

	local list = vgui.Create("DScrollPanel", side)
	list:Dock(FILL)

	local function FillList()
		if not IsValid(list) then return end
		list:Clear()

		for key, data in SortedPairsByMemberValue(PR_PatrolEditor.Types, "name") do
			local row = list:Add("DButton")
			row:SetText("")
			row:Dock(TOP)
			row:SetTall(S(60))
			row:DockMargin(0, 0, 0, S(4))
			row.Paint = function(self, w, h)
				local current = state.key == key
				PR_UI.Box(0, 0, w, h, current and C.hover or (self:IsHovered() and C.panel2 or C.bg))
				if current then PR_UI.Box(0, 0, S(4), h, C.accent) end
				PR_UI.Text(data.name or key, "normal", S(14), h * 0.34, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				local vehicles = VehicleCount(data)
				PR_UI.Text(NPCCount(data) .. " NPC" .. (vehicles > 0 and ("  ·  техники " .. vehicles) or "") .. "  ·  шанс " .. math.Round((data.chance or 1) * 100) .. "%",
					"small", S(14), h * 0.72, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			end
			row.DoClick = function()
				surface.PlaySound("ui/buttonclick.wav")
				state.touched = true
				Select(key)
			end
		end
	end

	local BuildForm

	Select = function(key)
		state.key = key
		state.edit = ForEditing(key and PR_PatrolEditor.Types[key] or NewTemplate())
		FillList()
		BuildForm()
	end
	PR_PatrolEditor.SelectType = Select

	BuildForm = function()
		content:Clear()
		local edit = state.edit
		if not edit then return end

		-- Кнопки внизу
		local bar = vgui.Create("DPanel", content)
		bar:Dock(BOTTOM)
		bar:SetTall(S(52))
		bar:DockMargin(0, S(10), 0, 0)
		bar.Paint = nil

		local save = PR_UI.Button(bar, "Сохранить", function()
			net.Start("PR_PatrolSaveType")
				net.WriteString(state.key or "")
				net.WriteTable(state.edit)
			net.SendToServer()
		end, {height = 52, font = "big", color = C.accent, hoverColor = C.accentDark})
		save:Dock(LEFT)
		save:SetWide(S(220))

		local spawn = PR_UI.Button(bar, "Выпустить сейчас", function()
			net.Start("PR_PatrolSpawnType")
				net.WriteString(state.key)
			net.SendToServer()
		end, {height = 52, disabled = function() return state.key == nil end})
		spawn:Dock(LEFT)
		spawn:SetWide(S(240))
		spawn:DockMargin(S(10), 0, 0, 0)

		local delete = PR_UI.Button(bar, "Удалить", function()
			local key = state.key
			local name = edit.name
			Derma_Query("Удалить патруль «" .. name .. "»?", "Патрули", "Удалить", function()
				net.Start("PR_PatrolDeleteType")
					net.WriteString(key)
				net.SendToServer()
			end, "Отмена")
		end, {height = 52, color = C.accentDark, hoverColor = C.accent, disabled = function() return state.key == nil end})
		delete:Dock(RIGHT)
		delete:SetWide(S(180))

		local hint = vgui.Create("DPanel", bar)
		hint:Dock(FILL)
		hint.Paint = function(self, w, h)
			PR_UI.Text(state.key and "Выпускает на спот, куда смотришь" or "Новый патруль: сначала сохрани", "small", w / 2, h / 2, C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local scroll = vgui.Create("DScrollPanel", content)
		scroll:Dock(FILL)
		scroll:GetCanvas():DockPadding(0, 0, S(12), S(12))

		-- Общее
		Header(scroll, "Общее")
		TextField(scroll, "Название", function() return edit.name end, function(v) edit.name = v end)
		TextField(scroll, "Шанс появиться, %", function() return math.Round(edit.chance * 100) end, function(v) edit.chance = math.Clamp(v / 100, 0, 1) end,
			{numeric = true, hint = "при каждой попытке спавна по таймеру"})
		TextField(scroll, "Вес", function() return edit.weight end, function(v) edit.weight = v end,
			{numeric = true, hint = "чем больше, тем чаще выбирается среди других патрулей"})
		TextField(scroll, "Одновременно на карте", function() return edit.maxAlive end, function(v) edit.maxAlive = v end, {numeric = true})
		Choice(scroll, "Строй свиты", {{"around", FORMATION_NAMES.around}, {"wedge", FORMATION_NAMES.wedge}, {"column", FORMATION_NAMES.column}},
			function() return edit.formation end, function(v) edit.formation = v end)
		TextField(scroll, "Сообщение о появлении", function() return edit.announce end, function(v) edit.announce = v end,
			{hint = "в чат всем; пусто — молча"})
		TextField(scroll, "Сообщение о смерти главного", function() return edit.leaderKilled end, function(v) edit.leaderKilled = v end,
			{hint = "%s — ник убийцы; пусто — молча"})

		-- Главный
		Header(scroll, "Главный")
		Toggle(scroll, "Есть главный", function() return edit.leader ~= nil end, function(on)
			if on then
				edit.leader = state.savedLeader or {name = "Главный", class = {}, weapons = {}, health = 300, reward = {money = 1000, exp = 5}, drop = {}}
			else
				state.savedLeader = edit.leader
				edit.leader = nil
			end
			BuildForm()
		end)

		if edit.leader then
			local L = edit.leader
			TextField(scroll, "Имя", function() return L.name end, function(v) L.name = v end)
			PickField(scroll, "NPC", function() return L.class end, function(v) L.class = v end, npcOptions, false, labels)
			PickField(scroll, "Оружие", function() return L.weapons end, function(v) L.weapons = v end, npcWeaponOptions, true, labels)
			TextField(scroll, "Здоровье", function() return L.health end, function(v) L.health = v end, {numeric = true})
			TextField(scroll, "Награда, $", function() return L.reward.money end, function(v) L.reward.money = v end, {numeric = true})
			TextField(scroll, "Опыт за убийство", function() return L.reward.exp end, function(v) L.reward.exp = v end, {numeric = true})
			PickField(scroll, "Добыча (оружие игрокам)", function() return L.drop end, function(v) L.drop = v end, dropOptions, true, labels)
			Toggle(scroll, "Золотая добыча", function() return L.dropGold == true end, function(v) L.dropGold = v end)
		end

		-- Свита
		for i, group in ipairs(edit.followers) do
			Header(scroll, function() return "Свита: " .. (group.name ~= "" and group.name or ("группа " .. i)) end, function()
				table.remove(edit.followers, i)
				BuildForm()
			end)
			TextField(scroll, "Название группы", function() return group.name end, function(v) group.name = v end)
			PickField(scroll, "NPC", function() return group.class end, function(v) group.class = v end, npcOptions, true, labels)
			TextField(scroll, "Сколько", function() return group.count end, function(v) group.count = v end, {numeric = true, hint = "от 1 до 10"})
			PickField(scroll, "Оружие", function() return group.weapons end, function(v) group.weapons = v end, npcWeaponOptions, true, labels)
			TextField(scroll, "Здоровье", function() return group.health end, function(v) group.health = v end, {numeric = true})
			TextField(scroll, "Награда, $", function() return group.reward.money end, function(v) group.reward.money = v end, {numeric = true})
			TextField(scroll, "Опыт за убийство", function() return group.reward.exp end, function(v) group.reward.exp = v end, {numeric = true})
		end

		local addGroup = PR_UI.Button(scroll, "+ Группа свиты", function()
			table.insert(edit.followers, {name = "", class = {}, count = 2, weapons = {}, health = 200, reward = {money = 300, exp = 2}})
			BuildForm()
		end, {height = 44, color = C.panel2})
		addGroup:Dock(TOP)
		addGroup:DockMargin(0, S(14), 0, 0)

		-- Техника
		for i, v in ipairs(edit.vehicles) do
			Header(scroll, function() return "Техника: " .. (v.name ~= "" and v.name or ("машина " .. i)) end, function()
				table.remove(edit.vehicles, i)
				BuildForm()
			end)
			TextField(scroll, "Название", function() return v.name end, function(val) v.name = val end,
				{hint = "его же видно в килфиде: это имя бота-экипажа"})
			PickField(scroll, "Машина", function() return v.class end, function(val) v.class = val end, vehicleOptions, false, labels)
			TextField(scroll, "Сколько", function() return v.count end, function(val) v.count = val end, {numeric = true, hint = "от 1 до 3"})
			TextField(scroll, "Здоровье", function() return v.health end, function(val) v.health = val end,
				{numeric = true, hint = "0 — как задумано у машины"})
			TextField(scroll, "Награда, $", function() return v.reward.money end, function(val) v.reward.money = val end, {numeric = true})
			TextField(scroll, "Опыт за уничтожение", function() return v.reward.exp end, function(val) v.reward.exp = val end, {numeric = true})
		end

		local addVehicle = PR_UI.Button(scroll, "+ Техника", function()
			table.insert(edit.vehicles, NewVehicle())
			BuildForm()
		end, {height = 44, color = C.panel2})
		addVehicle:Dock(TOP)
		addVehicle:DockMargin(0, S(8), 0, 0)

		local vehicleHint = vgui.Create("DLabel", scroll)
		vehicleHint:Dock(TOP)
		vehicleHint:DockMargin(0, S(6), 0, 0)
		vehicleHint:SetFont(PR_UI.Font("small"))
		vehicleHint:SetTextColor(C.muted)
		vehicleHint:SetWrap(true)
		vehicleHint:SetAutoStretchVertical(true)
		vehicleHint:SetText("Экипаж всегда полный: наземную (simfphys, танки Луны и Гредвича) водит бот, и на каждое место с оружием садится бот-стрелок. Авиация (LFS/LVS) летает своим ИИ, кружит над патрулём, а боты садятся на все места стрелков (Ми-24, Ми-8, AH-1G). Каждый бот занимает слот игрока.")
	end

	-- Пока свежий список не пришёл, показываем то, что знаем; пришёл — выбираем первый,
	-- если админ ещё ничего не трогал
	Select(FirstKey())

	hook.Add("PR_PatrolTypesUpdated", "PR_PatrolTypesFrame", function()
		FillList()
		if not state.touched and state.key == nil and FirstKey() then
			Select(FirstKey())
		end
	end)

	hook.Add("PR_PatrolTypeDone", "PR_PatrolTypesFrame", function(key)
		-- Сохранили — показываем то, что записал сервер; удалили — первый из оставшихся
		if key ~= "" and PR_PatrolEditor.Types[key] then
			state.touched = true
			Select(key)
		elseif state.key and not PR_PatrolEditor.Types[state.key] then
			Select(FirstKey())
		end
	end)

	frame.OnRemove = function()
		hook.Remove("PR_PatrolTypesUpdated", "PR_PatrolTypesFrame")
		hook.Remove("PR_PatrolTypeDone", "PR_PatrolTypesFrame")
	end
end

concommand.Add("pr_patrol_types", function()
	PR_PatrolEditor.OpenTypes()
end)
