# One table for every event, whatever set it up: a mined block or the clock.
execute store result score #pick surprise.roll run random value 1..44
execute if score #pick surprise.roll matches 1 run data modify storage surprise:ctx pulse.name set value "alchemy
anglers
armory
ascension
beacon
blessing
bloom
caravan
chaos
citadel
companion
creeperain
deepfreeze
excavation
fireworkshow
forge
gateway
gift
goldrush
greenhouse
guardian
infestation
jukebox
meteor
mimic
monument
pedestal
phantoms
quicksand
scatter
shower
shrink
siege
singularity
skyhook
stampede
starfall
steed
stormcage
trampoline
vault
vexswarm
wildcard
witherkiss"

# every event unfolds in several beats rather than landing all at once
execute store result storage surprise:ctx pulse.left int 1 run random value 2..6
execute store result storage surprise:ctx pulse.gap int 1 run random value 20..70
function surprise:pulse/spawn with storage surprise:ctx pulse
