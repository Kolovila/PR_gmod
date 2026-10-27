local att = {}
att.name = "mw3_att_akimbo"
att.displayName = "#mw3_att_akimbo"
att.displayNameShort = ""

att.statModifiers = {}

if CLIENT then
    att.description = {[1] = {t = att.displayName .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}} 
    att.displayIcon = surface.GetTextureID( "mw3_icons/atts/mod_akimbo" )
end

function att:attachFunc()
   -- change weapon name
	self.CurName = self.WpnName .. " " .. loc('mw3_att_akimbo_equipped')
	if self.WpnName then
		self.PrintName = self.WpnName .. " " .. loc('mw3_att_akimbo_equipped')
	end
	
	-- activate the activation of the dual wield function
	self:ActivateDualwield()
end

function att:detachFunc()
    -- reset weapon name
	if self.WpnName then
		self.PrintName = self.WpnName
	end
	
	-- activate the deactivation of the dual wield function
	self:DisableDualwield()
end

CustomizableWeaponry:registerAttachment(att)
