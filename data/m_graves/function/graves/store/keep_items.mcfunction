## Clear items that should be dropped on death and adjusts 'm_graves:grave_storage' accordingly
# Clear items
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.0 #m_graves:kept_items run item replace entity @s hotbar.0 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.1 #m_graves:kept_items run item replace entity @s hotbar.1 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.2 #m_graves:kept_items run item replace entity @s hotbar.2 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.3 #m_graves:kept_items run item replace entity @s hotbar.3 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.4 #m_graves:kept_items run item replace entity @s hotbar.4 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.5 #m_graves:kept_items run item replace entity @s hotbar.5 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.6 #m_graves:kept_items run item replace entity @s hotbar.6 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.7 #m_graves:kept_items run item replace entity @s hotbar.7 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s hotbar.8 #m_graves:kept_items run item replace entity @s hotbar.8 with air
execute if score $keepHotbar multipack.graves matches 0 unless items entity @s weapon.offhand #m_graves:kept_items run item replace entity @s weapon.offhand with air
execute if score $keepArmor multipack.graves matches 0 unless items entity @s armor.head #m_graves:kept_items run item replace entity @s armor.head with air
execute if score $keepArmor multipack.graves matches 0 unless items entity @s armor.chest #m_graves:kept_items run item replace entity @s armor.chest with air
execute if score $keepArmor multipack.graves matches 0 unless items entity @s armor.legs #m_graves:kept_items run item replace entity @s armor.legs with air
execute if score $keepArmor multipack.graves matches 0 unless items entity @s armor.feet #m_graves:kept_items run item replace entity @s armor.feet with air
execute unless items entity @s inventory.0 #m_graves:kept_items run item replace entity @s inventory.0 with air
execute unless items entity @s inventory.1 #m_graves:kept_items run item replace entity @s inventory.1 with air
execute unless items entity @s inventory.2 #m_graves:kept_items run item replace entity @s inventory.2 with air
execute unless items entity @s inventory.3 #m_graves:kept_items run item replace entity @s inventory.3 with air
execute unless items entity @s inventory.4 #m_graves:kept_items run item replace entity @s inventory.4 with air
execute unless items entity @s inventory.5 #m_graves:kept_items run item replace entity @s inventory.5 with air
execute unless items entity @s inventory.6 #m_graves:kept_items run item replace entity @s inventory.6 with air
execute unless items entity @s inventory.7 #m_graves:kept_items run item replace entity @s inventory.7 with air
execute unless items entity @s inventory.8 #m_graves:kept_items run item replace entity @s inventory.8 with air
execute unless items entity @s inventory.9 #m_graves:kept_items run item replace entity @s inventory.9 with air
execute unless items entity @s inventory.10 #m_graves:kept_items run item replace entity @s inventory.10 with air
execute unless items entity @s inventory.11 #m_graves:kept_items run item replace entity @s inventory.11 with air
execute unless items entity @s inventory.12 #m_graves:kept_items run item replace entity @s inventory.12 with air
execute unless items entity @s inventory.13 #m_graves:kept_items run item replace entity @s inventory.13 with air
execute unless items entity @s inventory.14 #m_graves:kept_items run item replace entity @s inventory.14 with air
execute unless items entity @s inventory.15 #m_graves:kept_items run item replace entity @s inventory.15 with air
execute unless items entity @s inventory.16 #m_graves:kept_items run item replace entity @s inventory.16 with air
execute unless items entity @s inventory.17 #m_graves:kept_items run item replace entity @s inventory.17 with air
execute unless items entity @s inventory.18 #m_graves:kept_items run item replace entity @s inventory.18 with air
execute unless items entity @s inventory.19 #m_graves:kept_items run item replace entity @s inventory.19 with air
execute unless items entity @s inventory.20 #m_graves:kept_items run item replace entity @s inventory.20 with air
execute unless items entity @s inventory.21 #m_graves:kept_items run item replace entity @s inventory.21 with air
execute unless items entity @s inventory.22 #m_graves:kept_items run item replace entity @s inventory.22 with air
execute unless items entity @s inventory.23 #m_graves:kept_items run item replace entity @s inventory.23 with air
execute unless items entity @s inventory.24 #m_graves:kept_items run item replace entity @s inventory.24 with air
execute unless items entity @s inventory.25 #m_graves:kept_items run item replace entity @s inventory.25 with air
execute unless items entity @s inventory.26 #m_graves:kept_items run item replace entity @s inventory.26 with air

# Adjust stored items
data modify storage m_graves:grave_storage kept set from entity @s Inventory
execute if data storage m_graves:grave_storage kept[{Slot:0b}] run data remove storage m_graves:grave_storage Items[{Slot:0b}]
execute if data storage m_graves:grave_storage kept[{Slot:1b}] run data remove storage m_graves:grave_storage Items[{Slot:1b}]
execute if data storage m_graves:grave_storage kept[{Slot:2b}] run data remove storage m_graves:grave_storage Items[{Slot:2b}]
execute if data storage m_graves:grave_storage kept[{Slot:3b}] run data remove storage m_graves:grave_storage Items[{Slot:3b}]
execute if data storage m_graves:grave_storage kept[{Slot:4b}] run data remove storage m_graves:grave_storage Items[{Slot:4b}]
execute if data storage m_graves:grave_storage kept[{Slot:5b}] run data remove storage m_graves:grave_storage Items[{Slot:5b}]
execute if data storage m_graves:grave_storage kept[{Slot:6b}] run data remove storage m_graves:grave_storage Items[{Slot:6b}]
execute if data storage m_graves:grave_storage kept[{Slot:7b}] run data remove storage m_graves:grave_storage Items[{Slot:7b}]
execute if data storage m_graves:grave_storage kept[{Slot:8b}] run data remove storage m_graves:grave_storage Items[{Slot:8b}]
execute if data storage m_graves:grave_storage kept[{Slot:9b}] run data remove storage m_graves:grave_storage Items[{Slot:9b}]
execute if data storage m_graves:grave_storage kept[{Slot:10b}] run data remove storage m_graves:grave_storage Items[{Slot:10b}]
execute if data storage m_graves:grave_storage kept[{Slot:11b}] run data remove storage m_graves:grave_storage Items[{Slot:11b}]
execute if data storage m_graves:grave_storage kept[{Slot:12b}] run data remove storage m_graves:grave_storage Items[{Slot:12b}]
execute if data storage m_graves:grave_storage kept[{Slot:13b}] run data remove storage m_graves:grave_storage Items[{Slot:13b}]
execute if data storage m_graves:grave_storage kept[{Slot:14b}] run data remove storage m_graves:grave_storage Items[{Slot:14b}]
execute if data storage m_graves:grave_storage kept[{Slot:15b}] run data remove storage m_graves:grave_storage Items[{Slot:15b}]
execute if data storage m_graves:grave_storage kept[{Slot:16b}] run data remove storage m_graves:grave_storage Items[{Slot:16b}]
execute if data storage m_graves:grave_storage kept[{Slot:17b}] run data remove storage m_graves:grave_storage Items[{Slot:17b}]
execute if data storage m_graves:grave_storage kept[{Slot:18b}] run data remove storage m_graves:grave_storage Items[{Slot:18b}]
execute if data storage m_graves:grave_storage kept[{Slot:19b}] run data remove storage m_graves:grave_storage Items[{Slot:19b}]
execute if data storage m_graves:grave_storage kept[{Slot:20b}] run data remove storage m_graves:grave_storage Items[{Slot:20b}]
execute if data storage m_graves:grave_storage kept[{Slot:21b}] run data remove storage m_graves:grave_storage Items[{Slot:21b}]
execute if data storage m_graves:grave_storage kept[{Slot:22b}] run data remove storage m_graves:grave_storage Items[{Slot:22b}]
execute if data storage m_graves:grave_storage kept[{Slot:23b}] run data remove storage m_graves:grave_storage Items[{Slot:23b}]
execute if data storage m_graves:grave_storage kept[{Slot:24b}] run data remove storage m_graves:grave_storage Items[{Slot:24b}]
execute if data storage m_graves:grave_storage kept[{Slot:25b}] run data remove storage m_graves:grave_storage Items[{Slot:25b}]
execute if data storage m_graves:grave_storage kept[{Slot:26b}] run data remove storage m_graves:grave_storage Items[{Slot:26b}]
execute if data storage m_graves:grave_storage kept[{Slot:27b}] run data remove storage m_graves:grave_storage Items[{Slot:27b}]
execute if data storage m_graves:grave_storage kept[{Slot:28b}] run data remove storage m_graves:grave_storage Items[{Slot:28b}]
execute if data storage m_graves:grave_storage kept[{Slot:29b}] run data remove storage m_graves:grave_storage Items[{Slot:29b}]
execute if data storage m_graves:grave_storage kept[{Slot:30b}] run data remove storage m_graves:grave_storage Items[{Slot:30b}]
execute if data storage m_graves:grave_storage kept[{Slot:31b}] run data remove storage m_graves:grave_storage Items[{Slot:31b}]
execute if data storage m_graves:grave_storage kept[{Slot:32b}] run data remove storage m_graves:grave_storage Items[{Slot:32b}]
execute if data storage m_graves:grave_storage kept[{Slot:33b}] run data remove storage m_graves:grave_storage Items[{Slot:33b}]
execute if data storage m_graves:grave_storage kept[{Slot:34b}] run data remove storage m_graves:grave_storage Items[{Slot:34b}]
execute if data storage m_graves:grave_storage kept[{Slot:35b}] run data remove storage m_graves:grave_storage Items[{Slot:35b}]
execute if data storage m_graves:grave_storage kept[{Slot:-106b}] run data remove storage m_graves:grave_storage Items[{Slot:-106b}]
execute if data storage m_graves:grave_storage kept[{Slot:100b}] run data remove storage m_graves:grave_storage Items[{Slot:100b}]
execute if data storage m_graves:grave_storage kept[{Slot:101b}] run data remove storage m_graves:grave_storage Items[{Slot:101b}]
execute if data storage m_graves:grave_storage kept[{Slot:102b}] run data remove storage m_graves:grave_storage Items[{Slot:102b}]
execute if data storage m_graves:grave_storage kept[{Slot:103b}] run data remove storage m_graves:grave_storage Items[{Slot:103b}]
data remove storage m_graves:grave_storage kept
