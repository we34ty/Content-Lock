effect give @s resistance 1 4 true
attribute @s knockback_resistance modifier add content_lock.attacking_on_sight 1 add_value
#execute unless entity @s[tag=content_lock.targeting] run return run tag @s add content_lock.targeting
damage @s 1 mob_attack by @e[type=#can_be_attacked_by_zombies,distance=0.1..20,limit=1,sort=random]
effect clear @s resistance
attribute @s knockback_resistance modifier remove content_lock.attacking_on_sight
#data merge entity @s {HurtTime:0s}
#tag @s remove content_lock.targeting
