execute if score @s content_lock.can_player_run matches 0.. run tag @s add content_lock.can_run
execute if score @s content_lock.player_hunger matches 3.. run effect give @s hunger infinite 255 true
execute if score @s content_lock.player_hunger matches 3.. run effect clear @s saturation
execute if score @s content_lock.player_hunger matches ..2 run effect give @s saturation infinite 1 true
execute if score @s content_lock.player_hunger matches ..3 run effect clear @s hunger