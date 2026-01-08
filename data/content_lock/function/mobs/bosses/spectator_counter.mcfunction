scoreboard players add @s content_lock.respawn_timer 1

execute at @s unless entity @n[tag=content_lock.boss,distance=..40] at @n[tag=content_lock.boss] run tp @s @p[distance=..40,gamemode=!spectator]

execute if score @s content_lock.respawn_timer matches 1 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"60","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 15 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"45","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 30 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"30","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 45 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"15","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 55 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"5","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 56 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"4","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 57 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"3","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 58 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"2","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 59 run tellraw @s [{"translate":"content_lock:notifications.respawn.countdown","color":"yellow"},{"text":"1","color":"yellow",bold:true}]
execute if score @s content_lock.respawn_timer matches 60 run tellraw @s {"translate":"content_lock:notifications.respawn.ready","color":"yellow"}
execute if score @s content_lock.respawn_timer matches 60.. run function content_lock:mobs/bosses/turn_off_spectator