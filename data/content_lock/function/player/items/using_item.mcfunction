execute if items entity @s weapon.mainhand enchanted_book run function content_lock:player/items/spells/check_spell
#execute if items entity @s weapon.mainhand #minecraft:swords run function content_lock:player/items/block_with_sword
execute if items entity @s weapon.mainhand #minecraft:shovels run function content_lock:player/items/charge_shovel
execute if items entity @s weapon.mainhand minecraft:pink_dye run function content_lock:player/items/boss_summons/check
execute if items entity @s weapon.mainhand minecraft:yellow_dye run function content_lock:player/items/special/check
execute if items entity @s weapon.mainhand #minecraft:hoes run function content_lock:player/items/hoe_check

#function content_lock:player/passives/update_health_percentage
advancement revoke @s only content_lock:checks/using_item