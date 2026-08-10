scoreboard players set @s lucky.timer 120

execute if score @s lucky.phase matches 1 run title @a[distance=..20] title {"text":"wave I","color":"red"}
execute if score @s lucky.phase matches 1 run summon husk ~2 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:iron_sword",count:1},{}]}
execute if score @s lucky.phase matches 1 run summon husk ~-2 ~ ~ {PersistenceRequired:1b}
execute if score @s lucky.phase matches 1 run summon husk ~ ~ ~2 {PersistenceRequired:1b}

execute if score @s lucky.phase matches 2 run title @a[distance=..20] title {"text":"wave II","color":"red"}
execute if score @s lucky.phase matches 2 run summon stray ~3 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:bow",count:1},{}]}
execute if score @s lucky.phase matches 2 run summon stray ~-3 ~ ~ {PersistenceRequired:1b,HandItems:[{id:"minecraft:bow",count:1},{}]}
execute if score @s lucky.phase matches 2 run summon vindicator ~ ~ ~-3 {PersistenceRequired:1b}

execute if score @s lucky.phase matches 3 run title @a[distance=..20] title {"text":"wave III","color":"dark_red"}
execute if score @s lucky.phase matches 3 run summon ravager ~2 ~ ~2 {PersistenceRequired:1b,Attributes:[{id:"minecraft:max_health",base:70}],Health:70f}
execute if score @s lucky.phase matches 3 run summon evoker ~-2 ~ ~-2 {PersistenceRequired:1b}

execute if score @s lucky.phase matches 4.. run title @a[distance=..20] title {"text":"held the line","color":"gold"}
execute if score @s lucky.phase matches 4.. run playsound minecraft:ui.toast.challenge_complete master @a[distance=..20] ~ ~ ~ 1 1
execute if score @s lucky.phase matches 4.. run setblock ~ ~ ~ minecraft:chest{Items:[{Slot:13b,id:"minecraft:diamond_block",count:2},{Slot:11b,id:"minecraft:netherite_scrap",count:3},{Slot:15b,id:"minecraft:enchanted_golden_apple",count:2},{Slot:4b,id:"minecraft:experience_bottle",count:32}]} replace
execute if score @s lucky.phase matches 4.. run kill @s
