execute as @a[scores={lucky.mined=1..}] at @s run function lucky:open
scoreboard players reset @a lucky.mined
function lucky:stage/tick
