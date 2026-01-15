execute if score L content_lock.defeated_officer matches 2 if predicate content_lock:boss_can_spawn_night unless entity @n[tag=content_lock.boss] run return run function content_lock:player/passives/chance_for_boss/spawn/second_officer
execute if score L content_lock.defeated_officer matches 3 if predicate content_lock:boss_can_spawn_night unless entity @n[tag=content_lock.boss] run return run function content_lock:player/passives/chance_for_boss/spawn/third_officer

execute if score L content_lock.random_boss matches 1 if predicate content_lock:is_day run function content_lock:player/passives/chance_for_boss/spawn/iron_guardian
execute if score L content_lock.random_boss matches 2 if predicate content_lock:boss_can_spawn_night run function content_lock:player/passives/chance_for_boss/spawn/enchanted_witch
execute if score L content_lock.random_boss matches 3 if predicate content_lock:boss_can_spawn_night run function content_lock:player/passives/chance_for_boss/spawn/death_rider

execute unless score L content_lock.random_boss matches 1.. if predicate content_lock:boss_can_spawn_time run function content_lock:player/passives/chance_for_boss/right_time