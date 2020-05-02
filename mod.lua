local stringUtils = require('lollo_trains_audio/stringUtils')

local function _addEventToSoundset(data, eventName, wavFileName, refDist)
    if data == nil or stringUtils.isNullOrEmptyString(eventName) or stringUtils.isNullOrEmptyString(wavFileName) then
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

    table.insert(data.events[eventName].names, #data.events[eventName].names + 1, wavFileName)
end

local function _addEventToUpdateFn(data, eventName)
    if data == nil or stringUtils.isNullOrEmptyString(eventName) then
        return data
    end

    if type(data.events) ~= 'table' then
        data.events = {}
    end

    if type(data.events[eventName]) ~= 'table' then
        data.events[eventName] = {gain = 1.0, pitch = 1.0}
    end

    return data
end

function data()
    local _soundSetsThatReceiveTheDoorClosingMessage = {
        'br_1440_waggon_db.lua',
        'br_1440_waggon_enno.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'talent2_middle.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua.bak'
    }
    local _whistleNames = {
        'whistles/station-whistle-01.wav',
        'whistles/station-whistle-02.wav',
        'whistles/station-whistle-03.wav'
    }

    return {
        info = {
            minorVersion = 0,
            severityAdd = 'NONE',
            severityRemove = 'NONE',
            name = _('_NAME'),
            description = _('_DESC'),
            tags = {'Audio', 'Audio Mod', 'Europe', 'Script Mod'},
            authors = {{name = 'Lollus', role = 'CREATOR'}}
        },
        runFn = function(settings)
            addModifier(
                'loadSoundSet',
                function(fileName, data)
                    if stringUtils.stringContainsOneOf(fileName, _soundSetsThatReceiveTheDoorClosingMessage) then
                        _addEventToSoundset(data, 'closeDoors', 'closeDoors/bitte-zurueckbleiben-01.wav', 8.0)

                        if data.updateFn then
                            local originalUpdateFn = data.updateFn
                            data.updateFn = function(input)
                                return _addEventToUpdateFn(originalUpdateFn(input), 'closeDoors')
                            end
                        end
                    end

                    -- We have no metadata, so we try to guess if it is a train sound set.
                    -- Only trains have clacks, so it is a good guess.
                    -- Some trains may not have them: if so, we leave them out.
                    if data and type(data.events) == 'table' and type(data.events.clacks) == 'table' then
                        local whistleIndex = math.min(math.random(4), 3)
                        _addEventToSoundset(data, 'closeDoors', _whistleNames[whistleIndex], 3.0)

                        if data.updateFn then
                            local originalUpdateFn = data.updateFn
                            data.updateFn = function(input)
                                return _addEventToUpdateFn(originalUpdateFn(input), 'closeDoors')
                            end
                        end
                    end

                    return data
                end
            )
        end
    }
end
