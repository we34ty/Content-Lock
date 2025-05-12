scoreboard players add @s content_lock.player_unused_skill_points 1
scoreboard players add @s content_lock.player_skill_level 1

execute if score @s content_lock.xp_level > @s content_lock.player_skill_level run function content_lock:player/levels/level_up
