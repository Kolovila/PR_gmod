local att = {}
att.name = "md_fasthand"
att.displayName = "Fast Hands"
att.displayNameShort = "Fast"

att.statModifiers = {
	ReloadSpeedMult = 0.10,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("VGUI/hud/fasthands")
	att.description = {
 [1] = {t = "Increase deploy speed by 25%", c = CustomizableWeaponry.textColors.POSITIVE},
 [2] = {t = "Animation Change", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	self.Animations = {fire = {"fire_1", "fire_2", "fire_3"},
	reload = "reload_half",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	self:sendWeaponAnim("idle")
end

function att:detachFunc()
	self.Animations = {fire = {"fire_1", "fire_2", "fire_3"},
	reload = "reload_half",
	reload_empty = "reload_empty_foregrip",
	idle = "idle",
	draw = "ready"}
	self:sendWeaponAnim("idle")
end

CustomizableWeaponry:registerAttachment(att)