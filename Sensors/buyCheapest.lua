local sensorInfo = {
    name = "buyCheapest",
    desc = "Buys the cheapest unit based on some factors",
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


-- @description pops affordable order with lowest score (severenity * price)
return function(orders, prices, teamMetal)

    local minOrder = nil 
    local minOrderKey = nil
    local minOrderScore = 2147483647

    for key, order in pairs(orders) do

        local orderPrice = prices[order.name]
        local orderScore = order.severenity * orderPrice
        if orderScore < minOrderScore and orderPrice < teamMetal  then
            minOrderScore = orderScore
            minOrderKey = key
            minOrder = order
        end

    end

    if minOrder ~= nil then
        orders[minOrderKey] = nil
    end

    return minOrder
end