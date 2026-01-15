execute if entity @n[tag=content_lock.duplicator,distance=..16] as @n[tag=content_lock.duplicator] unless score @s content_lock.duplication_cost <= @s content_lock.duplication_storage run function content_lock:duplicator/item_placed
execute if entity @n[tag=content_lock.duplicator,distance=..16] as @n[tag=content_lock.duplicator] unless score @s content_lock.duplication_cost <= @s content_lock.duplication_storage run return run clear @p *[custom_data={"content_lock:duplication_result":true}]
execute unless entity @n[tag=content_lock.duplicator,distance=..16] run return run clear @p *[custom_data={"content_lock:duplication_result":true}]

execute if entity @n[tag=content_lock.duplicator,distance=..16] as @n[tag=content_lock.duplicator] run tag @s remove content_lock.duplicator.item_present

scoreboard players operation @n[tag=content_lock.duplicator,distance=..16] content_lock.duplication_storage -= @n[tag=content_lock.duplicator,distance=..16] content_lock.duplication_cost
function content_lock:duplicator/remove_tag
playsound content_lock:block.duplicator.craft player @a ~ ~ ~ 1 1