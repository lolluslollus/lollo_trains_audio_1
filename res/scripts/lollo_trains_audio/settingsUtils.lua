local stringUtils = require('lollo_trains_audio/stringUtils')

local settingsUtils = {}

settingsUtils.getWavName = function(settingsTable, fileName)
    if type(settingsTable) ~= 'table' or stringUtils.isNullOrEmptyString(fileName) then
        return ''
    end

    -- local goOn = true
    local i = 1
    -- while goOn and i <= #settingsTable do
    while i <= #settingsTable do
        if type(settingsTable[i]) == 'table' and not stringUtils.isNullOrEmptyString(settingsTable[i].soundSetName) and stringUtils.stringContains(fileName, settingsTable[i].soundSetName) then
            -- goOn = false
            return settingsTable[i].wavName or ''
        end
        i = i + 1
    end

    return ''
end

return settingsUtils
