if Shared.versionCheck then lib.versionCheck('rk3gaming/rk_attributes') end

lib.addCommand(Shared.Commands.Attributes, {
    help = Locale('lua.commands.attributes_help'),
    restricted = false,
}, function(source)
    TriggerClientEvent('rk_attributes:openAttributes', source)
end)

lib.addCommand(Shared.Commands.Examine, {
    help = Locale('lua.commands.examine_help'),
    restricted = false,
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'Player ID',
            optional = false
        }
    }
}, function(source, args)
    local targetId = tonumber(args.id)
    if not targetId then return end
    
    local attributes = GetAttributes(targetId)
    local playerName = GetPlayerName(targetId)

    local targetPed = GetPlayerPed(targetId)
    local sourcePed = GetPlayerPed(source)
    local targetCoords = GetEntityCoords(targetPed)
    local sourceCoords = GetEntityCoords(sourcePed)
    local distance = #(targetCoords - sourceCoords)

    if not GetPlayerName(targetId) then
        TriggerClientEvent('rk_attributes:notify', source, 'Examine', Locale('lua.examine.invalid_player'), 'error', 5000, 'skull-crossbones', '#ff4141')
        return
    end

    if targetId == source and not Shared.ExamineSelf then
        TriggerClientEvent('rk_attributes:notify', source, 'Examine', Locale('lua.examine.cannot_examine_self'), 'error', 5000, 'spider', '#ff4141')
        return
    end

    if distance > Shared.MaxDistance then
        TriggerClientEvent('rk_attributes:notify', source, 'Examine', Locale('lua.examine.too_far'), 'error', 5000, 'spider', '#ff4141')
        return
    end

    if not attributes or not attributes.age then
        TriggerClientEvent('rk_attributes:notify', source, 'Examine', Locale('lua.examine.no_attributes'), 'error', 5000, 'magnifying-glass', '#7685e6')
        return
    end
    TriggerClientEvent('rk_attributes:openExamine', source, attributes, playerName)
end)
