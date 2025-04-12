tag @s remove content_lock.level_up_menu_up
execute if entity @s[tag=content_lock.level_up_menu_down] if entity @r[tag=content_lock.level_up_menu_up] run tellraw @a [{"selector": "@s","color": "gold"},{"translate":"content_lock:notifications.leave_bed","color":"gold"}]
tag @s remove content_lock.level_up_menu_down

scoreboard players reset @s LevelUp.ContentLock
scoreboard players reset @s content_lock.LevelUp.atkrng
scoreboard players reset @s content_lock.LevelUp.atkspd
scoreboard players reset @s content_lock.LevelUp.dmg
scoreboard players reset @s content_lock.LevelUp.eqld
scoreboard players reset @s content_lock.LevelUp.hp
scoreboard players reset @s content_lock.LevelUp.mvtspd
scoreboard players reset @s content_lock.LevelUp.close_menu

execute unless entity @r[tag=content_lock.level_up_menu_up,tag=!content_lock.level_up_menu_down] run function content_lock:player/passives/sleep/enable_sleeping with storage content_lock:saved_stats