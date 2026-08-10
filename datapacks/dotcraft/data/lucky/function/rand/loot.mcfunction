# One random item in a random amount, dropped where the block stood.
execute store result storage lucky:ctx loot.count int 1 run random value 1..16

execute store result score #l lucky.roll run random value 1..16
execute if score #l lucky.roll matches 1 run data modify storage lucky:ctx loot.id set value "minecraft:diamond"
execute if score #l lucky.roll matches 2 run data modify storage lucky:ctx loot.id set value "minecraft:emerald"
execute if score #l lucky.roll matches 3 run data modify storage lucky:ctx loot.id set value "minecraft:gold_ingot"
execute if score #l lucky.roll matches 4 run data modify storage lucky:ctx loot.id set value "minecraft:netherite_scrap"
execute if score #l lucky.roll matches 5 run data modify storage lucky:ctx loot.id set value "minecraft:amethyst_shard"
execute if score #l lucky.roll matches 6 run data modify storage lucky:ctx loot.id set value "minecraft:echo_shard"
execute if score #l lucky.roll matches 7 run data modify storage lucky:ctx loot.id set value "minecraft:experience_bottle"
execute if score #l lucky.roll matches 8 run data modify storage lucky:ctx loot.id set value "minecraft:ender_pearl"
execute if score #l lucky.roll matches 9 run data modify storage lucky:ctx loot.id set value "minecraft:blaze_rod"
execute if score #l lucky.roll matches 10 run data modify storage lucky:ctx loot.id set value "minecraft:honeycomb"
execute if score #l lucky.roll matches 11 run data modify storage lucky:ctx loot.id set value "minecraft:glowstone"
execute if score #l lucky.roll matches 12 run data modify storage lucky:ctx loot.id set value "minecraft:copper_block"
execute if score #l lucky.roll matches 13 run data modify storage lucky:ctx loot.id set value "minecraft:sculk_catalyst"
execute if score #l lucky.roll matches 14 run data modify storage lucky:ctx loot.id set value "minecraft:sea_lantern"
execute if score #l lucky.roll matches 15 run data modify storage lucky:ctx loot.id set value "minecraft:tnt"
execute if score #l lucky.roll matches 16 run data modify storage lucky:ctx loot.id set value "minecraft:cake"

function lucky:rand/loot_drop with storage lucky:ctx loot
