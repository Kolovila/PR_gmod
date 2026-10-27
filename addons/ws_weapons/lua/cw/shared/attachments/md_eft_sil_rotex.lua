local att = {}
att.name = "md_eft_sil_rotex"
att.displayName = "B&T Rotex 2 4.6x30 silencer"
att.displayNameShort = "Rotex"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.04}
att.MuzzleVelocity = -0.12
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_sil_rotex")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self.dt.Suppressed = false
end


CustomizableWeaponry:registerAttachment(att)