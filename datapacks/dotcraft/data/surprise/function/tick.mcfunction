# Two ways in, one table out: a mined lucky block and each player's own clock.
execute as @a[scores={surprise.mined=1..}] at @s run function surprise:pick
scoreboard players reset @a surprise.mined

scoreboard players remove @a surprise.timer 1
execute as @a[scores={surprise.timer=..0}] at @s run function surprise:fire

function surprise:pulse/tick
function surprise:stage/tick
