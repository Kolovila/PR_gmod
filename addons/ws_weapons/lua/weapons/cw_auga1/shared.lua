AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AUG A1 (AUG-chan)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.55
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_bo1_aug.mdl"
	SWEP.WMPos = Vector(-0.3, -6, -1.5)
	SWEP.WMAng = Vector(-9, 0, 180)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.AUGScopePos = Vector(-2.432, -3.849, 0.027)
	SWEP.AUGScopeAng = Vector(0, 0, 0)
	
	SWEP.AUGRailAimPos = Vector(-2.435, -5.067, 0.488)
	SWEP.AUGRailAimAng = Vector(0, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.418, -5.067, -0.627)
	SWEP.EoTechAng = Vector(1.394, 0, 0)

	SWEP.CSGOACOGPos = Vector(-2.396, -5.323, -0.42)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(-2.452, -5.261, -0.355)

	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.428, -5.838, -0.354)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.442, -5.067, -0.271)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-2.438, -5.067, -0.167)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.IronsightPos = SWEP.AUGScopePos
	SWEP.IronsightAng = SWEP.AUGScopeAng
	
	SWEP.AUGTSGlass = Material("models/weapons/v_models/AUGAI/rt")
	SWEP.AUGTSGlassSimple = Material("models/weapons/v_models/AUGAI/rt_trans")
	SWEP.AUGScopeRT = GetRenderTarget("xm8_scope_rt", 512, 512, false)
	
	SWEP.CustomizePos = Vector(7.091, 0, 1.144)
	SWEP.CustomizeAng = Vector(10.612, 34.972, 15.635)
		
	SWEP.SprintPos = Vector(1.61, -1.583, -0.331)
	SWEP.SprintAng = Vector(-15.407, 27.899, -19.99)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	local scopeInit = true
	local cd = {}
	cd.x = 0
	cd.y = 0
	cd.w = 512
	cd.h = 512
	cd.fov = 14
	cd.drawviewmodel = false
	cd.drawhud = false
	cd.dopostprocess = false
	
	function SWEP:RenderTargetFunc()
			if self.ActiveAttachments.bg_aug_rail then
				self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.regular)
				self.AimSwayIntensity = 0.6
			else
				self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.none)
				-- self:setBodygroup(self.ReceiverBGs.main,self.ReceiverBGs.none)
			end
				
				if self:canSeeThroughTelescopics("AUGScopePos") then
					local complex = self:canUseComplexTelescopics()
				
					local rc, rs
					local default = false
					if self.ActiveAttachments.bg_hkxm8_reticle1 then
						rc = self:getSightColor("bg_hkxm8_reticle1")
						rs = "sprites/circledot"
					elseif self.ActiveAttachments.bg_hkxm8_reticle2 then
						rc = self:getSightColor("bg_hkxm8_reticle2")
						rs = "sprites/circlecross"
					elseif self.ActiveAttachments.bg_hkxm8_reticle3 then
						rc = self:getSightColor("bg_hkxm8_reticle3")
						rs = "sprites/bigcircle"
					elseif self.ActiveAttachments.bg_hkxm8_reticle4 then
						rc = self:getSightColor("bg_hkxm8_reticle4")
						rs = "sprites/kobra"
					elseif self.ActiveAttachments.bg_hkxm8_reticle5 then
						rc = self:getSightColor("bg_hkxm8_reticle5")
						rs = "sprites/chevron"
					else
						rc = {r = 255, g = 255, b = 255, a = 255}
						rs = "sprites/bigdot_xm8"
						default = true
					end
		
					// old rt
					x, y = ScrW(), ScrH()
					old = render.GetRenderTarget()
				
					ang = self:getMuzzlePosition().Ang
					ang.r = ang.r
					ang:RotateAroundAxis(ang:Right(), self.ACOGAxisAlign.right)
					ang:RotateAroundAxis(ang:Up(), self.ACOGAxisAlign.up)
					ang:RotateAroundAxis(ang:Forward(), self.ACOGAxisAlign.forward)
					cd.angles = ang
					cd.origin = self.Owner:GetShootPos()
					
					render.SetRenderTarget(self.AUGScopeRT)
					render.SetViewPort(0, 0, 512, 512)
						if complex then
							render.RenderView(cd)
							self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.aug_lens)
							self.AimSwayIntensity = 0.10
						elseif scopeInit then
							render.RenderView()
							render.Clear(0,0,0,0,false,false)
							scopeInit = false
						else
							render.Clear(0,0,0,0,false,false)
							self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.aug_lens_invisible)
							self.AimSwayIntensity = 0
						end
						
						ang = self.Owner:EyeAngles()
						ang.p = ang.p + self.BlendAng.x
						ang.y = ang.y + self.BlendAng.y
						ang.r = ang.r + self.BlendAng.z
						ang = -ang:Forward()
						
						cam.Start2D()		
							surface.SetDrawColor(rc.r, rc.g, rc.b, 255)
							surface.SetTexture(surface.GetTextureID(rs))
							surface.DrawTexturedRect(192, 192, 128, 128)
							
							if default then
								surface.SetDrawColor(255, 255, 255, 255)
								surface.SetTexture(surface.GetTextureID(rs))
								surface.DrawTexturedRect(224, 224, 64, 64)
							end
						
							surface.SetDrawColor(255, 255, 255, 255)
							surface.SetTexture(surface.GetTextureID("models/weapons/v_models/AUGA1/fake"))
							surface.DrawTexturedRect(0, 0, 512, 512)
						cam.End2D()
					
					// restore old rt
					render.SetViewPort(0, 0, x, y)
					render.SetRenderTarget(old)

					if complex then
						if self.AUGTSGlass then
							self.AUGTSGlass:SetTexture("$basetexture", self.AUGScopeRT)
						end
					else
						if self.AUGTSGlassSimple then
							self.AUGTSGlassSimple:SetTexture("$basetexture", self.AUGScopeRT)
						end
					end
				else
					self:setBodygroup(self.IronsightBGs.main,self.IronsightBGs.aug_lens_idle)
				end
			end
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 180}
	SWEP.LeupoldAxisAlign = {right = 0.08, up = 0.05, forward = 0}
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(0.246, 4.124, -3.358), angle = Angle(0, 180, 0), size = Vector(0.949, 0.949, 0.949)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(-0.278, 8.925, -8.693), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "body", rel = "", pos = Vector(0.034, 0.002, 3.042), angle = Angle(0, 90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "body", rel = "", pos = Vector(0.034, 0.002, 3.042), angle = Angle(0, 90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "body", rel = "", pos = Vector(0, 1.797, -0.661), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "body", rel = "", pos = Vector(0, -14.542, 0.006), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(0, -1.571, 2.203), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "body", rel = "", pos = Vector(-0.071, 4.848, -1.548), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport001", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "smdimport001", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-3.299, 1.235, -1.79), angle = Angle(-55.446, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.41) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(9.491, 14.793, -15.926) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -9.195, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_csgo_silencer_rifle"] = {["bg_aug_small_barrel"] = Vector(0, -10.494, 0.006)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0)
end

SWEP.IronsightBGs = {main = 1, aug_lens_idle = 0, aug_lens = 1, aug_lens_invisible = 2, none = 3}
SWEP.ReceiverBGs = {main = 2, regular = 1, aug_rail = 3, none = 0}
SWEP.BarrelBGs = {main = 3, regular = 0, aug_small = 1, none = 3}
SWEP.LuaViewmodelRecoil = true

SWEP.CustomizationMenuScale = 0.010

SWEP.Attachments = {[1] = {header = "Sight", offset = {1200, -700}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {-500, 10}, atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Rail", offset = {600, -600}, atts = {"bg_aug_rail"}},
	[4] = {header = "Magazine", offset = {50, -550}, atts = {"md_rinic_extended_mag"}},
	[5] = {header = "Short", offset = {-500, -500}, atts = {"bg_aug_small_barrel"}},
	["+attack2"] = {header = "Perks", offset = {-500, 500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 400}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 6, "md_fas2_leupold")
end

SWEP.AttachmentDependencies = {
	["md_cod4_reflex"] = {"bg_aug_rail"},
	["md_microt1"] = {"bg_aug_rail"},
	["md_eotech"] = {"bg_aug_rail"},
	["md_aimpoint"] = {"bg_aug_rail"},
	["md_csgo_acog"] = {"bg_aug_rail"},
	["md_fas2_leupold"] = {"bg_aug_rail"},
}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.55, sound = "CW_AUG_CHAN_MAGOUT"},
	[2] = {time = 1.55, sound = "CW_AUG_CHAN_MAGIN"},
	[3] = {time = 2.35, sound = "CW_AUG_CHAN_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_bo1_aug.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_bo1_aug.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.064034151547492
SWEP.FireSound = "CW_AUG_CHAN_FIRE"
SWEP.FireSoundSuppressed = "CW_AUG_CHAN_FIRE_SUPPRESSED"
SWEP.Recoil = 0.42

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt = 2.1
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true