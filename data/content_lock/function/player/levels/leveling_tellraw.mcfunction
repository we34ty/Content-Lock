
scoreboard players set @s LevelUp.ContentLock 0
scoreboard players enable @s LevelUp.ContentLock

execute unless score @s content_lock.player_unused_skill_points matches 1.. run return run tellraw @s {"text":"You don't have any unused Skill Points"}
tellraw @s ["",{"text":"You've got ","bold":false},{"score":{"name":"@s","objective":"content_lock.player_unused_skill_points"},"bold":true,"color":"yellow"},{"text":" unused Skill Points","bold":false}]

tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.hp 1"},"hoverEvent":{"action":"show_text","contents":"Increases amount of health by 0.5"}},{"text":" Vitality (","color":"white"},{"score":{"name":"@s","objective":"content_lock.hp_from_level"}},{"text":")"}]
tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.eqld 1"},"hoverEvent":{"action":"show_text","contents":"Increases amount of stamina and decreases delay before it starts regenerating"}},{"text":" Load (","color":"white"},{"score":{"name":"@s","objective":"content_lock.eqld_from_level"}},{"text":")"}]
tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.atkspd 1"},"hoverEvent":{"action":"show_text","contents":"Increases attack speed by 5% as well as mining speed"}},{"text":" Dexterity (","color":"white"},{"score":{"name":"@s","objective":"content_lock.atkspd_from_level"}},{"text":")"}]
tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.dmg 1"},"hoverEvent":{"action":"show_text","contents":"Increases amount of damage dealt by 2.5%"}},{"text":" Strength (","color":"white"},{"score":{"name":"@s","objective":"content_lock.dmg_from_level"}},{"text":")"}]
tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.atkrng 1"},"hoverEvent":{"action":"show_text","contents":"Increases the range at which you can interact with entities by 2.5% and blocks by 5%"}},{"text":" Reach (","color":"white"},{"score":{"name":"@s","objective":"content_lock.atkrng_from_level"}},{"text":")"}]
tellraw @s ["",{"text":"[+]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s content_lock.LevelUp.mvtspd 1"},"hoverEvent":{"action":"show_text","contents":"Increases movement speed by 5%"}},{"text":" Fleetness (","color":"white"},{"score":{"name":"@s","objective":"content_lock.mvtspd_from_level"}},{"text":")"}]

