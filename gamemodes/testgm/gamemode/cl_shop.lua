-- Единый магазин: оружие, снаряжение, техника, одежда (вкладки меню F4, cl_menu.lua).
-- Слева категории, в середине товары, справа карточка с превью и кнопками.
-- Сервер (sv_shop.lua) сам проверяет цены и условия; здесь только интерфейс и подсказки.

PR_Shop = PR_Shop or {}

local S = PR_UI.S
local C = PR_UI.Colors

----------------------------------------------------------------------------------------------------
-- Категории
----------------------------------------------------------------------------------------------------

local WEAPON_TYPES = {
    {key = "pistol", name = "Пистолеты", icon = "test_gm_mat/q_menu_weap/pistol.png"},
    {key = "smg", name = "Пистолеты-пулемёты", icon = "test_gm_mat/q_menu_weap/smg.png"},
    {key = "shotgun", name = "Дробовики", icon = "test_gm_mat/q_menu_weap/shotgun.png"},
    {key = "ar", name = "Автоматы", icon = "test_gm_mat/q_menu_weap/ar.png"},
    {key = "sniper", name = "Снайперские", icon = "test_gm_mat/q_menu_weap/sniper.png"},
    {key = "machinegun", name = "Пулемёты", icon = "test_gm_mat/q_menu_weap/machinegun.png"}
}

local EQUIP_CATEGORIES = {
    {key = "grenade_lethal", name = "Гранаты"},
    {key = "grenade_unlethal", name = "Дым и светошумовые"},
    {key = "explosion", name = "Взрывчатка"},
    {key = "melee_weapon", name = "Холодное оружие"},
    {key = "stims", name = "Стимуляторы"},
    {key = "first_aid", name = "Медицина"},
    {key = "stations_device", name = "Стационарное"},
    {key = "binoculars", name = "Бинокли"},
    {key = "rocket_launchers", name = "Гранатомёты"},
    {key = "signal_device", name = "Сигнальные"},
    {key = "armor_and_else", name = "Броня и патроны"}
}

local VEHICLE_TYPES = {
    {key = "light_armor", name = "Лёгкая техника"},
    {key = "support_vehicle", name = "Поддержка"},
    {key = "bmp_and_btr", name = "БМП и БТР"},
    {key = "tanks", name = "Танки"},
    {key = "helicopters", name = "Вертолёты"},
    {key = "jets", name = "Самолёты"}
}

local CLOTH_CATEGORIES = {
    {key = "all", name = "Форма"}
}

local function CategoryName(list, key)
    for _, c in ipairs(list) do
        if c.key == key then return c.name end
    end
    return tostring(key)
end

----------------------------------------------------------------------------------------------------
-- Данные игрока
----------------------------------------------------------------------------------------------------

local function Me() return LocalPlayer() end
local function MyMoney() return Me():GetNWInt("PR_money") end
local function MyFraction() return Me():GetNWString("PR_fraction") end

local function Owned(list, item)
    return istable(list) and table.HasValue(list, item)
end

----------------------------------------------------------------------------------------------------
-- Виды товаров
----------------------------------------------------------------------------------------------------

local KINDS = {}

-- Модель для превью сущности (техника, снаряжение)
local ENGINE_MODELS = {
    item_battery = "models/items/battery.mdl",
    item_healthkit = "models/items/healthkit.mdl",
    item_healthvial = "models/healthvial.mdl"
}

local function EntityModel(class)
    if ENGINE_MODELS[class] then return ENGINE_MODELS[class] end

    local sim = list.Get("simfphys_vehicles")[class]
    if sim and sim.Model then return sim.Model end

    local ent = scripted_ents.Get(class)
    if ent then return ent.MDL or ent.Model end
end

-- Встроенное оружие HL2 не лежит в weapons.GetStored, его модели знаем сами
local HL2_WEAPON_MODELS = {
    weapon_pistol = "models/weapons/w_pistol.mdl",
    weapon_357 = "models/weapons/w_357.mdl",
    weapon_smg1 = "models/weapons/w_smg1.mdl",
    weapon_ar2 = "models/weapons/w_irifle.mdl",
    weapon_shotgun = "models/weapons/w_shotgun.mdl",
    weapon_crossbow = "models/weapons/w_crossbow.mdl",
    weapon_rpg = "models/weapons/w_rocket_launcher.mdl",
    weapon_frag = "models/weapons/w_grenade.mdl",
    weapon_crowbar = "models/weapons/w_crowbar.mdl",
    weapon_stunstick = "models/weapons/w_stunbaton.mdl"
}

local function WeaponModel(class)
    local w = weapons.GetStored(class)
    return (w and w.WorldModel) or HL2_WEAPON_MODELS[class]
end

KINDS.weapon = {
    title = "Оружие",
    global = "PR_WS_List",
    save = "SaveWeaponData",
    byFraction = true,
    keyField = "ClassName",
    categories = WEAPON_TYPES,
    catField = "Type",

    installed = function(e) return PR_WeaponExists(e.ClassName) end,
    sort = function(a, b) return (tonumber(a.Tier) or 0) < (tonumber(b.Tier) or 0) end,
    model = function(e) return WeaponModel(e.ClassName) end,

    status = function(e, frac)
        if Owned(PR_PurchasedWeapons, e.ClassName) then
            local tags = {}
            if PR_Preset and PR_Preset.Primary and PR_Preset.Primary.Item == e.ClassName then table.insert(tags, "основное") end
            if PR_Preset and PR_Preset.Secondary and PR_Preset.Secondary.Item == e.ClassName then table.insert(tags, "второе") end
            return "Куплено" .. (#tags > 0 and (" · " .. table.concat(tags, ", ")) or ""), C.good
        end
        if not PR_IsWeaponUnlocked(e, PR_PurchasedWeapons) then
            return "Закрыто", C.muted
        end

        local price, exp = tonumber(e.Price) or 0, tonumber(e.Exp) or 0
        local canPay = MyMoney() >= price and Me():GetNWInt("PR_weapon_exp_" .. frac) >= exp
        return PR_UI.Money(price) .. (exp > 0 and (" · " .. exp .. " оп.") or ""), canPay and C.text or C.bad
    end
}

KINDS.equip = {
    title = "Снаряжение",
    global = "PR_Equip_List",
    save = "SaveEquipData",
    byFraction = false,
    keyField = "ClassName",
    categories = EQUIP_CATEGORIES,
    catField = "Tier",

    installed = function(e)
        return PR_WeaponExists(e.ClassName) or scripted_ents.Get(e.ClassName) ~= nil or ENGINE_MODELS[e.ClassName] ~= nil
    end,
    sort = function(a, b) return (tonumber(a.Price) or 0) < (tonumber(b.Price) or 0) end,
    model = function(e) return WeaponModel(e.ClassName) or EntityModel(e.ClassName) end,

    status = function(e)
        local price = tonumber(e.Price) or 0
        return PR_UI.Money(price), MyMoney() >= price and C.text or C.bad
    end
}

KINDS.vehicle = {
    title = "Техника",
    global = "PR_Vehicle_List",
    save = "SaveVehicleData",
    byFraction = true,
    keyField = "ClassName",
    categories = VEHICLE_TYPES,
    catField = "Type",

    installed = function(e)
        if e.Mod == "simfphys" then return list.Get("simfphys_vehicles")[e.ClassName] ~= nil end
        return scripted_ents.Get(e.ClassName) ~= nil
    end,
    sort = function(a, b) return (tonumber(a.Price) or 0) < (tonumber(b.Price) or 0) end,
    model = function(e) return EntityModel(e.ClassName) end,

    status = function(e)
        local price = tonumber(e.Price) or 0
        return PR_UI.Money(price), MyMoney() >= price and C.text or C.bad
    end
}

KINDS.cloth = {
    title = "Одежда",
    global = "PR_Cloth_List",
    save = "SaveClothData",
    byFraction = true,
    keyField = "Model",
    categories = CLOTH_CATEGORIES,
    catField = nil,

    installed = function(e) return isstring(e.Model) and file.Exists(e.Model, "GAME") end,
    sort = function(a, b) return (tonumber(a.Level) or 0) < (tonumber(b.Level) or 0) end,
    model = function(e) return e.Model end,

    status = function(e)
        if Owned(PR_PurchasedModels, e.Model) then return "Куплено", C.good end

        local level = tonumber(e.Level) or 0
        if Me():GetNWInt("PR_level") < level then return "С " .. level .. " уровня", C.muted end

        local price = tonumber(e.Price) or 0
        return price > 0 and PR_UI.Money(price) or "Бесплатно", MyMoney() >= price and C.text or C.bad
    end
}

local function ItemName(kind, e)
    if kind == "cloth" then
        return e.Name or string.StripExtension(string.GetFileFromFilename(e.Model or "?"))
    end

    if isstring(e.Name) and e.Name ~= "" then return e.Name end

    local w = weapons.GetStored(e.ClassName or "")
    return w and w.PrintName or e.ClassName or "?"
end

----------------------------------------------------------------------------------------------------
-- Сеть: списки и купленное приходят с сервера
----------------------------------------------------------------------------------------------------

local function ReceiveList(global)
    return function()
        _G[global] = net.ReadTable()
        PR_Shop.Refresh()
    end
end

net.Receive("WeaponTable", ReceiveList("PR_WS_List"))
net.Receive("EquipTable", ReceiveList("PR_Equip_List"))
net.Receive("VehicleTable", ReceiveList("PR_Vehicle_List"))
net.Receive("ClothTable", ReceiveList("PR_Cloth_List"))

-- После покупки сервер присылает новый список купленного (sh_player_save.lua)
hook.Add("PR_PurchasedUpdated", "PR_ShopRefresh", function() PR_Shop.Refresh() end)

function PR_Shop.Refresh()
    if IsValid(PR_Shop.Page) then PR_Shop.Page:Refill() end
end

----------------------------------------------------------------------------------------------------
-- Действия
----------------------------------------------------------------------------------------------------

-- Покупки в зоне покупки: сначала спрашиваем сервер, потом шлём запрос
local function InBuyZone(then_)
    PR_CheckBuyBox("weapon", function(inside)
        if inside then
            then_()
        else
            PR_UI.Notify("Ты не в зоне покупки", true)
        end
    end)
end

local function BuyWeapon(e)
    InBuyZone(function()
        net.Start("GiveWeapon")
            net.WriteString(e.ClassName)
        net.SendToServer()
    end)
end

local function SetPreset(e, slot)
    net.Start("Preset")
        net.WriteString(e.ClassName)
        net.WriteString(slot)
        net.WriteString(ItemName("weapon", e))
    net.SendToServer()

    PR_Preset = PR_Preset or {}
    PR_Preset[slot] = {Item = e.ClassName, Name = ItemName("weapon", e)}
    PR_UI.Notify((slot == "Primary" and "Основное" or "Второе") .. " оружие при спавне: " .. ItemName("weapon", e))
    PR_Shop.Refresh()
end

local function BuyEquipment(e)
    InBuyZone(function()
        net.Start("GiveEnity")
            net.WriteString(e.ClassName)
        net.SendToServer()
    end)
end

local function CallVehicle(e)
    local menu = DermaMenu()

    for name in SortedPairs(PR_GetVehicleDeploys(e.Type)) do
        menu:AddOption(name, function()
            net.Start("GiveVehicle")
                net.WriteString(e.ClassName)
                net.WriteString(name)
            net.SendToServer()
        end)
    end

    menu:Open()
end

local function WearCloth(e, bodygroups)
    net.Start("BuyPlayerModel")
        net.WriteString(e.Model)
        net.WriteTable(bodygroups or {})
    net.SendToServer()
end

----------------------------------------------------------------------------------------------------
-- Превью модели
----------------------------------------------------------------------------------------------------

local function FitCamera(mp)
    local ent = mp.Entity
    if not IsValid(ent) then return end

    local mn, mx = ent:GetRenderBounds()
    local size = math.max(math.abs(mn.x) + math.abs(mx.x), math.abs(mn.y) + math.abs(mx.y), math.abs(mn.z) + math.abs(mx.z))

    mp:SetFOV(38)
    mp:SetCamPos(Vector(size * 1.1, size * 1.1, size * 0.55))
    mp:SetLookAt((mn + mx) * 0.5)
end

local function ModelPreview(parent, model)
    local holder = vgui.Create("DPanel", parent)
    holder.Paint = function(self, w, h)
        PR_UI.Box(0, 0, w, h, C.panel)
        if not self.PR_HasModel then
            PR_UI.Text("Нет модели для превью", "normal", w / 2, h / 2, C.muted, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    -- util.IsValidModel на клиенте врёт для моделей, которые сервер не загрузил; проверяем сам файл
    if isstring(model) and model ~= "" and file.Exists(model, "GAME") then
        local mp = vgui.Create("DModelPanel", holder)
        mp:Dock(FILL)
        mp:SetModel(model)
        FitCamera(mp)
        holder.PR_HasModel = true
        holder.Model = mp
    end

    return holder
end

----------------------------------------------------------------------------------------------------
-- Страница магазина
----------------------------------------------------------------------------------------------------

-- Фракция, чьи товары смотрим: своя, а админ может переключать
local function DefaultFraction()
    local frac = MyFraction()
    return PR_IsFraction(frac) and frac or PR_FRACTIONS[1]
end

-- Список товаров вида kind для фракции: {{entry = e, index = i}, ...}
local function Entries(kind, frac)
    local def = KINDS[kind]
    local source = _G[def.global] or {}
    local list = def.byFraction and (source[frac] or {}) or source
    local out = {}

    for i, e in ipairs(list) do
        if istable(e) then table.insert(out, {entry = e, index = i}) end
    end

    return out
end

function PR_Shop.Build(parent, kind)
    local def = KINDS[kind]
    local isAdmin = PR_IsAdmin(Me())

    local page = vgui.Create("DPanel", parent)
    page:Dock(FILL)
    page.Paint = nil
    page.kind = kind
    page.faction = DefaultFraction()
    page.category = def.categories[1].key
    page.selectedKey = nil

    PR_Shop.Page = page

    -- Шапка: название, выбор фракции для админа, «добавить»
    local header = vgui.Create("DPanel", page)
    header:Dock(TOP)
    header:SetTall(S(52))
    header:DockMargin(0, 0, 0, S(10))
    header.Paint = function(self, w, h)
        PR_UI.Text(def.title, "title", 0, h / 2, C.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        if def.byFraction and not isAdmin then
            PR_UI.Text("Товары группировки " .. page.faction, "small", S(220), h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    if isAdmin then
        local add = PR_UI.Button(header, "+ Добавить товар", function()
            PR_Shop.OpenEditor(kind, nil, {Faction = page.faction, Category = page.category})
        end, {height = 44, color = C.accentDark})
        add:Dock(RIGHT)
        add:SetWide(S(220))

        if def.byFraction then
            local combo = vgui.Create("DComboBox", header)
            combo:Dock(RIGHT)
            combo:DockMargin(0, S(6), S(10), S(6))
            combo:SetWide(S(160))
            combo:SetFont(PR_UI.Font("normal"))
            for _, f in ipairs(PR_FRACTIONS) do
                combo:AddChoice(f, f, f == page.faction)
            end
            combo.OnSelect = function(_, _, value)
                page.faction = value
                page.selectedKey = nil
                page:Refill()
            end
        end
    end

    -- Категории
    local cats = vgui.Create("DScrollPanel", page)
    cats:Dock(LEFT)
    cats:SetWide(S(250))
    cats:DockMargin(0, 0, S(10), 0)

    for _, cat in ipairs(def.categories) do
        local btn = PR_UI.Button(cats, function()
            local n = 0
            for _, it in ipairs(Entries(kind, page.faction)) do
                local e = it.entry
                if (not def.catField or e[def.catField] == cat.key) and (isAdmin or def.installed(e)) then n = n + 1 end
            end
            return cat.name .. "  (" .. n .. ")"
        end, function()
            page.category = cat.key
            page.selectedKey = nil
            page:Refill()
        end, {alignLeft = true, height = 46, selected = function() return page.category == cat.key end})
        btn:Dock(TOP)
        btn:DockMargin(0, 0, 0, S(4))
    end

    -- Товары
    local items = vgui.Create("DScrollPanel", page)
    items:Dock(LEFT)
    items:SetWide(S(420))
    items:DockMargin(0, 0, S(10), 0)
    items.Paint = function(self, w, h) PR_UI.Box(0, 0, w, h, C.panel) end

    -- Карточка
    local details = vgui.Create("DPanel", page)
    details:Dock(FILL)
    details.Paint = function(self, w, h) PR_UI.Box(0, 0, w, h, C.panel) end

    function page:Refill()
        if not IsValid(items) then return end
        items:Clear()

        local list = {}
        for _, it in ipairs(Entries(kind, self.faction)) do
            local e = it.entry
            local inCat = not def.catField or e[def.catField] == self.category
            if inCat and (isAdmin or def.installed(e)) then table.insert(list, it) end
        end
        table.sort(list, function(a, b) return def.sort(a.entry, b.entry) end)

        if #list == 0 then
            local empty = vgui.Create("DLabel", items)
            empty:Dock(TOP)
            empty:DockMargin(S(14), S(14), S(14), 0)
            empty:SetFont(PR_UI.Font("normal"))
            empty:SetTextColor(C.muted)
            empty:SetText("Здесь пока пусто")
            empty:SetTall(S(30))
        end

        local selected
        for _, it in ipairs(list) do
            local e = it.entry
            local key = e[def.keyField]
            if key == self.selectedKey then selected = it end

            local row = vgui.Create("DButton", items)
            row:Dock(TOP)
            row:SetTall(S(58))
            row:DockMargin(S(6), S(6), S(6), 0)
            row:SetText("")
            row.Paint = function(btn, w, h)
                local isSel = page.selectedKey == key
                PR_UI.Box(0, 0, w, h, isSel and C.hover or (btn:IsHovered() and C.panel2 or C.bg))
                if isSel then PR_UI.Box(0, 0, S(4), h, C.accent) end

                local text, color = def.status(e, page.faction)
                local name = ItemName(kind, e)
                if not def.installed(e) then
                    text, color = "не установлено", C.bad
                end

                local x = S(14)
                if kind == "weapon" and tonumber(e.Tier) then
                    PR_UI.Text("T" .. e.Tier, "small", x, h / 2, C.gold, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    x = x + S(34)
                end
                PR_UI.Text(name, "normal", x, S(8), C.text)
                PR_UI.Text(text, "small", x, h - S(8), color, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
            end
            row.DoClick = function()
                surface.PlaySound("ui/buttonclick.wav")
                page.selectedKey = key
                page:ShowDetails(it)
            end
        end

        if not selected and list[1] then
            selected = list[1]
            self.selectedKey = selected.entry[def.keyField]
        end
        self:ShowDetails(selected)
    end

    function page:ShowDetails(it)
        if not IsValid(details) then return end
        details:Clear()
        if not it then return end

        PR_Shop.BuildDetails(details, kind, it.entry, it.index, self)
    end

    page:Refill()
    return page
end

----------------------------------------------------------------------------------------------------
-- Карточка товара
----------------------------------------------------------------------------------------------------

local function StatLine(parent, label, value, color)
    local line = vgui.Create("DPanel", parent)
    line:Dock(TOP)
    line:SetTall(S(28))
    line.Paint = function(self, w, h)
        PR_UI.Text(label, "normal", 0, h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        PR_UI.Text(isfunction(value) and value() or tostring(value), "normal", w, h / 2, color or C.text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end
    return line
end

local function ActionButton(parent, text, onClick, opts)
    local btn = PR_UI.Button(parent, text, onClick, opts)
    btn:Dock(TOP)
    btn:DockMargin(0, S(6), 0, 0)
    return btn
end

-- Названия оружия, после которых открывается этот ствол
local function UnlockNames(e, frac)
    local need = istable(e.NeedToUnlock) and e.NeedToUnlock or {}
    local names = {}

    for _, class in ipairs(need) do
        if class ~= "" then
            local found
            for _, other in ipairs((PR_WS_List or {})[frac] or {}) do
                if other.ClassName == class then found = ItemName("weapon", other) end
            end
            table.insert(names, found or class)
        end
    end

    return table.concat(names, " или ")
end

function PR_Shop.BuildDetails(panel, kind, e, index, page)
    local def = KINDS[kind]
    local frac = page.faction
    local isAdmin = PR_IsAdmin(Me())

    local inner = vgui.Create("DPanel", panel)
    inner:Dock(FILL)
    inner:DockMargin(S(16), S(16), S(16), S(16))
    inner.Paint = nil

    -- Справа колонка с информацией и кнопками, слева превью
    local info = vgui.Create("DScrollPanel", inner)
    info:Dock(RIGHT)
    info:SetWide(S(320))
    info:DockMargin(S(16), 0, 0, 0)

    local preview = ModelPreview(inner, def.model(e))
    preview:Dock(FILL)

    local title = vgui.Create("DLabel", info)
    title:Dock(TOP)
    title:SetTall(S(40))
    title:SetFont(PR_UI.Font("big"))
    title:SetTextColor(C.text)
    title:SetText(ItemName(kind, e))

    local status = vgui.Create("DPanel", info)
    status:Dock(TOP)
    status:SetTall(S(28))
    status:DockMargin(0, 0, 0, S(10))
    status.Paint = function(self, w, h)
        local text, color = def.status(e, frac)
        if not def.installed(e) then text, color = "не установлено на сервере", C.bad end
        PR_UI.Text(text, "normal", 0, h / 2, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    if kind == "weapon" then
        local w = weapons.GetStored(e.ClassName) or {}
        local primary = istable(w.Primary) and w.Primary or {}
        local rpm = w.FireDelay and math.Round(60 / w.FireDelay) or w.RPM

        StatLine(info, "Тип", CategoryName(WEAPON_TYPES, e.Type))
        StatLine(info, "Тир", e.Tier or "-")
        StatLine(info, "Калибр", primary.Ammo or w.Ammo or "-")
        StatLine(info, "Урон", w.Damage or w.DamageMax or "-")
        StatLine(info, "Скорострельность", rpm and (rpm .. " выстр./мин") or "-")
        StatLine(info, "Магазин", primary.ClipSize or "-")
        StatLine(info, "Цена", PR_UI.Money(e.Price))
        StatLine(info, "Опыт", function()
            return (tonumber(e.Exp) or 0) .. " (у тебя " .. Me():GetNWInt("PR_weapon_exp_" .. frac) .. ")"
        end)

        local unlock = UnlockNames(e, frac)
        if unlock ~= "" then
            local need = vgui.Create("DLabel", info)
            need:Dock(TOP)
            need:SetTall(S(46))
            need:SetWrap(true)
            need:SetFont(PR_UI.Font("small"))
            need:SetTextColor(PR_IsWeaponUnlocked(e, PR_PurchasedWeapons) and C.muted or C.bad)
            need:SetText("Открывается после: " .. unlock)
        end

        if Owned(PR_PurchasedWeapons, e.ClassName) then
            ActionButton(info, "Взять", function() BuyWeapon(e) end, {color = C.accentDark})
            ActionButton(info, "Основное при спавне", function() SetPreset(e, "Primary") end)
            ActionButton(info, "Второе при спавне", function() SetPreset(e, "Secondary") end)
        else
            ActionButton(info, "Купить", function() BuyWeapon(e) end, {
                color = C.accentDark,
                disabled = function()
                    return not def.installed(e) or not PR_IsWeaponUnlocked(e, PR_PurchasedWeapons)
                        or MyMoney() < (tonumber(e.Price) or 0)
                        or Me():GetNWInt("PR_weapon_exp_" .. frac) < (tonumber(e.Exp) or 0)
                end
            })
        end

    elseif kind == "equip" then
        StatLine(info, "Категория", CategoryName(EQUIP_CATEGORIES, e.Tier))
        StatLine(info, "Цена", PR_UI.Money(e.Price))
        ActionButton(info, "Купить", function() BuyEquipment(e) end, {
            color = C.accentDark,
            disabled = function() return not def.installed(e) or MyMoney() < (tonumber(e.Price) or 0) end
        })

    elseif kind == "vehicle" then
        StatLine(info, "Тип", CategoryName(VEHICLE_TYPES, e.Type))
        StatLine(info, "Цена", PR_UI.Money(e.Price))
        ActionButton(info, "Вызвать", function() CallVehicle(e) end, {
            color = C.accentDark,
            disabled = function() return not def.installed(e) or MyMoney() < (tonumber(e.Price) or 0) end
        })

    elseif kind == "cloth" then
        local level = tonumber(e.Level) or 0
        StatLine(info, "Нужен уровень", function() return level .. " (у тебя " .. Me():GetNWInt("PR_level") .. ")" end)
        StatLine(info, "Цена", tonumber(e.Price) and tonumber(e.Price) > 0 and PR_UI.Money(e.Price) or "Бесплатно")

        -- Бодигруппы: ползунки меняют превью и уходят на сервер при покупке/надевании
        local bodygroups = {}
        local mp = preview.Model
        if IsValid(mp) and IsValid(mp.Entity) then
            for _, bg in ipairs(mp.Entity:GetBodyGroups()) do
                if #bg.submodels > 1 then
                    local slider = vgui.Create("DNumSlider", info)
                    slider:Dock(TOP)
                    slider:SetTall(S(30))
                    slider:SetText(bg.name)
                    slider:SetMin(0)
                    slider:SetMax(#bg.submodels - 1)
                    slider:SetDecimals(0)
                    slider:SetValue(0)
                    slider.Label:SetTextColor(C.muted)
                    slider.OnValueChanged = function(_, value)
                        value = math.Round(value)
                        bodygroups[bg.id] = value
                        if IsValid(mp.Entity) then mp.Entity:SetBodygroup(bg.id, value) end
                    end
                end
            end
        end

        local owned = Owned(PR_PurchasedModels, e.Model)
        ActionButton(info, owned and "Надеть" or "Купить и надеть", function() WearCloth(e, bodygroups) end, {
            color = C.accentDark,
            disabled = function()
                if not def.installed(e) or Me():GetNWInt("PR_level") < level then return true end
                return not Owned(PR_PurchasedModels, e.Model) and MyMoney() < (tonumber(e.Price) or 0)
            end
        })
    end

    if isAdmin then
        local adminLabel = vgui.Create("DLabel", info)
        adminLabel:Dock(TOP)
        adminLabel:DockMargin(0, S(18), 0, 0)
        adminLabel:SetTall(S(22))
        adminLabel:SetFont(PR_UI.Font("small"))
        adminLabel:SetTextColor(C.muted)
        adminLabel:SetText("Админ: " .. (e[def.keyField] or "?"))

        ActionButton(info, "Изменить", function()
            PR_Shop.OpenEditor(kind, {entry = e, index = index, faction = frac})
        end)
        ActionButton(info, "Удалить", function()
            Derma_Query("Удалить «" .. ItemName(kind, e) .. "» из магазина?", "Магазин", "Удалить", function()
                PR_Shop.SaveEdit(kind, {entry = e, index = index, faction = frac}, nil)
            end, "Отмена")
        end, {hoverColor = C.accentDark})
    end
end

----------------------------------------------------------------------------------------------------
-- Редактор товаров (админ)
----------------------------------------------------------------------------------------------------

-- Поля редактора: {ключ, подпись, тип (text | number | combo), варианты}
local function FractionChoices()
    local out = {}
    for _, f in ipairs(PR_FRACTIONS) do table.insert(out, {f, f}) end
    return out
end

local function CategoryChoices(list)
    local out = {}
    for _, c in ipairs(list) do table.insert(out, {c.key, c.name}) end
    return out
end

local EDITOR_FIELDS = {
    weapon = {
        {"Faction", "Группировка", "combo", FractionChoices},
        {"Type", "Тип", "combo", function() return CategoryChoices(WEAPON_TYPES) end},
        {"Name", "Название", "text"},
        {"ClassName", "Класс оружия", "text"},
        {"Tier", "Тир", "number"},
        {"Price", "Цена", "number"},
        {"Exp", "Опыт оружия", "number"},
        {"Unlock", "Открывается после", "combo", nil}
    },
    equip = {
        {"Tier", "Категория", "combo", function() return CategoryChoices(EQUIP_CATEGORIES) end},
        {"Name", "Название", "text"},
        {"ClassName", "Класс (оружие или сущность)", "text"},
        {"Price", "Цена", "number"}
    },
    vehicle = {
        {"Faction", "Группировка", "combo", FractionChoices},
        {"Type", "Тип", "combo", function() return CategoryChoices(VEHICLE_TYPES) end},
        {"Name", "Название", "text"},
        {"ClassName", "Класс техники", "text"},
        {"Price", "Цена", "number"},
        {"Mod", "Как спавнить", "combo", function() return {{"simfphys", "simfphys"}, {"no_simfphys", "обычная сущность (LFS, WAC, LVS)"}} end}
    },
    cloth = {
        {"Faction", "Группировка", "combo", FractionChoices},
        {"Model", "Модель игрока", "text"},
        {"Price", "Цена", "number"},
        {"Level", "Нужный уровень", "number"}
    }
}

-- Варианты «открывается после» — оружие той же группировки
local function UnlockChoices(frac, exceptClass)
    local out = {{"", "— сразу открыто —"}}
    for _, w in ipairs((PR_WS_List or {})[frac] or {}) do
        if w.ClassName ~= exceptClass then
            table.insert(out, {w.ClassName, ItemName("weapon", w) .. " (" .. w.ClassName .. ")"})
        end
    end
    return out
end

-- edit: {entry, index, faction} для правки или nil для нового; preset: начальные значения нового товара
function PR_Shop.OpenEditor(kind, edit, preset)
    if not PR_IsAdmin(Me()) then return end

    local def = KINDS[kind]
    local src = edit and table.Copy(edit.entry) or {}
    preset = preset or {}

    local values = {
        Faction = edit and edit.faction or preset.Faction or DefaultFraction(),
        Name = src.Name or preset.Name or "",
        ClassName = src.ClassName or preset.ClassName or "",
        Model = src.Model or preset.Model or "",
        Type = src.Type or preset.Type or (kind ~= "equip" and preset.Category) or nil,
        Tier = src.Tier or preset.Tier or (kind == "equip" and preset.Category) or (kind == "weapon" and 1) or nil,
        Price = src.Price or 0,
        Exp = src.Exp or 0,
        Level = src.Level or 1,
        Mod = src.Mod or "simfphys",
        Unlock = istable(src.NeedToUnlock) and src.NeedToUnlock[1] or ""
    }

    local frame, body = PR_UI.Popup((edit and "Изменить: " or "Новый товар: ") .. def.title, 720, 640)
    local controls = {}

    for _, f in ipairs(EDITOR_FIELDS[kind]) do
        local key, label, ftype, choices = f[1], f[2], f[3], f[4]

        local row = vgui.Create("DPanel", body)
        row:Dock(TOP)
        row:SetTall(S(44))
        row:DockMargin(0, 0, 0, S(6))
        row.Paint = function(self, w, h)
            PR_UI.Text(label, "normal", 0, h / 2, C.muted, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        local control
        if ftype == "combo" then
            control = vgui.Create("DComboBox", row)
            local opts = key == "Unlock" and UnlockChoices(values.Faction, values.ClassName) or choices()
            for _, o in ipairs(opts) do
                control:AddChoice(o[2], o[1], tostring(values[key]) == tostring(o[1]))
            end
            if not control:GetSelected() and opts[1] then control:ChooseOptionID(1) end
        else
            control = vgui.Create("DTextEntry", row)
            control:SetValue(tostring(values[key] or ""))
            if ftype == "number" then control:SetNumeric(true) end
        end

        control:SetFont(PR_UI.Font("normal"))
        control:Dock(RIGHT)
        control:SetWide(S(400))
        controls[key] = {control = control, type = ftype}
    end

    local function Read(key)
        local c = controls[key]
        if not c then return nil end
        if c.type == "combo" then
            local _, data = c.control:GetSelected()
            return data
        end
        local text = string.Trim(c.control:GetValue())
        return c.type == "number" and (tonumber(text) or 0) or text
    end

    local save = PR_UI.Button(body, "Сохранить", function()
        local entry = src
        local target = def.byFraction and Read("Faction") or nil

        if kind == "weapon" then
            entry.Type = Read("Type")
            entry.Name = Read("Name")
            entry.ClassName = Read("ClassName")
            entry.Tier = math.max(math.floor(Read("Tier")), 1)
            entry.Price = math.max(math.floor(Read("Price")), 0)
            entry.Exp = math.max(math.floor(Read("Exp")), 0)
            entry.NeedToUnlock = {Read("Unlock") or ""}
        elseif kind == "equip" then
            entry.Tier = Read("Tier")
            entry.Name = Read("Name")
            entry.ClassName = Read("ClassName")
            entry.Price = math.max(math.floor(Read("Price")), 0)
            entry.Type = PR_WeaponExists(entry.ClassName) and "weapon" or "entity"
        elseif kind == "vehicle" then
            entry.Type = Read("Type")
            entry.Name = Read("Name")
            entry.ClassName = Read("ClassName")
            entry.Price = math.max(math.floor(Read("Price")), 0)
            entry.Mod = Read("Mod")
        elseif kind == "cloth" then
            entry.Model = Read("Model")
            entry.Price = math.max(math.floor(Read("Price")), 0)
            entry.Level = math.max(math.floor(Read("Level")), 0)
        end

        local key = entry[def.keyField]
        if not isstring(key) or key == "" then
            PR_UI.Notify("Укажи " .. (kind == "cloth" and "модель" or "класс"), true)
            return
        end
        if kind ~= "cloth" and (not isstring(entry.Name) or entry.Name == "") then
            PR_UI.Notify("Укажи название", true)
            return
        end
        if not def.installed(entry) then
            PR_UI.Notify("Внимание: «" .. key .. "» не найден среди установленного, игроки его не увидят", true)
        end

        PR_Shop.SaveEdit(kind, edit, entry, target)
        frame:Remove()
    end, {color = C.accentDark})
    save:Dock(BOTTOM)
end

-- Записать правку в копию списка и отправить на сервер целиком.
-- edit — что меняем (nil для нового), entry — новый вид (nil = удалить), target — группировка.
function PR_Shop.SaveEdit(kind, edit, entry, target)
    local def = KINDS[kind]
    local list = table.Copy(_G[def.global] or {})

    local function Bucket(frac)
        if not def.byFraction then return list end
        list[frac] = list[frac] or {}
        return list[frac]
    end

    local position
    if edit then
        local from = Bucket(edit.faction)
        if from[edit.index] then
            table.remove(from, edit.index)
            position = edit.index
        end
    end

    if entry then
        local to = Bucket(target or (edit and edit.faction))
        if edit and (not def.byFraction or target == edit.faction) and position then
            table.insert(to, math.min(position, #to + 1), entry)
        else
            table.insert(to, entry)
        end
    end

    net.Start(def.save)
        net.WriteTable(list)
    net.SendToServer()

    PR_UI.Notify(entry and "Сохранено" or "Удалено")
end

-- Пункты «Add to drop» в спавн-меню (cl_util.lua) открывают редактор с заполненными полями
function PR_WS_Create(wtype, frac, name, class)
    PR_Shop.OpenEditor("weapon", nil, {Category = wtype, Faction = frac, Name = name, ClassName = class})
end

function PR_Equip_Create(tier, name, class)
    PR_Shop.OpenEditor("equip", nil, {Category = tier, Name = name, ClassName = class})
end
