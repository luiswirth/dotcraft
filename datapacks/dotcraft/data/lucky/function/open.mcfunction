scoreboard players add @s lucky.opened 1
function lucky:milestone

# lucky.luck is a pity counter: a bad outcome raises it, a good one spends it,
# so a run of misfortune bends the next roll upward.
execute store result score #roll lucky.roll run random value 1..100
scoreboard players operation #roll lucky.roll += @s lucky.luck

execute if score #roll lucky.roll matches ..26 run function lucky:pool/cursed
execute if score #roll lucky.roll matches 27..70 run function lucky:pool/common
execute if score #roll lucky.roll matches 71..93 run function lucky:pool/rare
execute if score #roll lucky.roll matches 94.. run function lucky:pool/legendary

# every opening carries a chance of an unrelated procedural garnish,
# so the same outcome never plays out twice the same way.
execute store result score #flair lucky.roll run random value 1..3
execute if score #flair lucky.roll matches 1 run function lucky:rand/effect
execute store result score #flair lucky.roll run random value 1..4
execute if score #flair lucky.roll matches 1 run function lucky:rand/mob
execute store result score #flair lucky.roll run random value 1..3
execute if score #flair lucky.roll matches 1 run function lucky:rand/loot

# the pity counter stays bounded, so neither luck nor misfortune compounds forever.
execute if score @s lucky.luck matches 41.. run scoreboard players set @s lucky.luck 40
execute if score @s lucky.luck matches ..-11 run scoreboard players set @s lucky.luck -10
