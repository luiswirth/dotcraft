summon vindicator ~5 ~ ~5 {PersistenceRequired:1b,CustomName:{"text":"the Guest","color":"dark_red"},CustomNameVisible:1b,Attributes:[{id:"minecraft:max_health",base:40},{id:"minecraft:movement_speed",base:0.35}],Health:40f,HandItems:[{id:"minecraft:diamond_axe",count:1},{}],HandDropChances:[1.0f,0.0f]}
effect give @s minecraft:speed 30 1 true
title @s title {"text":"you are being visited","color":"dark_red"}
playsound minecraft:entity.vindicator.celebrate master @a[distance=..30] ~ ~ ~ 1 0.8
