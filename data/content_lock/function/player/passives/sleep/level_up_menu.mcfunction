#execute if entity @s[tag=content_lock.level_up_menu_up] run return 0

scoreboard players set @s LevelUp.ContentLock 1

#scoreboard players enable @s LevelUp.ContentLock
scoreboard players enable @s content_lock.LevelUp.atkrng
scoreboard players enable @s content_lock.LevelUp.atkspd
scoreboard players enable @s content_lock.LevelUp.dmg
scoreboard players enable @s content_lock.LevelUp.eqld
scoreboard players enable @s content_lock.LevelUp.hp
scoreboard players enable @s content_lock.LevelUp.mvtspd
scoreboard players enable @s content_lock.LevelUp.close_menu

tag @s add content_lock.level_up_menu_up