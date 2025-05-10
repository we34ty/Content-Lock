execute unless entity @s[tag=content_lock.tatsugeki.moving_forward] if entity @e[tag=content_lock.tatsugeki_movement_check,distance=..3.99] run scoreboard players add @s content_lock.anchor_movement 2
execute unless entity @s[tag=content_lock.tatsugeki.moving_forward] rotated ~ 0 positioned ^ ^ ^-4 run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.tatsugeki_movement_check"],Duration:2} 

execute unless entity @s[tag=content_lock.tatsugeki.moving_forward] if predicate content_lock:sneaking run scoreboard players add @s content_lock.anchor_sneak 2

execute if score @s content_lock.anchor_movement matches 1.. run scoreboard players remove @s content_lock.anchor_movement 1
execute if score @s content_lock.anchor_sneak matches 1.. run scoreboard players remove @s content_lock.anchor_sneak 1

execute unless entity @s[tag=content_lock.tatsugeki.anchor_sneak] if score @s content_lock.anchor_sneak matches 20.. if entity @s[nbt={OnGround:0b}] run function content_lock:player/items/custom_weapons/tatsugeki/launch_upward
execute unless entity @s[tag=content_lock.tatsugeki.moving_forward] if score @s content_lock.anchor_movement matches 20.. run function content_lock:player/items/custom_weapons/tatsugeki/launch_forward
execute if entity @s[tag=content_lock.tatsugeki.moving_forward] run function content_lock:player/items/custom_weapons/tatsugeki/forward_loop_check
execute if entity @s[tag=content_lock.tatsugeki.anchor_sneak] run function content_lock:player/items/custom_weapons/tatsugeki/forward_loop_check