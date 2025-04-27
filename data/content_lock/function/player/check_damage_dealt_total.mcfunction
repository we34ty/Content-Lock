scoreboard players set @s content_lock.damage_amount_for_check 0
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.check_for_damage_dealt
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_resisted
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_to_absorption

#execute if score @s content_lock.check_for_damage_dealt matches 1.. run function content_lock:player/effects/frostbite_calulate

scoreboard players set @s content_lock.check_for_damage_dealt 0
scoreboard players set @s content_lock.damage_dealt_resisted 0
scoreboard players set @s content_lock.damage_dealt_to_absorption 0
