local _mySettings = require('lollo_trains_audio/settings')
local _settingsUtils = require('lollo_trains_audio/settingsUtils')
local _soundsetutil = require('soundsetutil')
local _stringUtils = require('lollo_trains_audio/stringUtils')

local _refDist = 10.0

local function _addClacksFreightNew(data)
    local _clackWavNames = {
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
    if type(data.result) ~= 'table' then
        data.result = {}
    end
    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end
    if type(data.updateFns) ~= 'table' then
        data.updateFns = {}
    end
    _soundsetutil.addEventClacks(data, _clackWavNames, 15.0, 10.0)
end

local function _addClacksFreightOld(data)
    local _clackWavNames = {
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
    if type(data.result) ~= 'table' then
        data.result = {}
    end
    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end
    if type(data.updateFns) ~= 'table' then
        data.updateFns = {}
    end
    _soundsetutil.addEventClacks(data, _clackWavNames, 15.0, 10.0)
end

local function _addClacksPassengersNew(data)
    local _clackWavNames = {
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
    if type(data.result) ~= 'table' then
        data.result = {}
    end
    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end
    if type(data.updateFns) ~= 'table' then
        data.updateFns = {}
    end
    _soundsetutil.addEventClacks(data, _clackWavNames, 15.0, 10.0)
end

local function _addWavToSoundsetEvent(data, eventName, wavFileName, refDist, isAddFirst)
    -- print('data before =') debugPrint(data)
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

    -- print('data after =') debugPrint(data)
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

local function _getIsEventInSoundset(data, eventName)
    if data == nil or _stringUtils.isNullOrEmptyString(eventName) then
        return false
    end

    return type(data) == 'table'
        and type(data.events) == 'table'
        and type(data.events[eventName]) == 'table'
end

local function _addNewEventToSoundset(data, eventName, wavFileName, refDist)
    if type(data) ~= 'table' then
        print('LOLLO sound effects for trains: warning: data is not a table in _addNewEventToSoundset')
    end
    if type(data) ~= 'table' or _stringUtils.isNullOrEmptyString(eventName) or _stringUtils.isNullOrEmptyString(wavFileName) then
        return
    end

    if type(data.events) ~= 'table' then data.events = {} end
    if type(data.result) ~= 'table' then data.result = {} end
    if type(data.result.events) ~= 'table' then data.result.events = {} end

    _soundsetutil.addEvent(data, eventName, {wavFileName}, refDist) -- type(data.updateFns) == 'table' and data.updateFn or nil) NO!
end

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
            minorVersion = 10,
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
                                _addNewEventToSoundset(data, 'openDoors', _wavName, _refDist)
                            end
                        end
                    end

                    if _mySettings.addCloseDoorsSounds then
                        local _wavName = _settingsUtils.getWavName(_mySettings.soundSetsThatReceiveTheCloseDoorsSound, fileName)
                        if not _stringUtils.isNullOrEmptyString(_wavName) then
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                _addWavToSoundsetEvent(data, 'closeDoors', _wavName, _refDist)
                            else
                                _addNewEventToSoundset(data, 'closeDoors', _wavName, _refDist)
                            end
                        end
                    end

                    if _mySettings.addStationMasterWhistles
                    and not _stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoWhistle)
                    then
                        -- LOLLO NOTE We have no metadata, so we try to guess if it is a train sound set.
                        -- Only trains have clacks or chuffs, so it is a good guess.
                        -- Some trains may not have them: if so, we leave them out.

                        -- Fix some sound sets that have no clacks
                        if _stringUtils.stringContains(fileName, '/gw_neu')
                        or _stringUtils.stringContains(fileName, '/h_wagen')
                        or _stringUtils.stringContains(fileName, '/rmms')
                        or _stringUtils.stringContains(fileName, '/faccpp')
                        then
                            _addClacksFreightNew(data)
                        elseif _stringUtils.stringContains(fileName, '/gw_alt')
                        then
                            _addClacksFreightOld(data)
                        elseif _stringUtils.stringContains(fileName, '/m_wagen')
                        or _stringUtils.stringContains(fileName, '/class_170')
                        then
                            _addClacksPassengersNew(data)
                        end

                        if data
                        and type(data.events) == 'table'
                        and (type(data.events.clacks) == 'table' or type(data.events.chuffs) == 'table')
                        then
                            local _whistleIndex = math.random(#_whistleWavNames)
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                _addWavToSoundsetEvent(data, 'closeDoors', _whistleWavNames[_whistleIndex], _refDist)
                            else
                                _addNewEventToSoundset(data, 'closeDoors', _whistleWavNames[_whistleIndex], _refDist)
                            end
                        end
                    end

                    -- if _stringUtils.stringContains(fileName, 'br_1440_') then
                    --     print('patched sound set', fileName) debugPrint(data)
                    -- end

                    return data
                end
            )
        end
    }
end
