# The shape is the law relating height to radius: shaft, spire, ziggurat, cup.
scoreboard players operation #d lucky.roll = @s lucky.phase
execute if score @s lucky.shape matches 1 run scoreboard players set #d lucky.roll 0
execute if score @s lucky.shape matches 2 run scoreboard players operation #d lucky.roll /= #two lucky.roll
execute if score @s lucky.shape matches 3 run scoreboard players operation #d lucky.roll /= #three lucky.roll
execute if score @s lucky.shape matches 4 run scoreboard players operation #d lucky.roll /= #two lucky.roll
execute if score @s lucky.shape matches 4 run scoreboard players operation #d lucky.roll *= #minus lucky.roll

scoreboard players operation #r lucky.roll = @s lucky.radius
scoreboard players operation #r lucky.roll -= #d lucky.roll
execute if score #r lucky.roll matches ..1 run scoreboard players set #r lucky.roll 1
execute if score #r lucky.roll matches 9.. run scoreboard players set #r lucky.roll 9

execute store result entity @s data.r int 1 run scoreboard players get #r lucky.roll
execute store result entity @s data.y int 1 run scoreboard players get @s lucky.phase
