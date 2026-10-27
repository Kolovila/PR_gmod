AddCSLuaFile()

CustomizableWeaponry_BlackOps3 = true

game.AddParticles("particles/fas_explosions.pcf")
PrecacheParticleSystem("grenade_final")
PrecacheParticleSystem("explosion_m79")
PrecacheParticleSystem("water_explosion")
PrecacheParticleSystem("muzzleflash_m79")

if SERVER then
	resource.AddWorkshop("895376192") -- ESSENTIALS
end