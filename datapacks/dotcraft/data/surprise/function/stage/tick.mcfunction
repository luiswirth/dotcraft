# A staged outcome leaves a marker behind and unfolds over several ticks.
execute as @e[type=marker,tag=surprise.timer] run scoreboard players remove @s surprise.timer 1
execute as @e[type=marker,tag=surprise.timer,scores={surprise.timer=..0}] at @s run function surprise:stage/fire
