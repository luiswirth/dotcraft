scoreboard players set @s lucky.timer 60

execute if score @s lucky.phase matches 1 run title @a[distance=..12] actionbar {"text":"the ground is warm","color":"gold"}
execute if score @s lucky.phase matches 1 run playsound minecraft:block.lava.ambient master @a[distance=..12] ~ ~ ~ 2 0.6
execute if score @s lucky.phase matches 1 run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:magma_block replace #minecraft:base_stone_overworld

execute if score @s lucky.phase matches 2 run particle minecraft:lava ~ ~ ~ 3 1 3 0.1 120
execute if score @s lucky.phase matches 2 run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:magma_block replace #minecraft:dirt
execute if score @s lucky.phase matches 2 run summon magma_cube ~ ~1 ~ {Size:2,PersistenceRequired:1b}

execute if score @s lucky.phase matches 3.. run title @a[distance=..12] actionbar {"text":"it cools","color":"gray"}
execute if score @s lucky.phase matches 3.. run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:obsidian replace minecraft:magma_block
execute if score @s lucky.phase matches 3.. run kill @s
