execute if score L content_lock.difficulty matches 0 run function content_lock:difficulty/peaceful
execute if score L content_lock.difficulty matches 1 run function content_lock:difficulty/easy
execute if score L content_lock.difficulty matches 2 run function content_lock:difficulty/normal
execute if score L content_lock.difficulty matches 3 run function content_lock:difficulty/hard

scoreboard players operation @s content_lock.difficulty = @s content_lock.temp1