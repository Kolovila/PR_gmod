local att = {}
att.name = "am_76251_bpzfmj"
att.displayName = "Pociski BPZ FMJ"
att.displayNameShort = "BPZ FMJ"

att.statModifiers = {
	RecoilMult = -0.03,
	DamageMult = -0.01,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_bpzfmj")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)