data merge entity @n[type=item,nbt={Item:{id:"minecraft:barrel"}}] {Item:{id:zombie_spawn_egg,components:{item_name:{translate:"content_lock:item.duplicator",italic:false},entity_data:{id:"marker",Tags:["content_lock.duplicator"]},item_model:"content_lock:duplicator"}}}

scoreboard players set @s content_lock.temp1 9
scoreboard players operation @s content_lock.temp2 = @s content_lock.duplication_storage
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players operation @s content_lock.temp3 = @s content_lock.temp2
data merge storage content_lock:saved_stats {item:"minecraft:lapis_block",count:0}
execute store result storage content_lock:saved_stats count int 1 run scoreboard players get @s content_lock.temp3
execute if score @s content_lock.temp3 matches 1.. run function content_lock:duplicator/lapis_spawn with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
scoreboard players operation @s content_lock.duplication_storage -= @s content_lock.temp2
scoreboard players operation @s content_lock.temp3 = @s content_lock.duplication_storage
data merge storage content_lock:saved_stats {item:"minecraft:lapis_lazuli",count:0}
execute store result storage content_lock:saved_stats count int 1 run scoreboard players get @s content_lock.temp3
execute if score @s content_lock.temp3 matches 1.. run function content_lock:duplicator/lapis_spawn with storage content_lock:saved_stats

kill @n[type=item_display,tag=content_lock.duplicator.display]
kill @s