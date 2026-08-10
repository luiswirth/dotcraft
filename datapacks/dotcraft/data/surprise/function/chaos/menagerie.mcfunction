execute store result storage surprise:ctx mob.dx int 1 run random value -6..6
execute store result storage surprise:ctx mob.dz int 1 run random value -6..6

execute store result score #m surprise.roll run random value 1..8
execute if score #m surprise.roll matches 1 run data modify storage surprise:ctx mob.id set value "minecraft:chicken"
execute if score #m surprise.roll matches 2 run data modify storage surprise:ctx mob.id set value "minecraft:goat"
execute if score #m surprise.roll matches 3 run data modify storage surprise:ctx mob.id set value "minecraft:pig"
execute if score #m surprise.roll matches 4 run data modify storage surprise:ctx mob.id set value "minecraft:slime"
execute if score #m surprise.roll matches 5 run data modify storage surprise:ctx mob.id set value "minecraft:bat"
execute if score #m surprise.roll matches 6 run data modify storage surprise:ctx mob.id set value "minecraft:squid"
execute if score #m surprise.roll matches 7 run data modify storage surprise:ctx mob.id set value "minecraft:rabbit"
execute if score #m surprise.roll matches 8 run data modify storage surprise:ctx mob.id set value "minecraft:cow"

function surprise:apply/rain with storage surprise:ctx mob
function surprise:apply/rain with storage surprise:ctx mob
function surprise:apply/rain with storage surprise:ctx mob
function surprise:apply/rain with storage surprise:ctx mob
function surprise:apply/rain with storage surprise:ctx mob
title @s actionbar {"text":"look up","color":"yellow"}
