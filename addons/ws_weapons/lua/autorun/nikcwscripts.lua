CustomizableWeaponry:registerAmmo("7.62x25MM Tokarev", "7.62x39MM Tokarev Rounds", 7.62, 25)

sound.Add({
	name = 			"Nik.AmmoPickup",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 	{	
			"weapons/nik/nikpickups/ammopickup1.wav",
			"weapons/nik/nikpickups/ammopickup2.wav",
			"weapons/nik/nikpickups/ammopickup3.wav"
			}
})

sound.Add({
	name = 			"Nik.WeaponPickup",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 	{	
			"weapons/nik/nikpickups/weppickup1.wav",
			"weapons/nik/nikpickups/weppickup2.wav",
			"weapons/nik/nikpickups/weppickup3.wav"
			}
})
sound.Add({
	name = 			"Nik.CrateImpactSoft",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 	{	
			"weapons/nik/ammocontainer/impact1.wav",
			"weapons/nik/ammocontainer/impact2.wav",
			"weapons/nik/ammocontainer/impact3.wav"
			}
})