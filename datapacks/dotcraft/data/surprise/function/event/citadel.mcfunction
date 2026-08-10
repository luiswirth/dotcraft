summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.monument","surprise.new"]}
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run function surprise:build/palette
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run scoreboard players set @s surprise.timer 8
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run scoreboard players set @s surprise.phase 0
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] store result score @s surprise.height run random value 18..30
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] store result score @s surprise.radius run random value 6..8
tag @e[type=marker,tag=surprise.new] remove surprise.new
effect give @s minecraft:slow_falling 120 0 true
title @s title {"text":"a citadel","color":"gold","italic":true}
playsound minecraft:event.raid.horn master @a[distance=..60] ~ ~ ~ 1 1.4
