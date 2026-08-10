execute store result score #wish lucky.roll run random value 1..4
execute if score #wish lucky.roll matches 1 run give @s netherite_sword[enchantments={sharpness:6,looting:4,fire_aspect:3,unbreaking:5,mending:1},custom_name={"text":"Wishmaker","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #wish lucky.roll matches 2 run give @s netherite_pickaxe[enchantments={efficiency:7,fortune:5,unbreaking:5,mending:1},custom_name={"text":"Wishmaker","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #wish lucky.roll matches 3 run give @s bow[enchantments={power:7,punch:4,flame:1,infinity:1,unbreaking:5},custom_name={"text":"Wishmaker","color":"light_purple","italic":false},rarity="epic"] 1
execute if score #wish lucky.roll matches 4 run give @s elytra[enchantments={unbreaking:5,mending:1},custom_name={"text":"Wishmaker","color":"light_purple","italic":false},rarity="epic"] 1
playsound minecraft:block.enchantment_table.use master @a[distance=..20] ~ ~ ~ 1 0.6
particle minecraft:enchant ~ ~2 ~ 1 1 1 1 200
title @s title {"text":"granted","color":"light_purple","italic":true}
