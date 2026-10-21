#$say $(amount)
execute if entity @s[tag=content_lock.wither_active] run return 0
$scoreboard players set @s content_lock.temp1 $(amount)
scoreboard players operation @s content_lock.wither_stacks += @s content_lock.temp1

execute if score @s content_lock.wither_stacks matches 12000.. run function content_lock:player/effects/wither/wither
