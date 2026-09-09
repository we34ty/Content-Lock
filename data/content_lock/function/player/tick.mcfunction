##all functions that check for all players, grouped together for optimization
execute as @a run function content_lock:player/as_all

##functions triggered once a second at 'tick 7'
execute if score L content_lock.timer1 matches 7 run function content_lock:player/ticks/tick7

##removes the bossbars unless there is a need for them (might be removed in the future)
function content_lock:player/remove_bossbar

scoreboard players set @a content_lock.enchantment.bonus.armor.iron.pieces 0
