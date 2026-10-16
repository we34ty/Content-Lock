execute at @s as @e[type=item,distance=..2] if items entity @s container.0 #meat run function content_lock:mobs/customization/active/heal_with_food/pick

execute unless items entity @s weapon.offhand #meat run return 0

execute store result score @s content_lock.temp1 run data get entity @s Health 10000
execute store result score @s content_lock.temp2 run attribute @s max_health get 100
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2
execute if score @s content_lock.temp1 matches ..50 unless score @s content_lock.mob.eating matches 1.. at @s run function content_lock:mobs/customization/active/heal_with_food/start