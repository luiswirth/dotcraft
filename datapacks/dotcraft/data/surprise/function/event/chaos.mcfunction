# The rare tier: loud, disruptive, and never quite the same twice.
execute store result score #c surprise.roll run random value 1..8
execute if score #c surprise.roll matches 1 run function surprise:chaos/gravity
execute if score #c surprise.roll matches 2 run function surprise:chaos/menagerie
execute if score #c surprise.roll matches 3 run function surprise:chaos/scramble
execute if score #c surprise.roll matches 4 run function surprise:chaos/tempest
execute if score #c surprise.roll matches 5 run function surprise:chaos/roulette
execute if score #c surprise.roll matches 6 run function surprise:chaos/tiny
execute if score #c surprise.roll matches 7 run function surprise:chaos/hunt
execute if score #c surprise.roll matches 8 run function surprise:chaos/carnival
