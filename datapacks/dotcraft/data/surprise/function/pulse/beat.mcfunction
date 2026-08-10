# A beat runs the event as the nearest player, so an event never has to know who set it off.
function surprise:pulse/run with entity @s data
execute store result score #left surprise.roll run data get entity @s data.left
scoreboard players remove #left surprise.roll 1
execute store result entity @s data.left int 1 run scoreboard players get #left surprise.roll
execute store result score @s surprise.timer run data get entity @s data.gap
execute if score #left surprise.roll matches ..0 run kill @s
