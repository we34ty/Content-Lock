#$say $(amount)
$scoreboard players set @s content_lock.temp1 $(amount)
scoreboard players operation @s content_lock.bleed_stacks += @s content_lock.temp1

execute if score @s content_lock.bleed_stacks matches 120.. run function content_lock:player/effects/bleed
