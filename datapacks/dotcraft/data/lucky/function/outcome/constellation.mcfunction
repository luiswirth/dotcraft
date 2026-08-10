summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.constellation"]}
scoreboard players set @e[type=marker,tag=lucky.constellation,sort=nearest,limit=1] lucky.timer 20
scoreboard players set @e[type=marker,tag=lucky.constellation,sort=nearest,limit=1] lucky.phase 0
title @s title {"text":"✦","color":"light_purple"}
playsound minecraft:block.beacon.activate master @a[distance=..30] ~ ~ ~ 1 1
