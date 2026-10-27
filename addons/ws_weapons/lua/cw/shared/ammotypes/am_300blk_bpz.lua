local att = {}
att.name = "am_300blk_bpz"
att.displayName = "Pociski .300 BPZ AAC Blackout"
att.displayNameShort = "BPZ"

att.statModifiers = {
	DamageMult = 0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_300blk_bpz")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)