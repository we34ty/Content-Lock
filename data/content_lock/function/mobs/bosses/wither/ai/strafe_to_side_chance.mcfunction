
tag @s remove strafe_to_left
tag @s remove strafe_to_right
execute if predicate content_lock:true_random run tag @s add strafe_to_left
execute if entity @s[tag=!strafe_to_left] run tag @s add strafe_to_right





