local function ARCCW_FAS2_ClientsidePanel(panel)
	panel:ClearControls()

	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(0)
	slider:SetMin(0)
	slider:SetMax(3)
	slider:SetConVar("arccw_fas2_handrig")
	slider:SetValue(GetConVarNumber("arccw_fas2_handrig"))
	slider:SetText("Hand Rig")
	
	panel:AddItem(slider)

	-------------------------------------------------------------
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Hand Skin")
	MC.ConVar = "arccw_fas2_handskin"
	
	MC:AddChoice("White")
	MC:AddChoice("Tan")
	MC:AddChoice("Black")
	MC:AddChoice("Camo")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)

	-------------------------------------------------------------
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Glove Skin")
	MC.ConVar = "arccw_fas2_gloveskin"
	
	MC:AddChoice("Nomex")
	MC:AddChoice("Black")
	MC:AddChoice("Desert Khaki")
	MC:AddChoice("Multicam")
	MC:AddChoice("Green")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)

	-------------------------------------------------------------
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Sleeve Skin")
	MC.ConVar = "arccw_fas2_sleeveskin"
	
	MC:AddChoice("Woodland Camo")
	MC:AddChoice("Digital Camo")
	MC:AddChoice("Russian Digital Camo")
	MC:AddChoice("Black")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)
	
	-- panel:AddControl("Button", {Label = "Apply Skin", Command = "arccw_fas2_handrig_applynow"})

	-------------------------------------------------------------

	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(2)
	slider:SetMin(0)
	slider:SetMax(2)
	slider:SetConVar("arccw_fas2_headbob_intensity")
	slider:SetValue(GetConVarNumber("arccw_fas2_headbob_intensity"))
	slider:SetText("Headbob Intensity")
	
	panel:AddItem(slider)

	panel:AddControl("CheckBox", {Label = "FA:S 2.0 Bolting", Command = "arccw_fas2_bolting"})
end

local function ARCCW_FAS2_PopulateToolMenu()
	spawnmenu.AddToolMenuOption("Options", "ArcCW", "ArcCW_FAS2", "FA:S 2.0 Options", "", "", ARCCW_FAS2_ClientsidePanel)
end

hook.Add("PopulateToolMenu", "ArcCW_FAS2_PopulateToolMenu", ARCCW_FAS2_PopulateToolMenu)