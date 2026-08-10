scoreboard players add @s lucky.luck 6
execute store result score #pick lucky.roll run random value 1..8
execute if score #pick lucky.roll matches 1 run function lucky:outcome/phantoms
execute if score #pick lucky.roll matches 2 run function lucky:outcome/quicksand
execute if score #pick lucky.roll matches 3 run function lucky:outcome/stormcage
execute if score #pick lucky.roll matches 4 run function lucky:outcome/vexswarm
execute if score #pick lucky.roll matches 5 run function lucky:outcome/creeperain
execute if score #pick lucky.roll matches 6 run function lucky:outcome/infestation
execute if score #pick lucky.roll matches 7 run function lucky:outcome/witherkiss
execute if score #pick lucky.roll matches 8 run function lucky:outcome/deepfreeze
