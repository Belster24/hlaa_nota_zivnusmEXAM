local sensorInfo = {
	name = "getAliveUnits",
	desc = "Gets alive units assigned to a lane",
	author = "Zivnustka",
	date = "2024-07-19",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

local SensorsIsUnitAlive = Sensors.IsUnityAlive
return function(laneInfoUnits)

	local aliveUnits = {}
	for key,value in pairs(laneInfoUnits) do

		local oneTypePrev = laneInfoUnits[key]
		local oneTypeAlive = {}
		
		local aliveIndex = 1
		for i = 1, #oneTypePrev do
			if SensorsIsUnitAlive(oneTypePrev[i]) then 
				oneTypeAlive[aliveIndex] = oneTypePrev[i]
				aliveIndex = aliveIndex + 1 
			end
		end

		aliveUnits[key] = oneTypeAlive

	end

	return aliveUnits
end

