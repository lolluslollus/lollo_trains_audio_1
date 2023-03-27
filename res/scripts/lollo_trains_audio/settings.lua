-- Make a backup copy before tampering with this. If you do something wrong, your game might crash.
-- Only change the variable contents, not the variable names.
-- Use an advanced editor, like Visual Studio Code or Atom or some JetBrains product.
return {
    addStationMasterWhistles = true, -- can only be true or false
    -- Respect the data structure if you want to change this. You can add or remove records, but not the table.
    -- It is a table of parts of sound set file names.
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveNoWhistle = {
        '/1044_', -- BVG-Baureihe F92 - metro Berlin
        '/1972TS', -- London UG 1972
        '/1992_stock_sound', -- London UG 1992
        '/b_stock', -- London District Line B Stock
        '/berlin_reko.lua', -- Wannseebahn and future releases
        '/berlin_stadtbahner.lua', -- Wannseebahn and future releases
        '/br_1440_', -- this is enough, but you could also use the following
        -- 'br_1440_front_db.lua',
        -- 'br_1440_front_enno.lua',
        -- 'br_1440_waggon_db.lua',
        -- 'br_1440_waggon_enno.lua',
        '/BVGH_', -- metro berlin
        '/C1_', -- metro muenchen
        '/C2_', -- metro muenchen
        'g_metro', -- ussr metro
        '/S8', -- London UG S7 and S8
        '/StadlerWaggon.lua',
        '/StadlerWaggon2.lua',
        '/talent2_',
        -- 'talent2_front.lua',
        -- 'talent2_middle.lua',
        '/train_trieb_br423', -- br 422, 423, 430 -- this is enough, but you could also use the following
        -- 'train_trieb_br423stw.lua', -- br 422, 423, 430
        -- 'train_trieb_br423stwh.lua', -- br 422, 423, 430
        -- 'wien_u_sound.lua', -- Vienna Type U
        '/z8100', -- RATP and RER metro
    },
    soundSetsThatReceiveNoBell = {},
    soundSetsThatReceiveNoCrossing = {},
    soundSetsThatReceiveNoHorn = {},
    addCloseDoorsSounds = true, -- can only be true or false
    -- Respect the data structure if you want to change this. It is a table of tuples. You can add or remove records, but not the table.
    -- Every tuple contains a part of the sound set file name and the path of the wav file, relative to res/audio/effects/
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveTheCloseDoorsSound = {
        {soundSetName = '/1044_sound.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01-w-door-beep.wav'},
        {soundSetName = '/1992_stock_sound.lua', wavName = 'closeDoors/stand-clear-of-the-doors-02.wav'}, -- london UG 1992 stock
        {soundSetName = '/berlin_reko.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01.wav'},
        {soundSetName = '/berlin_stadtbahner.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'},
        -- {soundSetName = '/br_1440_', wavName = 'closeDoors/bitte-zurueckbleiben-01-w-door-beep.wav'}, -- too much
        {soundSetName = '/br_1440_waggon_db.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01.wav'},
        {soundSetName = '/br_1440_waggon_enno.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'},
        {soundSetName = '/g_metro.lua', wavName = 'closeDoors/stand-clear-of-the-doors-02.wav'},
        {soundSetName = '/S8.lua', wavName = 'closeDoors/stand-clear-of-the-doors-01.wav'}, -- london UG S8 stock
        {soundSetName = '/StadlerWaggon.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01.wav'},
        {soundSetName = '/StadlerWaggon2.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01.wav'},
        {soundSetName = '/talent2_front.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01-w-door-beep.wav'},
        -- {soundSetName = '/talent2_middle.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01-w-door-beep.wav'},
        {soundSetName = '/train_trieb_br423w.lua', wavName = 'closeDoors/bitte-zurueckbleiben-02.wav'}, -- br 422, 423, 430
        -- {soundSetName = '/train_trieb_br423stw.lua', wavName = 'closeDoors/bitte-zurueckbleiben-01.wav'}, -- br 422, 423, 430
        {soundSetName = '/z8100.lua', wavName = 'closeDoors/stand-clear-of-the-doors-02.wav'}, -- RATP and RER
        {soundSetName = '/z8100R.lua', wavName = 'closeDoors/stand-clear-of-the-doors-02.wav'}, -- RATP and RER
    },
    addOpenDoorsSounds = true, -- can only be true or false
    -- Respect the data structure if you want to change this. It is a table of tuples. You can add or remove records, but not the table.
    -- Every tuple contains a part of the sound set file name and the path of the wav file, relative to res/audio/effects/
    -- Mods store their sound sets in <mod directory>/res/config/sound_set .
    soundSetsThatReceiveTheOpenDoorsSound = {
        {soundSetName = '/1044_sound.lua', wavName = 'openDoors/bitte-beachten-sie-die-ansagen-w-gong.wav'},
        {soundSetName = '/1992_stock_sound.lua', wavName = 'openDoors/mind-the-gap-02.wav'}, -- london 1992 stock
        -- {soundSetName = '/berlin_reko.lua', wavName = 'openDoors/bitte-achten-auf-abstand.wav'},
        -- {soundSetName = '/berlin_stadtbahner.lua', wavName = 'openDoors/bitte-achten-auf-abstand.wav'},
        -- {soundSetName = '/br_1440_', wavName = 'openDoors/mind-the-gap-01.wav'}, -- too much
        {soundSetName = '/br_1440_waggon_db.lua', wavName = 'openDoors/bitte-achten-auf-abstand.wav'},
        {soundSetName = '/br_1440_waggon_enno.lua', wavName = 'openDoors/bitte-benutzen-sie-alle-einstiegstueren.wav'},
        {soundSetName = '/g_metro.lua', wavName = 'openDoors/mind-the-gap-01.wav'},
        {soundSetName = '/S8.lua', wavName = 'openDoors/mind-the-gap-03.wav'}, -- london S8 stock
        {soundSetName = '/StadlerWaggon.lua', wavName = 'openDoors/bitte-beachten-sie-die-ansagen.wav'},
        {soundSetName = '/StadlerWaggon2.lua', wavName = 'openDoors/bitte-beachten-sie-die-ansagen.wav'},
        {soundSetName = '/talent2_front.lua', wavName = 'openDoors/bitte-benutzen-sie-alle-einstiegstueren-w-beep.wav'},
        -- {soundSetName = '/talent2_middle.lua', wavName = 'openDoors/bitte-benutzen-sie-alle-einstiegstueren-w-beep.wav'},
        {soundSetName = '/train_trieb_br423w.lua', wavName = 'openDoors/bitte-achten-auf-abstand.wav'}, -- br 422, 423, 430
        -- {soundSetName = '/train_trieb_br423stw.lua', wavName = 'openDoors/bitte-achten-auf-abstand.wav'}, -- br 422, 423, 430
        {soundSetName = '/z8100.lua', wavName = 'openDoors/mind-the-gap-01.wav'}, -- RATP and RER
        {soundSetName = '/z8100R.lua', wavName = 'openDoors/mind-the-gap-01.wav'}, -- RATP and RER
    },
    addBell = true,
    addCrossing = true,
    addHorn = true,
    soundSetsThatReceiveChuffsOld = {
        'br01.lua',
    },
    soundSetsThatReceiveClacksNew = {
        '1044_sound.lua', -- BVG-Baureihe F92
        '1972TS.lua', -- London Underground 1972 Stock
        '1972TS_wa.lua', -- London Underground 1972 Stock
        '1992_stock_sound.lua', -- London Underground 1992 stock
        'br101.lua',
        'br103.lua',
        'br111.lua',
        'br119.lua',
        'br145_0.lua',
        'br145_1.lua',
        'br145_2.lua',
        'br146_0.lua',
        'br146_1.lua',
        'br146_2.lua',
        'br181.lua',
        'br185_0.lua',
        'br185_1.lua',
        'br185_2.lua',
        'br186.lua',
        'br187.lua',
        'br189.lua',
        'br245.lua',
        'br285.lua',
        'br425_antrieb.lua',
        'br425_waggon.lua',
        'br52.lua',
        'br614.lua',
        'br914.lua',
        'br_1440_front_db.lua',
        'br_1440_front_enno.lua',
        'C1_soundmitte.lua',
        'C1_soundmittelite.lua',
        'C2_soundmitte.lua',
        'C2_soundmittekansage.lua',
        'class_170.lua',
        'desiroml.lua',
        'ed250.lua',
        'eurodual_diesel_br159.lua',
        'faccpp.lua',
        'gw_neu.lua',
        'h_wagen.lua',
        'ICE_T_',
        'ICE_TD_',
        'ICE_412_',
        'm_wagen.lua',
        'mk_twd_sound_wagen.lua',
        'r40.lua',
        'rmms.lua',
        'siemens_vectron.lua',
        'sound_182.lua',
        'StadlerWaggon.lua',
        'StadlerWaggon2.lua',
        'train_eurodual_br159.lua',
        'train_trieb_br423stw.lua',
        'train_trieb_br423stwh.lua',
        'train_trieb_br423w.lua',
        'weisssi_br152.lua',
        'wien_u_sound.lua',
        'wien_v_sound.lua',
        'z8100.lua', -- RATP and RER metro
        'z8100R.lua', -- RATP and RER metro
    },
    soundSetsThatReceiveClacksOld = {
        'b_stock.lua', -- London District Line B Stock
        'bboe1100.lua',
        'berlin_reko.lua', -- Wannseebahn and future releases
        'berlin_stadtbahner.lua', -- Wannseebahn and future releases
        'br52alt.lua',
        'DR_243_120_kmh.lua',
        'DR_243_140_kmh.lua',
        'DR_243_160_kmh.lua',
        'gw_alt.lua',
        'oebb1042.lua',
        'tb11.lua',
        'Type_B_Sound.lua',
        'wien_u_sound.lua',
    },
}
