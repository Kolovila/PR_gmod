game.AddParticles("particles/muzzleflashes.pcf")
game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")
game.AddParticles("particles/new_muzzleflashes.pcf")
game.AddParticles("particles/new_muzzleflashes_b.pcf")
game.AddParticles("particles/flashbang.pcf")
game.AddParticles("particles/rocket_fx.pcf")
game.AddParticles("particles/fas_explosions.pcf")
game.AddParticles("particles/ammo.pcf")
game.AddParticles("particles/mortar_fx.pcf")
game.AddParticles("particles/fire_01.pcf")
game.AddParticles("particles/env_effects.pcf")
game.AddParticles("particles/burning_fx.pcf")
game.AddParticles("particles/mortartest.pcf")

--muzzleflashes
PrecacheParticleSystem("muzzleflash_1") -- SKS, RPK
PrecacheParticleSystem("muzzleflash_3") -- RK95, UMP45, (SG552)
PrecacheParticleSystem("muzzleflash_4") -- G36K, (G36C)
PrecacheParticleSystem("muzzleflash_5") -- (M60E3), ASH12
PrecacheParticleSystem("muzzleflash_6") -- M4A1, M16
PrecacheParticleSystem("muzzleflash_ak47") -- AK47
PrecacheParticleSystem("muzzleflash_ak74") -- AK74
PrecacheParticleSystem("muzzleflash_FAMAS") -- FAMAS F1, SG550
PrecacheParticleSystem("muzzleflash_g3") -- G3A3
PrecacheParticleSystem("muzzleflash_m14") -- M14, L85, (M21)
PrecacheParticleSystem("muzzleflash_M3") -- M3S90, MP153
PrecacheParticleSystem("muzzleflash_m79") -- (M79)
PrecacheParticleSystem("muzzleflash_M82") -- (M82)
PrecacheParticleSystem("muzzleflash_MINIMI") -- (MINIMI)
PrecacheParticleSystem("muzzleflash_mp5") -- MP5A5
PrecacheParticleSystem("muzzleflash_none") -- Undefined --
PrecacheParticleSystem("muzzleflash_none_red") -- Undefined --
PrecacheParticleSystem("muzzleflash_none_smoke") -- Undefined --
PrecacheParticleSystem("muzzleflash_OTS") -- P226, (OTS)
PrecacheParticleSystem("muzzleflash_pistol") -- Glock, M1911, (Beretta F92)
PrecacheParticleSystem("muzzleflash_pistol_cleric") -- Vector
PrecacheParticleSystem("muzzleflash_pistol_deagle") -- Deagle, M40A3
PrecacheParticleSystem("muzzleflash_pistol_red") -- PMM
PrecacheParticleSystem("muzzleflash_shotgun") -- Remington 870, SAIGA12K
PrecacheParticleSystem("muzzleflash_slug") -- KS23
PrecacheParticleSystem("muzzleflash_smg") -- L2A3, UZI, (MK7A4), (MAC11)
PrecacheParticleSystem("muzzleflash_smg_bizon") -- Bizon
PrecacheParticleSystem("muzzleflash_suppressed") -- All Rifles
PrecacheParticleSystem("party_spark") -- Undefined --
PrecacheParticleSystem("port_smoke_heavy") -- Undefined --
PrecacheParticleSystem("muzzle_rockets") -- RPG26
PrecacheParticleSystem("muzzleflash_1bb") -- Undefined --
PrecacheParticleSystem("muzzleflash_3bb") -- AK104
PrecacheParticleSystem("muzzleflash_4bb") -- FN P90
PrecacheParticleSystem("muzzleflash_6b") -- FN FAL
PrecacheParticleSystem("muzzleflash_m24") -- M24
PrecacheParticleSystem("muzzleflash_pistol_rbull") -- Raging bull
PrecacheParticleSystem("muzzleflash_SR25") -- SR25, M110
PrecacheParticleSystem("muzzleflash_svd") -- SVD, Kar98K
PrecacheParticleSystem("muzzleflash_vollmer") -- MC51B Vollmer

PrecacheParticleSystem("ammo_box_explosion") --OK

PrecacheParticleSystem("explosion_claymore") -- medium
PrecacheParticleSystem("explosion_HE_claymore") -- big
PrecacheParticleSystem("explosion_grenade") -- medium
PrecacheParticleSystem("explosion_he_grenade") -- big
PrecacheParticleSystem("explosion_m79") -- medium
PrecacheParticleSystem("explosion_HE_m79") -- big
PrecacheParticleSystem("explosion_m79_body") -- playerhit
-- PrecacheParticleSystem("party_fireworks") --
PrecacheParticleSystem("explosion_water") --

PrecacheParticleSystem("fire_vehicle") -- helicrush
PrecacheParticleSystem("explosion") -- heliflyburn

PrecacheParticleSystem("explosion_flashbang") -- medium
PrecacheParticleSystem("explosion_he_flashbang") -- big
PrecacheParticleSystem("HE_smoke_grenade_smoke") -- m18 purple
PrecacheParticleSystem("smoke_grenade_smoke") -- m18 green
PrecacheParticleSystem("artillery_smoke_blue") -- flare
PrecacheParticleSystem("artillery_smoke_red") -- flare
PrecacheParticleSystem("m79_trail") -- 
PrecacheParticleSystem("explosion_mortar") -- 


function AddAmmoType(name, text)
	game.AddAmmoType({name = name})
	
	if CLIENT then
		language.Add(name .. "_ammo", text)
	end
end

--PISTOL
AddAmmoType("9x18mm", "9x18MM")
AddAmmoType("9x19mm", "9x19MM")
AddAmmoType(".45acp", ".45 ACP")
AddAmmoType(".357magnum", ".357 Magnum")
AddAmmoType(".454casull", ".454 Casull")
AddAmmoType(".50ae", ".50AE")

AddAmmoType("9x18mmap", "9x18MM AP")
AddAmmoType("9x19mmap", "9x19MM AP")
AddAmmoType(".45acphs", ".45 ACP HS")
AddAmmoType(".357magnumap", ".357 Magnum AP")
AddAmmoType(".50aeap", ".50AE AP")
AddAmmoType(".454casullap", ".454 Casull AP")



AddAmmoType("9x39mm", "9x39MM")
AddAmmoType("7.62x39mm", "7.62x39MM")
AddAmmoType("5.56x45mm", "5.56x45MM")
AddAmmoType("5.45x39mm", "5.45x39MM")
AddAmmoType("12.7x55mm", "12.7x55MM")
AddAmmoType("5.7x28mm", "5.7x28MM")
AddAmmoType(".50bmg", ".50 BMG")
AddAmmoType("7.62x54mm", "7.62x54MM")
AddAmmoType("7.62x51mm", "7.62x51MM")
AddAmmoType(".338lapua", ".338 Lapua")
AddAmmoType("12gauge", "12 Gauge")
AddAmmoType("12gauge_50bmg", "12 Gauge .50BMG Slug")
AddAmmoType("23x75mm", "23x75MM")
AddAmmoType("23x75mmap", "23x75MM S-25")
AddAmmoType("23x75mmzvezda", "23x75MM Zvezda")

--ADDITIONAL
AddAmmoType("9x39mmap", "9x39MM AP")
AddAmmoType("9x39mmsp", "9x39MM SP")
AddAmmoType("7.62x39mmap", "7.62x39MM AP")
AddAmmoType("5.56x45mmap", "5.56x45MM AP")
AddAmmoType("5.45x39mmap", "5.45x39MM AP")
AddAmmoType("12.7x55mmap", "12.7x55MM AP")
AddAmmoType("5.7x28mmap", "5.7x28MM AP")
AddAmmoType("7.62x54mmap", "7.62x54MM AP")
AddAmmoType("7.62x54mmsp", "7.62x54MM SP")
AddAmmoType("7.62x51mmap", "7.62x51MM AP")
AddAmmoType("12gaugeincendiary", "12 Gauge Incendiary")
AddAmmoType("12gaugeslug", "12 Gauge Slug")

-- AddAmmoType("9x18mmtr", "9x18MM Tracer")

AddAmmoType("40mmhe", "40MM HE")
AddAmmoType("vog25", "VOG-25")
AddAmmoType("vog30", "VOG-30")
AddAmmoType("40mmsmoke", "40MM Smoke")
AddAmmoType("60mmp1ap", "M60P1 AP")
AddAmmoType("m67_nades", "M67 Grenades")
AddAmmoType("m18_nades", "M18 Grenades")
AddAmmoType("m84_nades", "M84 Grenades")
AddAmmoType("rpg26_rocket", "RPG 26 Rocket")
AddAmmoType("rpg7_rocket", "RPG 7 Rocket")


AddAmmoType("Ammoboxes", "Ammoboxes")
AddAmmoType("Bandages", "Bandages")
AddAmmoType("Quikclots", "Quikclots")
AddAmmoType("Hemostats", "Hemostats")
AddAmmoType("Tourniquets", "Tourniquets")