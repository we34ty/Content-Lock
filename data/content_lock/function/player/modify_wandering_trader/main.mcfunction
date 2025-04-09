execute if items entity @s weapon.mainhand #content_lock:enchantable/weapon run function content_lock:player/modify_wandering_trader/weapon_level
execute if items entity @s weapon.mainhand #content_lock:enchantable/armor run function content_lock:player/modify_wandering_trader/armor_level

execute at @s if entity @e[type=wandering_trader,limit=1,sort=nearest] as @e[type=wandering_trader,limit=1,sort=nearest] unless entity @s[tag=content_lock.randomised_trades] run function content_lock:player/modify_wandering_trader/randomise_trades