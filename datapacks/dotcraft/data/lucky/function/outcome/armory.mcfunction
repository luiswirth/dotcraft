execute store result score #pick lucky.roll run random value 1..4
execute if score #pick lucky.roll matches 1 run give @s netherite_sword[enchantments={sharpness:7,looting:4,fire_aspect:3,sweeping_edge:4,unbreaking:5,mending:1},custom_name={"text":"Last Word","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #pick lucky.roll matches 2 run give @s netherite_pickaxe[enchantments={efficiency:8,fortune:5,unbreaking:5,mending:1},custom_name={"text":"Last Word","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #pick lucky.roll matches 3 run give @s crossbow[enchantments={quick_charge:4,multishot:1,piercing:5,unbreaking:5,mending:1},custom_name={"text":"Last Word","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #pick lucky.roll matches 4 run give @s trident[enchantments={loyalty:3,channeling:1,impaling:5,unbreaking:5,mending:1},custom_name={"text":"Last Word","color":"light_purple","italic":false},rarity="epic"] 1
give @s totem_of_undying 1
particle minecraft:enchant ~ ~2 ~ 1 1 1 1 300
playsound minecraft:block.enchantment_table.use master @a[distance=..30] ~ ~ ~ 1 0.6
