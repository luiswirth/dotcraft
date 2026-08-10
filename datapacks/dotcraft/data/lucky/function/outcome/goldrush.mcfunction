fill ~-4 ~-3 ~-4 ~4 ~2 ~4 minecraft:gold_block replace #minecraft:base_stone_overworld
fill ~-5 ~-2 ~-5 ~5 ~1 ~5 minecraft:raw_gold_block replace #minecraft:dirt
summon piglin_brute ~4 ~1 ~4 {PersistenceRequired:1b}
effect give @s minecraft:haste 60 2 true
particle minecraft:wax_on ~ ~1 ~ 3 2 3 0.1 200
playsound minecraft:block.amethyst_block.resonate master @a[distance=..20] ~ ~ ~ 1 0.7
