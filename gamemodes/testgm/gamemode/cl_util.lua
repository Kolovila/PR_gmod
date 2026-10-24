-- Клиентские хелперы режима: уведомления, кнопки, проверка зоны покупки, пункты в спавн-меню.

-- Спросить сервер, стоит ли игрок в зоне покупки. callback(bool) вызовется, когда придёт ответ.
-- Раньше ответ ждали фиксированные 0.1 с, и при пинге выше 100 мс покупка не проходила.
local buyBoxCallbacks = {}

function PR_CheckBuyBox(typeBuy, callback)
    table.insert(buyBoxCallbacks, callback)

    net.Start("IsPlayerInBuyBox")
        net.WriteString(typeBuy)
    net.SendToServer()
end

net.Receive("SendIsPlayerInBuyBox", function()
    local isInBox = net.ReadBool()
    local callback = table.remove(buyBoxCallbacks, 1)

    if callback then callback(isInBox) end
end)

function PR_CreateErrorNotice(errorText)
    if not timer.Exists("OshibkaNovichka") then

        local txtWidth, txtHeight = surface.GetTextSize( errorText )

        local NoEntryError = vgui.Create("DLabel")
        NoEntryError:SetSize(txtWidth*2.1,txtHeight+40)
        NoEntryError:SetPos(ScrW()/2 - NoEntryError:GetWide()/2,ScrH()/2 - NoEntryError:GetTall()/2)
        NoEntryError:SetText("")

        NoEntryError.Paint = function()
            draw.RoundedBox(0, 0, 0, NoEntryError:GetWide(), NoEntryError:GetTall(), Color(0,0,0,timer.TimeLeft("OshibkaNovichka")*200))

            draw.DrawText(errorText, "panel_INFO_font", NoEntryError:GetWide()/2, txtHeight/2, Color(255,255,255,timer.TimeLeft("OshibkaNovichka")*200), 1)

            draw.RoundedBox(0, 0, 0, NoEntryError:GetWide(), 1, Color(255,255,255,timer.TimeLeft("OshibkaNovichka")*200)) -- верхушка

            draw.RoundedBox(0, 0, 0, 1, NoEntryError:GetTall(), Color(255,255,255,timer.TimeLeft("OshibkaNovichka")*200)) -- левушка

            draw.RoundedBox(0, NoEntryError:GetWide() - 1, 0, 1, NoEntryError:GetTall(), Color(255,255,255,timer.TimeLeft("OshibkaNovichka")*200)) -- правушка

            draw.RoundedBox(0, 0, NoEntryError:GetTall() - 1, NoEntryError:GetWide(), 1, Color(255,255,255,timer.TimeLeft("OshibkaNovichka")*200)) -- низушка
        end

        timer.Create( "OshibkaNovichka", 2, 1, function() NoEntryError:Remove() end)
    end
end

function PR_CreateWriteMenu(MainFunc, title)
    title = title or ""

    local BackGround = vgui.Create ("DFrame")
		BackGround:SetSize(200,70)
		BackGround:SetPos((ScrW()/2)-BackGround:GetWide(),(ScrH()/2)-BackGround:GetTall())
		BackGround:SetTitle(title)
		BackGround:SetVisible(true)
		BackGround:SetDraggable(true)
		BackGround:ShowCloseButton(true)
		BackGround:MakePopup()
		BackGround.Paint = function ()
		    draw.RoundedBox(4,0,0,BackGround:GetWide(), BackGround:GetTall(), Color(200,0,0,200))
			draw.RoundedBox(4,0,0,BackGround:GetWide()-4, 21, Color(50,50,50,200))
		end
		
		local TextEntry = vgui.Create ("DTextEntry", BackGround)
		TextEntry:SetPos(20,30)
		TextEntry:SetTall(20)
		TextEntry:SetWide(160)
		TextEntry:SetEnterAllowed(true)
		TextEntry.OnEnter = function()
        MainFunc(TextEntry:GetValue())
			BackGround:Remove()
		end
end

function PR_CreateNewButton(butt, text, w, h, x, y, icon, parent, colorBackGround, colorText, align, textPosX, textPosY, font)
    local butt = vgui.Create("DButton", parent)

    local textWidth, textHeight = surface.GetTextSize( text )

    local colorBackGround = colorBackGround or Color(180,180,180,255)

    local colorText = colorText or Color(0,0,0,255)

    local align = align or TEXT_ALIGN_RIGHT

    local font = font or "DermaDefaultBold"

    butt:SetText("")
    butt:SetSize(w,h)
    butt:SetPos(x,y)

    local textPosX = textPosX or butt:GetWide() - 5

    local textPosY = textPosY or butt:GetTall()/2 - textHeight / 1.5

    butt.Paint = function()
        draw.RoundedBox(0, 0, 0, butt:GetWide(), butt:GetTall(), colorBackGround)

        --draw.RoundedBox( number cornerRadius, number x, number y, number width, number height, table color )
        draw.RoundedBox(0, 0, 0, butt:GetWide(), 1, Color(255,255,255,255)) -- верхушка

        draw.RoundedBox(0, 0, 0, 1, butt:GetTall(), Color(255,255,255,255)) -- левушка

        draw.RoundedBox(0, butt:GetWide() - 1, 0, 1, butt:GetTall(), Color(255,255,255,255)) -- правушка

        draw.RoundedBox(0, 0, butt:GetTall() - 1, butt:GetWide(), 1, Color(255,255,255,255)) -- низушка

        draw.SimpleText(text, font, textPosX, textPosY, colorText, align)
    end

    if icon != "" then
        local img = vgui.Create("DImage", butt)
        img:SetSize(32, 32)
        img:SetPos(2, butt:GetTall()/2 - img:GetTall() / 2)
        
        -- Set material relative to "garrysmod/materials/"
        img:SetImage("test_gm_mat/icons/" .. icon)
    end

    return butt
end

function PR_GetIconForShop(class)
    if file.Exists('materials/entities/' .. class .. '.png', 'GAME') then
        return 'entities/' .. class .. '.png'
    end

    if file.Exists('materials/vgui/entities/' .. class .. '.vtf', 'GAME') then
        return 'vgui/entities/' .. class
    end
end

local creator_icon = "icon16/wand.png"
local copy_icon = "icon16/page_copy.png"

spawnmenu.AddContentType( "entity", function( container, obj )

   if ( !obj.material ) then return end
   if ( !obj.nicename ) then return end
   if ( !obj.spawnname ) then return end

   local icon = vgui.Create( "ContentIcon", container )
   icon:SetContentType( "entity" )
   icon:SetSpawnName( obj.spawnname )
   icon:SetName( obj.nicename )
   icon:SetMaterial( obj.material )
   icon:SetAdminOnly( obj.admin )
   icon:SetColor( Color( 205, 92, 92, 255 ) )
   icon.DoClick = function()
      RunConsoleCommand( "gm_spawnsent", obj.spawnname )
      surface.PlaySound( "ui/buttonclickrelease.wav" )
   end
   icon.OpenMenu = function( icon )

      local tiers = {"grenade_lethal", "grenade_unlethal", "explosion", "melee_weapon", "stims", "first_aid", "stations_device", "binoculars", "rocket_launchers", "signal_device", "armor_and_else"}
      local menu = DermaMenu()
            menu:AddOption( "Copy to Clipboard", function() SetClipboardText( obj.spawnname ) end ):SetImage( copy_icon )
            menu:AddOption( "Spawn Using Toolgun", function() RunConsoleCommand( "gmod_tool", "creator" ) RunConsoleCommand( "creator_type", "0" ) RunConsoleCommand( "creator_name", obj.spawnname ) end ):SetImage( creator_icon )

            local submenu = menu:AddSubMenu( "Add to drop", function() end )
            for k,tier in pairs(tiers) do
               submenu:AddOption( tier, function() PR_Equip_Create(tier, obj.nicename, obj.spawnname) end ):SetImage("test_gm_mat/q_menu_equip/" .. string.lower(tier) .. ".png")
               submenu:AddSpacer()
            end
      menu:Open()

   end

   if ( IsValid( container ) ) then
      container:Add( icon )
   end

   return icon

end )

spawnmenu.AddContentType( "weapon", function( container, obj )

   if ( !obj.material ) then return end
   if ( !obj.nicename ) then return end
   if ( !obj.spawnname ) then return end

   local icon = vgui.Create( "ContentIcon", container )
   icon:SetContentType( "weapon" )
   icon:SetSpawnName( obj.spawnname )
   icon:SetName( obj.nicename )
   icon:SetMaterial( obj.material )
   icon:SetAdminOnly( obj.admin )
   icon:SetColor( Color( 135, 206, 250, 255 ) )
   icon.DoClick = function()

      RunConsoleCommand( "gm_giveswep", obj.spawnname )
      surface.PlaySound( "ui/buttonclickrelease.wav" )

   end

   icon.DoMiddleClick = function()

      RunConsoleCommand( "gm_spawnswep", obj.spawnname )
      surface.PlaySound( "ui/buttonclickrelease.wav" )

   end

   icon.OpenMenu = function( icon )

      local menu = DermaMenu()
            menu:AddOption( "Copy to Clipboard", function() SetClipboardText( obj.spawnname ) end ):SetImage( copy_icon )
            menu:AddOption( "Spawn Using Toolgun", function() RunConsoleCommand( "gmod_tool", "creator" ) RunConsoleCommand( "creator_type", "3" ) RunConsoleCommand( "creator_name", obj.spawnname ) end ):SetImage( creator_icon )

            local DROP_Type_List = {"pistol","shotgun","smg","ar","sniper","machinegun"}
            local Fractions = {"SSNK","USA","GBC","WN"}
            local submenu = menu:AddSubMenu( "Add to drop", function() end )
            for numweap, weap in pairs(DROP_Type_List) do
               local weap_menu = submenu:AddSubMenu( weap, function() end )
               submenu:AddSpacer()

               for numfr, frac in pairs(Fractions) do
                  weap_menu:AddOption( frac, function() PR_WS_Create(weap, frac, obj.nicename, obj.spawnname) end ):SetImage("test_gm_mat/q_menu_flags/" .. string.lower(frac) .. ".png")
                  weap_menu:AddSpacer()
               end
            end
      menu:Open()

   end

   if ( IsValid( container ) ) then
      container:Add( icon )
   end

   return icon

end )

-- Подсказка в чат при заходе на сервер
hook.Add("InitPostEntity", "PR_ChatHint", function()
    chat.AddText(Color(255, 0, 0), "Подсказка:\nКоманда для открытия меню: open_main_menu (bind KEY open_main_menu) либо кнопка F4\nКоманда для проверки магазина: PR_Check_Ammo (bind KEY PR_Check_Ammo)")
end)
