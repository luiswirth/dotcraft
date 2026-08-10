scoreboard players set @s lucky.timer 25

execute if score @s lucky.phase matches 1.. run particle minecraft:end_rod ~ ~2 ~ 1 1 1 0.02 60
execute if score @s lucky.phase matches 1.. run playsound minecraft:block.amethyst_block.chime master @a[distance=..16] ~ ~ ~ 1 1
execute if score @s lucky.phase matches 1.. run summon item ~ ~2 ~ {Item:{id:"minecraft:amethyst_shard",count:2}}

execute if score @s lucky.phase matches 3 run summon item ~ ~2 ~ {Item:{id:"minecraft:heart_of_the_sea",count:1}}
execute if score @s lucky.phase matches 5 run summon item ~ ~2 ~ {Item:{id:"minecraft:nether_star",count:1}}
execute if score @s lucky.phase matches 7 run summon item ~ ~2 ~ {Item:{id:"minecraft:dragon_egg",count:1}}

execute if score @s lucky.phase matches 8.. run particle minecraft:flash ~ ~2 ~ 0 0 0 0 1
execute if score @s lucky.phase matches 8.. run kill @s
