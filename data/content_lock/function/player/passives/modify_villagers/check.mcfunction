execute if entity @s[nbt={VillagerData:{profession:"minecraft:none"}}] run return 0
execute if entity @s[nbt={VillagerData:{profession:"minecraft:armorer"}}] run return run function content_lock:player/passives/modify_villagers/armorer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:butcher"}}] run return run function content_lock:player/passives/modify_villagers/butcher
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cartographer"}}] run return run function content_lock:player/passives/modify_villagers/cartographer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cleric"}}] run return run function content_lock:player/passives/modify_villagers/cleric
execute if entity @s[nbt={VillagerData:{profession:"minecraft:farmer"}}] run return run function content_lock:player/passives/modify_villagers/farmer
