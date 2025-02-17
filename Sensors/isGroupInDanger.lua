local sensorInfo = {
    name = "isGroupInDanger",
    desc = "Returns whether a group of units is in danger",
    author = "Zivnustka",
    date = "2024-07-19",
    license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching

function getInfo()
    return {
        period = EVAL_PERIOD_DEFAULT
    }
end


local isInDanger = Sensors.isInDanger

-- @description Returns whether a group of units is in danger
return function(units, radius, dpsTreshold, unitsInDangerRatioTreshold)
    local unitsNB = math.min(#units, 5)
    local unitsInDangerNB = 0

    for i = 1, math.min(#units, 5) do
        local inDangerResult = isInDanger(units[i], radius, dpsTreshold)

        if inDangerResult == true then unitsInDangerNB = unitsInDangerNB + 1
        elseif inDangerResult == nil then unitsNB = unitsNB - 1 end

    end

    return (unitsInDangerNB / unitsNB) > unitsInDangerRatioTreshold
end