local sensorInfo = {
	name = "isUnitAlive",
	desc = "Returns whether a unit is alive or not.",
	author = "Zivnustka",
	date = "2024-07-19",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end


local SpringValidUnitID = Spring.ValidUnitID
local SpringGetUnitIsDead = Spring.GetUnitIsDead
local SpringGetUnitHealth = Spring.GetUnitHealth

return function(uid)

	--if uid == nil then return false end
    --if not SpringValidUnitID(uid) then return false end
    --if SpringGetUnitIsDead(uid) then return false end
    if SpringGetUnitHealth(uid) == nil then return false end

    return true
end
