data merge storage content_lock:saved_stats {damage:1.0f,range:1.0f,half_range:1.0f,explosion_range:1.0f,half_explosion_range:1.0f,attack_speed:1,fire_duration:1,UUID:[]}
execute store result storage content_lock:saved_stats damage float 0.01 run attribute @s attack_damage get 100
execute store result storage content_lock:saved_stats range float 0.005 run attribute @s attack_knockback get 1000
execute store result storage content_lock:saved_stats half_range float 0.0025 run attribute @s attack_knockback get 1000
execute store result storage content_lock:saved_stats explosion_range float 0.02 run attribute @s attack_knockback get 1000
execute store result storage content_lock:saved_stats half_explosion_range float 0.01 run attribute @s attack_knockback get 1000
execute store result storage content_lock:saved_stats fire_duration float 0.02 run attribute @s attack_damage get 1000

execute store result score @s content_lock.temp1 run attribute @s attack_speed get 1000
scoreboard players set @s content_lock.temp2 10000
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
execute if score @s content_lock.temp2 matches ..1 run scoreboard players set @s content_lock.temp2 2
execute store result storage content_lock:saved_stats attack_speed int 1 run scoreboard players get @s content_lock.temp2

data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook with storage content_lock:saved_stats