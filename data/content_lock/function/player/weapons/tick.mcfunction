execute if score @s content_lock.weapons.hit_timer matches 1.. run scoreboard players remove @s content_lock.weapons.hit_timer 1
execute if score @s content_lock.weapons.cooldown matches 1.. run scoreboard players remove @s content_lock.weapons.cooldown 1
execute if score @s content_lock.weapons.cooldown matches 1 run attribute @s movement_speed modifier remove content_lock.weapons.attacking
execute if score @s content_lock.weapons.cooldown matches 1 run attribute @s jump_strength modifier remove content_lock.weapons.attacking
execute if score @s content_lock.weapons.hit_nr matches 1.. if score @s content_lock.weapons.hit_timer matches 0 run scoreboard players set @s content_lock.weapons.hit_nr 0

execute if entity @s[tag=content_lock.weapons.enabled] run return run function content_lock:player/weapons/combat_enabled
execute unless entity @s[tag=content_lock.weapons.enabled] run return run function content_lock:player/weapons/combat_disabled