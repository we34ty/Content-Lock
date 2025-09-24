function animated_java:wormhole/summon {args:{}}
tag @e[distance=..0.01,tag=aj.wormhole.root] add content_lock.wormhole
tp @e[distance=..0.01,tag=aj.wormhole.root] ~ ~ ~ 0 0
execute as @e[distance=..0.01,tag=aj.wormhole.root] run data merge entity @s {CustomName:{translate:"content_lock:mob.wormhole"},CustomNameVisible:false}
function animated_java:wormhole/remove/this

execute as @e[distance=..0.01,tag=aj.wormhole.root] run function content_lock:wormhole/spawn_continue

