local models = {
    "models/weapons/arccw/uc_pkm_user/belt_realistic.mdl",
    "models/weapons/arccw/uc_pkm_user/belt_realistic_bp.mdl",
    "models/weapons/arc9/uplp/shells/mag_pkm_dropped.mdl",
    "models/weapons/arc9/uplp/shells/mag_pkm_bp_dropped.mdl",
    "models/weapons/arccw/uc_pkm_user/box_small.mdl",
    "models/weapons/arccw/uc_pkm_user/box_medium.mdl",
    "models/weapons/arccw/uc_pkm_user/box_250.mdl",
}
function EFFECT:Init(data)
    local index = math.Clamp(math.floor(data:GetScale() + 0.5) + 1, 1, #models)
    local calibers = { [1] = "556", [2] = "9mm", [3] = "366tkm", [4] = "12g" }
    local caliber = calibers[data:GetFlags()]
    self:SetModel(
        index <= 2
                and caliber
                and ("models/weapons/arccw/uc_pkm_user/belt_" .. caliber .. (index == 2 and "_bp" or "") .. ".mdl")
            or models[index]
    )
    if index >= 3 and data:GetFlags() > 0 then
        for i, material in ipairs(self:GetMaterials()) do
            if material:lower():find("boxmagazine", 1, true) then
                self:SetSubMaterial(
                    i - 1,
                    "models/weapons/arccw/uc_pkm_user/pkm_box_"
                        .. (data:GetFlags() == 1 and "fde" or "charcoal")
                )
            end
        end
    end
    self:SetPos(data:GetOrigin())
    self:SetAngles(data:GetAngles())
    self.Velocity = data:GetAngles():Right() * 55 + Vector(0, 0, -20)
    self.DieTime = CurTime() + 4
    self:SetRenderBounds(Vector(-20, -20, -20), Vector(20, 20, 20))
end
function EFFECT:Think()
    local dt = FrameTime()
    self.Velocity = self.Velocity + Vector(0, 0, -600) * dt
    local pos = self:GetPos()
    local tr = util.TraceLine({ start = pos, endpos = pos + self.Velocity * dt, mask = MASK_SOLID_BRUSHONLY })
    if tr.Hit then
        self:SetPos(tr.HitPos + tr.HitNormal)
        self.Velocity = (self.Velocity - 2 * self.Velocity:Dot(tr.HitNormal) * tr.HitNormal) * 0.22
    else
        self:SetPos(tr.HitPos)
        self:SetAngles(self:GetAngles() + Angle(40, 75, 20) * dt)
    end
    return CurTime() < self.DieTime
end
function EFFECT:Render()
    self:DrawModel()
end
