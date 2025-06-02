fx_version ('cerulean')
game ('gta5')

author ({'rk'})
description ({'A simple SA:MP inspired attributes script'})
repository ({'https://github.com/rk3gaming/rk_attributes'})
version ({'1.0.0'})

ui_page ({'web/build/dist/index.html'})

files ({
    'web/build/dist/**',
    'web/build/dist/assets/**',
    'locales/**'
})

shared_scripts ({
    '@ox_lib/init.lua',
    'shared.lua'
})

server_scripts ({
    '@oxmysql/lib/MySQL.lua',
    'src/bridge/**',
    'src/server/**'
})

client_scripts ({
    'src/client/**'
})

dependencies ({
    'ox_lib',
    'oxmysql'
})

lua54 ('yes')