# Every player carries their own countdown, so surprises never land in step.
scoreboard players remove @a surprise.timer 1
execute as @a[scores={surprise.timer=..0}] at @s run function surprise:fire
