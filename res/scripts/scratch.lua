package.path = './?.lua;./res/?.lua;./res/scripts/?.lua;' .. package.path
local stringUtils = require('stringUtils')
local sss0 = '@C:/Program Files (x86)/Steam/userdata/71590188/1066780/local/mods/lollo_trains_audio_1/mod.lua'
local sss1 = string.sub(sss0, 1)
--[[ for w in string.gmatch(sss0, '([^/mod.lua]+)') do
    table.insert(sss1, w)
end ]]

local sss2 = string.gsub(sss0, '/mod.lua', '/res/config/audio/effects/Tuerezuansage.wav')

local ttt = stringUtils.stringContainsOneOf(
    'hrhrhrStadlerWaggon.luaqaqaqa',
    {
        'br_1440_waggon_db.lua',
        'br_1440_waggon_enno.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'talent2_middle.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua.bak'
    }
)

local ttt2 = stringUtils.stringContainsOneOf(
    'qwe',
    {
        'br_1440_waggon_db.lua',
        'br_1440_waggon_enno.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'talent2_middle.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua.bak'
    }
)

local ttt3 = stringUtils.stringContainsOneOf(
    'br_1440_waggon_db.lua',
    {
        'br_1440_waggon_db.lua',
        'br_1440_waggon_enno.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'talent2_middle.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua.bak'
    }
)
