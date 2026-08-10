fill ~-2 ~-1 ~-2 ~2 ~2 ~2 minecraft:polished_deepslate hollow
fill ~-1 ~ ~-1 ~1 ~1 ~1 minecraft:air
setblock ~ ~ ~ minecraft:chest{Items:[{Slot:0b,id:"minecraft:netherite_ingot",count:2},{Slot:2b,id:"minecraft:diamond",count:32},{Slot:4b,id:"minecraft:enchanted_book",count:1,components:{"minecraft:stored_enchantments":{mending:1,unbreaking:3}}},{Slot:6b,id:"minecraft:totem_of_undying",count:1},{Slot:8b,id:"minecraft:experience_bottle",count:64}]} replace
setblock ~ ~2 ~ minecraft:sea_lantern replace
playsound minecraft:block.vault.open_shutter master @s ~ ~ ~ 1 1
title @s title {"text":"sealed for you","color":"aqua","italic":true}
