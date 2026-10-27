local att = {}
att.name = "pk_light"
att.displayName = "Light Weight"
att.displayNameShort = "LW"
att.description = {[1] = {t = "Allows you Move faster", c = CustomizableWeaponry.textColors.VPOSITIVE}}


att.statModifiers = {OverallMouseSensMult = 0.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/lightweight")
	att.description = {}
	
end

function att:attachFunc()


self.SpeedDec = 3
end

function att:DetachFunc()


self.SpeedDec = Orig 
end

CustomizableWeaponry:registerAttachment(att)