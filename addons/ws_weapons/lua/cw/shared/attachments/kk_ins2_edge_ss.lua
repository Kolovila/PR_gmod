local att = {}
att.name = "kk_ins2_edge_ss"
att.displayName = "EDGE Stainless Steel"
att.displayNameShort = "EDGE SS"
att.KK_INS2_playIdle = true

att.activeWM = "models/weapons/edge/w_edge_ss.mdl"
att.origWM = "models/weapons/edge/w_edge.mdl"

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

function att:attachFunc()
	self.WorldModel = att.activeWM
end

function att:detachFunc()
	self.WorldModel = att.origWM
end

CustomizableWeaponry:registerAttachment(att)