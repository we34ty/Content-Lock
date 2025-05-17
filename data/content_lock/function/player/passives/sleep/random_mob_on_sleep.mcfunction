#setblock ~ ~ ~ air destroy

execute if predicate content_lock:can_have_nightmare_sleep unless entity @r[distance=0.1..] run time add 2000

damage @s 1 mob_attack

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute at @s if score @s content_lock.temp1 matches 1 run summon zombie ~ ~ ~
execute at @s if score @s content_lock.temp1 matches 2 run summon skeleton ~ ~ ~
execute at @s if score @s content_lock.temp1 matches 3 run summon spider ~ ~ ~
