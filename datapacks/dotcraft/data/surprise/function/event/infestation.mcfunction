fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:infested_deepslate replace #minecraft:base_stone_overworld
summon silverfish ~1 ~ ~ {PersistenceRequired:1b}
summon silverfish ~-1 ~ ~ {PersistenceRequired:1b}
summon silverfish ~ ~ ~1 {PersistenceRequired:1b}
summon endermite ~ ~ ~-1 {PersistenceRequired:1b}
effect give @s minecraft:nausea 15 0
playsound minecraft:entity.silverfish.step master @s ~ ~ ~ 2 0.5
