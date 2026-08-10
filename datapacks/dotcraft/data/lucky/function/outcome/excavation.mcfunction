summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.excavation"]}
scoreboard players set @e[type=marker,tag=lucky.excavation,sort=nearest,limit=1] lucky.timer 10
scoreboard players set @e[type=marker,tag=lucky.excavation,sort=nearest,limit=1] lucky.phase 0
effect give @s minecraft:slow_falling 60 0 true
effect give @s minecraft:night_vision 120 0 true
title @s actionbar {"text":"down","color":"gray"}
