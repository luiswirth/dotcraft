# Nothing is destroyed: only the decoration underfoot changes its mind.
execute store result score #s surprise.roll run random value 1..6
execute if score #s surprise.roll matches 1 run data modify storage surprise:ctx scene.block set value "minecraft:slime_block"
execute if score #s surprise.roll matches 2 run data modify storage surprise:ctx scene.block set value "minecraft:honey_block"
execute if score #s surprise.roll matches 3 run data modify storage surprise:ctx scene.block set value "minecraft:hay_block"
execute if score #s surprise.roll matches 4 run data modify storage surprise:ctx scene.block set value "minecraft:pink_wool"
execute if score #s surprise.roll matches 5 run data modify storage surprise:ctx scene.block set value "minecraft:glass"
execute if score #s surprise.roll matches 6 run data modify storage surprise:ctx scene.block set value "minecraft:sculk"
execute store result storage surprise:ctx scene.r int 1 run random value 3..7

function surprise:apply/scramble with storage surprise:ctx scene
playsound minecraft:entity.evoker.prepare_attack master @a[distance=..20] ~ ~ ~ 1 0.8
