scoreboard players set @s lucky.timer 25

execute if score @s lucky.phase matches 1 run fill ~-3 ~ ~-3 ~3 ~4 ~3 minecraft:iron_bars hollow
execute if score @s lucky.phase matches 1 run fill ~-2 ~ ~-2 ~2 ~3 ~2 minecraft:air
execute if score @s lucky.phase matches 1 run weather thunder 300

execute if score @s lucky.phase matches 2.. run summon lightning_bolt ~3 ~5 ~3
execute if score @s lucky.phase matches 3.. run summon lightning_bolt ~-3 ~5 ~-3
execute if score @s lucky.phase matches 4.. run summon lightning_bolt ~3 ~5 ~-3

execute if score @s lucky.phase matches 5.. run fill ~-3 ~ ~-3 ~3 ~4 ~3 minecraft:air replace minecraft:iron_bars
execute if score @s lucky.phase matches 5.. run summon item ~ ~1 ~ {Item:{id:"minecraft:trident",count:1,components:{"minecraft:enchantments":{channeling:1,loyalty:3},"minecraft:custom_name":'{"text":"Cage Key","color":"aqua","italic":false}'}}}
execute if score @s lucky.phase matches 5.. run kill @s
