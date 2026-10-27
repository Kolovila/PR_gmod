-- mw3 Sounds
--Foley
CustomizableWeaponry:addRegularSound("MW3_RAISE", {
"ma85_mw3/foley/raise.wav", 
})

CustomizableWeaponry:addRegularSound("MW3_RAISE_ALT", {
"ma85_mw3/foley/swap01.wav", 
})

CustomizableWeaponry:addRegularSound("MW3_RAISE_ALT2", {
"ma85_mw3/foley/swap02.wav", 
})

--Breathing
CustomizableWeaponry:addRegularSound("MW3_INHALE", {
"ma85_mw3/breath/in.wav", 
})

CustomizableWeaponry:addRegularSound("MW3_EXHALE", {
"ma85_mw3/breath/out_low.wav",
})
CustomizableWeaponry:addRegularSound("MW3_EXHALE2", {
"ma85_mw3/breath/out_medium.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_EXHALE3", {
"ma85_mw3/breath/out_heavy.wav", 
})

--Silencer Sounds
CustomizableWeaponry:addFireSound("MW3_SIL_RIFLE", {
"ma85_mw3/silencer/ar.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addFireSound("MW3_SIL_SMG", {
"ma85_mw3/silencer/smg.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addFireSound("MW3_SIL_SMG_MP5", {
"ma85_mw3/silencer/smg_mp5.wav",
}, .4, 70, CHAN_WEAPON, 85, 95)

CustomizableWeaponry:addFireSound("MW3_SIL_SMG_P90", {
"ma85_mw3/silencer/smg_p90.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addFireSound("MW3_SIL_LMG", {
"ma85_mw3/silencer/lmg.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addFireSound("MW3_SIL_SHOTGUN", {
"ma85_mw3/silencer/shotgun.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addFireSound("MW3_SIL_SNIPER", {
"ma85_mw3/silencer/sniper.wav",
}, .4, 70, CHAN_WEAPON, 65, 75)

CustomizableWeaponry:addFireSound("MW3_SIL_PISTOL", {
"ma85_mw3/silencer/pistol.wav",
}, .4, 70, CHAN_WEAPON, 95, 110)

-- Mechanical Sounds
CustomizableWeaponry:addFireSound("MW3_MECH_D", {
"ma85_mw3/mechanism/weap_mech_layer_d1.wav",
"ma85_mw3/mechanism/weap_mech_layer_d2.wav",
"ma85_mw3/mechanism/weap_mech_layer_d3.wav",
"ma85_mw3/mechanism/weap_mech_layer_d4.wav",
"ma85_mw3/mechanism/weap_mech_layer_d5.wav",
"ma85_mw3/mechanism/weap_mech_layer_d6.wav",
"ma85_mw3/mechanism/weap_mech_layer_d7.wav",
"ma85_mw3/mechanism/weap_mech_layer_d8.wav",
}, .5, 70, CHAN_STATIC, 95, 110)

CustomizableWeaponry:addFireSound("MW3_MECH_C", {
"ma85_mw3/mechanism/weap_mech_layer_c1.wav",
"ma85_mw3/mechanism/weap_mech_layer_c2.wav",
"ma85_mw3/mechanism/weap_mech_layer_c3.wav",
"ma85_mw3/mechanism/weap_mech_layer_c4.wav",
"ma85_mw3/mechanism/weap_mech_layer_c5.wav",
"ma85_mw3/mechanism/weap_mech_layer_c6.wav",
"ma85_mw3/mechanism/weap_mech_layer_c7.wav",
"ma85_mw3/mechanism/weap_mech_layer_c8.wav",
}, .5, 70, CHAN_STATIC, 95, 110)

CustomizableWeaponry:addFireSound("MW3_MECH_SNIPER", {
"ma85_mw3/mechanism/weap_sniper_layer_a1.wav",
}, .5, 70, CHAN_STATIC, 95, 110)

-- M203
CustomizableWeaponry:addFireSound("MW3_M203_FIRE", {
"ma85_mw3/underbarrel/m203/fire.wav",
}, .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("MW3_M203_OPEN", "ma85_mw3/underbarrel/m203/open.wav")
CustomizableWeaponry:addReloadSound("MW3_M203_LOAD", "ma85_mw3/underbarrel/m203/load.wav")
CustomizableWeaponry:addReloadSound("MW3_M203_CLOSE", "ma85_mw3/underbarrel/m203/close.wav")

-- GP25
CustomizableWeaponry:addFireSound("MW3_GP25_FIRE", {
"ma85_mw3/underbarrel/gp25/fire.wav",
}, .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("MW3_GP25_LIFT", "ma85_mw3/underbarrel/gp25/lift.wav")
CustomizableWeaponry:addReloadSound("MW3_GP25_LOAD", "ma85_mw3/underbarrel/gp25/load.wav")

-- M320
CustomizableWeaponry:addFireSound("MW3_M320_FIRE", {
"ma85_mw3/underbarrel/m320/fire.wav",
}, .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("MW3_M320_RELOAD_1", "ma85_mw3/underbarrel/m320/lift.wav")
CustomizableWeaponry:addReloadSound("MW3_M320_RELOAD_2", "ma85_mw3/underbarrel/m320/open.wav")
CustomizableWeaponry:addReloadSound("MW3_M320_RELOAD_3", "ma85_mw3/underbarrel/m320/eject.wav")
CustomizableWeaponry:addReloadSound("MW3_M320_RELOAD_4", "ma85_mw3/underbarrel/m320/load.wav")
CustomizableWeaponry:addReloadSound("MW3_M320_RELOAD_5", "ma85_mw3/underbarrel/m320/close.wav")

-- Shotgun
CustomizableWeaponry:addFireSound("MW3_SHOTGUN_FIRE", "ma85_mw3/underbarrel/shotgun/fire.wav", .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("MW3_SHOTGUN_LIFT", "ma85_mw3/underbarrel/shotgun/lift.wav")
CustomizableWeaponry:addReloadSound("MW3_SHOTGUN_PUMP", "ma85_mw3/underbarrel/shotgun/pump.wav")
CustomizableWeaponry:addReloadSound("MW3_SHOTGUN_SHELL", "ma85_mw3/underbarrel/shotgun/shell.wav")
CustomizableWeaponry:addReloadSound("MW3_SHOTGUN_END", "ma85_mw3/underbarrel/shotgun/end.wav")

-- Knife
CustomizableWeaponry:addFireSound("MW3_KNIFE_HIT", {
"ma85_mw3/melee/slice1.wav", 
"ma85_mw3/melee/slice2.wav", 
}, .4, 75, CHAN_STATIC, 95, 110)

CustomizableWeaponry:addFireSound("MW3_KNIFE_HIT_WALL", {
"ma85_mw3/melee/hit1.wav",
"ma85_mw3/melee/hit2.wav",
"ma85_mw3/melee/hit3.wav",
}, .4, 80, CHAN_STATIC, 95, 110)

CustomizableWeaponry:addFireSound("MW3_KNIFE_SWING", {
"ma85_mw3/melee/swing1.wav",
"ma85_mw3/melee/swing2.wav",
}, .4, 80, CHAN_STATIC, 95, 110)

--Hybrid Sight
CustomizableWeaponry:addRegularSound("MW3_HYBRID_LIFT", {
"ma85_mw3/scopes/hybrid/lift.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_HYBRID_UP", {
"ma85_mw3/scopes/hybrid/up.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_HYBRID_DOWN", {
"ma85_mw3/scopes/hybrid/down.wav", 
})

--HAMR Scope
CustomizableWeaponry:addRegularSound("MW3_HAMR_LIFT", {
"ma85_mw3/scopes/hamr/lift.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_HAMR_ON", {
"ma85_mw3/scopes/hamr/on.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_HAMR_OFF", {
"ma85_mw3/scopes/hamr/off.wav", 
})

--Empty Clicks
CustomizableWeaponry:addRegularSound("MW3_DRYFIRE_PISTOL", {
"ma85_mw3/dryfire/pistol.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_DRYFIRE_SMG", {
"ma85_mw3/dryfire/smg.wav", 
})
CustomizableWeaponry:addRegularSound("MW3_DRYFIRE_RIFLE", {
"ma85_mw3/dryfire/rifle.wav", 
})