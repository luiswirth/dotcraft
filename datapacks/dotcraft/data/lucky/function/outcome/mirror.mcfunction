summon zombie ~1 ~ ~1 {PersistenceRequired:1b,IsBaby:0b,CustomNameVisible:1b,Attributes:[{id:"minecraft:max_health",base:30},{id:"minecraft:movement_speed",base:0.28}],Health:30f,HandItems:[{id:"minecraft:iron_axe",count:1},{}],ArmorItems:[{id:"minecraft:chainmail_boots",count:1},{id:"minecraft:chainmail_leggings",count:1},{id:"minecraft:chainmail_chestplate",count:1},{id:"minecraft:player_head",count:1}],Tags:["lucky.mirror"]}
execute as @e[type=zombie,tag=lucky.mirror,sort=nearest,limit=1] run data modify entity @s CustomName set value {"text":"not you","color":"dark_purple"}
playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 0.8
particle minecraft:squid_ink ~ ~1 ~ 0.6 0.6 0.6 0.05 60
