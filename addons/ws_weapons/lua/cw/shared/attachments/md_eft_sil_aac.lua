local att = {}
att.name = "md_eft_sil_aac"
att.displayName = "AAC Illusion 9 9x19mm silencer"
att.displayNameShort = "AAC"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.08}
att.MuzzleVelocity = -0.1
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_sil_aac")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self.dt.Suppressed = false
end


CustomizableWeaponry:registerAttachment(att)