local att = {}
att.name = "am_atow_ap"
att.displayName = "Tungsten core"
att.displayNameShort = "AP"

att.statModifiers = {DamageMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/apammo")
	att.description = {{t = "Increases surface penetration by 80%", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.PenMod = 1.8
end

function att:detachFunc()
	self.PenMod = 1
end

CustomizableWeaponry:registerAttachment(att)