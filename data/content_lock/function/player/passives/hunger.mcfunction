##if sprint is disabled, lowers the hunger
execute if score L content_lock.options.player.disable_sprint matches 0 run return run function content_lock:player/passives/hunger_for_cannot_run

##give hunger/saturation based on player hunger
execute if entity @s[tag=!content_lock.can_run] run function content_lock:player/passives/hunger_for_cannot_run
execute if entity @s[tag=content_lock.can_run] run function content_lock:player/passives/hunger_for_can_run