advancement revoke @s only content_lock:checks/using_item
execute if score @s content_lock.time_since_death matches 0 run return 0

execute if items entity @s weapon.mainhand *[enchantments~[{"enchantments":"content_lock:spell"}]] run function content_lock:player/items/spells/check_spell
#execute if items entity @s weapon.mainhand #minecraft:swords run function content_lock:player/items/block_with_sword
execute if items entity @s weapon.mainhand *[enchantments~[{"enchantments":"content_lock:guardian_shovel"}]] run function content_lock:player/items/charge_shovel
execute if items entity @s weapon.* minecraft:pink_dye run function content_lock:player/items/boss_summons/check
execute if items entity @s weapon.* minecraft:yellow_dye run function content_lock:player/items/special/check
execute if items entity @s weapon.mainhand #minecraft:hoes run function content_lock:player/items/hoe_check
execute if items entity @s weapon.mainhand *[enchantments~[{"enchantments":"content_lock:mays_anchor"}]] at @s run function content_lock:player/items/custom_weapons/tatsugeki/check
execute if items entity @s weapon.mainhand *[enchantments~[{"enchantments":"content_lock:quickstep_dagger"}]] at @s run function content_lock:player/items/custom_weapons/quickstep_dagger/check
execute if items entity @s weapon.mainhand bow run function content_lock:player/items/bow
execute if items entity @s weapon.mainhand minecraft:netherite_pickaxe[custom_data~{"content_lock.silver_tape":true}] run function content_lock:player/items/silver_tape

#execute if items entity @s weapon.offhand *[custom_data~{"content_lock:mays_anchor":true}] at @s run function content_lock:player/items/custom_weapons/tatsugeki/check

#function content_lock:player/passives/update_health_percentage
