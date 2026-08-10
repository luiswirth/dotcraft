fill ~-2 ~-6 ~-2 ~2 ~-1 ~2 minecraft:air
fill ~-2 ~-6 ~-2 ~2 ~-5 ~2 minecraft:soul_sand
tp @s ~ ~-5 ~
effect give @s minecraft:slowness 12 2
effect give @s minecraft:mining_fatigue 20 1
particle minecraft:soul ~ ~ ~ 1 1 1 0.05 80
playsound minecraft:block.soul_sand.break master @s ~ ~ ~ 2 0.5
