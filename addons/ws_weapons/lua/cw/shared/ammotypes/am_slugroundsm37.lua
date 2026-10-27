local att = {}
att.name = "am_slugroundsm37"
att.displayName = "Rifled"
att.displayNameShort = "RFL"

att.statModifiers = {DamageMult = 4,
	RecoilMult = .25,
	AimSpreadMult = -.55}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/rifleslug")
	att.description = {{t = "Lead slug designed for long range accuracy", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.CrosshairParts = {left = true, right = true, upper = true, lower = true}
	self.Shots = 1
	self.ClumpSpread = nil
	self.MuzzleEffect = "muzzleflash_ak47"
end

function att:detachFunc()
	self.CrosshairParts = {left = true, right = true, upper = false, lower = true}
	self.Shots = self.Shots_Orig
	self.ClumpSpread = self.ClumpSpread_Orig
	self.MuzzleEffect = "muzzleflash_m3"
end

CustomizableWeaponry:registerAttachment(att)