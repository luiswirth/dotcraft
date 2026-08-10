fill ~-3 ~-1 ~-3 ~3 ~4 ~3 minecraft:polished_deepslate hollow
fill ~-2 ~ ~-2 ~2 ~3 ~2 minecraft:air
setblock ~ ~4 ~ minecraft:sea_lantern replace
setblock ~ ~ ~ minecraft:chest{Items:[{Slot:0b,id:"minecraft:netherite_block",count:1},{Slot:2b,id:"minecraft:diamond_block",count:8},{Slot:4b,id:"minecraft:enchanted_book",count:1,components:{"minecraft:stored_enchantments":{mending:1,unbreaking:3}}},{Slot:6b,id:"minecraft:totem_of_undying",count:3},{Slot:8b,id:"minecraft:experience_bottle",count:64},{Slot:13b,id:"minecraft:enchanted_golden_apple",count:8}]} replace
setblock ~1 ~ ~1 minecraft:shulker_box replace
playsound minecraft:block.vault.open_shutter master @a[distance=..20] ~ ~ ~ 1 1
title @s title {"text":"sealed for you","color":"aqua","italic":true}
