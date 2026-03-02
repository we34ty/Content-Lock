scoreboard players set L content_lock.temp1 -1
execute store result score L content_lock.temp1 run difficulty
execute unless score L content_lock.temp1 = L content_lock.difficulty run function content_lock:difficulty/detect_difficulty

schedule function content_lock:difficulty/tick 10s replace