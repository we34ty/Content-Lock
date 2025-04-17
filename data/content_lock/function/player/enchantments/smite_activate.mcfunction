particle enchanted_hit ~ ~1 ~ 0.2 0.2 0.2 1 20 normal @a
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0.7
return run damage @s 1000 player_attack by @e[tag=content_lock.attacker,limit=1,sort=nearest]