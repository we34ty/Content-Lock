#execute if entity @s[tag=content_lock.level_up_menu_up] run return 0

scoreboard players set @s LevelUp.ContentLock 1
function content_lock:player/levels/leveling_tellraw

#scoreboard players enable @s LevelUp.ContentLock
scoreboard players enable @s content_lock.LevelUp.atkrng
scoreboard players enable @s content_lock.LevelUp.atkspd
scoreboard players enable @s content_lock.LevelUp.dmg
scoreboard players enable @s content_lock.LevelUp.eqld
scoreboard players enable @s content_lock.LevelUp.hp
scoreboard players enable @s content_lock.LevelUp.mvtspd
scoreboard players enable @s content_lock.LevelUp.close_menu
scoreboard players enable @s content_lock.LevelUp.reset

tag @s add content_lock.level_up_menu_up
execute unless score @s content_lock.player_skill_level matches 1.. run function content_lock:player/levels/close_menu