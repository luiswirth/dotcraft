summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.meteor"]}
scoreboard players set @e[type=marker,tag=surprise.meteor,sort=nearest,limit=1] surprise.timer 20
scoreboard players set @e[type=marker,tag=surprise.meteor,sort=nearest,limit=1] surprise.phase 0
effect give @s minecraft:fire_resistance 60 0 true
effect give @s minecraft:resistance 30 2 true
title @s title {"text":"run","color":"red"}
