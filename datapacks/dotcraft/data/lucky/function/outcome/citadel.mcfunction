summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.monument","lucky.new"]}
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run function lucky:build/palette
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run scoreboard players set @s lucky.timer 8
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run scoreboard players set @s lucky.phase 0
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] store result score @s lucky.height run random value 18..30
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] store result score @s lucky.radius run random value 6..8
tag @e[type=marker,tag=lucky.new] remove lucky.new
effect give @s minecraft:slow_falling 120 0 true
title @s title {"text":"a citadel","color":"gold","italic":true}
playsound minecraft:event.raid.horn master @a[distance=..60] ~ ~ ~ 1 1.4
