summon elder_guardian ~2 ~2 ~2 {PersistenceRequired:1b,CustomName:{"text":"the Warden of Depths","color":"dark_aqua"},CustomNameVisible:1b}
fill ~-4 ~ ~-4 ~4 ~3 ~4 minecraft:water replace #minecraft:air
setblock ~ ~4 ~ minecraft:sea_lantern replace
effect give @s minecraft:water_breathing 120 0 true
effect give @s minecraft:strength 60 1 true
give @s sponge 8
