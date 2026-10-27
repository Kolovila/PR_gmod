local att = {}
att.name = "md_eft_sil_rotor43"
att.displayName = "Rotor 43 9x19 muzzle brake"
att.displayNameShort = "ROTOR 43"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.13}
att.MuzzleVelocity = -0.18
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_sil_rotor43")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self.dt.Suppressed = false
end


CustomizableWeaponry:registerAttachment(att)