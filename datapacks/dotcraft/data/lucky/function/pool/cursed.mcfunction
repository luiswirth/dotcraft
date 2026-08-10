scoreboard players add @s lucky.luck 6
execute store result score #pick lucky.roll run random value 1..10
execute if score #pick lucky.roll matches 1 run function lucky:outcome/anvils
execute if score #pick lucky.roll matches 2 run function lucky:outcome/curse
execute if score #pick lucky.roll matches 3 run function lucky:outcome/lavaspring
execute if score #pick lucky.roll matches 4 run function lucky:outcome/trapped
execute if score #pick lucky.roll matches 5 run function lucky:outcome/warden
execute if score #pick lucky.roll matches 6 run function lucky:outcome/ghost
execute if score #pick lucky.roll matches 7 run function lucky:outcome/storm
execute if score #pick lucky.roll matches 8 run function lucky:outcome/jockey
execute if score #pick lucky.roll matches 9 run function lucky:outcome/meltdown
execute if score #pick lucky.roll matches 10 run function lucky:outcome/mirror
