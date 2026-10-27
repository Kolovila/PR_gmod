local att = {}
att.name = "md_eft_fl_x400"
att.displayName = "X400 tactical flashlight"
att.displayNameShort = "X400"

att.statModifiers = {VelocitySensitivityMult = -0.1,
OverallMouseSensMult = -0.05,
HipSpreadMult = -0.2,
DrawSpeedMult = -0.1,
MaxSpreadIncMult = -0.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_x400")
	att.description = {
		[1] = {t = "[impulse 100] cycles through modes.", c = CustomizableWeaponry.textColors.REGULAR},
		[2] = {t = "Uses LAM/LEM colors.", c = CustomizableWeaponry.textColors.REGULAR},
	}

	local rgb = {"r","g","b","a"}
	local mode, laserAtt, lightAtt

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end

		-- mode = self.dt.INS2LAMMode
		mode = self:GetNWInt("INS2LAMMode")

		if self.AttachmentModelsVM[att.name] then
			laserAtt = self.AttachmentModelsVM[att.name].ent:GetAttachment(1)
			lightAtt = self.AttachmentModelsVM[att.name].ent:GetAttachment(1)
		else
			laserAtt = self.AttachmentModelsVM["kk_ins2_lam"].ent:GetAttachment(1)
			lightAtt = self.AttachmentModelsVM["kk_ins2_flashlight"].ent:GetAttachment(1)
		end

		if (mode % 2) == 1 then
			CustomizableWeaponry.registeredAttachmentsSKey["kk_ins2_lam"]._elementRender(self, laserAtt)
		else
			self.lastLaserPos = nil
		end

		-- if mode > 1 then
			-- CustomizableWeaponry_KK.ins2.flashlight.v2.elementRender(self, lightAtt)
		-- end

		CustomizableWeaponry_KK.ins2.flashlight.v6.elementRender(self, lightAtt)
	end

	// for V6 LEM, true - ON, false - OFF
	function att:getLEMState()
		-- return (self.dt.INS2LAMMode > 1)
		return (self:GetNWInt("INS2LAMMode") > 1)
	end
end

function att:attachFunc()
	-- CustomizableWeaponry_KK.ins2.flashlight.v2.attach(self)
	CustomizableWeaponry_KK.ins2.flashlight.v6.attach(self, att)

	if CLIENT then
		if not self.AttachmentModelsVM[att.name] then
			self.AttachmentModelsVM["kk_ins2_flashlight"].active = true
			self.AttachmentModelsVM["kk_ins2_lam"].active = true
		end
	end
end

function att:detachFunc()
	-- CustomizableWeaponry_KK.ins2.flashlight.v2.detach(self)
	CustomizableWeaponry_KK.ins2.flashlight.v6.detach(self, att)

	if CLIENT then
		if not self.AttachmentModelsVM[att.name] then
			self.AttachmentModelsVM["kk_ins2_flashlight"].active = false
			self.AttachmentModelsVM["kk_ins2_lam"].active = false
		end
	end
end

CustomizableWeaponry:registerAttachment(att)
