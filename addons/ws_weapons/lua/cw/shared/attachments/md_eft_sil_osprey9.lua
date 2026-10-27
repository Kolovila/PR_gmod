local att = {}
att.name = "md_eft_sil_osprey9"
att.displayName = "SilencerCo Osprey 9 9x19mm sound suppressor"
att.displayNameShort = "Osprey 9"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.12}
att.MuzzleVelocity = -0.09
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_sil_srd9")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self.dt.Suppressed = false
end


CustomizableWeaponry:registerAttachment(att)