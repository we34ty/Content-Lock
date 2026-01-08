execute if score @s content_lock.wither_regen.timer matches 1.. run scoreboard players remove @s content_lock.wither_regen.timer 1
execute if score @s content_lock.wither_regen.timer matches 0 run scoreboard players set @s content_lock.wither_regen 0
scoreboard players add @s content_lock.wither_regen.timer2 1
particle enchant ~ ~1 ~ 0.5 1 0.5 1 3 normal @a

execute if score @s content_lock.wither_regen.timer2 matches 100.. run data merge storage content_lock:saved_stats {value:0.0f}
execute if score @s content_lock.wither_regen.timer2 matches 100.. store result storage content_lock:saved_stats value float 1 run scoreboard players get @s content_lock.wither_regen
execute if score @s content_lock.wither_regen.timer2 matches 100.. run function content_lock:player/passives/heal_macro_easy with storage content_lock:saved_stats
execute if score @s content_lock.wither_regen.timer2 matches 100.. run scoreboard players set @s content_lock.wither_regen.timer2 0

