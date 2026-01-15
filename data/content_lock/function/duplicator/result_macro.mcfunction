$execute if items block ~ ~ ~ container.$(slot) * unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:duplication_result":true}] if items entity @p player.cursor * at @p run summon item ~ ~1 ~ {Tags:["content_lock.clear_cursor"],Item:{id:"dirt"}}
$execute if items block ~ ~ ~ container.$(slot) * unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:duplication_result":true}] if items entity @p player.cursor * at @p run item replace entity @n[type=item,tag=content_lock.clear_cursor] contents from entity @p player.cursor

$execute if items block ~ ~ ~ container.$(slot) * unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:duplication_result":true}] run item replace entity @p player.cursor from block ~ ~ ~ container.$(slot)

$execute unless items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:duplication_result":true}] run item replace block ~ ~ ~ container.$(slot) with air
$execute unless entity @s[tag=content_lock.duplicator.item_present] if items block ~ ~ ~ container.$(slot) *[custom_data={"content_lock:duplication_result":true}] run item replace block ~ ~ ~ container.$(slot) with air
