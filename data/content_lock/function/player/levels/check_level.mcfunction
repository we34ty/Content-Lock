execute store result score @s content_lock.xp_point run xp query @s points
execute store result score @s content_lock.xp_level run xp query @s levels
execute if score @s content_lock.xp_level_old > @s content_lock.xp_level run data merge storage content_lock:saved_stats {value:0}
execute if score @s content_lock.xp_level_old > @s content_lock.xp_level run data merge storage content_lock:saved_stats {type:levels}
execute if score @s content_lock.xp_level_old > @s content_lock.xp_level store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.xp_level_old
execute if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels with storage content_lock:saved_stats

execute unless score @s content_lock.xp_point = @s content_lock.xp_point_old run data merge storage content_lock:saved_stats {value:0}
execute unless score @s content_lock.xp_point = @s content_lock.xp_point_old run data merge storage content_lock:saved_stats {type:points}
#execute unless score @s content_lock.xp_point = @s content_lock.xp_point_old store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.xp_point_old
execute unless score @s content_lock.xp_point = @s content_lock.xp_point_old run function content_lock:player/levels/restore_lost_levels with storage content_lock:saved_stats

#execute if score @s content_lock.xp_point_old > @s content_lock.xp_point if score @s content_lock.xp_level_old >= @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
#execute unless score @s content_lock.xp_point_old = @s content_lock.xp_point if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
#execute if score @s content_lock.xp_level_old > @s content_lock.xp_level run function content_lock:player/levels/restore_lost_levels
scoreboard players operation @s content_lock.xp_level_old = @s content_lock.xp_level
scoreboard players operation @s content_lock.xp_point_old = @s content_lock.xp_point

execute if score @s content_lock.xp_level > @s content_lock.player_skill_level run function content_lock:player/levels/level_up