execute at @s if entity @e[type=minecraft:villager,tag=content_lock.leveler,limit=1,sort=nearest,distance=0..6] if items entity @s weapon.mainhand #content_lock:enchantable/weapon run function content_lock:player/modify_villager_weapon
execute at @s if entity @e[type=minecraft:villager,tag=content_lock.leveler,limit=1,sort=nearest,distance=0..6] if items entity @s weapon.mainhand #content_lock:enchantable/armor run function content_lock:player/modify_villager_armor

scoreboard players set @s content_lock.spoken_with_villager 0