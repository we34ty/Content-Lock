scoreboard players add @s content_lock.attack_timer 1
execute unless score @s content_lock.attack_timer matches 5.. run return 0

summon area_effect_cloud ~ ~ ~ {Duration:100,Tags:["content_lock.zombified_piglin_princess.rain_fireballs.projectile","content_lock.yet_to_be_spread"],Radius:0.0f}
execute as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread] store result score @s content_lock.temp1 run data get entity @s Pos[1]
execute as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread] run scoreboard players add @s content_lock.temp1 10
spreadplayers ~ ~ 2 4 false @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread]
execute as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread] store result entity @s Pos[1] double 1 run scoreboard players get @s content_lock.temp1
execute as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread] facing entity @e[sort=random,limit=1] eyes run rotate @s ~ 65
execute as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile,tag=content_lock.yet_to_be_spread] run tag @s remove content_lock.yet_to_be_spread
scoreboard players set @s content_lock.attack_timer 0