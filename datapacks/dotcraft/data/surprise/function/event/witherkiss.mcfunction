summon wither_skeleton ~2 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:stone_sword",count:1},{}]}
summon wither_skeleton ~-2 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:stone_sword",count:1},{}]}
effect give @s minecraft:wither 8 0
effect give @s minecraft:regeneration 20 1
setblock ~ ~1 ~ minecraft:soul_fire replace
particle minecraft:soul_fire_flame ~ ~1 ~ 1 1 1 0.05 80
playsound minecraft:entity.wither.spawn master @a[distance=..30] ~ ~ ~ 0.6 1.6
