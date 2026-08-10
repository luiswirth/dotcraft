scoreboard players set @s lucky.timer 140

execute if score @s lucky.phase matches 1 run title @a[distance=..30] title {"text":"they found you","color":"dark_red"}
execute if score @s lucky.phase matches 1 run summon pillager ~4 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:crossbow",count:1},{}]}
execute if score @s lucky.phase matches 1 run summon pillager ~-4 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:crossbow",count:1},{}]}
execute if score @s lucky.phase matches 1 run summon vindicator ~ ~ ~4 {PersistenceRequired:1b}

execute if score @s lucky.phase matches 2 run summon ravager ~4 ~ ~4 {PersistenceRequired:1b,Attributes:[{id:"minecraft:max_health",base:80}],Health:80f,Passengers:[{id:"minecraft:pillager",PersistenceRequired:1b,HandItems:[{id:"minecraft:crossbow",count:1},{}]}]}
execute if score @s lucky.phase matches 2 run summon evoker ~-4 ~ ~-4 {PersistenceRequired:1b}

execute if score @s lucky.phase matches 3.. run title @a[distance=..30] title {"text":"spoils","color":"gold"}
execute if score @s lucky.phase matches 3.. run setblock ~ ~ ~ minecraft:chest{Items:[{Slot:0b,id:"minecraft:diamond_block",count:3},{Slot:2b,id:"minecraft:netherite_scrap",count:4},{Slot:4b,id:"minecraft:totem_of_undying",count:2},{Slot:6b,id:"minecraft:experience_bottle",count:64},{Slot:8b,id:"minecraft:enchanted_golden_apple",count:3}]} replace
execute if score @s lucky.phase matches 3.. run kill @s
