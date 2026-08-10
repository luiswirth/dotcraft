execute store result score #p surprise.roll run random value 1..5
execute if score #p surprise.roll matches 1 run data modify storage surprise:ctx scene.block set value "minecraft:quartz_block"
execute if score #p surprise.roll matches 2 run data modify storage surprise:ctx scene.block set value "minecraft:blackstone"
execute if score #p surprise.roll matches 3 run data modify storage surprise:ctx scene.block set value "minecraft:prismarine_bricks"
execute if score #p surprise.roll matches 4 run data modify storage surprise:ctx scene.block set value "minecraft:purpur_block"
execute if score #p surprise.roll matches 5 run data modify storage surprise:ctx scene.block set value "minecraft:copper_block"
execute store result storage surprise:ctx scene.h int 1 run random value 2..6

function surprise:apply/pedestal with storage surprise:ctx scene
playsound minecraft:block.stone.place master @s ~ ~ ~ 1 0.8
