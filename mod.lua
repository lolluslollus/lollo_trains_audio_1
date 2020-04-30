-- local dump = require "luadump" -- use this to write data into stdout, which is at C:\Program Files (x86)\Steam\userdata\71590188\1066780\local\crash_dump\stdout.txt
local stringUtils = require('stringUtils')

local function getModelId(fileName)
    -- fileName = "C:/Program Files (x86)/Steam/steamapps/workshop/content/1066780/1943176647/res/config/multiple_unit/oppie_ns_icm_icm3.lua"
    local separatorString = 'workshop/content/1066780/'
    if fileName == nil then
        return nil
    end

    local a, b = string.find(fileName, separatorString)
    if a == nil or b == nil then
        return nil
    end

    return string.sub(fileName, b + 1, b + 10)
end

function data()
    local soundSets =                             {
        'br_1440_waggon_db.lua',
        'br_1440_waggon_enno.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'talent2_middle.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua.bak'
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
                    if
                        stringUtils.stringContainsOneOf(
                            fileName,
                            soundSets
                        )
                     then
                        --[[ print(
                            'LOLLO types = ',
                            data.events and type(data.events) or 'no data.events',
                            data.events and data.events.closeDoors and type(data.events.closeDoors) or ' no data.events.closeDoors',
                            data.events and data.events.closeDoors and data.events.closeDoors.names and type(data.events.closeDoors.names) or 'no data.events.closeDoors.names'
                        ) ]]
                        if data and type(data.events) == 'table' then
                            --print('LOLLO One data.events.closeDoors has type = ', type(data.events.closeDoors))
                            if type(data.events.closeDoors) ~= 'table' then
                                data.events.closeDoors = {names = {}, refDist = 5.0}
                            --print('LOLLO Two data.events.closeDoors has type = ', type(data.events.closeDoors))
                            end
                            if type(data.events.closeDoors.names) ~= 'table' then
                                data.events.closeDoors.names = {}
                            end
                            -- print('LOLLO debug.getinfo(1).source', debug.getinfo(1).source)
                            -- print('LOLLO debug.getinfo(2).source', debug.getinfo(2).source)
                            -- print('LOLLO debug.getinfo(3).source', debug.getinfo(3).source)
                            -- local sourcePath = debug.getinfo(1).source
                            -- if type(sourcePath) == 'string' and string.len(sourcePath) > 7 then -- 7 is the length of "mod.lua"
                            --     sourcePath = string.sub(sourcePath, 2) -- remove the @ at the beginning
                            --     local absolutePath = string.sub(sourcePath, 0, string.len(sourcePath) - 7) .. 'res/audio/effects/Tuerezuansage.wav'
                            --     print('LOLLO new path = ', absolutePath)
                            -- end
                            local absolutePath = 'lollo/lolloTuerezuansage.wav' -- I may be wrong but a unique name seems important
                            table.insert(data.events.closeDoors.names, #data.events.closeDoors.names + 1, absolutePath)
                            --print('LOLLO the table is now:')
                            --require('luadump')(true)(data.events.closeDoors.names)
                        end
                    end
                    return data
                end
            )
        end
    }
end
