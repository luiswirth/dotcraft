scoreboard players remove @s lucky.luck 1
execute store result score #pick lucky.roll run random value 1..14
execute if score #pick lucky.roll matches 1 run function lucky:outcome/allay
execute if score #pick lucky.roll matches 2 run function lucky:outcome/bees
execute if score #pick lucky.roll matches 3 run function lucky:outcome/cake
execute if score #pick lucky.roll matches 4 run function lucky:outcome/cats
execute if score #pick lucky.roll matches 5 run function lucky:outcome/chickens
execute if score #pick lucky.roll matches 6 run function lucky:outcome/wolves
execute if score #pick lucky.roll matches 7 run function lucky:outcome/disc
execute if score #pick lucky.roll matches 8 run function lucky:outcome/market
execute if score #pick lucky.roll matches 9 run function lucky:outcome/bounce
execute if score #pick lucky.roll matches 10 run function lucky:outcome/blink
execute if score #pick lucky.roll matches 11 run function lucky:outcome/grow
execute if score #pick lucky.roll matches 12 run function lucky:outcome/shrink
execute if score #pick lucky.roll matches 13 run function lucky:outcome/steed
execute if score #pick lucky.roll matches 14 run function lucky:outcome/swap
