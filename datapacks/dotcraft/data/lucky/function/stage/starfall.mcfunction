scoreboard players set @s lucky.timer 20

execute if score @s lucky.phase matches 1.. run particle minecraft:end_rod ~ ~3 ~ 1.5 1.5 1.5 0.03 90
execute if score @s lucky.phase matches 1.. run playsound minecraft:block.amethyst_block.chime master @a[distance=..20] ~ ~ ~ 1 1

execute if score @s lucky.phase matches 2 run summon item ~ ~3 ~ {Item:{id:"minecraft:nether_star",count:1}}
execute if score @s lucky.phase matches 3 run summon item ~ ~3 ~ {Item:{id:"minecraft:heart_of_the_sea",count:1}}
execute if score @s lucky.phase matches 4 run summon item ~ ~3 ~ {Item:{id:"minecraft:netherite_ingot",count:3}}
execute if score @s lucky.phase matches 5 run summon item ~ ~3 ~ {Item:{id:"minecraft:dragon_egg",count:1}}
execute if score @s lucky.phase matches 6 run summon item ~ ~3 ~ {Item:{id:"minecraft:enchanted_golden_apple",count:6}}

execute if score @s lucky.phase matches 7.. run particle minecraft:flash ~ ~3 ~ 0 0 0 0 1
execute if score @s lucky.phase matches 7.. run playsound minecraft:entity.player.levelup master @a[distance=..30] ~ ~ ~ 1 0.7
execute if score @s lucky.phase matches 7.. run kill @s
