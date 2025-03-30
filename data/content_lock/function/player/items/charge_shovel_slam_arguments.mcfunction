data merge storage content_lock:saved_stats {damage:1.0f,range:1.0f,UUID:[],knockback:1.0d}
execute store result storage content_lock:saved_stats damage float 0.01 run attribute @s attack_damage get 100
execute store result storage content_lock:saved_stats damage float 0.01 run attribute @s attack_damage get 100
execute store result storage content_lock:saved_stats range float 0.01 run attribute @s entity_interaction_range get 100
execute store result storage content_lock:saved_stats knockback double 0.0033 run attribute @s attack_knockback get 100
execute store result storage content_lock:saved_stats attack_speed double 0.01 run attribute @s attack_speed get 100
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/items/charge_shovel_slam with storage content_lock:saved_stats
tag @s remove content_lock.charged_shovel
tag @s remove content_lock.charging_shovel
tag @s remove content_lock.charging_shovel_atm
scoreboard players set @s content_lock.shovel_charge 0