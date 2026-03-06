advancement revoke @s only content_lock:checks/changed_equipment

##Makes sure this isn't called multiple times in a single tick to prevent lag
execute if score @s content_lock.timerCheck = L content_lock.timer1 run return 0
execute store result score @s content_lock.can_player_run run attribute @s movement_efficiency get 100

##Functions which go through the player's inventory and change specific item's attributes
function content_lock:player/passives/modify_inventory/turn_potions_stackable
function content_lock:player/passives/modify_inventory/turn_milk_stackable
#function content_lock:player/passives/modify_inventory/turn_food_less_nutricious
function content_lock:player/passives/modify_inventory/turn_soup_stackable

scoreboard players operation @s content_lock.timerCheck = L content_lock.timer1

#execute if score @s content_lock.xp_bottle_used matches 1.. run xp add @s 5 points
#execute if score @s content_lock.xp_bottle_used matches 1.. run scoreboard players remove @s content_lock.xp_bottle_used 1

##Calculates maximum amount of player stamina
function content_lock:player/passives/set_max_stamina