execute if entity @s[nbt={active_effects:[{"id":"minecraft:invisibility"}]}] run function content_lock:player/enchantments/bonuses/armor/quartz/invisible

execute unless score @s content_lock.fight_time matches 1.. run scoreboard players add @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer 1
execute if score @s content_lock.fight_time matches 1.. run scoreboard players set @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer 0

execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 1 if score @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer matches 600.. run function content_lock:player/enchantments/bonuses/armor/quartz/out_of_combat {timer: 200}
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 2 if score @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer matches 400.. run function content_lock:player/enchantments/bonuses/armor/quartz/out_of_combat {timer: 160}
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 3 if score @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer matches 300.. run function content_lock:player/enchantments/bonuses/armor/quartz/out_of_combat {timer: 120}
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 4 if score @s content_lock.enchantment.bonus.armor.quartz.out_combat_timer matches 200.. run function content_lock:player/enchantments/bonuses/armor/quartz/out_of_combat {timer: 100}

execute if score @s content_lock.health_percentage matches 99.. run scoreboard players add @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer 1
execute unless score @s content_lock.health_percentage matches 99.. run scoreboard players set @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer 0

execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 1 if score @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer matches 300.. run function content_lock:player/enchantments/bonuses/armor/quartz/overshield
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 2 if score @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer matches 240.. run function content_lock:player/enchantments/bonuses/armor/quartz/overshield
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 3 if score @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer matches 200.. run function content_lock:player/enchantments/bonuses/armor/quartz/overshield
execute if score @s content_lock.enchantment.bonus.armor.quartz.pieces matches 4 if score @s content_lock.enchantment.bonus.armor.quartz.full_hp_timer matches 160.. run function content_lock:player/enchantments/bonuses/armor/quartz/overshield

execute if score @s content_lock.enchantment.bonus.armor.quartz.ender_pearl matches 1.. run effect give @s invisibility 20 0

scoreboard players set @s content_lock.enchantment.bonus.armor.quartz.pieces 0