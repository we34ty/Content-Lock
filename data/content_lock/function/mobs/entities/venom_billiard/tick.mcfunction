execute unless entity @e[type=area_effect_cloud,tag=content_lock.venom_billiard_ball,distance=0..1] run kill @s

tag @e remove content_lock.attacker
execute on attacker run tag @s add content_lock.attacker
execute if entity @r[tag=content_lock.attacker] run function content_lock:mobs/entities/venom_billiard/hit
#particle scrape ~ ~ ~ 0.1 0.1 0.1 0.1 2 normal @a