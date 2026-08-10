scoreboard players remove @s lucky.luck 3
execute store result score #pick lucky.roll run random value 1..10
execute if score #pick lucky.roll matches 1 run function lucky:outcome/charged
execute if score #pick lucky.roll matches 2 run function lucky:outcome/enderparty
execute if score #pick lucky.roll matches 3 run function lucky:outcome/flight
execute if score #pick lucky.roll matches 4 run function lucky:outcome/liftoff
execute if score #pick lucky.roll matches 5 run function lucky:outcome/treasure
execute if score #pick lucky.roll matches 6 run function lucky:outcome/boss
execute if score #pick lucky.roll matches 7 run function lucky:outcome/midas
execute if score #pick lucky.roll matches 8 run function lucky:outcome/quantum
execute if score #pick lucky.roll matches 9 run function lucky:outcome/gauntlet
execute if score #pick lucky.roll matches 10 run function lucky:outcome/menagerie
