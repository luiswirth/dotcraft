fill ~2 ~-1 ~-2 ~2 ~4 ~2 minecraft:obsidian
fill ~2 ~ ~-1 ~2 ~3 ~1 minecraft:nether_portal[axis=z]
summon zombified_piglin ~3 ~ ~ {PersistenceRequired:1b}
give @s obsidian 20
give @s flint_and_steel 1
give @s gold_ingot 32
playsound minecraft:block.portal.trigger master @a[distance=..20] ~ ~ ~ 1 1.4
