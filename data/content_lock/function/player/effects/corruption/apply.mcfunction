execute if score @s content_lock.corruption_time matches 120.. run return 0
$scoreboard players set @s content_lock.temp1 $(amount)
scoreboard players operation @s content_lock.corruption_meter += @s content_lock.temp1

execute if score @s content_lock.corruption_meter matches 12000.. run function content_lock:player/effects/corruption/corrupt
