scoreboard players set @s content_lock.damage_amount_for_check 0
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.check_for_damage_dealt
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_resisted
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_resisted

scoreboard players set @s content_lock.check_for_damage_dealt 0
scoreboard players set @s content_lock.damage_dealt_resisted 0
scoreboard players set @s content_lock.damage_dealt_resisted 0
