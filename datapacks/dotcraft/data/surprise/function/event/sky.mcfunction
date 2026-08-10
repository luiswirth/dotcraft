execute store result score #k surprise.roll run random value 1..4
execute if score #k surprise.roll matches 1 run time set noon
execute if score #k surprise.roll matches 2 run time set midnight
execute if score #k surprise.roll matches 3 run weather clear
execute if score #k surprise.roll matches 4 run weather rain

effect give @s minecraft:night_vision 240 0 true
playsound minecraft:ambient.cave master @s ~ ~ ~ 0.5 0.6
particle minecraft:end_rod ~ ~3 ~ 3 1 3 0.02 120
