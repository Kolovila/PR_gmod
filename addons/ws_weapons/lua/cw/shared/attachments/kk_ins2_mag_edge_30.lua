local att = {}
att.name = "kk_ins2_mag_edge_30"
att.displayName = "EDGE 30 Round Mag."
att.displayNameShort = "EDGE30"

att.statModifiers = {
    // DamageMult = 0.15
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

function att:attachFunc()
	self.Primary.ClipSize = (self.Primary.ClipSize + 10)
	self.Primary.ClipSize_Orig = (self.Primary.ClipSize_Orig + 10)
end

function att:detachFunc()
    self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)