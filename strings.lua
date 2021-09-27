function data()
    return {
        en = {
            ['_DESC'] = [[
                [h2]Station masters whistle when trains leave.[/h2]
                This mod works for vanilla and many modded trains.
                Certain local trains receive underground announcements, as a bonus.

                You can customise this mod with <mod directory>/res/scripts/lollo_trains_audio/settings.lua.
                For example, you can make it say "mind the gap" and "stand clear of the doors", or nothing at all.
                You can also add your own sounds. Just play around.

                Note 1: the whistles can only come if the train has a sound set with clacks or chuffs.
                This mod adds clacks to certain modded sound sets that haven't got them. It does not add chuffs.

                Note 2: to get more modded trains to whistle, load https://steamcommunity.com/sharedfiles/filedetails/?id=1956333378 and https://steamcommunity.com/sharedfiles/filedetails/?id=1984933237 before other mods and this one after.
            ]],
            ['_NAME'] = 'Extra sound effects for trains'
        }
    }
end
