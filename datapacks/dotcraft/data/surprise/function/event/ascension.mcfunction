give @s netherite_helmet[enchantments={protection:5,respiration:4,aqua_affinity:1,unbreaking:5,mending:1,thorns:4}] 1
give @s netherite_chestplate[enchantments={protection:5,unbreaking:5,mending:1,thorns:4}] 1
give @s netherite_leggings[enchantments={protection:5,unbreaking:5,mending:1,swift_sneak:4}] 1
give @s netherite_boots[enchantments={protection:5,feather_falling:5,depth_strider:3,soul_speed:3,unbreaking:5,mending:1}] 1
effect give @s minecraft:health_boost 600 4 true
effect give @s minecraft:absorption 600 4 true
effect give @s minecraft:regeneration 30 2 true
particle minecraft:totem_of_undying ~ ~1 ~ 1 1 1 0.5 300
playsound minecraft:item.totem.use master @a[distance=..40] ~ ~ ~ 1 1
title @s title {"text":"ascended","color":"gold","italic":true}
