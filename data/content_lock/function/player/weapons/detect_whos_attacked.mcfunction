tag @a remove content_lock.weapons.attacker
execute on attacker if entity @s[tag=content_lock.weapons.attacking] run tag @s add content_lock.weapons.attacker
execute unless entity @r[tag=content_lock.weapons.attacker] run return 0
execute unless entity @s[nbt=!{HurtTime:0s}] run return 0

execute at @s run function content_lock:player/weapons/entity/calculate_resistances with storage content_lock:weapon_stats data