particle minecraft:reverse_portal ~ ~2 ~ 0.2 0.2 0.2 1 300
playsound minecraft:block.beacon.deactivate master @a[distance=..30] ~ ~ ~ 2 0.5
tp @e[type=!player,type=!marker,distance=..25,sort=nearest,limit=40] ~ ~2 ~
effect give @e[type=!player,distance=..6] minecraft:levitation 6 4
effect give @e[type=!player,distance=..6] minecraft:glowing 20 0
effect give @s minecraft:resistance 20 4 true
