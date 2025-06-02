lib.callback.register('rk_attributes:getAttributes', function(source)
    return GetAttributes(source)
end)

lib.callback.register('rk_attributes:saveAttributes', function(source, data)
    return SaveAttributes(source, data)
end)
