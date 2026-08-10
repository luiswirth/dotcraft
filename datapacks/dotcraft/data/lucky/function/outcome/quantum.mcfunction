setblock ~3 ~ ~ minecraft:yellow_glazed_terracotta replace
setblock ~-3 ~ ~ minecraft:yellow_glazed_terracotta replace
setblock ~ ~ ~3 minecraft:yellow_glazed_terracotta replace
setblock ~ ~ ~-3 minecraft:yellow_glazed_terracotta replace
setblock ~ ~3 ~ minecraft:yellow_glazed_terracotta replace
particle minecraft:reverse_portal ~ ~1 ~ 1 1 1 0.4 120
playsound minecraft:block.conduit.activate master @s ~ ~ ~ 1 1.4
title @s actionbar {"text":"it split","color":"yellow"}
