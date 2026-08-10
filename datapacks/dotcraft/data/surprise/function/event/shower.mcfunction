execute store result storage surprise:ctx show.dur int 1 run random value 8..40
execute store result storage surprise:ctx show.a int 1 run random value 0..16777215
execute store result storage surprise:ctx show.b int 1 run random value 0..16777215

function surprise:apply/rocket with storage surprise:ctx show
function surprise:apply/rocket with storage surprise:ctx show
function surprise:apply/rocket with storage surprise:ctx show
playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1 1
