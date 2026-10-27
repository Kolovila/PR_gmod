function SWEP:GamepadButtons()
color = {
None = "<color=255,255,255>",
XboxA = "<color=100,255,100>",
XboxX = "<color=100,255,255>",
XboxY = "<color=255,255,0>",
XboxB = "<color=255,100,100>",

PSA = "<color=150,255,255>",
PSX = "<color=255,150,255>",
PSY = "<color=150,255,150>",
PSB = "<color=255,150,150>",
}

if string == "dpad_up" then
	prompt = "W"
	promptcol = color.None .. prompt
elseif string == "dpad_down" then
	prompt = "X"
	promptcol = color.None .. prompt
elseif string == "dpad_left" then
	prompt = "A"
	promptcol = color.None .. prompt
elseif string == "dpad_right" then
	prompt = "D"
	promptcol = color.None .. prompt
elseif string == "bumper_l" then
	prompt = "["
	promptcol = color.None .. prompt
elseif string == "bumper_r" then
	prompt = "]"
	promptcol = color.None .. prompt
elseif string == "trigger_l" then
	prompt = "{"
	promptcol = color.None .. prompt
elseif string == "trigger_r" then
	prompt = "}"
	promptcol = color.None .. prompt
end

if self.ShowConsoleButtons_PS4 then
	if string == "a" then
		prompt = "x"
		promptcol = color.PSA .. prompt
	elseif string == "x" then
		prompt = "s"
		promptcol = color.PSX .. prompt
	elseif string == "y" then
		prompt = "t"
		promptcol = color.PSY .. prompt
	elseif string == "b" then
		prompt = "c"
		promptcol = color.PSB .. prompt
	end
else
	if string == "a" then
		prompt = "a"
		promptcol = color.XboxA .. prompt
	elseif string == "x" then
		prompt = "x"
		promptcol = color.XboxX .. prompt
	elseif string == "y" then
		prompt = "y"
		promptcol = color.XboxY .. prompt
	elseif string == "b" then
		prompt = "b"
		promptcol = color.XboxB .. prompt
	end
end

end

function SWEP:GamepadPromptAimToFire()
string = GetConVarString( "mw3_prompt_controller_button_aiming" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

	self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptAimToFireCol()
	self:GamepadPromptAimToFire()
	return font .. promptcol
end

function SWEP:GamepadPromptGL1()
string = GetConVarString( "mw3_prompt_controller_button_gl_1" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptGL1Col()
	self:GamepadPromptGL1()
	return font .. promptcol
end

function SWEP:GamepadPromptGL2()
string = GetConVarString( "mw3_prompt_controller_button_gl_2" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptGL2Col()
	self:GamepadPromptGL2()
	return font .. promptcol
end

function SWEP:GamepadPromptMelee1()
string = GetConVarString( "mw3_prompt_controller_button_melee_1" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptMelee1Col()
	self:GamepadPromptMelee1()
	return font .. promptcol
end

function SWEP:GamepadPromptMelee2()
string = GetConVarString( "mw3_prompt_controller_button_melee_2" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptMelee2Col()
	self:GamepadPromptMelee2()
	return font .. promptcol
end

function SWEP:GamepadPromptZoomIn()
string = GetConVarString( "mw3_prompt_controller_button_zoom_in" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptZoomInCol()
	self:GamepadPromptZoomIn()
	return font .. promptcol
end

function SWEP:GamepadPromptZoomOut()
string = GetConVarString( "mw3_prompt_controller_button_zoom_out" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptZoomOutCol()
	self:GamepadPromptZoomOut()
	return font .. promptcol
end

function SWEP:GamepadPromptBreath()
string = GetConVarString( "mw3_prompt_controller_button_breath" )
if self.ShowConsoleButtons_PS4 then
	font = "<font=PS4_FONT32>"
else
	font = "<font=XBOX_FONT32>"
end

self:GamepadButtons()
	
	return font .. prompt
end

function SWEP:GamepadPromptBreathCol()
	self:GamepadPromptBreath()
	return font .. promptcol
end
