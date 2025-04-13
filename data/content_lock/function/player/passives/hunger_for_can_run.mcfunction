#execute if score @s content_lock.can_player_run matches ..50 run tag @s remove content_lock.can_run
execute if score @s content_lock.player_hunger matches 10.. run effect clear @s saturation
execute if score @s content_lock.player_hunger matches ..8 run effect give @s saturation infinite 1 true
execute if score @s content_lock.player_hunger matches 20 run effect give @s hunger 1 255 true
execute if score @s content_lock.player_hunger matches ..19 run effect clear @s hunger
