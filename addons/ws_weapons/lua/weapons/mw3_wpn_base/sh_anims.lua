local SP = game.SinglePlayer()

-- lol
function SWEP:sendWeaponAnim( anim, speed, cycle, ret2idle, vm )
	-- what the fuck are you doing without an anim name
	if not anim then
		return
	end

	if self.AimDelay and anim ~= "aim_out" then
		return
	end

	-- make sure we don't set/send nil args
	speed = speed or 1.0
	cycle = cycle or 0.0
	ret2idle = ret2idle or false
	vm = vm or 0
	
	-- prediction is disabled in SP, so just send the anim via UMSG
	if SP and SERVER then
		umsg.Start("CW20_ANIMATE2", self.Owner)
			umsg.String(anim)
			umsg.Float(speed)
			umsg.Float(cycle)
			umsg.Bool(ret2idle)
			umsg.Short(vm)
		umsg.End()

		return
	end

	if self.animCallbacks and self.animCallbacks[anim] then
		self.animCallbacks[anim](self)
	end

	-- in MP just play the anim on the player, clientside

	if CLIENT then
		if anim:find("reload") then
			if self:Clip1() == 0 then
				self.wasEmpty = true

				if self.BoltBoneID and self.DontHoldWhenReloading then
					self:setBoltBonePosition(Vector(0, 0, 0))
				end
			else
				self.wasEmpty = false
			end
		end
	end

	if vm == 0 then
		self:playAnim( anim, speed, cycle, self.CW_VM, ret2idle )
	elseif vm == 1 then
		self:playAnim( anim .. "_right", speed, cycle, self.CW_VM2, ret2idle )
	else
		if self.CW_VM2 then
			self:playAnim( anim .. "_right", speed, cycle, self.CW_VM2, ret2idle )
		end
		self:playAnim( anim, speed, cycle, self.CW_VM, ret2idle )
	end
end

function SWEP:playAnim(anim, speed, cycle, ent, ret2idle )
	ent = ent or self.CW_VM
	cycle = cycle or 0
	speed = speed or 1

	-- DEBUG
--	print( "playAnim: ".. anim )
	-- DEBUG END --

	local foundAnim = anim

	if ent and (ent == self.CW_VM or ent == self.CW_VM2) then
		foundAnim = self.Animations[anim]

		if not foundAnim then
			return
		end

		if type(foundAnim) == "table" then
			foundAnim = table.Random(foundAnim)
		end

		if self.Sounds[foundAnim] then
			if ent == self.CW_VM2 then
				self:setCurSoundTable2(self.Sounds[foundAnim], speed, cycle, foundAnim)
			else
				self:setCurSoundTable(self.Sounds[foundAnim], speed, cycle, foundAnim)
			end
		else
			if ent == self.CW_VM2 then
				self:removeCurSoundTable2()	
			else
				self:removeCurSoundTable()
			end
		end
	end

	if SERVER then
		return
	end

	ent:ResetSequence(foundAnim)

	if cycle > 0 then
		ent:SetCycle(cycle)
	else
		ent:SetCycle(0)
	end

	ent:SetPlaybackRate(speed)

	-- get a name for the entity
	local e_name = ent:GetModel()

	-- cancel existing idle return timers for the entity
	if timer.Exists("CW2_IDLERETURN"..e_name) then
		timer.Remove("CW2_IDLERETURN"..e_name)
	end

	-- return to idle after the animation
	if ret2idle then
		-- prevent an infinite loop
		if anim == "idle" or anim == "idle_empty" or anim == "alt_idle" then
			return
		end

		-- get the lenght of the animation and create a timer
		local animLen = ent:SequenceDuration( foundAnim )/speed
		timer.Create( "CW2_IDLERETURN"..e_name, animLen, 1, function()
			if self and IsValid(self) and not self:isReloading() then
				if self.dt.State == CW_RUNNING then
					if self.dt.AltActive and self.Animations.alt_sprint then
						self:playAnim( "alt_sprint", (self.SprintLoopSpeed or 1), 0, ent )
					else
						if ent == self.CW_VM then
							if self:Clip1() == 0 and self.Animations["sprint_empty"] then
								self:playAnim( "sprint_empty", (self.SprintLoopSpeed or 1), 0, ent )
							else
								self:playAnim( "sprint", (self.SprintLoopSpeed or 1), 0, ent )
							end
						else
							if self:Clip2() == 0 and self.Animations["sprint_empty_right"] then
								self:playAnim( "sprint_empty_right", (self.SprintLoopSpeed or 1), 0, ent )
							else
								self:playAnim( "sprint_right", (self.SprintLoopSpeed or 1), 0, ent )
							end
						end
					end
				else
					if self.dt.AltActive and self.Animations.alt_idle then
						self:playAnim( "alt_idle", (self.IdleAnimSpeed or 1), 0, ent )
					else
						if ent == self.CW_VM then
							if self:Clip1() == 0 and self.Animations["idle_empty"] then
								self:playAnim( "idle_empty", (self.IdleAnimSpeed or 1), 0, ent )
							else
								self:playAnim( "idle", (self.IdleAnimSpeed or 1), 0, ent )
							end
						else
							if self.isDualwield and self.CW_VM2 then
								if self:Clip2() == 0 and self.Animations["idle_empty_right"] then
									self:playAnim( "idle_empty_right", (self.IdleAnimSpeed or 1), 0, ent )
								else
									self:playAnim( "idle_right", (self.IdleAnimSpeed or 1), 0, ent )
								end
							end
						end
					end
				end
			end
		end )
	end
end

function SWEP:setCurSoundTable(animTable, speed, cycle, origAnim)
	local found = 1

	if cycle ~= 0 then
		-- get the length of the animation and relative time to animation
		local animLen = self.CW_VM:SequenceDuration()
		local timeRel = animLen * cycle
		local foundInTable = false

		-- loop through the table, and find the entry which the cycle has not passed yet
		for k, v in ipairs(animTable) do
			if timeRel < v.time then
				found = k
				foundInTable = true
				break
			end
		end

		if not foundInTable then
			found = false
		end
	end

	if found then
		self.CurSoundTable = animTable
		self.CurSoundEntry = found
		self.SoundTime = (CLIENT and UnPredictedCurTime() or CurTime())
		self.SoundSpeed = speed

		if CLIENT then
			if origAnim == self.Animations.draw then
				if self.drawnFirstTime then
					self.SoundTime = self.SoundTime - 0.22
				end

				self.drawnFirstTime = true
			end
		end
	else
		self:removeCurSoundTable()
	end
end

function SWEP:removeCurSoundTable()
	-- wipes all current animation sound table information to turn it off
	self.CurSoundTable = nil
	self.CurSoundEntry = nil
	self.SoundTime = nil
	self.SoundSpeed = nil
end

function SWEP:setCurSoundTable2(animTable, speed, cycle, origAnim)
	local found = 1

	if cycle ~= 0 then
		-- get the length of the animation and relative time to animation
		local animLen = self.CW_VM2:SequenceDuration()
		local timeRel = animLen * cycle
		local foundInTable = false

		-- loop through the table, and find the entry which the cycle has not passed yet
		for k, v in ipairs(animTable) do
			if timeRel < v.time then
				found = k
				foundInTable = true
				break
			end
		end

		if not foundInTable then
			found = false
		end
	end

	if found then
		self.CurSoundTable2 = animTable
		self.CurSoundEntry2 = found
		self.SoundTime2 = (CLIENT and UnPredictedCurTime() or CurTime())
		self.SoundSpeed2 = speed
	else
		self:removeCurSoundTable2()
	end
end

function SWEP:removeCurSoundTable2()
	-- wipes all current animation sound table information to turn it off
	self.CurSoundTable2 = nil
	self.CurSoundEntry2 = nil
	self.SoundTime2 = nil
	self.SoundSpeed2 = nil
end

if CLIENT then
	local function CW20_ANIMATE(um)
		local anim = um:ReadString()
		local speed = um:ReadFloat()
		local cycle = um:ReadFloat()
		local ret2idle = um:ReadBool()
		local vm = um:ReadShort()

		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()

		if not IsValid(wep) then
			return
		end

		if wep.sendWeaponAnim then
			wep:sendWeaponAnim(anim, speed, cycle, ret2idle, vm)
		end
	end

	usermessage.Hook("CW20_ANIMATE2", CW20_ANIMATE)

	local function CW20_EFFECTS( um )
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()

		if not IsValid(wep) or not  wep.CW20Weapon then
			return
		end

		wep:makeFireEffects( um:ReadShort() )
	end

	usermessage.Hook("CW20_EFFECTS2", CW20_EFFECTS)
end
