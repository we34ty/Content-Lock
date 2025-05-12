execute if score @s LevelUp.ContentLock matches 1.. run function content_lock:player/levels/leveling_tellraw

execute if score @s content_lock.LevelUp.hp matches 1.. run function content_lock:player/levels/level_up_hp
execute if score @s content_lock.LevelUp.eqld matches 1.. run function content_lock:player/levels/level_up_load
execute if score @s content_lock.LevelUp.atkspd matches 1.. run function content_lock:player/levels/level_up_attack_speed
execute if score @s content_lock.LevelUp.dmg matches 1.. run function content_lock:player/levels/level_up_damage
execute if score @s content_lock.LevelUp.atkrng matches 1.. run function content_lock:player/levels/level_up_range
execute if score @s content_lock.LevelUp.mvtspd matches 1.. run function content_lock:player/levels/level_up_movement_speed
execute if score @s content_lock.LevelUp.close_menu matches 1.. run function content_lock:player/levels/close_menu
execute if score @s content_lock.LevelUp.reset matches 1.. run function content_lock:player/levels/remove_all_levels
execute if score @s content_lock.LevelUp.reset matches 1.. run function content_lock:player/passives/sleep/level_up_menu
execute if score @s content_lock.LevelUp.reset matches 1.. run scoreboard players set @s content_lock.LevelUp.reset 0