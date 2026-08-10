execute store result storage surprise:ctx gift.count int 1 run random value 1..12

execute store result score #g surprise.roll run random value 1..12
execute if score #g surprise.roll matches 1 run data modify storage surprise:ctx gift.id set value "minecraft:diamond"
execute if score #g surprise.roll matches 2 run data modify storage surprise:ctx gift.id set value "minecraft:emerald"
execute if score #g surprise.roll matches 3 run data modify storage surprise:ctx gift.id set value "minecraft:golden_apple"
execute if score #g surprise.roll matches 4 run data modify storage surprise:ctx gift.id set value "minecraft:experience_bottle"
execute if score #g surprise.roll matches 5 run data modify storage surprise:ctx gift.id set value "minecraft:ender_pearl"
execute if score #g surprise.roll matches 6 run data modify storage surprise:ctx gift.id set value "minecraft:amethyst_shard"
execute if score #g surprise.roll matches 7 run data modify storage surprise:ctx gift.id set value "minecraft:honeycomb"
execute if score #g surprise.roll matches 8 run data modify storage surprise:ctx gift.id set value "minecraft:netherite_scrap"
execute if score #g surprise.roll matches 9 run data modify storage surprise:ctx gift.id set value "minecraft:firework_rocket"
execute if score #g surprise.roll matches 10 run data modify storage surprise:ctx gift.id set value "minecraft:cake"
execute if score #g surprise.roll matches 11 run data modify storage surprise:ctx gift.id set value "minecraft:sea_lantern"
execute if score #g surprise.roll matches 12 run data modify storage surprise:ctx gift.id set value "minecraft:echo_shard"

function surprise:apply/gift with storage surprise:ctx gift
particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.6 0.4 0.2 40
