-- Creates a menu that can enable or disable the reload prompts

-- Prompts, Coloured text
local function mw3PromptSettings( pnl )
	pnl:AddControl ( "Label", { Text = "#mw3_ammo_prompt_desc" } )
	
	pnl:AddControl ( "CheckBox", { Label = "#mw3_ammo_reload", Command = "mw3_ammo_show_reload" } )
	
	pnl:AddControl ( "CheckBox", { Label = "#mw3_ammo_low", Command = "mw3_ammo_show_lowammo" } )
	
	pnl:AddControl ( "CheckBox", { Label = "#mw3_ammo_empty", Command = "mw3_ammo_show_noammo" } )

	pnl:AddControl ( "CheckBox", { Label = "#mw3_display_alt", Command = "mw3_show_alt" } )

	pnl:AddControl ( "CheckBox", { Label = "#mw3_display_melee", Command = "mw3_show_melee" } )

	--pnl:AddControl ( "Label", { Text = "#mw3_ammo_prompt_desc2" } )
	
	pnl:AddControl ( "Label", { Text = "" } )

	pnl:AddControl ( "Label", { Text = "#mw3_gamepad_menu" } )
	
	pnl:AddControl ( "CheckBox", { Label = "#mw3_gamepad_use", Command = "mw3_prompt_controller" } )

	pnl:AddControl( "CheckBox", { Label = "#mw3_gamepad_use_ps4", Command = "mw3_prompt_controller_ps4" } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_gl1", Options = list.Get("MW3GPButtonsGL1") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_gl2", Options = list.Get("MW3GPButtonsGL2") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_reload", Options = list.Get("MW3GPButtonsReload") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_breath", Options = list.Get("MW3GPButtonsBreath") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_aim", Options = list.Get("MW3GPButtonsAim") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_melee1", Options = list.Get("MW3GPButtonsMelee1") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_melee2", Options = list.Get("MW3GPButtonsMelee2") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_zoom_in", Options = list.Get("MW3GPButtonsZoomIn") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_gamepad_button_zoom_out", Options = list.Get("MW3GPButtonsZoomOut") } )

	pnl:AddControl ( "Label", { Text = "" } )

	pnl:AddControl ( "Label", { Text = "#mw3_prompt_wii_crosshair" } )
	
	pnl:AddControl ( "CheckBox", { Label = "#mw3_prompt_wii_crosshair_enable", Command = "mw3_prompt_wii_crosshair" } )

	pnl:AddControl( "Slider", { Label = "#mw3_prompt_wii_crosshair_style", Type = "Integer", Command = "mw3_prompt_wii_crosshair_style", Min = 1, Max = 7 } )

	-- pnl:AddControl( "Slider", { Label = "#mw3_prompt_wii_crosshair_size_in", Type = "Integer", Command = "mw3_prompt_wii_crosshair_size_in", Min = 1, Max = 7 } )

	-- pnl:AddControl( "Slider", { Label = "#mw3_prompt_wii_crosshair_size_out", Type = "Integer", Command = "mw3_prompt_wii_crosshair_size_out", Min = 1, Max = 7 } )

	pnl:AddControl( "ListBox", { Label = "#mw3_prompt_wii_crosshair_col_in", Options = list.Get("MW3WiiColoursIn") } )

	pnl:AddControl( "ListBox", { Label = "#mw3_prompt_wii_crosshair_col_out", Options = list.Get("MW3WiiColoursOut") } )

	pnl:AddControl ( "Label", { Text = "" } )

end

list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_1", { mw3_prompt_wii_crosshair_col_in = 1 } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_2", { mw3_prompt_wii_crosshair_col_in = "2" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_3", { mw3_prompt_wii_crosshair_col_in = "3" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_4", { mw3_prompt_wii_crosshair_col_in = "4" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_5", { mw3_prompt_wii_crosshair_col_in = "5" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_6", { mw3_prompt_wii_crosshair_col_in = "6" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_7", { mw3_prompt_wii_crosshair_col_in = 7 } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_8", { mw3_prompt_wii_crosshair_col_in = "8" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_9", { mw3_prompt_wii_crosshair_col_in = "9" } )
list.Set( "MW3WiiColoursIn", "#mw3_prompt_wii_crosshair_col_in_10", { mw3_prompt_wii_crosshair_col_in = 10 } )

list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_1", { mw3_prompt_wii_crosshair_col_out = 1 } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_2", { mw3_prompt_wii_crosshair_col_out = "2" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_3", { mw3_prompt_wii_crosshair_col_out = "3" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_4", { mw3_prompt_wii_crosshair_col_out = "4" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_5", { mw3_prompt_wii_crosshair_col_out = "5" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_6", { mw3_prompt_wii_crosshair_col_out = "6" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_7", { mw3_prompt_wii_crosshair_col_out = 7 } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_8", { mw3_prompt_wii_crosshair_col_out = "8" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_9", { mw3_prompt_wii_crosshair_col_out = "9" } )
list.Set( "MW3WiiColoursOut", "#mw3_prompt_wii_crosshair_col_out_10", { mw3_prompt_wii_crosshair_col_out = 10 } )

--Aiming Sensitivity
local function mw3SensSettings( pnl )
	pnl:AddControl ( "CheckBox", { Label = "#mw3_sens_use", Command = "mw3_sens_reduce" } )
	
	pnl:AddControl( "Slider", { Label = "#mw3_sens_close", Type = "Integer", Command = "mw3_sens_close", Min = 20, Max = 100 } )

	pnl:AddControl( "Slider", { Label = "#mw3_sens_mid", Type = "Integer", Command = "mw3_sens_mid", Min = 20, Max = 100 } )

	pnl:AddControl( "Slider", { Label = "#mw3_sens_long", Type = "Integer", Command = "mw3_sens_long", Min = 20, Max = 100 } )

	pnl:AddControl ( "Label", { Text = "#mw3_sens_note" } )

	pnl:AddControl ( "Label", { Text = "#mw3_ammo_prompt_desc2" } )

	pnl:AddControl ( "Label", { Text = "" } )

end

-- Adds a page to the sandbox tool menu
local function mw3PromptMenu()
	spawnmenu.AddToolMenuOption( "Weapons by Moka", "MW3 Redux", "mw3PromptMenu", "#mw3_ammo_prompt", "", "", mw3PromptSettings )
end

local function mw3SensMenu()
	spawnmenu.AddToolMenuOption( "Weapons by Moka", "MW3 Redux", "mw3SensMenu", "#mw3_sens_menu", "", "", mw3SensSettings )
end

hook.Add( "PopulateToolMenu", "mw3PromptMenu", mw3PromptMenu )
hook.Add( "PopulateToolMenu", "mw3SensMenu", mw3SensMenu )

mw3_prompt_controller = CreateClientConVar ( "mw3_prompt_controller", 0, true, false, "Displays gamepad buttons on the prompts." )
mw3_prompt_controller_ps4 = CreateClientConVar ( "mw3_prompt_controller_ps4", 1, true, false, "Display PlayStation buttons instead of Xbox." )
mw3_prompt_controller_button_reload = CreateClientConVar ( "mw3_prompt_controller_button_reload", "x", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_gl_1 = CreateClientConVar ( "mw3_prompt_controller_button_gl_1", "y", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_gl_2 = CreateClientConVar ( "mw3_prompt_controller_button_gl_2", "trigger_l", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_breath = CreateClientConVar ( "mw3_prompt_controller_button_breath", "bumper_l", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_aiming = CreateClientConVar ( "mw3_prompt_controller_button_aiming", "trigger_l", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_melee_1 = CreateClientConVar ( "mw3_prompt_controller_button_melee_1", "y", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_melee_2 = CreateClientConVar ( "mw3_prompt_controller_button_melee_2", "trigger_r", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_zoom_in = CreateClientConVar ( "mw3_prompt_controller_button_zoom_in", "x", true, false, "Which console button to display when using gamepad prompts." )
mw3_prompt_controller_button_zoom_out = CreateClientConVar ( "mw3_prompt_controller_button_zoom_out", "y", true, false, "Which console button to display when using gamepad prompts." )

mw3_ammo_show_reload = CreateClientConVar ( "mw3_ammo_show_reload", 1, true, false, "Enables the 'RELOAD' prompt." )
mw3_ammo_show_lowammo = CreateClientConVar ( "mw3_ammo_show_lowammo", 1, true, false, "Enables the 'LOW AMMO' prompt." )
mw3_ammo_show_noammo = CreateClientConVar ( "mw3_ammo_show_noammo", 1, true, false, "Enables the 'NO AMMO' prompt." )

mw3_color_reload = CreateClientConVar ( "mw3_color_reload", 0, true, false, "Display color on the 'RELOAD' button prompt." )
mw3_color_alt = CreateClientConVar ( "mw3_color_alt", 1, true, false, "Display color on the 'Weapon Attachment' button prompt." )
mw3_color_aimtofire = CreateClientConVar ( "mw3_color_aimtofire", 1, true, false, "Display color on the 'Aim to Fire' button prompt." )
mw3_color_steady = CreateClientConVar ( "mw3_color_steady", 1, true, false, "Display color on the 'Hold to Steady' button prompt." )
mw3_color_melee = CreateClientConVar ( "mw3_color_melee", 1, true, false, "Display color on the 'Melee' button prompt." )

mw3_show_alt = CreateClientConVar ( "mw3_show_alt", 1, true, false, "Enables the 'Weapon Attachment' prompt when applicable." )
mw3_show_melee = CreateClientConVar ( "mw3_show_melee", 1, true, false, "Enables the 'Melee' prompt when applicable." )

mw3_sens_reduce = CreateClientConVar ( "mw3_sens_reduce", 0, true, false, "Reduces the mouse sensitivity when aiming." )
mw3_sens_close = CreateClientConVar ( "mw3_sens_close", 20, true, false, "Sensitivity when aiming with a low-zoom weapon/scope.", 20, 100 )
mw3_sens_mid = CreateClientConVar ( "mw3_sens_mid", 30, true, false, "Sensitivity when aiming with a medium-zoom weapon/scope.", 20, 100 )
mw3_sens_long = CreateClientConVar ( "mw3_sens_long", 60, true, false, "Sensitivity when aiming with a high-zoom weapon/scope.", 20, 100 )

mw3_sound_default_aim = CreateClientConVar ( "mw3_sound_default_aim", 0, true, false, "Play the standard CW2 sound when going in and out of aiming." )
mw3_sound_default_equip = CreateClientConVar ( "mw3_sound_default_equip", 0, true, false, "Play the standard CW2 sound when equipping attachments." )
mw3_sound_default_unequip = CreateClientConVar ( "mw3_sound_default_unequip", 0, true, false, "Play the standard CW2 sound when taking off attachments." )

mw3_prompt_wii_crosshair = CreateClientConVar ( "mw3_prompt_wii_crosshair", 0, true, false, "Enables Wii-styled crosshair." )
mw3_prompt_wii_crosshair_style = CreateClientConVar ( "mw3_prompt_wii_crosshair_style", 1, true, false, "Which Wii-styled crosshair to use.", 1,  7 )
mw3_prompt_wii_crosshair_col_in = CreateClientConVar ( "mw3_prompt_wii_crosshair_col_in", 1, true, false, "Colour of the inner dot on the Wii-styled crosshair.", 1,  10 )
mw3_prompt_wii_crosshair_col_out = CreateClientConVar ( "mw3_prompt_wii_crosshair_col_out", 1, true, false, "Colour of the outer part on the Wii-styled crosshair.", 1,  10 )

-- Controller Prompts
--Reload
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_reload = "dpad_left" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_reload = "dpad_right" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_reload = "dpad_up" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_reload = "dpad_down" } )

list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_reload = "bumper_l" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_reload = "bumper_r" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_reload = "trigger_l" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_reload = "trigger_r" } )

list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_reload = "a" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_reload = "b" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_start", { mw3_prompt_controller_button_reload = "start" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_back", { mw3_prompt_controller_button_reload = "back" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_reload = "x" } )
list.Set( "MW3GPButtonsReload", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_reload = "y" } )

--GL (1)
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_gl_1 = "dpad_left" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_gl_1 = "dpad_right" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_gl_1 = "dpad_up" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_gl_1 = "dpad_down" } )

list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_gl_1 = "bumper_l" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_gl_1 = "bumper_r" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_gl_1 = "trigger_l" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_gl_1 = "trigger_r" } )

list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_gl_1 = "a" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_gl_1 = "b" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_start", { mw3_prompt_controller_button_gl_1 = "start" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_back", { mw3_prompt_controller_button_gl_1 = "back" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_gl_1 = "x" } )
list.Set( "MW3GPButtonsGL1", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_gl_1 = "y" } )

-- GL (2)
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_gl_2 = "dpad_left" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_gl_2 = "dpad_right" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_gl_2 = "dpad_up" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_gl_2 = "dpad_down" } )

list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_gl_2 = "bumper_l" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_gl_2 = "bumper_r" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_gl_2 = "trigger_l" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_gl_2 = "trigger_r" } )

list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_gl_2 = "a" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_gl_2 = "b" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_start", { mw3_prompt_controller_button_gl_2 = "start" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_back", { mw3_prompt_controller_button_gl_2 = "back" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_gl_2 = "x" } )
list.Set( "MW3GPButtonsGL2", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_gl_2 = "y" } )

-- Breath
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_breath = "dpad_left" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_breath = "dpad_right" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_breath = "dpad_up" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_breath = "dpad_down" } )

list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_breath = "bumper_l" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_breath = "bumper_r" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_breath = "trigger_l" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_breath = "trigger_r" } )

list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_breath = "a" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_breath = "b" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_breath = "x" } )
list.Set( "MW3GPButtonsBreath", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_breath = "y" } )

-- Aiming
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_aiming = "dpad_left" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_aiming = "dpad_right" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_aiming = "dpad_up" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_aiming = "dpad_down" } )

list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_aiming = "bumper_l" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_aiming = "bumper_r" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_aiming = "trigger_l" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_aiming = "trigger_r" } )

list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_aiming = "a" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_aiming = "b" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_aiming = "x" } )
list.Set( "MW3GPButtonsAim", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_aiming = "y" } )

-- Melee (1)
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_melee_1 = "dpad_left" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_melee_1 = "dpad_right" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_melee_1 = "dpad_up" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_melee_1 = "dpad_down" } )

list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_melee_1 = "bumper_l" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_melee_1 = "bumper_r" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_melee_1 = "trigger_l" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_melee_1 = "trigger_r" } )

list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_melee_1 = "a" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_melee_1 = "b" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_melee_1 = "x" } )
list.Set( "MW3GPButtonsMelee1", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_melee_1 = "y" } )

-- Melee (2)
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_melee_2 = "dpad_left" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_melee_2 = "dpad_right" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_melee_2 = "dpad_up" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_melee_2 = "dpad_down" } )

list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_melee_2 = "bumper_l" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_melee_2 = "bumper_r" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_melee_2 = "trigger_l" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_melee_2 = "trigger_r" } )

list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_melee_2 = "a" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_melee_2 = "b" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_melee_2 = "x" } )
list.Set( "MW3GPButtonsMelee2", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_melee_2 = "y" } )

-- Zoom In
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_zoom_in = "dpad_left" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_zoom_in = "dpad_right" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_zoom_in = "dpad_up" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_zoom_in = "dpad_down" } )

list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_zoom_in = "bumper_l" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_zoom_in = "bumper_r" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_zoom_in = "trigger_l" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_zoom_in = "trigger_r" } )

list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_zoom_in = "a" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_zoom_in = "b" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_zoom_in = "x" } )
list.Set( "MW3GPButtonsZoomIn", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_zoom_in = "y" } )

-- Zoom Out
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_dpad_l", { mw3_prompt_controller_button_zoom_out = "dpad_left" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_dpad_r", { mw3_prompt_controller_button_zoom_out = "dpad_right" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_dpad_u", { mw3_prompt_controller_button_zoom_out = "dpad_up" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_dpad_d", { mw3_prompt_controller_button_zoom_out = "dpad_down" } )

list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_bumper_l", { mw3_prompt_controller_button_zoom_out = "bumper_l" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_bumper_r", { mw3_prompt_controller_button_zoom_out = "bumper_r" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_trigger_l", { mw3_prompt_controller_button_zoom_out = "trigger_l" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_trigger_r", { mw3_prompt_controller_button_zoom_out = "trigger_r" } )

list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_a", { mw3_prompt_controller_button_zoom_out = "a" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_b", { mw3_prompt_controller_button_zoom_out = "b" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_x", { mw3_prompt_controller_button_zoom_out = "x" } )
list.Set( "MW3GPButtonsZoomOut", "#mw3_gamepad_button_y", { mw3_prompt_controller_button_zoom_out = "y" } )
