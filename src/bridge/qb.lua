if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

GetPlayer = function(source)
    return QBCore.Functions.GetPlayer(source)
end

GetIdentifier = function(source)
    local Player = GetPlayer(source)
    return Player and Player.PlayerData.citizenid
end

GetPlayerName = function(source)
    local Player = GetPlayer(source)
    return Player and Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
end

SaveAttributes = function(source, data)
    local citizenid = GetIdentifier(source)
    if not citizenid then return false end

    MySQL.update('UPDATE players SET age = ?, description = ? WHERE citizenid = ?', {
        data.age,
        data.description,
        citizenid
    })
    return true
end

GetAttributes = function(source)
    local citizenid = GetIdentifier(source)
    if not citizenid then return nil end

    return MySQL.single.await('SELECT age, description FROM players WHERE citizenid = ?', {
        citizenid
    })
end
