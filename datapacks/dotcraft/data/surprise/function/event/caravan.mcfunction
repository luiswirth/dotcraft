summon wandering_trader ~1 ~1 ~ {PersistenceRequired:1b}
summon trader_llama ~2 ~1 ~ {PersistenceRequired:1b}
summon villager ~-1 ~1 ~ {PersistenceRequired:1b,VillagerData:{profession:"librarian",level:5,type:"plains"}}
summon villager ~ ~1 ~-1 {PersistenceRequired:1b,VillagerData:{profession:"weaponsmith",level:5,type:"plains"}}
give @s emerald 32
setblock ~ ~ ~-2 minecraft:bell replace
playsound minecraft:block.bell.use master @a[distance=..20] ~ ~ ~ 2 1
