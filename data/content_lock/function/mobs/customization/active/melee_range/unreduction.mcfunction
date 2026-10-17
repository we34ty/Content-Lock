tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target
execute unless entity @e[tag=content_lock.im_a_target] run tag @p add content_lock.im_a_target

execute positioned ~-1 ~ ~-1 unless entity @n[tag=content_lock.im_a_target,dx=2,dz=2,dy=2] run return 0

tag @s remove content_lock.limited_attack_range.reduced
attribute @s attack_damage modifier remove content_lock.limited_attack_range