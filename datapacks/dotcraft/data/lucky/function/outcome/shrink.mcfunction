tag @s add lucky.resized
attribute @s minecraft:scale base set 0.4
attribute @s minecraft:step_height base set 0.2
effect give @s minecraft:speed 45 1
schedule function lucky:resize_end 45s replace
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 2 2
