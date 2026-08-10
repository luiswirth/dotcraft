execute as @e[type=marker,tag=surprise.pulse] run scoreboard players remove @s surprise.timer 1
execute as @e[type=marker,tag=surprise.pulse,scores={surprise.timer=..0}] at @s run function surprise:pulse/beat
