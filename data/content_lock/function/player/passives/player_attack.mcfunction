advancement revoke @s only content_lock:checks/player_hurt_entity
execute if entity @s[tag=content_lock.touch_of_malice_active] run attribute @s attack_damage modifier remove content_lock.touch_of_malice
execute if entity @s[tag=content_lock.touch_of_malice_active] run tag @s remove content_lock.touch_of_malice_active

execute if items entity @s weapon.mainhand *[custom_data~{"content_lock:weapon":{}}] run return run function content_lock:player/weapons/attacked


execute if score @s content_lock.weapons.attack_speed_timer matches 1.. run tag @s add content_lock.weapons.cancel_attack
execute store result score @s content_lock.temp1 run attribute @s attack_speed get 1000
scoreboard players set @s content_lock.weapons.attack_speed_timer 20000
scoreboard players operation @s content_lock.weapons.attack_speed_timer /= @s content_lock.temp1
scoreboard players add @s content_lock.weapons.attack_speed_timer 1
execute if entity @s[tag=content_lock.weapons.cancel_attack] run return run tag @s remove content_lock.weapons.cancel_attack

data merge storage content_lock:saved_stats {UUID:[I;0,0,0,0],damage_type:"melee",physical_damage:1.0f,fire_damage:0.0f,frost_damage:0.0f,magic_damage:0.0f,wither_damage:0.0f,ender_damage:0.0f,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/passives/damage/calculate_damage_no_item with storage content_lock:saved_stats

tag @s add content_lock.weapons.attacking
execute at @s as @e[type=!#entities,distance=..40] run function content_lock:player/weapons/detect_whos_attacked with storage content_lock:weapon_stats data
tag @s remove content_lock.weapons.attacking