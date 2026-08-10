fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block replace
setblock ~ ~ ~ minecraft:beacon replace
fill ~-1 ~ ~-1 ~1 ~ ~1 minecraft:air replace #minecraft:base_stone_overworld
setblock ~ ~ ~ minecraft:beacon replace
give @s iron_block 27
give @s emerald 3
playsound minecraft:block.beacon.activate master @a[distance=..30] ~ ~ ~ 1 1
