execute at @s if block ~ ~-1 ~ #air run return run function animated_java:wormhole/remove/this
function animated_java:wormhole/variants/open/apply
tag @s add content_lock.wormhole.open
execute at @s run playsound minecraft:block.content_lock.wormhole.open block @a ~ ~ ~ 1 1
