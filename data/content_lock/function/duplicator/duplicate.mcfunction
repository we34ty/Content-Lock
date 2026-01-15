execute unless items block ~ ~ ~ container.11 enchanted_book run return 0

item replace block ~ ~ ~ container.15 with enchanted_book[custom_data={"content_lock:duplication_result":true},max_stack_size=64]
data modify block ~ ~ ~ Items[{Slot:15b}].components."minecraft:stored_enchantments" set from block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"