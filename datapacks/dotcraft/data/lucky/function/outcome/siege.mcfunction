summon marker ~ ~ ~ {Tags:["lucky.timer","lucky.siege"]}
scoreboard players set @e[type=marker,tag=lucky.siege,sort=nearest,limit=1] lucky.timer 40
scoreboard players set @e[type=marker,tag=lucky.siege,sort=nearest,limit=1] lucky.phase 0
playsound minecraft:event.raid.horn master @a[distance=..40] ~ ~ ~ 1 1
give @s shield[enchantments={unbreaking:3}] 1
