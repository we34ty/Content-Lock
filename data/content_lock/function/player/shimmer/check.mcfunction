execute if entity @s[tag=content_lock.checked_for_shimmer] run return 0
tag @s add content_lock.checked_for_shimmer

execute if entity @s[nbt={Item:{id:"minecraft:water_bucket"}}] run return run function content_lock:player/shimmer/generic {item:"water_bucket",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:enchanted_book"}}] run return run function content_lock:player/shimmer/enchanted_book
#execute if entity @s[nbt={Item:{id:"minecraft:compass"}}] run return run function content_lock:player/shimmer/generic {item:"recovery_compass",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:fermented_spider_eye"}}] run return run function content_lock:player/shimmer/generic {item:"spider_eye",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:wind_charge"}}] run return run function content_lock:player/shimmer/generic {item:"fire_charge",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:fire_charge"}}] run return run function content_lock:player/shimmer/generic {item:"wind_charge",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:sweet_berries"}}] run return run function content_lock:player/shimmer/generic {item:"glow_berries",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:glow_berries"}}] run return run function content_lock:player/shimmer/generic {item:"sweet_berries",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:cod"}}] run return run function content_lock:player/shimmer/generic {item:"salmon",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:salmon"}}] run return run function content_lock:player/shimmer/generic {item:"tropical_fish",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:tropical_fish"}}] run return run function content_lock:player/shimmer/generic {item:"cod",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:carrot"}}] run return run function content_lock:player/shimmer/generic {item:"beetroot_seeds",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:beetroot_seeds"}}] run return run function content_lock:player/shimmer/generic {item:"potato",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:potato"}}] run return run function content_lock:player/shimmer/generic {item:"carrot",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:turtle_scute"}}] run return run function content_lock:player/shimmer/generic {item:"armadillo_scute",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:armadillo_scute"}}] run return run function content_lock:player/shimmer/generic {item:"turtle_scute",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:netherite_upgrade_smithing_template"}}] run return run function content_lock:player/shimmer/generic {item:"snout_armor_trim_smithing_template",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:snout_armor_trim_smithing_template"}}] run return run function content_lock:player/shimmer/generic {item:"wild_armor_trim_smithing_template",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:oak_log"}}] run return run function content_lock:player/shimmer/generic {item:"birch_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:birch_log"}}] run return run function content_lock:player/shimmer/generic {item:"spruce_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:spruce_log"}}] run return run function content_lock:player/shimmer/generic {item:"jungle_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:jungle_log"}}] run return run function content_lock:player/shimmer/generic {item:"acacia_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:acacia_log"}}] run return run function content_lock:player/shimmer/generic {item:"dark_oak_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:dark_oak_log"}}] run return run function content_lock:player/shimmer/generic {item:"mangrove_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:mangrove_log"}}] run return run function content_lock:player/shimmer/generic {item:"cherry_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:cherry_log"}}] run return run function content_lock:player/shimmer/generic {item:"pale_oak_log",count:1}
execute if entity @s[nbt={Item:{id:"minecraft:pale_oak_log"}}] run return run function content_lock:player/shimmer/generic {item:"oak_log",count:1}

execute if entity @s[nbt={Item:{id:"minecraft:netherite_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:netherite_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table

execute if entity @s[nbt={Item:{id:"minecraft:diamond_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:diamond_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table

execute if entity @s[nbt={Item:{id:"minecraft:iron_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:iron_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table

execute if entity @s[nbt={Item:{id:"minecraft:golden_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:golden_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table

execute if entity @s[nbt={Item:{id:"minecraft:stone_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:stone_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:stone_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:stone_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:stone_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:chainmail_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:chainmail_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:chainmail_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:chainmail_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:stone_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table

execute if entity @s[nbt={Item:{id:"minecraft:copper_axe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_pickaxe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_shovel"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_hoe"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_sword"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_helmet"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_chestplate"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_leggings"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_boots"}}] run return run function content_lock:player/shimmer/transmute_loot_table
execute if entity @s[nbt={Item:{id:"minecraft:copper_spear"}}] run return run function content_lock:player/shimmer/transmute_loot_table