fill ~-3 ~-1 ~-3 ~3 ~3 ~3 minecraft:powder_snow replace #minecraft:air
fill ~-4 ~-1 ~-4 ~4 ~-1 ~4 minecraft:blue_ice replace #minecraft:base_stone_overworld
effect give @s minecraft:slowness 15 1
effect give @s minecraft:resistance 15 1
summon stray ~3 ~ ~3 {PersistenceRequired:1b,HandItems:[{id:"minecraft:bow",count:1},{}]}
playsound minecraft:block.glass.break master @s ~ ~ ~ 2 0.6
