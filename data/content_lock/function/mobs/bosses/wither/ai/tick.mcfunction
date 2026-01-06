execute if entity @s[tag=content_lock.NoAI] run return 0

execute if entity @s[tag=content_lock.exhausted] run return run function content_lock:mobs/bosses/wither/ai/exhausted
execute if entity @s[tag=content_lock.wither.ai.charging_forward] run return run function content_lock:mobs/bosses/wither/ai/charging_forward

execute if entity @n[tag=content_lock.im_a_target,distance=..3] run function content_lock:mobs/bosses/wither/ai/too_close
execute if entity @n[tag=content_lock.im_a_target,distance=3..7] run function content_lock:mobs/bosses/wither/ai/close_shenanigans
execute if entity @n[tag=content_lock.im_a_target,distance=7..10] run function content_lock:mobs/bosses/wither/ai/move_out_of_range
execute if entity @n[tag=content_lock.im_a_target,distance=10..] run function content_lock:mobs/bosses/wither/ai/stay_out_of_range
