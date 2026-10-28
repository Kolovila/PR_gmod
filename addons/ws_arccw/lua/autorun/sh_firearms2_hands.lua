
CreateClientConVar("arccw_fas2_handskin", "1", true, true)
CreateClientConVar("arccw_fas2_gloveskin", "1", true, true)
CreateClientConVar("arccw_fas2_sleeveskin", "1", true, true)
CreateClientConVar("arccw_fas2_handrig", "0", true, true)
CreateClientConVar("arccw_fas2_headbob_intensity", "1", true, true)
CreateClientConVar("arccw_fas2_bolting", "1", true, true)

NumberToTexture = {[1] = "models/weapons/fas2/hands/hand",
	[2] = "models/weapons/fas2/hands/hand_tan",
	[3] = "models/weapons/fas2/hands/hand_black",
	[4] = "models/weapons/fas2/hands/hand_camo"}
	
NumberToGlove = {[1] = "models/weapons/fas2/hands/nomex",
	[2] = "models/weapons/fas2/hands/black",
	[3] = "models/weapons/fas2/hands/desertkhaki",
	[4] = "models/weapons/fas2/hands/multicam",
	[5] = "models/weapons/fas2/hands/green"}
	
NumberToSleeve = {[1] = "models/weapons/fas2/hands/sleeve",
	[2] = "models/weapons/fas2/hands/sleeve2",
	[3] = "models/weapons/fas2/hands/sleeve3",
	[4] = "models/weapons/fas2/hands/sleeve4"}

if CLIENT then
	local cvar
	local ArcCW_HandMat = Material("models/weapons/fas2/hands/hand")
	local ArcCW_HandMat2 = Material("models/weapons/fas2/hands/hand")
	local ArcCW_GloveMat, ArcCW_GloveMat2 = Material("models/weapons/fas2/hands/nomex"), Material("models/weapons/fas2/hands/nomex")
	local ArcCW_SleeveMat, ArcCW_SleeveMat2 = Material("models/weapons/fas2/hands/sleeve"), Material("models/weapons/fas2/hands/sleeve")
    local vm

	local function ArcCW_FAS2_ApplyRigNow(ply, com, args)
		local t = NumberToTexture[GetConVarNumber("arccw_fas2_handskin")]

		ArcCW_HandMat:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/hand")
		ArcCW_HandMat2:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/hand")
		
		local t = NumberToSleeve[GetConVarNumber("arccw_fas2_sleeveskin")]

		ArcCW_SleeveMat:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/sleeve")
		ArcCW_SleeveMat2:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/sleeve")
		
		local t = NumberToGlove[GetConVarNumber("arccw_fas2_gloveskin")]

		ArcCW_GloveMat:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/nomex")
		ArcCW_GloveMat2:SetTexture("$basetexture", t and t or "models/weapons/fas2/hands/nomex")
	end

	concommand.Add("arccw_fas2_handrig_applynow", ArcCW_FAS2_ApplyRigNow)
end