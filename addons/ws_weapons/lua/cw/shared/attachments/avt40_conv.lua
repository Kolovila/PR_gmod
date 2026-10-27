local att = {}
att.name = "avt40_conv"
att.displayName = "AVT-40 Conversion"
att.displayNameShort = "Auto"

att.statModifiers = {FireDelayMult = -.005,
MaxSpreadIncMult = 0.1,
HipSpreadMult = 0.3}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/fullautorec")
	att.description = {[1] = {t = "Switches to full-auto firemode.", c = CustomizableWeaponry.textColors.VPOSITIVE}}
end

function att:attachFunc()
	self:CycleFiremodes() 
	self.FireModes = {"auto","safe"}
	self:CycleFiremodes()
	self:CycleFiremodes()
end

function att:detachFunc()
	self:CycleFiremodes()
	self.FireModes = {"semi","safe"}
	self:CycleFiremodes()
	self:CycleFiremodes()
end

CustomizableWeaponry:registerAttachment(att)