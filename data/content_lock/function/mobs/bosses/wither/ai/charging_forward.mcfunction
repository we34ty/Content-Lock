#execute unless entity @n[tag=content_lock.wither.ai.charging_forward.pointer] at @n[tag=content_lock.im_a_target] run summon marker ~ ~ ~ {Tags:["content_lock.wither.ai.charging_forward.pointer"]}

execute unless entity @n[tag=content_lock.wither.ai.charging_forward.pointer,distance=..1] facing entity @n[tag=content_lock.wither.ai.charging_forward.pointer] feet run function content_lock:mobs/bosses/wither/ai/move_towards_pointer_no_look {speed:0.7,vertical_speed:0.5}
execute if entity @n[tag=content_lock.wither.ai.charging_forward.pointer,distance=..1] run rotate @s ~30 ~
