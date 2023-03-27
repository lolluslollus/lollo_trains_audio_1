function data()
    return {
        en = {
            ['_DESC'] = [[
[b]Station masters whistle when trains leave.[/b]
Local trains instead receive announcements when opening and closing the doors.
As of build 35024, trains without horn receive one.
As of build 35300, trains without level crossing bell receive it. It will sound when triggered by a "bell" waypoint like https://steamcommunity.com/sharedfiles/filedetails/?id=2949188252 or a "crossing" waypoint like https://steamcommunity.com/sharedfiles/filedetails/?id=2790931135.

This mod works for vanilla and many modded trains.

You can customise this mod with <mod directory>/res/scripts/lollo_trains_audio/settings.lua.
For example, you can make it say "mind the gap" and "stand clear of the doors", or nothing at all.
You can also add your own sounds. Just play around.

[b]Notes[/b]
1) Whistles and horns can only come if the train has a sound set with clacks or chuffs.
This mod adds clacks to certain modded sound sets that haven't got them. It does not add chuffs.

2) To get more modded trains to whistle, load https://steamcommunity.com/sharedfiles/filedetails/?id=1956333378 and https://steamcommunity.com/sharedfiles/filedetails/?id=1984933237 [b]before[/b] other mods and this one after.

3) If you alter settings.lua, back it up to preserve it across mod updates.
            ]],
            ['_NAME'] = 'Extra sound effects for trains'
        }
    }
end
