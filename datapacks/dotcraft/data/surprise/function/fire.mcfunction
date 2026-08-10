execute store result score @s surprise.timer run random value 20..60

execute store result score #s surprise.roll run random value 1..10
execute if score #s surprise.roll matches 7.. run function surprise:event/chaos
execute if score #s surprise.roll matches 7.. run scoreboard players set #s surprise.roll 0

execute if score #s surprise.roll matches 1 run function surprise:event/blessing
execute if score #s surprise.roll matches 2 run function surprise:event/companion
execute if score #s surprise.roll matches 3 run function surprise:event/gift
execute if score #s surprise.roll matches 4 run function surprise:event/bloom
execute if score #s surprise.roll matches 5 run function surprise:event/shower
execute if score #s surprise.roll matches 6 run function surprise:event/pedestal

# every firing announces itself, so nothing lands unseen
particle minecraft:totem_of_undying ~ ~1 ~ 0.6 1 0.6 0.3 60
playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.6
