summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.meltdown"]}
scoreboard players set @e[type=marker,tag=lucky.meltdown,sort=nearest,limit=1] lucky.timer 40
scoreboard players set @e[type=marker,tag=lucky.meltdown,sort=nearest,limit=1] lucky.phase 0
effect give @s minecraft:fire_resistance 30 0 true
