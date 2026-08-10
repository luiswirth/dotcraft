summon horse ~1 ~1 ~ {Tame:1b,PersistenceRequired:1b,Variant:1024,SaddleItem:{id:"minecraft:saddle",count:1},ArmorItem:{id:"minecraft:diamond_horse_armor",count:1},Attributes:[{id:"minecraft:movement_speed",base:0.34},{id:"minecraft:jump_strength",base:1.1},{id:"minecraft:max_health",base:30}],Health:30f,CustomName:{"text":"Gift Horse","color":"gold"},CustomNameVisible:1b}
execute as @e[type=horse,sort=nearest,limit=1,distance=..4] run function lucky:tame
playsound minecraft:entity.horse.ambient master @s ~ ~ ~ 2 1
