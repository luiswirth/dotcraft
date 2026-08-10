fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:slime_block replace #minecraft:base_stone_overworld
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:slime_block replace #minecraft:dirt
effect give @s minecraft:jump_boost 45 4
effect give @s minecraft:slow_falling 45 0
summon slime ~2 ~1 ~2 {Size:1,PersistenceRequired:1b}
playsound minecraft:block.slime_block.place master @s ~ ~ ~ 2 1
