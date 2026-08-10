execute store result score #brew surprise.roll run random value 1..4
execute if score #brew surprise.roll matches 1 run effect give @s minecraft:speed 90 3 true
execute if score #brew surprise.roll matches 1 run effect give @s minecraft:jump_boost 90 2 true
execute if score #brew surprise.roll matches 2 run effect give @s minecraft:strength 90 2 true
execute if score #brew surprise.roll matches 3 run effect give @s minecraft:invisibility 90 0 true
execute if score #brew surprise.roll matches 4 run effect give @s minecraft:night_vision 300 0 true
execute if score #brew surprise.roll matches 4 run effect give @s minecraft:water_breathing 300 0 true
setblock ~1 ~ ~ minecraft:brewing_stand replace
give @s glowstone_dust 16
give @s nether_wart 16
particle minecraft:witch ~ ~1 ~ 1 1 1 0.1 80
