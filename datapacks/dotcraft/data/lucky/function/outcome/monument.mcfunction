summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.monument","lucky.new"]}
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run function lucky:build/palette
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run scoreboard players set @s lucky.timer 10
execute as @e[type=marker,tag=lucky.new,sort=nearest,limit=1] run scoreboard players set @s lucky.phase 0
tag @e[type=marker,tag=lucky.new] remove lucky.new
title @s actionbar {"text":"something is being built","color":"gray"}
