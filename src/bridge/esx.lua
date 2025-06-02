if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

GetPlayer = function(source)
    return ESX.GetPlayerFromId(source)
end

GetIdentifier = function(source)
    local xPlayer = GetPlayer(source)
    return xPlayer and xPlayer.identifier
end

GetPlayerName = function(source)
    local xPlayer = GetPlayer(source)
    return xPlayer and xPlayer.getName()
end

SaveAttributes = function(source, data)
    local identifier = GetIdentifier(source)
    if not identifier then return false end

    MySQL.update('UPDATE users SET age = ?, description = ? WHERE identifier = ?', {
        data.age,
        data.description,
        identifier
    })
    return true
end

GetAttributes = function(source)
    local identifier = GetIdentifier(source)
    if not identifier then return nil end

    return MySQL.single.await('SELECT age, description FROM users WHERE identifier = ?', {
        identifier
    })
end
