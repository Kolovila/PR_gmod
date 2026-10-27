local att = {}
att.name = "bg_snip_tac338_8_mag"
att.displayName = "Extended Mag"
att.displayNameShort = "+3 Bullets"
att.isBG = true

att.statModifiers = {
ReloadSpeedMult = -0.03,
OverallMouseSensMult = -0.03}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/+3")
	att.description = {[1] = {t = "Increases mag size to 8 bullets", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
    self.Animations = {
	    fire = {"shoot"},
        reload = "reload_8_mag",
	    idle = "idle1",
	    draw = "draw"
	}
	self:setBodygroup(self.MagBGs.main, self.MagBGs.extended)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize + 3 
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_Orig + 3 
end

function att:detachFunc()
    self.Animations = {
	    fire = {"shoot"},
        reload = "reload",
	    idle = "idle1",
	    draw = "draw"
	}
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)