execute at @s if block ~ ~-1 ~ #air run return run function animated_java:wormhole/remove/this
function animated_java:wormhole/variants/default/apply
tag @s remove content_lock.wormhole.open
execute at @s run playsound block.chest.close block @a ~ ~ ~ 1 2
