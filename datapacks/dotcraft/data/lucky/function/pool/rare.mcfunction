scoreboard players remove @s lucky.luck 3
execute store result score #pick lucky.roll run random value 1..10
execute if score #pick lucky.roll matches 1 run function lucky:outcome/meteor
execute if score #pick lucky.roll matches 2 run function lucky:outcome/siege
execute if score #pick lucky.roll matches 3 run function lucky:outcome/excavation
execute if score #pick lucky.roll matches 4 run function lucky:outcome/singularity
execute if score #pick lucky.roll matches 5 run function lucky:outcome/skyhook
execute if score #pick lucky.roll matches 6 run function lucky:outcome/gateway
execute if score #pick lucky.roll matches 7 run function lucky:outcome/forge
execute if score #pick lucky.roll matches 8 run function lucky:outcome/guardian
execute if score #pick lucky.roll matches 9 run function lucky:outcome/mimic
execute if score #pick lucky.roll matches 10 run function lucky:outcome/goldrush
