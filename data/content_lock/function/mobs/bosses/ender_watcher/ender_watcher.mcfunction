time set midnight
data modify entity @s Fire set value -1
scoreboard players add @s attack_timer 0

execute if entity @s[scores={attack_timer=0}] if predicate content_lock:three_random if predicate content_lock:three_random run tag @s add laser_attack
execute if entity @s[tag=laser_attack] run function content_lock:bosses/ender_watcher/laser_attack

execute if entity @s[scores={attack_timer=0}] if predicate content_lock:three_random if predicate content_lock:three_random run tag @s add spike_rain_attack
execute if entity @s[tag=spike_rain_attack] run function content_lock:bosses/ender_watcher/spike_rain_attack

execute if entity @s[scores={attack_timer=0}] if predicate content_lock:three_random if predicate content_lock:three_random run tag @s add light_column_attack
execute if entity @s[tag=light_column_attack] run function content_lock:bosses/ender_watcher/light_column_attack

execute if entity @s[scores={attack_timer=0}] if predicate content_lock:three_random if predicate content_lock:three_random run tag @s add crash_down_attack
execute if entity @s[tag=crash_down_attack] run function content_lock:bosses/ender_watcher/crash_down_attack

execute if entity @e[tag=ender_watcher_laser_beam] as @e[tag=ender_watcher_laser_beam] at @s run function content_lock:bosses/ender_watcher/ender_watcher_laser_beam
execute if entity @e[tag=ender_watcher_spike_rain] as @e[tag=ender_watcher_spike_rain] at @s run function content_lock:bosses/ender_watcher/ender_watcher_spike_rain
execute if entity @e[tag=ender_watcher_spike_rain_indicator] at @e[tag=ender_watcher_spike_rain_indicator] run particle end_rod ~ ~ ~ 0.3 0 0.3 0.05 3 force @a
execute if entity @e[tag=ender_watcher_light_column_seed] as @e[tag=ender_watcher_light_column_seed] at @s run function content_lock:bosses/ender_watcher/ender_watcher_light_column_seed
execute if entity @e[tag=ender_watcher_light_column] as @e[tag=ender_watcher_light_column] at @s run function content_lock:bosses/ender_watcher/ender_watcher_light_column

execute if score L timer1 matches 7 run function content_lock:bosses/boss_player_count_scaling {distance:80}
#function content_lock:bosses/boss_music {song:l} ???? DODAWAC CZY NIE?
function content_lock:bosses/boss_music {song:music.content_lock.ender_watcher,duration:5160}

execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=200..}] run scoreboard players set @s attack_timer 0
