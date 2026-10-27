--[[ attachment table structure:
1st index - table, which contains 1 table and 1 var: atts - the attachments table, last - the integer which indicates the last attachment which was attached
]]--
SWEP.AttachSoundDelay = 0

function SWEP:_attach( cur, curPos, inherit )
	self.LastPreset = nil
	local attTable = self.Attachments[cur]

	if SERVER and IsValid(self.Owner) then
		umsg.Start("CW20_ATTACH") --, self.Owner)
			umsg.Entity(self)
			umsg.String(cur)
			umsg.Short(curPos)
		umsg.End()
	end

	local att = inherit or CustomizableWeaponry:findAttachment(attTable.atts[curPos])

	if not att then
		return false
	end

	CustomizableWeaponry.callbacks.processCategory(self, "preAttachAttachment", cur, curPos)

	local lastIsSight = false
	
	if attTable.last then
		local last = attTable.atts[attTable.last]

		if CLIENT then
			local prevAttachmentData = CustomizableWeaponry:findAttachment(last)
			
			-- remove telescopics FOV range if the detached attachment is a sight
			if prevAttachmentData.isSight then
				self.newTelescopicsFOV = nil
				
				if prevAttachmentData.telescopicsFOVRange then
					self:setTelescopicsFOVRange(nil)
				end
			end
			
			if self.AttachmentModelsVM and self.AttachmentModelsVM[last] then
				self.AttachmentModelsVM[last].active = false
			end

			if self.AttachmentModelsWM and self.AttachmentModelsWM[last] then
				self.AttachmentModelsWM[last].active = false
			end
		end

		self:_detach(cur, attTable.last, true)
	end

	self:addStatModifiers(att.statModifiers)
	self.ActiveAttachments[att.name] = true
	self:checkAttachmentDependency()

	for varName, data in pairs(CustomizableWeaponry.knownVariableTexts) do
		if att[varName] then
			data.attachCallback(self, att)
		end
	end

	if att.attachFunc then
		att.attachFunc(self)
	end

	if att.isAltmode then
		self:attachAltmode()
	end

	if att.isHybrid then
		self:attachHybrid()
	end

	-- custom skin
	if att.skin then
		self:applySkin( att.skin )
	elseif att.camo then
		self:applyCamo( att.camo )
	end

	if CLIENT then
		-- if there is a model with the provided name, make it visible
		if self.AttachmentModelsVM then
			local model = self.AttachmentModelsVM[attTable.atts[curPos]]

			if model then
				model.active = true

				-- apply the default skin
				--[[
				if att.defaultSkin and not model.skinned then
					-- get the actual materials from a table of the attachment
					for i,mname in ipairs(att.Skins[1]) do
						if mname ~= "" then
							model.ent:SetSubMaterial( i-1, mname )
						end
					end
				end
				]]
			end

			-- if we're using a rail in conjunction with sights, make it visible upon attachment
			if att.isSight then
				self.newTelescopicsFOV = att.newTelescopicsFOV
				
				if att.telescopicsFOVRange then
					self:setTelescopicsFOVRange(att.telescopicsFOVRange, att.simpleTelescopicsFOVRange)
				end
				self.AimPos = self[att.aimPos[1]]
				self.AimAng = self[att.aimPos[2]]
				self.ZoomAmount = att.FOVModifier or self.ZoomAmount

				--if the current attachment has backup sights, we can swap to them

				self.ActualSightPos = self.AimPos
				self.ActualSightAng = self.AimAng

				if self.BackupSights then
					local backUp = self.BackupSights[att.name]
					
					if backUp then						
						self.SightBackUpPos = backUp[1]
						self.SightBackUpAng = backUp[2]
						
						self.aimPosBackUp = backUp.aimPosBackUp
					else
						self.SightBackUpPos = nil
						self.SightBackUpAng = nil
						
						self.aimPosBackUp = nil
					end
				end

				if self.SightWithRail then
					-- if the attachment disallows display of a rail, turn it off, otherwise, turn it on
					local state

					if att.withoutRail then
						state = false
					else
						state = true
					end

					local rail = self.AttachmentModelsVM.md_rail

					if rail then
						rail.active = state
					end

					if state then
						if self.RailBGs then
							self:setBodygroup(self.RailBGs.main, self.RailBGs.on)
						end
					else
						if self.RailBGs then
							self:setBodygroup(self.RailBGs.main, self.RailBGs.off)
						end
					end
				end

				-- apply this attachment's reticle draw function, if it has it
				self.reticleFunc = att.drawReticle
				self.renderTargetFunc = att.drawRenderTarget

				if not att.isBG then
					if self.SightBGs and self.SightBGs.none then
						self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
					end
				end
			end

			if att.elementRender then
				self.elementRender[att.name] = att.elementRender
			end
		end

		-- if there's a worldmodel with the same name, make it visible
		if self.AttachmentModelsWM then
			local model = self.AttachmentModelsWM[attTable.atts[curPos]]

			if model then
				model.active = true
			end
		end
	end

	attTable.last = curPos

	if CLIENT then
		self:updateAttachmentPositions()
	end

	self:recalculateStats()

	CustomizableWeaponry.callbacks.processCategory(self, "postAttachAttachment", cur, curPos)

	return true
end

function SWEP:attachAltmode()
	self.Secondary.ClipSize		= self.Altmode.ClipSize
	self.Secondary.DefaultClip	= self.Altmode.DefaultClip
	self.Secondary.Ammo			= self.Altmode.Ammo

	local ammo = self.Owner:GetAmmoCount(self.Secondary.Ammo)
	self:SetClip2( math.Clamp(self.Secondary.DefaultClip, 0, ammo) )
	self.hasAltmode = true
end

function SWEP:attachHybrid()
	self.hasHybrid = true
	self.HybridOn = true
end

function SWEP:detachHybrid()
	self.hasHybrid = nil
	self.HybridOn = nil

	-- make sure animations are correct when taking it off
	self.Animations = self.Animations_Normal
end

function SWEP:applySkin( skin )
	skin = skin or 1

	-- make sure the weapon has skins
	if not self.Skins then
		return
	end

	-- get the materials from the table
	local materials = self.Skins[skin]
	if materials then
		if SERVER then		-- NOTE this is in here so we only set the currentskin, if materials were found
			self.dt.CurrentSkin = (skin == 1) and "" or skin
		else
			-- apply the skin to the worldmodel
			for i,mname in ipairs(materials) do
				if self.WMEnt2 then
					self.WMEnt2:SetSubMaterial( i-1, mname )
				end
				self.WMEnt:SetSubMaterial( i-1, mname )
			end

			-- try to override it with the SkinsVM table, if defined
			if self.SkinsVM and self.SkinsVM[skin] then
				materials = self.SkinsVM[skin]
			end

			-- apply the skin to the weapon
			for i,mname in ipairs(materials) do
				self.CW_VM:SetSubMaterial( i-1, mname )
				if self.CW_VM2 then
					self.CW_VM2:SetSubMaterial( i-1, mname )
				end
			end

			-- apply the skin to any applicable attachments as well
			for k,v in pairs(self.AttachmentModelsVM) do
				-- get the attachments data
				local adata = CustomizableWeaponry:findAttachment( k )

				-- apply skins, if the attachment has any
				if adata.Skins then
					-- apply the skin to the viewmodel
					local vmodel = self.AttachmentModelsVM[k]
					if vmodel then
						-- attempt to get the skin materials
						local amats
						if skin == 1 and adata.defaultSkin then
							amats = adata.SkinsVM and adata.SkinsVM[adata.defaultSkin] or adata.Skins[adata.defaultSkin]
						else
							amats = adata.SkinsVM and adata.SkinsVM[skin] or adata.Skins[skin]
						end

						-- apply the skin materials
						if amats then
							-- go through the materials and apply them
							for i,mname in ipairs(amats) do
								if mname ~= "" then
									vmodel.ent:SetSubMaterial( i-1, mname )
								end
							end
						--	vmodel.skinned = true
						end
					end

					-- apply the skin to the worldmodel
					local wmodel = self.AttachmentModelsWM[k]
					if wmodel then
						-- attempt to get the skin materials
						local amats
						if skin == 1 and adata.defaultSkin then
							amats = adata.Skins[adata.defaultSkin]
						else
							amats = adata.Skins[skin]
						end

						-- apply the skin materials
						if amats then
							-- go through the materials and apply them
							for i,mname in ipairs(amats) do
								if mname ~= "" then
									wmodel.ent:SetSubMaterial( i-1, mname )
								end
							end
						--	wmodel.skinned = true
						end
					end
				end		-- adata.Skins
			end
		end
	end
end

---Applies the given camo to the weapon
--	@table camo The camo data to apply to the weapon, nil to remove
function SWEP:applyCamo( camo )
	-- NOTE this is here because gmod fucks up the custom materials when a map is reloaded
	local forceMaterialCreation = true

	---Creates a copy of the given material and apply the given camo values
	--	@string mtl_name Name of the original material
	--	@string camo_name Name of the camo texture
	--	@number camo_scale Number of times to apply the camo texture onto the base texture
	--	@number camo_blend Blend amount for the camo texture
	local function createCamoMaterial( mtl_name, camo_name, camo_scale, camo_blend )
		local cmtl_name = mtl_name .."_".. camo_name
		-- list of textures to copy from the original
		local textures = { "$basetexture", "$bumpmap", "$phongexponenttexture" }
		-- get the original material
		local orig_mtl = Material( mtl_name )
		local orig_val = orig_mtl:GetKeyValues()
		-- create a values table for the new material
		local mvals = {		-- manual material values
			['$model'] = 1, 
			['$phong'] = 1, 
			['$phongboost'] = orig_mtl:GetFloat( "$phongboost" ),
			['$phongexponent'] = orig_mtl:GetFloat( "$phongexponent" ),
			['$normalmapalphaphongmask'] = 1, 
			
			['$envmap'] = "env_cubemap",
			['$normalmapalphaenvmapmask'] = 1,
		}

		-- create the camo material (or get the old one, if it's already been created)
		material = CreateMaterial( cmtl_name, "VertexLitGeneric", mvals )

		-- for some reason vector values won't work in create material, set manually
		material:SetVector( "$phongfresnelranges", orig_mtl:GetVector( "$phongfresnelranges" ) )
		material:SetVector( "$envmaptint", orig_mtl:GetVector( "$envmaptint" ) )

		-- copy over the textures from the original material
		for j,tname in ipairs(textures) do
			material:SetTexture( tname, orig_mtl:GetTexture( tname ) )
		end

		-- apply the detail texture given as camo value
		material:SetTexture( "$detail", camo_name )
		material:SetInt( "$detailscale", camo_scale )
		material:SetFloat( "$detailblendfactor", camo_blend )
		material:SetInt( "$detailblendmode", 4 )	-- always use 4, which will blend the camo onto the original texture
	end

	---Applies the given camo to the given model
	--	@entity model The model to apply the camo to
	--	@table camo The camo data or nil to remove camo
	--	@table surfaces A table representing the surfaces on the model to apply camo to
	local function applyCamoToModel( model, camo, surfaces )
		if not model then
			return
		end

		-- get all materials from the model
		materials = model:GetMaterials()
		for i,mtl_name in ipairs(materials) do
			-- reset all materials to the original, if we got no camo data
			if not camo then
				model:SetSubMaterial( i-1, nil )
			else
				if (not surfaces or surfaces[i]) and mtl_name and mtl_name ~= "___error" then
					-- construct the material name and try to get the camo material
					local cmtl_name = "!".. mtl_name .."_".. camo.name
					local material = Material( cmtl_name )
					-- create a new material if it wasn't found
					if material:IsError() or forceMaterialCreation then
						createCamoMaterial( mtl_name, camo.name, camo.scale, camo.blendfactor )
					end

					-- apply the camo material to the model
					model:SetSubMaterial( i-1, cmtl_name )
				end
			end
		end
	end

	-- apply default camo where applicable
	if not camo and self.DefaultCamo then
		camo = self.DefaultCamo
	end

	if SERVER then
		-- TODO Do we need to set the camo value into a networked value?
	else
		-- prepare worldmodel surfaces
		local surfaces = false
		if self.CamoSurfaces then
			-- the weapon has a table with the surface ids but we need them as table keys, convenience for weapon creator
			surfaces = {}
			for i in ipairs(self.CamoSurfaces) do
				surfaces[i] = true
			end
		end

		-- apply camo to weapon worldmodel
		applyCamoToModel( self.WMEnt, camo, surfaces )

		-- prepare viewmodel surfaces
		if self.CamoSurfacesVM then
			surfaces = {}
			for i in ipairs(self.CamoSurfaces) do
				surfaces[i] = true
			end
		end

		-- apply camo to the viewmodel
		applyCamoToModel( self.CW_VM, camo, surfaces )

		-- also apply camo to dual wield weapon
		if self.CW_VM2 then
			applyCamoToModel( self.CW_VM2, camo, surfaces )
		end

		-- apply the camo to any applicable attachments as well
		for k,v in pairs(self.AttachmentModelsVM) do
			-- get the attachments data
			local adata = CustomizableWeaponry:findAttachment( k )

			-- apply camo, if the attachment has any camo surfaces
			-- NOTE we need camo surfaces as optics will just break when camo is applied everywhere
			if adata.CamoSurfaces then
				local surfaces = {}
				for i in ipairs(adata.CamoSurfaces) do
					surfaces[i] = true
				end

				-- apply the camo to the attachment worldmodel
				applyCamoToModel( self.AttachmentModelsWM[k].ent, camo, surfaces )

				-- prepare additional surfaces for the viewmodel, if any
				if adata.CamoSurfacesVM then
					surfaces = {}
					for i in ipairs(adata.CamoSurfaces) do
						surfaces[i] = true
					end
				end

				-- apply the camo to the attachment viewmodel
				applyCamoToModel( self.AttachmentModelsVM[k].ent, camo, surfaces )
			end
		end
	end
end		-- SWEP:applyCamo

function SWEP:resetPostDetach(att, attCategory)
	-- reset things like aim FOV and reticle functions in case the detached attachment is a sight
	local attName = attCategory.atts[attCategory.last]

	CustomizableWeaponry.callbacks.processCategory(self, "preDetachAttachment", att, attCategory)

	if att.isSight then
		self.ZoomAmount = self.ZoomAmount_Orig
		self.reticleFunc = nil

		if self.SightWithRail then
			if self.AttachmentModelsVM.md_rail then
				-- make the rail inactive in case the weapon uses it for the sights
				self.AttachmentModelsVM.md_rail.active = false
			end

			if self.RailBGs then
				self:setBodygroup(self.RailBGs.main, self.RailBGs.off)
			end
		end

		if self.SightBGs and self.SightBGs.none then
			self:setBodygroup(self.SightBGs.main, 0)
		end

		if CLIENT then
			self:resetAimToIronsights()
		end
	end

	if CLIENT then
		-- make attachment models inactive
		if self.AttachmentModelsVM and self.AttachmentModelsVM[attName] then
			self.AttachmentModelsVM[attName].ent:SetBodygroup(0, 0) -- when removed, reset to neutral bodygroup
			self.AttachmentModelsVM[attName].active = false
		end

		if self.AttachmentModelsWM and self.AttachmentModelsWM[attName] then
			self.AttachmentModelsWM[attName].ent:SetBodygroup(0, 0) -- when removed, reset to neutral bodygroup
			self.AttachmentModelsWM[attName].active = false
		end

		-- remove any rendering functions it might have had
		self.elementRender[att.name] = nil
	end

	self.ActiveAttachments[att.name] = false
	attCategory.last = nil

	CustomizableWeaponry.callbacks.processCategory(self, "postDetachAttachment", att, attCategory)
end

function SWEP:_detach(category, pos, skipDependencyCheck)
	self.LastPreset = nil
	local att = self.Attachments[category]

	local foundAtt = CustomizableWeaponry:findAttachment(att.atts[pos])

	self:removeStatModifiers(foundAtt.statModifiers)

	for varName, data in pairs(CustomizableWeaponry.knownVariableTexts) do
		if foundAtt[varName] then
			data.detachCallback(self, foundAtt)
		end
	end

	if foundAtt.detachFunc then
		foundAtt.detachFunc(self)
	end

	if foundAtt.isAltmode then
		self:detachAltmode()
	end

	if foundAtt.isHybrid then
		self:detachHybrid()
	end

	self:resetPostDetach(foundAtt, att)

	-- only skip the dependency check if we're told to do so
	if not skipDependencyCheck then
		self:checkAttachmentDependency()
	end

	self:recalculateStats()

	-- remove custom skin
	if foundAtt.skin then
		self:applySkin( self.defaultSkin )
	elseif foundAtt.camo then
		self:applyCamo()
	end

	if CLIENT then
		self:updateAttachmentPositions()
	end
end

function SWEP:detachAltmode()
	if self.dt.AltActive then
		self:disableAltmode()
		if SERVER and SP then
			SendUserMessage( "CW20_ALTMODEOFF", self.Owner )
		end
	end

	self.hasAltmode = nil

	self.Secondary.ClipSize 	= -1
	self.Secondary.DefaultClip	= -1
	self.Secondary.Ammo			= "none"
end

function SWEP:detachAll()
	for k, v in pairs(self.Attachments) do
		if v.last then
			self:_detach(k, v.last)
		end
	end

	if SERVER then
		umsg.Start("CW20_DETACHALL") --, self.Owner)
			umsg.Entity(self)
		umsg.End()

		--SendUserMessage("CW20_DETACHALL", self.Owner)
	end
end

function SWEP:countActiveAttachments()
	local amount = 0

	for k, v in pairs(self.ActiveAttachments or att.ActiveAttachments) do
		if v then
			amount = amount + 1
		end
	end

	return amount
end

-- this function is used when you just want to check whether an attachment of some kind can be attached
-- honestly this is some spaghetti point at this point, rip
-- ideally I should rewrite the entire base AGAIN, but fuck that lmao
function SWEP:canAttachSpecificAttachment(attachmentName, ply, imaginaryAttachments, imaginaryActiveAttachments, lookIn, attachmentCategoryData)
	local state, failureId, extraData = self:_canAttachSpecificAttachment(attachmentName, ply, imaginaryAttachments, imaginaryActiveAttachments, lookIn, attachmentCategoryData)
	local newState, newResult, newFailureId = CustomizableWeaponry.callbacks.processCategory(self, "canAttachSpecificAttachment", ply, attachmentName, state, result, failureId)

	if newState ~= nil then
		state = newState
	end

	if newResult ~= nil then
		result = newResult
	end

	if newFailureId ~= nil then
		failureId = newFailureId
	end

	return state, result, failureId
end

function SWEP:_canAttachSpecificAttachment(attachmentName, ply, imaginaryAttachments, imaginaryActiveAttachments, lookIn, attachmentCategoryData)
	ply = ply or self.Owner

	local result, failureID = nil

	if not attachmentCategoryData then
		for category, data in pairs(self.Attachments) do
			for key, attachment in ipairs(data.atts) do
				if attachment == attachmentName then
					attachmentCategoryData = data
					break
				end
			end
		end
	end

	result, failureID = self:performAttachmentEligibilityCheck(attachmentCategoryData, attachmentName, ply, imaginaryAttachments, imaginaryActiveAttachments, lookIn)

	return result, failureID
end

function SWEP:performAttachmentEligibilityCheck(attachmentCategoryData, attachmentName, playerObject, attachmentList, activeAttachmentList, playerOwnedAttachmentList)
	local att = CustomizableWeaponry.registeredAttachmentsSKey[attachmentName]

	if att.dependencies then
		local can, dependency = CustomizableWeaponry.canBeAttached(self, att, attachmentList)

		if not can then
			return false, self.UnavailableAttachmentEnum.NEED_ATTACHMENTS, dependency
		end
	end

	if attachmentCategoryData.exclusions then
		local has, exclusion = self:hasExcludedAttachment(attachmentCategoryData.exclusions, activeAttachmentList)

		if has then
			return true, self.UnavailableAttachmentEnum.INCOMPATIBILITY, exclusion
		end
	end

	-- checking whether it has dependencies or not saves us a loop
	if CustomizableWeaponry:hasAttachment(playerObject, att.name, playerOwnedAttachmentList) then
		local can, result, returnData = self:isAttachmentEligible(att.name, activeAttachmentList)

		if not can then
			return false, (result == self.AttachmentEligibilityEnum.ACTIVE_ATTACHMENT_EXCLUSION and self.UnavailableAttachmentEnum.INCOMPATIBLE_ATTACHMENT_PRESENT or self.UnavailableAttachmentEnum.DEPENDENT_ATTACHMENT_NOT_PRESENT), returnData -- -3 exclusion; -4 dependency
		end

		local can, result, returnData = self:isCategoryEligible(attachmentCategoryData.dependencies, attachmentCategoryData.exclusions, activeAttachmentList)

		if not can then
			return false, (result == self.AttachmentEligibilityEnum.ACTIVE_ATTACHMENT_EXCLUSION and self.UnavailableAttachmentEnum.INCOMPATIBLE_CATEGORY_PRESENT or self.UnavailableAttachmentEnum.DEPENDENT_CATEGORY_NOT_PRESENT), returnData -- -5 exclusion; -6 dependency
		end

		return true
	else
		return false, self.UnavailableAttachmentEnum.PLAYER_DOES_NOT_HAVE_ATTACHMENT
	end

	return false, self.UnavailableAttachmentEnum.MISC_FAILURE
end

if CLIENT then
	local function CW20_ATTACH(um)
		local wep = um:ReadEntity()
		local category = um:ReadString()
		local pos = um:ReadShort()

		local numberCategory = tonumber(category)

		if numberCategory then
			category = numberCategory
		end

		local ply = LocalPlayer()

		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end

		if wep:_attach(category, pos) then
			if CustomizableWeaponry.playSoundsOnInteract and ply == wep.Owner then
				if CurTime() > wep.AttachSoundDelay then
					surface.PlaySound("cw/attach.wav")
					wep.AttachSoundDelay = CurTime() + FrameTime() * 3
				end
			end
		end
	end

	usermessage.Hook("CW20_ATTACH", CW20_ATTACH)

	local function CW20_DETACH(um)
		local wep = um:ReadEntity()
		local category = um:ReadString()
		local pos = um:ReadShort()

		local numberCategory = tonumber(category)

		if numberCategory then
			category = numberCategory
		end

		local ply = LocalPlayer()

		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end

		wep:_detach(category, pos)

		if CustomizableWeaponry.playSoundsOnInteract and ply == wep.Owner then
			if CurTime() > wep.AttachSoundDelay then
				surface.PlaySound("cw/detach.wav")
				wep.AttachSoundDelay = CurTime() + FrameTime() * 3
			end
		end
	end

	usermessage.Hook("CW20_DETACH", CW20_DETACH)

	local function CW20_DETACHALL(data)
		local ply = LocalPlayer()
		local wep = data:ReadEntity()

		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end

		CustomizableWeaponry.colorableParts.resetColors(wep)
		wep:detachAll(category, pos)
	end

	usermessage.Hook("CW20_DETACHALL", CW20_DETACHALL)

	local function CW20_PRESETSUCCESS(um)
		local presetName = um:ReadString()

		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()

		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end

		CustomizableWeaponry.preset.postLoad(wep, presetName)
		wep.LastPreset = presetName
	end

	usermessage.Hook("CW20_PRESETSUCCESS", CW20_PRESETSUCCESS)

	local function CW20_PRESETDETACH(um)
		if CustomizableWeaponry.playSoundsOnInteract then
			surface.PlaySound("cw/detach.wav")
		end
	end

	usermessage.Hook("CW20_PRESETDETACH", CW20_PRESETDETACH)
end
