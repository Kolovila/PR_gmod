ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

function TPIK.Solve2PartIK(startPos, endPos, len0, len1, sign, angs)
    local len2 = (startPos - endPos):Length()
    local span = len0 + len1

    if span > 0 and len2 > span then
        local scale = math.min(len2 / span, TPIK.ArmStretch or 1)
        len0 = len0 * scale
        len1 = len1 * scale
    end

    local cosAngle0 = math.Clamp(((len2 * len2) + (len0 * len0) - (len1 * len1)) / (2 * len2 * len0), -1, 1)
    local angle0 = -math.deg(math.acos(cosAngle0))

    local cosAngle1 = math.Clamp(((len1 * len1) + (len0 * len0) - (len2 * len2)) / (2 * len1 * len0), -1, 1)
    local angle1 = -math.deg(math.acos(cosAngle1))

    local diff = endPos - startPos
    diff:Normalize()

    local horiz = math.sqrt(diff.x * diff.x + diff.y * diff.y)

    local angle2 = math.deg(math.atan2(-horiz, diff.z)) - 90
    local angle3 = math.NormalizeAngle(-math.deg(math.atan2(diff.x, diff.y)) - 90)

    if horiz < TPIK.IKVerticalGuard then
        local facing = math.NormalizeAngle(angs.y - 180)
        local blend = horiz / TPIK.IKVerticalGuard

        angle3 = math.NormalizeAngle(facing + math.NormalizeAngle(angle3 - facing) * blend)
    end

    local axis = diff * 1
    axis:Normalize()

    local roll = 90 + (sign > 0 and -30 or 30)
    local torsoRight = angs.y + 120 * sign

    local joint0 = Angle(angle0 + angle2, angle3, 0)
    joint0:RotateAroundAxis(joint0:Forward(), roll)
    joint0:RotateAroundAxis(axis, angle3 - torsoRight)
    local ang1 = -(-joint0)

    local joint1 = Angle(angle0 + angle2 + 180 + angle1, angle3, 0)
    joint1:RotateAroundAxis(joint1:Forward(), roll)
    joint1:RotateAroundAxis(axis, angle3 - torsoRight)
    local ang2 = -(-joint1)

    local elbow = startPos + joint0:Forward() * len0
    local hand = elbow + joint1:Forward() * len1

    return elbow, hand, ang1, ang2
end
