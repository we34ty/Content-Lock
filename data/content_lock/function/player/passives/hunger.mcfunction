execute if score L content_lock.options.player.disable_sprint matches 0 as @a run return run function content_lock:player/passives/hunger_for_cannot_run

execute if entity @r[tag=!content_lock.can_run] as @a[tag=!content_lock.can_run] run function content_lock:player/passives/hunger_for_cannot_run
execute if entity @r[tag=content_lock.can_run] as @a[tag=content_lock.can_run] run function content_lock:player/passives/hunger_for_can_run