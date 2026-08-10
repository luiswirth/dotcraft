summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.meteor"]}
scoreboard players set @e[type=marker,tag=lucky.meteor,sort=nearest,limit=1] lucky.timer 20
scoreboard players set @e[type=marker,tag=lucky.meteor,sort=nearest,limit=1] lucky.phase 0
effect give @s minecraft:fire_resistance 60 0 true
effect give @s minecraft:resistance 30 2 true
title @s title {"text":"run","color":"red"}
