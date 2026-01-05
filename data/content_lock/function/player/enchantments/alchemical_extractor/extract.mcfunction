execute if entity @s[tag=content_lock.alchemical_extractor.used_already] run return 0

execute if entity @s[type=spider] run summon item ~ ~ ~ {Item:{id:"minecraft:spider_eye"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=rabbit] run summon item ~ ~ ~ {Item:{id:"minecraft:rabbit_foot"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=blaze] run summon item ~ ~ ~ {Item:{id:"minecraft:blaze_rod"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=ghast] run summon item ~ ~ ~ {Item:{id:"minecraft:ghast_tear",count:2},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=magma_cube] run summon item ~ ~ ~ {Item:{id:"minecraft:magma_cream"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=pufferfish] run summon item ~ ~ ~ {Item:{id:"minecraft:pufferfish"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=turtle] run summon item ~ ~ ~ {Item:{id:"minecraft:turtle_scute"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=phantom] run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=breeze] run summon item ~ ~ ~ {Item:{id:"minecraft:breeze_rod"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=slime] run summon item ~ ~ ~ {Item:{id:"minecraft:slime_ball"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=creeper] run summon item ~ ~ ~ {Item:{id:"minecraft:gunpowder"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombie,tag=content_lock.living_armor_sounds] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ingot"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=wither_skeleton] if predicate content_lock:random if predicate content_lock:three_random run summon item ~ ~ ~ {Item:{id:"minecraft:wither_skeleton_skull"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=creeper] run summon item ~ ~ ~ {Item:{id:"minecraft:gunpowder"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=chicken] run summon item ~ ~ ~ {Item:{id:"minecraft:feather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=cow] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=camel] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=donkey] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=mule] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=horse] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=parrot] run summon item ~ ~ ~ {Item:{id:"minecraft:feather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=armadillo] run summon item ~ ~ ~ {Item:{id:"minecraft:armadillo_scute"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=llama] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=horse] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=cod] run summon item ~ ~ ~ {Item:{id:"minecraft:bone_meal"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=salmon] run summon item ~ ~ ~ {Item:{id:"minecraft:bone_meal"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=tropical_fish] run summon item ~ ~ ~ {Item:{id:"minecraft:bone_meal"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=dolphin] run summon item ~ ~ ~ {Item:{id:"minecraft:cod"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=mooshroom] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",count: 2},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=cod] run summon item ~ ~ ~ {Item:{id:"minecraft:bone_meal"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=copper_golem] run summon item ~ ~ ~ {Item:{id:"minecraft:copper_ingot"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=iron_golem] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ingot"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=snow_golem] run summon item ~ ~ ~ {Item:{id:"minecraft:snowball"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=trader_llama] run summon item ~ ~ ~ {Item:{id:"minecraft:bone_meal"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=villager] if predicate content_lock:three_random run summon item ~ ~ ~ {Item:{id:"minecraft:emerald"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=wandering_trader] if predicate content_lock:random run summon item ~ ~ ~ {Item:{id:"minecraft:emerald"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=bogged] run summon item ~ ~ ~ {Item:{id:"minecraft:brown_mushroom"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=camel_husk] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=skeleton] run summon item ~ ~ ~ {Item:{id:"minecraft:bone"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=skeleton_horse] run summon item ~ ~ ~ {Item:{id:"minecraft:bone"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombie] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombie_horse] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombie_villager] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombie_villager] if predicate content_lock:random run summon item ~ ~ ~ {Item:{id:"minecraft:emerald"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=cave_spider] run summon item ~ ~ ~ {Item:{id:"minecraft:spider_eye"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=witch] run summon item ~ ~ ~ {Item:{id:"minecraft:nether_wart"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=hoglin] run summon item ~ ~ ~ {Item:{id:"minecraft:leather"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=strider] run summon item ~ ~ ~ {Item:{id:"minecraft:string"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zoglin] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=zombified_piglin] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=shulker] run summon item ~ ~ ~ {Item:{id:"minecraft:shulker_shell"},Motion:[0.0,0.4,0.0]}
execute if entity @s[type=enderman] if predicate content_lock:three_random run summon item ~ ~ ~ {Item:{id:"minecraft:ender_pearl"},Motion:[0.0,0.4,0.0]}



execute on attacker run advancement grant @s only content_lock:progression/use_alchemical_extractor
tag @s add content_lock.alchemical_extractor.used_already