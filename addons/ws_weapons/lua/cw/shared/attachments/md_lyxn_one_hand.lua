local att = {}
att.name = "md_lyxn_one_hand"
att.displayName = "One Handed"
att.displayNameShort = "Hand"
att.isBG = true
att.SpeedDec = -10

att.statModifiers = {
OverallMouseSensMult = 0.5,
VelocitySensitivityMult = -0.5,
DrawSpeedMult = 0.1,
RecoilMult = 0.2,
HipSpreadMult = 0.1,
AimSpreadMult = 0.1,
SpreadPerShotMult = 0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/one_hand")
	att.description = {[1] = {t = "One hand like a Pro", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.HolsterOnLadder = false
	self.SprintingEnabled = false
	self.ForegripOverride = true
	self.ForegripParent = "One_Hand"
	self.MoveType = 1
    self.Animations = {
	 reload = "reload_one_hand",
	 fire = {"shoot1", "shoot2"},
	 fire_dry = {"shoot_empty"},
	 idle = "idle",
	 draw = "draw_one_hand"
	}
	self.DisableSprintViewSimulation = true
    self.NormalHoldType = "pistol"
    self.RunHoldType = "normal"
	self.WMPos = Vector(-1, 2.75, 0.1)
	self.WMAng = Vector(0, 0, 180)
end

function att:detachFunc()
	self.HolsterOnLadder = true
	self.SprintingEnabled = true
	self.ForegripOverride = true
	self.ForegripParent = "null"
    self.MoveType = 2
    self.Animations = {
	 reload = "reload1",
	 fire = {"shoot1", "shoot2"},
	 fire_dry = {"shoot_empty"},
	 idle = "idle",
	 draw = "draw"
	}
	self.DisableSprintViewSimulation = false
    self.NormalHoldType = "shotgun"
    self.RunHoldType = "passive"
	self.WMPos = Vector(-1, 2.75, 0.55)
	self.WMAng = Vector(0, 0, 180)
end

CustomizableWeaponry:registerAttachment(att)