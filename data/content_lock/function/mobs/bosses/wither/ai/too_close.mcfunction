execute facing entity @n[tag=content_lock.im_a_target] feet rotated ~ 0 positioned ^ ^ ^-5 run summon marker ~ ~1 ~ {Tags:["content_lock.wither.ai.too_close.pointer"]}

execute facing entity @n[tag=content_lock.wither.ai.too_close.pointer] feet run function content_lock:mobs/bosses/wither/ai/move_towards_pointer {speed:0.1,vertical_speed:0.2}

kill @e[tag=content_lock.wither.ai.too_close.pointer]
kill @e[tag=content_lock.wither.ai.charging_forward.pointer]
kill @e[tag=content_lock.wither.ai.close_shenanigans.pointer]
kill @e[tag=content_lock.wither.ai.move_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.stay_out_of_range.pointer]
