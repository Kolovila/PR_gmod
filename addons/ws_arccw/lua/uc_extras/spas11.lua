if SERVER then AddCSLuaFile() end
return function(SWEP)
 local model = "models/weapons/arccw/c_ur_spas11.mdl"
 SWEP.AttachmentElements.ux_spas11_kit = {
  VMElements = {{Model = model, BoneMerge = true, Bone = "spas_parent", Bodygroups = "00", Offset = {pos = Vector(), ang = Angle()}}},
  AttPosMods = {[3] = {vpos = Vector(0.000000000,26.755340000,-0.428837000), vang = Angle(90,-90,-90)}}
 }
 SWEP.AttachmentElements.ux_spas11_hook = {}
 SWEP.AttachmentElements.ux_spas11_brace = {}
 for _,slot in ipairs({1,4,5,6,7,8,16}) do
  local a=SWEP.Attachments[slot]
  if a then
   a.ExcludeFlags=a.ExcludeFlags or {}
   table.insert(a.ExcludeFlags,"ux_spas11_integral")
  end
 end
 local previous=SWEP.Hook_ModifyBodygroups
 SWEP.Hook_ModifyBodygroups=function(wep,data)
  if previous then previous(wep,data) end
  local installed=wep.Attachments[2].Installed=="ux_ur_spas12_barrel_spas11"
  if installed and IsValid(data.vm) then
   data.vm:SetBodygroup(0,6);data.vm:SetBodygroup(1,6)
   data.vm:SetBodygroup(2,4);data.vm:SetBodygroup(3,3);data.vm:SetBodygroup(4,0)
   wep.MuzzleEffectAttachment = 5
  end
  local brace=1
  for _,name in pairs(data.eles or wep:GetActiveElements()) do if name=="ux_spas11_brace" then brace=2 end end
  for _,entry in pairs((data.wm and wep.WM or wep.VM) or {}) do
   if IsValid(entry.Model) and entry.Model:GetModel()==model then
    entry.Model:SetBodygroup(0,0)
    entry.Model:SetBodygroup(1,installed and brace or 0)
   end
  end
 end
end
