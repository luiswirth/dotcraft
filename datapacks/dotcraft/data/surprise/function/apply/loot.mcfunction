# One random item in a random amount, dropped where the block stood.
execute store result storage surprise:ctx loot.count int 1 run random value 1..16

execute store result score #l surprise.roll run random value 1..16
execute if score #l surprise.roll matches 1 run data modify storage surprise:ctx loot.id set value "minecraft:diamond"
execute if score #l surprise.roll matches 2 run data modify storage surprise:ctx loot.id set value "minecraft:emerald"
execute if score #l surprise.roll matches 3 run data modify storage surprise:ctx loot.id set value "minecraft:gold_ingot"
execute if score #l surprise.roll matches 4 run data modify storage surprise:ctx loot.id set value "minecraft:netherite_scrap"
execute if score #l surprise.roll matches 5 run data modify storage surprise:ctx loot.id set value "minecraft:amethyst_shard"
execute if score #l surprise.roll matches 6 run data modify storage surprise:ctx loot.id set value "minecraft:echo_shard"
execute if score #l surprise.roll matches 7 run data modify storage surprise:ctx loot.id set value "minecraft:experience_bottle"
execute if score #l surprise.roll matches 8 run data modify storage surprise:ctx loot.id set value "minecraft:ender_pearl"
execute if score #l surprise.roll matches 9 run data modify storage surprise:ctx loot.id set value "minecraft:blaze_rod"
execute if score #l surprise.roll matches 10 run data modify storage surprise:ctx loot.id set value "minecraft:honeycomb"
execute if score #l surprise.roll matches 11 run data modify storage surprise:ctx loot.id set value "minecraft:glowstone"
execute if score #l surprise.roll matches 12 run data modify storage surprise:ctx loot.id set value "minecraft:copper_block"
execute if score #l surprise.roll matches 13 run data modify storage surprise:ctx loot.id set value "minecraft:sculk_catalyst"
execute if score #l surprise.roll matches 14 run data modify storage surprise:ctx loot.id set value "minecraft:sea_lantern"
execute if score #l surprise.roll matches 15 run data modify storage surprise:ctx loot.id set value "minecraft:tnt"
execute if score #l surprise.roll matches 16 run data modify storage surprise:ctx loot.id set value "minecraft:cake"

function surprise:apply/loot_drop with storage surprise:ctx loot
