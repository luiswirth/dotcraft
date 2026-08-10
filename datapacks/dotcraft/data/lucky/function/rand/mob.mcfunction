# A random companion or nuisance, at a random spot within a few blocks.
execute store result storage lucky:ctx mob.dx int 1 run random value -4..4
execute store result storage lucky:ctx mob.dz int 1 run random value -4..4

execute store result score #m lucky.roll run random value 1..14
execute if score #m lucky.roll matches 1 run data modify storage lucky:ctx mob.id set value "minecraft:allay"
execute if score #m lucky.roll matches 2 run data modify storage lucky:ctx mob.id set value "minecraft:bee"
execute if score #m lucky.roll matches 3 run data modify storage lucky:ctx mob.id set value "minecraft:fox"
execute if score #m lucky.roll matches 4 run data modify storage lucky:ctx mob.id set value "minecraft:panda"
execute if score #m lucky.roll matches 5 run data modify storage lucky:ctx mob.id set value "minecraft:sniffer"
execute if score #m lucky.roll matches 6 run data modify storage lucky:ctx mob.id set value "minecraft:goat"
execute if score #m lucky.roll matches 7 run data modify storage lucky:ctx mob.id set value "minecraft:axolotl"
execute if score #m lucky.roll matches 8 run data modify storage lucky:ctx mob.id set value "minecraft:camel"
execute if score #m lucky.roll matches 9 run data modify storage lucky:ctx mob.id set value "minecraft:snow_golem"
execute if score #m lucky.roll matches 10 run data modify storage lucky:ctx mob.id set value "minecraft:iron_golem"
execute if score #m lucky.roll matches 11 run data modify storage lucky:ctx mob.id set value "minecraft:zombified_piglin"
execute if score #m lucky.roll matches 12 run data modify storage lucky:ctx mob.id set value "minecraft:slime"
execute if score #m lucky.roll matches 13 run data modify storage lucky:ctx mob.id set value "minecraft:cat"
execute if score #m lucky.roll matches 14 run data modify storage lucky:ctx mob.id set value "minecraft:happy_ghast"

function lucky:rand/mob_spawn with storage lucky:ctx mob
