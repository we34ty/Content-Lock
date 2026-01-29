execute unless entity @n[tag=aj.carapacer.root,tag=!content_lock.carapacer.taken_shape] run function animated_java:carapacer/summon with storage aj:temp
execute if entity @s[tag=!content_lock.carapacer.taken_shape] as @n[tag=aj.carapacer.root,tag=!content_lock.carapacer.taken_shape] run function content_lock:mobs/custom/carapacer/give_position

