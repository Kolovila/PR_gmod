local att = {}
att.name = "md_fastreload"
att.displayName = "Fast Reload"
att.displayNameShort = "NOMEN"

att.statModifiers = {
	ReloadSpeedMult = 0.0,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("vgui/hud/fasthands")
	att.description = {
	[1] = {t = "Faster Reload Animation", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.Animations = {fire = {"fire"},
	reload = "reload_nomen",
	reload_empty = "reload_empty_nomen",
	idle = "idle",
	draw = "deploy"}
	self:sendWeaponAnim("idle")
end

function att:detachFunc()
	self.Animations = {fire = {"fire"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "deploy"}
	self:sendWeaponAnim("idle")
end

CustomizableWeaponry:registerAttachment(att)