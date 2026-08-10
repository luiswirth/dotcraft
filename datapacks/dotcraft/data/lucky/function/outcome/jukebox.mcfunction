setblock ~1 ~ ~ minecraft:jukebox replace
give @s music_disc_pigstep 1
give @s music_disc_otherside 1
give @s music_disc_5 1
summon parrot ~ ~2 ~ {PersistenceRequired:1b,Variant:2}
summon allay ~-1 ~1 ~ {PersistenceRequired:1b}
playsound minecraft:block.note_block.chime master @a[distance=..20] ~ ~ ~ 2 1.5
