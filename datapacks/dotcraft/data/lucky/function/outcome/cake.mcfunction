setblock ~ ~1 ~ minecraft:cake
summon firework_rocket ~ ~2 ~ {LifeTime:10,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1b,explosions:[{shape:"large_ball",colors:[I;16711935,16776960]}]}}}}
give @s minecraft:cake 3
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 2
