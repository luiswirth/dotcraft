execute store result storage surprise:ctx effect.duration int 1 run random value 60..600
execute store result storage surprise:ctx effect.amplifier int 1 run random value 0..2

execute store result score #e surprise.roll run random value 1..10
execute if score #e surprise.roll matches 1 run data modify storage surprise:ctx effect.id set value "minecraft:speed"
execute if score #e surprise.roll matches 2 run data modify storage surprise:ctx effect.id set value "minecraft:jump_boost"
execute if score #e surprise.roll matches 3 run data modify storage surprise:ctx effect.id set value "minecraft:strength"
execute if score #e surprise.roll matches 4 run data modify storage surprise:ctx effect.id set value "minecraft:regeneration"
execute if score #e surprise.roll matches 5 run data modify storage surprise:ctx effect.id set value "minecraft:resistance"
execute if score #e surprise.roll matches 6 run data modify storage surprise:ctx effect.id set value "minecraft:haste"
execute if score #e surprise.roll matches 7 run data modify storage surprise:ctx effect.id set value "minecraft:night_vision"
execute if score #e surprise.roll matches 8 run data modify storage surprise:ctx effect.id set value "minecraft:water_breathing"
execute if score #e surprise.roll matches 9 run data modify storage surprise:ctx effect.id set value "minecraft:fire_resistance"
execute if score #e surprise.roll matches 10 run data modify storage surprise:ctx effect.id set value "minecraft:luck"

function surprise:apply/effect with storage surprise:ctx effect
particle minecraft:happy_villager ~ ~1 ~ 1 1.5 1 0.2 120
playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 1.4
title @s actionbar {"text":"a blessing","color":"green"}
