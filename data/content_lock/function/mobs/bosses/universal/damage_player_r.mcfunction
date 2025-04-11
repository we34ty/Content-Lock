tag @s add content_lock.attacker
$execute if entity @e[type=#boss_can_damage,tag=!content_lock.boss,distance=$(distance)] as @e[type=#boss_can_damage,tag=!content_lock.boss,distance=$(distance)] run damage @s $(damage) $(damage_type) by @e[tag=content_lock.attacker,limit=1,sort=nearest] from @e[tag=content_lock.boss,limit=1,sort=nearest]
tag @s remove content_lock.attacker