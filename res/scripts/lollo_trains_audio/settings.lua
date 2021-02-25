-- Make a backup copy before tampering with this. If you do something wrong, your game might crash.
-- Only change the variable contents, not the variable names.
-- Use an advanced editor, like Visual Studio Code or Atom or some JetBrains product.
return {
    addStationMasterWhistles = true, -- can only be true or false
    -- Respect the data structure if you want to change this. You can add or remove records, but not the table.
    -- It is a table of parts of sound set file names.
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveNoWhistle = {
        '/1044_', -- BVG F92 - metro Berlin
        '/1992_stock_sound', -- London UG
        '/br_1440_', -- this is enough, but you could also use the following
        -- 'br_1440_front_db.lua',
        -- 'br_1440_front_enno.lua',
        -- 'br_1440_waggon_db.lua',
        -- 'br_1440_waggon_enno.lua',
        '/BVGH_', -- metro berlin
        -- 'talent2_front.lua',
        -- 'talent2_middle.lua',
        '/talent2_',
        '/train_trieb_br423' -- br 422, 423, 430 -- this is enough, but you could also use the following
        -- 'train_trieb_br423stw.lua', -- br 422, 423, 430
        -- 'train_trieb_br423stwh.lua', -- br 422, 423, 430
    },
    addCloseDoorsSounds = true, -- can only be true or false
    -- Respect the data structure if you want to change this. It is a table of tuples. You can add or remove records, but not the table.
    -- Every tuple contains a part of the sound set file name and the path of the wav file, relative to res/audio/effects/
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveTheCloseDoorsSound = {
        {soundSetName = '/1044_sound.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'},
        -- {soundSetName = '/br_1440_', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'}, -- too much
        {soundSetName = '/br_1440_waggon_db.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'},
        {soundSetName = '/br_1440_waggon_enno.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'},
        {soundSetName = '/StadlerWaggon.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'},
        {soundSetName = '/StadlerWaggon2.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'},
        {soundSetName = '/talent2_front.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'},
        -- {soundSetName = '/talent2_middle.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'}, -- too much
        -- {soundSetName = '/train_trieb_br423', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'}, -- br 422, 423, 430 -- too much
        {soundSetName = '/train_trieb_br423stw.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'}, -- br 422, 423, 430
    },
    addOpenDoorsSounds = true, -- can only be true or false
    -- Respect the data structure if you want to change this. It is a table of tuples. You can add or remove records, but not the table.
    -- Every tuple contains a part of the sound set file name and the path of the wav file, relative to res/audio/effects/
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveTheOpenDoorsSound = {
        -- {soundSetName = '/br_1440_', wavName = 'openDoors/mind-the-gap-01.wav'}, -- too much
        {soundSetName = '/br_1440_waggon_db.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        {soundSetName = '/br_1440_waggon_enno.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        {soundSetName = '/StadlerWaggon.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        {soundSetName = '/StadlerWaggon2.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        {soundSetName = '/talent2_front.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        -- {soundSetName = '/talent2_middle.lua', wavName = 'openDoors/mind-the-gap-01.wav'}, -- too much
        -- {soundSetName = '/train_trieb_br423', wavName = 'openDoors/mind-the-gap-01.wav'}, -- br 422, 423, 430 -- too much
        {soundSetName = '/train_trieb_br423stw.lua', wavName = 'openDoors/mind-the-gap-01.wav'}, -- br 422, 423, 430
        -- {soundSetName = '/1992_stock_sound.lua', wavName = 'openDoors/mind-the-gap-01.wav'} -- london UG
    }
}
