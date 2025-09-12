execute unless entity @e[tag=aj.carapacer.root,tag=!content_lock.carapacer.taken_shape] run function animated_java:carapacer/summon with storage aj:temp
execute as @e[tag=aj.carapacer.root,tag=!content_lock.carapacer.taken_shape,limit=1,sort=nearest] if entity @e[tag=content_lock.carapacer,tag=!content_lock.carapacer.taken_shape] run function content_lock:mobs/custom/carapacer/give_position

