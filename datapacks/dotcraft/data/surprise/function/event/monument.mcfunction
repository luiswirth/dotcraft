summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.monument","surprise.new"]}
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run function surprise:build/palette
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run scoreboard players set @s surprise.timer 10
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] run scoreboard players set @s surprise.phase 0
tag @e[type=marker,tag=surprise.new] remove surprise.new
title @s actionbar {"text":"something is being built","color":"gray"}
