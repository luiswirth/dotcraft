$summon marker ~ ~ ~ {Tags:["surprise.pulse","surprise.new"],data:{name:"$(name)",left:$(left),gap:$(gap)}}
execute as @e[type=marker,tag=surprise.new,sort=nearest,limit=1] store result score @s surprise.timer run data get entity @s data.gap
tag @e[type=marker,tag=surprise.new] remove surprise.new
