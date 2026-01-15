tag @s add content_lock.duplicator.item_present
execute if items block ~ ~ ~ container.11 enchanted_book run function content_lock:duplicator/update_cost
execute if items block ~ ~ ~ container.11 lapis_lazuli run function content_lock:duplicator/update_storage
execute if items block ~ ~ ~ container.11 lapis_block run function content_lock:duplicator/update_storage
execute if items block ~ ~ ~ container.11 nether_star run function content_lock:duplicator/update_storage

execute if score @s content_lock.duplication_cost <= @s content_lock.duplication_storage run function content_lock:duplicator/duplicate

