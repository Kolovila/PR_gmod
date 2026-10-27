local reg = debug.getregistry()
local GetActiveWeapon = reg.Player.GetActiveWeapon
local GetDTFloat = reg.Entity.GetDTFloat
local GetRunSpeed = reg.Player.GetRunSpeed
local GetWalkSpeed = reg.Player.GetWalkSpeed
local GetCrouchedWalkSpeed = reg.Player.GetCrouchedWalkSpeed
local Crouching = reg.Player.Crouching

local wep

function CW_Move(ply, m)
	if Crouching(ply) then
		wep = GetActiveWeapon(ply)
		
		if IsValid(wep) and wep.CW20Weapon then
			if wep.dt and wep.dt.State == CW_AIMING then
				-- Get the current ADS speed multiplier, check attachments first, then fall back to weapon default
				local aimSpeedMult = wep.ADSSpeedMult and wep.ADSSpeedMult.crouch or 0.5
				
				-- Check if there's an active sight attachment with its own multiplier
				if wep.ActiveAttachments then
					for attName, isActive in pairs(wep.ActiveAttachments) do
						if isActive then
							local attData = CustomizableWeaponry:findAttachment(attName)
							if attData and attData.isSight and attData.ADSSpeedMult and attData.ADSSpeedMult.crouch then
								aimSpeedMult = attData.ADSSpeedMult.crouch
								break
							end
						end
					end
				end
				
				m:SetMaxSpeed((GetWalkSpeed(ply) * GetCrouchedWalkSpeed(ply) - wep.SpeedDec * aimSpeedMult))
			end
		end
	else
		wep = GetActiveWeapon(ply)
		
		if IsValid(wep) and wep.CW20Weapon then
			if wep.dt and wep.dt.State == CW_AIMING then
				-- Get the current ADS speed multiplier, check attachments first, then fall back to weapon default
				local aimSpeedMult = wep.ADSSpeedMult and wep.ADSSpeedMult.standing or 0.75
				
				-- Check if there's an active sight attachment with its own multiplier
				if wep.ActiveAttachments then
					for attName, isActive in pairs(wep.ActiveAttachments) do
						if isActive then
							local attData = CustomizableWeaponry:findAttachment(attName)
							if attData and attData.isSight and attData.ADSSpeedMult and attData.ADSSpeedMult.standing then
								aimSpeedMult = attData.ADSSpeedMult.standing
								break
							end
						end
					end
				end
				
				m:SetMaxSpeed((GetWalkSpeed(ply) - wep.SpeedDec) * aimSpeedMult)
			else
				m:SetMaxSpeed(GetRunSpeed(ply) - wep.SpeedDec)
			end
		else
			m:SetMaxSpeed(GetRunSpeed(ply))
		end
	end
end

hook.Add("Move", "CW_Move", CW_Move)

function CW_StartCommand(ply, ucmd)
	local wep = GetActiveWeapon(ply)
	
	if IsValid(wep) and wep.CW20Weapon then
        if wep == wep.SwitchWep then
            wep.SwitchWep = nil
        end
		
		local switchTo = wep.SwitchWep
		
		if IsValid(switchTo) then
			ucmd:SelectWeapon(switchTo)
		else
			wep.SwitchWep = nil
		end
	end
end

hook.Add("StartCommand", "CW_StartCommand", CW_StartCommand)