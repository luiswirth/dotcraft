summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.stormcage"]}
scoreboard players set @e[type=marker,tag=surprise.stormcage,sort=nearest,limit=1] surprise.timer 20
scoreboard players set @e[type=marker,tag=surprise.stormcage,sort=nearest,limit=1] surprise.phase 0
effect give @s minecraft:fire_resistance 60 0 true
title @s actionbar {"text":"stand still","color":"gray"}
