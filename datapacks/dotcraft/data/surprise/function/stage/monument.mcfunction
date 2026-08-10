scoreboard players set @s surprise.timer 10
function surprise:build/radius

execute if score @s surprise.phase matches 1 run function surprise:build/floor with entity @s data
execute if score @s surprise.phase matches 1 run playsound minecraft:block.beacon.activate master @a[distance=..40] ~ ~ ~ 1 0.8

execute if score @s surprise.phase < @s surprise.height run function surprise:build/layer with entity @s data
execute if score @s surprise.phase < @s surprise.height run particle minecraft:cloud ~ ~ ~ 3 0.2 3 0.05 60
execute if score @s surprise.phase < @s surprise.height run playsound minecraft:block.stone.place master @a[distance=..30] ~ ~ ~ 1 1

execute if score @s surprise.phase >= @s surprise.height run function surprise:build/roof with entity @s data
execute if score @s surprise.phase >= @s surprise.height run function surprise:stage/monument_finish
