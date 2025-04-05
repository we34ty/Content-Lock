scoreboard players enable @s content_lock.LevelUp.atkrng
scoreboard players set @s content_lock.LevelUp.atkrng 0

execute unless score @s content_lock.player_unused_skill_points matches 1.. run return run tellraw @s {"translate":"content_lock:levels.not_enough_points","color":"red"}

scoreboard players add @s content_lock.atkrng_from_level 1
scoreboard players remove @s content_lock.player_unused_skill_points 1

tellraw @s [{"translate":"content_lock:levels.range.increase","color":"yellow"},{"score":{"name":"@s","objective":"content_lock.atkrng_from_level"},"color": "yellow"}]

function content_lock:player/passives/reset_level_stats