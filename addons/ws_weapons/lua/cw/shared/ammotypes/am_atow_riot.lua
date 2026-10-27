local att = {}
att.name = "am_atow_riot"
att.displayName = "Shotshell"
att.displayNameShort = "SHOT"

att.statModifiers = {
	DamageMult = -0.75,
	RecoilMult = -.35}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/riot")
	att.description = {{t = "Riot controll shell with four pellets.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	self.CrosshairParts = {left = true, right = true, upper = false, lower = true}
	self.ClumpSpread = 0.16
	self.ClumpSpread_Orig = 0.16
	self.Shots = 4
	self.PenMod = .8
end

function att:detachFunc()
	self.CrosshairParts = {left = true, right = true, upper = true, lower = true}
	self.ClumpSpread = nil
	self.Shots = self.Shots_Orig
	self.PenMod = 1
end

CustomizableWeaponry:registerAttachment(att)