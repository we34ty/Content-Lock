tag @s add content_lock.tried_to_turn_into_boss
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:30}
execute if score @s content_lock.temp1 matches 1 run function content_lock:mobs/bosses/enchanted_witch/enchanted_witch_summon
