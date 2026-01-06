scoreboard players add @s content_lock.wither_ai.timer 1
execute if score @s content_lock.wither_ai.timer matches 1 store result score @s content_lock.wither_ai.random run random value 1..3

execute if score @s content_lock.wither_ai.random matches 1 facing entity @n[tag=content_lock.im_a_target] feet rotated ~180 ~ positioned ^ ^ ^4 run summon marker ~ ~ ~ {Tags:["content_lock.wither.ai.move_out_of_range.pointer"]}
execute if score @s content_lock.wither_ai.random matches 2..3 run summon marker ~ ~ ~ {Tags:["content_lock.wither.ai.move_out_of_range.pointer"]}
execute if score @s content_lock.wither_ai.random matches 2 facing entity @n[tag=content_lock.im_a_target] feet rotated ~180 ~ positioned ^ ^ ^4 run spreadplayers ~ ~ 1 3 false @n[tag=content_lock.wither.ai.move_out_of_range.pointer]
execute if score @s content_lock.wither_ai.random matches 3 facing entity @n[tag=content_lock.im_a_target] feet rotated ~180 ~ positioned ^ ^ ^2 run spreadplayers ~ ~ 1 2 false @n[tag=content_lock.wither.ai.move_out_of_range.pointer]

execute facing entity @n[tag=content_lock.wither.ai.move_out_of_range.pointer] feet run function content_lock:mobs/bosses/wither/ai/move_towards_pointer {speed:0.3,vertical_speed:0.4}

kill @e[tag=content_lock.wither.ai.move_out_of_range.pointer]

execute if score @s content_lock.wither_ai.timer matches 40.. run scoreboard players set @s content_lock.wither_ai.timer 0

kill @e[tag=content_lock.wither.ai.charging_forward.pointer]
kill @e[tag=content_lock.wither.ai.close_shenanigans.pointer]
kill @e[tag=content_lock.wither.ai.stay_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.too_close.pointer]