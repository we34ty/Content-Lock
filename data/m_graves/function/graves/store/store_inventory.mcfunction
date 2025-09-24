## Clear and store this player's inventory and xp
#clear @s *[enchantments~[{"enchantments":"vanishing_curse"}]]
execute if score $loseItems multipack.graves matches 1 run clear @s #m_graves:lost_items

data modify storage m_graves:grave_storage Items set from entity @s Inventory
execute if score $keepItems multipack.graves matches 0 run function m_graves:graves/store/clear_items
execute if score $keepItems multipack.graves matches 1 run function m_graves:graves/store/keep_items
#execute if score $keepXp multipack.graves matches 0 run function m_graves:graves/store/experience
#execute if score $keepXp multipack.graves matches 1 run data modify storage m_graves:grave_storage Xp set value 0
