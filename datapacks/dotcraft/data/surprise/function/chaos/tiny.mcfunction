tag @a add surprise.resized
attribute @a minecraft:scale base set 0.35
attribute @a minecraft:step_height base set 0.2
effect give @a minecraft:speed 60 1
schedule function surprise:chaos/tiny_end 60s replace
title @a title {"text":"everyone is small now","color":"aqua","italic":true}
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 2
