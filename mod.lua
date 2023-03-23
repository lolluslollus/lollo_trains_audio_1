local _fileUtils = require('lollo_trains_audio.fileUtils')
local _mySettings = require('lollo_trains_audio/settings')
local _settingsUtils = require('lollo_trains_audio/settingsUtils')
local _soundsetutilUG = require('soundsetutil')
local _stringUtils = require('lollo_trains_audio/stringUtils')

local _hornRefDist = 50.0
local _refDist = 15.0

local function _addClacks(data, clackWavNames)
    if type(data.events) ~= 'table' then
        data.events = {}
    end
    if type(data.result) ~= 'table' then
        data.result = {}
    end
    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end
    if type(data.updateFns) ~= 'table' then
        data.updateFns = {}
    end
    _soundsetutilUG.addEventClacks(data, clackWavNames, 15.0, 10.0)
end

local function _addClacksNew(data)
    _addClacks(
        data,
        {
            'vehicle/clack/modern/part_1.wav',
            'vehicle/clack/modern/part_2.wav',
            'vehicle/clack/modern/part_3.wav',
            'vehicle/clack/modern/part_4.wav',
            'vehicle/clack/modern/part_5.wav',
            'vehicle/clack/modern/part_6.wav',
            'vehicle/clack/modern/part_7.wav',
            'vehicle/clack/modern/part_8.wav',
            'vehicle/clack/modern/part_9.wav',
            'vehicle/clack/modern/part_10.wav'
        }
    )
end

local function _addClacksOld(data)
    _addClacks(
        data,
        {
            'vehicle/clack/old/part_1.wav',
            'vehicle/clack/old/part_2.wav',
            'vehicle/clack/old/part_3.wav',
            'vehicle/clack/old/part_4.wav',
            'vehicle/clack/old/part_5.wav',
            'vehicle/clack/old/part_6.wav',
            'vehicle/clack/old/part_7.wav',
            'vehicle/clack/old/part_8.wav',
            'vehicle/clack/old/part_9.wav',
            'vehicle/clack/old/part_10.wav'
        }
    )
end

local function _addWavToSoundsetEvent(data, eventName, wavFileName, refDist, isAddFirst)
    if type(data) ~= 'table' then
        print('LOLLO sound effects for trains: warning: data is not a table in _addWavToSoundsetEvent')
    end
    if type(data) ~= 'table' or _stringUtils.isNullOrEmptyString(eventName) or _stringUtils.isNullOrEmptyString(wavFileName) then
        return
    end

    if type(data.events) ~= 'table' then data.events = {} end
    if type(data.events[eventName]) ~= 'table' then
        data.events[eventName] = {names = {}, refDist = refDist}
    end
    if type(data.events[eventName].names) ~= 'table' then
        data.events[eventName].names = {}
    end

    if not _stringUtils.arrayHasValue(data.events[eventName].names, wavFileName) then
        if isAddFirst then
            -- LOLLO NOTE somehow, the game won't play the file if it is in the first position
            table.insert(data.events[eventName].names, 1, wavFileName)
        else
            table.insert(data.events[eventName].names, #data.events[eventName].names + 1, wavFileName)
        end
        data.events[eventName].refDist = refDist
    end

    -- LOLLO NOTE sometimes, data.result is missing:
    -- we make it coz soundsetutil.addEvent always does it.
    -- It seems useless tho.
    if type(data.result) ~= 'table' then data.result = {} end
    if type(data.result.events) ~= 'table' then data.result.events = {} end
    if type(data.result.events[eventName]) ~= 'table' then
        data.result.events[eventName] = {gain = 1.0, pitch = 1.0}
    end
end

-- local _sampleInput = {
--     speed = 1,
--     topSpeed = 100,
--     speed01 = 10,
--     weight = 100,
--     brakeDecel = 1,
--     powerOutput = 100,
--     power = 100,
--     power01 = 100,
--     chuffStep = 100,
--     curveRadius = 100,
--     curveSpeedLimit = 100,
--     sideForce = 100,
--     maxSideForce = 100,
--     numAxles = 2,
--     axleRefWeight = 10,
--     gameSpeedUp = 1
-- }

local function _getIsElectricOrDiesel(data)
    if not(data) or not(data.events) then return false end
    return type(data.events.clacks) == 'table'
end

local function _getIsSteam(data)
    if not(data) or not(data.events) then return false end
    return type(data.events.chuffs) == 'table'
end

local function _getIsEventInSoundset(data, eventName)
    if data == nil or _stringUtils.isNullOrEmptyString(eventName) then
        return false
    end

    return type(data) == 'table'
        and type(data.events) == 'table'
        and type(data.events[eventName]) == 'table'
end

---you can add an array of wav file names, but mostly, the first will be skipped
---@param data any
---@param eventName string
---@param wavFileNames table<string>
---@param refDist number
local function _addNewEventToSoundset(data, eventName, wavFileNames, refDist)
    if type(data) ~= 'table' then
        print('LOLLO sound effects for trains: warning: data is not a table in _addNewEventToSoundset')
    end
    if type(data) ~= 'table' or _stringUtils.isNullOrEmptyString(eventName) or type(wavFileNames) ~= 'table' then
        return
    end
    local _wavFileNames = {}
    for _, wavFileName in pairs(wavFileNames) do
        if not(_stringUtils.isNullOrEmptyString(wavFileName)) then
            _wavFileNames[#_wavFileNames+1] = wavFileName
        end
    end
    if #_wavFileNames == 0 then return end

    if type(data.events) ~= 'table' then data.events = {} end
    if type(data.result) ~= 'table' then data.result = {} end
    if type(data.result.events) ~= 'table' then data.result.events = {} end

    _soundsetutilUG.addEvent(data, eventName, _wavFileNames, refDist) -- type(data.updateFns) == 'table' and data.updateFn or nil) NO!
end

local _hornElectricOrDieselWavNames = {
    'vehicle/train_electric_old/whistle.wav',
    'vehicle/train_electric_old/whistle2.wav',
    'vehicle/train_electric_modern/horn_4.wav',
    'vehicle/train_electric_modern/horn_12.wav',
    'vehicle/train_electric_modern/horn_14.wav',
    'vehicle/train_electric_modern/horn_15.wav',
    'vehicle/train_electric_modern/horn_16.wav',
}

local _hornSteamWavNames = {
    'vehicle/train_steam_old/horn.wav',
    'vehicle/train_steam_old/steam_horn_2.wav',
    'vehicle/train_steam_old/steam_horn_6.wav',
    'vehicle/train_steam_old/steam_horn_13.wav',
}

local _levelCrossingBellWavNames = {
    'railroad_crossing.wav',
}

local _whistleWavNames = {
    'whistles/station-whistle-01.wav',
    'whistles/station-whistle-02.wav',
    'whistles/station-whistle-03.wav',
    'whistles/station-whistle-04.wav',
    'whistles/station-whistle-05.wav',
    'whistles/station-whistle-06.wav',
}

function data()
    return {
        info = {
            minorVersion = 14,
            severityAdd = 'NONE',
            severityRemove = 'NONE',
            name = _('_NAME'),
            description = _('_DESC'),
            tags = {'Europe', 'Script Mod', 'Sound'},
            authors = {{name = 'Lollus', role = 'CREATOR'}}
        },
        runFn = function(settings)
            addModifier(
                'loadSoundSet',
                function(fileName, data)
                    -- if _stringUtils.stringContains(fileName, 'br_1440_') then
                    --     print('loading sound set', fileName) debugPrint(data)
                    -- end
                    -- LOLLO NOTE br101 whistles but vectron does not: why?
                    -- it looks like locos have no doors, only waggons do, even the stock gondola does - and it has clacks.
                    -- if stringUtils.stringContains(fileName, 'br101') then -- this one whistles
                    --     print('LOLLO br101 found. It has data:') debugPrint(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ') debugPrint(data.updateFn(_sampleInput))
                    --     end
                    -- end
                    -- if stringUtils.stringContains(fileName, 'train_electric_vectron') then -- this one won't whistle
                    --     print('LOLLO train_electric_vectron found. It has data:') debugPrint(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ') debugPrint(data.updateFn(_sampleInput))
                    --     end
                    -- end

                    if _mySettings.addOpenDoorsSounds then
                        local _wavName = _settingsUtils.getWavName(_mySettings.soundSetsThatReceiveTheOpenDoorsSound, fileName)
                        if not _stringUtils.isNullOrEmptyString(_wavName) then
                            if _getIsEventInSoundset(data, 'openDoors') then
                                _addWavToSoundsetEvent(data, 'openDoors', _wavName, _refDist)
                            else
                                _addNewEventToSoundset(data, 'openDoors', {_wavName}, _refDist)
                            end
                        end
                    end

                    if _mySettings.addCloseDoorsSounds then
                        local _wavName = _settingsUtils.getWavName(_mySettings.soundSetsThatReceiveTheCloseDoorsSound, fileName)
                        if not _stringUtils.isNullOrEmptyString(_wavName) then
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                _addWavToSoundsetEvent(data, 'closeDoors', _wavName, _refDist)
                            else
                                _addNewEventToSoundset(data, 'closeDoors', {_wavName}, _refDist)
                            end
                        end
                    end

                    -- LOLLO NOTE We have no metadata, so we try to guess if it is a train sound set.
                    -- Only trains have clacks or chuffs, so it is a good guess.
                    -- Some trains may not have them: if so, we leave them out.

                    -- Fix some sound sets that have no clacks
                    local fileNameLastSegment = _fileUtils.getFileNameFromPath(fileName)
                    if _stringUtils.arrayHasValue(_mySettings.soundSetsThatReceiveClacksNew, fileNameLastSegment) then
                        _addClacksNew(data)
                    elseif _stringUtils.arrayHasValue(_mySettings.soundSetsThatReceiveClacksOld, fileNameLastSegment) then
                        _addClacksOld(data)
                    end
                    -- LOLLO TODO add chuffs as well, when you feel like

                    -- now I have clacks or chuffs, so I can check if it is electric/diesel or steam
                    if _mySettings.addStationMasterWhistles
                    and not _stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoWhistle)
                    then
                        if (_getIsElectricOrDiesel(data) or _getIsSteam(data)) then
                            local _whistleIndex = math.random(#_whistleWavNames)
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                _addWavToSoundsetEvent(data, 'closeDoors', _whistleWavNames[_whistleIndex], _refDist)
                            else
                                _addNewEventToSoundset(data, 'closeDoors', {_whistleWavNames[_whistleIndex]}, _refDist)
                            end
                        end
                    end

                    if _mySettings.addHorn
                    -- and not _stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoWhistle)
                    then
                        if not(_getIsEventInSoundset(data, 'horn')) then
                            if _getIsElectricOrDiesel(data) then
                                local _hornIndex = math.random(#_hornElectricOrDieselWavNames)
                                _addNewEventToSoundset(data, 'horn', {_hornElectricOrDieselWavNames[_hornIndex]}, _hornRefDist)
                            elseif _getIsSteam(data) then
                                local _hornIndex = math.random(#_hornSteamWavNames)
                                _addNewEventToSoundset(data, 'horn', {_hornSteamWavNames[_hornIndex]}, _hornRefDist)
                            end
                        end
                    end

                    if _mySettings.addBell
                    -- and not _stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoBell)
                    then
                        if not(_getIsEventInSoundset(data, 'bell')) then
                            local _bellIndex = 1
                            _addNewEventToSoundset(data, 'bell', {_levelCrossingBellWavNames[_bellIndex]}, _hornRefDist)
                        end
                    end

                    if _mySettings.addCrossing
                    -- and not _stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoBell)
                    then
                        if not(_getIsEventInSoundset(data, 'crossing')) then
                            local _bellIndex = 1
                            _addNewEventToSoundset(data, 'crossing', {_levelCrossingBellWavNames[_bellIndex]}, _hornRefDist)
                        end
                    end

                    return data
                end
            )
        end
    }
end
