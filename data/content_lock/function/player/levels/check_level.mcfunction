execute store result score @s content_lock.xp_point run xp query @s points
execute store result score @s content_lock.xp_level run xp query @s levels
execute if score @s content_lock.xp_point_old > @s content_lock.xp_point if score @s content_lock.xp_level_old >= @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
execute unless score @s content_lock.xp_point_old = @s content_lock.xp_point if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
execute if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
scoreboard players operation @s content_lock.xp_level_old = @s content_lock.xp_level
scoreboard players operation @s content_lock.xp_point_old = @s content_lock.xp_point

execute if score @s content_lock.xp_level > @s content_lock.player_skill_level run function content_lock:player/levels/level_up

execute if score @s content_lock.LevelUp.hp matches 1.. run function content_lock:player/levels/level_up_hp
execute if score @s content_lock.LevelUp.eqld matches 1.. run function content_lock:player/levels/level_up_load
execute if score @s content_lock.LevelUp.atkspd matches 1.. run function content_lock:player/levels/level_up_attack_speed
execute if score @s content_lock.LevelUp.dmg matches 1.. run function content_lock:player/levels/level_up_damage
execute if score @s content_lock.LevelUp.atkrng matches 1.. run function content_lock:player/levels/level_up_range
execute if score @s content_lock.LevelUp.mvtspd matches 1.. run function content_lock:player/levels/level_up_movement_speed
