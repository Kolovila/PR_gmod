include("shared.lua")

function ENT:Draw()
  	self:DrawModel()
end

function idkMenuOpen()
	local ply = LocalPlayer()

	local ent = net.ReadEntity()
	if not IsValid(ent) then return end

	local W, H 	= ScrW(), ScrH()
	local idkMenu = vgui.Create( "DFrame" )
	idkMenu:SetPos( 0, 0 )
	idkMenu:SetSize( W, H )
	idkMenu:SetTitle("")
	idkMenu:SetDraggable( true )
	idkMenu:ShowCloseButton( true )
	idkMenu:MakePopup()
	idkMenu.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 150 )
		surface.DrawTexturedRect( 0, 0, W, H )
	end
	
	local takeMoney = vgui.Create( "DButton", idkMenu)
	takeMoney:SetPos( W*0.45, H*0.9 )
	takeMoney:SetText( "" )
	takeMoney:SetSize( 215, 70 )
	takeMoney.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, takeMoney:GetWide(),takeMoney:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "забрать деньги", "DermaLarge", 9, 15, Color(255,255,255) )
	end
	takeMoney.DoClick = function()
		net.Start("PR_PointTakeMoney")
			net.WriteEntity(ent)
		net.SendToServer()
	end

	-- Кнопка улучшения: kind = "monitor" | "computer"
	local function PriceText(kind)
		local price = ent:GetUpgradePrice(kind)
		return price and (price .. "$") or "MAX"
	end

	local function BuyUpgrade(kind)
		if ply:GetNWBool("PR_leader_" .. ply:GetNWString("PR_fraction")) != true then PR_CreateErrorNotice("Ты не лидер фракции") return end

		local price = ent:GetUpgradePrice(kind)
		if not price then return end

		if ply:GetNWInt("PR_money") < price then
			PR_CreateErrorNotice("У тебя не хватает щекелей")
			return
		end

		net.Start("UpgradePoint")
			net.WriteEntity(ent)
			net.WriteString(kind)
		net.SendToServer()
	end
	
	local upgradeMonik = vgui.Create( "DButton", idkMenu)
	upgradeMonik:SetPos( W*0.2, H*0.3 )
	upgradeMonik:SetText( "" )
	upgradeMonik:SetSize( 265, 70 )
	upgradeMonik.Paint = function()
		if not IsValid(ent) then return end
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, upgradeMonik:GetWide(),upgradeMonik:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "улучшить монитор", "DermaLarge", 14, 5, Color(255,255,255) )
		draw.SimpleText( "цена:".. PriceText("monitor"), "DermaLarge", 50, 35, Color(255,255,255) )
	end
	upgradeMonik.DoClick = function()
		BuyUpgrade("monitor")
	end
	
	local upgradeComp = vgui.Create( "DButton", idkMenu)
	upgradeComp:SetPos( W*0.2, H*0.7 )
	upgradeComp:SetText( "" )
	upgradeComp:SetSize( 250, 70 )
	upgradeComp.Paint = function()
		if not IsValid(ent) then return end
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, upgradeComp:GetWide(),upgradeComp:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "улучшить комп", "DermaLarge", 30, 5, Color(255,255,255) )
		draw.SimpleText( "цена:".. PriceText("computer"), "DermaLarge", 50, 35, Color(255,255,255) )
	end
	upgradeComp.DoClick = function()
		BuyUpgrade("computer")
	end
	
	local guardSpawn = vgui.Create( "DButton", idkMenu)
	guardSpawn:SetPos( W*0.5, H*0.3 )
	guardSpawn:SetText( "" )
	guardSpawn:SetSize( 285, 70 )
	guardSpawn.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, guardSpawn:GetWide(),guardSpawn:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "призвать защитника", "DermaLarge", 10, 5, Color(255,255,255) )
	end
	guardSpawn.DoClick = function()
		-- Выбор игрока: ключи из таблиц ENT.Guardian* (shared.lua)
		local type_key = ""
		local weap_key = ""
		local hp_index = 1

		local healthy_guard = 1
		local sign_guard = false

		local type_guard_price = 0
		local weap_guard_price = 0
		local sign_guard_price = 0

		if ent:GetGuardianCount() < ent.MaxGuardianCount then
			local BuyWindow = vgui.Create ("DFrame")
			BuyWindow:SetSize(800,700)
			BuyWindow:SetPos((ScrW()/2)-BuyWindow:GetWide()/2,(ScrH()/2)-BuyWindow:GetTall()/2)
			BuyWindow:SetTitle("")
			BuyWindow:SetVisible(true)
			BuyWindow:SetDraggable(true)
			BuyWindow:ShowCloseButton(true)
			BuyWindow:MakePopup()
			BuyWindow.Paint = function ()
				draw.RoundedBox(4,0,0,BuyWindow:GetWide(), BuyWindow:GetTall(), Color(80,80,80,255))
				draw.RoundedBox(4,0,0,BuyWindow:GetWide(), 21, Color(50,50,50,255))
			end

			local PR_GUARD_MENU = {}

			local type_guard_text = "тип челика"
			local weap_guard_text = "оружие челика"
			local healthy_guard_text = "живучесть челика"
			local sign_guard_text = "сигнал челика"

			local type_guard_btn =	vgui.Create("DButton", BuyWindow)
			type_guard_btn:SetText("")
			type_guard_btn:SetSize(285,50)
			type_guard_btn:SetPos(BuyWindow:GetWide()/2 - 285/2, 50)

			type_guard_btn.Paint = function()
				draw.RoundedBox(0, 0, 0, type_guard_btn:GetWide(), type_guard_btn:GetTall(), Color(50,50,50))
	
				--draw.RoundedBox( number cornerRadius, number x, number y, number width, number height, table color )
				draw.RoundedBox(0, 0, 0, type_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- верхушка
	
				draw.RoundedBox(0, 0, 0, 1, type_guard_btn:GetTall(), Color(255,255,255,255)) -- левушка
	
				draw.RoundedBox(0, type_guard_btn:GetWide() - 1, 0, 1, type_guard_btn:GetTall(), Color(255,255,255,255)) -- правушка
	
				draw.RoundedBox(0, 0, type_guard_btn:GetTall() - 1, type_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- низушка
	
				draw.SimpleText(type_guard_text, "DermaLarge", 285/2, 5, Color(255,255,255), 1)
			end
			
			type_guard_btn.DoClick = function()
				local types = ent.GuardianTypes

                local DScrollPanel = vgui.Create( "DScrollPanel", BuyWindow )
                DScrollPanel:SetPos(type_guard_btn.x,type_guard_btn.y)
                DScrollPanel:SetSize(type_guard_btn:GetWide(),400)

                for k,v in pairs(types) do
                    local DButton = DScrollPanel:Add( "DButton" )
                    DButton:SetText("")
                    DButton:Dock(TOP)
                    DButton:SetSize(type_guard_btn:GetWide(), type_guard_btn:GetTall())
                    DButton:DockMargin( 0, 0, 0, 0 )

                    DButton.Paint = function()
                        surface.SetDrawColor(30,30,30,255)
                        surface.DrawRect(0,0, DScrollPanel:GetWide(), DScrollPanel:GetTall())

						draw.RoundedBox(0, 0, 0, DButton:GetWide(), 1, Color(255,255,255,255)) -- верхушка
			
						draw.RoundedBox(0, 0, 0, 1, DButton:GetTall(), Color(255,255,255,255)) -- левушка
			
						draw.RoundedBox(0, DButton:GetWide() - 1, 0, 1, DButton:GetTall(), Color(255,255,255,255)) -- правушка
			
						draw.RoundedBox(0, 0, DButton:GetTall() - 1, DButton:GetWide(), 1, Color(255,255,255,255)) -- низушка

                        draw.DrawText(k,"DermaDefaultBold", DScrollPanel:GetWide() / 2, 5, Color(255,255,255,255),1)
                        draw.DrawText("Цена: " .. v["Price"] .. "$","DermaDefaultBold", DScrollPanel:GetWide() / 2, 22, Color(255,255,255),1)
                    end

                    DButton.DoClick = function()
						type_key = k
						type_guard_text = k
						type_guard_price = v["Price"]

						weap_key = ""
						weap_guard_text = "оружие челика"
						weap_guard_price = 0

						if PR_GUARD_MENU.WeaponScrollPanel then PR_GUARD_MENU.WeaponScrollPanel:Remove() end

                        DScrollPanel:Remove()
                    end
                end
			end

			local weap_guard_btn =	vgui.Create("DButton", BuyWindow)
			weap_guard_btn:SetText("")
			weap_guard_btn:SetSize(285,50)
			weap_guard_btn:SetPos(BuyWindow:GetWide()/2 - 285/2, 200)

			weap_guard_btn.Paint = function()
				draw.RoundedBox(0, 0, 0, weap_guard_btn:GetWide(), weap_guard_btn:GetTall(), Color(50,50,50))
	
				--draw.RoundedBox( number cornerRadius, number x, number y, number width, number height, table color )
				draw.RoundedBox(0, 0, 0, weap_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- верхушка
	
				draw.RoundedBox(0, 0, 0, 1, weap_guard_btn:GetTall(), Color(255,255,255,255)) -- левушка
	
				draw.RoundedBox(0, weap_guard_btn:GetWide() - 1, 0, 1, weap_guard_btn:GetTall(), Color(255,255,255,255)) -- правушка
	
				draw.RoundedBox(0, 0, weap_guard_btn:GetTall() - 1, weap_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- низушка
	
				draw.SimpleText(weap_guard_text, "DermaLarge", 285/2, 5, Color(255,255,255), 1)
			end
			
			weap_guard_btn.DoClick = function()
				local gtype = ent.GuardianTypes[type_key]
				if not gtype then
					PR_CreateErrorNotice("Сначала выбери тип челика")
					return
				end

				local weapons_get = ent.GuardianWeapons[gtype.Weapons] or {}

                PR_GUARD_MENU.WeaponScrollPanel = vgui.Create( "DScrollPanel", BuyWindow )
                PR_GUARD_MENU.WeaponScrollPanel:SetPos(weap_guard_btn.x,weap_guard_btn.y)
                PR_GUARD_MENU.WeaponScrollPanel:SetSize(weap_guard_btn:GetWide(),400)

                for k,v in pairs(weapons_get) do
                    local DButton = PR_GUARD_MENU.WeaponScrollPanel:Add( "DButton" )
                    DButton:SetText("")
                    DButton:Dock(TOP)
                    DButton:SetSize(weap_guard_btn:GetWide(), weap_guard_btn:GetTall())
                    DButton:DockMargin( 0, 0, 0, 0 )

                    DButton.Paint = function()
						surface.SetDrawColor(0,0,0)
                        surface.DrawRect(0,0, PR_GUARD_MENU.WeaponScrollPanel:GetWide(), PR_GUARD_MENU.WeaponScrollPanel:GetTall())

						draw.RoundedBox(0, 0, 0, DButton:GetWide(), 1, Color(255,255,255)) -- верхушка
			
						draw.RoundedBox(0, 0, 0, 1, DButton:GetTall(), Color(255,255,255)) -- левушка
			
						draw.RoundedBox(0, DButton:GetWide() - 1, 0, 1, DButton:GetTall(), Color(255,255,255)) -- правушка
			
						draw.RoundedBox(0, 0, DButton:GetTall() - 1, DButton:GetWide(), 1, Color(255,255,255)) -- низушка

                        draw.DrawText(k,"DermaDefaultBold", PR_GUARD_MENU.WeaponScrollPanel:GetWide() / 2, 5, Color(255,255,255),1)
                        draw.DrawText("Цена: " .. v["Price"] .. "$","DermaDefaultBold", PR_GUARD_MENU.WeaponScrollPanel:GetWide() / 2, 22, Color(255,255,255),1)
                    end

                    DButton.DoClick = function()
						weap_key = k
						weap_guard_text = k
						weap_guard_price = v["Price"]
                        PR_GUARD_MENU.WeaponScrollPanel:Remove()
                    end
                end
			end

			local healthy_guard_btn = vgui.Create("DButton", BuyWindow)
			healthy_guard_btn:SetText("")
			healthy_guard_btn:SetSize(285,50)
			healthy_guard_btn:SetPos(BuyWindow:GetWide()/2 - 350, 400)

			healthy_guard_btn.Paint = function()
				draw.RoundedBox(0, 0, 0, healthy_guard_btn:GetWide(), healthy_guard_btn:GetTall(), Color(50,50,50))
	
				--draw.RoundedBox( number cornerRadius, number x, number y, number width, number height, table color )
				draw.RoundedBox(0, 0, 0, healthy_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- верхушка
	
				draw.RoundedBox(0, 0, 0, 1, healthy_guard_btn:GetTall(), Color(255,255,255,255)) -- левушка
	
				draw.RoundedBox(0, healthy_guard_btn:GetWide() - 1, 0, 1, healthy_guard_btn:GetTall(), Color(255,255,255,255)) -- правушка
	
				draw.RoundedBox(0, 0, healthy_guard_btn:GetTall() - 1, healthy_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- низушка
	
				draw.SimpleText(healthy_guard_text, "DermaLarge", 285/2, 5, Color(255,255,255), 1)
			end
			
			healthy_guard_btn.DoClick = function()
				local hp_multiplayer_list = ent.GuardianHealthMul

                local DScrollPanel = vgui.Create( "DScrollPanel", BuyWindow )
                DScrollPanel:SetPos(healthy_guard_btn.x, healthy_guard_btn.y)
                DScrollPanel:SetSize(healthy_guard_btn:GetWide(),400)

                for k,v in pairs(hp_multiplayer_list) do
                    local DButton = DScrollPanel:Add( "DButton" )
                    DButton:SetText("")
                    DButton:Dock(TOP)
                    DButton:SetSize(healthy_guard_btn:GetWide(), healthy_guard_btn:GetTall())
                    DButton:DockMargin( 0, 0, 0, 0 )

                    DButton.Paint = function()
                        surface.SetDrawColor(30,30,30)
                        surface.DrawRect(0,0, DScrollPanel:GetWide(), DScrollPanel:GetTall())

						draw.RoundedBox(0, 0, 0, DButton:GetWide(), 1, Color(255,255,255)) -- верхушка
			
						draw.RoundedBox(0, 0, 0, 1, DButton:GetTall(), Color(255,255,255)) -- левушка
			
						draw.RoundedBox(0, DButton:GetWide() - 1, 0, 1, DButton:GetTall(), Color(255,255,255)) -- правушка
			
						draw.RoundedBox(0, 0, DButton:GetTall() - 1, DButton:GetWide(), 1, Color(255,255,255)) -- низушка

                        draw.DrawText("x" .. v,"DermaDefaultBold", DScrollPanel:GetWide() / 2, 5, Color(255,255,255),1)
                        draw.DrawText("Цена: " .. "x" .. v .. " от цены типа челика","DermaDefaultBold", DScrollPanel:GetWide() / 2, 22, Color(255,255,255),1)
                    end

                    DButton.DoClick = function()
						healthy_guard = v
						hp_index = k
						healthy_guard_text = "x" .. v
                        DScrollPanel:Remove()
                    end
                end
			end

			local signal_guard_btn = vgui.Create("DButton", BuyWindow)
			signal_guard_btn:SetText("")
			signal_guard_btn:SetSize(285,50)
			signal_guard_btn:SetPos(BuyWindow:GetWide()/2 + 50, 400)

			signal_guard_btn.Paint = function()
				draw.RoundedBox(0, 0, 0, signal_guard_btn:GetWide(), signal_guard_btn:GetTall(), Color(50,50,50))
	
				--draw.RoundedBox( number cornerRadius, number x, number y, number width, number height, table color )
				draw.RoundedBox(0, 0, 0, signal_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- верхушка
	
				draw.RoundedBox(0, 0, 0, 1, signal_guard_btn:GetTall(), Color(255,255,255,255)) -- левушка
	
				draw.RoundedBox(0, signal_guard_btn:GetWide() - 1, 0, 1, signal_guard_btn:GetTall(), Color(255,255,255,255)) -- правушка
	
				draw.RoundedBox(0, 0, signal_guard_btn:GetTall() - 1, signal_guard_btn:GetWide(), 1, Color(255,255,255,255)) -- низушка
	
				draw.SimpleText(sign_guard_text, "DermaLarge", 285/2, 5, Color(255,255,255), 1)
			end
			
			signal_guard_btn.DoClick = function()
				local sign_list = {
					["включить"] = {
						["Boolean"] = true,
						["Price"] = ent.GuardianSignalPrice
					},
					["выключить"] = {
						["Boolean"] = false,
						["Price"] = 0
					}
				}

                local DScrollPanel = vgui.Create( "DScrollPanel", BuyWindow )
                DScrollPanel:SetPos(signal_guard_btn.x, signal_guard_btn.y)
                DScrollPanel:SetSize(signal_guard_btn:GetWide(),400)

                for k,v in pairs(sign_list) do
                    local DButton = DScrollPanel:Add( "DButton" )
                    DButton:SetText("")
                    DButton:Dock(TOP)
                    DButton:SetSize(signal_guard_btn:GetWide(), signal_guard_btn:GetTall())
                    DButton:DockMargin( 0, 0, 0, 0 )

                    DButton.Paint = function()
                        surface.SetDrawColor(30,30,30)
                        surface.DrawRect(0,0, DScrollPanel:GetWide(), DScrollPanel:GetTall())

						draw.RoundedBox(0, 0, 0, DButton:GetWide(), 1, Color(255,255,255)) -- верхушка
			
						draw.RoundedBox(0, 0, 0, 1, DButton:GetTall(), Color(255,255,255)) -- левушка
			
						draw.RoundedBox(0, DButton:GetWide() - 1, 0, 1, DButton:GetTall(), Color(255,255,255)) -- правушка
			
						draw.RoundedBox(0, 0, DButton:GetTall() - 1, DButton:GetWide(), 1, Color(255,255,255)) -- низушка

                        draw.DrawText(k,"DermaDefaultBold", DScrollPanel:GetWide() / 2, 5, Color(255,255,255),1)
                        draw.DrawText("Цена: " .. v["Price"] .. "$","DermaDefaultBold", DScrollPanel:GetWide() / 2, 22, Color(255,255,255),1)
                    end

                    DButton.DoClick = function()
						sign_guard = v["Boolean"]
						sign_guard_text = k
						sign_guard_price = v["Price"]
                        DScrollPanel:Remove()
                    end
                end
			end

			local MoneyText = vgui.Create( "DLabel", BuyWindow )
			MoneyText:SetPos(BuyWindow:GetWide()/2 - 285/2, 500)
			MoneyText:SetText( "" )
			MoneyText:SetSize( 285, 50)
			MoneyText.Paint = function()
				surface.SetDrawColor(50,50,50,255)
				surface.DrawRect(0,0, MoneyText:GetWide(),MoneyText:GetTall())
				surface.SetDrawColor(200,220,220,255)

				draw.RoundedBox(0, 0, 0, MoneyText:GetWide(), 1, Color(255,255,255,255)) -- верхушка
	
				draw.RoundedBox(0, 0, 0, 1, MoneyText:GetTall(), Color(255,255,255,255)) -- левушка
	
				draw.RoundedBox(0, MoneyText:GetWide() - 1, 0, 1, MoneyText:GetTall(), Color(255,255,255,255)) -- правушка
	
				draw.RoundedBox(0, 0, MoneyText:GetTall() - 1, MoneyText:GetWide(), 1, Color(255,255,255,255)) -- низушка

				draw.SimpleText(math.floor(type_guard_price * healthy_guard) + weap_guard_price + sign_guard_price.. "$", "DermaLarge", MoneyText:GetWide()/2, 7, Color(255,255,255), 1)
			end

			local summon_guard = PR_CreateNewButton(butt, "призвать защитника", 285, 50, BuyWindow:GetWide()/2 - 285/2, 600, "", BuyWindow, Color(50,50,50), Color(255,255,255), 0, 10, 5, "DermaLarge")
			summon_guard.DoClick = function()
				if not IsValid(ent) then return end

				local price_guard = ent:GetGuardianPrice(type_key, weap_key, hp_index, sign_guard)
				if not price_guard then
					PR_CreateErrorNotice("Сначала выбери тип челика")
					return
				end

				if ent.MaxGuardianCount > ent:GetGuardianCount() then
					if ply:GetNWInt("PR_money") >= price_guard then
						net.Start("SpawnGuardianNPC")
							net.WriteEntity(ent)
							net.WriteString(type_key)
							net.WriteString(weap_key)
							net.WriteUInt(hp_index, 4)
							net.WriteBool(sign_guard)
						net.SendToServer()
					else
						PR_CreateErrorNotice("У тебя не хватает щекелей")
					end
				else
					PR_CreateErrorNotice("Защитников уже максимальное количество")
				end
			end
		else
			PR_CreateErrorNotice("Защитников уже максимальное количество")
		end
	end
	
	local escapefromkazino = vgui.Create( "DButton", idkMenu)
	escapefromkazino:SetPos( W - 100, H*0.0001 )
	escapefromkazino:SetText( "" )
	escapefromkazino:SetSize( 100, ScrH() )
	escapefromkazino.Paint = function()
		surface.SetDrawColor(120,0,0,150)
		surface.DrawRect(0,0, escapefromkazino:GetWide(),escapefromkazino:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "X", "DermaLarge", 45, ScrH()/2, Color(255,255,255) )
	end
	escapefromkazino.DoClick = function()
		idkMenu:Remove()
	end

	local InfoText = vgui.Create( "DLabel", idkMenu )
	InfoText:SetPos( W*0.5, H*0.582 )
	InfoText:SetText( "" )
	InfoText:SetSize( 500, 200 )
	InfoText.Paint = function()
		if not IsValid(ent) then return end
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, InfoText:GetWide(), InfoText:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText("Осталось: " .. math.max(math.Round(ent:GetNextIncome() - CurTime(), 0), 0) .. "с.", "DermaLarge", 35, 15, Color(255,255,255))
		draw.SimpleText("Приход: " .. ent:GetIncomeAmount() .. "$", "DermaLarge", 35, 55, Color(255,255,255))
		draw.SimpleText("Защитников: " .. ent:GetGuardianCount() .. "/" .. ent.MaxGuardianCount, "DermaLarge", 35, 100, Color(255,255,255))
		draw.SimpleText("Сейчас хранится: " .. ent:GetStoredMoney() .. "$", "DermaLarge", 35, 150, Color(255,255,255))
	end

	-- Закрыть меню, если игрок умер, точку убрали или её захватили
	-- Первую секунду не сверяем фракцию: сетевые переменные могут прийти позже, чем команда открыть меню
	local openedAt = CurTime()
	local frameThink = idkMenu.Think
	idkMenu.Think = function(self)
		frameThink(self)
		local lostPoint = CurTime() - openedAt > 1 and IsValid(ent) and ent:GetCaptureTeam() != ply:GetNWString("PR_fraction")
		if not ply:Alive() or not IsValid(ent) or lostPoint then
			idkMenu:Remove()
		end
	end
end

function ConfigAdminMenu()
	local ply = LocalPlayer()

	local ent = net.ReadEntity()
	if not IsValid(ent) then return end

	PR_Capture_Points_List = PR_Capture_Points_List or {}

	net.Start("GetPointsCfgs")
	net.SendToServer()

	local W, H 	= ScrW(), ScrH()
	local idkMenu = vgui.Create( "DFrame" )
	idkMenu:SetPos( W/2-500, H/2-250 )
	idkMenu:SetSize( 1000, 500 )
	idkMenu:SetTitle("")
	idkMenu:SetDraggable( true )
	idkMenu:ShowCloseButton( true )
	idkMenu:MakePopup()

	idkMenu.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 150 )
		surface.DrawTexturedRect( 0, 0, W, H )

		if not IsValid(ent) then return end
		local text = "Текущая точка: ".. ent:GetCurPoint() .. " (" .. ent:GetCaptureTeam() .. ")"

		surface.SetFont( "DermaLarge" )
		surface.SetTextPos( 100, 50 )

		for char = 1, #text do
			local col = HSVToColor( ( ( RealTime() * 100 ) - char * 15 ) % 360, 1, 1 )
			surface.SetTextColor( col.r, col.g, col.b )	  -- Providing 3 numbers to surface.SetTextColor rather 
		end
		surface.DrawText(text)	-- than a single color is faster
	end

	local ConfigsButton = vgui.Create("DButton", idkMenu)
	ConfigsButton:SetText("")
	ConfigsButton:SetPos(100,100)
	ConfigsButton:SetSize(225,40)

	ConfigsButton.Paint = function()
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawRect(0, 0, ConfigsButton:GetWide(), ConfigsButton:GetTall())

		draw.DrawText("Выбрать точку", "DermaLarge", 18, 5, Color(255,255,255,255), 0)
	end
	
	ConfigsButton.DoClick = function()
		net.Start("GetPointsCfgs")
		net.SendToServer()

		if PR_Capture_Points_List.Config != {} and PR_Capture_Points_List.Config != nil then
			local ConfigScroll = vgui.Create("DScrollPanel", idkMenu)
			ConfigScroll:SetPos(100, 140)
			ConfigScroll:SetSize(225,120)
			
			local CfgButton = ConfigScroll:Add( "DButton" )
			CfgButton:SetText("")
			CfgButton:Dock(TOP)
			CfgButton:DockMargin( 0, 0, 0, -2 )

			CfgButton.Paint = function()
				surface.SetDrawColor(30,30,30,255)
				surface.DrawRect(0,0, CfgButton:GetWide(), CfgButton:GetTall())

				draw.DrawText("Закрыть","DermaDefaultBold", CfgButton:GetWide() / 2, 2, Color(255,255,255,255),1)
			end

			CfgButton.DoClick = function()
				ConfigScroll:Remove()
			end
			
			local NewCfgButton = ConfigScroll:Add( "DButton" )
			NewCfgButton:SetText("")
			NewCfgButton:Dock(TOP)
			NewCfgButton:DockMargin( 0, 0, 0, -2 )

			NewCfgButton.Paint = function()
				surface.SetDrawColor(30,30,30,255)
				surface.DrawRect(0,0, NewCfgButton:GetWide(), NewCfgButton:GetTall())

				draw.DrawText("Новый","DermaDefaultBold", NewCfgButton:GetWide() / 2, 2, Color(255,255,255,255),1)
			end

			NewCfgButton.DoClick = function()
				local SaveWindow = vgui.Create("DFrame")
				SaveWindow:SetSize(300,200)
				SaveWindow:Center()
				SaveWindow:SetTitle("")
				SaveWindow:SetVisible(true)
				SaveWindow:SetDraggable(true)
				SaveWindow:ShowCloseButton(true)
				SaveWindow:MakePopup()
				SaveWindow.Paint = function ()
					draw.RoundedBox(4,0,0,SaveWindow:GetWide(), SaveWindow:GetTall(), Color(80,80,80,255))
					draw.RoundedBox(4,0,0,SaveWindow:GetWide(), 21, Color(50,50,50,255))

					draw.DrawText("Название?", "DermaDefaultBold", 150, 30, Color(255,255,255,255), 1)
				end

				local ConfigName = vgui.Create("DTextEntry", SaveWindow)
				ConfigName:SetPos(20,85)
				ConfigName:SetTall(20)
				ConfigName:SetWide(260)
				ConfigName:SetEnterAllowed(true)
				
				local SaveCfgButton = vgui.Create("DButton", SaveWindow)
				SaveCfgButton:SetPos(75,150)
				SaveCfgButton:SetSize(150,20)
				SaveCfgButton:SetText("")

				SaveCfgButton.Paint = function()
					surface.SetDrawColor(50,50,50,255)
					surface.DrawRect(0,0, SaveCfgButton:GetWide(), SaveCfgButton:GetTall())
							
					draw.DrawText("Сохранить","DermaDefaultBold", SaveCfgButton:GetWide() / 2, 2, Color(255,255,255,255),1)
				end

				SaveCfgButton.DoClick = function()
					net.Start("CreateNewCfgs")
						net.WriteString(ConfigName:GetValue())
						net.WriteEntity(ent)
					net.SendToServer()
					ConfigScroll:Remove()
					SaveWindow:Remove()
				end
			end

			for k,v in pairs(PR_Capture_Points_List.Config) do
				local CfgButton = ConfigScroll:Add( "DButton" )
				CfgButton:SetText("")
				CfgButton:Dock(TOP)
				CfgButton:DockMargin( 0, 0, 0, -2 )

				CfgButton.Paint = function()
					surface.SetDrawColor(30,30,30,255)
					surface.DrawRect(0,0, CfgButton:GetWide(), CfgButton:GetTall())

					draw.DrawText(k,"DermaDefaultBold", CfgButton:GetWide() / 2, 2, Color(255,255,255,255),1)
				end

				CfgButton.DoClick = function()
					net.Start("SetServerPointsCfgs")
						net.WriteString(k)
						net.WriteEntity(ent)
					net.SendToServer()

					ConfigScroll:Remove()
				end
			end
		end
	end

	local SetButton = vgui.Create("DButton", idkMenu)
	SetButton:SetText("")
	SetButton:SetPos(700, 100)
	SetButton:SetSize(238, 40)

	SetButton.Paint = function()
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawRect(0, 0, SetButton:GetWide(), SetButton:GetTall())

		draw.DrawText("Установить точку", "DermaLarge", 5, 5, Color(255,255,255,255), 0)
	end
	
	SetButton.DoClick = function()
		net.Start("SetPoint")
		net.WriteEntity(ent)
		net.SendToServer()
		idkMenu:Remove()
	end

	-- Удалить точку и забыть её место на карте
	local RemoveButton = vgui.Create("DButton", idkMenu)
	RemoveButton:SetText("")
	RemoveButton:SetPos(700, 150)
	RemoveButton:SetSize(238, 40)

	RemoveButton.Paint = function()
		surface.SetDrawColor(120, 30, 30, 255)
		surface.DrawRect(0, 0, RemoveButton:GetWide(), RemoveButton:GetTall())

		draw.DrawText("Убрать с карты", "DermaLarge", 5, 5, Color(255,255,255,255), 0)
	end

	RemoveButton.DoClick = function()
		Derma_Query("Убрать точку «" .. ent:GetCurPoint() .. "» с карты?", "Точка захвата", "Да", function()
			net.Start("PR_PointRemove")
				net.WriteEntity(ent)
			net.SendToServer()
			if IsValid(idkMenu) then idkMenu:Remove() end
		end, "Нет")
	end
	
	local escapefromkazino = vgui.Create( "DButton", idkMenu)
	escapefromkazino:SetPos(950, 1)
	escapefromkazino:SetText( "" )
	escapefromkazino:SetSize( 50, 50 )
	escapefromkazino.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0, escapefromkazino:GetWide(),escapefromkazino:GetTall())
		surface.SetDrawColor(200,220,220,255)
		draw.SimpleText( "X", "DermaLarge", 17, 10, Color(255,255,255) )
	end
	escapefromkazino.DoClick = function()
		idkMenu:Remove()
	end
end

net.Receive( "GivePointsCfgs", function()
	PR_Capture_Points_List = PR_Capture_Points_List or {}
	PR_Capture_Points_List.Config = net.ReadTable()
end)

-- Полоска прогресса у того, кто захватывает
hook.Add("HUDPaint", "PR_CaptureProgress", function()
	local lp = LocalPlayer()

	for _, point in ipairs(ents.FindByClass("zahvat_ojka")) do
		if point:GetCapturer() == lp then
			local total = point:GetCaptureEnd() - point:GetCaptureStart()
			local frac = total > 0 and math.Clamp((CurTime() - point:GetCaptureStart()) / total, 0, 1) or 0

			local w, h = 400, 30
			local x, y = ScrW() / 2 - w / 2, ScrH() * 0.75

			draw.RoundedBox(0, x, y, w, h, Color(0, 0, 0, 200))
			draw.RoundedBox(0, x + 2, y + 2, (w - 4) * frac, h - 4, Color(200, 40, 40, 230))
			draw.SimpleText("Захват точки «" .. point:GetCurPoint() .. "»: " .. math.floor(frac * 100) .. "%", "DermaDefaultBold", ScrW() / 2, y + h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			break
		end
	end
end)

net.Receive("OpenIDKPanel", idkMenuOpen )

net.Receive("OpenAdminPanel", ConfigAdminMenu )