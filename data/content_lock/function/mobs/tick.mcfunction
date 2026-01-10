execute as @e[type=!#entities] run function content_lock:mobs/as_all
execute if score L content_lock.timer1 matches 12 run function content_lock:mobs/tick/tick_12
execute as @e[type=#entities] run function content_lock:mobs/entities/tick

#function content_lock:mobs/passives/shops/time_check_for_shop_refresh
#execute if score L content_lock.timer1 matches 18 run function content_lock:mobs/chance_to_turn_into_boss/tick


#execute if score L content_lock.timer1 matches 4 if predicate content_lock:day_begins run function content_lock:mobs/passives/check_for_wandering_trader_spawn
