setblock ~ ~1 ~ minecraft:chest{Items:[{Slot:13b,id:"minecraft:experience_bottle",count:32}]} replace
function lucky:rand/loot
function lucky:rand/loot
function lucky:rand/mob
playsound minecraft:ui.toast.challenge_complete master @a[distance=..40] ~ ~ ~ 1 1
particle minecraft:end_rod ~ ~2 ~ 2 2 2 0.05 200
kill @s
