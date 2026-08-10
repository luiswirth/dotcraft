# A random effect at a random strength, so no two outcomes feel identical.
execute store result storage lucky:ctx effect.duration int 1 run random value 20..240
execute store result storage lucky:ctx effect.amplifier int 1 run random value 0..3

execute store result score #e lucky.roll run random value 1..12
execute if score #e lucky.roll matches 1 run data modify storage lucky:ctx effect.id set value "minecraft:speed"
execute if score #e lucky.roll matches 2 run data modify storage lucky:ctx effect.id set value "minecraft:jump_boost"
execute if score #e lucky.roll matches 3 run data modify storage lucky:ctx effect.id set value "minecraft:strength"
execute if score #e lucky.roll matches 4 run data modify storage lucky:ctx effect.id set value "minecraft:regeneration"
execute if score #e lucky.roll matches 5 run data modify storage lucky:ctx effect.id set value "minecraft:resistance"
execute if score #e lucky.roll matches 6 run data modify storage lucky:ctx effect.id set value "minecraft:haste"
execute if score #e lucky.roll matches 7 run data modify storage lucky:ctx effect.id set value "minecraft:invisibility"
execute if score #e lucky.roll matches 8 run data modify storage lucky:ctx effect.id set value "minecraft:night_vision"
execute if score #e lucky.roll matches 9 run data modify storage lucky:ctx effect.id set value "minecraft:water_breathing"
execute if score #e lucky.roll matches 10 run data modify storage lucky:ctx effect.id set value "minecraft:fire_resistance"
execute if score #e lucky.roll matches 11 run data modify storage lucky:ctx effect.id set value "minecraft:dolphins_grace"
execute if score #e lucky.roll matches 12 run data modify storage lucky:ctx effect.id set value "minecraft:health_boost"

function lucky:rand/effect_apply with storage lucky:ctx effect
