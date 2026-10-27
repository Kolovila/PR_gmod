AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "BT MP9"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "d"
	killicon.Add("cw_tr09_mp9", "vgui/kills/cw_tr09_mp9_kill", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_tr09_mp9_select")
	SWEP.SightWithRail = true
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -5, y = -1.5, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-2.762, -2.5, 0.560)
	SWEP.IronsightAng = Vector(-0.08, -0.38, 5)
	SWEP.ZoomAmount = 5
	SWEP.FOVPerShot = 0.45
	
	SWEP.MicroT1Pos = Vector(-2.695, 0.5, -0.16)
	SWEP.MicroT1Ang = Vector(0, 0, 5)
	
	SWEP.CmorePos = Vector(-2.675, -4, -0.2)
	SWEP.CmoreAng = Vector(0, 0, 5)
	
    SWEP.EFTUH1Pos = Vector(-2.63, -1, -0.7)  --EFT
	SWEP.EFTUH1Ang = Vector(1, 0, 4.6)

	SWEP.EFTEXPS32Pos = Vector(-2.61, -3, -0.55)  --EFT
	SWEP.EFTEXPS32Ang = Vector(1, 0, 4.6)

	SWEP.EFTG33Pos = Vector(-2.665, -3.5, -0.47)  --EFT-----G33
	SWEP.EFTG33Ang = Vector(1, 0, 4.6)

	SWEP.EFTHAMRPos = Vector(-2.64, -3.1, -0.6)  --EFT
	SWEP.EFTHAMRAng = Vector(1, 0, 4.6)

	SWEP.EFTDPmountPos = Vector(-2.52, -1, -1.77)  --EFT
	SWEP.EFTDPmountAng = Vector(1, 0, 4.6)

	SWEP.EFTRMRmountPos = Vector(-2.541, -1, -1.55)  --EFT
	SWEP.EFTRMRmountAng = Vector(1, 0, 4.6)

	SWEP.EFTROMEO4Pos = Vector(-2.63, -1, -0.58)  --EFT
	SWEP.EFTROMEO4Ang = Vector(1, 0, 4.6)

	SWEP.EFTP1X42Pos = Vector(-2.63, -1, -0.45)  --EFT
	SWEP.EFTP1X42Ang = Vector(1, 0, 4.6)
	
	SWEP.EFTACOGTA01Pos = Vector(-2.65, -3, -0.5)  --EFT
	SWEP.EFTACOGTA01Ang = Vector(1, 0, 4.6)
	
	SWEP.EFTDPPos = Vector(-2.65, -1, -0.25)  --EFT
	SWEP.EFTDPAng = Vector(1, 0, 4.6)
	
	SWEP.EFTFF3Pos = Vector(-2.675, -1, 0.05)  --EFT
	SWEP.EFTFF3Ang = Vector(1, 0, 4.6)
	
	SWEP.AlternativePos = Vector(-0.7, 0.4, 0.1)
	SWEP.AlternativeAng = Vector(0, 0, 4)
	
	SWEP.CustomizePos = Vector(3.640, -0.5, -0.84)
	SWEP.CustomizeAng = Vector(17.096, 35.118, 10)

	SWEP.SprintViewNormals = {x = 1, y = -1, z = 1}
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "gun", rel = "", pos = Vector(0.75, 3.3, 1.8), angle = Angle(0, 90, -90), size = Vector(0.5, 1.3, 0.8)},
        
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eft_si_hamr"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/hamr/v_hamr.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eft_si_dp_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp_wo_mount.mdl", bone = "gun", pos = Vector(0, 0.6, 3.7), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
	    ["md_eft_si_romeo"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/romeo/v_romeo.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
	    ["md_eft_si_pilad"] = {model = "models/weapons/cw_eft/upgrades/scopes/pilad/v_pilad.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
	    ["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
	    ["md_eft_si_dp"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/dp/v_dp.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
	    ["md_eft_si_ff3"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", bone = "gun", pos = Vector(0, 0.1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eft_si_rmr_wo_mount"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr_wo_mount.mdl", bone = "gun", pos = Vector(0, -2.1, 3.1), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eft_si_exps3_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/exps3-2/v_exps3t.mdl", bone = "gun", pos = Vector(0, 1, 2.18), angle = Angle(0, -90, 0), size = Vector(0.65, 0.65, 0.65)},
		["md_eft_si_g33_tan"] = {model = "models/weapons/cw_eft/upgrades/reflex/g33/c_eotech_g33_tan.mdl", bone = "gun", pos = Vector(0, 4.7, 1.8), angle = Angle(0, -90, 0), size = Vector(1.05, 1.05, 1.05)},	

        ["md_eft_sil_osprey9"] = {model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", pos = Vector(0, 5, 1.29), angle = Angle(0, -90, 0), size = Vector(1.05, 1.05, 1.05), bone = "gun"},
		["md_eft_sil_rotor43"] = {model = "models/weapons/cw_eft/upgrades/silencers/rotor/v_rotor.mdl", pos = Vector(0, 5, 1.255), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "gun"},
        ["md_eft_sil_srd9"] = {model = "models/weapons/cw_eft/upgrades/silencers/srd/v_srd.mdl", pos = Vector(0, 5.05, 1.28), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), bone = "gun"},
		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(-0.65, 3.5, 1.58), angle = Angle(180, 90, 90), size = Vector(0.74, 0.74, 0.74), bone = "gun"},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(-0.62, 4.3, 1.5), angle = Angle(180, 90, 90), size = Vector(1, 1, 1), bone = "gun"},
        ["md_eft_fl_dbalpl"] = {model = "models/weapons/cw_eft/upgrades/tactical/dbalpl/dbalpl.mdl", pos = Vector(-0.62, 3.3, 1.5), angle = Angle(180, 90, 90), size = Vector(0.78, 0.78, 0.78), bone = "gun"},
	
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "gun", pos = Vector(0, 9.078, 0.07), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)}
	}

	SWEP.LaserPosAdjust = {x = 0, y = -3, z = -0.4}
	SWEP.LaserAngAdjust = {p = -1, y = -0.2, r = 0}
	SWEP.CustomizationMenuScale = 0.013
end

SWEP.StockBGs = {main = 2, regular = 0, fold = 1}
SWEP.LuaVMRecoilAxisMod = {vert = 0.042, hor = 0.11, roll = 1, forward = 0.3, pitch = 0}
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.ADSFireAnim = false  

SWEP.AttachmentDependencies = {
	["md_eft_si_dp_wo_mount"] = {"md_eft_si_hamr"},
	["md_eft_si_rmr_wo_mount"] = {"md_eft_si_acog_ta01nsn"},
	["md_eft_si_g33_tan"] = {"md_eft_si_exps3_tan", "codol_att_sco_targetfinder", "codol_att_sco_mid"},
	["md_magnifier_scope"] = {"codol_att_red_reflex", "codol_att_eot_exps"}
}


	SWEP.Attachments = {[1] = {header = "Sight", offset = {750, 0}, atts = {"md_eft_si_ff3", "md_eft_si_dp", "md_eft_si_pilad", "md_eft_si_romeo", "md_eft_si_exps3_tan", "md_eft_si_uh1"}},
		[2] = {header = "Barrel", offset = {-300, -150}, atts = {"md_eft_sil_osprey9", "md_eft_sil_rotor43", "md_eft_sil_srd9", "md_tundra9mm"}},
		[3] = {header = "LD", offset = {-300, 250}, atts = {"md_eft_fl_dbalpl", "md_eft_ld_la5", "md_eft_ld_ls321"}},
		[4] = {header = "Stock", offset = {950, 400}, atts = {"bg_tr09_mp9_stock"}},
		[5] = {header = "misc", offset = {-300, 700}, atts = {"md_eft_si_g33_tan"}},
		--["impulse 100"] = {header = "Skin", offset = {950, 800}, atts = {"bg_tr09_mp9_tan", "bg_tr09_mp9_chromosynth"}},
		["+reload"] = {header = "Ammo", offset = {400, 850}, atts = {"am_magnum", "am_matchgrade"}}
	}


SWEP.Animations = {fire = {"fire2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_MP9_DEPLOY"}},

	reload = {[1] = {time = 0.6, sound = "CW_MP9_CLIPOUT"},
	[2] = {time = 1.7, sound = "CW_MP9_CLIPIN"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 TheRambotnic09"

SWEP.Author			= "TheRambotnic09 & Niggarto el Negro"
SWEP.Contact		= ""
SWEP.Purpose		= "To kill bad guys. Duh!"
SWEP.Instructions	= "Press your primary PEW-PEW key to kill the bad guys."

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/therambotnic09/v_cw2_mp9.mdl"
SWEP.WorldModel		= "models/weapons/therambotnic09/w_cw2_mp9.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/therambotnic09/w_cw2_mp9.mdl"
SWEP.WMPos = Vector(-1, -0.5, -1)
SWEP.WMAng = Vector(0, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.068
SWEP.FireSound = "CW_MP9_FIRE"
SWEP.FireSoundSuppressed = "CW_MP9_FIRE_SUPPRESSED"
SWEP.Recoil = 0.6

SWEP.MuzzleVelocity = 550

SWEP.HipSpread = 0.031
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 5
SWEP.MaxSpreadInc = 0.25
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.33
SWEP.ReloadTime = 1
SWEP.ReloadTime_Empty = 1
SWEP.ReloadHalt = 2.4
SWEP.ReloadHalt_Empty = 2.4

if CLIENT then
    function SWEP:createCustomVM(mdl)
        self.CW_VM = self:createManagedCModel(mdl, RENDERGROUP_BOTH)
        self.CW_VM:SetNoDraw(true)
        self.CW_VM:SetupBones()
        self.CW_VM:SetOwner( self.Owner ) -- FIX: PlayerWeaponColor can't find owner for proxy.
       
        if self.ViewModelFlip then
            local mtr = Matrix()
            mtr:Scale(Vector(1, -1, 1))
           
            self.CW_VM:EnableMatrix("RenderMultiply", mtr)
        end
    end
end	