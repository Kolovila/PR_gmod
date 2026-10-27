local att = {}
att.name = "md_eft_sil_srd9"
att.displayName = "Sig SRD 9 9x19mm sound suppressor"
att.displayNameShort = "SRD 9"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.1}
att.MuzzleVelocity = -0.15
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