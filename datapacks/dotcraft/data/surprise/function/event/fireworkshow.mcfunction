summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:2,explosions:[{shape:"star",colors:[I;16711680,16776960],has_trail:1b}]}}}}
summon firework_rocket ~2 ~1 ~2 {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:2,explosions:[{shape:"large_ball",colors:[I;65535,255],has_twinkle:1b}]}}}}
summon firework_rocket ~-2 ~1 ~-2 {LifeTime:40,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:2,explosions:[{shape:"creeper",colors:[I;65280],has_trail:1b}]}}}}
give @s firework_rocket[fireworks={flight_duration:3}] 32
playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 2 1
