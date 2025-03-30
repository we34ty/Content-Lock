## Clear items that should be dropped on death and adjusts 'm_graves:grave_storage' accordingly
# Clear items
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.0 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.1 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.2 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.3 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.4 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.5 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.6 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.7 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s hotbar.8 with air
execute if score $keepHotbar multipack.graves matches 0 run item replace entity @s weapon.offhand with air
execute if score $keepArmor multipack.graves matches 0 run item replace entity @s armor.head with air
execute if score $keepArmor multipack.graves matches 0 run item replace entity @s armor.chest with air
execute if score $keepArmor multipack.graves matches 0 run item replace entity @s armor.legs with air
execute if score $keepArmor multipack.graves matches 0 run item replace entity @s armor.feet with air
item replace entity @s inventory.0 with air
item replace entity @s inventory.1 with air
item replace entity @s inventory.2 with air
item replace entity @s inventory.3 with air
item replace entity @s inventory.4 with air
item replace entity @s inventory.5 with air
item replace entity @s inventory.6 with air
item replace entity @s inventory.7 with air
item replace entity @s inventory.8 with air
item replace entity @s inventory.9 with air
item replace entity @s inventory.10 with air
item replace entity @s inventory.11 with air
item replace entity @s inventory.12 with air
item replace entity @s inventory.13 with air
item replace entity @s inventory.14 with air
item replace entity @s inventory.15 with air
item replace entity @s inventory.16 with air
item replace entity @s inventory.17 with air
item replace entity @s inventory.18 with air
item replace entity @s inventory.19 with air
item replace entity @s inventory.20 with air
item replace entity @s inventory.21 with air
item replace entity @s inventory.22 with air
item replace entity @s inventory.23 with air
item replace entity @s inventory.24 with air
item replace entity @s inventory.25 with air
item replace entity @s inventory.26 with air

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
execute if data storage m_graves:grave_storage kept[{Slot:-106b}] run data remove storage m_graves:grave_storage Items[{Slot:-106b}]
execute if data storage m_graves:grave_storage kept[{Slot:100b}] run data remove storage m_graves:grave_storage Items[{Slot:100b}]
execute if data storage m_graves:grave_storage kept[{Slot:101b}] run data remove storage m_graves:grave_storage Items[{Slot:101b}]
execute if data storage m_graves:grave_storage kept[{Slot:102b}] run data remove storage m_graves:grave_storage Items[{Slot:102b}]
execute if data storage m_graves:grave_storage kept[{Slot:103b}] run data remove storage m_graves:grave_storage Items[{Slot:103b}]
data remove storage m_graves:grave_storage kept
