local att = {}
att.name = "kk_ins2_suppressor_warrior"
att.displayName = "Warrior"
att.displayNameShort = "Warrior"
att.isSuppressor = true
att.WeaponLength = 14

att.statModifiers = {
	// OverallMouseSensMult = -0.1,
	RecoilMult = -0.27,
	-- WeaponLength = 12,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "Zmniejsza dźwięk i błysk wystrzału.", c = CustomizableWeaponry.textColors.POSITIVE},
		-- [2] = {t = "Increases weapon length.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self:resetSuppressorStatus()
end

CustomizableWeaponry:registerAttachment(att)
