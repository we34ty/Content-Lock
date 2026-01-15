$execute unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:clear_in_inventory":true}] if items entity @p player.cursor * at @p run summon item ~ ~1 ~ {Tags:["content_lock.clear_cursor"],Item:{id:"dirt"}}
$execute unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:clear_in_inventory":true}] if items entity @p player.cursor * at @p run item replace entity @n[type=item,tag=content_lock.clear_cursor] contents from entity @p player.cursor

$execute unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:clear_in_inventory":true}] run item replace entity @p player.cursor from block ~ ~ ~ container.$(slot)

$item replace block ~ ~ ~ container.$(slot) with black_stained_glass_pane[custom_data={"content_lock:clear_in_inventory":true},tooltip_display={hide_tooltip:true},item_model="minecraft:air"]
