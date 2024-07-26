local sensorInfo = {
    name = "utilMap",
    desc = "Returns whether map is empty or not",
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

local SensorsGetUnitPosition = Sensors.GetUnitPosition

-- @description Returns whether map is empty or not (#map > 0 wasn't always reliable)
return function(map)

    for _, _ in pairs(map) do
        return true
    end
    
    return false
end