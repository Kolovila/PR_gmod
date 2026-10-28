att.PrintName = "Proficiency"
att.Icon = Material("vgui/fas2atts/proficiency")
att.Description = "Improves reloading speed and weapon handling"

att.Desc_Pros = {
	"Reduces reloading speed and improves handling"
}

att.Slot = "fas2_nomen"


att.Hook_SelectReloadAnimation = function(wep, anim)
	local nomen = wep.Animations["reload_nomen"] and "_nomen" or ""
	local empty = wep:Clip1() == 0 and "_empty" or ""

	return "reload" .. nomen .. empty
end

att.AutoStats = true

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"