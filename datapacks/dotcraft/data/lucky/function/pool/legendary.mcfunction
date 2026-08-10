scoreboard players set @s lucky.luck 0
execute store result score #pick lucky.roll run random value 1..5
execute if score #pick lucky.roll matches 1 run function lucky:outcome/starfall
execute if score #pick lucky.roll matches 2 run function lucky:outcome/armory
execute if score #pick lucky.roll matches 3 run function lucky:outcome/vault
execute if score #pick lucky.roll matches 4 run function lucky:outcome/ascension
execute if score #pick lucky.roll matches 5 run function lucky:outcome/citadel
