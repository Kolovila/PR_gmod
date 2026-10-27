local att = {}
att.name = "md_ws_m40gl"
att.displayName = "EOTech M40 GL"
att.displayNameShort = "M40 GL"
att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/md_ws_m40gl")
	att.description = {[1] = {t = "Allows the use of M40 sights for M203", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.M203Pos = self.M203M40Pos
	self.M203Ang = self.M203M40Ang
	Material("cw2/gui/crosshair_gl"):SetTexture("$basetexture", "cw2/gui/crosshair_gl_nothing")
end

function att:detachFunc()
	self.M203Pos = self.M203Pos0RG
	self.M203Ang = self.M203AngORG
	Material("cw2/gui/crosshair_gl"):SetTexture("$basetexture", "cw2/gui/crosshair_gl")
end

CustomizableWeaponry:registerAttachment(att)