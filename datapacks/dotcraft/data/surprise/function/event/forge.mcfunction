setblock ~1 ~ ~ minecraft:smithing_table replace
setblock ~-1 ~ ~ minecraft:anvil replace
setblock ~ ~ ~1 minecraft:enchanting_table replace
setblock ~ ~ ~-1 minecraft:bookshelf replace
give @s netherite_ingot 2
give @s enchanted_book[stored_enchantments={mending:1}] 2
give @s enchanted_book[stored_enchantments={protection:4,unbreaking:3}] 1
give @s experience_bottle 64
playsound minecraft:block.anvil.use master @a[distance=..20] ~ ~ ~ 1 1
