local settingsUtils = require('lollo_trains_audio/settingsUtils')
local stringUtils = require('lollo_trains_audio/stringUtils')
local soundsetutil = require('soundsetutil')
-- local inspect = require('inspect')

local function _addClacksFreightNew(data)
    local clackNames = {
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
    soundsetutil.addEventClacks(data, clackNames, 15.0, 10.0)
end

local function _addClacksFreightOld(data)
    local clackNames = {
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
    soundsetutil.addEventClacks(data, clackNames, 15.0, 10.0)
end

local function _addClacksPassengersNew(data)
    local clackNames = {
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
    soundsetutil.addEventClacks(data, clackNames, 15.0, 10.0)
end

local function _addWavToSoundsetEvent(data, eventName, wavFileName, refDist, isAddFirst)
    if type(data) ~= 'table' then
        print('LOLLO sound effects for trains: warning: data is not a table in _addWavToSoundsetEvent')
    end
    if type(data) ~= 'table' or stringUtils.isNullOrEmptyString(eventName) or stringUtils.isNullOrEmptyString(wavFileName) then
        return
    end

    if type(data.events) ~= 'table' then
        data.events = {}
    end

    if type(data.events[eventName]) ~= 'table' then
        data.events[eventName] = {names = {}, refDist = refDist}
    end

    if type(data.events[eventName].names) ~= 'table' then
        data.events[eventName].names = {}
    end

    if not stringUtils.arrayHasValue(data.events[eventName].names, wavFileName) then
        if isAddFirst then
            -- LOLLO NOTE somehow, the game won't play the file if it is in the first position
            table.insert(data.events[eventName].names, 1, wavFileName)
        else
            table.insert(data.events[eventName].names, #data.events[eventName].names + 1, wavFileName)
        end
    end

    -- from here on, it's probably useless
    -- if type(data.result) == 'table' then
    --     if type(data.result.events) ~= 'table' then
    --         data.result.events = {}
    --     end

    --     if type(data.result.events[eventName]) ~= 'table' then
    --         print('LOLLO strange 05')
    --         data.result.events[eventName] = {gain = 1.0, pitch = 1.0}
    --     end
    -- end
    -- LOLLO NOTE sometimes, data.result is missing: we make it coz soundsetutil.addEvent always does it.
    if type(data.result) ~= 'table' then
        data.result = {}
    end
    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end

    if type(data.result.events[eventName]) ~= 'table' then
        data.result.events[eventName] = {gain = 1.0, pitch = 1.0}
    end
end

-- local function _addEventToUpdateFn(data, eventName)
--     if type(data) ~= 'table' or stringUtils.isNullOrEmptyString(eventName) then
--         return data
--     end

--     if type(data.events) ~= 'table' then
--         print('LOLLO strange 03')
--         data.events = {}
--     end

--     if type(data.events[eventName]) ~= 'table' then
--         print('LOLLO strange 04, data.events.' .. eventName .. ' = ')
--         require('luadump')(true)(data.events[eventName])
--         print('data = ')
--         require('luadump')(true)(data)
--         data.events[eventName] = {gain = 1.0, pitch = 1.0}
--     end

--     return data
-- end

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

-- local function _getIsFunctionsSame(func1, func2)
--     if type(func1) ~= 'function' or type(func2) ~= 'function' then
--         return false
--     end

--     local input = {
--         speed = 1,
--         topSpeed = 100,
--         speed01 = 10,
--         weight = 100,
--         brakeDecel = 1,
--         powerOutput = 100,
--         power = 100,
--         power01 = 100,
--         chuffStep = 100,
--         curveRadius = 100,
--         curveSpeedLimit = 100,
--         sideForce = 100,
--         maxSideForce = 100,
--         numAxles = 2,
--         axleRefWeight = 10,
--         gameSpeedUp = 1
--     }

--     print('LOLLO func1 returns:')
--     print(inspect(func1(input)))
--     print('LOLLO func2 returns:')
--     print(inspect(func2(input)))
--     return inspect(func1(input)) == inspect(func2(input))
-- end

local function _getIsEventInSoundset(data, eventName)
    if data == nil or stringUtils.isNullOrEmptyString(eventName) then
        return false
    end

    return type(data) == 'table' and type(data.events) == 'table' and type(data.events[eventName]) == 'table'
end

local function _addNewEventToSoundset(data, eventName, wavFileName, refDist)
    if type(data) ~= 'table' then
        print('LOLLO sound effects for trains: warning: data is not a table in _addNewEventToSoundset')
    end
    if type(data) ~= 'table' or stringUtils.isNullOrEmptyString(eventName) or stringUtils.isNullOrEmptyString(wavFileName) then
        return
    end

    if type(data.events) ~= 'table' then
        data.events = {}
    end

    if type(data.result) ~= 'table' then
        data.result = {}
    end

    if type(data.result.events) ~= 'table' then
        data.result.events = {}
    end

    soundsetutil.addEvent(data, eventName, {wavFileName}, refDist) -- type(data.updateFns) == 'table' and data.updateFn or nil) NO!
end

local _mySettings = require('lollo_trains_audio/settings')
local _whistleWavNames = {
    'whistles/station-whistle-01.wav',
    'whistles/station-whistle-02.wav',
    'whistles/station-whistle-03.wav'
}

function data()
    return {
        info = {
            minorVersion = 2,
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
                    -- LOLLO NOTE br101 whistles but vectron does not: why?
                    -- it looks like locos have no doors, only waggons do, even the stock gondola does - and it has clacks.
                    -- if stringUtils.stringContains(fileName, 'br101') then -- this one whistles
                    --     print('LOLLO br101 found. It has data:')
                    --     require('luadump')(true)(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ')
                    --         require('luadump')(true)(data.updateFn(_sampleInput))
                    --     end
                    -- end
                    -- if stringUtils.stringContains(fileName, 'train_electric_vectron') then -- this one won't whistle
                    --     print('LOLLO train_electric_vectron found. It has data:')
                    --     require('luadump')(true)(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ')
                    --         require('luadump')(true)(data.updateFn(_sampleInput))
                    --     end
                    -- end

                    if _mySettings.addOpenDoorsSounds then
                        local wavName = settingsUtils.getWavName(_mySettings.soundSetsThatReceiveTheOpenDoorsSound, fileName)
                        if not stringUtils.isNullOrEmptyString(wavName) then
                            if _getIsEventInSoundset(data, 'openDoors') then
                                -- this seems useless, even though some mods don't return all events in updateFn
                                -- if data.updateFn then -- it's always function(input)
                                --     local originalUpdateFn = data.updateFn
                                --     data.updateFn = function(input)
                                --         return _addEventToUpdateFn(originalUpdateFn(input), 'openDoors')
                                --     end
                                -- end
                                -- print('LOLLO event openDoors already in the sound set, fileName = ', fileName)
                                _addWavToSoundsetEvent(data, 'openDoors', wavName, 5.0)
                            else
                                -- print('LOLLO event openDoors not in the sound set yet, fileName = ', fileName)
                                _addNewEventToSoundset(data, 'openDoors', wavName, 5.0)
                            end
                        end
                    end

                    if _mySettings.addCloseDoorsSounds then
                        local wavName = settingsUtils.getWavName(_mySettings.soundSetsThatReceiveTheCloseDoorsSound, fileName)
                        if not stringUtils.isNullOrEmptyString(wavName) then
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                -- this seems useless, even though some mods don't return all events in updateFn
                                -- if data.updateFn then -- it's always function(input)
                                --     local originalUpdateFn = data.updateFn
                                --     data.updateFn = function(input)
                                --         return _addEventToUpdateFn(originalUpdateFn(input), 'closeDoors')
                                --     end
                                -- end
                                -- print('LOLLO event closeDoors already in the sound set, fileName = ', fileName)
                                _addWavToSoundsetEvent(data, 'closeDoors', wavName, 5.0)
                            else
                                -- print('LOLLO event closeDoors not in the sound set yet, fileName = ', fileName)
                                _addNewEventToSoundset(data, 'closeDoors', wavName, 5.0)
                            end
                        end
                    end

                    if _mySettings.addStationMasterWhistles and not stringUtils.stringContainsOneOf(fileName, _mySettings.soundSetsThatReceiveNoWhistle) then
                        -- We have no metadata, so we try to guess if it is a train sound set.
                        -- Only trains have clacks, so it is a good guess.
                        -- Some trains may not have them: if so, we leave them out.

                        -- Fix some sound sets that have no clacks
                        if
                            stringUtils.stringContains(fileName, '/gw_neu') or stringUtils.stringContains(fileName, '/h_wagen') or stringUtils.stringContains(fileName, '/rmms') or
                                stringUtils.stringContains(fileName, '/faccpp')
                         then
                            _addClacksFreightNew(data)
                        elseif stringUtils.stringContains(fileName, '/gw_alt') then
                            _addClacksFreightOld(data)
                        elseif stringUtils.stringContains(fileName, '/m_wagen') or stringUtils.stringContains(fileName, '/class_170') then
                            _addClacksPassengersNew(data)
                        end

                        if data and type(data.events) == 'table' and type(data.events.clacks) == 'table' then
                            -- print('LOLLO this is going to change = ', fileName)
                            local whistleIndex = math.random(#_whistleWavNames)
                            if _getIsEventInSoundset(data, 'closeDoors') then
                                -- this seems useless, even though some mods don't return all events in updateFn
                                -- if data.updateFn then -- it's always function(input)
                                --     local originalUpdateFn = data.updateFn
                                --     data.updateFn = function(input)
                                --         return _addEventToUpdateFn(originalUpdateFn(input), 'closeDoors')
                                --     end
                                -- end
                                -- print('LOLLO event already in the sound set, fileName = ', fileName)
                                _addWavToSoundsetEvent(data, 'closeDoors', _whistleWavNames[whistleIndex], 10.0)
                            else
                                -- print('LOLLO event not in the sound set yet, fileName = ', fileName)
                                _addNewEventToSoundset(data, 'closeDoors', _whistleWavNames[whistleIndex], 10.0)
                            end

                        -- if data.updateFn then
                        --     if type(data.updateFns) == 'table' and #data.updateFns > 0 then
                        --         -- updateFns looks like { func1 func2 func3 func4 etc }
                        --         print('LOLLO updateFns is not empty')
                        --         local goOn = true
                        --         local i = 1
                        --         while goOn == true and i <= #data.updateFns do
                        --             -- print('LOLLO updateFns[i] = ', string.dump(data.updateFns[i]), true)
                        --             -- if string.dump(originalUpdateFn, true) == string.dump(data.updateFns[i], true) then
                        --             if _getIsFunctionsSame(data.updateFns[i], originalUpdateFn) then -- the first always returns nil
                        --                 print('LOLLO updateFn replaced in table')
                        --                 data.updateFns[i] = data.updateFn
                        --                 goOn = false
                        --             end
                        --             i = i + 1
                        --         end
                        --     -- data.updateFns[#data.updateFns + 1] = data.updateFn
                        --     end
                        -- end
                        end
                    end

                    -- if stringUtils.stringContains(fileName, 'train_electric_vectron') then
                    --     print('LOLLO train_electric_vectron now has data:')
                    --     require('luadump')(true)(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ')
                    --         require('luadump')(true)(data.updateFn(_sampleInput))
                    --     end
                    -- end
                    -- if stringUtils.stringContains(fileName, 'br101') then
                    --     print('LOLLO br101 now has data:')
                    --     require('luadump')(true)(data)
                    --     if type(data.updateFn) == 'function' then
                    --         print('updateFn produces = ')
                    --         require('luadump')(true)(data.updateFn(_sampleInput))
                    --     end
                    -- end

                    return data
                end
            )
        end
    }
end
