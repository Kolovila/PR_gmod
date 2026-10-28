game.AddParticles("particles/rocket_fx.pcf")
game.AddParticles("particles/fas_explosions.pcf")
game.AddParticles("particles/mortar_fx.pcf")
game.AddParticles("particles/fire_01.pcf")
game.AddParticles("particles/burning_fx.pcf")

PrecacheParticleSystem("party_spark")
PrecacheParticleSystem("port_smoke_heavy")
PrecacheParticleSystem("muzzle_rockets")

PrecacheParticleSystem("explosion_claymore")
PrecacheParticleSystem("explosion_HE_claymore")
PrecacheParticleSystem("explosion_grenade")
PrecacheParticleSystem("explosion_he_grenade")
PrecacheParticleSystem("explosion_m79")
PrecacheParticleSystem("explosion_HE_m79")
PrecacheParticleSystem("explosion_m79_body")
PrecacheParticleSystem("explosion_water")

PrecacheParticleSystem("fire_vehicle")
PrecacheParticleSystem("explosion")

PrecacheParticleSystem("artillery_smoke_blue")
PrecacheParticleSystem("artillery_smoke_red")
PrecacheParticleSystem("m79_trail")
PrecacheParticleSystem("explosion_mortar")

function AddAmmoType(name, text)
	game.AddAmmoType({name = name})

	if CLIENT then
		language.Add(name .. "_ammo", text)
	end
end

AddAmmoType("at4_rocket", "AT4 Launcher")
AddAmmoType("rpg7_rocket", "RPG 7 Rocket")
