if SERVER then AddCSLuaFile() end
if CLIENT then
    local hidden = setmetatable({}, {__mode = "k"})

    local function restore(hands)
        local state = hidden[hands]
        if not state then return end
        if IsValid(hands) then
            hands:RemoveCallback("BuildBonePositions", state.callback)
            for bone, matrix in pairs(state.saved) do
                hands:SetBoneMatrix(bone, matrix)
            end
        end
        hidden[hands] = nil
    end

    local function hideLeftArm(hands, state)
        local anchorBone = hands:LookupBone("ValveBiped.Bip01_L_Hand")
        local anchor = anchorBone and hands:GetBoneMatrix(anchorBone)
        if not anchor then return end
        local collapsePoint = anchor:GetTranslation()
        local leftArm = {}
        for bone = 0, hands:GetBoneCount() - 1 do
            local name = hands:GetBoneName(bone)
            if name and name:find("ValveBiped.Bip01_L_", 1, true) == 1 then
                leftArm[bone] = true
            end
        end
        -- Include custom finger/wrist names parented to the standard left arm.
        for bone = 0, hands:GetBoneCount() - 1 do
            local parent = bone
            for _ = 1, hands:GetBoneCount() do
                if leftArm[parent] then
                    leftArm[bone] = true
                    break
                end
                parent = hands:GetBoneParent(parent)
                if not parent or parent < 0 then break end
            end
        end
        for bone in pairs(leftArm) do
            local matrix = hands:GetBoneMatrix(bone)
            if matrix then
                state.saved[bone] = Matrix(matrix)
                local collapsed = Matrix(matrix)
                collapsed:Scale(Vector(0, 0, 0))
                collapsed:SetTranslation(collapsePoint)
                hands:SetBoneMatrix(bone, collapsed)
            end
        end
    end

    hook.Add("PreDrawPlayerHands", "UCExtras_AK_LHIKHands", function(hands, vm, ply, wep)
        if not IsValid(hands) then return end
        restore(hands)
        if not IsValid(wep) or not wep.UXAKHideOriginalLHIKHand then return end
        local active = false
        for i, slot in pairs(wep.Attachments or {}) do
            if slot.Installed then
                if wep:GetBuff_Stat("LHIKHide", i)
                    or (slot.VElement and IsValid(slot.VElement.Model)
                        and wep:GetBuff_Stat("LHIK", i)) then
                    active = true
                    break
                end
            end
        end
        if not active then return end

        hands:SetupBones()
        local state = {saved = {}}
        -- DrawModel may rebuild bones after PreDrawPlayerHands on some clients.
        -- Apply to both cached bones and every rebuild during this draw.
        state.callback = hands:AddCallback("BuildBonePositions", function(ent)
            hideLeftArm(ent, state)
        end)
        hidden[hands] = state
        hideLeftArm(hands, state)
    end)
    hook.Add("PostDrawPlayerHands", "UCExtras_AK_LHIKHands", restore)
end
return function(SWEP)
    if not CLIENT then return end
    SWEP.UXAKHideOriginalLHIKHand = true
end
