RegisterNetEvent('rk_attributes:openAttributes', function()
    local attributes = lib.callback.await('rk_attributes:getAttributes', false)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'setVisible',
        data = {
            visibility = true,
            attributes = attributes,
            locale = Locale('ui.attributes')
        }
    })
end)

RegisterNetEvent('rk_attributes:openExamine', function(attributes, playerName)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'setExamineVisible',
        data = {
            visibility = true,
            attributes = attributes,
            playerName = playerName,
            locale = Locale('ui.examine')
        }
    })
end)

RegisterNUICallback('saveAttributes', function(data, cb)
    local success = lib.callback.await('rk_attributes:saveAttributes', false, data)
    if success then
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'setVisible',
            data = {
                visibility = false
            }
        })
    end
    cb('ok')
end)

RegisterNUICallback('closeAttributes', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'setVisible',
        data = {
            visibility = false
        }
    })
    cb('ok')
end)

RegisterNUICallback('closeExamine', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'setExamineVisible',
        data = {
            visibility = false
        }
    })
    cb('ok')
end)
