CustomizableWeaponry:registerRecognizedVariable("MuzzleVelocity", "Decreases bullet velocity by ", "Increases bullet velocity by ", CustomizableWeaponry.textColors.NEGATIVE, CustomizableWeaponry.textColors.POSITIVE, 
	function(weapon, attachmentData)
		weapon.MuzzleVelocity= weapon.MuzzleVelocity + attachmentData.MuzzleVelocity
	end,
	
	function(weapon, attachmentData)
		weapon.MuzzleVelocity= weapon.MuzzleVelocity - attachmentData.MuzzleVelocity
	end,
	
	-- attachmentData is the current attachment
	-- value is the value of the variable
	-- varData is the variable data we’re registering with registerRecognizedVariable
	function(attachmentData, value, varData)
		if value > 0 then
			return varData.greater .. math.abs(value) .. " points", varData.greaterColor
		end
		
	return varData.lesser .. math.abs(value) .. " points", varData.lesserColor
end)