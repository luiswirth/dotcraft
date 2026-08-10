execute store result score @s surprise.timer run random value 900..4800

execute store result score #s surprise.roll run random value 1..8
execute if score #s surprise.roll matches 1 run function surprise:event/blessing
execute if score #s surprise.roll matches 2 run function surprise:event/companion
execute if score #s surprise.roll matches 3 run function surprise:event/gift
execute if score #s surprise.roll matches 4 run function surprise:event/bloom
execute if score #s surprise.roll matches 5 run function surprise:event/sky
execute if score #s surprise.roll matches 6 run function surprise:event/shower
execute if score #s surprise.roll matches 7 run function surprise:event/pedestal
execute if score #s surprise.roll matches 8 run function surprise:event/hop
