scoreboard players set @s surprise.timer 30

execute if score @s surprise.phase matches 1 run title @a[distance=..40] actionbar {"text":"something is falling","color":"red"}
execute if score @s surprise.phase matches 1.. run particle minecraft:flame ~ ~20 ~ 2 2 2 0.1 200
execute if score @s surprise.phase matches 1.. run playsound minecraft:entity.blaze.shoot master @a[distance=..40] ~ ~ ~ 3 0.4

execute if score @s surprise.phase matches 4.. run summon fireball ~ ~30 ~ {ExplosionPower:3,power:[0.0,-1.6,0.0]}
execute if score @s surprise.phase matches 4.. run summon fireball ~3 ~34 ~2 {ExplosionPower:2,power:[0.0,-1.6,0.0]}
execute if score @s surprise.phase matches 4.. run summon fireball ~-3 ~34 ~-2 {ExplosionPower:2,power:[0.0,-1.6,0.0]}
execute if score @s surprise.phase matches 4.. run setblock ~ ~-3 ~ minecraft:ancient_debris replace
execute if score @s surprise.phase matches 4.. run setblock ~1 ~-3 ~ minecraft:ancient_debris replace
execute if score @s surprise.phase matches 4.. run setblock ~ ~-3 ~1 minecraft:ancient_debris replace
execute if score @s surprise.phase matches 4.. run kill @s
