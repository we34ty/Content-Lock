execute on target run tag @s add content_lock.im_a_target
execute unless entity @e[tag=content_lock.im_a_target,distance=..24] at @s if entity @e[type=#can_be_attacked_by_zombies,distance=0.1..20] run function content_lock:mobs/customization/active/attacking_on_sight
tag @e remove content_lock.im_a_target