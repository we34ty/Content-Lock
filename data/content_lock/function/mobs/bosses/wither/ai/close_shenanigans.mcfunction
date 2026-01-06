scoreboard players add @s content_lock.wither_ai.timer 1
execute if score @s content_lock.wither_ai.timer matches 1 store result score @s content_lock.wither_ai.random run random value 1..3

execute if entity @r[tag=content_lock.wither.ai.stay_out_of_range.pointer] run scoreboard players set @s content_lock.wither_ai.timer 40
execute if entity @r[tag=content_lock.wither.ai.move_out_of_range.pointer] run scoreboard players set @s content_lock.wither_ai.timer 40
execute if entity @r[tag=content_lock.wither.ai.too_close.pointer] run scoreboard players set @s content_lock.wither_ai.timer 40


execute if score @s content_lock.wither_ai.timer matches 40.. run kill @e[tag=content_lock.wither.ai.close_shenanigans.pointer]

execute if score @s content_lock.wither_ai.timer matches 40.. if score @s content_lock.wither_ai.random matches 1 at @n[tag=content_lock.im_a_target] rotated as @n[tag=content_lock.im_a_target] rotated ~ 0 positioned ^ ^ ^4 run summon marker ~ ~1 ~ {Tags:["content_lock.wither.ai.close_shenanigans.pointer"]}
execute if score @s content_lock.wither_ai.timer matches 40.. if score @s content_lock.wither_ai.random matches 2 at @n[tag=content_lock.im_a_target] rotated as @n[tag=content_lock.im_a_target] rotated ~ 0 positioned ^ ^ ^-4 run summon marker ~ ~1 ~ {Tags:["content_lock.wither.ai.close_shenanigans.pointer"]}
execute if score @s content_lock.wither_ai.timer matches 40.. if score @s content_lock.wither_ai.random matches 3 at @n[tag=content_lock.im_a_target] positioned ~ ~ ~ run summon marker ~ ~ ~ {Tags:["content_lock.wither.ai.close_shenanigans.pointer"]}
execute if score @s content_lock.wither_ai.timer matches 40.. if score @s content_lock.wither_ai.random matches 3 at @n[tag=content_lock.im_a_target] positioned ~ ~ ~ run spreadplayers ~ ~ 1 4 false @n[tag=content_lock.wither.ai.close_shenanigans.pointer]

execute if score @s content_lock.wither_ai.timer matches 1 run data modify entity @n[tag=content_lock.wither.ai.close_shenanigans.pointer] Pos[1] set from entity @n[tag=content_lock.im_a_target] Pos[1]

execute facing entity @n[tag=content_lock.wither.ai.close_shenanigans.pointer] feet run function content_lock:mobs/bosses/wither/ai/move_towards_pointer {speed:0.25,vertical_speed:0.3}


execute if score @s content_lock.wither_ai.timer matches 40.. run scoreboard players set @s content_lock.wither_ai.timer 0

kill @e[tag=content_lock.wither.ai.charging_forward.pointer]
kill @e[tag=content_lock.wither.ai.move_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.stay_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.too_close.pointer]