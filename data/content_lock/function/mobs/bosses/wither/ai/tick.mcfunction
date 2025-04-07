execute if entity @s[tag=break_ai] run return 0

execute as @s at @s store result score @s y_level_check run data get entity @s Pos[1]
execute as @s at @s as @p at @s store result score @s y_level_check run data get entity @s Pos[1]

execute if entity @s[tag=circle_player_close] run function content_lock:bosses/wither/ai/circle_player_close

execute if entity @s[tag=circle_player_far] run function content_lock:bosses/wither/ai/circle_player_far

execute if score @s parry_timer matches 40.. run scoreboard players set @s parry_timer 0
scoreboard players add @s parry_timer 1

execute if score @s parry_cooldown matches 200.. run scoreboard players set @s parry_cooldown 0
scoreboard players add @s parry_cooldown 1

execute if score @s parry_timer matches 26 run function content_lock:bosses/wither/ai/strafe_to_side_chance

execute if score @s parry_cooldown matches 1 run function content_lock:bosses/wither/ai/circle_player_distance_chance

execute if score @s parry_timer matches 26.. if entity @s[tag=strafe_to_left] run function content_lock:bosses/wither/ai/strafe_to_left
execute if score @s parry_timer matches 26.. if entity @s[tag=strafe_to_right] run function content_lock:bosses/wither/ai/strafe_to_right





