summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.starfall"]}
scoreboard players set @e[type=marker,tag=surprise.starfall,sort=nearest,limit=1] surprise.timer 15
scoreboard players set @e[type=marker,tag=surprise.starfall,sort=nearest,limit=1] surprise.phase 0
title @s title {"text":"✦","color":"light_purple"}
playsound minecraft:block.beacon.activate master @a[distance=..40] ~ ~ ~ 1 1
