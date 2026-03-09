data merge entity @s {drop_chances:{chest:0.0f,feet:0.0f,head:0.0f,legs:0.0f,mainhand:0.0f,offhand:0.0f}}
data merge entity @s {CanPickUpLoot:0b}

execute if entity @s[type=#content_lock:zombies] run function content_lock:mobs/customization/zombies
execute if entity @s[type=#content_lock:skeletons] run function content_lock:mobs/customization/skeletons
execute if entity @s[type=creeper] run function content_lock:mobs/customization/creeper
execute if entity @s[type=#content_lock:spiders] run function content_lock:mobs/customization/spider
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
execute if entity @s[type=#content_lock:rideable_healthbar] run function content_lock:mobs/customization/horse
execute if entity @s[type=iron_golem] run function content_lock:mobs/customization/iron_golem
execute if entity @s[type=#pets] run function content_lock:mobs/customization/pets
execute if entity @s[type=wandering_trader] run function content_lock:mobs/customization/wandering_trader
execute if entity @s[type=vex] run function content_lock:mobs/customization/vex
execute if entity @s[type=#content_lock:melee_hostile] run tag @s add content_lock.limited_attack_range

execute store result entity @s Health float 1 run attribute @s max_health get
attribute @s follow_range modifier add content_lock.customized_content_lock -0.2 add_multiplied_total
tag @s add content_lock.customized
