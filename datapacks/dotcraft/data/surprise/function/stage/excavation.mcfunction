scoreboard players set @s surprise.timer 15

execute if score @s surprise.phase matches 1.. run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 minecraft:air destroy
execute if score @s surprise.phase matches 1.. run tp @s ~ ~-2 ~
execute if score @s surprise.phase matches 1.. run playsound minecraft:block.gravel.break master @a[distance=..20] ~ ~ ~ 1 0.5
execute if score @s surprise.phase matches 1.. run particle minecraft:crit ~ ~ ~ 1 1 1 0.1 40

execute if score @s surprise.phase matches 6 run setblock ~2 ~ ~ minecraft:diamond_ore replace
execute if score @s surprise.phase matches 9 run setblock ~-2 ~ ~ minecraft:emerald_ore replace
execute if score @s surprise.phase matches 12 run setblock ~ ~ ~2 minecraft:ancient_debris replace

execute if score @s surprise.phase matches 16.. run setblock ~ ~ ~ minecraft:chest{Items:[{Slot:13b,id:"minecraft:diamond",count:24},{Slot:11b,id:"minecraft:gold_block",count:8},{Slot:15b,id:"minecraft:experience_bottle",count:32}]} replace
execute if score @s surprise.phase matches 16.. run kill @s
