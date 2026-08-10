# A staged outcome leaves a marker behind and unfolds over several ticks.
execute as @e[type=marker,tag=lucky.timer] run scoreboard players remove @s lucky.timer 1
execute as @e[type=marker,tag=lucky.timer,scores={lucky.timer=..0}] at @s run function lucky:stage/fire
