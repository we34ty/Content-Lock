execute if entity @s[type=#zombies] run function content_lock:mobs/customization/zombies
execute if entity @s[type=#skeletons] run function content_lock:mobs/customization/skeletons
execute if entity @s[type=creeper] run function content_lock:mobs/customization/creeper
execute if entity @s[type=spider] run function content_lock:mobs/customization/spider
execute if entity @s[type=cave_spider] run function content_lock:mobs/customization/spider
execute if entity @s[type=enderman] run function content_lock:mobs/customization/enderman
execute if entity @s[type=witch] run function content_lock:mobs/customization/witch
execute if entity @s[type=creaking] run function content_lock:mobs/customization/creaking
execute if entity @s[type=phantom] run function content_lock:mobs/customization/phantom
execute if entity @s[type=slime] run function content_lock:mobs/customization/slime
execute if entity @s[type=magma_cube] run function content_lock:mobs/customization/slime
execute if entity @s[type=piglin] run function content_lock:mobs/customization/piglin
execute if entity @s[type=piglin_brute] run function content_lock:mobs/customization/piglin
execute if entity @s[type=blaze] run function content_lock:mobs/customization/blaze
execute if entity @s[type=silverfish] run function content_lock:mobs/customization/silverfish
execute if entity @s[type=bat] run function content_lock:mobs/customization/bat



attribute @s follow_range modifier add content_lock.customized_content_lock 1 add_multiplied_total
tag @s add content_lock.customized
