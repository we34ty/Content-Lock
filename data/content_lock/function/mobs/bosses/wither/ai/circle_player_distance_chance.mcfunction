
tag @s remove circle_player_close
tag @s remove circle_player_far
execute if predicate content_lock:true_random run tag @s add circle_player_close
execute if entity @s[tag=!circle_player_far] run tag @s add circle_player_far





