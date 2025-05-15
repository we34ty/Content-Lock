execute unless score @s content_lock.player_unused_skill_points matches 1.. run scoreboard players enable @s content_lock.LevelUp.atkspd
scoreboard players set @s content_lock.LevelUp.atkspd 0
execute if score @s content_lock.player_unused_skill_points matches 1.. run scoreboard players remove @s content_lock.player_unused_skill_points 1

tellraw @s ["\n\n\n\n\n \n\n\n\n\n \n\n\n\n\n \n\n\n\n\n"]
execute unless score @s content_lock.player_unused_skill_points matches 1.. run tellraw @s {"translate":"content_lock:levels.not_enough_points","color":"red"}

scoreboard players add @s content_lock.atkspd_from_level 1

execute if score @s content_lock.player_unused_skill_points matches 1.. run tellraw @s [{"translate":"content_lock:levels.attack_speed.increase","color":"yellow"},{"score":{"name":"@s","objective":"content_lock.atkspd_from_level"},"color": "yellow"}]
function content_lock:player/passives/sleep/level_up_menu


function content_lock:player/passives/reset_level_stats