
ENT.Type = "anim"
ENT.Base = "cw_ammo_ent_base"
ENT.PrintName = ".454 Casull"
ENT.Author = "Shifty"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "CW 2.0 Ammo"

ENT.CaliberSpecific = true
ENT.AmmoCapacity = 18
ENT.ResupplyAmount = 6
ENT.Caliber = ".454 casull"
ENT.Model = "models/Items/357ammo.mdl"


-- PR: у автора нет подписи и баллистики патрона — language.Add падал, у ствола не было дальности
if not CustomizableWeaponry.ammoTypes[".454 Casull"] then
	CustomizableWeaponry:registerAmmo(".454 Casull", ".454 Casull Rounds", 11.5, 35)
end