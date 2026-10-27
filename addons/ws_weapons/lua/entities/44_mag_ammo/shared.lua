ENT.Type = "anim"
ENT.Base = "cw_ammo_ent_base"
ENT.PrintName = ".44 Magnum"
ENT.Author = "Shifty"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "CW 2.0 Ammo"

ENT.CaliberSpecific = true
ENT.AmmoCapacity = 30
ENT.ResupplyAmount = 6
ENT.Caliber = ".44 magnum"
ENT.Model = "models/Items/357ammo.mdl"


-- PR: у автора имя и подпись слиты в одну строку («.44 Magnum, 44») — language.Add падал.
-- .44 Magnum уже есть в CW с баллистикой — не затираем её, иначе револьверы CW теряют дальность
if not CustomizableWeaponry.ammoTypes[".44 Magnum"] then
	CustomizableWeaponry:registerAmmo(".44 Magnum", ".44 Magnum Rounds", 10.9, 32.6)
end