summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.gauntlet"]}
scoreboard players set @e[type=marker,tag=lucky.gauntlet,sort=nearest,limit=1] lucky.timer 40
scoreboard players set @e[type=marker,tag=lucky.gauntlet,sort=nearest,limit=1] lucky.phase 0
title @s title {"text":"three waves","color":"red"}
playsound minecraft:event.raid.horn master @a[distance=..30] ~ ~ ~ 1 1
