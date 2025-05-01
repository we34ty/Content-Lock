advancement revoke @s only content_lock:checks/is_in_nether

execute if score L content_lock.options.progression.nether_damage matches 0 run return 0
execute if score L content_lock.progression matches 2.. run return 0

damage @s 3 in_fire
particle flame ~ ~1 ~ 1 1 1 0.1 20 normal @a