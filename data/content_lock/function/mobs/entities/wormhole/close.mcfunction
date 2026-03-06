function animated_java:wormhole/variants/default/apply
tag @s remove content_lock.wormhole.open
execute at @s run playsound content_lock:block.wormhole.close block @a ~ ~ ~ 1 1
