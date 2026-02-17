execute store result score @s content_lock.temp1 run attribute @s attack_speed get 1000
scoreboard players set @s content_lock.weapons.hit_timer 80000
scoreboard players operation @s content_lock.weapons.hit_timer /= @s content_lock.temp1