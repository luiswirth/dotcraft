summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.starfall"]}
scoreboard players set @e[type=marker,tag=lucky.starfall,sort=nearest,limit=1] lucky.timer 15
scoreboard players set @e[type=marker,tag=lucky.starfall,sort=nearest,limit=1] lucky.phase 0
title @s title {"text":"✦","color":"light_purple"}
playsound minecraft:block.beacon.activate master @a[distance=..40] ~ ~ ~ 1 1
