execute if entity @s[tag=content_lock.frostbite_active] run return 0
$scoreboard players set @s content_lock.temp1 $(amount)
scoreboard players operation @s content_lock.frostbite_stacks += @s content_lock.temp1

execute if score @s content_lock.frostbite_stacks matches 120.. run function content_lock:player/effects/frostbite
execute if score @s content_lock.frostbite_stacks matches ..-120 run function content_lock:player/effects/heat_explode