UCMosinAmmo = UCMosinAmmo or {}
local ammo = UCMosinAmmo
local clear = "models/comradebear/weapons/upgrades/mosin_scope_clear"

function ammo.Slot(wep)
    for _, slot in ipairs(wep.Attachments or {}) do
        local att = slot.Installed and ArcCW.AttachmentTable[slot.Installed]
        if att and att.UCMosinShells then return slot end
    end
end

function ammo.Cleanup(wep)
    for model, mask in pairs(wep.UCMosinAmmoMasks or {}) do
        if IsValid(model) then model:SetSubMaterial(mask.index, mask.original) end
    end
    wep.UCMosinAmmoMasks = nil
end

function ammo.Apply(wep, reference, world)
    if not IsValid(reference) then return end
    local slot = ammo.Slot(wep)
    if not slot then ammo.Cleanup(wep) return end
    local element
    if world then element = slot.WElement else element = slot.VElement end
    local model = element and element.Model
    -- Hide cartridges only once their replacement exists. The stripper clip
    -- uses another material and remains visible with its original animation.
    if not IsValid(model) then return end
    if model:GetParent() ~= reference then model:SetParent(reference) end
    model:AddEffects(EF_BONEMERGE)
    model:SetRenderOrigin(nil)
    model:SetRenderAngles(nil)
    wep.UCMosinAmmoMasks = wep.UCMosinAmmoMasks or {}
    local previous = wep.UCMosinAmmoMasks[reference]
    if previous and previous.model ~= reference:GetModel() then
        reference:SetSubMaterial(previous.index, previous.original)
        wep.UCMosinAmmoMasks[reference] = nil
    end
    if not wep.UCMosinAmmoMasks[reference] then
        for index, material in ipairs(reference:GetMaterials()) do
            if string.find(material, "bullets_1_copperwash_col", 1, true) then
                wep.UCMosinAmmoMasks[reference] = {
                    index = index - 1, original = reference:GetSubMaterial(index - 1),
                    model = reference:GetModel(),
                }
                break
            end
        end
    end
    local mask = wep.UCMosinAmmoMasks[reference]
    if mask then reference:SetSubMaterial(mask.index, clear) end
    -- The two receivers use different indices for their visible magazine.
    local sniper = string.find(reference:GetModel(), "c_mn90_30_sniper", 1, true)
    model:SetBodygroup(1, math.Clamp(reference:GetBodygroup(sniper and 2 or 6), 0, 3))
end

function ammo.Configure(wep)
    local slot = ammo.Slot(wep)
    if not slot then ammo.Cleanup(wep) return end
    local owner = wep:GetOwner()
    if IsValid(owner) and owner:IsPlayer() then ammo.Apply(wep, owner:GetViewModel(), false) end
    ammo.Apply(wep, wep.WMModel, true)
end

hook.Add("PreRender", "UCMosinShellModels", function()
    local owner = LocalPlayer()
    local wep = IsValid(owner) and owner:GetActiveWeapon()
    if IsValid(wep) and wep:GetClass() == "arccw_uc_mosin" then ammo.Configure(wep) end
end)
