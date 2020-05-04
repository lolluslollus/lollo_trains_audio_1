package.path = './?.lua;./res/?.lua;./res/scripts/?.lua;' .. package.path

local settings = require('lollo_trains_audio/settings')
local settingsUtils = require('lollo_trains_audio/settingsUtils')
local stringUtils = require('lollo_trains_audio/stringUtils')

local wavName1 = settingsUtils.getWavName(settings.soundSetsThatReceiveTheCloseDoorsSound, 'qwertbr13')
local wavName2 = settingsUtils.getWavName(settings.soundSetsThatReceiveTheCloseDoorsSound, 'qwertbr13/br_1440_,opepep')
local wavName3 = settingsUtils.getWavName(settings.soundSetsThatReceiveTheCloseDoorsSound, '/br_1440')

local ccc = stringUtils.stringContains('qpqpqpqp', '')

local aaa = 123