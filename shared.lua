Shared = {
    Locale = 'en',
    
    versionCheck = true,

    MaxDistance = 10.0, -- Max distance to examine a player

    ExamineSelf = true, -- Allow players to examine themselves

    Commands = {
        Attributes = {
            'attributes',
            'attr'
        },
        Examine = {
            'ex',
            'examine'
        }
    }
}

-- Sloppy ass locale function
Locale = function(key)
    local locales = LoadResourceFile(GetCurrentResourceName(), ('locales/%s.lua'):format(Shared.Locale))
    if not locales then return key end
    
    local result = load(locales)()
    local keys = {}
    for k in key:gmatch('[^%.]+') do
        table.insert(keys, k)
    end
    
    local value = result
    for _, k in ipairs(keys) do
        if type(value) ~= 'table' then return key end
        value = value[k]
    end
    
    return value or key
end