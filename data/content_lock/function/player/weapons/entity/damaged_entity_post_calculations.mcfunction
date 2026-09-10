
scoreboard players set @s content_lock.check_for_damage_dealt 0
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(physical_damage)}
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(fire_damage)}
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(frost_damage)}
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(magic_damage)}
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(wither_damage)}
$function content_lock:player/weapons/entity/store_damage_as_scoreboard {value: $(ender_damage)}

scoreboard players operation @s content_lock.enchantment.bonus.armor.leather.health_to_recover -= @s content_lock.check_for_damage_dealt
execute if score @s content_lock.enchantment.bonus.armor.leather.rally_timer matches 1.. if score @s content_lock.enchantment.bonus.armor.leather.health_to_recover matches ..0 run function content_lock:player/enchantments/bonuses/armor/leather/rally

execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 1.. run scoreboard players operation @s content_lock.enchantment.bonus.armor.copper.charges += @s content_lock.check_for_damage_dealt

execute if score @s content_lock.enchantment.bonus.armor.diamond.stacks matches 1.. run function content_lock:player/enchantments/bonuses/armor/diamond/remove_buff