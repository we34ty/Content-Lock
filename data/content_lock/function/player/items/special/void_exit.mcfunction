scoreboard players set @s content_lock.temp1 0
execute unless dimension content_lock:the_void run scoreboard players set @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 1 run title @s actionbar [{"translate": "content_lock:notifications.cannot_use_out_of_void","color": "dark_red"}]
execute if score @s content_lock.temp1 matches 1 run return 0

execute in minecraft:overworld run tp @s ~ 0 ~
tag @s add content_lock.yet_to_be_spread
execute in minecraft:overworld run schedule function content_lock:player/items/special/void_exit_loop 1t replace