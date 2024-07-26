local sensorInfo = {
    name = "getTeamMetal",
    desc = "Returns team's metal",
    author = "Zivnustka",
    date = "2024-07-19",
    license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = 0 -- acutal, no caching

function getInfo()
    return {
        period = EVAL_PERIOD_DEFAULT
    }
end

local SpringGetMyTeamID = Spring.GetMyTeamID
local SpringGetTeamResources = Spring.GetTeamResources
local teamID = Spring.GetMyTeamID()

-- @description return if I can afford unit / multiplication of unit's price
return function()
    return SpringGetTeamResources(teamID, "metal")
end