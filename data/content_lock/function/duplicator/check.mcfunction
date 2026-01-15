execute unless entity @s[tag=content_lock.duplicator.spawned] run function content_lock:duplicator/set_up
execute if entity @s[tag=content_lock.duplicator.spawned] unless block ~ ~ ~ barrel run return run function content_lock:duplicator/break

scoreboard players set @s content_lock.temp1 0
function content_lock:duplicator/glass_pane_loop

function content_lock:duplicator/display_bottom
function content_lock:duplicator/display_top

execute unless entity @s[tag=content_lock.duplicator.item_present] if items block ~ ~ ~ container.11 * run function content_lock:duplicator/item_placed
execute if entity @s[tag=content_lock.duplicator.item_present] unless items block ~ ~ ~ container.11 * run scoreboard players set @s content_lock.duplication_cost 0
execute if entity @s[tag=content_lock.duplicator.item_present] unless items block ~ ~ ~ container.11 * run tag @s remove content_lock.duplicator.item_present
