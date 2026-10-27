local att = {}
att.name = "md_ws_m203leaf"
att.displayName = "Leaf Sights"
att.displayNameShort = "Leaf"

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/md_ws_m203leaf")
	att.description = {[1] = {t = "Allows the use of leaf sights for M203", c = CustomizableWeaponry.textColors.POSITIVE},
						[2] = {t = "Partial blocks field of view", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self.M203Pos = self.M203LeafPos
	self.M203Ang = self.M203LeafAng
	Material("cw2/gui/crosshair_gl"):SetTexture("$basetexture", "cw2/gui/crosshair_gl_nothing")
end

function att:detachFunc()
	self.M203Pos = self.M203Pos0RG
	self.M203Ang = self.M203AngORG
	Material("cw2/gui/crosshair_gl"):SetTexture("$basetexture", "cw2/gui/crosshair_gl")
end

CustomizableWeaponry:registerAttachment(att)