scoreboard players set @s lucky.timer 10
function lucky:build/radius

execute if score @s lucky.phase matches 1 run function lucky:build/floor with entity @s data
execute if score @s lucky.phase matches 1 run playsound minecraft:block.beacon.activate master @a[distance=..40] ~ ~ ~ 1 0.8

execute if score @s lucky.phase < @s lucky.height run function lucky:build/layer with entity @s data
execute if score @s lucky.phase < @s lucky.height run particle minecraft:cloud ~ ~ ~ 3 0.2 3 0.05 60
execute if score @s lucky.phase < @s lucky.height run playsound minecraft:block.stone.place master @a[distance=..30] ~ ~ ~ 1 1

execute if score @s lucky.phase >= @s lucky.height run function lucky:build/roof with entity @s data
execute if score @s lucky.phase >= @s lucky.height run function lucky:stage/monument_finish
