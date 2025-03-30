scoreboard players enable @s content_lock.LevelUp.mvtspd
scoreboard players set @s content_lock.LevelUp.mvtspd 0

execute unless score @s content_lock.player_unused_skill_points matches 1.. run return run tellraw @s {"text":"You don't have enough skill points","color":"red"}

scoreboard players add @s content_lock.mvtspd_from_level 1
scoreboard players remove @s content_lock.player_unused_skill_points 1

tellraw @s [{"text":"Fleetness increased to ","color":"yellow"},{"score":{"name":"@s","objective":"content_lock.atkspd_from_level"},"color": "yellow"}]

function content_lock:player/passives/reset_level_stats