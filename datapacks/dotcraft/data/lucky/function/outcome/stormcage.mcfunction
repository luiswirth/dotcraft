summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.stormcage"]}
scoreboard players set @e[type=marker,tag=lucky.stormcage,sort=nearest,limit=1] lucky.timer 20
scoreboard players set @e[type=marker,tag=lucky.stormcage,sort=nearest,limit=1] lucky.phase 0
effect give @s minecraft:fire_resistance 60 0 true
title @s actionbar {"text":"stand still","color":"gray"}
