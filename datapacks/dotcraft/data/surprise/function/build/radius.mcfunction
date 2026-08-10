# The shape is the law relating height to radius: shaft, spire, ziggurat, cup.
scoreboard players operation #d surprise.roll = @s surprise.phase
execute if score @s surprise.shape matches 1 run scoreboard players set #d surprise.roll 0
execute if score @s surprise.shape matches 2 run scoreboard players operation #d surprise.roll /= #two surprise.roll
execute if score @s surprise.shape matches 3 run scoreboard players operation #d surprise.roll /= #three surprise.roll
execute if score @s surprise.shape matches 4 run scoreboard players operation #d surprise.roll /= #two surprise.roll
execute if score @s surprise.shape matches 4 run scoreboard players operation #d surprise.roll *= #minus surprise.roll

scoreboard players operation #r surprise.roll = @s surprise.radius
scoreboard players operation #r surprise.roll -= #d surprise.roll
execute if score #r surprise.roll matches ..1 run scoreboard players set #r surprise.roll 1
execute if score #r surprise.roll matches 9.. run scoreboard players set #r surprise.roll 9

execute store result entity @s data.r int 1 run scoreboard players get #r surprise.roll
execute store result entity @s data.y int 1 run scoreboard players get @s surprise.phase
