execute if score @s content_lock.dark_sound_cooldown matches 1.. run return 0
execute at @s run playsound ambient.cave ambient @s ~ ~ ~ 1 1
scoreboard players set @s content_lock.dark_sound_cooldown 2400