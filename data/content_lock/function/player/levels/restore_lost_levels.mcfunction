scoreboard players operation @s content_lock.temp1 = @s content_lock.xp_level_old
scoreboard players set @s content_lock.temp2 1
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
#execute store result score @s content_lock.xp_point run xp query @s points
#execute store result score @s content_lock.xp_level run xp query @s levels

execute if score @s content_lock.xp_point_old < @s content_lock.xp_point if score @s content_lock.temp1 > @s content_lock.xp_level run xp add @s 1 levels
execute if score @s content_lock.xp_point_old < @s content_lock.xp_point if score @s content_lock.temp1 > @s content_lock.xp_level store result score @s content_lock.xp_level run xp query @s levels
execute if score @s content_lock.xp_point_old < @s content_lock.xp_point if score @s content_lock.temp1 > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels

execute if score @s content_lock.xp_point_old > @s content_lock.xp_point if score @s content_lock.xp_level_old > @s content_lock.xp_level run xp add @s 1 levels
execute if score @s content_lock.xp_point_old > @s content_lock.xp_point if score @s content_lock.xp_level_old > @s content_lock.xp_level store result score @s content_lock.xp_level run xp query @s levels
execute if score @s content_lock.xp_point_old > @s content_lock.xp_point if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels

execute if score @s content_lock.xp_point_old > @s content_lock.xp_point run xp add @s 1 points
execute if score @s content_lock.xp_point_old > @s content_lock.xp_point store result score @s content_lock.xp_point run xp query @s points
execute if score @s content_lock.xp_point_old > @s content_lock.xp_point run function content_lock:player/levels/restore_lost_levels

execute if score @s content_lock.xp_point_old < @s content_lock.xp_point run xp add @s -1 points
execute if score @s content_lock.xp_point_old < @s content_lock.xp_point store result score @s content_lock.xp_point run xp query @s points
execute if score @s content_lock.xp_point_old < @s content_lock.xp_point run function content_lock:player/levels/restore_lost_levels

