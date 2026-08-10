# Only a mined lucky block sets an event off. The clock that fired them
# unprompted is off; surprise:fire is what turns it back on for a player.
execute as @a[scores={surprise.mined=1..}] at @s run function surprise:pick
scoreboard players reset @a surprise.mined

function surprise:pulse/tick
function surprise:stage/tick
