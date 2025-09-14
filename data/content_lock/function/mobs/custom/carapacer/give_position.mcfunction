execute rotated as @e[tag=content_lock.carapacer,tag=!content_lock.carapacer.taken_shape,limit=1,sort=nearest] run tp @s ~ ~ ~ ~ 0
#execute as @e[tag=aj.carapacer.bone.head.tree,limit=1,sort=nearest] rotated as @e[tag=content_lock.carapacer,tag=content_lock.carapacer.taken_shape,limit=1,sort=nearest] run rotate @s ~ ~
tag @s add content_lock.carapacer.taken_shape
tag @e remove content_lock.carapacer.current
tag @e[tag=content_lock.carapacer,tag=!content_lock.carapacer.taken_shape,limit=1,sort=nearest] add content_lock.carapacer.current
tag @e[tag=content_lock.carapacer,tag=!content_lock.carapacer.taken_shape,limit=1,sort=nearest] add content_lock.carapacer.taken_shape

execute if entity @e[tag=content_lock.carapacer.current,limit=1,sort=nearest,nbt={HurtTime:9s}] run playsound minecraft:entity.content_lock.carapacer.damaged hostile @a ~ ~ ~ 1
execute if entity @e[tag=content_lock.carapacer.current,limit=1,sort=nearest,nbt={HurtTime:9s}] run function animated_java:carapacer/variants/damaged/apply
execute if entity @e[tag=content_lock.carapacer.current,limit=1,sort=nearest,nbt={HurtTime:0s}] run function animated_java:carapacer/variants/default/apply

tag @e remove content_lock.im_a_target
execute as @e[tag=content_lock.carapacer.current,limit=1,sort=nearest] on target run tag @s add content_lock.im_a_target

execute unless score @s content_lock.ai_timer matches 100.. if entity @e[tag=content_lock.im_a_target,limit=1,distance=..4] run scoreboard players add @s content_lock.ai_timer 1
execute unless score @s content_lock.ai_timer matches 100.. unless entity @e[tag=content_lock.im_a_target,limit=1,distance=..4] run scoreboard players set @s content_lock.ai_timer 0

execute if score @s content_lock.ai_timer matches 161.. unless score @s content_lock.ai_option matches 1.. if entity @e[tag=content_lock.im_a_target,limit=1,distance=..3] run scoreboard players add @s content_lock.ai_option 1
execute if score @s content_lock.ai_option matches 1.. run function content_lock:mobs/custom/carapacer/attack


execute if score @s content_lock.ai_timer matches 100..160 run function content_lock:mobs/custom/carapacer/turn_big
#execute if entity @s[tag=content_lock.carapacer.has_a_target] if score @s content_lock.ai_timer matches 0 run tag @s remove content_lock.carapacer.has_a_target

execute unless score @s content_lock.ai_option matches 1..10 unless score @s content_lock.ai_timer matches 100..160 unless entity @s[tag=content_lock.carapacer.has_a_target] run function content_lock:mobs/custom/carapacer/has_no_target
execute unless score @s content_lock.ai_option matches 1..10 unless score @s content_lock.ai_timer matches 100..160 if entity @s[tag=content_lock.carapacer.has_a_target] run function content_lock:mobs/custom/carapacer/has_target
execute unless entity @s[tag=content_lock.carapacer.moving] if entity @e[tag=content_lock.carapacer.current,limit=1,sort=nearest,nbt=!{Motion:[0.0,0.0,0.0]}] run tag @s add content_lock.carapacer.moving
execute if entity @s[tag=content_lock.carapacer.moving] if entity @e[tag=content_lock.carapacer.current,limit=1,sort=nearest,nbt={Motion:[0.0,0.0,0.0]}] run tag @s remove content_lock.carapacer.moving

#execute if entity @s[tag=content_lock.carapacer.has_a_target] run function animated_java:carapacer/animations/walk_small_new/stop
#execute if entity @s[tag=content_lock.carapacer.has_a_target] run function animated_java:carapacer/animations/idle_small_new/stop
#execute unless entity @s[tag=content_lock.carapacer.has_a_target] run function animated_java:carapacer/animations/walk_big_new/stop
#execute unless entity @s[tag=content_lock.carapacer.has_a_target] run function animated_java:carapacer/animations/idle_big_new/stop