summon marker ~ ~ ~ {Tags:["surprise.timer","surprise.siege"]}
scoreboard players set @e[type=marker,tag=surprise.siege,sort=nearest,limit=1] surprise.timer 40
scoreboard players set @e[type=marker,tag=surprise.siege,sort=nearest,limit=1] surprise.phase 0
playsound minecraft:event.raid.horn master @a[distance=..40] ~ ~ ~ 1 1
give @s shield[enchantments={unbreaking:3}] 1
