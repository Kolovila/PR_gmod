AddCSLuaFile()
ENT.Base = "arccw_uo_nade_homing"
ENT.PrintName = "Homing Grenade (Seeker Off)"

ENT.FuseTime = 3.2
ENT.NoSeek = true
ENT.SeekRange = 0
ENT.ProximityKill = 0

if SERVER then
    function ENT:AcquireTarget()
        return nil
    end
end
