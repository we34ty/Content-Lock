execute if score @s content_lock.weapons.hit_timer matches 1.. run scoreboard players remove @s content_lock.weapons.hit_timer 1
execute if score @s content_lock.weapons.buffer matches 1.. run scoreboard players remove @s content_lock.weapons.buffer 1
execute if score @s content_lock.weapons.cooldown matches 1.. run scoreboard players remove @s content_lock.weapons.cooldown 1
execute if score @s content_lock.weapons.cooldown matches 1 run attribute @s movement_speed modifier remove content_lock.weapons.attacking
execute if score @s content_lock.weapons.cooldown matches 1 run attribute @s jump_strength modifier remove content_lock.weapons.attacking
execute if score @s content_lock.weapons.weapon_visible_timer matches 1.. run scoreboard players remove @s content_lock.weapons.weapon_visible_timer 1
##Disable the invisibility tag for player weapon if the timer runs out
execute if score @s content_lock.weapons.weapon_visible_timer matches 0 if items entity @s weapon.mainhand *[custom_model_data={strings:["content_lock:weapons.invisible"]}] run item modify entity @s weapon.mainhand content_lock:weapon_disable_invisible
##Run an attack function if a hit was buffered and cooldown is at 0
execute if score @s content_lock.weapons.buffer matches 1.. if score @s content_lock.weapons.cooldown matches 0 at @s run function content_lock:player/weapons/attacked
execute if score @s content_lock.weapons.hit_nr matches 1.. if score @s content_lock.weapons.hit_timer matches 0 run scoreboard players set @s content_lock.weapons.hit_nr 0

##Disable custom weapon animations etc. based on the in-game option
execute if score L content_lock.options.player.custom_weapon_animations matches 0 run tag @s remove content_lock.weapons.enabled
##Function for weapons mode enabled
execute if score L content_lock.options.player.custom_weapon_animations matches 1 if entity @s[tag=content_lock.weapons.enabled] run return run function content_lock:player/weapons/combat_enabled
##Function for weapons mode disabled
execute unless entity @s[tag=content_lock.weapons.enabled] run return run function content_lock:player/weapons/combat_disabled
