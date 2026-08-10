fill ~-3 ~ ~-3 ~3 ~2 ~3 minecraft:water replace #minecraft:air
summon tropical_fish ~1 ~1 ~1 {PersistenceRequired:1b}
summon tropical_fish ~-1 ~1 ~-1 {PersistenceRequired:1b}
summon dolphin ~ ~1 ~2 {PersistenceRequired:1b}
give @s fishing_rod[enchantments={luck_of_the_sea:4,lure:4,unbreaking:3,mending:1},custom_name={"text":"Deep Line","color":"aqua","italic":false}] 1
effect give @s minecraft:water_breathing 60 0 true
effect give @s minecraft:conduit_power 60 0 true
