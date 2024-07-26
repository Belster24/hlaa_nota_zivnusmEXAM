local sensorInfo = {
    name = "retAreaDPSRatio",
    desc = "Computes the DPS ratio in area between me and enemy",
    author = "Zivnustka",
    date = "2024-07-19",
    license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching
local SPHERE_RADIUS = 1500

function getInfo()
    return {
        period = EVAL_PERIOD_DEFAULT
    }
end

local SpringGetUnitsInSphere = Spring.GetUnitsInSphere
local isEnemy = Sensors.isEnemy
local retUnitDPS = Sensors.retUnitDPS

-- @description computes the DPS ration in an area between me / enemy
return function(position, radius)

    local unitsInSphere = SpringGetUnitsInSphere(position.x, position.y, position.z, radius)
    local myDPS = 1
    local enemyDPS = 1


    for i = 1, #unitsInSphere do
        local uid = unitsInSphere[i]
        local uDPS = retUnitDPS(uid)

        if isEnemy(uid) then enemyDPS = enemyDPS + uDPS
        else myDPS = myDPS + uDPS end

    end

    return myDPS / enemyDPS
end