scoreboard players add L content_lock.timer1 1
execute if score L content_lock.timer1 matches 21.. run scoreboard players set @a content_lock.timerCheck 0
execute if score L content_lock.timer1 matches 21.. run scoreboard players set L content_lock.timer1 1

execute if score L content_lock.timer1 matches 2 run function content_lock:wormhole/tick