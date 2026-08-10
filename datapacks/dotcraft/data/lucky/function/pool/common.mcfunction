scoreboard players remove @s lucky.luck 1
execute store result score #pick lucky.roll run random value 1..12
execute if score #pick lucky.roll matches 1 run function lucky:outcome/fireworkshow
execute if score #pick lucky.roll matches 2 run function lucky:outcome/stampede
execute if score #pick lucky.roll matches 3 run function lucky:outcome/anglers
execute if score #pick lucky.roll matches 4 run function lucky:outcome/greenhouse
execute if score #pick lucky.roll matches 5 run function lucky:outcome/jukebox
execute if score #pick lucky.roll matches 6 run function lucky:outcome/trampoline
execute if score #pick lucky.roll matches 7 run function lucky:outcome/alchemy
execute if score #pick lucky.roll matches 8 run function lucky:outcome/caravan
execute if score #pick lucky.roll matches 9 run function lucky:outcome/shrink
execute if score #pick lucky.roll matches 10 run function lucky:outcome/steed
execute if score #pick lucky.roll matches 11 run function lucky:outcome/beacon
execute if score #pick lucky.roll matches 12 run function lucky:outcome/scatter
