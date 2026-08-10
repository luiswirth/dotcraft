execute store result score #roll lucky.roll run random value 1..6
execute if score #roll lucky.roll matches 1 run function lucky:outcome/treasure
execute if score #roll lucky.roll matches 2 run function lucky:outcome/horde
execute if score #roll lucky.roll matches 3 run function lucky:outcome/lightning
execute if score #roll lucky.roll matches 4 run function lucky:outcome/boom
execute if score #roll lucky.roll matches 5 run function lucky:outcome/blessing
execute if score #roll lucky.roll matches 6 run function lucky:outcome/pests
