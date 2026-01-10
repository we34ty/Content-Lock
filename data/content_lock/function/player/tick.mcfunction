execute as @a run function content_lock:player/as_all

execute if score L content_lock.timer1 matches 7 run function content_lock:player/ticks/tick7

execute if score L content_lock.timer1 matches 10 run function content_lock:player/effects/tick
function content_lock:player/remove_bossbar
