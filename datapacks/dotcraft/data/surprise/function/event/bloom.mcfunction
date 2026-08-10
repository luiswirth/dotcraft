execute store result score #b surprise.roll run random value 1..5
execute if score #b surprise.roll matches 1 run data modify storage surprise:ctx scene.block set value "minecraft:moss_block"
execute if score #b surprise.roll matches 2 run data modify storage surprise:ctx scene.block set value "minecraft:pink_petals"
execute if score #b surprise.roll matches 3 run data modify storage surprise:ctx scene.block set value "minecraft:torchflower"
execute if score #b surprise.roll matches 4 run data modify storage surprise:ctx scene.block set value "minecraft:glow_lichen"
execute if score #b surprise.roll matches 5 run data modify storage surprise:ctx scene.block set value "minecraft:short_grass"
execute store result storage surprise:ctx scene.r int 1 run random value 2..5

function surprise:apply/bloom with storage surprise:ctx scene
summon bee ~1 ~1 ~ {PersistenceRequired:1b}
particle minecraft:happy_villager ~ ~1 ~ 2 1 2 0.1 80
