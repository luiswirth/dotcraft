# Run as the build marker. The palette rides on the marker, so several builds can run at once.
execute store result score #p lucky.roll run random value 1..8
execute if score #p lucky.roll matches 1 run data modify entity @s data set value {wall:"minecraft:quartz_block",accent:"minecraft:gold_block",light:"minecraft:sea_lantern",floor:"minecraft:smooth_quartz"}
execute if score #p lucky.roll matches 2 run data modify entity @s data set value {wall:"minecraft:deepslate_bricks",accent:"minecraft:polished_deepslate",light:"minecraft:shroomlight",floor:"minecraft:deepslate_tiles"}
execute if score #p lucky.roll matches 3 run data modify entity @s data set value {wall:"minecraft:purpur_block",accent:"minecraft:end_stone_bricks",light:"minecraft:end_rod",floor:"minecraft:purpur_pillar"}
execute if score #p lucky.roll matches 4 run data modify entity @s data set value {wall:"minecraft:prismarine_bricks",accent:"minecraft:dark_prismarine",light:"minecraft:sea_lantern",floor:"minecraft:prismarine"}
execute if score #p lucky.roll matches 5 run data modify entity @s data set value {wall:"minecraft:blackstone",accent:"minecraft:gilded_blackstone",light:"minecraft:glowstone",floor:"minecraft:polished_blackstone_bricks"}
execute if score #p lucky.roll matches 6 run data modify entity @s data set value {wall:"minecraft:cherry_planks",accent:"minecraft:pink_concrete",light:"minecraft:ochre_froglight",floor:"minecraft:stripped_cherry_log"}
execute if score #p lucky.roll matches 7 run data modify entity @s data set value {wall:"minecraft:copper_block",accent:"minecraft:oxidized_copper",light:"minecraft:verdant_froglight",floor:"minecraft:cut_copper"}
execute if score #p lucky.roll matches 8 run data modify entity @s data set value {wall:"minecraft:amethyst_block",accent:"minecraft:calcite",light:"minecraft:pearlescent_froglight",floor:"minecraft:smooth_basalt"}

execute store result score @s lucky.shape run random value 1..4
execute store result score @s lucky.height run random value 7..16
execute store result score @s lucky.radius run random value 3..6
