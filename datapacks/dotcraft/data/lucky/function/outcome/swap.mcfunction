# with nobody else online this degrades to a short hop, which is the trivial case of a swap.
execute if entity @a[limit=2] run tag @s add lucky.swapper
execute if entity @a[limit=2] as @r[tag=!lucky.swapper] run tp @s @p[tag=lucky.swapper]
execute if entity @a[limit=2] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.6
tag @s remove lucky.swapper
execute unless entity @a[limit=2] run spreadplayers ~ ~ 8 20 false @s
effect give @s minecraft:nausea 8 0
effect give @s minecraft:slow_falling 15 0
