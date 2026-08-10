execute store result storage surprise:ctx mob.dx int 1 run random value -3..3
execute store result storage surprise:ctx mob.dz int 1 run random value -3..3

execute store result score #m surprise.roll run random value 1..10
execute if score #m surprise.roll matches 1 run data modify storage surprise:ctx mob.id set value "minecraft:allay"
execute if score #m surprise.roll matches 2 run data modify storage surprise:ctx mob.id set value "minecraft:cat"
execute if score #m surprise.roll matches 3 run data modify storage surprise:ctx mob.id set value "minecraft:fox"
execute if score #m surprise.roll matches 4 run data modify storage surprise:ctx mob.id set value "minecraft:panda"
execute if score #m surprise.roll matches 5 run data modify storage surprise:ctx mob.id set value "minecraft:sniffer"
execute if score #m surprise.roll matches 6 run data modify storage surprise:ctx mob.id set value "minecraft:axolotl"
execute if score #m surprise.roll matches 7 run data modify storage surprise:ctx mob.id set value "minecraft:camel"
execute if score #m surprise.roll matches 8 run data modify storage surprise:ctx mob.id set value "minecraft:parrot"
execute if score #m surprise.roll matches 9 run data modify storage surprise:ctx mob.id set value "minecraft:happy_ghast"
execute if score #m surprise.roll matches 10 run data modify storage surprise:ctx mob.id set value "minecraft:snow_golem"

function surprise:apply/mob with storage surprise:ctx mob
playsound minecraft:entity.allay.item_given master @s ~ ~ ~ 0.6 1
