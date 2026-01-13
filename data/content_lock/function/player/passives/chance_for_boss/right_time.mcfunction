execute if score L content_lock.defeated_officer matches 2 run return run function content_lock:player/passives/chance_for_boss/pick_random/second_officer
execute if score L content_lock.defeated_officer matches 3 run return run function content_lock:player/passives/chance_for_boss/pick_random/third_officer

execute unless score L content_lock.progression matches 1.. store result score L content_lock.temp1 run random value 1..30
execute if score L content_lock.progression matches 1 store result score L content_lock.temp1 run random value 1..60
execute if score L content_lock.progression matches 2.. store result score L content_lock.temp1 run random value 1..80

execute if score L content_lock.temp1 matches 1 run return run function content_lock:player/passives/chance_for_boss/pick_random/iron_guardian
execute if score L content_lock.temp1 matches 2 run return run function content_lock:player/passives/chance_for_boss/pick_random/enchanted_witch
execute if score L content_lock.temp1 matches 3 run return run function content_lock:player/passives/chance_for_boss/pick_random/death_rider

execute if score L content_lock.progression matches 2.. store result score L content_lock.temp1 run random value 1..30
#execute if score L content_lock.temp1 matches 1 run return run function content_lock:player/passives/chance_for_boss/pick_random/third_officer
